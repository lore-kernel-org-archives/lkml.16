Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F32825487D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 13:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744031608; cv=none; b=Qv94H5cfcde54K813ffDh/ga2vNNsHDmPqYbVztm83gN8Jah4M09+jxnaVnV1Q803VxqIakHyTwatUsZTfYhk+NX6xzSEN5hV6SyqwEO29E86mDBD8r89eNN04yNkzFmv0QR+3jzsA7nl3K/ofHNET0XX9nvZbOuONPOAFqP/F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744031608; c=relaxed/simple;
	bh=19xZqCbMrxhaSVg4THIIDnGeA1aclB846rauCeJXklE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=jySlUl1Fi6PA254UZAsk/paJJIkY5L+nZhY1glYv53t3oNivhJ2UYO2OcTTblB9aLhX2vc5RpXjsE5m6TZ7kRNxXjhzfNctxE79OO9jQYrvkfAjV32M/GBMBPUckip/Y1lcF65RAWuZiUxCGqV8YEtO+BrAlEmxi5oLkAYRAG7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iyBox8sg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iyBox8sg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744031605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2LwcXXpdL89K8CifyOieLXHCWhlyVVIdRdeG/nxs+w4=;
	b=iyBox8sgtZ5+t4DKOAW0Lr6GwdF8pbVaPIEyhH1S7d/UGByG26gpvU34mDVAKiUGb3CCT+
	BiF8jgoZaNhQbDCaCeL1d7+OQLhA0so87IWJ96jQ47lUjLBUSKpgRismenmQ6EBUeXc7/7
	rMc6amNX1Pyms4FbrC2L/fOLMRYENzM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-WO-caYV-OHeAZQvTg410DQ-1; Mon, 07 Apr 2025 09:13:21 -0400
X-MC-Unique: WO-caYV-OHeAZQvTg410DQ-1
X-Mimecast-MFC-AGG-ID: WO-caYV-OHeAZQvTg410DQ_1744031601
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6ed16cc6e39so88712426d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 06:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744031601; x=1744636401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2LwcXXpdL89K8CifyOieLXHCWhlyVVIdRdeG/nxs+w4=;
        b=Z2taEa26sKAAMb9gtn2BW6VjSvs5z8DIE0cdG8RekV/vRKpJbcr5UQU9Dx7XaTXPOe
         fqMyeTZCT7bJf5RXWWEvSjnIrWe3Hhkji6GsE6j45IDIH8i6+tdbWmA/TiYDHymH9gWm
         bAr2pHlY162tCELXSs6XM5pgl9CQ7GtEW+JueWD+Wix0VMV4paPB46t3mGdBAKpr+hYx
         7bJmmMnAW3Icj0w1TkdM7EC5jzlev+GGCkO4V1DQLwcpyebyvIVecvaK6SELMWbvMz8I
         j8b66sHq3pqcT+Pc5LSpnXhACPcbFoRGvxeqzIE7VtACiA9ZJjFh+rKZMVIuTOo8RAMY
         stwg==
X-Forwarded-Encrypted: i=1; AJvYcCX2SO99O4qkEiP699nImkoaJ803YjSuGoVBqD1sJwQx+c4igjLNOoGsPK98J/xtoT7WPijK4IvPvyzUcUo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkIa8UWeNT/qnH2SKFVoyk8S/aNAf7tP5IoLbmq0eLLbfzu+GU
	8G6Ve00osWMJGCsZfF09eMeHn2q8mQrUlrFW6l4iVq+d4yXXKlkVyB7/l7YaKkp97qQD95RReFc
	MsUVStPC624xHgfFQt4mmf4SQqPaQ9nixzrDUCJQVsuDUi3c3NKqeMsiKHT8LiA==
X-Gm-Gg: ASbGnctMWFm3bscVjj4ZhEesKaPZ2GzKAgyr4pnKxeCoujqS/JoDdugS8hWFDdlggmB
	ZPyktOUGwr1g1FvgZ6yPiXvH+fXpin+cgcvgW9B5n1ZRfokzbF0Y204aA9sAZLhlOijkLZfRqkj
	3uO8yj+dvdRFXnhp4HyJv9sAKJzQq7uC3V+sWAF21JsaeZpBBoGLQEpqgVZfphoBNXqyQpczXyx
	aDpcozW8HdaoPtJIAHaVuaarmmSE/CF02NLQ8nOrg/TRohGseK90QZRV+VK5kZe63obn8HZGujb
	ZmSLi5jXJsW0LBbw+Nj7mas/zqnY4QJAfmJ/6ErFQg==
