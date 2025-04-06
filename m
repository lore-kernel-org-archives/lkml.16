Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9092204F94
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 20:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743970619; cv=none; b=pU7vFN7B7oyZuxTV/66ZGks+FeEVKWuf8evDSF5VufO3I/8gvIRHuH4lenFgsiSqOYSRTBchrN3/s90VkfVnPDXEAcUptCYzB2C6KQr3a0h+H45tjvChMayFzmGn99KQH2ryxZt2400r6LFLlCFstcph4JhcO/QzcclzpnqHaBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743970619; c=relaxed/simple;
	bh=Kaj9yPMcEEiMDLRcwdbnZDC+/5p/KQ6EFeBalyk7a+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dBKC/Ij9samuGzB4ncsBKn0eUA0zsVNG1TRuplLKSxJ8VsiC6KZHQ5mBDWypGT14FEDRGaAnZBo+eleQAj/KI4/rzBLXWz49eIEMduIr9U45ZyqkDjrhbd0APriN7b4ajDIcQYD+GJXidCKhgdOftP+xyit+LknTycOa7ojRPdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mz6G8dP1; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mz6G8dP1"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39123ad8a9fso370146f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 13:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743970616; x=1744575416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A5+V4XWX6ik8XXfemjH2aaHsT36827BDWO1+WiESIVs=;
        b=mz6G8dP1NLkSP9Lrq8k0yQDAHvAtX2hZZAIdcw9iwDPlaJgs2PU2qwfJk5CGc4OsGT
         JQFI20lZYHQ0pq3ShJzEo0cN8yJCoM19Tne4XkEflI4VZjCy3frWbPJ/zePiXfAQtC4/
         cwfH5mVYbHvlnhf/VOSMzaSARVLiK5ykccyXztkhMGyg1NnMisAxWdPz8fKqEu2kUfRI
         i19Bx2PxF9JOheK70ocX6wujomypFwzgbnYskt/BUiv7Y0USTfYC1PYCTFQQ7HYKwY7m
         NZwrKXAxZG7B/eB4cgZgIsIwNr/r4PJywTfEJ3tz+1G8sb9+MLACM57Oqpe9Xx78iTqt
         3LWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743970616; x=1744575416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5+V4XWX6ik8XXfemjH2aaHsT36827BDWO1+WiESIVs=;
        b=ABIfzwtuEupDG71Fd9cIUlm4F4OvtEq6zaZJi4QE1MtV8acafX6/uWFI7X8ulNnPjm
         Up/Mp28fJpNbfob1GPRGsd2pztF/Y5dEj3qR/ORBeFVIO60i79nPVGjNd2Cm/mrLRAoV
         juk6YdBoTMcmdbMovzQH/PjiQyDeirYlOWpft5/jPONGzt04pex6MTSaH33Cs9WfDsam
         mTqWH6TRyoawcGAABKdu13HWPJIfjQ5whGyDGe2hvmlX25I7wRbKReEcsqoOiZY/DSgs
         I/q+S4CdzwFefOzZ+TeR/127oOJ7LIW3qgaoo16iGNP7j7Gaw4wwadXhouMAFz2DuoqE
         aDRA==
X-Gm-Message-State: AOJu0YzMq4YgYjQ4S0EbF2gic6PrmiPFZrhAKbEONxa4vJh4VPO/H91Y
	TSyhnKUvXg1jNyd2oT+lvZ4Akipa8WoCh1mb6yOGVlWBr3d/yexsKSLOk6E20fk=
X-Gm-Gg: ASbGncusnNRVqHSOjrjcAeCwd5n1RB0BDhyOEbX1rX8FugYhVPVts+U1kacLMqPgPof
	rCXwZqWsU5I+ubBhtNn69yvKXKLUMyCeKA/vQPKdbR6v+PM+xvb1Kxoa2e1NEnannrvd/TpzxO7
	kXv5Ht6VKbEFoVufpq6GBX9qA75Sw7RRjlNJDPTCrTtZg+6loiV6w3012H6KfNplTugP9qrAY48
	PF9MzzuebGGD5BqvKDjXl5V1jkFGBTRzbArYF8fmRyMft5Pcq57f+x2sn8zKkBMgZ6Nha/tkusE
	b3NYDSXMw1d0OnAWGCL1x3zlZd3PyOA5X/DvHMa5TKtlJ8KecnVBwjETTYKIAWzywCjsPzpjHA=
	=
