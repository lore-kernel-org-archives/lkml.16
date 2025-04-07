Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1870F25486F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 13:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744031609; cv=none; b=ZQTjYadDecaJQS6yHzSwmoDVAnWOaWMJZeab9NHdsB4v0xydp+WLZVQSxAzrpOy8rPJdAKbqGZ5oEdattnXEcss7eODMC7WG5+dpr2d2as9UXaKoKGHYB5/FjvcFwWxbxosMRyghjcDvIJHI4gFyjf5I2xl+bYLVtOfNgIKBh04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744031609; c=relaxed/simple;
	bh=cINZpHs1181ZZIfn0v+Bqs6Xi6sKYwzvG+kUmnvZOgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=ML6h3JZiwg3Q29EAhWQzPcicPoPYKgjLGUO1xmqkwsTmDO3tZ8l7sYI84sLQf5WEjxfr2dd1bOLvSwHbOXF9A3Q07dgpC4Gjcl3YRgTKGVmkNfUznmCsRVahVxzrOdXnVE9ui5CGFb7HJCIdQe2MU/AiUOK+hvvk3s6JnRwnJhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NA9Lq7C4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NA9Lq7C4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744031607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kMB86ctjcybiwuXbvZXBElgp1Cu7q2l6feChD2s1BJ0=;
	b=NA9Lq7C4cE8gAIkQfaq9LQHJG5SHQNO77uMytoGqO1Mozjz1v+bgpHVkLDiNwpYTkl83Jo
	HooJQE/FLh9MSDmZl5shO8X7ZxKRVyUT6ruhebWjLJcH4xZTzV6XMY/S93Qypw5Y+jMoUO
	PIGcw2hCNO0Vu4pDhFJJ+eV/yaaJwbc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-9o1eidWtMG26ZXV113F8jw-1; Mon, 07 Apr 2025 09:13:25 -0400
X-MC-Unique: 9o1eidWtMG26ZXV113F8jw-1
X-Mimecast-MFC-AGG-ID: 9o1eidWtMG26ZXV113F8jw_1744031605
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c57f80d258so1469666585a.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 06:13:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744031605; x=1744636405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kMB86ctjcybiwuXbvZXBElgp1Cu7q2l6feChD2s1BJ0=;
        b=FxJP5Ywuwqws3V+NjhDEJMCnA3TdYVQ1XmxQ/QIEBNjpoPRwaZqsHD2C13COdJuqmy
         2viQJzMw1hVeHc1ieuLqwYugW9pSMpP/4XqlMibFEx3OAgWWxdX0fRnINUJhO3lRiJ1M
         lUF+YQG66pV9YrrHUly511+6WeocDvEXB5OfH3gO3UmGhy2o3SQ4Le906IW/JNJnv8Hi
         1bUWg3kMR9WK5aU5oR4rKgXjndF0tKo8QyLgi7Kn4oufSeWldksWxowo7vMbi5QHjwDa
         EdVoVFdpd6uKxUBt7oNbpjuDI0rwuGxuyD46afym7oaWoTpP6SVGUqQov7+fF2dpOmMh
         NVNg==
X-Forwarded-Encrypted: i=1; AJvYcCVKq//wUN1fqfGAuSjUHuoqNcykqoetprI5kHzbbKBK5DxEtIihoLwPJAyJmM2QhONJJXPQxQDLwa5AiR8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnn0b0EQlivXpN1O7tXzrybzoAAnpWBEEJ85G+saZP56ALIVxy
	GXHl7fnwUjgjoyQqQCKuj8yyXfKbk5e8fvjxbkstpF8m79+TZX10q/0pKaIp80HByiktpwDcW49
	m7QbBJWDrXTfQ1i4f50adD7YvOBcRxHJiTBUVAhTBaU+A/nKaAwG+pfWRYpSGYg==
X-Gm-Gg: ASbGncv33rEIx0aEMj6CCIR8dUNhfl7wIAN0TMzw1B7QMmfB5mtw8/A3BBl9iF7akEg
	pir0KAw46RQ6zeXwzvnk0Jvp4CqhBO6dSlwLfZIU94+9NopWHhYuHG3+7Hq5MQ1Gh/KrpyT+jhd
	6qcQzAG2ZaM8m9ai1PSlYp7U1td1AOv9p3ygIsXCx459KhhwYXevWoJafcArnZ49qKwCH59skAE
	9M+EVNDs7TdX7ZW8WOTUu/fD49KTbreYZ34gYTnn+CVm1gQynFScmdHcJUsUde+D5jA+2s0Q/Nr
	RjbWwvpphaaSwUYgh6W3DgsJas6wzVfCIswUJ6VpEw==
X-Received: by 2002:ad4:4ee2:0:b0:6d4:1ea3:981d with SMTP id 6a1803df08f44-6f01e79adabmr204619006d6.43.1744031605307;
        Mon, 07 Apr 2025 06:13:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqafTGStLaTMqYGR4+6zlBqYN2im0YRpTHE40qDR5UH6vvMiQFkULd23bOD87HuJxEejDCHw==
X-Received: by 2002:ad4:4ee2:0:b0:6d4:1ea3:981d with SMTP id 6a1803df08f44-6f01e79adabmr204618516d6.43.1744031604938;
        Mon, 07 Apr 2025 06:13:24 -0700 (PDT)
Received: from x1.. (c-98-219-206-88.hsd1.pa.comcast.net. [98.219.206.88])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f138e15sm57662556d6.82.2025.04.07.06.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 06:13:23 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: sboyd@kernel.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mripard@redhat.com
Subject: [PATCH 7/8] clk: test: introduce test variation for sibling rate changes on a mux
Date: Mon,  7 Apr 2025 09:12:57 -0400
Message-ID: <20250407131258.70638-8-bmasney@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407131258.70638-1-bmasney@redhat.com>
References: <20250407131258.70638-1-bmasney@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

Introduce a test variation that creates a parent with two children: a
divider and a mux. Ensure that changing the rate of the divider does not
affect the rate of the mux.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 46 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index d72ce0226dc7..97909caa71b2 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -900,6 +900,48 @@ clk_rate_change_sibling_div_gate_test_init(struct kunit *test)
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
@@ -910,6 +952,10 @@ static struct clk_test_rate_change_sibling_test_case clk_test_rate_change_siblin
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