X-Received: by 2002:ad4:5ba1:0:b0:6ee:b77c:7dbe with SMTP id 6a1803df08f44-6f058433cecmr192715526d6.12.1744031600703;
        Mon, 07 Apr 2025 06:13:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbIcdTOZ9gWbu8ai03fhRZZ0ayJGUGd9p13kqveI+0V3okeGBC6eJdQ6jZSyZ9kK0gTCIo5w==
X-Received: by 2002:ad4:5ba1:0:b0:6ee:b77c:7dbe with SMTP id 6a1803df08f44-6f058433cecmr192715266d6.12.1744031600409;
        Mon, 07 Apr 2025 06:13:20 -0700 (PDT)
Received: from x1.. (c-98-219-206-88.hsd1.pa.comcast.net. [98.219.206.88])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f138e15sm57662556d6.82.2025.04.07.06.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 06:13:18 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: sboyd@kernel.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mripard@redhat.com
Subject: [PATCH 5/8] clk: test: introduce test suite for sibling rate changes on a gate
Date: Mon,  7 Apr 2025 09:12:55 -0400
Message-ID: <20250407131258.70638-6-bmasney@redhat.com>
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

Introduce a test suite that creates a parent with two children: a
divider and a gate. Ensure that changing the rate of one child does
not affect the rate of the gate.

Some of the tests are disabled until the relevant issue(s) are fixed in
the clk core. This is also implemented as a parameterized kunit test
since additional test variations will be added.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 156 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 14ae88df5389..df5d4b25aa69 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -821,6 +821,161 @@ static struct kunit_suite clk_rate_change_sibling_div_div_test_suite = {
 	.test_cases = clk_rate_change_sibling_div_div_cases,
 };
 
