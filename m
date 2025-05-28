Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AE9224249
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 23:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748474248; cv=none; b=fGEoJH66G8XQ9L9YfPz6e+qqcHxBifJZeJSdemoTC05TDY604g/+Zk10Hx6KbcoJklm9rBERu9c8hsEKjQixtjQOZJWytJp5SoCUbf3HGn3aUOZkMdF0V7quRFdZJGivQFy0/gXeHlA5Tyon+fmPSHE9mi2FZy2GU7Pyf6wIsug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748474248; c=relaxed/simple;
	bh=R44qZbts0LnJEsYBeXkZ2b8yBCEdsXI7Jzk9afDBD5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SqJFCUmrlG2jXTwBUvzN0TTByc43XZ2O/4dW7eHItJCzSdP3rsHiO4qeEwA9XRmkJxBPxMBpFPpML7JftBrHl3dNN9rE2vZ2f5EmZbGD+9iY1foU5yi9fCJ5DIlelijB9POo6/3k1bYEtXD5SmA1spKQEIHpBXQHSEvlqc+Sr6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T91QlDyz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T91QlDyz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748474246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DkwShw2YFHx+q0rk4/AnbBkoyjMYtZf7ATKTIzqBkFc=;
	b=T91QlDyzuzxViSoTDtNWrW2efQK+56BTl43XZjZCrIgyQjsgJs4DpOHjJwdsSaUNSTToSo
	LPAD7lb4pf1D0DsfUpHiW5kr4lea9VZVGPsOdfz16xczT34UsTscLuK1bWcMoLHx3ychQV
	ByJaqBe3FTe0NTJ3TgvfMqn3011apSk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-TGvF_aiHO8Wb83rkE_kSoA-1; Wed, 28 May 2025 19:17:25 -0400
X-MC-Unique: TGvF_aiHO8Wb83rkE_kSoA-1
X-Mimecast-MFC-AGG-ID: TGvF_aiHO8Wb83rkE_kSoA_1748474244
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so55159585a.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748474244; x=1749079044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DkwShw2YFHx+q0rk4/AnbBkoyjMYtZf7ATKTIzqBkFc=;
        b=OPqvUu/STAghQT3bDI3wg26VHJYAFfZfrw4kSxlKmOkDZbAPMtBusftMCuI7eTSDBm
         W1s5mAMqGT58kciRqjXL46s7FAhTkpuZnmbEFiQrwiA7eKJN/mfGg/YIwfOkolUbvT9l
         Yh6/Zsw5CDr8MkPS4/0A+JGpDJEPXLtIAa7SktnMIpwhWuLMgBVM2THDR0MihF7+oEgt
         DQS+0fT+Oi/bLwaNolMSpd0Jhaberb3hnhNXz/DW53HUENjBVYaQMOk7qVSORrqhw/9x
         80163jIxVCA4H61vXRWbqmwywf5T9cetd1fnJJ/WTjBCw3id4XQrL1WVMOIMsywmXvke
         eM9A==
X-Forwarded-Encrypted: i=1; AJvYcCUw/WpClGpSHoh8lY62uWh8rB0tXifntDDilKVNmKpb9Zsr5OqM0pLdbRgIJC3BmpRcrJwVNYtwaF+JI5s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4ICV9eq0qu2+PjXZdVn8MMz/jx43imp+h/iCkCY2kTNKF0OEi
	NGI8QZxOuVFl68wT3XMUxOfEFb+9HG/Q9iulDYwgVcGDbd39NfDtWMzCWSDd6cW35KGJ49/Ux7/
	WaByHHnDvTC+hLX1avbU8Q4cvQoGIHp/KQwBx5KBFuOZuv1su23Tq0hYrx6BsuC8FHiGPFU/vPD
	91Zg3VeAWf6wP8cICcXAH/xdASeav+r6Ffs85bPGXlFwAfcrMAgdQ=
