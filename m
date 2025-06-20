Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 086DA23817C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750415854; cv=none; b=KguLRojKVsUcYFWQks8vwhRv72AcfVFvncJmj4ICYA94/T1k+MrEciZ0un2DUBb7oD5iBhSS7q3c53RbpMXMoKukmCXP6iLAte0F6PbfQDOJLv3q0CRvkldbqGpoDpDcyQuHA7077VlookV3yKwa9wnhUhqUbzibf24dhAaDFzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750415854; c=relaxed/simple;
	bh=87pOCI2aZ3lrwjG/xX+3vUfFuz9YseCPOWWDCWJVf4k=;
	h=From:To:Cc:Subject:Date:Message-Id; b=efvlQ8TXamXNmVQHye4MX+nK11Jpqy337vmVbuspe0CNh2Don5mc4PuPN85zoIfDZGieFdhHAlVBLvwDVS2rK6Q/j4CEX8oOpOaQQUpmRVVV1zMfX95bkc8TJR6dijrSd2qS4gc23wF/weRjLYfFlXIx420Wws0Fig8lYwGkHss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 55KAbPlA010253;
	Fri, 20 Jun 2025 12:37:25 +0200
From: Willy Tarreau <w@1wt.eu>
To: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Willy Tarreau <w@1wt.eu>
Subject: [RFC PATCH 0/3] tools/nolibc: install unified multi-arch headers
Date: Fri, 20 Jun 2025 12:37:02 +0200
Message-Id: <20250620103705.10208-1-w@1wt.eu>
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

First, it adds a "headers_all_archs" target to nolibc, that will
install the headers for all supported archs, so that they appear just
like in the original source tree, meaning that when uapi headers are
available (e.g. provided with the toolchain), the build will succeed
for all suppored archs from a single installation directory.

Second, a new "install_all_archs" target iterates over all supported
archs to install the corresponding UAPI headers, and moves each
arch-specific "asm/" subdir to "asm-arch-$arch", then automatically
recreates the files under asm/ to include the corresponding files based
on the detected architecture. This results in a unified sysroot that
can be used by any of the supported architectures without changing the
include path.

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

Thanks for any comments!
Willy

--
Willy Tarreau (3):
  tools/nolibc: merge i386 and x86_64 into a single x86 arch
  tools/nolibc: add a new target "headers_all_archs" to loop over all
    archs
  tools/nolibc: add a new "install_all_archs" target

 tools/include/nolibc/Makefile                 |  59 +++++-
 tools/include/nolibc/arch-i386.h              | 178 -----------------
 .../nolibc/{arch-x86_64.h => arch-x86.h}      | 180 +++++++++++++++++-
 tools/include/nolibc/arch.h                   |   6 +-
 4 files changed, 228 insertions(+), 195 deletions(-)
 delete mode 100644 tools/include/nolibc/arch-i386.h
 rename tools/include/nolibc/{arch-x86_64.h => arch-x86.h} (53%)

-- 
2.17.5

