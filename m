Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2E51E231E
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 05:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748325345; cv=none; b=Gauy+dW3t7on+4u2MSyumD2VyPxVZ2M/Y8J4IJG3SPRYWmm9zkFLVmbtezhz2+zV94yRkz99zem3mgLE73XB8Ouyb9nDMtwNhsPfLGK6JWmuF0d943XOL5e+PzNgoldTFWjJMxEVp8sDQMQ5wTYlpnGX0wsE6dPd7k0Pr/hK0hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748325345; c=relaxed/simple;
	bh=xLVy8X8HnHvYCsIOMkpIYqzz4Og+J+/aGg17JBINL/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qGKQanPWITUoXxNoC7EbEkldPc5ozhjDsPafhRI0pvy+RZtqsU4JbYVyCUrHvkIP9VuR2ZJzGEiQ03Y/MKL5QD1FTGC9Ig65vjCWa+UYS2t21+GFaEfkJD4SX9PvWZBf69wthr0KxyHEBJtvlwS+02yKwz8eG0yZzx0qfCkTOtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ref2N4pB; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ref2N4pB"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad545e74f60so388419166b.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 22:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748325342; x=1748930142; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b95ydlmvcuSBT0t2+Bg2nsz8TCc7xZGDZD7y4UeqVe8=;
        b=ref2N4pB4CB6osMPiMaWpw5mgU8Ymoy+df1hJJmenzwfaOcNz23D4OYrhojyr/U2HF
         QXb7gw6z+90GduDJeCBAtvYHW2D5P7DYc/TVDpyZbvFafYAZ2RC1c9SKL/n7Wvo4LlIn
         lrxQ6bdDOiPijky43/RBCwLmqSSaZjSMQrgWaA1UrDM+6k0AWCXBuikUGj0OILsutzbM
         flZ8s/y0oBrXni+RXIsBTHT0AKvlDOz5WFLDK7WEUlZvYZo+c9B+ocWIUEyKOkhUVYqZ
         ILXyJnEwXW3zWTI/uzt6qgcFtnTR7AStGAAgvwiic1PR0gTy0Hd0H2MBGHUbzVV8hlrU
         xTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748325342; x=1748930142;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b95ydlmvcuSBT0t2+Bg2nsz8TCc7xZGDZD7y4UeqVe8=;
        b=N6icAaMEEpCPwp+RIvanlpsZ1A8Uw3jsXzus65OQ8CPrgi1HNYzTMR2x96UfEoY4DB
         z0aBwozxwMsHgioBrG8veIj/PSVxOqVLTeiYGwrpUrJzvcFKueSLpXrxvkdsdtFSDdab
         dV58YuRr20+mfS0LvfIUIeU/euf1jl/iNgVWlViihQucvDZ6sPmnqIkfW9c0D3dmkmzw
         R5XIInYN1iDpsZ4phay5Dc+v4YlgDDTbT7ztBB4u/+t7Wms+601UBXXQbyZ0KMtrIlx5
         lEbbuymxtcWsBF6p+lzm/PEn8QXdUzvE+zTEnRbPLon2HNW82XuoSglqc1TmDpScKjWc
         /SLg==
X-Forwarded-Encrypted: i=1; AJvYcCWxzjUwU06ZEv4LZSswzw+zKHzCppgRc5YQdjdKbZA6SfNC/Ytz7rNBlXJWGQaurpDn/MwnCFD2ajKobNM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3UsUomKrAjs2ZaUG8dGzZ8LfQGM3ugEj+LiKBjTQ2OwSDZtsG
	ejE88w7/VAoLMh/6Nrpv19Gg2FdPWX7T6cQiKchrvTl8weRN/oEcvAqrEUHh6agVsIc=
X-Gm-Gg: ASbGncvv0Umas4nvTOBWPjbFKBRppVYaQ0GCTPDGdos0on15PQrpFtZwv3Tml3BJG7A
	V4WsFSQdensHx8YfyTa/5ubENQFgMA5q/uYJeCwE8zZqQHODATKDEbxmGKZCIoq+0ybbYpJnmXw
	dgIhy17gc5sL5yHLr1FUDjUetusYIoZan7Hj1FmTnybnKATTfBHupcyIx8HfVuMU/aFhi3LYSYK
	rNWrU8yXpIC5t0ADGh24RnO8K7REz5fImAN7XXiD/gg0dZ3xyHS2DtLUG2iBHbSJ2O4cusZ/fw1
	aMXT9dZ9A94QPhmTDDRVEORqpBE4dWUmnnPxjjMcluEqg8PRWpy1qWWLovwr5B3eSO/Y0wb4oKg
	=
X-Google-Smtp-Source: AGHT+IHqcQBdt4pdotySeS2C++hBmaCY98bm7d0B72bKSBSdU4rDUN6+enuY0scFyUJE6OpWFCvJpg==
X-Received: by 2002:a17:907:f818:b0:ad4:d32e:b571 with SMTP id a640c23a62f3a-ad85b1bf8d5mr961844066b.24.1748325342055;
        Mon, 26 May 2025 22:55:42 -0700 (PDT)
Received: from localhost (hf94.n1.ips.mtn.co.ug. [41.210.143.148])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad52d06e098sm1818489666b.59.2025.05.26.22.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 22:55:41 -0700 (PDT)
Date: Tue, 27 May 2025 08:55:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Allan Wang <allan.wang@mediatek.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] wifi: mt76: mt7925: fix off by one in
 mt7925_mcu_hw_scan()
Message-ID: <aDVT2tPhG_8T0Qla@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The ssid->ssids[] and sreq->ssids[] arrays have MT7925_RNR_SCAN_MAX_BSSIDS
elements so this >= needs to be > to prevent an out of bounds access.

Fixes: 8284815ca161 ("wifi: mt76: mt7925: add RNR scan support for 6GHz")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Please review this one carefully.  I'm less sure about the second chunk.
Also maybe we should just delete this condition or check sreq->n_ssids
instead?

 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index b8542be0d945..16f3cc58a192 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2866,7 +2866,7 @@ int mt7925_mcu_hw_scan(struct mt76_phy *phy, struct ieee80211_vif *vif,
 	for (i = 0; i < sreq->n_ssids; i++) {
 		if (!sreq->ssids[i].ssid_len)
 			continue;
-		if (i > MT7925_RNR_SCAN_MAX_BSSIDS)
+		if (i >= MT7925_RNR_SCAN_MAX_BSSIDS)
 			break;
 
 		ssid->ssids[i].ssid_len = cpu_to_le32(sreq->ssids[i].ssid_len);
@@ -2883,7 +2883,7 @@ int mt7925_mcu_hw_scan(struct mt76_phy *phy, struct ieee80211_vif *vif,
 		mt76_connac_mcu_build_rnr_scan_param(mdev, sreq);
 
 		for (j = 0; j < mdev->rnr.bssid_num; j++) {
-			if (j > MT7925_RNR_SCAN_MAX_BSSIDS)
+			if (j >= MT7925_RNR_SCAN_MAX_BSSIDS)
 				break;
 
 			tlv = mt76_connac_mcu_add_tlv(skb, UNI_SCAN_BSSID,
-- 
2.47.2

