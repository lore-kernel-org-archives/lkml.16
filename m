Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90ADE26F471
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745850605; cv=none; b=YObxl6YD1wTIhLMbhOm+fiNsh5U8TGrUCDMotfDHMNZB4yw0MkbsiLUHal6CsWV+mMpvflsRcQ6djaWa03nG9oYzZFk00fQfMlijVCO2PjUSdo3wvE4jNUbpYEN07R81x2NgrQ9RKkJXNXx/1moX4J3ap2Hzsy31OxLCaupqxnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745850605; c=relaxed/simple;
	bh=ruIK2ZYu6lVtSOA1q39QxovEfdKMM9srBG4DrMyVUf8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KKype3xsleDK5cLSWZzqXFz3Loc8bCiX+yXZemUOF4nPQh7GOzzrtbtGxDrvC4ZQAxj1GAiguu4WaspxHdTsi/4ypsB91PBuHLLUVAlaAi1AvjtOWQugcqa2LVcnRMWUNC3HSXxia5ZhLlZC4ss3P4QWlErQDyPpfAMgZsLAa4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=WSIMp5Wu; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="WSIMp5Wu"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so43240365e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745850600; x=1746455400; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bQYI98eNYPuBxf9D7Ml3+p+5IYpNd9AgbjcYArr6koc=;
        b=WSIMp5Wu1/TLqt0D1ExREOqJ0b1nou67qNuxcNJhrdsYAqTqZzAevtrsJSP1NIWR0r
         ydFy+6/Tp1YGAa8xdELj2sgL+mtOku/xjutDNzV/Ztfg7lR+hPABDstSZ6Vay1X9Hnkf
         stBCS2ne0hePnPoSdKVkCem/kckq1lPR4veIdIsbI8z+T0s8kNpHNpmBsrGYKABry6+N
         Ujs0qItxmjWxGv3FWzILX+Qy3L5K5oKne+f+l2ftUS/YTDIn5nvKGgSf8qlBXcBz4UuX
         gx1oEe7SNx4i9fuAbQZh8OLfEXFDJEtefu9qbwLmdWaMBZ2B/z4vGUdyCG3cH4eZcitw
         zWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745850600; x=1746455400;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQYI98eNYPuBxf9D7Ml3+p+5IYpNd9AgbjcYArr6koc=;
        b=qyTNfDl+PagINIVq6TTeYniYQk6qQ9GieVH2zpmuJLQx4AD/bqmJNhNQKcX7ySTp85
         Uctf0kEEtVuARhPk6glNkE/vi7THy6vHdqhbzT+xzkB6Du6/ZGonvykIxdPTGFVVuy7o
         SzzNXh7dLujSLcAY5BTc8gazS/N6y7O3xeFyaIFL40hCUKj+1c5UU97oQm4+Um3hDhVF
         s8nRpPF5ZRy9HN3e7nFxVu76FpUQ0ra7EUFQHp43OF3i5fqZf+2YA/E3Bx6vQZHCAS4o
         UJWjymta/xzGFRIBocsDkphCKMHSo8J2LfedOJ0h0ON2z8qeJ+YItv7WrhAz/hQMGAIp
         NT0g==
X-Forwarded-Encrypted: i=1; AJvYcCVrL/W9qlVpQMuNVTo2SU+CQjw0t2Zy61kNc967jcd0lEr6e91aTue0mDfG3yBwS5QggftlPO+gWC+jqqk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVdl2rWpuoTPI/TmpIEnWZ+RbjrXkcmmWfbFBpKB7DKw0srdM1
	/cAERqxhcxq0GSq9llXf/Y6fOKAjDkQC0Gds59IfWGRtwPKKlU/dkEhlXzPFYthL0V+kPwutbE2
	/Clc=
X-Gm-Gg: ASbGncssG8gzpEWAX7QAo0BBoRWYTSITI4HbjtVa+ea9KpiZDzfVucYzaK1EcAdz2B8
	WqQ8j2P+sHHf34n74tiWhAgWdVdSD340oEQ0SLnzhSVt2RlJ++8CFUYYtFY9GA5CIe5zCS1giIc
	pdNLyD75S4h614yI36/kf6JFwjRYpbXoqGT8+idYDnI16ZPqSvjKvbS/OXTHOyqaP84axHmQz8U
	Uw43fcqG1n54FkPNEeqneRvcbWVYWETzn5NmBPT85QlTVjFxpNLkEk4WpM21zmvIH52KKEvXRGw
	7VFBjqBsmG7NXrKIwTLoCEp3j5GraSLDDxcp0swy9mrJDCcCokE5Wd6FWHLkyY0f+puWxo70l4E
	GlKjW
