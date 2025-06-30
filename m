Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA4320FAB2
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751272267; cv=none; b=FymesjzpStB3jaT3e0od6ktaV4AEVGanMzcaAengbIDHZdrnoW7v1C7JWX+osTxUCCaFOug3H5sdW5/n6vFAR15HGZeZx2U8OthdEz8SdNkFvhWShUpKQ+FXm8w+VdN1OEZrOiqFRQBCCtNV6x804nqeLjBmdclCaOYBjmQzowc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751272267; c=relaxed/simple;
	bh=BacTpYDKsivXlWevsTrw36x80ITH6Ritocv0vbDFpNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rlCqNIxI7bEIvEg5r2zHO2LpoKtpTdUgXwLW5OY/O0bCuy38y6uYGF7n3A7G4YF5uzPh44g8UblBfFuDfFLY5/V3Oge2soTJqDeKoCSuwjQOuOHOPWxWIK+2ezu+ZKTsWD1TyPl6IJdUqhNyL54D6G2Tp3luoRK9Uw5e8JvjiQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tmt7UdTb; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tmt7UdTb"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ae35c447234so554510666b.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 01:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751272264; x=1751877064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jfEtgbNt/rYCf8xNxthB2n/XL2JqGnY+ug8Bfy+XFfE=;
        b=Tmt7UdTbUUtgfIJ3kFCtL6IYi9vJH8dh6Em0uxjO7TAU/MkEl92vgbdd2vVVZrBsRw
         ilwzncwom8fZL+qHV2oiAoRipVG3CWTagasuIFsyhRJgxyJl4qoNFD6Js5fko1E5TNMb
         OJHjnsbeCORql8x08R71P5aHeR3K3U2sPB0MQFjJ1cjJbB+xt9LOOAUfGyECv8ubFbol
         UXX2+wLu7y5ssB71nXNLXZex+/QBcbz5q+5di2UqwlQS0hsCcdzcnXHYPfDwCxsCi0Fz
         edKYfk/XmvmwyAz0kOnmGMVczuIXfUIa1zWZLepOAba/J17u+aeNAnKHRDnkA7dPzYfZ
         JBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751272264; x=1751877064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jfEtgbNt/rYCf8xNxthB2n/XL2JqGnY+ug8Bfy+XFfE=;
        b=Tjh2F+X7UoIEjNP8JYziR70033D6H/G0Bse6DBj4suxqhDzP+w+TllIB20OsTEw37C
         Q36OGaSFdJtF8TWz22oXUcU5ou9dVM8TCsLJnZlRPlAC5HyeNAQyn2objqsemTzu/DEY
         SlBv72GGay2LtQG9L1g8l4CRJjQRx0uIUQyB0QEnUv9aAcRAguQxXcEkX8YlW6Bsh5KH
         kSIyPsye9dp3Nxt+ZDK/OKU7tUkUUkQstqNX61D75vp/TMA9qO9MHz3ckr5H/iEBV1lU
         v9CSgyQ2XlxQu5ERsMrTqOKGe9OHTI70mwUQYxCouTjlhvhPamuUNn7f/Un2ZEf1GRzv
         CkFg==
X-Forwarded-Encrypted: i=1; AJvYcCU9RdSWUl8XuZX9i2ZlgTiln76Q/5EwG8raKMBGpsDD7z5IwBlkJrcSgMI/GU/7oQPNpbVDDyHrML+FnNE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuYAg0bDs/OrGGqpy8nn9cFY/QX6eZ8WOjnxyker5N7kyzbPMu
	+jwCXENJJN4P1FhNPnSEfT6t0B6SqVRfF/FbYyPQGP0u9ZmVwW6XdvYU
X-Gm-Gg: ASbGncv1q0jO9HmourNRqRMwqZTfT3InDfMjEosRDH3lxb5E5BI95qx9Mmdb2M070PR
	0iJrUKyic8vaOqp9limTLNz6zNgD4d27YVtAmiuQVPsSKI5j4f5Mt9LJcM6c1D287lDNtfUSoH+
	fSs8GwsArLUk65i718BT+kogWdDv0XHs/ltDzUrRKqt+2NW0mb7H5yRwhSRjSsqDe8R22PHekS3
	suLg6UgXoUDjNoaXCXDUrLd76gTHsfd4Nd2/T5srru+uH7jZajwJ0Yo6/490lzDwwhOKD2GSBmS
	/sREug6KvMpzTO8OirUizdpJ1VGCg29zxHYKBHGyjafzLbd1cUwdxzE/hfvrNd7TWe13YX1Sq8T
	22Gk6sKSpbFW5lg==
