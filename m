Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E9B1C8625;
	Sat,  5 Apr 2025 23:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743894963; cv=none; b=n+2W9/T6WtyEyY8bveM2O3nnHJVEGcehmjY5EDtol7u1tiJrhEOu5ztcBJb6L4AZevPquIw2KDLbL3hyG5o5e4SF/woPgFqaPBKZYq+Q628s92k/06+K5tlZgjC6HvRv+bEQtPK5xXCn6f/cxxowIeQalNAkoWNI1+DdHD2DiA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743894963; c=relaxed/simple;
	bh=NKoEg61ykul7LJA/d5/4y5aypypGyjWZZdHNgsP/B1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ArN87vdHIHq8LSEPzZL1GQChWVM/66cYXADQC5BmXLQcc/l6qysYMSjYPmI/OTLC9nTs7CLXOBLr0g/qds5Uskjy4OCqpWf8UoPBh4Cd4SRk72B72fZobW57D8Ba4w7bijW91MvkesBJMycIzF2+wpzorz02yE7OPXGYMrtSxd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vn77f0K4; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vn77f0K4"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22548a28d0cso43275665ad.3;
        Sat, 05 Apr 2025 16:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743894961; x=1744499761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZwEITRysV/CTBC7Bt4CSH8RxtTe6q6jNA5tekEdNXE=;
        b=Vn77f0K48xkUHwMxFhiG4BVpcyN0VqVEBm7XovVJ4phXvjN4PWNUcPtmCBMEaTnJzB
         1cQHiF7/6/GlPl59m9uGU7f1rRaC4l06pFy7TDxt4lNehekvuqo/dfgLLdVD3QvjKWpg
         /K5jbHTQK9p4o0cGftLz25hlvY79RpIRWpiNDcoyQ8uNGvMOMhTUXU5RGbxTeQNNqKoS
         /qbYdt0QbV7kQ9BxnKbR9pghoCS+B7gWY3i3OSXbD8aCPydh6jKSkXWpvmCg8KDWPp/p
         8MBegG+DhqN17dvIOTj3seC89cG22q3p4W78OZ5CdcyEPRnSjjJgFCyAKX73Dym/60YK
         7EDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743894961; x=1744499761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZwEITRysV/CTBC7Bt4CSH8RxtTe6q6jNA5tekEdNXE=;
        b=X+XRdvsVZKBjrHkFZPDC4EkIEUFYFfTs7XSGGuP52GLtl/4hKxpzV8q/3sn9v/HSf0
         zsKGzspdYZLcHT/eIaKeDNg7YN6dUxszEfNwh0TDXpBCwy2YjJf2oz1qlGXs7TZKrWIP
         8t6ULU29pG8/ldaO2gd6aAdx+kdQVmXSgBWDeMaXozgpa3oAK5t75vRaJbYkVYOOMp9h
         hjeik5qVN4PP/MRscQT+QvUiKCCpAc4MiGAhHFU1x4zx1KW8SNffeN3cYksuLiGBytNm
         Hfl5nhjXwNPdTFuDHlRNDOLnV0cwpF/wmeDNm9U6cjykH/1NBQ6Hjh5IJfuK8P3TYcvt
         3+rg==
X-Forwarded-Encrypted: i=1; AJvYcCU8OkveufJQSYsAGoBEI++4cmSmp4Ve+mhX6tb4pXvTHzP6oGA3iO3wahhkTFpLC32O5QrD60K1zPeQ5bA=@vger.kernel.org, AJvYcCVxRRazha+eGQQlC1EG44CM0PFqrZPkuYT+CZGJTSQpFC3zp39VmO5Y0Wb+2pdBhCt6eFrpy9JtittT@vger.kernel.org, AJvYcCWwWgPq/UGSHM6Nr8IRfyfUyL1NvStElfVOuPYahRG5fkZi2nWs1hhPLrGPlcQcV7W/V0QMLY1spPnq/Xn/@vger.kernel.org, AJvYcCXYbmS0SW/hhIVKhopVLrwBotfyCNJyIBcH/Dl2BuXa/mnfeHXS/QiWkD29uSSu6pBokDVzC1fRVjibsbk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkm6h3zKqWC+JdPGn4ByWvqcJ+l3rsGKkZC4XMSKo9QaA6zLPC
	3UBCexWU1W2As7TkBOWkgzqP68VJZK1nF//5DltjSzpuumn0THti
X-Gm-Gg: ASbGncvHee93SsFwwugdTStyrTbYYxU+ZyLiEIrBFBf44lE289b+hBbjF29apGkVXKL
	h6pQTkwbztObWdVsb9vFF6Y8j9/45NcyOLGdQ2nlYeuNnEKcsIjctgdw0Gnr5UdK3msxmfkh2wm
	dUNsx997+4ersy5dJdn/HRpb1H89z32V4lxLBGu019ihMRycv1+UynIdEH5I7mQsYF3JgMZZ5FX
	9Efa2K05HShbns4zCyARbKS9fL3Y0WXlM/gU7eiDM3phcDtQGCyOlYs567uEpkVP9HZ7ukoDfxX
	I/JJsimHh6DJ4MP8tcD+lD172LrNXvPNvwGKOPG2/7IIyGmX6L3NAcuCOmNkpxnr/Ghw7E7NJZq
	0OnlV6d2Ngo08uVtsIA1usQh+c56i7djlPFp5caY=
X-Google-Smtp-Source: AGHT+IGG750Fc5A1dfFEEYjJ56maIziG5tfTLYOevsCGnu8/cR4+rqBu5vubN9qrUcKUfYucyYwy6A==
X-Received: by 2002:a17:902:e749:b0:224:13a4:d61e with SMTP id d9443c01a7336-22a8a8d31e9mr97517265ad.51.1743894961245;
        Sat, 05 Apr 2025 16:16:01 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c994esm55048345ad.102.2025.04.05.16.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 16:16:00 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 06 Apr 2025 09:15:08 +1000
Subject: [PATCH v5 4/8] ASoC: tas2764: Enable main IRQs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-apple-codec-changes-v5-4-50a00ec850a3@gmail.com>
References: <20250406-apple-codec-changes-v5-0-50a00ec850a3@gmail.com>
In-Reply-To: <20250406-apple-codec-changes-v5-0-50a00ec850a3@gmail.com>
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
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkfd3aKtaodXv3ySvGhU6ULUheHG07gmXKwZkW+i/WN8
 C+eK4QPdZSwMIhxMciKKbJsaBLymG3EdrNfpHIvzBxWJpAhDFycAjCRK92MDD+jvfrfzDRcP+Gg
 0T75Ak+/Z6tfxOyY06+XsPUkl/4v/W8M32ubVzMtvhl5g72T6/GpqQ1C579M9eiUCZyoMc2i75c
 XIwA=
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

