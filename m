Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA728221DB2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484441; cv=none; b=TSJaVsINnLl+RNXrUaKKAq3y0eC0CCV5VxotbcywhNFWq2jODgA7GQ++cVmUu5W3/ECxrdZPl2g0769lrWQgcy8qqfaRoVkCvzPxvNGGobgu0QDgI6s4Oo/CWB9BrGL6wYwubfmKwLGCkknPvZrb5sGq5JdBJZLsdJodZVx/seg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484441; c=relaxed/simple;
	bh=52TCmL6yze6IijtJ2WL2G64ThN9FilAJXpP1Ma1xS0A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n/D5FKZQvvnBaR4nGsm4X4kMfvncr0OuUF5KkkDKwWQ1QLLMdRWrsPKrP4zlwKx+iDg0o68bXf+/T1IXt76uGA85NoO0Q7nlSFKSlM5sCdurHbAJ/M5kN+lRbFg8aZ11C/BpTIjgErQspLJk6QS+Z/m0Z95J0bVyiwG+jTpryNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DK6B21/Q; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DK6B21/Q"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e83e38d15dso91697a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 01:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745484438; x=1746089238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TkKf0I48EJEx+ulabimoTgG6CaK78BkumSkM0fdq280=;
        b=DK6B21/Qb7MO8Pv39twMKZA7/LSF7oKb/OlLTBYWTnrqRWmCDHL62jPfEbrqPp2Ogd
         uzQvfZvWsut4yfP6F2dEAhrU2TBmqCDk16vmSNA5TyJDfSkqHQEHjCEfxYBpnD8AiwQj
         2fF2Mqj8xbk7vtmkfIs90eSVECJ0aNNiJ0WAKoOO9bwg/A+O35Sc1/Vt++81pJM8fNx6
         XfK9hc1HZeDSGKTKuZsULRVrROKrxEPU5vPWuQaV32KqDTckP0VSkZSzmFaFCocjNpLZ
         ay51AGAfcUzlUbqTBQhcXORm2dlPM2uRgQNPnp2Hgkcm3GdKL6WLZVHy+hVQCp58NVS+
         zvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484438; x=1746089238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TkKf0I48EJEx+ulabimoTgG6CaK78BkumSkM0fdq280=;
        b=Did1IHYrRkB+tNRXhZXFVQQW0aOZ9jNRci/rqifMkKuE5jP9GaaQNlsgCrzwaQ6tk6
         fV/3wguyQUFzBqfP7QA8+Ke9ftdNzN5fkGhVK4EnwdPg5XTCo2kmE+RRDd60Aa93yQfh
         ykRyZPWA6L+Mu7pKPDcxYcYKRN3RAr+kcU8k1LHb3LjqI18O3VjcK/BcuUwntJzLxP1T
         ymS+z3S85odFrN0kViwoRMRKQoxfvhGOwMHpHXLRe2+VDRZhTPHMTDGT/j00P61Mt8UA
         LAZwp73X5wyp5Kc2KnnndAsv3hLu8d9Hzxew+u/aqpfZIyBw4oLLnPYfDUTqWzN4wftI
         yYKA==
X-Forwarded-Encrypted: i=1; AJvYcCUGJdQWYVNFTGVr3mX+7NIGCKWzUNgKUvB7ygLekpbvZKzqZ3a1Eec2WwlpRvueWO70WI6Iu7aXY/4w1rg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyno+4nBuN31bQhjKReLtE6vsr9u4e9x0Yk52Q+zad35G2drYZQ
	PPhb7gsUeNgH+C/wulu7bJySROytx/z8iq04XgE8HZXN2g9XQILqN4LEu+JtMI4=
X-Gm-Gg: ASbGncu7NAshNEIY0UJrfO1rKg8aPtF9w2gBbvnB7RmH9G8+yBRCxfSmALvG73d2i3U
	EEsLcrckebuAZUuLZ9ZY9TTrIHmEvAJq7yOQMQ8h3EgWmiTjxdxwDRmatRqeFqi2JOcBjHOLhmf
	bOss2xnVimVKVTpl8adJ2TR0CNc99ocfVRfeyffxTzNIfweiKRhQswvFdY0HKEublWxgqb2a8kF
	nVsLhnq/8SkyefFUZtT2WEpk5e0uByW+FvrQDaKT/YZDkzQKrxCn590pXUNciXgOJd77o2M50QF
	lT3iYCcT2I42P1Xr3GG/9H9t0OzGMPtu90l9s/CDN6+pwDcBRQ==
X-Google-Smtp-Source: AGHT+IG+cDJAHdn4/cn1tiQb1bWyq1Uzz+FzuMRv4Ggnd/ci/fWTGljNrhaBhb0RjrZFEl9cMFNaaw==
X-Received: by 2002:a05:6402:51d1:b0:5e0:82a0:50b6 with SMTP id 4fb4d7f45d1cf-5f6df233ff3mr581983a12.6.1745484437930;
        Thu, 24 Apr 2025 01:47:17 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f6ed9e1ee5sm802171a12.78.2025.04.24.01.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:47:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: qcom: Align wifi node name with bindings
Date: Thu, 24 Apr 2025 10:47:13 +0200
Message-ID: <20250424084713.105080-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
wireless-controller.yaml schema"), bindings expect 'wifi' as node name:

  qcom-msm8974-lge-nexus5-hammerhead.dtb: bcrmf@1: $nodename:0: 'bcrmf@1' does not match '^wifi(@.*)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
index 261044fdfee8..b595022ca025 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -598,7 +598,7 @@ &sdhc_2 {
 	pinctrl-0 = <&sdc2_on>;
 	pinctrl-1 = <&sdc2_off>;
 
-	bcrmf@1 {
+	wifi@1 {
 		compatible = "brcm,bcm4339-fmac", "brcm,bcm4329-fmac";
 		reg = <1>;
 
-- 
2.45.2

