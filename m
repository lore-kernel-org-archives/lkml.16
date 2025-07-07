Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF07293C55
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 09:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751882228; cv=none; b=hGmK1eXlH1N7O4zmY7/eXUfbVPo3344vHA/xCdfmSIekJL8p06ipDcsKo3bj4uueyFPriyZsgx0GaToDwHdrpZmrj2PhGSOqQ7tIMrFenI8sVSRWR/MqMud0NEwoV67FLHEJuEMtWgRqLlm2fm1U8YfiAcR7f/WyEHwisN47uX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751882228; c=relaxed/simple;
	bh=ydKWhcndlxl5MTvw05hlMC5KMJvA24bWbtmGnXg5050=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u+/O1B8P1r4IWBtBS23tfler5VdKquxtJuF0UBhg6DMmeBMqwrI2axUCwwF9yTLgr52ZuMVZOc3GywmgLI4C0hLlv2jjP2zZJPUtfW2A2arkjovbJO7/qC/DpdVkikO357S1vwQWVo1KNjqP/Z0fuwdVwzsp/3oA6EOSk5+asTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=32CapVuE; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="32CapVuE"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6097b404f58so4284094a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 02:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751882224; x=1752487024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Hp01VtgUu8LOjxJwWCUeEyd5vmcaSl1UkWxGIhB2OI=;
        b=32CapVuEfqfRaTxam44f9EFidzYrPDoLkUlXECVaQm3tMlupak8U/2nJUhnvgH/BVz
         7w+wdL8wqV2DB4tyVLf0Vh89LJE8/itp74sG/tdvJsoMPsiY31BZharvQX2c3f1jjdiS
         WQxg44/IGYPRiWhyCCVI/qS621zuqDoJ4U1IlgDs/8yOiG+pbbdiQATUYg4rb9aNw5nP
         rwVe/+Kgoz15ufU0H+nnxmCdLTh3wLx8Gh4QbnwniYUMo11uHomqOz0XUxr9Ak0kTscR
         P/c6xafgDZ9tZGTsQVLo7Eq5yj8CeThvPiSzZ5FHERzyPEdgr0Q92qWZE3grgcCn0Re8
         +jng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751882224; x=1752487024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Hp01VtgUu8LOjxJwWCUeEyd5vmcaSl1UkWxGIhB2OI=;
        b=GUNSGSakdizpsuWIQ4IvBjtXgqeC6Sow0c7bjYuq5/yUfPCbEVtXmdRTvtD6TlRWn2
         XpnrX5rrdG4AhEmbKtURaX31Ed9bR44+9yZj379+sA9nbSBDVW7HlHul9GtgPCo+Mr9O
         IqJnomHzTmrb5OrecJ+J4+X1NQV0Qoc+fxKaaLZBp3VkU9q5eWhx6VDrVabUZIQJ3IRv
         hZgFQo7VDlppOhGL2Qy4XHQ6Uxnvv7XuBLVqV7fuWQdr1YO0Xi3syuPY7vtDxU0zkzKM
         xgfDDYrOP/AUCn3LIrj3/KYFZxoZ+eLYW9piiQbbUaZlXmOrZ+iLjxabNKxLMrSN6srP
         etfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxibXQr5i1QwZjQmE/XUkMyW1lr9wAzIwd2q96p8Xs3JixtfQ14mES9MuattGM+Z1xYsTc+mMAyPeAWNI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNn0e5RQswuhj2HIkfjLRnLCRx9xD6FVDrW1CRf6GtYBPf5U8M
	AjrCt9KoSOG8vSa7e0Q2Dzt1uQ7M9E0IUZp2Zv9Gj7KE/7BtRLp6gIhs2FmPggwYRiY=
