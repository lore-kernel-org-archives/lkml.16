Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B33B2222A0
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 19:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748461477; cv=none; b=kK3OSaNZ/Qr1NUfuutlMiwOzmBLkSzx49pjqp6qcJlroGlw34CrDc6Mo3aix0zfcDjGKFszcmEunYZs7psjYkBNpP9/mz4M1F0hlH6m4ZelfzKHuKrEPQYnmtryG/LEyk9uI/W1A3GG84oXqDhwl5LTfi7jO3y/GOkZ7PC/BoTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748461477; c=relaxed/simple;
	bh=xZUOsMsyjcZ1qewKlqP/KKWUHO3l+hPWlf0MlhF4mH8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HZw/jwdsirPduKwEp97cDa3ZlqmCUonH4uEL6MHhop4BFszYv6TQ/mX8uazYWmTGd3bI1NcEGtR/7SZ+L3ymHFpezlMhV0SXeuo5HK1kdsNfWs9IZpgostwMtcB4rGHouXHbtLqqeyIuN9BUS/WiH91pApZiXDZEsaucuXCOYs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S/9e29Q/; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S/9e29Q/"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4e62619afso25159f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748461473; x=1749066273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MrefH7AMNRY3M6Eds2DAfAOBM+dHe6KTACIdZZtLeZg=;
        b=S/9e29Q/6fSKBwMw+alBjJOdyaCc0ai0p8HtGAit3//Wo1jKlSQIcBAKAzy5hctG9X
         qBTvrKXiaKi0qL5i64S+S/MtU9S4tY4NUeEGcwTd9guDODUMmqFktDevv3ZOktj5vjPo
         pRATjDgDHcnXFZ1XxnvDamqePrQg6gvCtGoR4UfRz57ZmJY9uworDyXoswZjtkKxlv2G
         4TdhMDbYdG/gdRDhTATlhuVyG5icMTNr/tzJDJguGJvQqt2a7iPMyt+QRvq/FxnxaLa9
         OsSgkiLz1Jg24dvYFoxLOdxIxs63oura9AcKo1lN+xOcyMmcV1fg1p3ZofyNEGLZeJeD
         2bsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748461473; x=1749066273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MrefH7AMNRY3M6Eds2DAfAOBM+dHe6KTACIdZZtLeZg=;
        b=sWnscXDs7g0HLCLzNSf2nrzAHPUxn9vQkfcBn2D6RC5642PfKZ8JmQDIj6ZVSjuIBr
         S5YSvVzFVXUvY22lRvnGv18xxCjHu4F7ZL1JsYJKxUqySOdIFVWqTBvCtOPTOkPi94Qw
         UCgyYxYVx6CqjlkCVqwTzbA3cEN+E1kbiR+Ms4mjmcSskXsyGDCMD8C8B9L2gvxk7ucs
         ZFWR3KoWz399Ex1uUf5+6KExcbyhpkK544VcN0+MsImKO3b+7ftMMlfvdP/QSPCzKZak
         B9wP7pMNPYZX9E11kAaDdZgm+5A3av/kZrcxXJewg4Pvhg3IqfCb7QxpzYyp9PFlZgZx
         S+gA==
X-Forwarded-Encrypted: i=1; AJvYcCX2HDAmLycqjL7xLDMFhM0s3kVkKSAH4rD9N4osvwHmhZCX4TL0SXg+Qu7r/fvZtiml9mH6ZTnhLZHy8eE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPdEGaB8CRHjZxvLozGN2j4z7iSNv/irSQtA0FVUNNycdxer21
	kq22lklojSC9FYIyTPDlKZXo/MtYpzs8DSpvdm9oIbm7IpXTFo48EEKZY2KZ3nSKYSM=
X-Gm-Gg: ASbGncskAWSo6AI4f105qtG0oQc+h5s0bzg4puVnR/4M7MDtd9Yb0VtaVJ+c6FVpUJ2
	Jy+6bEjNkNQr1yKT9tAvmKlIXEkPqDkKrb9tPqIoy04H38eur9tRiyAvsoEPKc3YgXYHla+OfLW
	OMnLaHxLnSlOWbFdMI93HaXZBcp11HV5/2eMuGHW7q/lV+g/gobJ2sYxuOZZy2juhZ2u8PBFFsS
	bnCpv3jTcM9GEptwN95XbzP9ddiiew0IwCn5P9fDfX4OLyHc9HjFRJzAeXjVhurXHUaRDUuhrG4
	Km56QWAPg2xYZTcJPBycdZ6QuRKFL9HsPD3fPgc9ZnlSOwA854pIeiZBY+IOqw==
X-Google-Smtp-Source: AGHT+IGvxvb7++yzRa5veyRGs3Zx8MyIdj7JiaUbu6/iQeE+/SATCIw2rNK1UiqXpTlixKSR25x1LQ==
X-Received: by 2002:a05:6000:420f:b0:3a3:6ab0:8863 with SMTP id ffacd0b85a97d-3a4e889eb28mr1188805f8f.16.1748461473317;
        Wed, 28 May 2025 12:44:33 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfbf498bsm456825e9.1.2025.05.28.12.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:44:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Fenglin Wu <quic_fenglinw@quicinc.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] leds: flash: leds-qcom-flash: Fix registry access after re-bind
