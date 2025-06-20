Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF78283FCA
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 09:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750412263; cv=none; b=kaXxmbCj2sXVcRM55HnebztoFmYUahj5bGqgms8oQMp2827t7M+J5Y6d35lJUILe6+V/eft4d5bPikbnG72CeiyA89l+pw+QHl4F/uxepVkYJnR8QRInIRlGfFn4MgUiTLxnAOQZoZFBfYcTWdFtdf6muiCLkQUmgv9wxbZ+bIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750412263; c=relaxed/simple;
	bh=JQ2fjdVL3jnJdsJB3+U6Hbnf7eC6Z0YLMKgzJ5Queyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iKDZcPUA6s9PdrMSLvxBNBomPSVGt70XvYDLgBiox/HEoeIk+ZbSFPlv3xLRiruqsOqLT/XpuDYRJCFaD8ZTfJelBSJp48YwejiC7tW8rWerpeCetH5MyEGvSKXVQPtGGtNGSSbUpfqrxqtNmJfdK54jInaCePHTxMCKQqhpOiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qV+V5oG8; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qV+V5oG8"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6fb0a05b56cso34752366d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 02:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750412259; x=1751017059; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W41zjobLRDpI6OA48bLUEmn8dDajBRAxI5CZjqkc5YQ=;
        b=qV+V5oG8jHKdTGtGldRdPsmNWAYCoqoEaUwkDj32WbozwICDsxkESD02VUSZVYOEsm
         ZDuQ8o67k509Ol4Bf5Ahy7adS+CQUfnZD2hUMF6XwV++l5fBrckG3q/7ryNcFdRXTaSI
         ue9jS0iqi+jSB14sCw6WBQSFI9hGVbGZPxMskKBY4vPJhrl4+ajxf3yR/F2TLzGmMO5c
         FROi3ldxhWVH1xNKGZHgEpjIWsIYdxIQZ8E49SEtLGNT+WYuJ2lvRauhJnsHPY4nCDnP
         qNa8tfXGmq41pR2QNzHw1mA/UBmuPbWLbyws4dL7IcPYX0Xo4/49OzcczWlGqtNU966N
         SeLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750412259; x=1751017059;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W41zjobLRDpI6OA48bLUEmn8dDajBRAxI5CZjqkc5YQ=;
        b=ITUAwYQdEE1ZC81M3t5d5kjcG0kQ6ntHXTh8E2fU+fhdMsWy/vvBsH0Hp15C/Udxhx
         B2/zTE9OjmxvjvjIbeb6p13hG0etF56gpE1uWEmj/drIp9TcYb5Z5Qi9lD2bSip/PUY5
         V9KnfZXIOzR2yq1uDBHfwI+kDpEtYo7tVueLXt4azgwNQ7r3x6EEe4lcE1WeG39DNTGI
         YYrpoeOp+REYc7D2k9EBD4mNIPLQFEb74tEdbvsqW3xnJWHwh0uTvpQ6DpwKRWh9FNyb
         IdUWbFpilqYWi96Adxpe+pwEFF4+sQ5IUz+YVP4RW3WSH4zdLfXzw6iII0eetL9C3kir
         j8xg==
X-Forwarded-Encrypted: i=1; AJvYcCUCfvZ5Uc3IjJWZbQnIsQzuCbdt/ZbLoZhbo0mOIpB1xUjQdR2ykwDve0Yr7Jhfj7wPFuvO1vih3xj65ps=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmUIa+p7hgaZo73TMhdGq69JLSnuSwdg82//QG4Jg0by1r9XNd
	udjL+FDQUCLKkEa6DN93u/89q+nd2LYKSkoBk1xjgMdT7brGm+fPkh3MF0MH1d29ZeGGj5oKRee
	+EBTQ5M+BOW3OrKotQIx4XKqmDU4+kyPANIXLBQdU
