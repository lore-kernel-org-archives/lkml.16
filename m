Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325CC2690FB
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 19:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748201183; cv=none; b=Bws7dlAPCnhlO7M548RAiX5AnR3xR0gkyj+wDmiM2OZuqPPzU/Whar0vazFfRE1S0PerrJhduyP6JHx7xYRRLatf1HrEvQhB1wqRG4jkXP3Ar88Lt8+cVpr3krMRCQ1F9rcbCTA4D15MRyaMIEbjug7eQoP9E65wpDn/06jlTZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748201183; c=relaxed/simple;
	bh=wf9mMF4piwylWLERQD6eu/HVFRIY7xIhB8VCk+ieFdQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JPlE43Hrwn1V/LKfTq/IvsDgUFk/L7jMBpiyGtjUiKj8KB6kGLL8EoUD9rSHAA9f/9s5j0573jfMNuJhn6bbFKdujGZ/7kkwekqP832g7Va+tHyDPBVkR29ETGqjazsgIEHLp+JIz/JqeX2yKCZvJLX+tw/rGecbdkskRLUPdZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wrcDgDdl; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wrcDgDdl"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5f6f86580ecso347357a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 12:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748201179; x=1748805979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dB8Qgyau5a7VreD6df5S2eMKOiRWv79kx7XCROS4r/I=;
        b=wrcDgDdlB77/8sVADWbFbOueNOJpY8qiY9wKfUIUQE9NoFavXjWdOUwgMoNiJBvPkO
         z4h9OtgTl8ePEx26YoyUWKBz7o2+jSY0Uab/ZaQKF3ph1BoVatIHG6lMoI1s983uDVna
         gMnNYvFGP4puFStd8Tpy6vNf3+YuGEW5MloIh8tX7Y08BMyZui4anXbaXe/oJlQsNfk6
         MSqcEA9b4orMXeWaGEk2YLCRRWVhNk2GMNfN83gONhMThdzG2NzB+KXxwejg4t9LHwPT
         aw2s2/pID65qzl/yXRZS+Y4cobkUsngQq3xn2x5xqlTPLGMJyBQovbq6Y3sGrqiMOxzZ
         jpaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748201179; x=1748805979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dB8Qgyau5a7VreD6df5S2eMKOiRWv79kx7XCROS4r/I=;
        b=FUcrAq0P5Dq1Vm0kJl2OVrELnxYuoNqgn7NfcT21dJ67qKvvf4u5itkvPYqCoitvsv
         pTVoodAoW2vLDSBWn8Lfthmh6/j6dG4Zjr/dbtDWI3t0J6chl+cSBSS7HbWqFSpnzUkT
         6t9WQ7UU+cA15u9gcIELzkgZa2zIo7zWQke7lBD1ZkTEX30YB2BoBYSdut7Hq6nchXz+
         DeiGT+EpGLV92eZgOdUY5L/50+wg1Qi9sMy/wY3llcCwH5Yf7YD/vPwCl7PuEwAhqD/x
         iH0VD5moUp7E16Wt5cGl2pOoTX6fXI1mE7YG0ZRfvVIFhzacbMh6K/oWcS++razBt/z2
         /l1A==
X-Forwarded-Encrypted: i=1; AJvYcCWjcgY2ObcNNhbbdqB4KdluCt5S9gw3mWohGOGRDwUluTY7dSaF2S+PYYat4lJxWlUlYHcO4MVXFVPOpRk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yydwr7SBFSSmLDWpUovnmX+HF+2V2B4hKs3QWVTGrkT81+zrL25
	47ao0DcM0HdcyqlB1RtBFckWJjsLsPlcYF+ujp3Vo8tLvJUTwcEpM2Pxpjmx4B9/6Lg=
X-Gm-Gg: ASbGncvPswJSFjJNSoS0D++7QGkNugbzIhs5QWaxt91ckBiGoEjU2f3NK8W7Fi9WneU
	PRiGXtcYIby06UwcTPPr2Opa/2kBbA9rWw2u0LblGpBcfujUr9CQYr5skAD3N1ZOzL7Wj/kOPdQ
	09/44x51IJPsOM0ycznVZNMg+IZ0DYa7m+2LLmKqBSL4SyBNI5PmaTQpBtZeFjkDGTiV1VXvlaa
	YpcMf/ilEFWwckUNFeeKRCnLIaa0mlQXTYofZNQfa6ZzBrDNfue0eZBO6v3BxvwxR3kOEQ6ZpOa
	oMxw+UlfW6Jo+jAexFJPvx6L7zr2v8M4xznduvAyIgIqVoCLMa3RM+pt5BWFAyWnvw5rRQA=
