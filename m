Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F12322CBE6
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 17:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751216866; cv=none; b=EIW6KA3AOkOL/fVNbZ7LeEWTJeXR2hzW7ezESw5nDWWAvGqbrpy1QNk33yAGkqHsI3eL8z27spHHOuaAZeZ1BO1OWCqCREt8WEz/3QbK3fjYkusSI3m2Fbtg2YtSr9HOokkerFn/QJoBsm+sH9aLVtf1h1m8BfE8tEdMThxZQDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751216866; c=relaxed/simple;
	bh=UC0Mwa2io6zH7BFh5FXcWTaucj+RZ6o9GbElHRZjv94=;
	h=From:To:Cc:Subject:Date:Message-Id; b=ib2C2iMETJT4HCXBgv2lmEV7BSrb5ZONq5Qqlg7G5hSQgZEwMWbbAirEx6aiJilKO8J7HDtddoxSExswRD/oGqX3gWReodyf587/g/1EbeOAC9mSjMU+BuG2dwDimTMOdYwn/mOXZGlxkGS7H96qK5biTXeQc/9runRVjAOMS2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 55TH7cXa016861;
	Sun, 29 Jun 2025 19:07:38 +0200
From: Willy Tarreau <w@1wt.eu>
To: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Willy Tarreau <w@1wt.eu>
Subject: [RFC PATCH v2 0/2] tools/nolibc: install unified multi-arch headers
Date: Sun, 29 Jun 2025 19:07:30 +0200
Message-Id: <20250629170732.16817-1-w@1wt.eu>
X-Mailer: git-send-email 2.17.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

While the in-tree nolibc directory supports arch auto-detection,
installing it is only performed for a single architecture at once,
requiring as many sysroots as desired architectures. It is not
convenient because external tools rarely expect to change their
include path based on the target.

Furthermore, when installing it along with the UAPI headers for
use with the nolibc toolchains, the issue is reinforced as UAPI
may only be installed for a single architecture, and in this case
we cannot even count on the headers that would have been packaged
along with the compiler and its accompanying libc.

This patchset proposes a convenient approach to satisfy all this.

First, it updates nolibc's "headers" target so that it will install
the headers for all supported archs, so that they appear just like
in the original source tree, meaning that when uapi headers are
available (e.g. provided with the toolchain), the build will succeed
for any supported archs from a single installation directory.

Second, a new "install_all_archs" target iterates over all supported
archs to install the corresponding UAPI headers, and moves each
arch-specific "asm/" subdir to "asm-arch-$arch", then automatically
recreates the files under asm/ to include the corresponding files based
on the detected architecture. This results in a unified sysroot that
can be used by any of the supported architectures without changing the
include path.

I finally didn't use Arnd's proposal to try to build up the include
file name based on the architecture because I realized that it wouldn't
work for programs that include asm/foo first (or we'd have to go back
through a #include nolibc.h which is outside the scope of this change
that tries to remain libc-agnostic). Instead a template file containing
the #ifdefs for all archs is used for each file. It results in a slightly
larger set of asm/ files than the first version which only contained the
ifdefs for supported archs for each file, but compared to the unified
UAPI size the difference remains pretty small.

I'm marking this as RFC because the operations are entirely performed
inside the nolibc Makefile, and I'm wondering whether there could be
any interest in generalizing the principle and moving it to the
generic uapi installation itself. However I don't see how this could
be easily done in this case, because here we have no other option but
iterate over all supported architectures, and iterating over multiple
archs is not something standard in the kbuild system. But we could also
imagine having a script under scripts/ to install UAPI headers for all
archs at once for example, so ideas are welcome. Of course if there's
no perceived interest in generalizing this to uapi then it can stay
in nolibc where the maintenance cost should remain quite low anyway.

Changes in v2:
- merge of x86_64 and i386 extracted from the series
- dropped the aarch64->arm64 mapping since already handled separately
  by Thomas
- made the "headers" target install headers for all archs as suggested
  by Thomas.
- dropped the #ifdef generation from the makefile and run sed over
  a template instead.

Thanks for any comments!

---
Willy Tarreau (2):
  tools/nolibc: make the "headers" target install all supported archs
  tools/nolibc: add a new "install_all_archs" target

 tools/include/nolibc/Makefile       | 50 ++++++++++++++++++++++-------
 tools/include/nolibc/asm-template.h | 25 +++++++++++++++
 2 files changed, 63 insertions(+), 12 deletions(-)
 create mode 100644 tools/include/nolibc/asm-template.h

-- 
2.17.5