Date: Wed, 28 May 2025 21:44:26 +0200
Message-ID: <20250528194425.567172-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2830; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=xZUOsMsyjcZ1qewKlqP/KKWUHO3l+hPWlf0MlhF4mH8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoN2eaz7n8pPjPnbi145qnYfYgaQHvOCqX2u977
 76YTVyTGoKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDdnmgAKCRDBN2bmhouD
 1/MTD/4v9AfAXDInQwz5wRgjEGH1dJLIxSqTY/BFyhTxRZ8A9tu/zhi5vjHtGelpAM3NLeWt5t/
 vMq5UiUIfLBHQnl8/PBDCSiTijAkVetgZ/aCAG+fGBp/IKzFH5jvoDJdJzDye0Pm/3Pz1rl+xOb
 cgGISxdSSkZh7cIBW2U+YDqziYH+lAonOWY0lYDyTUJgnpqEidnGpHtFJeA7OjxsuiQm/oW50Us
 2cz73IsdmpfkRgw7qzKQGuDGHuWXTiDEwHS/hxbgpPBx/yi9WFV5TVaXLPe4JF9iZFdrCnnzmlt
 7zoEojhXgciN9jQd4WoPTGymAgoVZFZNmG5rH+7dO3gUBdgv0f+ejNKidALCZd4zpwlkNn1Eg54
 jjPnues6VZx3d8JESDR/qZFSejWaa+Bj/mv7cF6W32J1NsJzA1oyzB1POjS+sFkztfEsbYVvrvk
 vM4rLrcezJZ3fyWgfDOELRj7urSMSTuWwt8cCy5abaA/JRIgEzr5dws/0zJdo3810WlQ/PJj7Ab
 AWwrPL/hMc6hlUxg5kJXoIarXEyx8dmpr3BU5+Xg7ztAnajdSO1kQ0xoz8s6iCUv24fjvWnd1Gn
 E1TS9Ax4vfI8nlV1iF6LxhcPaNfp8jagm5kpT8F7VfOkxGl9VmN1infFYcP+/1L6dnpygYtmRu2 MHcVDn/sNj3FEDw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Driver in probe() updates each of 'reg_field' with 'reg_base':

	for (i = 0; i < REG_MAX_COUNT; i++)
		regs[i].reg += reg_base;

'reg_field' array (under variable 'regs' above) is statically allocated,
this each re-bind would add another 'reg_base' leading to bogus
register addresses.  Constify the local 'reg_field' array and duplicate
it in probe to solve this.

Fixes: 96a2e242a5dc ("leds: flash: Add driver to support flash LED module in QCOM PMICs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This is a nice example why constifying static memory is useful.
---
 drivers/leds/flash/leds-qcom-flash.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/flash/leds-qcom-flash.c b/drivers/leds/flash/leds-qcom-flash.c
index b4c19be51c4d..b8a48c15d797 100644
--- a/drivers/leds/flash/leds-qcom-flash.c
+++ b/drivers/leds/flash/leds-qcom-flash.c
@@ -117,7 +117,7 @@ enum {
 	REG_MAX_COUNT,
 };
 
-static struct reg_field mvflash_3ch_regs[REG_MAX_COUNT] = {
+static const struct reg_field mvflash_3ch_regs[REG_MAX_COUNT] = {
 	REG_FIELD(0x08, 0, 7),			/* status1	*/
 	REG_FIELD(0x09, 0, 7),                  /* status2	*/
 	REG_FIELD(0x0a, 0, 7),                  /* status3	*/
@@ -132,7 +132,7 @@ static struct reg_field mvflash_3ch_regs[REG_MAX_COUNT] = {
 	REG_FIELD(0x58, 0, 2),			/* therm_thrsh3 */
 };
 
-static struct reg_field mvflash_4ch_regs[REG_MAX_COUNT] = {
+static const struct reg_field mvflash_4ch_regs[REG_MAX_COUNT] = {
 	REG_FIELD(0x06, 0, 7),			/* status1	*/
 	REG_FIELD(0x07, 0, 6),			/* status2	*/
 	REG_FIELD(0x09, 0, 7),			/* status3	*/
@@ -854,11 +854,17 @@ static int qcom_flash_led_probe(struct platform_device *pdev)
 	if (val == FLASH_SUBTYPE_3CH_PM8150_VAL || val == FLASH_SUBTYPE_3CH_PMI8998_VAL) {
 		flash_data->hw_type = QCOM_MVFLASH_3CH;
 		flash_data->max_channels = 3;
-		regs = mvflash_3ch_regs;
+		regs = devm_kmemdup(dev, mvflash_3ch_regs, sizeof(mvflash_3ch_regs),
+				    GFP_KERNEL);
+		if (!regs)
+			return -ENOMEM;
 	} else if (val == FLASH_SUBTYPE_4CH_VAL) {
 		flash_data->hw_type = QCOM_MVFLASH_4CH;
 		flash_data->max_channels = 4;
-		regs = mvflash_4ch_regs;
+		regs = devm_kmemdup(dev, mvflash_4ch_regs, sizeof(mvflash_3ch_regs),
+				    GFP_KERNEL);
+		if (!regs)
+			return -ENOMEM;
 
 		rc = regmap_read(regmap, reg_base + FLASH_REVISION_REG, &val);
 		if (rc < 0) {
@@ -880,6 +886,7 @@ static int qcom_flash_led_probe(struct platform_device *pdev)
 		dev_err(dev, "Failed to allocate regmap field, rc=%d\n", rc);
 		return rc;
 	}
+	devm_kfree(dev, regs); /* devm_regmap_field_bulk_alloc() makes copies */
 
 	platform_set_drvdata(pdev, flash_data);
 	mutex_init(&flash_data->lock);
-- 
2.45.2