X-Google-Smtp-Source: AGHT+IFU6iw0nh+JfwxngddrMbaAdOgnyTVpsEnCYJPukcl1HAYkzxRla7dTLdaaFau0zKRt4TXHew==
X-Received: by 2002:a17:906:8470:b0:ac7:4397:4345 with SMTP id a640c23a62f3a-ad85b11378bmr178652266b.6.1748201179389;
        Sun, 25 May 2025 12:26:19 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d047738sm1578899866b.19.2025.05.25.12.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 12:26:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 25 May 2025 21:26:05 +0200
Subject: [PATCH 5/5] dmaengine: mmp: Fix again Wvoid-pointer-to-enum-cast
 warning
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250525-dma-fixes-v1-5-89d06dac9bcb@linaro.org>
References: <20250525-dma-fixes-v1-0-89d06dac9bcb@linaro.org>
In-Reply-To: <20250525-dma-fixes-v1-0-89d06dac9bcb@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Vinod Koul <vkoul@kernel.org>, 
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, 
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1089;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wf9mMF4piwylWLERQD6eu/HVFRIY7xIhB8VCk+ieFdQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoM27QVOIFby5xrQ2vikjmTQ7sy/m4A+Dgt9+tq
 viv3z7R1WGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDNu0AAKCRDBN2bmhouD
 13XnEACJx5d0HBGfD5BYrQ/0oD8C7EAM3yTiKzycRx0rnOvdsj40fPEbcAEVzJWDBnzOojfNm6D
 lnrDDw49hqQIGOukFQsiJv/gZDfBaUJw7+Dmtv57AjMZ585U2DErn1tA2ts/l8KZ4G2m23X/eFK
 BBND/wfdmH4dlObFa99BwZ/25oozbvMPTm4vX/w99ss1IfuHu5ccWWTWWPRT7UhGKKEjaP0DKn9
 52jsFGQqXwGXeXQlOeOhVZ/sRVW8qTABHRgDoNS8jnUAZc1JyimVR16JQTQYc+FhBXPvT+HC4Ds
 JTTxgv2cB8/KJSg3TD1yXecjPEC14rrhX9hLg7MwERfca5VtUOgATV/iRGO/6Yam/XNwHeCGm3a
 HWsKhm5Jor2ZFKDzphxNICY4Hlfn05hfbPz8CictbHrcbLFLQhvujVChlYOA+yzUUDcU8ZHuHuL
 wq9KcgowFM3M1pBICip1f6FPIIJ+1rvfFNIX+bWNvcsHECHzL7gStOswCNa/BGQS3OdLj9rTgOg
 hCJxryLHK7x3BkTmWdJkqhVkc+p0/4jjmtrZeYLpMo10JtVV8ocEAFD4b4sGYK6HIsWpXH0LHrf
 OD1yWyRuahfwIM4pACg81vcfiesVeEOYgsWaUrFbe34fn1tNlGZIA4rvem0fMjGYuiwCcc2wXaJ
 6MtXrUj2ocfKrEQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

This was fixed and re-introduced.  'type' is an enum, thus cast of
pointer on 64-bit compile test with W=1 causes:

  mmp_tdma.c:644:9: error: cast to smaller integer type 'enum mmp_tdma_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Fixes: a67ba97dfb30 ("dmaengine: Use device_get_match_data()")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/dma/mmp_tdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/mmp_tdma.c b/drivers/dma/mmp_tdma.c
index c8dc504510f1e325017ba4fa5e7aa72b019e3be4..b7fb843c67a6f247395296fc726f7b6cab7d223f 100644
--- a/drivers/dma/mmp_tdma.c
+++ b/drivers/dma/mmp_tdma.c
@@ -641,7 +641,7 @@ static int mmp_tdma_probe(struct platform_device *pdev)
 	int chan_num = TDMA_CHANNEL_NUM;
 	struct gen_pool *pool = NULL;
 
-	type = (enum mmp_tdma_type)device_get_match_data(&pdev->dev);
+	type = (kernel_ulong_t)device_get_match_data(&pdev->dev);
 
 	/* always have couple channels */
 	tdev = devm_kzalloc(&pdev->dev, sizeof(*tdev), GFP_KERNEL);

-- 
2.45.2

