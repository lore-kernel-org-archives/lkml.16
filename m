Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119B33209
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 03:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743822949; cv=none; b=uXPDUAyVlynw76HNAsH9L3l7ZJS77z7xSR4HXcU5sFyItsEzhgIgU8Zx2j/tJuUbnsexYGWPG+p8yFJQfsPTueP24bBmN7gSxvvIkZrmEkoHvHJVtYLi8dxZb7ACO1nyVm0hnl+9dxugVhbnBmzwH+fnbbp8MODDAhqAZWN/jyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743822949; c=relaxed/simple;
	bh=6wmuQ4xBJ/p57V3uZMiwB+aak9YwDuZCThNZhURf6Lw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KRBEihQY6o3WQi5QJ3s7cAJpk1+Dq6OxjOgf3AIJsP0hErCUYXPmenKqup0mavZk9uReBPSql5/1gQ/IJo1vkOsIO2X0I0G8bVxYD+0sXZnunw3Y5athe+QMh6JoupkZtsTu0N4aHn4EPMPNhXwWSqwHsMpn5FDPuzhuiS+TG1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ln3jk1vB; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ln3jk1vB"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so25373745e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 20:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743822946; x=1744427746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7kj8e5KMlBOp/DQsu01vidRr3nQ+UO1HZ+C4LyVGDRs=;
        b=Ln3jk1vBSsg4HGmqG0evlQevo99lU6xqfUhRan3t1aDQjcdzrhpxSqT99HLWRk4vLm
         6E0N+YKMjdgMsL3Ct1uytUYnWkbPL0ZYmw184J9DCKT3GqFeEtvm7Mia4uS1hDHVm4qF
         r72ZPx4ntInD5T8HjuYQk+XNVbXNhJxodrcGJb9X8oOw33ib0wHP+vqu2dSKaHzxOHzu
         EDqhg0C15hBD82ZJqIGGIc8shDXoMjUkI7W0mT3VuAw3wTsORmVo4vS65mYyJMwIXpBp
         5nh/22bHDrfAIBpUlC1PFUX3NahrsIyten4tpnl6AeR0HwV3aW6vWyU+9DahBw/5KrGl
         QQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743822946; x=1744427746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7kj8e5KMlBOp/DQsu01vidRr3nQ+UO1HZ+C4LyVGDRs=;
        b=Z7EieyC6l287rWFnyBo0P5Zi8Bivk0tRJrMPEvc3Awh578l6DFCm2L8zajKbf6S73a
         rca0ZLz6e+dN6F1y5mey4wnasfUtPcYTGrUrc4fuPaVMLsq4l3gR5XEzD2+8OsBd6f+x
         Eg4cTlC2xKgPdvqaSbcvY/Fsbd+MoByUX3PfjQBZp24okwiYYMEbtnkMHLbW+l53g1aL
         BvPc+ZG3yZtAzFvqXr6GjzoCtU+W0gINU5uWE7rMRdKHBpXaBW6G+nAGGAJjyiqVJGNc
         e0jivIUYedGJ/HmS3+1fgMPY9n/8a25A8POAfDGYy6AKM4M7cIbq1xqCMCY+nlBl+t0W
         qEDw==
X-Forwarded-Encrypted: i=1; AJvYcCX6N+LEgYjg3NkPRT1TkePn+CwN5DFkTX99HEqiKzvRpkRou/Xo4/4JkTp/+q+RdGiWGLxTTtGXE0OS1iY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfvBLceJWDa5+umhg5cZvtNO2+Quied4x37jt1DhZ36PJlkRqd
	bc8S+yAgrRh/G/kdCGSRoSKYF901VJDHTN+0Q3ZhkEZ3g3LF/IZo
X-Gm-Gg: ASbGnctDU913oRMhiJ9eGonldqY7jgCiBgL3vhAvLbutb3/YaTq/DhI613OPZuJyv7k
	7GzRuvgb6iPEOyMsSeatY5vHqePkZ1YL8WQ3UlGYxiDEsUu6rgh6RYFByOXCoF3EHqF/SPZ+Juu
	jbLLV7DDM7SsOEtknd+F6PAJ2paNKnhbHyI5+vhHO2ytCE/FqbnR0yCfIDRmbgiddk5kWPDE1Jq
	pQ3ECezoEYVNdpsaj3Rtvk6Shn6yDA0D5uAeOJiId3hGUgvIaP5khBjBxe1/buidrtMLKFn5b2O
	Ft70NRww8g4wkusoXPPc0rUeQk7UiGfhuG+0WSFjAg==
