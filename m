Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051061DDC08
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 23:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749079556; cv=none; b=MgKx2TAzBIJpKC0BynIY3HgFZggyXbJNfWVfkRTK8j1VAuQqGu+FA3O108fxy1kFFQSLGcNowzW/m5iveQduOn11ykR1JAOWmqHKsh1He+zSmuL2IpvvE/JL+pw107tLbIU9iF24uCgbHXXxjklHJMF4Q00LH0mrhTbPPDF5/7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749079556; c=relaxed/simple;
	bh=aNWUmxufhSQLQrBnFlE6ppLVsbEWf2/wWffhXN99rwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SkjQQRaaYoKfOX3AXl66LgEisvqKg0e2XXZWWmYSrlSZuUiySW2q7DJHRDY7yXGr6/fSyT2r1FoXvMn6Bh3hbfF1PST5FWdkFKLd1p67WMWyFVIZ5S2YOC2Ny3Wuh2gyPsds4ydj5HqfQFUbTTZRZJI+Gps9OBRFBbvNccLRM3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PAWM4KZ+; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PAWM4KZ+"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-70e5e6ab7b8so4610497b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 16:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749079554; x=1749684354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gG+ZEjZcQCNcIRG3cnncfztX67FBxlYy1K2/YgyWq8=;
        b=PAWM4KZ+c0NgyeGS5BGI0z000cRLNEfp7S6dhkukWv+jiZH8uIMjzPXmh8sjY/OLSe
         +QxvejS2to+PFK2IJ5xL/u22CtOGhtZ0HFM+XA4Vf1fjTg8/7TvuEOnQTZTrbYB2GumS
         iuJJx26p7ey8FVxIE6Y0mINNtKPMAhiGit/7uyKQdk5oO7dh9KdBKg49w3uYhVPEo37O
         U7QsdCJIC6gHhelYftgEJNZov5qYNATY0k4dmo18fJ2PJWVi688vxB8rtAEHQcLDCU8y
         Qe8mC4oNhTsL8o5oJgoIRcgc50ey9aarJMrwPkbBgkkdJKv4I61o6b7jyLOjJ9Et0r7Y
         3/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749079554; x=1749684354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gG+ZEjZcQCNcIRG3cnncfztX67FBxlYy1K2/YgyWq8=;
        b=IB8E0V+g2Wrw91Ss07biOUuln1/J+mA11OBUrExsTman+iPueed435PkhlgBDFrS7S
         eh0+3DwP/dxz4qVI4MqTaWZjrx2lCajNDRw96QGD88zIUuNXl9Omi124bjJQPGi3OiqD
         Wk5Y8rKiALqk7jDXqxxyKri/lW+YZIlB/1YlWcBlVMIVDE3+iqrEE9M9MS/TfTmqR1CM
         rL69NYE6w1xsXw7RCStCy8WYp47J6MRPASA9mODYzfOuBP4nHFUBEGADp9Z0RgcQAcCg
         6vdw5UnFnVDlD+BcJIUHK2oMy2rD0uzqSORRBECxIgfTFb64oHS9FZl7EnHl9maLkHqi
         VGvg==
X-Gm-Message-State: AOJu0YwkExuJtGuiCm/zpXXDUzBFtOSFA4Zo3pQN//rhx3xTEngUQGSK
	QSYXNcT8mzCtxpnBbdm1gOfatp4cG7MzKl5HHCvbzsHPp6sojhkFuQUQy7uD3A==
X-Gm-Gg: ASbGnctK6WTqj2MWchMUUcqxd4269MRXejY8SvUbtrmkUTCt3hDU28AQrmFHINjuP9l
	ZmmR7mUBtE0n5rR0gwIV8NTjtv0J+aqF630gYjnR/Ge9nXvW/fZn1JzRysK5/YM5WE/KDbkFB4Z
	Akd+Hh6zF35J/jy9O8wIvPcA9XVCyItBW/FrpAofJi+6F07uhkR/pzmeSVOIp4rk4BAR8rY9o3U
	49Ue2Lswr/R99QkDwdvp7MaGyfWN93M35S66vNK1PbqGMbCgzruMXsd5MWDE0fJTr5EpDV1XNAC
	HT7QGwcMWRKW7Xvina/DQxEtriGMvmGyzm/bIGXG6IadiP0lLsZKSQOhoUVhuGmKriqDwR1S6RK
	alpnaxAAoXyBq2lATMX+0Ew==
X-Google-Smtp-Source: AGHT+IG9YlaGTFMDtvExKnIXSCm5Z6XTxWt/SVGG5f7HlM1J3/m10UYuymBbHMQv3DKHSPFiIdBeIg==
X-Received: by 2002:a05:690c:7008:b0:70e:7638:a3a9 with SMTP id 00721157ae682-710da1cea1amr71466467b3.18.1749079553930;
        Wed, 04 Jun 2025 16:25:53 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70f8ad01703sm32192297b3.115.2025.06.04.16.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 16:25:53 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>
Subject: [PATCH 1/2] clocksource: fix opencoded cpumask_any_but() in clocksource_verify_choose_cpus()
Date: Wed,  4 Jun 2025 19:25:47 -0400
Message-ID: <20250604232550.40491-2-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250604232550.40491-1-yury.norov@gmail.com>
References: <20250604232550.40491-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yury Norov [NVIDIA] <yury.norov@gmail.com>

cpumask_any_but() is more verbose than cpumask_first() followed by
cpumask_next(). Use it in clocksource_verify_choose_cpus().

Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
 kernel/time/clocksource.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index 4b005b2f3ef5..2e24ce884272 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -323,9 +323,7 @@ static void clocksource_verify_choose_cpus(void)
 		return;
 
 	/* Make sure to select at least one CPU other than the current CPU. */
-	cpu = cpumask_first(cpu_online_mask);
-	if (cpu == smp_processor_id())
-		cpu = cpumask_next(cpu, cpu_online_mask);
+	cpu = cpumask_any_but(cpu_online_mask, smp_processor_id());
 	if (WARN_ON_ONCE(cpu >= nr_cpu_ids))
 		return;
 	cpumask_set_cpu(cpu, &cpus_chosen);
-- 
2.43.0

