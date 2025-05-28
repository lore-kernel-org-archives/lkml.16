Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507F1225A29
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 23:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748474257; cv=none; b=WuC12UG8qJzPRgbyaF6FsEiJOPIMHEbgN3OKr6xVwXjPCtZPEZr7jb8N6N1tJVeElpcQ3s+g4IWUEt63DQmqK9KnYG8DILBrN3ZcrrylhcWznkAvOUbo7bVybfCInSkbMVNTliRbRslOkJ0IDjcv+hfZ/Kzexm7pQWyUalPmW+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748474257; c=relaxed/simple;
	bh=2UyuBFVBF7/NqDq+ovnhAtBjPjcIVQGpsNux7ISwlE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JSb29huDVSkZW7aAdzbas29P1dTl51Q9ejKsKOhaespKFfDHuzYF7UpHFiaELkaR2mYCCc3MB2SSKw8COmvV5K1TAmrHfk4tD0OFPnfKyyDxL7ooW2MOOlddBvh9YD4MwvW/2YbwqmIXuJ9wIpE6EcmBNwzrgefP10BB87qed4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EF1Rlnbx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EF1Rlnbx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748474255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=okyJbl6eCklKJGEFMxSh/0mMfugaWDJTFRqMQyNrXMU=;
	b=EF1RlnbxNFBJi1FqRU1vh5ugpElGYwIWEJtCzg/3Ds7lj0vah2gFhK2HjJT4lZS6DO2h0f
	MBqru9QZFS+FL0vQDf1N7lW/IaYKOotvFndd1onbg/8sVAVR3UfgPuMQJeB4IaauW09QMX
	6xlIgdvPqiaY2NQFbQNJub/RIPaqkWk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-pFccm3apPMyYK0QErymYZw-1; Wed, 28 May 2025 19:17:34 -0400
X-MC-Unique: pFccm3apPMyYK0QErymYZw-1
X-Mimecast-MFC-AGG-ID: pFccm3apPMyYK0QErymYZw_1748474254
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5750ca8b2so36886785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:17:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748474253; x=1749079053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=okyJbl6eCklKJGEFMxSh/0mMfugaWDJTFRqMQyNrXMU=;
        b=FMImwM6YYoIGNpj2um+mH42KuNcNM86ovV33YU15At0AZOF2y4w6c+uEAr1BQEcLBq
         BKYrOYvQgEbbwZlHg2M8I5qpkG6UgHW/N1c8xc3HugaWXZdfnPV8dUXY5VqnD3DENKWg
         a6hAc/bwWJhNg2oXXzbpnE/fmEPU39fNgC17IuXC99c/KaWEqAGgI17OGmPSl+tl0k9n
         LNWH1wOkJ/upR9rBns1OLG0nz9Ea1sjMTm50IyC0TYFn5ZYZAW8CF9WXQHNC4Fkt8kH3
         seK6Kyn6Vl6Yn9QCNrApBcM90Dwr1H2GCoAcIrCkVv5c7OrGKAoKsWoxxNPLWJHRoS/6
         Yfug==
X-Forwarded-Encrypted: i=1; AJvYcCUR4IQohnPSIMu2t8XI20GDbq+Ogv2kykRcPjAMGNXTG1RIV871PN9R+e1wkPbZuiJJTndqSLAoMWGgw1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrIEQEWtGHcITWqcQ3Oc9Uo63DdBmA7eflg2jibK9RI9RJZTO3
	tjj7dpTL86/tmCPDuD0QXaTwJWrxazbm4E6SFPuC1Ie99vtcV/G6DGO0L09r5FDbcg+83nW1wZx
	piDR/bg4A2SeslYHuRS3p3WKfa3ipsre3VntILk8qYGGe3XobJsfxRtzv1ZjnZvHU3HP+o/io5W
	+FzbHpq2ZkkXpLBcsDxXy0PkMqcuw9TaEX7ad/kCLmypPjUtcqFU0=
X-Gm-Gg: ASbGncvKTec/BezDA8aDISqBmF9FbRMGTICmQdsMuahVwQ7zCd8GNRSM2w1NXzaxkyg
	snFZNJKmaYSBh2rHA/7Hkh+EQ9MmehOhw3/WQhpg5FQGXNXwhWeMA+5eLA6pWcEDELrn+TzT/rG
	ED0kq4oCXhzFSvElf4yHuSdyfL6/EfyjGEJHToAcndJ46HgzYngZgNvuDhSxITdaTUXuUoodYI7
	+TFUrc6hpdIcDPVQ0f8mIsV9qf3ndDBtdTpO+bLR5ktTHA0Eu6hdPjVv0E4BMcw+8wB2Kn6n1qi
	Taucdf68frdc1Vi+KlmmyHFv3fd+opAx3yZ4iVhMNeHNRpvISg==
