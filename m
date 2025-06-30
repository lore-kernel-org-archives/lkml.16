Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2FE23BCEC
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751272268; cv=none; b=fplvW+4K3DM3QY5An2lC0CAj/j23A8EPjHvlthCrXH4BHvoIc4MmwhzAdbHbRiist2uTTcTD+P6QMX7Rojm669ljuWHP4nAanBhUnhJ7aklr5IjgS+DX8dYcGZ9fT58RAw9ZjBYe3KGIAniJyCfA7PnWYb/5HaMUnw0jt7NkXmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751272268; c=relaxed/simple;
	bh=5gcrW0C/6iIcYmamZ1YR+qDyc9+/q61v7UhulYN4UVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dClK1E+9QBZEiaxW88swCjTbOgMtCLK184XhWR+o/mM+WzZzkmh5krkSAY2DSKvVa/pMXvsKxvPmWhks4DFFEfgTARlOR8kOBUsMF/iNvmCoV46CfXFVWjNjiLgSFzSeMA0y/j5315aJOYYSZnmWRrln27FHrV4YpvPaZwDD0A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f4YOmTyf; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f4YOmTyf"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae223591067so328507366b.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 01:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751272265; x=1751877065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1IkmRFvnV11ov8AHbvaYSjGTtAI8bgVhqxnUQpHeEg=;
        b=f4YOmTyfSJxNL3T2gKqQiMnUH00uf/mM0h/WggrVyR2jXSyjWOMpkglukAufc+yapU
         GGW/i8F88z+mASJKAc2EENNOb3BcSO4GVJu0AUQbegeTCVo12frJYtyrtVyDF3J4VbvK
         ZEFabL8tSb2zA0AMorXkXbTeYmp3nB1K/w4H4U40/W4nre3UZ8eJuSWUzYdwpqP/bdfn
         u2JJBX/pKLv3ffso0IV3vLZc6RX4ZhLt15lJSPXlidY8bdFd8IF6fu5iRTHZIV5STHe4
         iTMxCh1SPJDF/9ErJS8qdE9qVTxR6ixAl77uF5wMQIgdJlrRYwYU+fPEb/4VZryCFAaT
         dgxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751272265; x=1751877065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1IkmRFvnV11ov8AHbvaYSjGTtAI8bgVhqxnUQpHeEg=;
        b=O4J/4I+HAXM1AlP8UqRebnch17BCIdyOnv1AIRrhh7ZGLOiYpROjHuv7nM3vtTehGt
         cGfzvcI83gGEX4O3D0QJwTniZOMHs1UTvU/uQA8hydIjO5CM8NUjGizaUgvNqSS3N6UO
         bBNtWySa4p6sN9n6RWBnwvau+5Jjqcd8QrR3Stk1ue6zMAb6SmHDDyAwt0Om3+jPiam7
         pGyWYUo7xN1xIX+tAbkOC52b342tTKTi3Ij0oI3HU5HBNgAyhUj0cRAQJjASvjDzFPmZ
         uI+ZleMmknguAx4LpLvM9pQIpoQr06P970anvoIE9H/Zx0r6/tHOC9vpFdM++frgN5Ha
         fQsg==
X-Forwarded-Encrypted: i=1; AJvYcCW3SS4B+nr61EVBUgmqlgw1XyZsD6/bMVTngTY8h4QNUq7e2n+kKQlcRez93iixLbAvGzBDcG1f4BYIwZY=@vger.kernel.org
X-Gm-Message-State: AOJu0YynLuDFVgsR96xehZNzkQLTTOH0ZNbf6d4ZR3N9S8Je4mjxbSdd
	0iaqHB7vRCl4TUlCiRjmTpJpclgJgC6BpvJ2C5r72aaiF3eC/E19FfdB
