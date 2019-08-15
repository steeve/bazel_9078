load(
    "@bazel_tools//tools/cpp:toolchain_utils.bzl",
    "find_cpp_toolchain",
)

def _test_cpp_impl(ctx):
    cc_toolchain = find_cpp_toolchain(ctx)
    print("cpu =", cc_toolchain.cpu)
    print("target_gnu_system_name =", cc_toolchain.target_gnu_system_name)
    print()
    print(cc_toolchain)
    return []

test_cpp = rule(
    implementation = _test_cpp_impl,
    attrs = {
        "_cc_toolchain": attr.label(default = "@bazel_tools//tools/cpp:current_cc_toolchain"),
    },
    toolchains = ["@bazel_tools//tools/cpp:toolchain_type"],
    fragments = ["cpp"],
)