X-Gm-Gg: ASbGnctgbHqn51180PK0LUcIxPCJ4yYvDouWQPg3EBR4/nADRI/Qkhtcj2TwjPCIsKG
	MopAbHCaONWVVFs0DBwOJKxQGkdhhiDy0LgcyhgHWoMmHqnVvCgdXeobapEJvtj7VFHgHAff6jD
	YnmNZ8LmEr2n5TnJm+GSZq5EuV9ZloEePUu7YESDEhXbVmm8ZbxPjw010+/CUtVg8IBa9extGe8
	VJpNQ==
X-Google-Smtp-Source: AGHT+IErJ+/IXvkNnmleNXee0uB9y1ieMYz+cxmjWnlEKMqOuBGTR5sDOb9IWM/kUNvAZoqG36Mzii4wmQOUVHjs+rY=
X-Received: by 2002:a05:6214:194f:b0:6fa:ccff:352a with SMTP id
 6a1803df08f44-6fd0a5714cdmr30186986d6.37.1750412258699; Fri, 20 Jun 2025
 02:37:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de>
In-Reply-To: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de>
From: David Gow <davidgow@google.com>
Date: Fri, 20 Jun 2025 17:37:24 +0800
X-Gm-Features: Ac12FXx28olkUyVElK3tsWSDMtkeXemtFUwtYOQJLlznDr2PS8RYZiAf4PgYcC4
Message-ID: <CABVgOSn+530YJ3OPNJQncLDQNbd9JEDtZ04Amyyxk57jOVYUyQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/16] kunit: Introduce UAPI testing framework
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <rmoar@google.com>, 
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	workflows@vger.kernel.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000f219100637fd9c4f"

--000000000000f219100637fd9c4f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 11 Jun 2025 at 15:38, Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> Currently testing of userspace and in-kernel API use two different
> frameworks. kselftests for the userspace ones and Kunit for the
> in-kernel ones. Besides their different scopes, both have different
> strengths and limitations:
>
> Kunit:
> * Tests are normal kernel code.
> * They use the regular kernel toolchain.
> * They can be packaged and distributed as modules conveniently.
>
> Kselftests:
> * Tests are normal userspace code
> * They need a userspace toolchain.
>   A kernel cross toolchain is likely not enough.
> * A fair amout of userland is required to run the tests,
>   which means a full distro or handcrafted rootfs.
> * There is no way to conveniently package and run kselftests with a
>   given kernel image.
> * The kselftests makefiles are not as powerful as regular kbuild.
>   For example they are missing proper header dependency tracking or more
>   complex compiler option modifications.
>
> Therefore kunit is much easier to run against different kernel
> configurations and architectures.
> This series aims to combine kselftests and kunit, avoiding both their
> limitations. It works by compiling the userspace kselftests as part of
> the regular kernel build, embedding them into the kunit kernel or module
> and executing them from there. If the kernel toolchain is not fit to
> produce userspace because of a missing libc, the kernel's own nolibc can
> be used instead.
> The structured TAP output from the kselftest is integrated into the
> kunit KTAP output transparently, the kunit parser can parse the combined
> logs together.
>
> Further room for improvements:
> * Call each test in its completely dedicated namespace
> * Handle additional test files besides the test executable through
>   archives. CPIO, cramfs, etc.
> * Compatibility with kselftest_harness.h (in progress)
> * Expose the blobs in debugfs
> * Provide some convience wrappers around compat userprogs
> * Figure out a migration path/coexistence solution for
>   kunit UAPI and tools/testing/selftests/
>
> Output from the kunit example testcase, note the output of
> "example_uapi_tests".
>
> $ ./tools/testing/kunit/kunit.py run --kunitconfig lib/kunit example
> ...
> Running tests with:
> $ .kunit/linux kunit.filter_glob=3Dexample kunit.enable=3D1 mem=3D1G cons=
ole=3Dtty kunit_shutdown=3Dhalt
> [11:53:53] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D example=
 (10 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:53:53] [PASSED] example_simple_test
