Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432A17F7FC
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 23:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748474255; cv=none; b=HcpKVOH2oTmkBGkFc5HTW3SN/jdnDzAdzyGVwlMqDZ9wdRP8ksL9g4HmuX9Z4Q5GoiNOz1oZZ2vTg44GAVhdsJWkfJ9XYOYlfV0btgP8653fD0+pVpQMPX+geiEEMX8vl08s/h9Ne4frwTeXQeaUw3tDu4hdoSFlqIwxzYdZX24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748474255; c=relaxed/simple;
	bh=sQ+5ETviPsufC2rC/jxYhJ16ZkKYEBNOFVNqjLFU4VM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rMM41Go3TXEXlJQnTZiZdfkUO3yuUPfogMcauoXxaMurWPu4eU4r/ID+aOsxbZu6pa5BQy5g0MKaOkzEp6Ew89RsWqoUpKxeZmkFRD+a+rlVzrvMf3O/S1pLCg55C/3vwHulpRiQ4HhjbizmsRhGOLdYv05Wiy8VOGCrEDKZTKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K2Y5uzkt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K2Y5uzkt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748474253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UoCPU8m3g0MY3zvVnMAX+QdRxdLJGM4GIE5nlW4Y3SY=;
	b=K2Y5uzkt0+8LLreV28Q+9ZITD6KuGriSANSEk3HRO0HVX16ESmGvayRaTJNEyZGIGzmJz4
	akuNexcLdIMBl63d7TsIXk14qI2JTROTG3W4SN+n03fOkttSJdHE/N4s2k5bZOPKR1o0i4
	rgyQM/U/OviXBDlAo4iY8WLQevL8zC4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-wuqjd2kFNlOGJYAWEsoE4Q-1; Wed, 28 May 2025 19:17:32 -0400
X-MC-Unique: wuqjd2kFNlOGJYAWEsoE4Q-1
X-Mimecast-MFC-AGG-ID: wuqjd2kFNlOGJYAWEsoE4Q_1748474251
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c791987cf6so50063185a.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:17:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748474251; x=1749079051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UoCPU8m3g0MY3zvVnMAX+QdRxdLJGM4GIE5nlW4Y3SY=;
        b=Xw0EygrByhaiEmSplQ2KqQ4wXHtdCY5PeQ9MtRK/lxDSZhSRsGnvShZBE/5/7EzSpO
         CChbr0gnX5rzBah7VE+2zA/k8/ALETmioXNRi9snKHOF4cQQqiunhnwxSc3FuzPRbnQM
         yKPaVppnQTGxWdT855ghvyON9MUr2wPXT/mX+GsiEnRRbgX9Ttr1KaLmkVZ2H+vQnRNI
         TdznqvBLkSmZ9S8+62Lo9X06wTbdD1ju+g6C07qLI46FJ61DYW0PaKwnU/I3SWlsOdUB
         o0k0FJluIZIuoOzgIaeILk2nZSHwyMZjqKipv+GP0d3O3QTxLjH11Nojsr3TDMqeP3mn
         QnAA==
X-Forwarded-Encrypted: i=1; AJvYcCXWvOGToSSJqJOPbIEI2ZlNmH9aTVn6vxNFNM4PpsBB6/GjVY2WRH4o2EyJlO5aS30Jnrix3K7PYw/MU5M=@vger.kernel.org
X-Gm-Message-State: AOJu0YznSKgZ5kBP20nThMH014f+XIozaxy3kLkbw0SSoofrFFQKtldk
	JHHRbg4XRd2YTv4JQb6vkO0ojDKURWHyz39Pv6Pq5owpM4CKrtJKzeNnDoWNMopmPAhPNr0/Nwd
	iy8rO6flZomMJWjfRP4JLEd1+1PDlIBDT4Vf5MSdLRcmyTXoGFXhhjWm3QiAla8G0BzIWP81qRl
	kKQP3H83+UVAlPY5/eCtakXXArDtK5/lJP4434cHExnZglEI6PNXM=
