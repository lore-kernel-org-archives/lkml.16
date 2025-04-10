Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244AA20766D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744269126; cv=none; b=j6uhMxVdrdmY17ltsGM/868R9dzIUTFQ2bxgmJ1hHpjSfrLobK2VDGNg62K2BfE7hCSLgjhOfHIqhfG2nj3AtuIC9DR7D6YCEBxB3zwFReFCwdcHBYHUNfxSnRkf5n3mt4ol4T9c5bt2u/SXOSrIOZAwW1hK+PzkQFSu5fI2VU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744269126; c=relaxed/simple;
	bh=/5Jabjf2/VwLZmbye4C45Q8fKwbVmZpw1ehJK3tUXHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eJlkJdtpczVv1ib0WG8dXn+kg4LItJlaWQKp521mcVtb7BC9hV8kNmPLeLBhG2lxWiMNGLcmzVStjISd7lZzOS4Za1cqEum8/Q3kpYkJ3hEnP247PeABTaVm8/96jbCyV15r6pwf/zRaudGQeOm/aIUdrAmVMB4TBkP9f3g2aF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Olv1nyDU; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Olv1nyDU"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso3342835e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 00:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744269123; x=1744873923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/kImcHus6K8wzdBbiGWobUyEVK/5YlVtUxGYAzt1sU=;
        b=Olv1nyDUw0BmsZcizsLo2DYVj3gYJDt0R9GBersD0RS30LFxvFF+7hTGNsBlefMOl+
         XLpqZqxQr+Tj+6WniRHtfNxVYtcb3rUWT1WersZ0tPsTZD3HnZufM9d2kVwtVZh1PvpU
         VZqnGiJ5jt4XyUVP3pprN7v5vGSJdToo3IRpAKxAtdxQYkuyo0dNRLk7PqHZaJB5jMLO
         tjwaOjHL8P0qCMelt8AMgoV6Q8KOCHIAtdjdILrTTAGBiYou8aTtHBZG+hBQrPXhqlL4
         l8gibaK+/N4bqKevuPRt+aqeTYrXMnOpdig3oRYPhCV+EBPtNZXq266OA+V/S5gDANDN
         c3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744269123; x=1744873923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/kImcHus6K8wzdBbiGWobUyEVK/5YlVtUxGYAzt1sU=;
        b=Owc4tGNy3Y9dDSXkdKMCg3lsQfn/OYyOZwBxWAzGJNoSTYIk/3xId2Q6ipg0g/Br+M
         Pw0BdEGvopoR2On2U3XhzTpYZxwLthbqRsfx8ELrqNWfIRKHEmjWLtUsz/ajbXKU/Uj+
         79tiwmyT6/Y00Y7Ds9klrHzsphIpeQgDsWRBKtcRyiXZ/478qGKfHfPSQvbA+POFmQKU
         PXSDxmp+ZhPOh99iSSJ4F+hRuz3+0bn2NlyMA+zYZJ4pAszLqlBYAjGUdHighuOsDnTx
         tgDM+nJ/JIj0uvLWkvL70yCSXYkU3P3Hl4aw+9zXuDZIhyEsh8FDvd40btQ7hZUSTnXF
         fnqw==
X-Forwarded-Encrypted: i=1; AJvYcCXdYwEI/yEQz1765VVJHC8dWXMXf4t5zyZ86PYHXtImXfXBhKiVHYKk4eOvbJzQueTJY+XzbR1awOkCQnk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/tZMJONBCfTAAPwvtDh/3EYyiy9jJp/SgGsAIVZ16Z0883ViL
	RAkBLTCHWrg1KOYi7W2gPuN7/W7jTr4+M2LHDe6dA0FPcs8+r2qH
X-Gm-Gg: ASbGnctoWmyQkbausSVHzyHdCtWh3vpmiG9ikGCmLCtOHJTQ621HyJQEEc2Dtrt1NUd
	kZfz5rxZqRhC4mDEiQ54/cUScixfTqXuZ2POgqLCIGJF/P5mDq0DaIuI0/svgpUokP67Yp/Ecsq
	mpgwOfsd0hyfTS2hYNUXOBAMSh5BeTKlXDtGNq1xOFBVzMi21R2KgSfGYGCq5/JK22KTvnhZAmJ
	5Wd6yHS+RhP75VMLZW8zc8eHPYom5IoRXQoaEavw1DvQsZMzmdPHI9MVADgDnmYp4rL0tlJDB2y
	4bwT3GcrZqUgzagcNxz9PJtUISeCt/GiQybasg==
