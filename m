Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D77B2566DF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 16:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744908832; cv=none; b=AkaKBnCGquxxqocBbqD2iDDnBF2ulpuvwZD+6nBt+6RqLWPqyBA12+bXuuRbZayglMMplJlsJIO024uKfuuX3Sn4DCuWoEQAVuPpRFvZ9TYj1BGTpXqrbmPU3VuVqG+uBVoaqbdDu7umnjUXdS4q/l0GAY43OUtDX0LF/90mfsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744908832; c=relaxed/simple;
	bh=dt+1gVnXlBpBf9G5BqjNbQcFysZQg2dzjajvzJ7EGVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hsR/oJG8Ki360yKquaTuWzEGHYnAdZ1tkh+evYfUaWdCAukOWLPnUqVQtdWUJGjGcqOyUW75pgmFwt7c9TnK6huxGhdzZz3ldGUBVxe9xMXBVZOE6++XSfBIl4cEYFl9ZQuRytY9KZyQ3ljG0XWozcilvFNlGNzbBU+QCZPWhUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dTs9TNN/; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dTs9TNN/"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2c12b7af278so674193fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744908829; x=1745513629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+IMlCG6dKgbc70WZaRCp+xgycYGsZNZ1T+JeRrzHG38=;
        b=dTs9TNN/wwrhsuPAHIeX+ejJVco8w5Ms4EGHhT4lkiqmal9O3mBR5ak9qYgbWIfTVO
         w9wx12YFUF11d5tbkjuAiOFHOQzLBRLcUFkXGGHMnD5mhhYzUxkEDAtmZcVdBZqOwVsh
         NzskD+kijJTk6dkRGN+KFjDCq1ACrlNzVhAUCT4hZtznaGEs5NYhTJgkGLo2RAsO2lAU
         cyHka21kYLmJ15+Li8oWGW1FWB63BFiSoUB0D5j3a5trusP8apgb/JcsLI6+vqmB+RuE
         U8r9d90mVTP90a5gIsxW17QW7DMU4YJXIP1/a8UD7Lh2xjy1zIrcisU/p6UNtl7bHH5I
         Z/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744908829; x=1745513629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+IMlCG6dKgbc70WZaRCp+xgycYGsZNZ1T+JeRrzHG38=;
        b=iXHO147nmztoVmXSUEG1BNi5VZN8ClPVdwbJOKLEibucMcfDBcvKmMHR1EmPXk121g
         UoKEKD8YUacsicHrs2AEm2DHlZIWfvjFE91+bCNAQKIj6Kjzv48qRMcbejfD/VYMafSn
         IoJXyfjevQGbinZpPpwpd7KVazmOC5KScr5j4torS/KHf8LgDd+9yXCjYYiW6e14TZNq
         YqcolpyIqQQVdTqHCd0LYAn0DoNJlcyaVrXDM46lkvgj8ZGUde2SUQlCeMkann1Bsy4W
         Bnxzj/8TBQXTAWkq1UaLn+f+JUM5Pb65KxYcU6PO2Ua7PtD26GoQIdxQD8gNdNrW8H7L
         VmIA==
X-Forwarded-Encrypted: i=1; AJvYcCUpMfTTPGjDf5Ncw047t/H1wPsBoYAW8GWlQdj6zlrlfhrVCLWzZabjSycDA5X49tIay0ZkxgZ2DkcftmY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu5x1/qHkWx2uuLz46oYx9FuQ0qlGJsiQo+TBUOxXJWsXBHkSD
	JlDXwGS3HJerP7yigzVkGLil99YcndmoempUKrjD/MvaLbzIQK9HWtbUlp3aNTs=
X-Gm-Gg: ASbGnctfi10IKpcfkDX1jIsMgArmNJs1OO8RzmPodKXNseXYwaTIoT+KWg9tXJyAxDl
	i2k8DCMsyyXO7c2jsIvlLa1x7b1pDEmSnUAlrpeXnlUcJxRwCGJjnFe/teJ7a6492QPj6/lKBy8
	IP04P2Ssd8ze18OXVRlyP2TwkVzDlyWMp96vqGsMlPgu97RMJ/EtuNI//rQAMdQ917r+W9QCyeq
	/vJp2rPj89PChMjHzNBk9f9zh7eLTDhQMLTSaK5ZqcUFM1/qRbUNv9x7CiruLHdvZ/hbNMbxXHq
	TaDKgDIKjNK533vlRuiSxUflgl+rD6gbtcTOdyGMhFH7u9M=
X-Google-Smtp-Source: AGHT+IHWDVE2JOtKPQU7CbidZGVyB/2fs79a+6FRXoQ5Jm7PUZX3WMp/oUPBswy6Dx17VQWL+Mf4bQ==
X-Received: by 2002:a05:6870:af85:b0:2d4:f247:3675 with SMTP id 586e51a60fabf-2d51d858794mr378775fac.5.1744908829446;
        Thu, 17 Apr 2025 09:53:49 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5218248b7sm15812fac.47.2025.04.17.09.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 09:53:49 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 17 Apr 2025 11:52:40 -0500
Subject: [PATCH 8/8] iio: pressure: mprls0025pa: use aligned_s64 for
 timestamp
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-iio-more-timestamp-alignment-v1-8-eafac1e22318@baylibre.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
In-Reply-To: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, 
 Tomasz Duszynski <tduszyns@gmail.com>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Andreas Klinger <ak@it-klinger.de>, 
 Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=706; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=dt+1gVnXlBpBf9G5BqjNbQcFysZQg2dzjajvzJ7EGVY=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoATIHV4NNNWvRCnxHGqKpmu/bY2WH0c2xw0wRI
 MBr9oYxE/SJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAEyBwAKCRDCzCAB/wGP
 wJxmB/998v8PSB/5F3IVjQ/L03FccQbQvgcinddv5IhMAvKwG+4u3ZgXoVkpfQEc1Oi/TyFXTry
 D/3jb/fsR53axXk54ddIaElK0Oird/9HbVfsLw0KOvACbrty85JS48EvTq3UCyt9nHyQHCVsd5W
 8TLc1kECCNVsf6x1LB7DxLrQNsd6VvA2FuLb1a5VribVYxR+okowWqAAmjEu3F4CnAGZWvZXljZ
 iQ1hjfWdxslpauWfw7HRAqmVqLoLhxznPLLpFpGysSKe4XAe3wlvC/jYIVlZRMVKlT2fn7r55tV
 o3psJa48e65bIp8T0K9RY7/W/+GEVn6tymZGuZlaKtYyIGFE
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Follow the pattern of other drivers and use aligned_s64 for the
timestamp. This will ensure the struct itself it also 8-byte aligned.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/pressure/mprls0025pa.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/pressure/mprls0025pa.h b/drivers/iio/pressure/mprls0025pa.h
index 9d5c30afa9d69a6a606662aa7906a76347329cef..9fe9eb35e79d992b2a576e5d0af71113c6c47400 100644
--- a/drivers/iio/pressure/mprls0025pa.h
+++ b/drivers/iio/pressure/mprls0025pa.h
@@ -41,7 +41,7 @@ struct mpr_ops;
  */
 struct mpr_chan {
 	s32 pres;
-	s64 ts;
+	aligned_s64 ts;
 };
 
 enum mpr_func_id {

-- 
2.43.0

