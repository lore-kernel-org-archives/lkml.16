Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D177F7FC
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 23:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748474243; cv=none; b=DVvlwKaY89r4uw/6DLcrHcFriHO12t70NrhCcCBp34EzH6omSNcsYT3YNrlIRnbsYhNJlNuwitgB/ROLejY++maN3qflufUr1OeIG15QRVq9CY+VW1IYcoajJyHQaBmgQGUy4s9Qp6sOix3Uyl6qbqSmrLtgtueNiyLsVhwEaDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748474243; c=relaxed/simple;
	bh=NMZgKVeLZ9BZ3EE3JsxTf6VRGRDkv/GJpoUMl51QAYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YLuvLsgrr1iuEyMf2hjGx1vOdRqtBegB/ISGsYuxjhjk8m1OqePVsWmetzB6z/BgELkdx/oH3RWuHye5XWEIxrjVez7WrTipaNVALq1VIQ6VFo5GyT95Nue/FkTxwCf8dbGAGV26sf9JR8N/eG6B9CvivDSg4THjbfVUvKZuKYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Joyr0OUc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Joyr0OUc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748474241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=29v6CJsABJh/4ImLVM3b21hkbzQBqCF7iCRKt/uRkcY=;
	b=Joyr0OUcIBmxCMuR0mPkybijuIhcdPNRpeEUXmLu8v3BGreH1S61QmyDaOTFly0srNiQik
	Mu0PDWS7sKrcf81FQo6V4R1PRpgwHx4rlUbiluNgk3sELWnhyygtWB7qLQR1tEAfwYb/JY
	5KS3wAKy8c9r7OMrA7E7kwLohA+ISEc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-0njv5KH9OoON-W-WHu0v7A-1; Wed, 28 May 2025 19:17:19 -0400
X-MC-Unique: 0njv5KH9OoON-W-WHu0v7A-1
X-Mimecast-MFC-AGG-ID: 0njv5KH9OoON-W-WHu0v7A_1748474239
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5c82c6d72so57193685a.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748474238; x=1749079038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=29v6CJsABJh/4ImLVM3b21hkbzQBqCF7iCRKt/uRkcY=;
        b=OqcaM3J275aSzxMaFI4UxCjgwcmS5fzdTgw6A6sjkQoh8WJ59v2TYnNUFs/N1w9DC3
         P/FYslxcoz1GFxMwvWQ7EX1xukxYw8eNUAgkVaft/sVrt0rvtaUO0NIsWN4lw2lwCXc1
         df7Wlk5qY7pkb+KMftEcWoTw769/yR5fqhuH01/RoyVQ9tv8R0ekZW2hmjFNxKzwFvvf
         T8Cj8aKAdl+dLRKhGZHKRfA9CxSF2Xc68RZXIuZn9vCXfuvsDkO1zrqvp/NviqCyzaJu
         vIsKRiVw3+SW7lm5ONobGTR6UjbNMu4nxKSUqphunu3syFexbxa0e8TKLN8FAFdRqPgk
         RddA==
X-Forwarded-Encrypted: i=1; AJvYcCXohjH8tDJRogolFoTVVlEECJbjahHsl+k1XpX7qEf4bWnX0o66c5fSYthYGrHtrRzy6DkfMKmJImaNzg4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz79PAqMgUFtoiIt5M57aqTPCJCm2klokM3IpZe6JpI49ZT+mvZ
	NSjfjXnf4IDQconpY4u5Q9MVZp0BA9iJN/MIoYLVhR1VB5O1Qf2PQld+mUxWpVomJQFhz/6HIds
	7dt2iUbPaQ84BKtTrrqMB4pi/UkXUufEsZDH+RxjN4g9I/tFuWjlXxTBiLTSpNqGxNgQE5FUG8k
	AoPNXHTuDEmHmYW8Hp8IXhWklU3HOSp4Y4WRw54fku2hi4On6r0zI=