X-Google-Smtp-Source: AGHT+IHJCATuG4/WZlGUnW1DnDSoYaiXP9qbuSMdrAgwY3BMnLvXxrbFycKulef+WVuzh5gLgvnffQ==
X-Received: by 2002:a05:600c:1991:b0:43c:f509:2bbf with SMTP id 5b1f17b1804b1-43ebefb7f50mr98457175e9.15.1743822946094;
        Fri, 04 Apr 2025 20:15:46 -0700 (PDT)
Received: from pc.. ([197.232.62.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d6b1sm5832250f8f.62.2025.04.04.20.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 20:15:44 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] staging: rtl8723bs: Initialize local variables at declaration
Date: Sat,  5 Apr 2025 06:14:49 +0300
Message-ID: <ef29adfe7c8a189009b07c2873aa48782cd594ca.1743820815.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743820815.git.karanja99erick@gmail.com>
References: <cover.1743820815.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Optimize variable initialization by integrating the initialization
directly into the variable declaration in cases where the initialization
is simple and doesn't depend on other variables or complex expressions.
This makes the code more concise and readable.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 56 ++++++-------------
 1 file changed, 16 insertions(+), 40 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 5dc1c12fe03e..ebe9562a9606 100644
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
@@ -168,10 +165,10 @@ s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter)
  */
 static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv)
 {
-	s32 err, ret;
+	s32 err = 0, ret;
 	u32 k = 0;
-	struct hw_xmit *hwxmits, *phwxmit;
-	u8 idx, hwentry;
+	struct hw_xmit *hwxmits = pxmitpriv->hwxmits, *phwxmit;
+	u8 idx, hwentry = pxmitpriv->hwxmit_entry;
 	struct tx_servq *ptxservq;
 	struct list_head *sta_plist, *sta_phead, *frame_plist, *frame_phead, *tmp;
 	struct xmit_frame *pxmitframe;
@@ -181,9 +178,6 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 	u8 txdesc_size = TXDESC_SIZE;
 	int inx[4];
 
-	err = 0;
-	hwxmits = pxmitpriv->hwxmits;
-	hwentry = pxmitpriv->hwxmit_entry;
 	ptxservq = NULL;
 	pxmitframe = NULL;
 	pframe_queue = NULL;
@@ -326,8 +320,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 		/*  dump xmit_buf to hw tx fifo */
 		if (pxmitbuf) {
 			if (pxmitbuf->len > 0) {
-				struct xmit_frame *pframe;
-				pframe = (struct xmit_frame *)pxmitbuf->priv_data;
+				struct xmit_frame *pframe = (struct xmit_frame *)pxmitbuf->priv_data;
 				pframe->agg_num = k;
 				pxmitbuf->agg_num = k;
 				rtl8723b_update_txdesc(pframe, pframe->buf_addr);
@@ -357,12 +350,9 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
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
@@ -408,13 +398,9 @@ static s32 rtl8723bs_xmit_handler(struct adapter *padapter)
 
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
 
@@ -435,16 +421,13 @@ s32 rtl8723bs_mgnt_xmit(
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
@@ -519,9 +502,8 @@ s32	rtl8723bs_hal_xmitframe_enqueue(
 )
 {
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
-	s32 err;
+	s32 err = rtw_xmitframe_enqueue(padapter, pxmitframe);
 
-	err = rtw_xmitframe_enqueue(padapter, pxmitframe);
 	if (err != _SUCCESS) {
 		rtw_free_xmitframe(pxmitpriv, pxmitframe);
 
@@ -543,10 +525,7 @@ s32	rtl8723bs_hal_xmitframe_enqueue(
 s32 rtl8723bs_init_xmit_priv(struct adapter *padapter)
 {
 	struct xmit_priv *xmitpriv = &padapter->xmitpriv;
-	struct hal_com_data *phal;
-
-
-	phal = GET_HAL_DATA(padapter);
+	struct hal_com_data *phal = GET_HAL_DATA(padapter);
 
 	spin_lock_init(&phal->SdioTxFIFOFreePageLock);
 	init_completion(&xmitpriv->SdioXmitStart);
@@ -557,16 +536,13 @@ s32 rtl8723bs_init_xmit_priv(struct adapter *padapter)
 
 void rtl8723bs_free_xmit_priv(struct adapter *padapter)
 {
-	struct xmit_priv *pxmitpriv;
+	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	struct xmit_buf *pxmitbuf;
-	struct __queue *pqueue;
-	struct list_head *plist, *phead;
+	struct __queue *pqueue = &pxmitpriv->pending_xmitbuf_queue;
+	struct list_head *plist, *phead = get_list_head(pqueue);
 	struct list_head tmplist;
 
 
-	pxmitpriv = &padapter->xmitpriv;
-	pqueue = &pxmitpriv->pending_xmitbuf_queue;
-	phead = get_list_head(pqueue);
 	INIT_LIST_HEAD(&tmplist);
 
 	spin_lock_bh(&pqueue->lock);
-- 
2.43.0

