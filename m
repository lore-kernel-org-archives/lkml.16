Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA3929C341
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744374991; cv=none; b=GiC/77NPHDg0DT3JcL/9TyLgpxF1/VSgORTC3ZAGxZzEK12qlkWMHepcKWJkilnVXh1+TGLmVksQRTuvMSyPmw36W1CDTVn0Mwz57Hg92L6Zxjz3hr5Fz53IkLqSxMPnrD7tmgte0FO7LJ8sMpMuTPVBuM6m6s6XnHKl/vRohi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744374991; c=relaxed/simple;
	bh=kapZgj+SJrEW/7vg45el3XbqPXPyGqqzv8dsBko1XSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tvB7Y8rrtjG14m4Wl0WtX3M82M63MlM+LXiRY6W0WGlvwh9MxqaCKmFZkbDZDx05ehSMGZ0p5TLUENrI1SIfCoN/VJ093+GYi1TU9ESxhZbvNVTF+1jcVwZDYkxp5kwO3pkoFjSLSkRa1xQsE5Ea9DC/Y4WQKHWR9nIHRKo4R/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=AJsEHcjg; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="AJsEHcjg"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so1782693b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744374988; x=1744979788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jM702IHJZgWY+bz6KCTgaeHyuuKyyx07sXK0MSiTh1k=;
        b=AJsEHcjg/xZUtt5UNRfKW6z4eeDKXzSN2/+X+t1ScYcQirFDnTLpPq8H6aPziaB7CQ
         CEcIU+y99ZgW861z9cAaxkxnQzEJyplu9qzs0EXuxDOvpnjUHfJ0yiptjwFFYyIFFO8P
         7FbVIIf9oagEpXDyKNrlKqGatESNLZQZWVNDV8NbfFpNZkoA5EwsWbtV0meEFXBcdQtJ
         8nNeojhHZZrSjlKEIk9RScxU4Nf0vvWIvadjxYUCrIOnOMz9yptlJ3Gv3MNRwmV4jomY
         9d9q5GCDLMwxiV7B56pqcYQZTkCa6IDfSNqzVcjP3jLQyP7tRfwAfAPxL/RdgVMd5Mvi
         wv/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744374988; x=1744979788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jM702IHJZgWY+bz6KCTgaeHyuuKyyx07sXK0MSiTh1k=;
        b=WaT3cqejUIEP+TxT6bUqYRddBEENYcKOV1artmEsgjW+FeFu+P6K3nmeo+w81Gv5bH
         xBQSq3B92RD1ETyUEDpFDY/6jeqKFZnZGhaWX81GEG7J24qlbUDdNk1qvMd9kfpY+lLD
         rH8AHhWYl9dW6oFUtO3DhUPzzdWnlUb/ywx/jO6y4USxhEJwCL+JA13OfMGszkynNcXm
         cUrp3Gsm8jOR3t3r1ewvXfc1rK2s/QTAmDh5m7Ko3x80P3xBvQu4E/A5ExX1KZFt8Sjs
         +VHVR1HQGwEWiulyREv1uCZ6Vv2wIrHZ7UdHLQavXatYXqEsTFAwLrSNColJg8OvH8Vm
         K4vQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3AnI7qTlZOf0+60W8LVp+pZmiDD/1LkokfXXppSfYdgN5DuULmYk8rZwYKRgF4Kp62aaCnlDdAOXbycw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIynrOen5e/O4na83vPiSaKN8QDxdd4U+H45tC44xDDFiwn4ON
	26Ae00cEXzQk5MlTn8rX2knorsySqfXOLnCoHmjhj7KbyL4odKelZyzkCLDntVbneep22QHDQuv
	qwwc=
X-Gm-Gg: ASbGncvU/rAztFsSpCrlFvrjUH600QkZkqQjUE9NEnB9sxWNWunIDlIaFZaEohXF/gl
	9xPC0ryw2piet3TKuiCl0ARxbl3lzc2hcpIX9y8PvD+mi2Y8/+p0jmpu1DffPEwVwBZb3+zU+7q
	o2Bcga25y3KnYwvZ/Jl6TDkaoVPt9vjQSirPcSl1j2jsNlXmwhh4uLUAunjCwrfhzQ4CnnpTp2P
	RFC2NVwx0zIBMz2dN+WmMEsLyx9eWkHmGxN03zkORssx0YfltOkaTngH9exsdsCjFhrXT7kUUrW
	tgLRKvu88JBP01xpp53Gl1D3DvFoD8WiO2vbboECSP0=