X-Gm-Gg: ASbGncuLLJl5RcE7IRO+ndW03fvtfPQZRDG4HX+N1eK51IHR7Ih5yZwH+gGjDKFtFbj
	riycqqKPjsHAthYW4ki4goiPDfKXCAz4fmtpntdAHVKjO12NJv0Po3wJ8hp4xOBu5wa/u48Gif4
	iYqwdgAilF2JqdLUim0+bweFm4eHbXyYi4vILvl/A14zeIpYYP/gmCsAllGtOxwxaAjDgkFkxC1
	8WEUcnhOWGHB55uVtOtl+GFfIEE25/xxVlajCpAa+IReSWO7Kdouvz4TZWguiAFmJwKB52mkCIU
	xfZ6lhgkhmUH1fp0xKma9wkLUkbx+GIXB228XhHQPOlF55EZ/A==
X-Received: by 2002:a05:620a:2682:b0:7ca:cb02:7942 with SMTP id af79cd13be357-7ceecba4556mr2609130685a.1.1748474250832;
        Wed, 28 May 2025 16:17:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvTpkkJ9DU5JLRmwa8tguJ3IJoZtmoauvr0XQSfD/ieT9Sm6WTM94sv1t5e4G4Mp1o2SEv1g==
X-Received: by 2002:a05:620a:2682:b0:7ca:cb02:7942 with SMTP id af79cd13be357-7ceecba4556mr2609127085a.1.1748474250477;
        Wed, 28 May 2025 16:17:30 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0f984fsm13437985a.43.2025.05.28.16.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 16:17:29 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 28 May 2025 19:16:55 -0400
Subject: [PATCH v2 09/10] clk: test: introduce test variation for sibling
 rate changes on a mux
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-clk-wip-v2-v2-9-0d2c2f220442@redhat.com>
References: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
In-Reply-To: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Alberto Ruiz <aruiz@redhat.com>, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748474226; l=2566;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=sQ+5ETviPsufC2rC/jxYhJ16ZkKYEBNOFVNqjLFU4VM=;
 b=ChBC/ilvuXXJXRyiziNjnFOkucSkSvvLHNZzLHSQQdueZGY9aWrJAP9J9NkBCRVXMyUsjqlxk
 THzafP5HRIGAFYJKQKPa6Caxb9n9anfpeIxZbJB4un1a6UdrxCEo9d1
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

Introduce a test variation that creates a parent with two children: a
divider and a mux. Ensure that changing the rate of the divider does not
affect the rate of the mux.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 147935975969f8da4a9365c0fac6ffe37e310933..b5cf0de16abd1e098368a67626fff9044f7a1a6a 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -904,6 +904,48 @@ clk_rate_change_sibling_div_gate_test_init(struct kunit *test)
 	return &ctx->clk_ctx;
 }
 
+struct clk_rate_change_sibling_div_mux_sibling_context {
+	struct clk_dummy_div child1;
+	struct clk_multiple_parent_ctx child2_mux;
+	struct clk_test_rate_change_sibling_clk_ctx clk_ctx;
+};
+
+static struct clk_test_rate_change_sibling_clk_ctx *
+clk_rate_change_sibling_div_mux_test_init(struct kunit *test)
+{
+	struct clk_rate_change_sibling_div_mux_sibling_context *ctx;
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
+					     &clk_dummy_div_ops,
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
@@ -914,6 +956,10 @@ static struct clk_test_rate_change_sibling_test_case clk_test_rate_change_siblin
 		.desc = "div_gate",
 		.init = clk_rate_change_sibling_div_gate_test_init,
 	},
+	{
+		.desc = "div_mux",
+		.init = clk_rate_change_sibling_div_mux_test_init,
+	},
 };
 
 KUNIT_ARRAY_PARAM_DESC(clk_test_rate_change_sibling_test_case,

-- 
2.49.0

