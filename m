Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4551D52B;
	Sat,  5 Apr 2025 00:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743812023; cv=none; b=IlGPd4uNoWdYAVM8hHIAGNVXN0oGtEe6AgcqN6OpzxW7MYhmxciQ3gLb33Ky1RCJUrHYb/kYSuHz5/jQccQG3K8P9pg6m9CF+70ygQihafP4D2UbAj2eLDaqariIuDFa3kVwNFB1p7R8mifIPFuAiOJ1+mZfo9Y6UHRv6pmnG/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743812023; c=relaxed/simple;
	bh=NKoEg61ykul7LJA/d5/4y5aypypGyjWZZdHNgsP/B1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FtTs3MKgodJ4lfh5YKkcUKkwl30Kk8mW80LSiIid9+YdlFrra1VC2HEfqHj4fG6yUPhd+iLPx0BP5nig8Q+toJ5QOuNiVpb2dVT253RJA2OmNLHPUHb0CqreN6zASsyH+ZN2O7sZed8MyvKsFXosyJ4pneGiSUIHT3RdpG4XG+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m0PDJSnO; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0PDJSnO"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-30332dfc820so2528019a91.2;
        Fri, 04 Apr 2025 17:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743812021; x=1744416821; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZwEITRysV/CTBC7Bt4CSH8RxtTe6q6jNA5tekEdNXE=;
        b=m0PDJSnOADxnED7OKa2BRz4rk2MR8gViI4nCuQ1Eq2WbLuUCgwcvXcvaOvfuAtbfQi
         mCdgtRrXKU22pI05ILMoZkRPwtgAeaiamEJeEKlW7HiEEOKHQ62jIaxxHtxU9AZmknLC
         +5yLNyy6kDKJE+NW2Otlghd7WII8192lOlb0hFLwqAVk7xYxDGnr/xoaHm99rNAtHfD8
         djrEyWbG4kViJlPgeJnvpwkxJmpefLG5CXnauonWqdt+SWW5oHOSHPeSvYExaeoXg/Xl
         2s7eG3PA9ERevdMpDewL6g6sQQPv3DSeVCU5jAmU7ThSVi12TCpIGVhf8S1CIHewPafm
         aweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743812021; x=1744416821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZwEITRysV/CTBC7Bt4CSH8RxtTe6q6jNA5tekEdNXE=;
        b=nvLAmuTIkS0GKhhPbnO+lZZPIITWEfhPBNfEMhNz7an6dvRB6jThFqv5q7h3NuqgRn
         j1sKhJ51nUxaShyaq4Pel8IxWIJlw6ySNJPSXA9GPQvwR15qceNoxRpkXM8zKUgCJdoa
         z7vMZPyJ4fhEm6C562P1q2FvsImByzx8UIEmdt2A8v3IyzTrjAJfolFexBhcZfrOuDTp
         o45MwSRVex9UMT1ZGzAo33BafjU/Vj1yG4UAHPp2ZGH2QvYHRSSGdlXCxSCPTmM18up0
         4VVK/q2E1VyGvwnsvSXykt8YJxsDt3gKjzak55yatn4aiF3cNE9hOftwzaXj6MHdNV1K
         fKjA==
X-Forwarded-Encrypted: i=1; AJvYcCV2xulJxIIDwJrIeePtuNTq8dgxWAwUJ/clSsu8w9m2BZpTrfuVYqBB4N5VqL23XGf6uwZ9D354jMHuVa7I@vger.kernel.org, AJvYcCVA/uVMyoB+tLVHP1cjqs50RFtOJl10BLL3oykRbPE+4DJy5iubr612XUAjHEVQFq1MsZgaxuRw+kyKEgI=@vger.kernel.org, AJvYcCWbAcKwQqnzQH5wqkLt525w4QeiXXVcJyyMuOqdr9SmBoKoff+gUgTFbuENkY9DW11/Bx8S5xf9BgFc@vger.kernel.org, AJvYcCWiNljZ7sLEE0PmxOJIVCuQOr7e9cj2cycEluGHCTU7kiOkc+KH6ioqens3igbgBZoVOQNbC/Mvw1gJMeQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YztqNzU9EDB4kvj+zVxNbUy0OZugO4SCrYnha6J4xqGWekYiJdj
	Kx8JMcfCkTygugRwKb+fGYAqZqmaIlc8ePcpa+I0HoG7PizhvgVyq8DV1fgH