+struct clk_test_rate_change_sibling_clk_ctx {
+	struct clk *parent_clk, *child1_clk, *child2_clk;
+};
+
+static void
+clk_test_rate_change_sibling_clk_ctx_put(struct clk_test_rate_change_sibling_clk_ctx *clk_ctx)
+{
+	clk_put(clk_ctx->parent_clk);
+	clk_put(clk_ctx->child1_clk);
+	clk_put(clk_ctx->child2_clk);
+}
+
+struct clk_rate_change_sibling_div_gate_sibling_context {
+	struct clk_dummy_context parent;
+	struct clk_dummy_div child1;
+	struct clk_dummy_gate child2;
+	struct clk_test_rate_change_sibling_clk_ctx clk_ctx;
+};
+
+static struct clk_test_rate_change_sibling_clk_ctx *
+clk_rate_change_sibling_div_gate_test_init(struct kunit *test)
+{
+	struct clk_rate_change_sibling_div_gate_sibling_context *ctx;
+	int ret;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return ERR_PTR(-ENOMEM);
+	test->priv = ctx;
+
+	ctx->parent.hw.init = CLK_HW_INIT_NO_PARENT("parent", &clk_dummy_rate_ops, 0);
+	ctx->parent.rate = DUMMY_CLOCK_RATE_24_MHZ;
+	ret = clk_hw_register_kunit(test, NULL, &ctx->parent.hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ctx->child1.hw.init = CLK_HW_INIT_HW("child1", &ctx->parent.hw,
+					     &clk_dummy_div_ops,
+					     CLK_SET_RATE_PARENT);
+	ret = clk_hw_register_kunit(test, NULL, &ctx->child1.hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ctx->child2.hw.init = CLK_HW_INIT_HW("child2", &ctx->parent.hw,
+					     &clk_dummy_gate_ops,
+					     CLK_SET_RATE_PARENT);
+	ret = clk_hw_register_kunit(test, NULL, &ctx->child2.hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ctx->clk_ctx.parent_clk = clk_hw_get_clk(&ctx->parent.hw, NULL);
+	ctx->clk_ctx.child1_clk = clk_hw_get_clk(&ctx->child1.hw, NULL);
+	ctx->clk_ctx.child2_clk = clk_hw_get_clk(&ctx->child2.hw, NULL);
+
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->clk_ctx.parent_clk),
+			DUMMY_CLOCK_RATE_24_MHZ);
+
+	return &ctx->clk_ctx;
+}
+
+struct clk_test_rate_change_sibling_test_case {
+	const char *desc;
+	struct clk_test_rate_change_sibling_clk_ctx *(*init)(struct kunit *test);
+};
+
+static struct clk_test_rate_change_sibling_test_case clk_test_rate_change_sibling_test_cases[] = {
+	{
+		.desc = "div_gate",
+		.init = clk_rate_change_sibling_div_gate_test_init,
+	},
+};
+
+KUNIT_ARRAY_PARAM_DESC(clk_test_rate_change_sibling_test_case,
+		       clk_test_rate_change_sibling_test_cases, desc);
+
+/*
+ * Test that, for a parent with two children and one requests a rate change that
+ * requires a change to the parent rate, the sibling rates are not affected.
+ */
+static void clk_test_rate_change_sibling_1(struct kunit *test)
+{
+	struct clk_test_rate_change_sibling_test_case *testcase =
+		(struct clk_test_rate_change_sibling_test_case *) test->param_value;
+	struct clk_test_rate_change_sibling_clk_ctx *ctx;
+	int ret;
+
+	kunit_skip(test, "This needs to be fixed in the core.");
+
+	ctx = testcase->init(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), DUMMY_CLOCK_RATE_24_MHZ);
+
+	ret = clk_set_rate(ctx->child1_clk, DUMMY_CLOCK_RATE_48_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_GE(test, clk_get_rate(ctx->parent_clk), DUMMY_CLOCK_RATE_48_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), DUMMY_CLOCK_RATE_48_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), DUMMY_CLOCK_RATE_24_MHZ);
+
+	clk_test_rate_change_sibling_clk_ctx_put(ctx);
+}
+
+/*
+ * Test that, for a parent with two children where one requests an exclusive
+ * rate and the other requests a rate change that requires a change to the
+ * parent rate, the sibling rates are not affected.
+ */
+static void clk_test_rate_change_sibling_2(struct kunit *test)
+{
+	struct clk_test_rate_change_sibling_test_case *testcase =
+		(struct clk_test_rate_change_sibling_test_case *)(test->param_value);
+	struct clk_test_rate_change_sibling_clk_ctx *ctx;
+	int ret;
+
+	ctx = testcase->init(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	ret = clk_rate_exclusive_get(ctx->child2_clk);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), DUMMY_CLOCK_RATE_24_MHZ);
+
+	ret = clk_set_rate(ctx->child1_clk, DUMMY_CLOCK_RATE_48_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_GE(test, clk_get_rate(ctx->parent_clk), DUMMY_CLOCK_RATE_24_MHZ);
+	/* child1 is rounded to the closest supported rate */
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), DUMMY_CLOCK_RATE_24_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), DUMMY_CLOCK_RATE_24_MHZ);
+
+	clk_rate_exclusive_put(ctx->child2_clk);
+
+	clk_test_rate_change_sibling_clk_ctx_put(ctx);
+}
+
+
+static struct kunit_case clk_rate_change_sibling_cases[] = {
+	KUNIT_CASE_PARAM(clk_test_rate_change_sibling_1,
+			 clk_test_rate_change_sibling_test_case_gen_params),
+	KUNIT_CASE_PARAM(clk_test_rate_change_sibling_2,
+			 clk_test_rate_change_sibling_test_case_gen_params),
+	{}
+};
+
+/*
+ * Test suite that creates a parent with two children: a gate and a mux.
+ * Ensure that changing the rate of one child does affect the rate of the
+ * other child.
+ */
+static struct kunit_suite clk_rate_change_sibling_test_suite = {
+	.name = "clk-rate-change-sibling",
+	.test_cases = clk_rate_change_sibling_cases,
+};
+
 static int
 clk_orphan_transparent_multiple_parent_mux_test_init(struct kunit *test)
 {
@@ -3614,6 +3769,7 @@ kunit_test_suites(
 	&clk_test_suite,
 	&clk_multiple_parents_mux_test_suite,
 	&clk_rate_change_sibling_div_div_test_suite,
+	&clk_rate_change_sibling_test_suite,
 	&clk_mux_no_reparent_test_suite,
 	&clk_mux_notifier_test_suite,
 	&clk_orphan_transparent_multiple_parent_mux_test_suite,
-- 
2.49.0