X-Google-Smtp-Source: AGHT+IG3SkOB5mChKZuFqVQaiw1v/CrzGtpVH+xjt2NBrQMfv21qD2ytHbccZQ37eVeGOpP1nkljCw==
X-Received: by 2002:a5d:588b:0:b0:39c:12ce:1046 with SMTP id ffacd0b85a97d-39cb35a2333mr3406474f8f.6.1743970615907;
        Sun, 06 Apr 2025 13:16:55 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d68esm10295521f8f.67.2025.04.06.13.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:16:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 06 Apr 2025 22:16:41 +0200
Subject: [PATCH 3/4] extcon: fsa9480: Fix wakeup source leaks on device
 unbind
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-device-wakeup-leak-extcon-v1-3-8873eca57465@linaro.org>
References: <20250406-device-wakeup-leak-extcon-v1-0-8873eca57465@linaro.org>
In-Reply-To: <20250406-device-wakeup-leak-extcon-v1-0-8873eca57465@linaro.org>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Hans de Goede <hdegoede@redhat.com>, 
 Chen-Yu Tsai <wens@csie.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=741;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Kaj9yPMcEEiMDLRcwdbnZDC+/5p/KQ6EFeBalyk7a+o=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGfy4S7IMNz2a70TDXFdUMTmD6CqBec6xXO7TJbYaLKg5+ec6
 okCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJn8uEuAAoJEME3ZuaGi4PXk4gQAJaC
 zS86EVrLWr114yL1IUjuj6d0KWG4ibRfEpWO4DG2xmikymthVVvYTl4BDhjLSw93DqSaWx/udWz
 RR6cr9eVIh9dPEb4dx7Zw+flUt5Z9XHnhjvIUnKgKoCOXvnPQuZBpM9DvDjAb66PCA2iU6+7M5X
 5VUEX6FQ8CnB5JP2F43n+VaBnpbGod1uTLdjjSb2RrIzHtZDsdhrYmxg450HJifQXnmcBtLeXYS
 2Tv/adlP0FuHMhhaF9C6vAD7yrGgoUtkiPhc+xrGA8gdhVbmRuFSkhj2S4ymnaofWd0XNIDVOwv
 bSaexrvTexY0giHjbBQkjw5O5nVv4m1y7Cjyd2PEwHiKTToCOKWmtYwO5dbm6zzTQ2n+20bQ3ly
 rwxqvN8LENXWyptGnD/79S9gv3YbduSJWe0uAR4cg6+1SQSjp8h42fHLTMupkJbDpqK0XQRZ1qo
 16mLRLqhvJgssrgXmTW3852KIayqu6U7GRnFNEl97vDCT1uS/ARz99v38DojvZQhV2484G22ijK
 VN6S6HouP3vfzwphLJkRiOxmu+UuRdnVQluHfMRD7ynyBvvTLgVt8h38pKDofOsfkak4/fkFugh
 q5+3bQpizsAFBu40aXQlwrfb1CsHhsaoj2S4WgkwUe7e+gkxjvhVK+ra0iimozHArOvL9dcuppG
 BNZ3r
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device can be unbound, so driver must also release memory for the wakeup
source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/extcon/extcon-fsa9480.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/extcon/extcon-fsa9480.c b/drivers/extcon/extcon-fsa9480.c
index b11b43171063d6dc14a5a4a7efb63e610397312c..a031eb0914a0b68aacb0f5f1f522597ea286fa2b 100644
--- a/drivers/extcon/extcon-fsa9480.c
+++ b/drivers/extcon/extcon-fsa9480.c
@@ -317,7 +317,7 @@ static int fsa9480_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	device_init_wakeup(info->dev, true);
+	devm_device_init_wakeup(info->dev);
 	fsa9480_detect_dev(info);
 
 	return 0;

-- 
2.45.2