X-Google-Smtp-Source: AGHT+IFMzYA4rBwAp8XMm/VmBHtuPN7YejTTJCLHH0ds3UH44CvH+BTUCP1eWOoIxr4fWxmL+Mot/Q==
X-Received: by 2002:a05:600d:3:b0:43d:ed:ad07 with SMTP id 5b1f17b1804b1-440aa5c57d2mr71982045e9.29.1745850600617;
        Mon, 28 Apr 2025 07:30:00 -0700 (PDT)
Received: from [192.168.5.157] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-440a538f4aasm124616395e9.38.2025.04.28.07.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 07:30:00 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 28 Apr 2025 16:29:55 +0200
Subject: [PATCH] rtc: mt6359: Add mt6357 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-rtc-mt6357-v1-1-31f673b0a723@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAOKQD2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyML3aKSZN3cEjNjU3NdYxPDxBRDoyQTi+REJaCGgqLUtMwKsGHRsbW
 1AAzLrJhcAAAA
X-Change-ID: 20250428-rtc-mt6357-341ad12b48ca
To: Eddie Huang <eddie.huang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1456; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=ruIK2ZYu6lVtSOA1q39QxovEfdKMM9srBG4DrMyVUf8=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBoD5DnDmynJWGB3fQ71YEwcfouWK8V/j+TJRIOazo6
 JTbxnCqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCaA+Q5wAKCRArRkmdfjHURdFbD/
 9SapbkaXzKJQv+9ANc35lhlI2QPX54DfEfjZjVAsUPn1ZRjXdtm9WR41IyzztGdGfpRmT6JitqlK2N
 XSue5F/P7bNCF1nboTy8/bssi5w2NdJIJv9onhgr8e+VJK2IWTWLATwdJ3IIdI8b/g9V06yUkOZr9A
 8PRLwmOu3hkFBqh279hQRA+DVclO6MhZbMUkEYkLoOrqCAnlSOoHW9XbFbbT/4/heej9DCwJLBBBdM
 KLJfufLks3tBLoU/e1jJwHenVVTAL2R5g29cnknxL2NsSMJOxM6giESU4jKrf6BP7pcIVB0YJpqzqt
 CxFysyaZEH916/YYkpj3XZ76uUfqFm7WzR8yVOXBLbgLaB/M51msZSyAVj0HDU2nmC3qaQ9NZ1sngL
 +2uiLVXZj2dhNFuj/VMFtojm3KI3Cjd6nIymlOOV8ZTU/OhHWMHYvPYEwlPpZ7nuH+nl2vj/JIhlyv
 cuVGNJai+xMc25fD6pJ4Tm78MCePjXxAORRDV3TWyF3KbAtyxTvyKwpnkS6Ghu7/hVw9ALCl3T2cDh
 wX/PiNYmdNqBLIhq2InUWrPfuyAhEnv6rhXW+b87E6u+FgMHTH+0CChOb2gno3JR21JwTYbj8o4+pf
 0GTaX6z2uIjtLHzQmQ5phDZVJ+ML70x25abikqmGttA4S3mTKaZzyVw9GOEA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

The MT6357 PMIC contains the same RTC as MT6358 which allows to add
support for it trivially by just complementing the list of compatibles.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
The `arch/arm64/boot/dts/mediatek/mt6357.dtsi` file already contains both
"mediatek,mt6357" and "mediatek,mt6357-rtc" which are documented in the
`Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml` file.

This serie come from another splitted serie [1]

[1]: https://lore.kernel.org/r/20250428-enable-rtc-v4-0-2b2f7e3f9349@baylibre.com
---
 drivers/rtc/rtc-mt6397.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 6979d225a78e47f73b7652159e73f70c43b4fcde..692c00ff544b22b471b51f115dded9fcea432de3 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -332,6 +332,7 @@ static const struct mtk_rtc_data mt6397_rtc_data = {
 
 static const struct of_device_id mt6397_rtc_of_match[] = {
 	{ .compatible = "mediatek,mt6323-rtc", .data = &mt6397_rtc_data },
+	{ .compatible = "mediatek,mt6357-rtc", .data = &mt6358_rtc_data },
 	{ .compatible = "mediatek,mt6358-rtc", .data = &mt6358_rtc_data },
 	{ .compatible = "mediatek,mt6397-rtc", .data = &mt6397_rtc_data },
 	{ }

---
base-commit: 424dfcd441f035769890e6d1faec2081458627b9
change-id: 20250428-rtc-mt6357-341ad12b48ca

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>

