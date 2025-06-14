Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BA6156C6F
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 19:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749929301; cv=none; b=JYLLF+K3dNEZcOUBULw2V8+ZFBlwldALCM65LDN2lNuNH5LsqH92nazR01e4gtOggF8K3FEgiWL0sqrL8KH/x1JBo8lND9TinuOlxdK5HZ4mfJBPEGq0TI1krxtIdgelHZnJSjKS75lAiWaw5fl4mXCYlPGhyevm6P5TSWlzBTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749929301; c=relaxed/simple;
	bh=SizSNbyqPo/JS69EBJtKZ/bomwwa+A9Uf4CcrPtpg2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BvHVoVszQj42i+Y1YeA0Kkqm5BHTTwPewgsIKAASEwc+0pW08hC8nZlc6QcGRPN4gMjIYH3H44LaNoJBtYma6oBlyYA7qkrs18Ji1aSKVwL8h5QxSCnlCgyQnpI6w6H6Z1fJ7T8vizH/VpCtMGa8ZvnsBzpdj3Mmn1o5wqqBdhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZ0g2El2; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZ0g2El2"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60780d74c85so4811854a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 12:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749929295; x=1750534095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=68fOdiUmyAKCoZUQg5F0w7gaN+cimM65QH6eVdQ6QRc=;
        b=kZ0g2El2nxXJD4p8HPILTngssntd/E+3TYi6cTJlRv3aVG3pOluGuXv+j+ZXSlvMq1
         BaWDX+F43rh2H4G3umog+eFm2A6DBpUCXwI4H7KRxZeBTDOCk35iXglAvanJXnKCF4hg
         wQd0RYlSYP0Ey4lgJNuJfrAzDXlq0VOtmfVisgJxQk4IyYFlV8NcmKP3bVAUJkLL0+6O
         xm8ENvHw89WMqqnKoNI/xc54KsqVKyRIPein0Td5FSeX624iHBAEfDqqx3na7mXYdLFN
         ZsUU9+URUvqHz1Q9QKNHUXbiiW44S+74AKHcKRhSWXCH3JgiUFXPX83KnjNh5yGj9ld7
         ijfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749929295; x=1750534095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=68fOdiUmyAKCoZUQg5F0w7gaN+cimM65QH6eVdQ6QRc=;
        b=BuUE5Yrv9VFDlI8uxVloks94IG3fu33ONfBMYkGq1Pz9rLVqxMNcR3uElWGPS1PoG6
         p8UrYr4XwSKQZOt8OAXU0kdlIFNl4SAydp1OHp+t/srUdOx+Mj4TOPBCE122dRGaDPZK
         a7ZoanOinsGWUNrBF+0qFGiYfaK3fx4eKoympuLDtG9N/QlelnyXV4R9TnWw3iQ2fDf0
         uCpL2fxXW6zVDUpXi3ynIzrzrSVwDzct3N05x6DlyrK3EaNMyqbUGMZih9S4iLofSK4O
         F5Gx6D1yodm+BO9izguVhIWL47xDx3onbMqDwnwBqM6mtZQ1KD2Xx1kk01pmyBOzdxOr
         ui4A==
X-Forwarded-Encrypted: i=1; AJvYcCXPNUrwlU9889huu+fm5gzDqlTnmJSPf2ybXj4YrcW3VLsPSHD/ygVVjdq/YUlRKHn1UC86/KXbtgDseZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlzxl2UsGY9vigj/xGk6/fGlAjVe5zAaByqq3GqJ8IrejVQu0P
	8SJlCC/elk0/I+f/yfAkbuOHKQ7lR04hNrBQ00aQknwB1sVqHQervOrx
X-Gm-Gg: ASbGncubKga/0Z+jxhOc9xege2LVYmdoOjchjRf0UdVbt1VGsHMAo8elWXgrhIcB2yJ
	C/ak/aS1Nu9H9xO+sJXDRfGGrZ3XtNyRvHJrudQW0yZtQug8U3WQJxRQCgXgSp2SkDs9cJ6EooY
	SOlHl5RO8v6BWs/h5QFe9jygitXDhaf3jDYyhOhNNP4HtThRwIS7VmYXQ+K7O9UXm5CvvYdqody
	F2IqXoxHtGknMnK6opqBmwHRePRfEBNFpwJvVD+vkKXCJyzUu5cKTuxdjxK9Sy4qAidCVz3SRgl
	iWuAQaJAjrSJq96eXsle/YWIxZ6f8AzqfD7I/Fy4NtobNjzBd6Dqk/VfbeEZlJiJfG6Op2kj0Pb
	0
X-Google-Smtp-Source: AGHT+IEvSALCMMU3HxJYJyzsV6w3p1cq0fqCoa3rYrjtiSQRp2H3JnlmU10DxlxChMbcISRNYBbbZA==
X-Received: by 2002:a05:6402:270d:b0:608:cbe7:106e with SMTP id 4fb4d7f45d1cf-608d09d7d7amr2718495a12.29.1749929295015;
        Sat, 14 Jun 2025 12:28:15 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b48d77c1sm3238847a12.19.2025.06.14.12.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 12:28:14 -0700 (PDT)
From: Khalid Ali <khaliidcaliy@gmail.com>
X-Google-Original-From: Khalid Ali <khaliidcaliy@gmail.com
To: tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Khalid Ali <khaliidcaliy@gmail.com>
Subject: [PATCH] kernel/entry: Fix misleading comment in irqentry_enter()
Date: Sat, 14 Jun 2025 19:26:29 +0000
Message-ID: <20250614192729.10760-1-khaliidcaliy@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change irqentry_enter_from_user_mode() to enter_from_user_mode(),
because enter_from_user_mode() function is the one doing the action 
comment indicates.

Signed-off-by: Khalid Ali <khaliidcaliy@gmail.com>
---
 kernel/entry/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index a8dd1f27417c..f49e3440204d 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -224,7 +224,7 @@ noinstr irqentry_state_t irqentry_enter(struct pt_regs *regs)
 		/*
 		 * If RCU is not watching then the same careful
 		 * sequence vs. lockdep and tracing is required
-		 * as in irqentry_enter_from_user_mode().
+		 * as in enter_from_user_mode().
 		 */
 		lockdep_hardirqs_off(CALLER_ADDR0);
 		ct_irq_enter();
-- 
2.49.0

