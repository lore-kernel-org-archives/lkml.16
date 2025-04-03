Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E1724E00C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743686877; cv=none; b=RGAKlsLtn8cqw5NmjAHSpD+SrkSUPylxBgaMPIjTrlENaBrJ4Cisn8GuEuaY2V2kPc5GiMkDDkfQeqQGCsW5glFcVQZl/EtX6xleq/lzTQaypDFjqI82CC6l6VgBExRz4p184WuEBVt8k8+w1Q21VSpImugLkX/uta9iUb9XuLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743686877; c=relaxed/simple;
	bh=TppPfz48Zffja+0eAECqj/ufQLq2W2xqDiyamIDS1nk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eCNXXg7R4YpUeIWe+G12NPzFSR+JjUqeKznbqr+lGv7/s6YM5Uz5j4TL7ktw/Yh1vw4gF+YO2PJvxI1t1r9A/De1jHgFdcJrePzXERbPeeppYMNMvXWei77wpVaK8B74uI0E8SK8OYNQkCC9Y0Gn1vpVwindY6uvmiUfihKBjXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HLwsZU6w; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HLwsZU6w"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43690d4605dso6201615e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 06:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743686873; x=1744291673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYfbRwZUzQz04jJUerlZh/Bqaam70D9SFCg8UAJdhY0=;
        b=HLwsZU6w7aVDCsrsujm0Us+uyHGVeWRjIik/wXIlUz9CXHmqpnFlkq4PQsevkjNvM4
         G2pfeu/ZYlTwW+aLgmgHlAV5UfQcSr2GZgh36Tv0NijX9ZhftONMReZiLqul7D0nJYeI
         GLFkzKwjofiAdEXYpXwqrmEkwE292FxjhwTOBe3+fpVAseyYf/FeulxWevRcm7cPSGsJ
         EduSJ90/UMUwNvtRa8F/bc/X4UC8soC8X/92d9zm2YlX1Zm34SS+c7XhDs93PjNlTLrh
         JRDOnJHhgWmgvxL8gsbXUjDpOyrbhC14F/u38qkm084nVSAvAKvcxkI7UtcKpekGmOd3
         +zZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743686873; x=1744291673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XYfbRwZUzQz04jJUerlZh/Bqaam70D9SFCg8UAJdhY0=;
        b=M1uM/EtCh6lMZYk67yzb0kT+lT8Qw4H/xM/8ndAn5hW5Gt03JMTdbJ4NK1vlJNFmGZ
         pqtFmeQjKE/Plij4aaU9msKszxl78mKfGX5aeAExR0pJmhs+l1bi5RhtbxkC37glZ33U
         E1/34wd4F33PmFtP3ooixHMtaPpV8JQuBCmxbplEFapjZknZOMorEWU524I5/t3q3O8x
         jgX9NEq9W/V4+hOebwMQEgVfMcfhavsTCx7EZ4/Zdf6WppvTY5pfzlC4bwzWLiwKWC9j
         UrdfekLfqF8vCq6urZvf8TTxR0z22O/X3+bT8jjjWM3kpQH4zXgpSo+0hN3yLDg7LOp4
         f1AA==
X-Forwarded-Encrypted: i=1; AJvYcCXl7HR1yIUbTS7LxmHVS3BwfUx1g09g+r6+0TrCBc9ELbvbIGl5+W0N+6AkQmmjVwpIVaIdO8JNeg0bcrg=@vger.kernel.org
X-Gm-Message-State: AOJu0YygnDPMH6x+IZ51LXxm6u3Umyn3IttXVE50jU02TTM6hZ+beBus
	3V4uTuJAr+DQP5bQmfTzn0b2R1qflEsPAK+LJlVxYkRyTzetqNt7
X-Gm-Gg: ASbGnctV9HQB/9piBWHjMElHCtqqODdyD30u/4SCWkgDiT/xKtudOo1GJk5wl8S1o9f
	MwLg5q3UOPGJ3/iEsKMlgQQdzEvLkjLi6yMjktJ34rdRspC5k0KJNVyyO6Ah82J4Egx3jXWcv9P
	rinDH2941JK3ZnyZilEWeDxWPJLj0p38dLPpX3eo/wRSTzWS2/hQypcVrWaloCL7GRwxc3z2xLb
	tfrcyT4gsapg+slCqITNYJt+c16Z398mPj4B+iUHkLGBujWl/jXm/2EjYTGezc/ZWRUsg2jjHMP
	DkuARkHtj7l5WoYWc6TyacfdJrm9HG6ZenZ0ZcD91Q4=