X-Google-Smtp-Source: AGHT+IGUjWy5+GCs4lfK0gJgBU45n/jQLhkWrXhfLZ0eHcJXduI2FPHwhAfMdNh2iZjfetiYKjIHMA==
X-Received: by 2002:a05:600c:524c:b0:43f:2bbf:c228 with SMTP id 5b1f17b1804b1-43f2d959427mr13343395e9.22.1744269123184;
        Thu, 10 Apr 2025 00:12:03 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f235a5e90sm40831765e9.38.2025.04.10.00.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 00:12:01 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] staging: rtl8723bs: Initialize variables at declaration in rtl8723bs_xmit.c
Date: Thu, 10 Apr 2025 10:11:50 +0300
Message-ID: <0a2165d8135d2b4de6b9c05fdc56fe5d7408e7c8.1744268316.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744268316.git.karanja99erick@gmail.com>
References: <cover.1744268316.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the code more readable by moving trivial
initializations up with the declarations instead
of wasting a line on that.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 33 +++++--------------
 1 file changed, 9 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 5dc1c12fe03e..842e19b53421 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -120,13 +120,10 @@ static s32 rtl8723_dequeue_writeport(struct adapter *padapter)
  */
 s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter)
 {
-	struct xmit_priv *pxmitpriv;
+	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	u8 queue_empty, queue_pending;
 	s32 ret;
 
-
-	pxmitpriv = &padapter->xmitpriv;
-
 	if (wait_for_completion_interruptible(&pxmitpriv->xmit_comp)) {
 		netdev_emerg(padapter->pnetdev,
 			     "%s: down SdioXmitBufSema fail!\n", __func__);
@@ -357,12 +354,9 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
  */
 static s32 rtl8723bs_xmit_handler(struct adapter *padapter)
 {
-	struct xmit_priv *pxmitpriv;
+	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	s32 ret;
 
-
-	pxmitpriv = &padapter->xmitpriv;
-
 	if (wait_for_completion_interruptible(&pxmitpriv->SdioXmitStart)) {
 		netdev_emerg(padapter->pnetdev, "%s: SdioXmitStart fail!\n",
 			     __func__);
@@ -408,13 +402,9 @@ static s32 rtl8723bs_xmit_handler(struct adapter *padapter)
 
 int rtl8723bs_xmit_thread(void *context)
 {
-	s32 ret;
-	struct adapter *padapter;
-	struct xmit_priv *pxmitpriv;
-
-	ret = _SUCCESS;
-	padapter = context;
-	pxmitpriv = &padapter->xmitpriv;
+	s32 ret = _SUCCESS;
+	struct adapter *padapter = context;
+	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 
 	allow_signal(SIGTERM);
 
@@ -435,16 +425,13 @@ s32 rtl8723bs_mgnt_xmit(
 )
 {
 	s32 ret = _SUCCESS;
-	struct pkt_attrib *pattrib;
-	struct xmit_buf *pxmitbuf;
+	struct pkt_attrib *pattrib = &pmgntframe->attrib;
+	struct xmit_buf *pxmitbuf = pmgntframe->pxmitbuf;
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(padapter);
 	u8 *pframe = (u8 *)(pmgntframe->buf_addr) + TXDESC_OFFSET;
 	u8 txdesc_size = TXDESC_SIZE;
 
-	pattrib = &pmgntframe->attrib;
-	pxmitbuf = pmgntframe->pxmitbuf;
-
 	rtl8723b_update_txdesc(pmgntframe, pmgntframe->buf_addr);
 
 	pxmitbuf->len = txdesc_size + pattrib->last_txcmdsz;
@@ -557,15 +544,13 @@ s32 rtl8723bs_init_xmit_priv(struct adapter *padapter)
 
 void rtl8723bs_free_xmit_priv(struct adapter *padapter)
 {
-	struct xmit_priv *pxmitpriv;
+	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	struct xmit_buf *pxmitbuf;
-	struct __queue *pqueue;
+	struct __queue *pqueue = &pxmitpriv->pending_xmitbuf_queue;
 	struct list_head *plist, *phead;
 	struct list_head tmplist;
 
 
-	pxmitpriv = &padapter->xmitpriv;
-	pqueue = &pxmitpriv->pending_xmitbuf_queue;
 	phead = get_list_head(pqueue);
 	INIT_LIST_HEAD(&tmplist);
 
-- 
2.43.0

