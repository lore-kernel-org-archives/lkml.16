Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBA11A3142;
	Mon,  5 May 2025 05:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746422104; cv=none; b=IuRn4jeKEu4JlFIIjqJn3PF6xdU+stRnvVGNIs7v8yJxRABYCBc8RfznQ+iKuhm21dG2URUyB3Fs5V5gPxsgbc2tff6WtdjIZOOU25l8l/PSStZhUbPeKaKXbcyo3MlW33yk3dclwV61AmiZqmcZsrtLzrHNQOemHb/3Yr7Bm6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746422104; c=relaxed/simple;
	bh=H94oPEd59fZXSO8leNvc9DZOv8sXbV81m9iZHOwLG3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hG+mZ+fkUIZb6TQMmhuhoqc/o8nvPJY9H6JDtQtq+RcreppHSE3SqiqjEEeTh94ODIISdPqFYjW+4k+xiJPHQzvXQvMD4Pt+ktM6suwCFF2RYaRZ35EkVrYDBVGqsP1CTzN1I3OupSvEOjO2IGmXLdMGZ3Cp40u/m/KRj3xVLl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f8tc37ok; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f8tc37ok"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBFD8C4CEE4;
	Mon,  5 May 2025 05:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746422104;
	bh=H94oPEd59fZXSO8leNvc9DZOv8sXbV81m9iZHOwLG3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f8tc37okeYyS3W6xxYWWtK0Y8Ez6guvSyqydv2YyGWlguu6RpCFjTDZzGcQmD99cE
	 PAHgbrnEeFxRAxmTRe7Wlbygh1cecnYVYPmFFgtZNJjoE60zEYHIyTzgV8KcaRlr9T
	 CwCloO58Ool8JO5+/KOm1Ypaa3VGlNtl8ZXy2P50q3IpAt9F38O8BAWVPpYmW9+Vt+
	 ZTnasZxaHRLzLXzs8AUJM9hGP+xQWP3t7dtq+63eEOi7Zwv8lUPNMCXnRmdvU/wPuJ
	 IZt2nzs/AEShkJyt46xSx8NGDmzOuiRIVnENWGMeZbiVceKsDFQgOOFQ0pZ3ViQOWB
	 oeIfjW2ALqGGQ==
Date: Mon, 5 May 2025 07:15:00 +0200
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-tip-commits@vger.kernel.org,
	"Borislav Petkov (AMD)" <bp@alien8.de>, stable@kernel.org,
	x86@kernel.org
Subject: [PATCH] x86/microcode: Add microcode_loader_disabled() storage class
 for the !CONFIG_MICROCODE case
Message-ID: <aBhJVJDTlw2Y8owu@gmail.com>
References: <CANpbe9Wm3z8fy9HbgS8cuhoj0TREYEEkBipDuhgkWFvqX0UoVQ@mail.gmail.com>
 <174628529460.22196.11450380316905137027.tip-bot2@tip-bot2>
 <aBcFv6BzmRNWqLY8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aBcFv6BzmRNWqLY8@gmail.com>


Fix this build bug:

  ./arch/x86/include/asm/microcode.h:27:13: warning: no previous prototype for ‘microcode_loader_disabled’ [-Wmissing-prototypes]

by adding the 'static' storage class to the !CONFIG_MICROCODE 
prototype.

Also, while at it, add all the other storage classes as well for this 
block of prototypes, 'extern' and 'static', respectively.

( Omitting 'extern' just because it's technically not needed
  is a bad habit for header prototypes and leads to bugs like
  this one. )

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/include/asm/microcode.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/microcode.h b/arch/x86/include/asm/microcode.h
index 6aa12aecbc95..c23849246d0a 100644
--- a/arch/x86/include/asm/microcode.h
+++ b/arch/x86/include/asm/microcode.h
@@ -16,15 +16,15 @@ struct ucode_cpu_info {
 };
 
 #ifdef CONFIG_MICROCODE
-void load_ucode_bsp(void);
-void load_ucode_ap(void);
-void microcode_bsp_resume(void);
-bool __init microcode_loader_disabled(void);
+extern void load_ucode_bsp(void);
+extern void load_ucode_ap(void);
+extern void microcode_bsp_resume(void);
+extern bool __init microcode_loader_disabled(void);
 #else
 static inline void load_ucode_bsp(void)	{ }
 static inline void load_ucode_ap(void) { }
 static inline void microcode_bsp_resume(void) { }
-bool __init microcode_loader_disabled(void) { return false; }
+static inline bool __init microcode_loader_disabled(void) { return false; }
 #endif
 
 extern unsigned long initrd_start_early;
