Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6046B1F5EA
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 12:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749991149; cv=none; b=ukRau0+5ED++cg/Xx/gFlbpid/WchHi3sPALv7M4Jp6fuWhg2pFbM+5Uw+prHrWPMGCGbLxpwwtZ36EdHRMQlRt0lyJ+aZTj8D5yG9uhLJdKam1pESO031KZSGfc/1Ol6/1/8o5DWKy91buOqciCC+uUEMdqeTD9iJ3KTPq8KdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749991149; c=relaxed/simple;
	bh=OOG8A1lJB6QxMnOCdKGKRFFp+tIssrE/n52zH7SzpSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hwl2vKqDcZKKKKpS275qhVGBiEgovWgJvA9nPvKSj23fvssQXgHk8c26dy176nuqHLaa+l4Q0PnrTHno8LeJqZ5BmBRRq2Xw50l6NaC83ro+6dOjRcgQ9SOuW27FmJhZzpgxGhr3JTsvdM8uEjaFzjZqmnA4zPrmt60b4hXIKJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYBCfqoP; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYBCfqoP"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-607c5715ef2so6066183a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 05:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749991146; x=1750595946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ht0vsGzBZHXOYe14xnyI7/iCiRETWINgnDHOAHnZ/+U=;
        b=OYBCfqoPCXPrYfnjXx+/PjGwaQwNgVC3IsGt8t1maWWIybfw/DSxDFO+VVgN8MIFpQ
         M5PyZMNsqvU05qfX8PtY8iYJ1wqtT6MdSQARmF6r2UnSbH/cExRG33Q4AbUTlttC/r9D
         Hkxzj+K/Ptd8ShalGRxgvjDz/RG5Cjv4ci/D1Rzl85P6dEN6epWkfxtVlvnjKz6MzUpV
         qxuVlz/1t2GXVb+9GFRdvtR/FjxE9K9q9pxWWyyRWbgNMVkIKlIR7cUinsMgSnVGkMHj
         7nx8YQJgJ8T2moJH6vzD+Sxn8foJlU6n25qi+ougs+iUxqHCFm/pWa0qytYKhPyDd1jw
         6yxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749991146; x=1750595946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ht0vsGzBZHXOYe14xnyI7/iCiRETWINgnDHOAHnZ/+U=;
        b=QFPSoUq+9vdQkxrnlfp805wkyXj6/7Ev4k5ZibfkQxdTY5NNkLIDHvanUJYTkuIkz7
         MkH1LYqY1KYJjozzo2QWbp370H+fEwq+HcSWz3xDK65HAgixyuBAXghXY1oo4LRnZiHv
         1sJkgAkfoxlMB+xcibA2XfCAGVQrkBnyR9xQO5e1u/5YFWjYMVzlUlqmiEzqMkkESysX
         75C/9c1d/SIhwJaZMVcZoRx+Fb8iku2BiIcKmDCF9TBBT40wqY5wBepEGNRNbHd7o46j
         GU2CspxybNA9lQ/hb6FYEUT+iDNha6rgP8Bp96MK7GHTWf95ZBQPj7ACxPShJiyVz+A5
         CREQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOvthSSLsstHxhByliil3YWXYQ6/aT+7klx7NA5SwGavCSfywBpD8pUb9h0+YXJmiT/ZNin6yoZEMCr6E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9b0nNqcQVeJOZjmRjVGVPwmU5TgLWhQ/Mq/66x319SHNESQfY
	pvkWwXeO94OP2Uu8juSUBp9A27rY1sYjElRDw5EBdJuOnagqwsnRAPcn
X-Gm-Gg: ASbGnctQBcpau5UuHnUz5hcaE9wtJTlbkS7mZCX7W8d6ert4fexlW7ozAVf1YDvFjWk
	k27FFvlsIcbrvJJ//o/hOZYlv/+hUOuK4GA6x0+HO3W/aHpv1YNt8qFM/h287O+Us1gMxfMr9yl
	P2MgjMObKZcqG9et8P+di+W7jjAyb1cEsZcV+asFvqyH/gVDxrKJ4KpEPwwjSX/BiAdBX6p+epi
	KamAkX7pbzzggSJ1bmiikeCMpp1kX1XBPKQzReMa4Jv+p0jRvVjPUk8At8H5RHQvDxWzgvJI8/H
	ppN8zeUInNGwtAoqbFQyK8e2B95KaaN6oO1xelFA9opzvIjSMbnGoOdWQ573vcFZvs8qcmjV29f
	I1goeXYR9TCXabA==
