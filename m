Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BA1289E01
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 10:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638715; cv=none; b=pK4EOB4xFS6+0s6eVsA1yhmYHmIw27/avQ7VNaIg4VvVJJiLv+DoaXv3BREL+uRIlqcOGjugqweeWGkKWsiHkCIM6hEsJNRJIZeS2tYPGd3EqNgevkkG3BX3VmmVvTN+xKiez2WjoJpLGtCVv/VZhuu0rvMdbAwTEyauhzAhzuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638715; c=relaxed/simple;
	bh=r6AzIemY8jhRgeGmeH2XDBuKf9B22/TpiN2MBecEYM0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GK9RW06iz80mt28+qlf9YgkqmfIjVwmN9A1g8NjkOK1kF+E1c/b17MGFR8SDpFH3+QGVML/zYPucvwJUsjGduk+PPqgicA/Tgl5i6PR07F57Un99IOmsQ8Kg21LZK/76XKobUwrmv3a4U+2us2RMD5PWz2W6JOlutl+HBwqOJE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kziz+Oic; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kziz+Oic"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-74877ac9d42so79865b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 03:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749638712; x=1750243512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i+hXt20KOnpHxPZlTruLIdjQ7iUCgl0yVHEwobe4r+s=;
        b=kziz+Oic31W3XX5A2KKbdCUWySfSon8KRw/3nT/eEgsDDB0lxfoUbQZfO2SBZMyjS2
         fKr+zGPx++sf6TOxAPn7dRSfub5W+0QnrR9t/A8rFuUJSLzn5I8VDqg7e9D8olHRotHR
         VyghsN5EVsl5cDnvjGbyX+Vvh8ANoeNJuvvA9RgxmwpzSF4LrbMyGD5Zohh+sPMtxPUS
         346oFcmQfDPhUQqqyA1wJ5tI8ycX3ha2OdSizUC9U1dDIAUQN4YDhsrz1u0bstVj3F3n
         Z1wVlw4WxlcWX3WksRWpIYFM5Zj/brNlThjE+iMlwcPUoxLjEAm1hL+hcxO7dnsMP/JY
         aYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749638712; x=1750243512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i+hXt20KOnpHxPZlTruLIdjQ7iUCgl0yVHEwobe4r+s=;
        b=F2h1osfdVBkK/9D0tkH+npzhfUj8Cpb4v3fUPHL9DCRWvsJGL3+lrUSipGLWnLh5KW
         A0vf8CqDuqAnnCYNXdBfMHuxvpN3PnnF3XCW5HK1inzVPm0kF9b2hM2k7o2lkVaLZYya
         yIGElO2rPAOEA1kY6Tjib8bSjFgRLRZ3z1BxWdLo4wkJH7GMYq+64h1es2K09MDLuviM
         3Vs6ajgeyrhi+mvzpMIxXn7yZLXTO3aF5w7DOg8xw338VtFWbMEoS0yiUxL/ZuuoF3id
         6VQ08G3xRneBYdrtuCGQCDM8Is3NzGJQh2a6mEjQx90cARSve7Zqjp7LDyUmUmO1L+d5
         Uyeg==
X-Forwarded-Encrypted: i=1; AJvYcCWVjmbbG4h9+JFFgM8hTw+rftMOuLG6L8fF628FXBOFrLMllfGsFsZX8mouRhBZV1JFsJJsHR7FsI2snjA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWEQFhDERvQxU6sce2alYRAuxV4Gng9mPZQtFoW/DMUQ45aZe8
	0EE+czWXRZ+KJ1Y2ZDK28whBWgZ/T0BmQTG+MdN4hRFCjKXbt8C2Pe5doqPOCpqg
X-Gm-Gg: ASbGnctMo68+xanIAch+PXjcnlW7Irgy6TgBxO/1Qrab1FN1ZbhyYgpQfBMIt834cCH
	RCv7vhqgI7GJBMEobBnXoXks8rtaRNbVGCGoXOlH4mKZ10lY69sHAO3qCpaEaTFOXG2ekEFu/G8
	KBimtCktyECaFE07MMOgZxQ4jQbx2BVYnTV5GFftKmaIJq7KZ9LbEZgYwe8h/lZSZ6beB8wquCO
	v3IHdQSK3T+bQr0j25m5YmuthewwjlDlQTwbaFYAIaWAWc/nhHaKHhuudOqmKgshO39obdY/5RR
	rMyeSU6bgRzO3bgtbE5mw799MVyKTsGNsMW5IJTQ4bJm3CF/Euw6sfBl3uFywJknpGadHawu0TJ
	qrXRMH2TGuMhnQksi
X-Google-Smtp-Source: AGHT+IHaa70N8CkqnPXWc91UlgDo+p6GMS44gx+oso4/GpQPu/T3Sek0DJUNLJfLi0Wcarzi3fnvig==
X-Received: by 2002:a05:6a21:4593:b0:21f:449e:f6df with SMTP id adf61e73a8af0-21f86746da6mr4732949637.41.1749638712361;
        Wed, 11 Jun 2025 03:45:12 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:52f2:ddbc:f858:ca43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0f2e77sm9099735b3a.176.2025.06.11.03.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 03:45:11 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: jstultz@google.com
Cc: tglx@linutronix.de,
	sboyd@kernel.org,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH] clocksource: Utilize cpumask_next_wrap() to shrink code size
Date: Wed, 11 Jun 2025 18:45:06 +0800
Message-ID: <20250611104506.2270561-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify the procedure of CPU random selection under
"clocksource_verify_choose_cpus()" with "cpumask_next_wrap()". The
logic is still the same but with this change it can shrink the code size
by 18 bytes and increase readability.

$ ./scripts/bloat-o-meter vmlinux_old vmlinux_new
add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-18 (-18)
Function                                     old     new   delta
clocksource_verify_percpu                   1064    1046     -18

Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 kernel/time/clocksource.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index bb48498ebb5a..ab580873408b 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -343,9 +343,7 @@ static void clocksource_verify_choose_cpus(void)
 	 */
 	for (i = 1; i < n; i++) {
 		cpu = get_random_u32_below(nr_cpu_ids);
-		cpu = cpumask_next(cpu - 1, cpu_online_mask);
-		if (cpu >= nr_cpu_ids)
-			cpu = cpumask_first(cpu_online_mask);
+		cpu = cpumask_next_wrap(cpu - 1, cpu_online_mask);
 		if (!WARN_ON_ONCE(cpu >= nr_cpu_ids))
 			cpumask_set_cpu(cpu, &cpus_chosen);
 	}
-- 
2.43.0

