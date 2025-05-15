Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72AE1F4CBE
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 13:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747315690; cv=none; b=QqIH2WmSeTqtmcEv8NY9CJdwqjELjxN0hqmowff/EmurBHgqBas6D4TgNoVnZfaoi2BI40b2J5xxRAEzxgNv7QgezGbJUNlntHIuPSE87ra/S+X5CK/rkVBTAWlmZTZsvRpOf7XlhpLS1uDEQTu6FbSn9v2d0rlYOdGAHD7g1yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747315690; c=relaxed/simple;
	bh=xCt5dD8IvnSWSgBH5wELPJJTw5hGMGnIvn3rPEm7mZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SNCwhZVs0OJJ2jemikbk0zYSTP9MWjTKfYQtiwcoSJQ1I4V1PEOEjCYsaU29rReigrw91TZf1vEDBl70oichV0WzFMITmxC4L7voKhcHfO7idV7m5hgtE9HkbpR4EnZ9zmUorRwKSrX3hEWRUZ1pvnt5nK0HY8CYG8dSkX8pbNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H6UhElev; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H6UhElev"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32243C4CEE7;
	Thu, 15 May 2025 13:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747315690;
	bh=xCt5dD8IvnSWSgBH5wELPJJTw5hGMGnIvn3rPEm7mZ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H6UhElev1TRYrs+KCAgH3jRUJqu4zYem3yePoB6gAZSoSgS936Usnx/a+Efb/jb8w
	 D7PFBP1cDfMLAod0F27nF5Gi6N2KxtodOst7DbM1OgloU/9d9Xj35CSVcNy3WhyoS3
	 57XLLg4X/KAvswjaNPDYki5+/u+Z7Of7py6AaOkGiJbb01MMfqsBMjEFPWkQ7GrCjn
	 m9jRFCaswmsxv5j+MjSQVjr/tnAsB/gZJha/gN0XzunjpjaJewWMHIpdS0BVn1Ch6z
	 hp4sIp5e9c26qG1NRjycqEDS83My5O6/dcGeojSBGYzF+W/oX23XVVRqzmqZrHLXYX
	 icO93TYSvBOEQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	=?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 12/13] x86/kconfig/64: Enable popular generic kernel options in the defconfig
Date: Thu, 15 May 2025 15:27:18 +0200
Message-ID: <20250515132719.31868-13-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515132719.31868-1-mingo@kernel.org>
References: <20250515132719.31868-1-mingo@kernel.org>
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
 arch/x86/configs/x86_64_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/configs/x86_64_defconfig b/arch/x86/configs/x86_64_defconfig
index 225aed921e21..11095e7569a8 100644
--- a/arch/x86/configs/x86_64_defconfig
+++ b/arch/x86/configs/x86_64_defconfig
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

