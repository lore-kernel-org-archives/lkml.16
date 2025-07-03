Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF69F2E03EE
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 23:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751585003; cv=none; b=iahcBTIxKxWM0tCXum4JAc44Raw7pBzsPgf+oViJa5aA8hLlh8RL5wxS14gAar5Y+1QZxLxNDEK40zHEl1nI87WfTVCJSv/Qb8OkuEvYAu7yIWD27Y/CVosdDuuL1xVw0I0kXD75RUosQ0Qc3iNnvEjoTEu9IOdg1n7k1YHBv6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751585003; c=relaxed/simple;
	bh=df3heNetVnGAakoOY8ifFlNFJTyILwhXaXx3zST6UYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sbjWLCcPR+zDO0QnpeiWWfLfASm4jzzxj1lHDZaOR7doop86pcGksIabPPaY2rsKOsaoWoKwmaSug4AI4BD9DCd5lsXunQhKurbPToSsacwQNE0qDmw0g1GQdyc16aLnCartppSWGug+N+eL5KX/hYFYi6hKvA1VbeJcyISSNpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N2fH2Hio; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N2fH2Hio"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751585001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QS4yMTSBWIACzdBsSvd1ueSXzxvii7AwO2574uYorUo=;
	b=N2fH2HioC9F8n+aL0GwtKfST8Qkoz1fSfFQjuYlEmh4M5Z0m2zlU6IqWcBozp8sIpuUHJp
	8XufVoj8ULcY/sJcC3NKkd+RsI9TJPTvcrJw2sqSGz/sfeyk9yuDg+b05m3fFWzjTkcfUg
	tA23UbeDglcHfHVgtYeWpGUgtBCosg0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-O4ItqbJWOeSyplBKPJnQUw-1; Thu, 03 Jul 2025 19:23:20 -0400
X-MC-Unique: O4ItqbJWOeSyplBKPJnQUw-1
X-Mimecast-MFC-AGG-ID: O4ItqbJWOeSyplBKPJnQUw_1751584999
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a44c8e11efso12059411cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 16:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751584999; x=1752189799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QS4yMTSBWIACzdBsSvd1ueSXzxvii7AwO2574uYorUo=;
        b=fiJIU1lwBJ9m6IhmBwLBZT39oEHANO7XCoQSnkfNayiECrYAsN6Bul9Cj/lKzXcDuV
         gB537vFVAb4Uj9F7lCkI+xMBYwkz3ilQDxuaBfHuYGLTZmhftjChviJFXkaPGby5NVk2
         /NFJCWj9g8BfVJ/RQzMPeZQxsyHyQxVo5pNGrLxhglJgx1jm+KR8flaOyKn4EDEcDSj8
         ZiGCMUkGa01QhO6RRf0d5ZMhjTRGqAJVLwB9rc8llvTJEeOPgPAoJThW35rvvBEAtDcN
         73IwkmYbYaZKDkE2PBfftVsF4Gjy3Ppb5OAyuiLm6U1tfSusOupkOzWaqIpS7OX1RVvM
         5CtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIfNtVKcDe5ZEhKxQsrRR049VXhXSP3aQ6nkgIrZOxBLhUk4gPjsNIFrOYe+1F84O1m35ZVK3ol1Ek3jc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4rRtRKp0I27ioCjvuxJAMFIL/0LO2NwHW3Qx6k41xlUa4n3JF
	V5eHkS64lUpANFpj3cXY64HEf0ueRDTzmdZE1o3I4O3xYTEdrf9+RGxCVeVw9Ixt7lHYJ2IHoaW
	Tr2iZzF7ZV3q5hMWA2N7Z9E/lg07ReuS/2Y1nG1jzqNhWiZhsjue7NqGy6ydEp0NZoA==
