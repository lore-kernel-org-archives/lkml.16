Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476A627FD5B
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 12:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746535608; cv=none; b=J1y1iyqEmXq1VZ6IAT1IsjvMQhJvYYFIW+A7uXfqzkY+uWbtaLseLPFUnWa0y5+Gy9dyTFKF6k58PzDPq4I3W6LkkkI0XnhQz1UN7T14ncBW5G7dhKcPeQV/f9Q5VtWlul0w2vG27MsW4rp8i0vEgD2PIPDCNEttWQneZ6Kw2c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746535608; c=relaxed/simple;
	bh=PJOB22Kv3PJwwTTW6D5ax3TpHEhXSzaZpTr6rXL+klk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JiwN8gJ/UZepcLCvbTjHqFQmcmQ70Vvyqs/QZlZywTw5JR+vCobMH55fHOHcV7Up1WIFjjfIWHFlKy2X5A88fJGUz/ufZAqJ+RbaozVwPvO/NbYkvZuSj5kGxHcKG3lXtqxTnWR8CaKWNfIzT+UkBS5jRt/3yKxyXMt88/CKzSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4piL0F1; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4piL0F1"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-736a72220edso6200363b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 05:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746535606; x=1747140406; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rWBrjH6js2nFce+bLoPB/th2NWEOtvdRjUhQW1smgG0=;
        b=V4piL0F1AQ6vW2NXXPMJhvpNNAof+y6Ug2gYoafRhxGptO8+ANrpgJfXgMjuDWVRsg
         cv+2h069WY7PQYmZvMn3d3TYdeloZViNNWzINY5tMrfUkfe4zyxwkHJHxDIVmPqQ7Lv7
         jTHLAGwLQRL6YwekHuTPShoes9e4Q3CXn2za9a+sRgNDtL83+9VikoNOF3xGtUzC2nDx
         OW0QyyL4wyp0/VEsXO6UiwKLpxroNpShbETcKBFR9e0ClhyX7CyVWvxapxpvh26ViC5s
         ypicOmSu3C7dekbTIwROHPg4l3yPBLqBQ06tg8G/vUFQidPvm/LXxSe4rXDi0XkdFGz0
         JnqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746535606; x=1747140406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rWBrjH6js2nFce+bLoPB/th2NWEOtvdRjUhQW1smgG0=;
        b=aDlmMz1ghZf3xAteIiM/MU7bAvKJ9m5pV4xOfSds88R2MX5Aas9m67pfxK/Hq3mZfq
         B7REmfLtmNlY1rc/q3SjG7tjVxlxbTXvA9UWdo2UFo2ZDuQeJ2pfNH2cy/EKJcWQYSks
         Jlw8aHoC4Ol4r6sR6w/QgRLXCN2uJCx3pPoDqe4b1Om7AaW2+nWp0US256G5dwnBL2tK
         ibBQM4gaLyXSsI4YTT1UOXNGHw8q+0jiT2/CRsyWNvgDry9yEkjYuJM88gTU/XFFEl1O
         DW9kaee+B0McQWN6AuiW/IA7OY0zIpJgy+ifGsAQNM7OM2zp6HSy4jQfLTwTGWvNXcuF
         qBdQ==
X-Gm-Message-State: AOJu0YyRT3tLPNB33OI207UfbzKcXBvaK92t34yaeUk76mjoxhukHu5S
	s/dp/FD+6aExhz1z53hYQ6QKEaV94SzqiOj08Vb6VQrfB8n+JADXTOFO9dbhBYI=
X-Gm-Gg: ASbGnctNGYTum3MBzJlcAsVV5wYHK1FvNHqi7I04gJ9jd3X3f1iHiOT48z5Z680LAVz
	tpPhTY5B330bw9+mxrt5LKNwLQD+AKF+bv6p6i5Rau2kXLRq8q5+rUARSuEQbV81zjS1fYzLRjP
	p6afiEUumuWWMnEOaFPo5WH9mJsKDY0qd4u78FRJ48Sf2F78iNDg3yoA7vevDGpp2JTBnHn3i5b
	Nbm+fM5FegWMlnV+xHJU1MMulsFSNMlDCe3RDk67sDDrngv7JmIH5EaoHoCzw1tdzaQWL0v7fk7
	FPeHqiMGFsRZSQaMz0gyOFn6tK7Vi9MCJ58em9TKy71UL2QAr7NN
X-Google-Smtp-Source: AGHT+IH/s+XBsMtzUorpno5+btU8tbMk6Pgcbuceq94+SH6/HsF1kgmbs7irvdW0hiZ7S7FOSD+ohQ==
X-Received: by 2002:a05:6a00:8c05:b0:736:eb7e:df39 with SMTP id d2e1a72fcca58-74091b01025mr4069318b3a.24.1746535606545;
        Tue, 06 May 2025 05:46:46 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405909cd89sm8756817b3a.169.2025.05.06.05.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:46:46 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 06 May 2025 16:46:16 +0400
Subject: [PATCH v2 3/5] irqchip/irq-vt8500: Don't require 8 interrupts from
 a chained controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-vt8500-intc-updates-v2-3-a3a0606cf92d@gmail.com>
References: <20250506-vt8500-intc-updates-v2-0-a3a0606cf92d@gmail.com>
In-Reply-To: <20250506-vt8500-intc-updates-v2-0-a3a0606cf92d@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746535586; l=1330;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=PJOB22Kv3PJwwTTW6D5ax3TpHEhXSzaZpTr6rXL+klk=;
 b=ebUFwm60fraNvK1soHQF8KMtUOBLXbLoIcTJcRuJhyhljahIxR6s5gtd6hwd7GoMT/J2X0wbr
 OmU0eGtaMAABxwJdxIutML/sEKvaGKdzg4Cm90iQsYx8qNqq//H9EwJ
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

VT8500 chained controller can route its interrupts to either or all
of its 8 interrupt outputs. Current code actually routes all of them
to the first output, so there is no need to create mappings for all
eight.

Drop redundant checks, and only map as many chained controller
interrupts as are defined in the device tree.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/irqchip/irq-vt8500.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-vt8500.c b/drivers/irqchip/irq-vt8500.c
index 6d46e1a0fda953d76679ad2318674fdf0a977f0b..cf24a88f52d1b90f033d429288c88398439b92d1 100644
--- a/drivers/irqchip/irq-vt8500.c
+++ b/drivers/irqchip/irq-vt8500.c
@@ -220,16 +220,9 @@ static int __init vt8500_irq_init(struct device_node *node,
 
 	active_cnt++;
 
-	/* check if this is a slaved controller */
+	/* check if this is a chained controller */
 	if (of_irq_count(node) != 0) {
-		/* check that we have the correct number of interrupts */
-		if (of_irq_count(node) != 8) {
-			pr_err("%s: Incorrect IRQ map for slaved controller\n",
-					__func__);
-			return -EINVAL;
-		}
-
-		for (i = 0; i < 8; i++) {
+		for (i = 0; i < of_irq_count(node); i++) {
 			irq = irq_of_parse_and_map(node, i);
 			enable_irq(irq);
 		}

-- 
2.49.0