X-Google-Smtp-Source: AGHT+IG2whMe7p+lHvWAbm/G2Q6XIeZ+yTcqJqi0mfB5DqR5mC79MruKtdqNX9IV4WY/5SQ7zodhcw==
X-Received: by 2002:a05:600c:16d4:b0:43d:7588:6699 with SMTP id 5b1f17b1804b1-43ec40eeec7mr15115695e9.7.1743686873298;
        Thu, 03 Apr 2025 06:27:53 -0700 (PDT)
Received: from HP-650 ([197.210.35.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364c959sm18242925e9.25.2025.04.03.06.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 06:27:53 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	julia.lawall@inria.fr
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	andy@kernel.org,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v2 3/3] staging: rtl8723bs: Prevent duplicate NULL tests on a value
Date: Thu,  3 Apr 2025 14:26:43 +0100
Message-Id: <1325d06f5a4eb18eb52eb20d5af89207504c46b6.1743685415.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1743685415.git.abrahamadekunle50@gmail.com>
References: <cover.1743685415.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a value has been tested for NULL in an expression, a
second NULL test on the same value in another expression
is unnecessary when the value has not been assigned NULL.

Remove unnecessary duplicate NULL tests on the same value that
has previously been NULL tested.

Found by Coccinelle

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 56 +++++++++----------
 2 files changed, 28 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 90966b7034ab..675226535cd1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1323,7 +1323,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	spin_unlock_bh(&pstapriv->asoc_list_lock);
 
 	/*  now the station is qualified to join our BSS... */
-	if (pstat && (pstat->state & WIFI_FW_ASSOC_SUCCESS) && (status == WLAN_STATUS_SUCCESS)) {
+	if ((pstat->state & WIFI_FW_ASSOC_SUCCESS) && (status == WLAN_STATUS_SUCCESS)) {
 		/* 1 bss_cap_update & sta_info_update */
 		bss_cap_update_on_sta_join(padapter, pstat);
 		sta_info_update(padapter, pstat);
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 026061b464f7..f817cab2f831 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -941,35 +941,33 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 			if (!(psta->state & _FW_LINKED))
 				return _FAIL;
 
-			if (psta) {
-				psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
-				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
-				pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
-
-				SetSeqNum(hdr, pattrib->seqnum);
-
-				/* check if enable ampdu */
-				if (pattrib->ht_en && psta->htpriv.ampdu_enable)
-					if (psta->htpriv.agg_enable_bitmap & BIT(pattrib->priority))
-						pattrib->ampdu_en = true;
-
-				/* re-check if enable ampdu by BA_starting_seqctrl */
-				if (pattrib->ampdu_en == true) {
-					u16 tx_seq;
-
-					tx_seq = psta->BA_starting_seqctrl[pattrib->priority & 0x0f];
-
-					/* check BA_starting_seqctrl */
-					if (SN_LESS(pattrib->seqnum, tx_seq)) {
-						pattrib->ampdu_en = false;/* AGG BK */
-					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
-
-						pattrib->ampdu_en = true;/* AGG EN */
-					} else {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
-						pattrib->ampdu_en = true;/* AGG EN */
-					}
+			psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
+			psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
+			pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
+
+			SetSeqNum(hdr, pattrib->seqnum);
+
+			/* check if enable ampdu */
+			if (pattrib->ht_en && psta->htpriv.ampdu_enable)
+				if (psta->htpriv.agg_enable_bitmap & BIT(pattrib->priority))
+					pattrib->ampdu_en = true;
+
+			/* re-check if enable ampdu by BA_starting_seqctrl */
+			if (pattrib->ampdu_en == true) {
+				u16 tx_seq;
+
+				tx_seq = psta->BA_starting_seqctrl[pattrib->priority & 0x0f];
+
+				/* check BA_starting_seqctrl */
+				if (SN_LESS(pattrib->seqnum, tx_seq)) {
+					pattrib->ampdu_en = false;/* AGG BK */
+				} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
+					psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
+
+					pattrib->ampdu_en = true;/* AGG EN */
+				} else {
+					psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
+					pattrib->ampdu_en = true;/* AGG EN */
 				}
 			}
 		}
-- 
2.34.1

