Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCF9254AED
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 13:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744031612; cv=none; b=l3B17VVvQA1b+ooWrGZza+Y1TBYDYE3D5P1I3JzrNa8+6xAQcJqchxgkLb1ybjmjOPMs9z7cJBzwlPtFWpK7lQ6HBwN41332BznkZh54SH36BtUoKOS9ERORN8Pp26fAJmzIQbH5ELTXXOvgN1y8g9AxYvvYco8FUeIeeMDK8yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744031612; c=relaxed/simple;
	bh=GN3voStKR5Oh+8mUZUpd029ZKjm8JBA4D8k5Q2aS0T8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=EKcLAA+TMY+y3VR2itU+tufY9jm3urdP/mwZfYl7/2jQq2HJUBvEH2OhisHz3i6qGqRVHReHCgInDi2Rrr1KSNR/NKDaDrlQWgjIGqMIya3VpZq/4mBJZ4ZrPabvHyxXRqNeK0MkyjrzIY2sISer5jk6yJtClPkDv51+c4KFBZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CzjWUdGI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CzjWUdGI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744031610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bh5Q0sLZw7+M5FGlXd5xakStCO4/0BURaA8xUUHrIXY=;
	b=CzjWUdGISCJsppbgJOD+AwKZSwz9s2vIoFzo0R6b0mmxdWJH2k1wHYEUU53hfFf6JTSeUM
	pARVSH4VL1ebnuujpBItNH/yPnedEtpwCiexO8OmscVqS5LuD0KkK2Sfw/p40D7gdn3XYj
	ourexlnFZhl9qdzBYt9LVa5lavkVG8o=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-119-cRJDds3oPsmjHO0dbqHtMg-1; Mon, 07 Apr 2025 09:13:29 -0400
X-MC-Unique: cRJDds3oPsmjHO0dbqHtMg-1
X-Mimecast-MFC-AGG-ID: cRJDds3oPsmjHO0dbqHtMg_1744031608
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8ec18a29aso50319986d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 06:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744031608; x=1744636408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bh5Q0sLZw7+M5FGlXd5xakStCO4/0BURaA8xUUHrIXY=;
        b=c+MWDXFpOG6MV6iFAwdKvKWN9JyVad1BeTwlhCL3dl4bnANyUbLP5s6yVnRhe+qcSC
         J0be3m0FFQQUC8Tz1ObbRw9DHWxhKNpcYxAKFOa3IGslgWnzBBBdP7LzfUauAC4DX25r
         JZG26XY7poa1nZmntdhGvqOQxr4D8nC9gF1CkWBlv6fK/69vc8fbNmqcBONxgSqXjwJL
         W1/7A1oK/MKpVqe+hbiUGRuUER4eup+jWtr454mU/zkIrJAVrgnlJFG7uTLleXyLoYlb
         kL6u8iAnqGmObVa/dV/02a8IeMDuMJ5V6kOuLbrV7MdxpfZJVg2l4QyAWQoz3XAU2aI3
         ngXw==
X-Forwarded-Encrypted: i=1; AJvYcCXxecej2uwUHPBNjTRfIywochJGzCXjCBkMLjHzX6v2xXaC2dX14DUSTji6w53IP9bbFhcJlVGv8Tjwilc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy0CgDyKja8XZdzt4ExQ4SyURpDx/GcUOKBTKh6BwJH7q0CL5I
	SPWdhyoZgOvCjU9/PNBCpHlLw8c/2rGIXsJks/Qvd7q+JvEA7LmMIxUVWKhyKCkKEd1aRpbbFTi
	pFqdb7vlAwStH6CuvGDbMMv+i4OBP7vHS6gETskezsLxeDa/3FOMUr8C780bAiAhgPFHBeA==
X-Gm-Gg: ASbGncvLhtzlUT1tBWeO8YNAISwVhNhnDIR+LOycv+rE4s05IXmTT1HBpB5L2zOv8h9
	4dAevF+XQQ9LyKayqKvsZtIJwzQnGlPfRvjm4zqgmJ1MNtR+bqwXLjl0KiP01LqKYauAoNqXN3D
	lbbpQcIUSwNqqturHxPqx2FPqqY3RITKdYxs3AdI76C2FbkXuWmxCsJm8hHXfnqbcuGLxJP58ya
	xQ4Wqn0YP8MpPi/4+M1lHQuZsOzwiCyMLeW3blvWBQlOX6VtcoqOQpAQuslOMMastDA4QJH6HI6
	lihmIwIIAwEyUcRSZUUhx4f3U9hN03gQdLVTyHv6AA==
X-Received: by 2002:a05:6214:f6a:b0:6e8:fad6:7104 with SMTP id 6a1803df08f44-6f064b27e5dmr230252476d6.35.1744031608046;
        Mon, 07 Apr 2025 06:13:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3ciFpFjf+SwD8KF8vuNyhdHnxtlz8uDM6Kto6KyAm9+ypPxnut52K/L2hr2yRorO4oeMeag==
X-Received: by 2002:a05:6214:f6a:b0:6e8:fad6:7104 with SMTP id 6a1803df08f44-6f064b27e5dmr230252186d6.35.1744031607774;
        Mon, 07 Apr 2025 06:13:27 -0700 (PDT)
Received: from x1.. (c-98-219-206-88.hsd1.pa.comcast.net. [98.219.206.88])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f138e15sm57662556d6.82.2025.04.07.06.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 06:13:25 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: sboyd@kernel.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mripard@redhat.com
Subject: [PATCH 8/8] clk: test: introduce test variation for sibling rate changes on a gate/mux
Date: Mon,  7 Apr 2025 09:12:58 -0400
Message-ID: <20250407131258.70638-9-bmasney@redhat.com>
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
gate and a mux. Ensure that changing the rate of the gate does not
affect the rate of the mux.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 46 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 97909caa71b2..e6df1d2274b2 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -942,6 +942,48 @@ clk_rate_change_sibling_div_mux_test_init(struct kunit *test)
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
@@ -956,6 +998,10 @@ static struct clk_test_rate_change_sibling_test_case clk_test_rate_change_siblin
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

