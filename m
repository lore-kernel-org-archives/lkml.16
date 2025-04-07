Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0DE1A8F84
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 23:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744067460; cv=none; b=l7BFqLDMGyH1odZhnplQXQFbGMC1RWfgkdcz1oGnMCON2yzTreWP8+7V9GbRJOTuhG34XNzJ4Ppku6J78C8iSBET/seAm3mKNWMkWO65nTJUp7iBGw0XbNb+3zERQ4FNDK13xD2BaV7bJhP18fPMBXdg2tlocyEqHfV/gjcK6PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744067460; c=relaxed/simple;
	bh=5sHSB4BmIO1o8wGnGFVh9bYH6th+VKb3P1JE/msVfTw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TDspIKbBxIyMJmWhcFmZzPgNgs+RUFOvrz3d0Rx/vrsFtnTMNJadpCK/VBcBCen0mSBfO61yfGt/tyExRFHt/yfEm9eEoFzTul+amUU9aDOaOxXDteXiR0Adwr/ZefkShGKu9o/P5pDZgnPk36S0xw/8ECL0c6Jg+7I/W16LFQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=r0jZCqmo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="r0jZCqmo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F89DC4CEDD;
	Mon,  7 Apr 2025 23:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744067459;
	bh=5sHSB4BmIO1o8wGnGFVh9bYH6th+VKb3P1JE/msVfTw=;
	h=From:To:Cc:Subject:Date:From;
	b=r0jZCqmo4WKg/TbQ5WPzZVW74KMrqbB/R7RbdjWRYMYsFMXqxyyZF48/+Rej0zDeL
	 BWE+wa7n4RpsgYe4243uB9Bk7onpKnBb+MGeEBVdq77r8HmU3RLMR/SriREXNay0GC
	 Y7JvRyEq3lvKV9kmCRQx+krMC+UQDsVRMwNoXEck=
From: Shuah Khan <skhan@linuxfoundation.org>
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	hpa@zytor.com
Subject: [PATCH] x86/Kconfig: Fix dependency for X86_DEBUG_FPU
Date: Mon,  7 Apr 2025 17:10:55 -0600
Message-ID: <20250407231057.328010-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Compile fails when X86_DEBUG_FPU is enabled and X86_REQUIRED_FEATURE_FPU is
disabled. Add explicit dependency on X86_REQUIRED_FEATURE_FPU to fix it.

../arch/x86/kernel/fpu/regset.c:411:(.text+0x4cf2f): undefined reference to `fpregs_soft_get'
ld: vmlinux.o: in function `fpregs_set':
../arch/x86/kernel/fpu/regset.c:445:(.text+0x4d0da): undefined reference to `fpregs_soft_set'
ld: vmlinux.o: in function `copy_fpstate_to_sigframe':
../arch/x86/kernel/fpu/signal.c:197:(.text+0x4da98): undefined reference to `fpregs_soft_get'

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
6.14 compile worked without X86_REQUIRED_FEATURE_FPU enabled. Might be a
new dependency. Enabling X86_REQUIRED_FEATURE_FPU fixed it for me on my
test system.

 arch/x86/Kconfig.debug | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/Kconfig.debug b/arch/x86/Kconfig.debug
index c95c3aaadf97..6738de325fe6 100644
--- a/arch/x86/Kconfig.debug
+++ b/arch/x86/Kconfig.debug
@@ -199,6 +199,7 @@ config DEBUG_IMR_SELFTEST
 
 config X86_DEBUG_FPU
 	bool "Debug the x86 FPU code"
+	depends on X86_REQUIRED_FEATURE_FPU
 	depends on DEBUG_KERNEL
 	default y
 	help
-- 
2.47.2