X-Google-Smtp-Source: AGHT+IHQwIeS61ZHw7ELcaetMk1hxBxZhzt/gB3vL7AAjlG4usbaBhvHS6AeD5lvUMBQjtxiLN9JMg==
X-Received: by 2002:a05:6a20:2d0e:b0:1f5:6b36:f574 with SMTP id adf61e73a8af0-201799908cemr4162219637.38.1744374988404;
        Fri, 11 Apr 2025 05:36:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:cf9d:bb30:5951:692])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73bd22f8253sm1408292b3a.93.2025.04.11.05.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 05:36:28 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 11 Apr 2025 14:35:54 +0200
Subject: [PATCH v3 1/5] rtc: mt6359: Add mt6357 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-enable-rtc-v3-1-f003e8144419@baylibre.com>
References: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
In-Reply-To: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
To: Eddie Huang <eddie.huang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=888; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=kapZgj+SJrEW/7vg45el3XbqPXPyGqqzv8dsBko1XSY=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBn+Qy+TYlfRYrK9qBDtMoT67TK2uUDW65YoKt+VK8q
 GnOGMrmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ/kMvgAKCRArRkmdfjHURR2DD/
 4yLxGKl9OOCFSJeMkLVMWu8AstKcIkMWXfnsYBqGiG0y70mV141mnz9uA1Wc0q0e436oYHlfRwILuj
 8vaI3DBOZWPdM/vUXhxbr06wjzwcYlTSrvVEQD9mwFWuVcRma8pnf7iinuqfOQAl0xsdZ4vs/gn2//
 5Fxxc8ddmo2NGUZlrxrgFhYrn5FZe7ICGucwwYbHE6aJQVKSCv7ndCXIBFUs6hUZ0ZU9a2tPcmOemT
 WTVdyPhr+e/DT0LtIPnaqlgRaFEepcVsClWO2gD/TNvOoEakEuhUryURlyDJkApbyRme6GolKf4mCG
 pOT6Tf1mgbrGy1+NfTixaf58L0ePsfbhAUBXYotRpddCYUzbSTjLrFNmT1fpVzSfUvb4Bt6QzarYJC
 iiSUZwUappYupYyPDSPVV9jq17rxTtlRmXCEdJEjSBUmjaIt+0D2hPmSoJVwG2vhvSk6I99CJpRkKF
 IGQiqU9unaNRqaO1LK2nUKL9o5OoWDgs8QzyPglItnNxE3AdyMqLysqQENtPq3zEpQJq6QznOFOS5g
 D5bVbSKVNMxItR+mw5dlkJ5V5UuIleFlsoTvFThtHRjdfUQ5pFM5Pogs7PR435ybYQp7/MZwKStj2L
 y23u5rPPoMo2O0aFe0vMVu2TUB37HGnrKMbmKoVXX9l61d7LzZQfDbpfD1Bw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

The MT6357 PMIC contains the same RTC as MT6358 which allows to add
support for it trivially by just complementing the list of compatibles.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/rtc/rtc-mt6397.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 6979d225a78e4..692c00ff544b2 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -332,6 +332,7 @@ static const struct mtk_rtc_data mt6397_rtc_data = {
 
 static const struct of_device_id mt6397_rtc_of_match[] = {
 	{ .compatible = "mediatek,mt6323-rtc", .data = &mt6397_rtc_data },
+	{ .compatible = "mediatek,mt6357-rtc", .data = &mt6358_rtc_data },
 	{ .compatible = "mediatek,mt6358-rtc", .data = &mt6358_rtc_data },
 	{ .compatible = "mediatek,mt6397-rtc", .data = &mt6397_rtc_data },
 	{ }

-- 
2.25.1

