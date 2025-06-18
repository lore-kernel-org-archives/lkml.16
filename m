Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B2527E071
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750235288; cv=none; b=S7ORGkOENzQK9HwkwTiCgL5MQz7IZetyG63X185F3X7nmlknercRxroHgPZ/HvGYTNqJGAp/AI/E43tTV4g21PlSbNLwZVVikFRP3L8J2rb6yjpV/Z1OnA96qY6mOBxFvnSja3Z6AFgSY9wz9WOcHLM1HpegpYKsQ/4mrxqG6ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750235288; c=relaxed/simple;
	bh=gGBUKK2bGctYiYhiGRujH/YL9B1xckj1cMsjW9vYehw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WHG3E/bI28hDqFnxDpe+lgDwdIQm5GJjtW35KEizlT3Tn1BrbHLQRZyGNFr1ih9263VPC9KY+dH/rFdI7YBf4io14fbQw5wOXFA5HDDL5JMvDBv9cs5CJ9NyAnhdWbQ0LZ0e5cdcwz6eOqxpWPE72OuhkWR07drtOdY/hM5xC5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KDvu1NeC; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KDvu1NeC"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4f71831abso5928097f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 01:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750235285; x=1750840085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7sBltaN88VTY0He+60hiRFLZfZBtquu1S5ICXZnuVmk=;
        b=KDvu1NeCPR4xbImt1s/lBZV223y/Gd6gsgx6edK420ApQQOsHh4sn623kyAcwnzcGn
         dELDbnytMgnpnUmBc8eAPd+5mQuC0NA2Y2ySw8XCAcAsUifyZkAkWq6tGbugQq0u1uKH
         7d2d9BjPHmq0b+ovlN35tTiSR+5NxTq2V2tppDs0zgKa4zyAFnfUMbtojPEkEyp7grF0
         MpxiCRXIE8ZLEXPkPPXnk2yGhCTvQ4X87kCuzmXBRqaFLXOoQifj20bu4XUZaLKRuSk4
         I7v1RRV6pveRBMgw4Lzf6Q8V9SdsaBlBkIvIbdFCvw62Fv2FBe0Hz02sMrN3l5bOcH4u
         Wm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750235285; x=1750840085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7sBltaN88VTY0He+60hiRFLZfZBtquu1S5ICXZnuVmk=;
        b=AJFfB/u0AsYmG3WU0MY15V4VwwK3S3S8CFWeIGHtewnasHxf74zIVc7vnLsMYNo+0/
         pbwn/hkxZIH7oLYNRcu23vRDk2sK4QOJZe+1I58FnnvRVxlXp/EO17/OV0Ai7EArOYdF
         4UloSD53aO4b9xEErvz+kcrboyjx6nEOa6/0dbrJsKAP7ZTBrVelmvRw0UIOpg7O3IHd
         B7vUZF/3C7KY8/i0ZBdhHkQAojdsEhKlwQleHYX4yv6Bjhy8BhXG6724ekgrfQwI2APA
         PH2Y+6hRimkeo4QcYKC2MarHltv/8AefC+Z/IJZYJwDwGJHEvDaSXJ7fO7O8Ds6Q5UG7
         RZew==
X-Forwarded-Encrypted: i=1; AJvYcCVFHxfyJH0RhuKujCx+4DJc+enVYVAfdbulxVsAZw0pkOh3MA8x8YLlMDhjGF8ZCY0a/NxWKaQK5wzLGbA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAlEsYSEDPLEkqJqT2jz6oPukNfeGNkHTRXkRaCcQY97urES2+
	Rc90EuO3YSvVupMHdq2nJm2w97NElsY0QtAXmnIDxKuad2Z/HznFx1St
X-Gm-Gg: ASbGncveKE2H9uFKO1Z5dzWBB0mDmC+HJrQ7mDvdsuPgJZZjPvucK6z146p5gKizgeT
	qKFGNMuHCPNjracQKr9ircPKZKGneKl8hIjiYiJmbGTnV/ks0JTGxd/HY6+H+RksSjYXl/GLzhl
	/k5AE2p1cbNzwai3wwixhDnq38lSuTiiNrZRSB8/jWZOz+WUuBTnmBBYiA4oR1B5Fx7jyA3dZb4
	x+BWrMpr4162IwVueNyEsOP7KlBLWYsieMb4/GSQAlVACrNUtdnkNL6SPd0poZecb+0Uzo2mzXw
	S1klhAOec1OZ7vhPHbQcjQ5a5WD0diVFIG7Wv79uTPAuLBHV7KwnLmrgun4S+hdcRxI+S4dyNoj
	o
X-Google-Smtp-Source: AGHT+IFckVzEGoyzAOyEt0UBC4wbSOwJWUKREX4Btf2yi/rU57GSXzyerV4ISS6aJkqhF02TmRD9YQ==
X-Received: by 2002:a05:6000:2c0d:b0:3a4:bfda:1e9 with SMTP id ffacd0b85a97d-3a5723af27bmr14919929f8f.46.1750235284619;
        Wed, 18 Jun 2025 01:28:04 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e13c192sm200076045e9.26.2025.06.18.01.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 01:28:04 -0700 (PDT)
From: Khalid Ali <khaliidcaliy@gmail.com>
X-Google-Original-From: Khalid Ali <khaliidcaliy@gmail.com
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org
Cc: hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	Khalid Ali <khaliidcaliy@gmail.com>
Subject: [PATCH] x86/boot: Avoid writing to cr4 twice in startup_64()
Date: Wed, 18 Jun 2025 08:26:33 +0000
Message-ID: <20250618082717.1098-1-khaliidcaliy@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khalid Ali <khaliidcaliy@gmail.com>

When Initializing cr4 bit PSE and PGE, cr4 is written twice for	
each bit.

Instead, set both bits first and write CR4 once, avoiding redundant
writes.

Signed-off-by: Khalid Ali <khaliidcaliy@gmail.com>
---
 arch/x86/kernel/head_64.S | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index 4390a28f7dad..dfb5390e5c9a 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -222,12 +222,9 @@ SYM_INNER_LABEL(common_startup_64, SYM_L_LOCAL)
 
 	/* Even if ignored in long mode, set PSE uniformly on all logical CPUs. */
 	btsl	$X86_CR4_PSE_BIT, %ecx
-	movq	%rcx, %cr4
-
-	/*
-	 * Set CR4.PGE to re-enable global translations.
-	 */
+	/* Set CR4.PGE to re-enable global translations. */
 	btsl	$X86_CR4_PGE_BIT, %ecx
+	
 	movq	%rcx, %cr4
 
 #ifdef CONFIG_SMP
-- 
2.49.0

