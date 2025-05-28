Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025302222CB
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 23:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748474240; cv=none; b=ginHEf0b0qnglNjSFrdHZP6fpHzF2Y/NedM1uxlWlz68FpKa6Ynv6HEdgItVUkiSfoSoLUQrgIZ+ZcjT39eoDJ/+q+E3mXNanxFis2AVuuCA3JAXg64poktSZ/LkhqDUPcFNPGx4p6Nv8QVZSKCeBgS42C6dlT24pTFkkhQrjyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748474240; c=relaxed/simple;
	bh=XVNjQfh5u92+SvTEjJh8Vit7Er7I1Kh2/fKNBT5Mpa4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OkZoMOy62ZXz64LHPf6Jt0Uupkqr6me2j52myM4jsn5JXV5hJNz7si+QWob5ujC2UGEx9I/h4BCuGDy4o7nncdMZQt03x/bQ354jrSektN7hEZVKdj2870QxTusJ81tUIIxGGbyRdCJ+kg893bmNe4U2z94u4mYpPMecM0AlshA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DO1pgPYz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DO1pgPYz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748474238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aSXeXdcmYX8Y9IqDmsh150V97fGGs3QYwta3R4huo6Y=;
	b=DO1pgPYzx9JjkyBF2KlJUZYXA3zgaIpwYHkgNPAkEv1SxoIul/4jntwncf61nXm2mI4ocv
	W2TQfF9J/kOU0vL+IE4LVFMcjz6GltEWurBa2YSRveNUDp0ygc2H53V17a+VPGrLorck/a
	TLbj7AVY4s4nCN4Oott8Ek2TgdGu6mI=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-QQTG_EsEOZe0bT5VDKLaaA-1; Wed, 28 May 2025 19:17:17 -0400
X-MC-Unique: QQTG_EsEOZe0bT5VDKLaaA-1
X-Mimecast-MFC-AGG-ID: QQTG_EsEOZe0bT5VDKLaaA_1748474236
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e28d0cc0so41066985a.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:17:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748474235; x=1749079035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSXeXdcmYX8Y9IqDmsh150V97fGGs3QYwta3R4huo6Y=;
        b=SO/M3vLVrZ9/Ta5+9KJXS5X2aeEyoqIdgBmDP4pETBC+C8VnU3yUoEtrcFSMKdQvr6
         W4CLeOGxoe+1qUeygksHq1zzg0J+PISLLlpZdt5sKuWh34QeiuIwcDpCm2KtdAnLMVTq
         DbmhV5QWQaRNdnomMqqdKLXkIHauvpyyVP2z+V0A5ZA3294AGHc7cNHQfRJIjbvukta7
         Gdu2oObe8H2VvoukfPhdyVSX9NlInaUUUyulox8f8I9920exeLesaizzb6xE4PXfbt3l
         5IKouh4hQRH5RRR489UpcdntSegHiH76Saytp84pfaIr/q17B3rUyeo8f40WS/SIHuO4
         gCtA==
X-Forwarded-Encrypted: i=1; AJvYcCWRudAi+lzmzH/dDOfeHmTyNKTXS0442boeijD8ApavMkk0NZmGutaxCjADf2AQ2pHpOPTkUlH9m/XW+dg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkcdWS2xwfMmxgA0yl5Nu16uzoS+xRQRv3bjtmeR5t++iavJqi
	bKFyIjQyuiVlA8F/AuBlbdk+rBjJALKQmrycV8gyrdoCP4HGUaAS537RPW1Rhex4nm5Jg1waT57
	cAbUlqy7uggVbWmVQpQZT064wG8WQLH9H0UaBKnNP7SAkBFtu3fxk3z6gKZ7QXjmqQvUsgOAIJX
	Sl7KfFYOOrb9ItQi0YFbkKwJbq8BeQ/TQEW28hfR50vjtW6YBC6Yo=
X-Gm-Gg: ASbGnctbiygiuKhKfiIBRwZUkJ6LP9rspYTzGf9mNH3XFStSnRFchCxb4eb3VemFQMV
	L5zYVAxOtMNbcblpH+pO3FIeRI7volJBfCeTw1esn2Gb3dLTR8o9hICn3QDgcLpDnHeXQ8tBLRU
	Dn+jDibgr2UohTD2xzUn/t17QmPAehAJI1Qv2buzd0m4f/g70Skb3HRblPz/ZI2t/1HOT6xZZ8W
	lFZYh0A7CiV3ih8ToWDKkdmTcrVHE46qxz8diraP4VPTIxJKEqPG3CzKGRKzH+wA2B53oYu/YV/
	WA7LjFN3RWmdIQeTVn0TZ8gwHF1X0KPw0cNY4PnmwlBUftOZug==
X-Received: by 2002:a05:620a:2952:b0:7ce:e010:88bb with SMTP id af79cd13be357-7cfc5d3bea0mr507365185a.22.1748474235756;
        Wed, 28 May 2025 16:17:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwSFnWl5GgnjJ75GC8RDyw54hsvTdQuK5+My1KQMmquMQoA9HIAqQOG1OmkXc2Hohx495R3w==
X-Received: by 2002:a05:620a:2952:b0:7ce:e010:88bb with SMTP id af79cd13be357-7cfc5d3bea0mr507361585a.22.1748474235375;
        Wed, 28 May 2025 16:17:15 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0f984fsm13437985a.43.2025.05.28.16.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 16:17:14 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 28 May 2025 19:16:49 -0400
Subject: [PATCH v2 03/10] clk: test: introduce a few specific rate
 constants for mock testing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-clk-wip-v2-v2-3-0d2c2f220442@redhat.com>
References: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
In-Reply-To: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Alberto Ruiz <aruiz@redhat.com>, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748474226; l=996;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=XVNjQfh5u92+SvTEjJh8Vit7Er7I1Kh2/fKNBT5Mpa4=;
 b=oV+qwanIV17f+J9/DX6p4OuJe3bZHqW52YxbG0IgOyqpnclOSVy3avicQYBUBUGeO4QPJfXL8
 fV4UGR716N4BgJ4XutJRDCF91WKbsfUwWW3h15RWnLPGj9FnIBLMk/B
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

Some of the mock tests care about the relationship between two
different rates, and the specific numbers are important, such as for
mocking a divider.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index f08feeaa3750bc86859294650de298762dea690a..1b34d54ec9c610ffa3e91b06f5a5180e0395e26f 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -24,6 +24,10 @@ static const struct clk_ops empty_clk_ops = { };
 #define DUMMY_CLOCK_INIT_RATE	(42 * 1000 * 1000)
 #define DUMMY_CLOCK_RATE_1	(142 * 1000 * 1000)
 #define DUMMY_CLOCK_RATE_2	(242 * 1000 * 1000)
+#define DUMMY_CLOCK_RATE_6_MHZ	(6 * 1000 * 1000)
+#define DUMMY_CLOCK_RATE_16_MHZ	(16 * 1000 * 1000)
+#define DUMMY_CLOCK_RATE_24_MHZ	(24 * 1000 * 1000)
+#define DUMMY_CLOCK_RATE_48_MHZ	(48 * 1000 * 1000)
 
 struct clk_dummy_context {
 	struct clk_hw hw;

-- 
2.49.0