X-Gm-Gg: ASbGncuVmQKP8FRyvo7BZ5IlMQCya3LUXcQaQfYN++WbshmHickkSrDxWzXosfaaahp
	+pmXAAkp11gdsbDyzLHAJnGoCqIqnQD4b1vm92pLPsQKx3B45MHC/6Y+MmbG7gE0h3gXHaIC0F6
	9IeJbCDnFGFR+djlSME0ggqBghhcci2xKJlIPAwKNt8MCMrYGt58V0PPAr3NSe8Ev+gFF7beIzl
	KFKShF+tO7lFftNYEc1edv0Q0L+36YB0TBPuUrk2xe/+WbqB6lEjp1b0jCz/Z0oV0kUvxeFhA1o
	KpBLb3+RQTesoLmWL6PA2GbILEdjujBha1XLCxWKDT0EbQzOiQ==
X-Received: by 2002:a05:620a:414f:b0:7cc:ffaf:60a5 with SMTP id af79cd13be357-7ceecc02cdcmr2551790385a.3.1748474238129;
        Wed, 28 May 2025 16:17:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1t9M4pOfH0S3pZYhTRp4meGn/CJPubd3PS059JGUUzP7kiltXd6n6C+dsbqUaBTsPDyK/bA==
X-Received: by 2002:a05:620a:414f:b0:7cc:ffaf:60a5 with SMTP id af79cd13be357-7ceecc02cdcmr2551786885a.3.1748474237721;
        Wed, 28 May 2025 16:17:17 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0f984fsm13437985a.43.2025.05.28.16.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 16:17:16 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 28 May 2025 19:16:50 -0400
Subject: [PATCH v2 04/10] clk: test: introduce clk_dummy_div for a mock
 divider
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-clk-wip-v2-v2-4-0d2c2f220442@redhat.com>
References: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
In-Reply-To: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Alberto Ruiz <aruiz@redhat.com>, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748474226; l=1920;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=NMZgKVeLZ9BZ3EE3JsxTf6VRGRDkv/GJpoUMl51QAYU=;
 b=7U3GXBVbw3VpE22HalTtWkfkALmHE40v5SBTBw0dk1ipNXxawmTZsR9pCL6LvFDd6hYFh0Dmf
 f02/OZZLs4VBd0plkjqo/QAKFk+Hf3I9vF4QvoRCRaTlSsczLvHnoGw
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

This is used to mock up a divider in the clk kunit tests.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 1b34d54ec9c610ffa3e91b06f5a5180e0395e26f..4908fb9c0c46e34063ecf696e49b48510da44538 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -140,6 +140,47 @@ static const struct clk_ops clk_dummy_single_parent_ops = {
 	.get_parent = clk_dummy_single_get_parent,
 };
 
+// 4 ought to be enough for anybody
+#define CLK_DUMMY_DIV_WIDTH 4
+
+struct clk_dummy_div {
+	struct clk_hw hw;
+	unsigned int div;
+};
+
+static unsigned long clk_dummy_div_recalc_rate(struct clk_hw *hw,
+					       unsigned long parent_rate)
+{
+	struct clk_dummy_div *div = container_of(hw, struct clk_dummy_div, hw);
+
+	return divider_recalc_rate(hw, parent_rate, div->div, NULL,
+				   CLK_DIVIDER_ROUND_CLOSEST, CLK_DUMMY_DIV_WIDTH);
+}
+
+static long clk_dummy_div_round_rate(struct clk_hw *hw, unsigned long rate,
+				     unsigned long *parent_rate)
+{
+	return divider_round_rate(hw, rate, parent_rate, NULL,
+				  CLK_DUMMY_DIV_WIDTH, CLK_DIVIDER_ROUND_CLOSEST);
+}
+
+static int clk_dummy_div_set_rate(struct clk_hw *hw, unsigned long rate,
+				  unsigned long parent_rate)
+{
+	struct clk_dummy_div *div = container_of(hw, struct clk_dummy_div, hw);
+
+	div->div = divider_get_val(rate, parent_rate, NULL, CLK_DUMMY_DIV_WIDTH,
+				   CLK_DIVIDER_ROUND_CLOSEST);
+
+	return 0;
+}
+
+static const struct clk_ops clk_dummy_div_ops = {
+	.recalc_rate = clk_dummy_div_recalc_rate,
+	.round_rate = clk_dummy_div_round_rate,
+	.set_rate = clk_dummy_div_set_rate,
+};
+
 struct clk_multiple_parent_ctx {
 	struct clk_dummy_context parents_ctx[2];
 	struct clk_hw hw;

-- 
2.49.0