X-Gm-Gg: ASbGnct62gTIhh+IIz6vaFaobamGqAD0vhtpzlwaqZ1Hoc6dW/xdjyZzIz+2aTqsP5m
	kP1wji3Jzo9VY20xTH+PPCz1YVbbNgx+CvG0c2R6ye9jPCNW92cQZvHwexltONQVgSGdGk7l2bs
	QUHXKr1hHhoydzlWXg7sFiZYTC03FBKxBNCK1AG3Sj/28YpTPSP4VrdrBzY4gk214aFRDQv83vo
	+zWoQqvjijwcJQQLRavIzJlTMbOIc1rcxRMWVdn1UAIRk5ghJ5m25wLnIoDw1zyP4RNwNUe/6k5
	IV+5CinSyhr5Bnbx5wCgNbOg7oB33Yiz2t8O38cZ0gOrBFgAEp31tFwgIaM1YQ==
X-Received: by 2002:a05:6214:3c8b:b0:6fa:c81a:6234 with SMTP id 6a1803df08f44-702c6d01143mr4642666d6.10.1751584999108;
        Thu, 03 Jul 2025 16:23:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnyRBtsxkt1pYtkVxxPc81mM4Wpf/ySmYd6WAtzuN8xInUs5YM90SqZ5QPpGic7Y9Pfr/12A==
X-Received: by 2002:a05:6214:3c8b:b0:6fa:c81a:6234 with SMTP id 6a1803df08f44-702c6d01143mr4642196d6.10.1751584998794;
        Thu, 03 Jul 2025 16:23:18 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:16 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:30 -0400
Subject: [PATCH 06/10] clk: qcom: spmi-pmic-div: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-6-3a8da898367e@redhat.com>
References: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=1685;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=df3heNetVnGAakoOY8ifFlNFJTyILwhXaXx3zST6UYs=;
 b=OFYVeMjBJG2jV2b1stxmQ5G0DPbn/iCRgth0RbTQpfPDnrwu1D4KE8bJib4qFP4WVG1I+0SfP
 A2XeBkjrP1YDSfU9lpFAunaG90ILx4mHMpjg4d3zzXSpuGBMZWLMybv
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/qcom/clk-spmi-pmic-div.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/clk-spmi-pmic-div.c b/drivers/clk/qcom/clk-spmi-pmic-div.c
index 41a0a4f3b4fb316827365a522079dcd99630c49f..3e2ac6745325a1e0a30a4587d27f14d93011a225 100644
--- a/drivers/clk/qcom/clk-spmi-pmic-div.c
+++ b/drivers/clk/qcom/clk-spmi-pmic-div.c
@@ -112,16 +112,18 @@ static void clk_spmi_pmic_div_disable(struct clk_hw *hw)
 	spin_unlock_irqrestore(&clkdiv->lock, flags);
 }
 
-static long clk_spmi_pmic_div_round_rate(struct clk_hw *hw, unsigned long rate,
-					 unsigned long *parent_rate)
+static int clk_spmi_pmic_div_determine_rate(struct clk_hw *hw,
+					    struct clk_rate_request *req)
 {
 	unsigned int div, div_factor;
 
-	div = DIV_ROUND_UP(*parent_rate, rate);
+	div = DIV_ROUND_UP(req->best_parent_rate, req->rate);
 	div_factor = div_to_div_factor(div);
 	div = div_factor_to_div(div_factor);
 
-	return *parent_rate / div;
+	req->rate = req->best_parent_rate / div;
+
+	return 0;
 }
 
 static unsigned long
@@ -169,7 +171,7 @@ static const struct clk_ops clk_spmi_pmic_div_ops = {
 	.disable = clk_spmi_pmic_div_disable,
 	.set_rate = clk_spmi_pmic_div_set_rate,
 	.recalc_rate = clk_spmi_pmic_div_recalc_rate,
-	.round_rate = clk_spmi_pmic_div_round_rate,
+	.determine_rate = clk_spmi_pmic_div_determine_rate,
 };
 
 struct spmi_pmic_div_clk_cc {

-- 
2.50.0

