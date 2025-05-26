Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686741FE469
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 10:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748256616; cv=none; b=EwX6qEMj66FIkbhp4wtbsArkEX+R2DxIE/dSPYLfM+y+yJsv6yO7JH+leKeV0Qk5vuG/qF1ajC+CPTl+xBoU5p1bDDaX46GtGD6BR1xZuz7ycZvdLEbsGhygX8rzega2kS1gQpkvpwkSm2bgr52wRs0vHZD9aIW3M74PDzLmuEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748256616; c=relaxed/simple;
	bh=BxJ2y+p3e45IzKOg0vhlHvkapbzztQvH0zmQluqHJV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gvnLDYLExjn/dJag9VgfVpZfWV9MiGogv9icWeQyHRD9+g+UC+kNocxLPwQrzUWD2r2A4C+4tBAsSob+epc7o2gfQtC/Q/usIGlSJK+lVneN7smU0Ej47aSz1R9E8sXYOwiVcd0ohFQfmJE1vL7hj/+VhpPksa5cKgOAnkDz374=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y4vfCAsM; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y4vfCAsM"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4db4d1bd7so95146f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 03:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748256612; x=1748861412; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1F0JJbw/NsRmxDzxcjla28hDif9xWhQF3zZnWHAIyc=;
        b=Y4vfCAsMjZrHMN/+FSpKWZMoZ1M4FS2/SxaugAteNgqjJrn00BpiCOcmGZ9gloVYcH
         CIGjzvkA3hc9WC4bPaVMEFJV1xCqx99xBuKol4Dj071ji2jpXFy6sjYct/LIPAyauIwb
         peV1X6ZN6F4b8FuTPLmWigJZSPnv4reJyCfUbe8CO9Zzuh7WrHpT44nltphS0GgmPJsf
         imk5QyatvnX+Z0OYFspzR6lLeuv7nROpsfrPOI4ak+PqsdZRflaa7Gc24J0UfkTCAw1l
         KOBFviExJPrOlKcI07CnrdS633qWgmfhNAb5hUJpkDEUuA0KvdFSGepgdvjt/nnyvRMA
         7jdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748256612; x=1748861412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X1F0JJbw/NsRmxDzxcjla28hDif9xWhQF3zZnWHAIyc=;
        b=quNRwxKlXklOLQpCLnq+3SSzhpRK2ks1qciRqvAEESsbel6d43VFEz2nB+fjozYFia
         zoF/E9o6GvwA/IDyk8JYD6Ub/TTsthb1Rikc+89fXEtCqFBspl+NgKWDBt+DcLlGqB7j
         DA4YPFBz8SXVBdV/ObqkSmBPG3qpVwatMALXKyDBfac09OgWDMr6i94wmU6zJrwnNHHZ
         eV1aQkTZBkKoNkiYRIQw7ak3PzFHd8FewRUC+AeawbDfLbpnFSCZxH+fFKZ7/QxLTR8z
         ExW2Q8PTyt9rf0a7vKlDCMFrEbKNeC0gRb3+oz9Y/fyC15Grs8rtgTLkTuDXgIMwl2tw
         tVkg==
X-Forwarded-Encrypted: i=1; AJvYcCXfPGrrbfSjXeSDFhlQcFTA6FQ08GmT62z1Moh2w6rVhujGJeMWvnntN+whUmLxCX3kPOmVXuNgaGwoi/c=@vger.kernel.org
X-Gm-Message-State: AOJu0YymVBEi5N4P3eF2oGjEsXOMnIEH0dZe+Bhv/kIZNfhyrhZokQBd
	H+AehX8fKFSpN3FXbwlcezMfJi8p+6Q5D6hKul+KkWYXaDOpWT5JVVTjC5FACjQdWnwGUFePetQ
	WpnxQ
X-Gm-Gg: ASbGncvLZOvv5jiYK1BSSTSw2+pX0HqkAfLJjwoxJgxAqavKPCQi6iv7Je2AnXz0A36
	T57MHhcNEfO5MsqvvRLQyxbZaXp9cu+oiKNW1cJmnOhBXTTgjwJBB3HuOFOQo+hRBAks45uK8sN
	fd1CjoYpewDS0TkwZ4ULbmiksOSorOb530L7417Df7JS6q+PBq4fe33IG8GSzsduLCI2vO6FJAZ
	Ud3ijirN9Z+RY/285BhplCMvFsMhBTXwU70pMlcdFYB7ZqgMOD3BISLF/r4TrRIp4ezleSCZR2d
	jkmahyrvOR9aphDeoXGnMzuj/7CO4a56aufxkat89wJTJZua9oVBkkXFyH8rtEgG2fJgkEo=