X-Google-Smtp-Source: AGHT+IEVMECVXr20Usoe4/zdCvMUe9SrxO0WUwD6EbhR+37C/PSr/kSVuwEjB1/Jha7qJMztNqRh+g==
X-Received: by 2002:a17:906:c103:b0:ad8:a41a:3cba with SMTP id a640c23a62f3a-adfad43c58fmr626913066b.43.1749991145504;
        Sun, 15 Jun 2025 05:39:05 -0700 (PDT)
Received: from localhost.localdomain ([95.90.184.233])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec897ac3dsm473478866b.155.2025.06.15.05.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 05:39:05 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove some 5 GHz code
Date: Sun, 15 Jun 2025 14:38:59 +0200
Message-ID: <20250615123859.41922-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Chips that use this driver are 2.4 GHz only. Remove some code that is
executed only for 5 GHz (channel > 14) . This addresses the following
TODO item:

- find and remove any code for other chips that is left over

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
Compile tested only, due to lack of hardware.

 drivers/staging/rtl8723bs/core/rtw_ap.c        |  9 ++-------
 drivers/staging/rtl8723bs/core/rtw_mlme.c      | 18 ++++--------------
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c |  9 ++-------
 3 files changed, 8 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 383a6f7c06f4..b2e7e7267aa4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -741,13 +741,8 @@ void start_bss_network(struct adapter *padapter)
 	if (p && ie_len) {
 		pht_info = (struct HT_info_element *)(p + 2);
 
-		if (cur_channel > 14) {
-			if ((pregpriv->bw_mode & 0xf0) > 0)
-				cbw40_enable = 1;
-		} else {
-			if ((pregpriv->bw_mode & 0x0f) > 0)
-				cbw40_enable = 1;
-		}
+		if ((pregpriv->bw_mode & 0x0f) > 0)
+			cbw40_enable = 1;
 
 		if ((cbw40_enable) &&	 (pht_info->infos[0] & BIT(2))) {
 			/* switch to the 40M Hz mode */
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 1d23ea7d6f59..0b0ee023a239 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2252,13 +2252,8 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 	}
 
 	/* to disable 40M Hz support while gd_bw_40MHz_en = 0 */
-	if (channel > 14) {
-		if ((pregistrypriv->bw_mode & 0xf0) > 0)
-			cbw40_enable = 1;
-	} else {
-		if ((pregistrypriv->bw_mode & 0x0f) > 0)
-			cbw40_enable = 1;
-	}
+	if ((pregistrypriv->bw_mode & 0x0f) > 0)
+		cbw40_enable = 1;
 
 	if ((cbw40_enable == 1) && (operation_bw == CHANNEL_WIDTH_40)) {
 		ht_capie.cap_info |= cpu_to_le16(IEEE80211_HT_CAP_SUP_WIDTH);
@@ -2366,13 +2361,8 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 		/* todo: */
 	}
 
-	if (channel > 14) {
-		if ((pregistrypriv->bw_mode & 0xf0) > 0)
-			cbw40_enable = 1;
-	} else {
-		if ((pregistrypriv->bw_mode & 0x0f) > 0)
-			cbw40_enable = 1;
-	}
+	if ((pregistrypriv->bw_mode & 0x0f) > 0)
+		cbw40_enable = 1;
 
 	/* update cur_bwmode & cur_ch_offset */
 	if ((cbw40_enable) &&
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 73c70b016f00..0c6072d08661 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -854,13 +854,8 @@ static void bwmode_update_check(struct adapter *padapter, struct ndis_80211_var_
 
 	pHT_info = (struct HT_info_element *)pIE->data;
 
-	if (pmlmeext->cur_channel > 14) {
-		if ((pregistrypriv->bw_mode & 0xf0) > 0)
-			cbw40_enable = 1;
-	} else {
-		if ((pregistrypriv->bw_mode & 0x0f) > 0)
-			cbw40_enable = 1;
-	}
+	if ((pregistrypriv->bw_mode & 0x0f) > 0)
+		cbw40_enable = 1;
 
 	if ((pHT_info->infos[0] & BIT(2)) && cbw40_enable) {
 		new_bwmode = CHANNEL_WIDTH_40;
-- 
2.49.0

