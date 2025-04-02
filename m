Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E421F4E48
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 23:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743636620; cv=none; b=eMJp6p6UUvAkKt1UyVUxztsWKrYQ6Uyl18adBH/sgKLIAJE02qdKRZZIFOLwLKY6GEyrKn7DsZdtcPeaib4BomLO8IWxxwhIBydjzgAoBwHIWmrIWcOnOxL4qFIhxumM4xOy5Eg7+JJabQKIEoJaS2Y98RbgXtquu8lQUDvVSAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743636620; c=relaxed/simple;
	bh=FC+bXCg9OO5iq9t3ZXMfUjkc9O7zgg/6bFgCTEb1FHU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I9qzClc5nezQkzYNq6MYvyo5R5Hcs+RGWLWEMHBDeHcmHni6py7s7oA/lR2UVn0Gv7z9ACSy/auEDdexr7/w1rfIr0+q4+HhscvzWq4PnUTn1Spq8O7pWsj4yvqpiV0y2AR1Vc878muRLrqwbMk3J0K5Fz/A5JUduNzEF6Zml9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iDUpSgMq; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iDUpSgMq"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac41514a734so48627666b.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 16:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743636617; x=1744241417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cgSAGPNVdbA1kLYMuFDlu0LEzgebSSjzEPSiFTvtLho=;
        b=iDUpSgMqyQZWwgwX+8hDSPL1jjyEoJh386G042LWny3BppfGFD4n5O2cRAOAuhxiOe
         meSDWaV106SECLDgjbe2rjNMePDbnWY7EC1HKsIDqbqZPO/bboLqswAFn0Jg6ZtiSQfy
         OyhDj0OV4GpDy+OUG9/xgkyN5u8e+om+KVYExpqRko9uQbhA6Zt7OKjI33a7HlMm+qhI
         QWRjAelOEGGydcpiDZzTVMgFjBZxGofIat76F4MSI/0d5CBQ0zaeXt74e8e/5h+puba9
         i4JGcVtUl9twN95otix9qIjKQCBlMxE4HpQUmilVfXvtd0o3IC8xWTfiDWEY6DTJqkm0
         K01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743636617; x=1744241417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgSAGPNVdbA1kLYMuFDlu0LEzgebSSjzEPSiFTvtLho=;
        b=eqohY1dDX2KmR2SEl+RVhNgkNnIpWB/FyWwFVcsVWdixnVN+E2zF+Q1FkVLosxRnSk
         psmBRH9LB7x70h/Uzg0YqQ/TLwZxhCJqEl4ag91njsaK32WetmL5YxPuqS8Y/0nUVtBj
         ddf+fdoNI09PdmueKHWbRt5bFSluxMb7zrvwAJByNzPnnty9t8iV9RkL/lH+NUok1AX+
         b3AoxDeXe99Yl5/8ePT5A+NLO6A1LsscLNrOkUyU0+/FP2FTttDCCRsj1yZQI0FxzbSa
         Ekh5v9a8g/1maQ+jS9a0VmDMNGLGqGogaHuV2IwOsclRgaAJX1+hgeXCM9uYS2+QCTce
         q2OQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgDVnAFocYFjOHwi5B5JFwBkIV4UTWIbKaPQQ4KViofv7OZ+LROssODwOhGhU7iYzLV/clpBnaMSDInxI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/h/55YbsR0ErLJKuQnszYMl98PFX+2QWGfomvSIFpcaNFw0xu
	xuz3jk/+WPePopDsgzkpfTcRnchXyxPgXh7Xmz9U+oZGF6RLwMGQ
X-Gm-Gg: ASbGncuRyz7g8CaIcrXm5URscUSy626DI5D/o6Kv9xHziAz23ndlv357E3VkfLRYLTx
	iS/cdpWEq3hCt3nUwEwpCohM+0tViisfCDA/ruFDSwhbGgsIohzlATwsJ5YFcNZ8w2WmsZONsUF
	oHRRRtQA4O+y1YLWFCenPPva/lhXW6WTwQTs+AzFSuHpwXPVclaL3wy6XePYcdrUOR7Vt8AyEsz
	dzZS8FQUV2b4VsfmY97ZYZCw9BME6tjpcFq/a1JP8yKSjZJiwWK5aHyh+8DuPGUs+v/hIOm77r9
	gnTGWm+DkMmgIaeVseYcqyIOAqFKnLyPnYwuGoTPQfYZ8hgWfg==
X-Google-Smtp-Source: AGHT+IEq+GxVf2hMdfSdfKBaOs+XYnhK5g0kYcToDxnihsf9c0xrQWGI6o9j4Go0+ESAfyepzOaA+g==
X-Received: by 2002:a17:906:7955:b0:ac2:55f2:f939 with SMTP id a640c23a62f3a-ac7a166e465mr353956966b.6.1743636616755;
        Wed, 02 Apr 2025 16:30:16 -0700 (PDT)
Received: from HP-650 ([105.112.231.107])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c01c2c13sm1458466b.182.2025.04.02.16.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 16:30:16 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	julia.lawall@inria.fr
Cc: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: Prevent duplicate NULL tests on a value
Date: Thu,  3 Apr 2025 00:29:01 +0100
Message-Id: <f04b31c428beb6195ad5df5116d1421fc036af16.1743635480.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1743635480.git.abrahamadekunle50@gmail.com>
References: <cover.1743635480.git.abrahamadekunle50@gmail.com>
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
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

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
index 026061b464f7..5d5278eefabe 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -941,7 +941,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 			if (!(psta->state & _FW_LINKED))
 				return _FAIL;
 
-			if (psta) {
+			{
 				psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
 				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
 				pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
-- 
2.34.1