> [11:53:53] [SKIPPED] example_skip_test
> [11:53:53] [SKIPPED] example_mark_skipped_test
> [11:53:53] [PASSED] example_all_expect_macros_test
> [11:53:53] [PASSED] example_static_stub_test
> [11:53:53] [PASSED] example_static_stub_using_fn_ptr_test
> [11:53:53] [PASSED] example_priv_test
> [11:53:53] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D exam=
ple_params_test  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:53:53] [SKIPPED] example value 3
> [11:53:53] [PASSED] example value 2
> [11:53:53] [PASSED] example value 1
> [11:53:53] [SKIPPED] example value 0
> [11:53:53] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] example=
_params_test =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:53:53] [PASSED] example_slow_test
> [11:53:53] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D (4 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> [11:53:53] [PASSED] procfs
> [11:53:53] [PASSED] userspace test 2
> [11:53:53] [SKIPPED] userspace test 3: some reason
> [11:53:53] [PASSED] userspace test 4
> [11:53:53] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] exam=
ple_uapi_test =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:53:53] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D [PASSED] example =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> [11:53:53] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:53:53] Testing complete. Ran 16 tests: passed: 11, skipped: 5
> [11:53:53] Elapsed time: 67.543s total, 1.823s configuring, 65.655s build=
ing, 0.058s running
>
> Based on v6.15-rc1.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> ---
> Changes in v3:
> - Reintroduce CONFIG_CC_CAN_LINK_STATIC
> - Enable CONFIG_ARCH_HAS_NOLIBC for m68k and SPARC
> - Properly handle 'clean' target for userprogs
> - Use ramfs over tmpfs to reduce dependencies
> - Inherit userprogs byte order and ABI from kernel
> - Drop now unnecessary "#ifndef NOLIBC"
> - Pick up review tags
> - Drop usage of __private in blob.h,
>   sparse complains and it is not really necessary
> - Fix execution on loongarch when using clang
> - Drop userprogs libgcc handling, it was ugly and is not yet necessary
> - Link to v2: https://lore.kernel.org/r/20250407-kunit-kselftests-v2-0-45=
4114e287fd@linutronix.de
>
> Changes in v2:
> - Rebase onto v6.15-rc1
> - Add documentation and kernel docs
> - Resolve invalid kconfig breakages
> - Drop already applied patch "kbuild: implement CONFIG_HEADERS_INSTALL fo=
r Usermode Linux"
> - Drop userprogs CONFIG_WERROR integration, it doesn't need to be part of=
 this series
> - Replace patch prefix "kconfig" with "kbuild"
> - Rename kunit_uapi_run_executable() to kunit_uapi_run_kselftest()
> - Generate private, conflict-free symbols in the blob framework
> - Handle kselftest exit codes
> - Handle SIGABRT
> - Forward output also to kunit debugfs log
> - Install a fd=3D0 stdin filedescriptor
> - Link to v1: https://lore.kernel.org/r/20250217-kunit-kselftests-v1-0-42=
b4524c3b0a@linutronix.de
>
> ---


Thanks very much for persisting with this, and sorry for the delayed respon=
se.

I've taken quite a liking to it: it'd definitely have made my life
easier more than once.

As a more general wrapping of selftests in KUnit tests, I do think
that there's still some risk of confusion as to when a KUnit UAPI test
makes sense versus a simple selftest. The UAPI tests are definitely
(IMO) easier to build and run, but won't be easier to debug, or to run
on an existing, non-test system as a part of troubleshooting (which
has been a complaint when selftests have been ported to KUnit in the
past).

Nevertheless, I'm pretty happy to have this be a part of KUnit, though
I have three slight reservations:
1. There's no real _user_ of this yet -- save for the small test of
/proc/self/comm in the example -- I'd like to see a real-world test
using this.
2. There's a fair bit of complexity here, and we're already a bit
behind with KUnit reviews. I'd love it if you could commit to helping
maintain the KUnit parts of this in MAINTAINERS.
3. We need to make sure that there's a clear understanding of when to
use this, versus in-kernel KUnit tests, versus kselftest. This'll
probably involve (a) making sure Shuah is on board -- or at least not
strongly opposed, and (b) updating
Documentation/dev-tools/testing-overview.rst.

