Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2568B28F3
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 09:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739007199; cv=none; b=kmmDq69Vj+sR/i/lNIPeX6iuYyrKPlMS+3zGRfvIGRporm58MMrmhPoEsjonRk+zUd9G8Waem3PoHU5lSBI/nsnESn29Go2QJaEDqPsYJmr3PPaGQa7qnvZsETtj/jDt+YYBAIML2vpkY8GgzLiuwmzsRyuURR2zqFjkzBl8Z8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739007199; c=relaxed/simple;
	bh=lIeyLrpRw3Nc7xVpPvIu+PInwr5AHo7b7ua3aaooq4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ss4t84F+nF5/T053b7qKKYiYRWZMZeuvojDW1JtSdYxTsLRB9UW2Uzt8OPDM0BlUPHLLH9KVxDM2NJltNPj0XjsUy8T+1QiE0S3p8Je0ueL7N5ZJv75gNVVoB/1yiO/dQa8YjXV/nzeI4b1jBGYMEU0ypXC6FwKHGl4f8A/0f7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u8/ntJ54; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u8/ntJ54"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DB50C4CED6;
	Sat,  8 Feb 2025 09:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739007198;
	bh=lIeyLrpRw3Nc7xVpPvIu+PInwr5AHo7b7ua3aaooq4w=;
	h=Date:From:To:Cc:Subject:From;
	b=u8/ntJ54X3tMGkebnVGjdsXdC3krBJB6M7TafPhS2JKkuePFz9KJGzTDYKazdYf8n
	 Id2gLz4Fw+mhBCLGrC2f6zt/vH2fthY1EhAzTAEnLr8/SZ9azD03C/GMk4o3XKKO9Z
	 Aa0EUVnSAJ92mB0IZAYisBM7EXWdhMnfMkfHv4F2HtM9VfVKnq3bI9K8wAGzoO1SOi
	 oHpS32x//YyzJsXc1xbgd9IG2w3D/GNxQxPEsQgO5NlDS2kocy6hTx/2Ioc06zIEvS
	 PSyAiL5CvtFhgd4EWcfxmICPcwM6ENr7p9PA7/14luHALMyiZKi95riJetxzjDh+VM
	 12LCW0LilLSCw==
Date: Sat, 8 Feb 2025 10:33:08 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [GIT PULL] x86 fix
Message-ID: <Z6ck1Oab-St6zfoX@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest x86/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2025-02-08

   # HEAD: ee2ab467bddfb2d7f68d996dbab94d7b88f8eaf7 x86/boot: Use '-std=gnu11' to fix build with GCC 15

Fix a build regression on GCC 15 builds, caused by
GCC changing the default C version that is overriden
in the main Makefile but not in the x86 boot code
Makefile.

 Thanks,

	Ingo

------------------>
Nathan Chancellor (1):
      x86/boot: Use '-std=gnu11' to fix build with GCC 15


 arch/x86/boot/compressed/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index f2051644de94..606c74f27459 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -25,6 +25,7 @@ targets := vmlinux vmlinux.bin vmlinux.bin.gz vmlinux.bin.bz2 vmlinux.bin.lzma \
 # avoid errors with '-march=i386', and future flags may depend on the target to
 # be valid.
 KBUILD_CFLAGS := -m$(BITS) -O2 $(CLANG_FLAGS)
+KBUILD_CFLAGS += -std=gnu11
 KBUILD_CFLAGS += -fno-strict-aliasing -fPIE
 KBUILD_CFLAGS += -Wundef
 KBUILD_CFLAGS += -DDISABLE_BRANCH_PROFILING
