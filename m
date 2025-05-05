Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCDF202F83
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 11:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746443436; cv=none; b=Jv/30yG2iIQIbBAYeI2iK3QaCuvGlTZgHpVWZJ7Q/HpiXY/f3YiX10d5PuABYNYs6e4Lw9L7UzGt7LeTTq5zZMCSoDJEK5mUbaPOeYGBXLl1nDoM0+8Q+3Pdf+cM0Vr2ts58d//MvFCBLImYoNvxD0fYq1EIFHLuCehvGBLZPlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746443436; c=relaxed/simple;
	bh=1dzPDtLojo1chbihTOO9Lew4yzECmsbhVcMxZVrRWIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KsSuttU5c7bu3XjwQiXWDNCXF9IiPFytF5Mlmh7O2w2vQLe7U6+6G1voPm030bSuAcEvVhWeO4f9Dmz0ERop+ivWamzG7i47kHykTgtGlxbfERmPpVG//1+1+2z+467Xb5ayBGEPVHUWLhkccMXVkioihSURBxDM6OEJScsM+8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n9lABMuO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n9lABMuO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0890C4CEFB;
	Mon,  5 May 2025 11:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746443436;
	bh=1dzPDtLojo1chbihTOO9Lew4yzECmsbhVcMxZVrRWIc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n9lABMuOi6HAMwe/0MoLYxD1gxko0hkzl6GK9BwB1tGWrXF3ibq0FHPrvvAJn6fyE
	 PNPFNDvSfNIhhr5Rf/x8gWMzW2xuUKcRBDrEyRPRkwgEom8+IFSG1QAiwPRmKnUE2i
	 eVOEPuCH8T3tY7M9C0JHNIndwXsS2FFJPg/NOmMyBkTV9crtl2ZV1eO6YDHHneHXnk
	 FR7M/8h1REXVefaFpDoMJp9/GfYVviQOOXqIRGwDhorFWbIGnoUubotOfpgIjqh75L
	 VSAHzEpdmZ5DiXBCqwiKrz0uq9XwhhNeh+VA90WxnC8eb7KrHqjJKWf7MmDQh7kyIk
	 yZqQYZGoQvrSA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 14/15] x86/kconfig/64: Enable popular generic kernel options in the defconfig
Date: Mon,  5 May 2025 13:09:45 +0200
Message-ID: <20250505110946.1095363-15-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250505110946.1095363-1-mingo@kernel.org>
References: <20250505110946.1095363-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the last set of options picked up from major Linux distributions:

 - CONFIG_UAPI_HEADER_TEST=y

    x86 developers frequently modify UAPI headers during development,
    make sure they get tested.

 - CONFIG_WATCH_QUEUE=y

    All major distros have general notification queue support enabled.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
---
 arch/x86/configs/defconfig.x86_64 | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/configs/defconfig.x86_64 b/arch/x86/configs/defconfig.x86_64
index 09e9a8823dc1..386e55d715c3 100644
--- a/arch/x86/configs/defconfig.x86_64
+++ b/arch/x86/configs/defconfig.x86_64
@@ -1,6 +1,8 @@
 CONFIG_WERROR=y
+CONFIG_UAPI_HEADER_TEST=y
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
+CONFIG_WATCH_QUEUE=y
 CONFIG_AUDIT=y
 # CONFIG_CONTEXT_TRACKING_USER_FORCE is not set
 CONFIG_NO_HZ=y
-- 
2.45.2