X-Gm-Gg: ASbGncsdlwHG/03qjdWJeHWcqT5O4Gb8zSmG8FQkBTOoKaCjAJJ0fYbL1m9IViOiuMu
	dYPg6dsgWW9hmpUXJ6wqB3k5l58br6+JKmiiBGqu536khjHuzDGSxDe/RIiv2rKQ6yBE76fYc5a
	H+3rYxEt0ZM+b9ioBMDaItDVNWI6vK71uurVNogdCbnpJWeb9Vtl0sLkRESe2xmJxNmRBWqC44e
	DP+GcTTLp6nlgmTa/up0K9+c+lwStTE4YPXuae6fjx8Pdy3Naba1srZ0Logivuc0JWd39fPK1xy
	6+JECNZD86c4qDYrzz7R9ZTyWxZUaRJXynjxK4+0xNLvXtU43bNA0wN1JI8JmCtOU5FA8ygxAKt
	VA1m+zsHblGz8Xs1v9EbD4ywO4wvwzesq8L/bimA=
X-Google-Smtp-Source: AGHT+IEIW169PzBh+7Jy+t5ubdiKuEPuLSHOaffUvTUeKRApK95r5a4DD1jok90FZKcKGQAUkN78/Q==
X-Received: by 2002:a17:90b:2dc3:b0:2fe:ba82:ca5 with SMTP id 98e67ed59e1d1-306af732df2mr1797848a91.11.1743812020851;
        Fri, 04 Apr 2025 17:13:40 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5d665sm4327855a91.30.2025.04.04.17.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 17:13:40 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 05 Apr 2025 10:12:42 +1000
Subject: [PATCH v4 05/10] ASoC: tas2764: Enable main IRQs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250405-apple-codec-changes-v4-5-d007e46ce4a2@gmail.com>
References: <20250405-apple-codec-changes-v4-0-d007e46ce4a2@gmail.com>
In-Reply-To: <20250405-apple-codec-changes-v4-0-d007e46ce4a2@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shi Fu <shifu0704@thundersoft.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-hwmon@vger.kernel.org, 
 Neal Gompa <neal@gompa.dev>, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1198;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=6OJDDX1zkNT36kN5P3XhHJr3KCVfmEmqMN+HbJKjHZM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkfStuEFr2681rQdd0TnSlxjznfvd8q8MDwUY2W0Myby
 7qNbM7O6ihlYRDjYpAVU2TZ0CTkMduI7Wa/SOVemDmsTCBDGLg4BWAixy4z/I/nfKyn9LR5SsnJ
 grQ1f7maPgpb73ywUN6ML37enHa1WgaGP9zTtlpo67Q7n9XUv9+x+O7/g1un6alMTnTSsalkbrd
 4xAIA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

IRQ handling was added in commit dae191fb957f ("ASoC: tas2764: Add IRQ
handling") however that same commit masks all interrupts coming from
the chip. Unmask the "main" interrupts so that we can see and
deal with a number of errors including clock, voltage, and current.

Fixes: dae191fb957f ("ASoC: tas2764: Add IRQ handling")
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 49b73b74b2d9dd6d09747cabc2b00519c549775d..fbfe4d032df7b26b7db0f7c7dcb47661277006d0 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -564,7 +564,7 @@ static int tas2764_codec_probe(struct snd_soc_component *component)
 	regmap_reinit_cache(tas2764->regmap, &tas2764_i2c_regmap);
 
 	if (tas2764->irq) {
-		ret = snd_soc_component_write(tas2764->component, TAS2764_INT_MASK0, 0xff);
+		ret = snd_soc_component_write(tas2764->component, TAS2764_INT_MASK0, 0x00);
 		if (ret < 0)
 			return ret;
 

-- 
2.49.0

