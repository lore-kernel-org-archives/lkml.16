Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D203253B6E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 13:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744031599; cv=none; b=GSrImY/EJnWv+b/spGCMdTNJ+kLerYQlimkTeum8zKyTW5qKsnTxv8oZum046NliWxtBJ0K0tzBuQFR7k9nU2J4yX16nXgShQ+f6dH+Ogq6bEYixGvIQE2vKuDOClbtjDD435OXBCXDCGGCoLLaBfQFgXIqRpRFik/PR+kGIIIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744031599; c=relaxed/simple;
	bh=wlO2M5Iffb0ZdGXwHjBV+tKDbXC9cX8F+bfsNcUAoXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=nnnFyRNyzfdu0nBuPi5mUTvu/PaKQLabW/aYInNMm6i0bV/UjknNiOmJFnxIjnDhCbNNBxJd3m+vcGnpmrPxAj/VcWjKn8m3GZeV11KTJNv30GDSPUvw5sGmGApcLFH0MF+IkyVlNwuih5qlbM+zZmnsZecweD8pHMjkQ+FW7t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IQmPXp9x; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IQmPXp9x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744031596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SPeRRdg+oYji3tLFW/edfVgnk/6p+M7V8UpTleI7ZF0=;
	b=IQmPXp9xxHrPYxLYuT2nwfAE4GcFcrOuCRXCnf5m5Ob0RYMRHxOSDlQRQRuK9fUkCp9uaL
	mBSiG1H2ZzFhFa1yqYa+V2K3C8CjWW0FphP+SCRp2r0CrmESviC3gqeHuJaWiiqkPlpVW1
	pE4Ctl/V4qCBOJGOskG5DSTLMo9Pz08=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-UvB90HvUNm-ADiNlqEhUBA-1; Mon, 07 Apr 2025 09:13:13 -0400
X-MC-Unique: UvB90HvUNm-ADiNlqEhUBA-1
X-Mimecast-MFC-AGG-ID: UvB90HvUNm-ADiNlqEhUBA_1744031593
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8fae3e448so96399686d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 06:13:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744031593; x=1744636393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SPeRRdg+oYji3tLFW/edfVgnk/6p+M7V8UpTleI7ZF0=;
        b=bPWUGZqxym01fPnZfNFUJRxyTtLi7l6EMCIXeDR81xoXeH61Krm9TVXjQMVTq8eURu
         1NqdibWqWa3Q/TY1e4J82FcVfMe32SgNAb/80RE0CCyZwN+ZtxnAZCy42Ht6iVlxM9Hz
         ziTw3mO+8BtG4vWCtdvuHmHyU25DkbxIHr2HRi3EKI+hrqzAYwZzLl3LOief5wvWxf1r
         +jjbQl+/rVCRM9KjMJO0O78ZpS6WJi9v+KWmk11luDroVg4+JalZsbOtCLzWpw78/YMR
         ykHn8jKrszCFXFUzVsXvLw9jTYJonJR32/CCXQCye+S6HcHk6+D7axsjaznZVKscBarr
         Sgbg==
X-Forwarded-Encrypted: i=1; AJvYcCVgpVumPhFWsdt+x+w9qjo/lyGs5k/wgzrc74bKBW/khDXO3Z+wzcr1X1zvk+Z2UMLO0owlF4B1OiXnQDA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvQw/CsyZWXd/wBbWN8XyM1GOyQ+RlV2NenJAlgLrb1Zactvpw
	gtPikFZ3QGJzF6zVmt2IJxeSBIQcx7JKxY3RtaiNTnX5qJ7EToqZ7tCqVmDToaXB1oZYYG931ze
	3HxJHy5mGL9hMcCE7sPoVenQ1/bN5y4tvIMcv9mZSZ7EERWfJKx5bosMeEQvcgQ==
X-Gm-Gg: ASbGncvGHXPe2vkc66GdzOAsp9lzZc0/tYrwSrd9cdk+noVqM2uzhx+XPquVZlaQmyx
	jeZfta/BNEOVnnt+LosZ3woGPGSfY72+WkwTgJrTnweSugTcOTw/dn1sGRrZxNJhS8V4OBlvGbN
	y26moeg6jdQ6IXKduw7UMDE0EGo+yJPvA1HeBlQMALz+QxbutXqApWU4C6T1AYYXpK2ZKM70hor
	CsSAVAq5J1w0Eid713OmqxAPJSlTYw+P8T8d56Cz50jwGQ1IlB6TE1Tn55BaV8TZCXVojrFmKRu
	T9sR9LoeYJ35xgohh93WGXE7ghbpT3dZRtTo2e0Jlg==
X-Received: by 2002:a05:6214:f27:b0:6ef:eb:a42 with SMTP id 6a1803df08f44-6f0b74f697fmr155461156d6.28.1744031592985;
        Mon, 07 Apr 2025 06:13:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnMH67qk17ML1Xxl6I5rVLhnarS2cRcaURH5/qJHB2dqvoAJCYELgv7syc1xm8QgsFtGxTTA==
X-Received: by 2002:a05:6214:f27:b0:6ef:eb:a42 with SMTP id 6a1803df08f44-6f0b74f697fmr155460846d6.28.1744031592686;
        Mon, 07 Apr 2025 06:13:12 -0700 (PDT)
Received: from x1.. (c-98-219-206-88.hsd1.pa.comcast.net. [98.219.206.88])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f138e15sm57662556d6.82.2025.04.07.06.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 06:13:11 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: sboyd@kernel.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mripard@redhat.com
Subject: [PATCH 2/8] clk: test: introduce clk_dummy_div for a mock divider
Date: Mon,  7 Apr 2025 09:12:52 -0400
Message-ID: <20250407131258.70638-3-bmasney@redhat.com>
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

This is used to mock up a divider in the clk kunit tests.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 1b34d54ec9c6..4908fb9c0c46 100644
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