But thanks very much -- it's working well in my testing here, and
running the tests is very pleasant.

Cheers,
-- David


> Thomas Wei=C3=9Fschuh (16):
>       kbuild: userprogs: avoid duplicating of flags inherited from kernel
>       kbuild: userprogs: also inherit byte order and ABI from kernel
>       init: re-add CONFIG_CC_CAN_LINK_STATIC
>       kbuild: userprogs: add nolibc support
>       kbuild: introduce CONFIG_ARCH_HAS_NOLIBC
>       kbuild: doc: add label for userprogs section
>       kbuild: introduce blob framework
>       kunit: tool: Add test for nested test result reporting
>       kunit: tool: Don't overwrite test status based on subtest counts
>       kunit: tool: Parse skipped tests from kselftest.h
>       kunit: Always descend into kunit directory during build
>       kunit: qemu_configs: loongarch: Enable LSX/LSAX
>       kunit: Introduce UAPI testing framework
>       kunit: uapi: Add example for UAPI tests
>       kunit: uapi: Introduce preinit executable
>       kunit: uapi: Validate usability of /proc
>
>  Documentation/dev-tools/kunit/api/index.rst        |   5 +
>  Documentation/dev-tools/kunit/api/uapi.rst         |  12 +
>  Documentation/kbuild/makefiles.rst                 |  38 ++-
>  MAINTAINERS                                        |   2 +
>  Makefile                                           |   7 +-
>  include/kunit/uapi.h                               |  24 ++
>  include/linux/blob.h                               |  31 +++
>  init/Kconfig                                       |   7 +
>  lib/Makefile                                       |   4 -
>  lib/kunit/Kconfig                                  |  10 +
>  lib/kunit/Makefile                                 |  20 +-
>  lib/kunit/kunit-example-test.c                     |  15 ++
>  lib/kunit/kunit-example-uapi.c                     |  54 ++++
>  lib/kunit/uapi-preinit.c                           |  63 +++++
>  lib/kunit/uapi.c                                   | 294 +++++++++++++++=
++++++
>  scripts/Makefile.blobs                             |  19 ++
>  scripts/Makefile.build                             |   6 +
>  scripts/Makefile.clean                             |   2 +-
>  scripts/Makefile.userprogs                         |  13 +-
>  scripts/blob-wrap.c                                |  27 ++
>  tools/include/nolibc/Kconfig.nolibc                |  15 ++
>  tools/testing/kunit/kunit_parser.py                |  13 +-
>  tools/testing/kunit/kunit_tool_test.py             |   9 +
>  tools/testing/kunit/qemu_configs/loongarch.py      |   2 +
>  .../test_is_test_passed-failure-nested.log         |  10 +
>  .../test_data/test_is_test_passed-kselftest.log    |   3 +-
>  26 files changed, 686 insertions(+), 19 deletions(-)
> ---
> base-commit: f07a3558c4a5d76f3fea004075e5151c4516d055
> change-id: 20241015-kunit-kselftests-56273bc40442
>
> Best regards,
> --
> Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
>