X-Google-Smtp-Source: AGHT+IEc+gSI4dz6PJb6XB2/tm1jAeKYruuziD5I3xYLt4dJi41VULpTVmWm9gG7qkHMbwUWLampxA==
X-Received: by 2002:a05:6000:2082:b0:3a2:133:b1a4 with SMTP id ffacd0b85a97d-3a4cb48a237mr2078199f8f.13.1748256612330;
        Mon, 26 May 2025 03:50:12 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d4b68sm236337215e9.23.2025.05.26.03.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 03:50:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 26 May 2025 12:49:55 +0200
Subject: [PATCH 6/6] ASoC: codecs: wcd939x: Add VDD_PX supply
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-b4-asoc-wcd9395-vdd-px-v1-6-64d3cb60313b@linaro.org>
References: <20250526-b4-asoc-wcd9395-vdd-px-v1-0-64d3cb60313b@linaro.org>
In-Reply-To: <20250526-b4-asoc-wcd9395-vdd-px-v1-0-64d3cb60313b@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=881;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=BxJ2y+p3e45IzKOg0vhlHvkapbzztQvH0zmQluqHJV8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNEdX6ua3vxOKUSyAOM3GRxHgAoDMRana3x+JM
 90uDzTcvgGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDRHVwAKCRDBN2bmhouD
 13R7D/9pPE/aTDxvrefDXj5fjGmq+RVR1zaJ8Agf9aOCuT3EVvkdIo8lnsaXmJqllZsHEGXKfRY
 FFO/lYuKpmUDwSSgPRwij8JS+gidxWuCO8koyagq5HTwUNLPIuUl2k4m6k/KG12o31ALQsT/pMG
 L27VghMwOoDVf1EYL+2Te+O44EUiP/WqWSwQxHFi4Q+HuhynvtjGANzsz34PEapB9qfcdCORaez
 haOIa7lopyIwHUMFTkVfVkabOeMAK9E65AVzhmpB13eeOuKNtT3UT0jLBwA5XdGsgIpms9sqEAS
 /qwtNtbzrpDV0FbDqisgQwtpLbGlraj1S1yv9v7WMOQqQoZsx7Oc4xgWWGeNoaXd9yMSuWsh+Jw
 4gdkx4407sADLbOJGwC55BU5EYiw8Sj2fd1ilSayJA2Lu7nm9WspJXuQkhOsaXTLPNFzEwDwH5Y
 g8Gmi2cTPKM1Ev9K1Q4wjJLf5HkwBToMfSPDpjtj3eeYIYh3Ykrl29xMmE87rXiZY/UGSh4bwEg
 1kxK+BglD9gRf016XqgXa66rn5f9xzer/gUknqVSfTXZJiRgazqLzQu0Rcbp7Ma/Nz2q2nCET6D
 lC0eNpI12nxjFIgE4pupQr2AN+BjG9FqsfhgCvSv4vg4nv7H51ZLK/iQSje9VcZqi5UnubWVpn2
 coOXn/LkmU9OP1g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device has also VDD_PX supply, which should be acquired by the driver.
Regulator framework will provide a dummy supply, thus the change is
compatible with older DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd939x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 9592462f2d6e3067a2ed3339ddd5f676eaf3b5ed..690832037b5dcee0722e118536a45cb70e5c61c2 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -212,7 +212,7 @@ struct wcd939x_priv {
 };
 
 static const char * const wcd939x_supplies[] = {
-	"vdd-rxtx", "vdd-io", "vdd-buck", "vdd-mic-bias",
+	"vdd-rxtx", "vdd-io", "vdd-buck", "vdd-mic-bias", "vdd-px",
 };
 
 static const SNDRV_CTL_TLVD_DECLARE_DB_MINMAX(ear_pa_gain, 600, -1800);

-- 
2.45.2