X-Received: by 2002:a05:620a:4899:b0:7ca:c63c:c59b with SMTP id af79cd13be357-7d09ab36c8amr24491085a.22.1748474253193;
        Wed, 28 May 2025 16:17:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMv4olD6L+xEmV4YMpNnuWUk2AHunM4ENQ0bxRwPeD/SXi2QqhHhGJN0RkQf4JyV0HIRpzQA==
X-Received: by 2002:a05:620a:4899:b0:7ca:c63c:c59b with SMTP id af79cd13be357-7d09ab36c8amr24486385a.22.1748474252630;
        Wed, 28 May 2025 16:17:32 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0f984fsm13437985a.43.2025.05.28.16.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 16:17:32 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 28 May 2025 19:16:56 -0400
Subject: [PATCH v2 10/10] clk: test: introduce test variation for sibling
 rate changes on a gate/mux
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-clk-wip-v2-v2-10-0d2c2f220442@redhat.com>
References: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
In-Reply-To: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Alberto Ruiz <aruiz@redhat.com>, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748474226; l=2565;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=2UyuBFVBF7/NqDq+ovnhAtBjPjcIVQGpsNux7ISwlE4=;
 b=5fozoClZaz3cF6k4P4348t7plBzvForrhLSMk0Pp0guJb4WPQJlBDPhK0JHbk/o6+gBWT/w/0
 ej3nCkgUHHFCW2CQldcwiDaZlKZM5RiBeuoM38YlJDqfNV3RHJuEBIh
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

Introduce a test variation that creates a parent with two children: a
gate and a mux. Ensure that changing the rate of the gate does not
affect the rate of the mux.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index b5cf0de16abd1e098368a67626fff9044f7a1a6a..c5b856e224f057b011b095d998ca3016b6a041a8 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -946,6 +946,48 @@ clk_rate_change_sibling_div_mux_test_init(struct kunit *test)
 	return &ctx->clk_ctx;
 }
 
+struct clk_rate_change_sibling_gate_mux_sibling_context {
+	struct clk_dummy_gate child1;
+	struct clk_multiple_parent_ctx child2_mux;
+	struct clk_test_rate_change_sibling_clk_ctx clk_ctx;
+};
+
+static struct clk_test_rate_change_sibling_clk_ctx *
+clk_rate_change_sibling_gate_mux_test_init(struct kunit *test)
+{
+	struct clk_rate_change_sibling_gate_mux_sibling_context *ctx;
+	int ret;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return ERR_PTR(-ENOMEM);
+	test->priv = ctx;
+
+	ret = clk_init_multiple_parent_ctx(test, &ctx->child2_mux,
+					   "parent0", DUMMY_CLOCK_RATE_24_MHZ,
+					   "parent1", DUMMY_CLOCK_RATE_48_MHZ,
+					   "child2", CLK_SET_RATE_NO_REPARENT,
+					   &clk_multiple_parents_mux_ops);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ctx->child1.hw.init = CLK_HW_INIT_HW("child1",
+					     &ctx->child2_mux.parents_ctx[0].hw,
+					     &clk_dummy_gate_ops,
+					     CLK_SET_RATE_PARENT);
+	ret = clk_hw_register_kunit(test, NULL, &ctx->child1.hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ctx->clk_ctx.parent_clk = clk_hw_get_clk(&ctx->child2_mux.parents_ctx[0].hw, NULL);
+	ctx->clk_ctx.child1_clk = clk_hw_get_clk(&ctx->child1.hw, NULL);
+	ctx->clk_ctx.child2_clk = clk_hw_get_clk(&ctx->child2_mux.hw, NULL);
+
+	return &ctx->clk_ctx;
+}
+
 struct clk_test_rate_change_sibling_test_case {
 	const char *desc;
 	struct clk_test_rate_change_sibling_clk_ctx *(*init)(struct kunit *test);
@@ -960,6 +1002,10 @@ static struct clk_test_rate_change_sibling_test_case clk_test_rate_change_siblin
 		.desc = "div_mux",
 		.init = clk_rate_change_sibling_div_mux_test_init,
 	},
+	{
+		.desc = "gate_mux",
+		.init = clk_rate_change_sibling_gate_mux_test_init,
+	},
 };
 
 KUNIT_ARRAY_PARAM_DESC(clk_test_rate_change_sibling_test_case,

-- 
2.49.0