X-Gm-Gg: ASbGncvNLu44LySktD9wZDIHLW26yDeqw5gtVJxOBVO8EmNwWQzoc8BEYh+03gs+BzM
	DfzZMSBJr+Zwr3SOWaEEMp8tSsfqFJdWf8Y6SV/EKRGYYShknrv4cVq4mDOGcri/FdOjVJtsZV/
	Ky4bmF2mmzOcjxF2lTl2r4j85vo3PbqwRYIEHAZOUDzjaEha1wBgJ3C4awB2Fkx6oLkqBfpPCfI
	8VeBT5SKMaZqS6o9yMhHBP9f336Oq/MBnF2Tx61sXZ/ZeNGVpjbPKwBglDcdcBTsdz/7rvWvVkA
	76pP9CzB00OKG95QZHZzhMcNxPQIE7zjTHAg2DZIYvUTXIQyIL6X9YPfoPGdS053yk2ndrB4cze
	TtxU=
X-Google-Smtp-Source: AGHT+IGA2r07/9DrczynTDZkbcf5/JuSdSiIkO+prJuWlI2qyoarXRFTY/6FXuka/JGeQdGyNCCyag==
X-Received: by 2002:a17:907:3e04:b0:ad8:ac7e:eead with SMTP id a640c23a62f3a-ae3500f5e01mr1062026166b.39.1751272264709;
        Mon, 30 Jun 2025 01:31:04 -0700 (PDT)
Received: from localhost.localdomain ([95.90.184.252])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae360e6ce54sm577568766b.37.2025.06.30.01.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 01:31:04 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/3] staging: rtl8723bs: remove redundant static function
Date: Mon, 30 Jun 2025 10:30:49 +0200
Message-ID: <20250630083049.103734-4-straube.linux@gmail.com>
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

Both wifi_regd.c and ioctl_cfg80211.c define a static function
rtw_ieee80211_channel_to_frequency() with identical functionality.
Remove the function from wifi_regd.c and make it non-static in
ioctl_cfg80211.c to avoid code duplication.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/include/ioctl_cfg80211.h |  1 +
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c  |  2 +-
 drivers/staging/rtl8723bs/os_dep/wifi_regd.c       | 11 -----------
 3 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/ioctl_cfg80211.h b/drivers/staging/rtl8723bs/include/ioctl_cfg80211.h
index 993a7b3c3d22..753009b07451 100644
--- a/drivers/staging/rtl8723bs/include/ioctl_cfg80211.h
+++ b/drivers/staging/rtl8723bs/include/ioctl_cfg80211.h
@@ -94,6 +94,7 @@ void rtw_cfg80211_init_wiphy(struct adapter *padapter);
 
 void rtw_cfg80211_unlink_bss(struct adapter *padapter, struct wlan_network *pnetwork);
 void rtw_cfg80211_surveydone_event_callback(struct adapter *padapter);
+int rtw_ieee80211_channel_to_frequency(int chan);
 struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wlan_network *pnetwork);
 int rtw_cfg80211_check_bss(struct adapter *padapter);
 void rtw_cfg80211_ibss_indicate_connect(struct adapter *padapter);
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 7cc1e036d2c4..eddf6da27a20 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -192,7 +192,7 @@ rtw_cfg80211_default_mgmt_stypes[NUM_NL80211_IFTYPES] = {
 	},
 };
 
-static int rtw_ieee80211_channel_to_frequency(int chan)
+int rtw_ieee80211_channel_to_frequency(int chan)
 {
 	/* NL80211_BAND_2GHZ */
 	if (chan == 14)
diff --git a/drivers/staging/rtl8723bs/os_dep/wifi_regd.c b/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
index ac0b58a8b5d3..f9c4d487badf 100644
--- a/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
+++ b/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
@@ -41,17 +41,6 @@ static const struct ieee80211_regdomain rtw_regdom_rd = {
 	}
 };
 
-static int rtw_ieee80211_channel_to_frequency(int chan)
-{
-	/* NL80211_BAND_2GHZ */
-	if (chan == 14)
-		return 2484;
-	else if (chan < 14)
-		return 2407 + chan * 5;
-	else
-		return 0;	/* not supported */
-}
-
 static void _rtw_reg_apply_flags(struct wiphy *wiphy)
 {
 	struct adapter *padapter = wiphy_to_adapter(wiphy);
-- 
2.49.0