X-Gm-Gg: ASbGncu9hacUaIdAGZQ3+oUdQclVKgmcImJdcko29/m515DCY09aF8RYur/NYj9N03U
	ZBSl6abV5NgNBOVti0knb0eaUUeZH2QkVzwcZECeJmCyEhNOEc1t96QLPqRjCkwagJa++1IAQ0B
	DdCZ4VIX2eJKvnvBN4rZbnxhDTyEhU5FxjOCWEXjIUzLTkL+BYB0bDKLWciigewFDRi7aTxaldj
	5ZA3YMRU8qlk4rDO57tcu2rgjsHcf0GmEJofiqit4I8YfdGq7gwEhUTgPeyWegyanRoHhmfX3IV
	M68ChtONxiGHtuOUfJdr1s2ko3Hftn4D5FIWGs1ERMscmLwWjoqMRQgQwCzg0ybHMEmXWgUqr8z
	JYNEDUz3Mx/9IZQniAN6u27hEw6hy4bYNo8OYoB7OyTk=
X-Google-Smtp-Source: AGHT+IHRrj/KbzA4A7ianBBPJk4PzGywdN0ABPWk5wsDmEPvJJ/W+8MCk3Vc++G3/K90MzO2ya+HxQ==
X-Received: by 2002:a05:6402:4310:b0:60c:3cca:6503 with SMTP id 4fb4d7f45d1cf-60ff40235camr7053514a12.32.1751882223938;
        Mon, 07 Jul 2025 02:57:03 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fca6641fbsm5235815a12.3.2025.07.07.02.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:57:03 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 07 Jul 2025 11:56:38 +0200
Subject: [PATCH v2 2/4] clk: qcom: rpmh: Add support for RPMH clocks on
 Milos
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-sm7635-clocks-misc-v2-2-b49f19055768@fairphone.com>
References: <20250707-sm7635-clocks-misc-v2-0-b49f19055768@fairphone.com>
In-Reply-To: <20250707-sm7635-clocks-misc-v2-0-b49f19055768@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751882221; l=2385;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ydKWhcndlxl5MTvw05hlMC5KMJvA24bWbtmGnXg5050=;
 b=mZ8V0I7sSXtK/N77Xlv2qRGj//UYkL16sy/wEyB342ppCuBE5Y3dR2wX6XcbMlJROchaA82dV
 sjYfRkRsG0uBjTMYqUe+Z2dLGa38HmumpoqJyJKbpzW3vKbbTAYn5ow
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support for RPMH clocks on Milos SoCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/clk-rpmh.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 00fb3e53a388ed24ed76622983eb5bd81a6b7002..5ca43776f1bdbaadeefbdeabeb557810ff0071ad 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -386,6 +386,8 @@ DEFINE_CLK_RPMH_VRM(clk6, _a2, "clka6", 2);
 DEFINE_CLK_RPMH_VRM(clk7, _a2, "clka7", 2);
 DEFINE_CLK_RPMH_VRM(clk8, _a2, "clka8", 2);
 
+DEFINE_CLK_RPMH_VRM(clk7, _a4, "clka7", 4);
+
 DEFINE_CLK_RPMH_VRM(div_clk1, _div2, "divclka1", 2);
 
 DEFINE_CLK_RPMH_BCM(ce, "CE0");
@@ -541,6 +543,29 @@ static const struct clk_rpmh_desc clk_rpmh_sc8180x = {
 	.num_clks = ARRAY_SIZE(sc8180x_rpmh_clocks),
 };
 
+static struct clk_hw *milos_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div4.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div4_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_clk7_a4.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_clk7_a4_ao.hw,
+	/*
+	 * RPMH_LN_BB_CLK3(_A) and RPMH_LN_BB_CLK4(_A) are marked as optional
+	 * downstream, but do not exist in cmd-db on SM7635, so skip them.
+	 */
+	[RPMH_RF_CLK1]		= &clk_rpmh_clk1_a1.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_clk1_a1_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_clk2_a1.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_clk2_a1_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a1.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a1_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_milos = {
+	.clks = milos_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(milos_rpmh_clocks),
+};
+
 static struct clk_hw *sm8250_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
@@ -943,6 +968,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id clk_rpmh_match_table[] = {
+	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},
 	{ .compatible = "qcom,qcs615-rpmh-clk", .data = &clk_rpmh_qcs615},
 	{ .compatible = "qcom,qdu1000-rpmh-clk", .data = &clk_rpmh_qdu1000},
 	{ .compatible = "qcom,sa8775p-rpmh-clk", .data = &clk_rpmh_sa8775p},

-- 
2.50.0