--000000000000f219100637fd9c4f
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIUnQYJKoZIhvcNAQcCoIIUjjCCFIoCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghIEMIIGkTCCBHmgAwIBAgIQfofDAVIq0iZG5Ok+mZCT2TANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNDdaFw0zMjA0MTkwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFI2IFNNSU1FIENBIDIwMjMwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDYydcdmKyg
4IBqVjT4XMf6SR2Ix+1ChW2efX6LpapgGIl63csmTdJQw8EcbwU9C691spkltzTASK2Ayi4aeosB
mk63SPrdVjJNNTkSbTowej3xVVGnYwAjZ6/qcrIgRUNtd/mbtG7j9W80JoP6o2Szu6/mdjb/yxRM
KaCDlloE9vID2jSNB5qOGkKKvN0x6I5e/B1Y6tidYDHemkW4Qv9mfE3xtDAoe5ygUvKA4KHQTOIy
VQEFpd/ZAu1yvrEeA/egkcmdJs6o47sxfo9p/fGNsLm/TOOZg5aj5RHJbZlc0zQ3yZt1wh+NEe3x
ewU5ZoFnETCjjTKz16eJ5RE21EmnCtLb3kU1s+t/L0RUU3XUAzMeBVYBEsEmNnbo1UiiuwUZBWiJ
vMBxd9LeIodDzz3ULIN5Q84oYBOeWGI2ILvplRe9Fx/WBjHhl9rJgAXs2h9dAMVeEYIYkvW+9mpt
BIU9cXUiO0bky1lumSRRg11fOgRzIJQsphStaOq5OPTb3pBiNpwWvYpvv5kCG2X58GfdR8SWA+fm
OLXHcb5lRljrS4rT9MROG/QkZgNtoFLBo/r7qANrtlyAwPx5zPsQSwG9r8SFdgMTHnA2eWCZPOmN
1Tt4xU4v9mQIHNqQBuNJLjlxvalUOdTRgw21OJAFt6Ncx5j/20Qw9FECnP+B3EPVmQIDAQABo4IB
ZTCCAWEwDgYDVR0PAQH/BAQDAgGGMDMGA1UdJQQsMCoGCCsGAQUFBwMCBggrBgEFBQcDBAYJKwYB
BAGCNxUGBgkrBgEEAYI3FQUwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUM7q+o9Q5TSoZ
18hmkmiB/cHGycYwHwYDVR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwewYIKwYBBQUHAQEE
bzBtMC4GCCsGAQUFBzABhiJodHRwOi8vb2NzcDIuZ2xvYmFsc2lnbi5jb20vcm9vdHI2MDsGCCsG
AQUFBzAChi9odHRwOi8vc2VjdXJlLmdsb2JhbHNpZ24uY29tL2NhY2VydC9yb290LXI2LmNydDA2
BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL3Jvb3QtcjYuY3JsMBEG
A1UdIAQKMAgwBgYEVR0gADANBgkqhkiG9w0BAQwFAAOCAgEAVc4mpSLg9A6QpSq1JNO6tURZ4rBI
MkwhqdLrEsKs8z40RyxMURo+B2ZljZmFLcEVxyNt7zwpZ2IDfk4URESmfDTiy95jf856Hcwzdxfy
jdwx0k7n4/0WK9ElybN4J95sgeGRcqd4pji6171bREVt0UlHrIRkftIMFK1bzU0dgpgLMu+ykJSE
0Bog41D9T6Swl2RTuKYYO4UAl9nSjWN6CVP8rZQotJv8Kl2llpe83n6ULzNfe2QT67IB5sJdsrNk
jIxSwaWjOUNddWvCk/b5qsVUROOuctPyYnAFTU5KY5qhyuiFTvvVlOMArFkStNlVKIufop5EQh6p
jqDGT6rp4ANDoEWbHKd4mwrMtvrh51/8UzaJrLzj3GjdkJ/sPWkDbn+AIt6lrO8hbYSD8L7RQDqK
C28FheVr4ynpkrWkT7Rl6npWhyumaCbjR+8bo9gs7rto9SPDhWhgPSR9R1//WF3mdHt8SKERhvtd
NFkE3zf36V9Vnu0EO1ay2n5imrOfLkOVF3vtAjleJnesM/R7v5tMS0tWoIr39KaQNURwI//WVuR+
zjqIQVx5s7Ta1GgEL56z0C5GJoNE1LvGXnQDyvDO6QeJVThFNgwkossyvmMAaPOJYnYCrYXiXXle
A6TpL63Gu8foNftUO0T83JbV/e6J8iCOnGZwZDrubOtYn1QwggWDMIIDa6ADAgECAg5F5rsDgzPD
hWVI5v9FUTANBgkqhkiG9w0BAQwFADBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBS
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
jmkLAgMBAAGjggHgMIIB3DAeBgNVHREEFzAVgRNkYXZpZGdvd0Bnb29nbGUuY29tMA4GA1UdDwEB
/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwHQYDVR0OBBYEFBp5bTxrTm/d
WMmRETO8lNkA4c7fMFgGA1UdIARRME8wCQYHZ4EMAQUBAjBCBgorBgEEAaAyCgMDMDQwMgYIKwYB
BQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQC
MAAwgZoGCCsGAQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWdu
LmNvbS9jYS9nc2F0bGFzcjZzbWltZWNhMjAyMzBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3J0MB8GA1UdIwQYMBaA
FDO6vqPUOU0qGdfIZpJogf3BxsnGMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vY2EvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3JsMA0GCSqGSIb3DQEBCwUAA4ICAQBF
tO3/N2l9hTaij/K0xCpLwIlrqpNo0nMAvvG5LPQQjSeHnTh06tWTgsPCOJ65GX+bqWRDwGTu8WTq
c5ihCNOikBs25j82yeLkfdbeN/tzRGUb2RD+8n9I3CnyMSG49U2s0ZdncsrIVFh47KW2TpHTF7R8
N1dri01wPg8hw4u0+XoczR2TiBrBOISKmAlkAi+P9ivT31gSHdbopoL4x0V2Ow9IOp0chrQQUZtP
KBytLhzUzd9wIsE0QMNDbw6jeG8+a4sd17zpXSbBywIGw7sEvPtnBjMaf5ib3kznlOne6tuDVx4y
QFExTCSrP3OTMUkNbpIdgzg2CHQ2aB8i8YsTZ8Q8Q8ztPJ+xDNsqBUeYxILLjTjxQQovToqipB3f
6IMyk+lWCdDS+iCLYZULV1BTHSdwp1NM3t4jZ8TMlV+JzAyRqz4lzSl8ptkFhKBJ7w2tDrZ3BEXB
8ASUByRxeh+pC1Z5/HhqfiWMVPjaWmlRRJVlRk+ObKIv2CblwxMYlo2Mn8rrbEDyfum1RTMW55Z6
Vumvw5QTHe29TYxSiusovM6OD5y0I+4zaIaYDx/AtF0mMOFXb1MDyynf1CDxhtkgnrBUseHSOU2e
MYs7IqzRap5xsgpJS+t7cp/P8fdlCNvsXss9zZa279tKwaxR0U2IzGxRGsWKGxDysn1HT6pqMDGC
Al0wggJZAgEBMGgwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKjAo
BgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjYgU01JTUUgQ0EgMjAyMwIQAUXA7LnOuRz2DvkWTeMc
0TANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgfgLrF6e8xjqqjbqwmahPbSkIMUKo
ka+6Zf2gbhWRhJYwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjUw
NjIwMDkzNzM5WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcN
AQEBBQAEggEADraqfMRGTNuly9iDyzGlZO4dpKx9d65OdOwEFjz8zgVuEte+5rAtYKwGRCqUCR5O
GsxZRtOaIUK2jn1dCPL5wEEBu023LznNlYHVQ50kFbl7L3Fp+I3hY83OcNe61U5ztcG4KOhLilYR
w6692cO2SpWe/L5VnOyhMBhcmYiVWevdkghHXN0W/twqXQLXv7e/uwruRmaSdZcPCBquXlOZTCpN
015GvFcMgrzQx1UsBYqp8UDjDcPpiKCUyfM3r6mhuQ/rzG/3xuNDfgwBz8e6mNNkz616AN8iijjk
9tBG7QsynxP14yAWShr0IcvADqOjQKRv2AdwTKLfHVK7GZilxw==
--000000000000f219100637fd9c4f--