X-Google-Smtp-Source: AGHT+IEcnypyBxGiTttasTy/2glWFDimEHzRoaELnx7Jb+RtdgUUjyMZ7adE3YhZsT+gvEipekO/WQ==
X-Received: by 2002:a17:907:8686:b0:ad8:e448:6c64 with SMTP id a640c23a62f3a-ae0d28c7408mr1552178366b.24.1751272264033;
        Mon, 30 Jun 2025 01:31:04 -0700 (PDT)
Received: from localhost.localdomain ([95.90.184.252])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae360e6ce54sm577568766b.37.2025.06.30.01.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 01:31:03 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/3] staging: rtl8723bs: remove unnesessary function parameter
Date: Mon, 30 Jun 2025 10:30:48 +0200
Message-ID: <20250630083049.103734-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630083049.103734-1-straube.linux@gmail.com>
References: <20250630083049.103734-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function rtw_ieee80211_channel_to_frequency() in ioctl_cfg80211.c
is always called with band = NL80211_BAND_2GHZ. Remove the unnecessary
band parameter from the function and adjust its code and calls.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 7fcc46a0bb48..7cc1e036d2c4 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -192,14 +192,14 @@ rtw_cfg80211_default_mgmt_stypes[NUM_NL80211_IFTYPES] = {
 	},
 };
 
-static int rtw_ieee80211_channel_to_frequency(int chan, int band)
+static int rtw_ieee80211_channel_to_frequency(int chan)
 {
-	if (band == NL80211_BAND_2GHZ) {
-		if (chan == 14)
-			return 2484;
-		else if (chan < 14)
-			return 2407 + chan * 5;
-	}
+	/* NL80211_BAND_2GHZ */
+	if (chan == 14)
+		return 2484;
+
+	if (chan < 14)
+		return 2407 + chan * 5;
 
 	return 0; /* not supported */
 }
@@ -266,7 +266,7 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
 	/* spin_unlock_bh(&pwdev_priv->scan_req_lock); */
 
 	channel = pnetwork->network.configuration.ds_config;
-	freq = rtw_ieee80211_channel_to_frequency(channel, NL80211_BAND_2GHZ);
+	freq = rtw_ieee80211_channel_to_frequency(channel);
 
 	notify_channel = ieee80211_get_channel(wiphy, freq);
 
@@ -340,7 +340,7 @@ int rtw_cfg80211_check_bss(struct adapter *padapter)
 	if (!(pnetwork) || !(padapter->rtw_wdev))
 		return false;
 
-	freq = rtw_ieee80211_channel_to_frequency(pnetwork->configuration.ds_config, NL80211_BAND_2GHZ);
+	freq = rtw_ieee80211_channel_to_frequency(pnetwork->configuration.ds_config);
 
 	notify_channel = ieee80211_get_channel(padapter->rtw_wdev->wiphy, freq);
 	bss = cfg80211_get_bss(padapter->rtw_wdev->wiphy, notify_channel,
@@ -440,7 +440,7 @@ void rtw_cfg80211_indicate_connect(struct adapter *padapter)
 		u16 channel = cur_network->network.configuration.ds_config;
 		struct cfg80211_roam_info roam_info = {};
 
-		freq = rtw_ieee80211_channel_to_frequency(channel, NL80211_BAND_2GHZ);
+		freq = rtw_ieee80211_channel_to_frequency(channel);
 
 		notify_channel = ieee80211_get_channel(wiphy, freq);
 
@@ -1976,7 +1976,7 @@ static int cfg80211_rtw_get_channel(struct wiphy *wiphy, struct wireless_dev *wd
 	if (!channel)
 		return -ENODATA;
 
-	freq = rtw_ieee80211_channel_to_frequency(channel, NL80211_BAND_2GHZ);
+	freq = rtw_ieee80211_channel_to_frequency(channel);
 
 	chan = ieee80211_get_channel(adapter->rtw_wdev->wiphy, freq);
 
@@ -2456,7 +2456,7 @@ void rtw_cfg80211_rx_action(struct adapter *adapter, u8 *frame, uint frame_len,
 
 	rtw_action_frame_parse(frame, frame_len, &category, &action);
 
-	freq = rtw_ieee80211_channel_to_frequency(channel, NL80211_BAND_2GHZ);
+	freq = rtw_ieee80211_channel_to_frequency(channel);
 
 	rtw_cfg80211_rx_mgmt(adapter, freq, 0, frame, frame_len, GFP_ATOMIC);
 }
-- 
2.49.0