X-Gm-Gg: ASbGnct/CVMakwzLi+MZ2XLopcXY0DrbD3cBZXDC+A9vxXWOMO+1rwbvAaXLnZXdz1l
	1gdy69VBQOz6aZaeACEFwYhmKSW3kt0zd0avDkF+JyeThrV93PXQ8bo7EZUFz+AtBpaHAAlg6dV
	MnrJER71bBTmA0ox/oxqvcBVXPPHCwhnOtJXmwWfVvNdVmG9KwkVSSAsJr6OY47Qcrvj7Ujtrau
	dhqscslv7AXj2IJeNNHfJ3u03u2NF9EHbgPvexpR6tUwHFGMug6VpJ4x0vx9dg3eme5W77ipV+Q
	0rgbg3/3e8XFZw8wMmM5E/mGHr2Y6lVFd7TbE8kLL9Bu30yr0w==
X-Received: by 2002:a05:620a:248c:b0:7c5:b0b4:2cea with SMTP id af79cd13be357-7ceecc795d1mr2656318485a.38.1748474243772;
        Wed, 28 May 2025 16:17:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzNo/PxUI7q/a4rZlo97jbqBbarOKE+lWUJdu2PT6F4XfC+RujKLKzzmcT9PQT+47IsFtxAQ==
X-Received: by 2002:a05:620a:248c:b0:7c5:b0b4:2cea with SMTP id af79cd13be357-7ceecc795d1mr2656314785a.38.1748474243372;
        Wed, 28 May 2025 16:17:23 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0f984fsm13437985a.43.2025.05.28.16.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 16:17:21 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 28 May 2025 19:16:52 -0400
Subject: [PATCH v2 06/10] clk: test: introduce clk_dummy_gate for a mock
 gate
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-clk-wip-v2-v2-6-0d2c2f220442@redhat.com>
References: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
In-Reply-To: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Alberto Ruiz <aruiz@redhat.com>, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748474226; l=1455;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=R44qZbts0LnJEsYBeXkZ2b8yBCEdsXI7Jzk9afDBD5I=;
 b=1aW93G+xYXBDmW5rKsLzBIdn9Hc7/s6X6pjdmZB+RYCBfhSzCy+bVb4EsbQQS4QJSLLkBbA1x
 J0hIyINNOWcASooUS1MNhSKq0Fd2uoSkr3fuYjdJgXfvrsXkYJGzQ3p
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

This is used to mock up a gate in the clk kunit tests.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 35f516fd71a2e33ca19a0512bd2db02111ea644c..c2337527873d3241e7b0a38f67ecaa13535bcc71 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -181,6 +181,40 @@ static const struct clk_ops clk_dummy_div_ops = {
 	.set_rate = clk_dummy_div_set_rate,
 };
 
+struct clk_dummy_gate {
+	struct clk_hw hw;
+	bool enabled;
+};
+
+static int clk_dummy_gate_enable(struct clk_hw *hw)
+{
+	struct clk_dummy_gate *gate = container_of(hw, struct clk_dummy_gate, hw);
+
+	gate->enabled = true;
+
+	return 0;
+}
+
+static void clk_dummy_gate_disable(struct clk_hw *hw)
+{
+	struct clk_dummy_gate *gate = container_of(hw, struct clk_dummy_gate, hw);
+
+	gate->enabled = false;
+}
+
+static int clk_dummy_gate_is_enabled(struct clk_hw *hw)
+{
+	struct clk_dummy_gate *gate = container_of(hw, struct clk_dummy_gate, hw);
+
+	return gate->enabled;
+}
+
+static const struct clk_ops clk_dummy_gate_ops = {
+	.enable = clk_dummy_gate_enable,
+	.disable = clk_dummy_gate_disable,
+	.is_enabled = clk_dummy_gate_is_enabled,
+};
+
 struct clk_multiple_parent_ctx {
 	struct clk_dummy_context parents_ctx[2];
 	struct clk_hw hw;

-- 
2.49.0

