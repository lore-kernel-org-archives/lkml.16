Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B201F25DAE6
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 10:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744193069; cv=none; b=YJMOAV9Ey/eF92P/ISjdihoM0hWbqdtDVVK1Grl6blWK2+ZqOru22lgpCTkpy0y5jkXamHAo/BoTkG7dxoC32KNTJg9W7MJvY0Tt/w1JO1Awt1EloBnK9GNJ9xxmwUud9ELpLkgZWhRwMX4YG/I+Vie+Ugun6Q9Oe2T9NjsnsS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744193069; c=relaxed/simple;
	bh=Y7aoilTHEAEiwViUts1s9DCkd38iWetjcqoy20zyZOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jId0eGg1sJv+aff3EkAHO4ALR5UyVElrUUx34BQoAeQE2Y5Rm/Lj+53HW+YcIIKovsjh+/AF9sKYT+k3LgbvXvDvlzXpxmA/7wC/Wt+gpJiFGr4N+5MKrys9MV90WB67+ov0iokVKkBvN5ojwAYk2ca2VLxhapK7U9D9ibqKS+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxPqs94m; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxPqs94m"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c1efc457bso3794196f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 03:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744193065; x=1744797865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PCzI50zVqiA5SSz6j5vbBxTst8NskylefZbAbeCkJRs=;
        b=mxPqs94mLcPuJnLUT3U8lmm4NeAarEhPPMhPegkTwk23Z16R9DDHnuRwjXwH+vUdmD
         a5f56UJ1MRxpWJTNBHCfsXWvUzOaafRdibfyUXKCzC69KFVlsB2HAvNYW1JmWJEo5OHJ
         B18HgXDJtSBADGTmJaeaIm8+v6XYNVOCH9ebkMXMn6WIkzPbZlDew+WZYjT3GSuo1u2B
         mYcJLzC0SkpwJ1B5WGcWigR98qIqyXIu56eNsor3pYoAsn/wkuN+iaKvhL8c+K+pSrur
         C7JnFZpRT6Jam8kL1/lPhfcFZPlJpnWabeyqKwQOPMdKNftvZNCy1zxvwIM+YOB9USyi
         AcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744193065; x=1744797865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PCzI50zVqiA5SSz6j5vbBxTst8NskylefZbAbeCkJRs=;
        b=e4YFQLLk7XnRpzOf9zV9VtMuOeYp+nAAb1TxwuwHJGdfkaw6gdRI9re4kbX0j45j78
         ptqSGSdIZ77As8dzcORAfcphXNItmS/u2IhyW3WWRHJ75hdT7jp30sCmut1jQjrn2aXv
         F/bebodZyyhv2Z3oG96LVizRteCdvzf3UiPMR8UQtasByygT/V8QSNnyZuDHnYUu7NVO
         brcYv1jJnRGmJ3rVrT3D4VXwZWedD+Y0lHoAavzrESJy+o4CYhSoufk/aR/CmNVLy1A5
         wNv/AT3kb+8yRkSuzICGRb/4PZkeSxMU/sfW2PJQLaWN2DNh3v8fof6BPgErJip6Dv24
         f5mQ==
X-Forwarded-Encrypted: i=1; AJvYcCWin3AnLxs4dMmbayHiIkSdRCe7AtzZqZ4oEFDQYvpsMy45NK8QChfiraMphlZMpab34wRGvtao23EduRo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2YcoFgtTVfsgndro01+YO5wrATUg1xXsJGRSLFYAl37yDxTvE
	2uNfoZtvCp9Azt3eOA3yZ1kC5OPhACfKzd/W0MQ6AfVgCV5OQfeM
X-Gm-Gg: ASbGncvJvAK7WEdEdaytI0rFSNMkGFlLZ/eX6Srxn9evnPd4GJwf4I9PcgnwzKJpZwO
	VvHETCwcFRNx5xhTFca3rhh85hwymtKz5bCcDBVGkcVTx30+2giwDWLT3ardAbsZmltcsxvf0dL
	NxPZdRa3Jy7jEaWelv0DF+JeDdf18vd/rT67kYVKOCvySovuUOAIBgSnv/ZvNlaE90hqPzD97jx
	EDfH8tteM3ksxVIO6if6oOEgFhBtZXsNQEuEpBjmwxhLVO9GeR/1slNRsD0kpB2tYYuw8OvnKkR
	F0j1royCsNj5/QQDdkTlQvI1sQWtCDGc6hZZfg==
X-Google-Smtp-Source: AGHT+IFeZKOFYB4CHU5SWnQx8exXAGvWWy5DD7UqI5Mdd/V8928schjgyY2lbkhbslyWyFRJVJ6G+g==
X-Received: by 2002:a05:6000:402c:b0:39c:12ce:67e with SMTP id ffacd0b85a97d-39d8855a42fmr1668006f8f.41.1744193064904;
        Wed, 09 Apr 2025 03:04:24 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f205ecac8sm14930295e9.4.2025.04.09.03.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 03:04:23 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] staging: rtl8723bs: Initializing variables at declaration
Date: Wed,  9 Apr 2025 13:04:05 +0300
Message-ID: <0fb58ca930030af2a4c730b0f5328e64210b795b.1744192642.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744192642.git.karanja99erick@gmail.com>
References: <cover.1744192642.git.karanja99erick@gmail.com>
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
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 39 ++++++-------------
 1 file changed, 11 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 5dc1c12fe03e..d134d185bfae 100644
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
@@ -242,8 +239,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 						/* pxmitbuf->priv_data will be NULL, and will crash here */
 						if (pxmitbuf->len > 0 &&
 						    pxmitbuf->priv_data) {
-							struct xmit_frame *pframe;
-							pframe = (struct xmit_frame *)pxmitbuf->priv_data;
+							struct xmit_frame *pframe = (struct xmit_frame *)pxmitbuf->priv_data;
 							pframe->agg_num = k;
 							pxmitbuf->agg_num = k;
 							rtl8723b_update_txdesc(pframe, pframe->buf_addr);
@@ -326,8 +322,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 		/*  dump xmit_buf to hw tx fifo */
 		if (pxmitbuf) {
 			if (pxmitbuf->len > 0) {
-				struct xmit_frame *pframe;
-				pframe = (struct xmit_frame *)pxmitbuf->priv_data;
+				struct xmit_frame *pframe = (struct xmit_frame *)pxmitbuf->priv_data;
 				pframe->agg_num = k;
 				pxmitbuf->agg_num = k;
 				rtl8723b_update_txdesc(pframe, pframe->buf_addr);
@@ -357,12 +352,9 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
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
@@ -408,13 +400,9 @@ static s32 rtl8723bs_xmit_handler(struct adapter *padapter)
 
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
 
@@ -435,16 +423,13 @@ s32 rtl8723bs_mgnt_xmit(
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
@@ -557,15 +542,13 @@ s32 rtl8723bs_init_xmit_priv(struct adapter *padapter)
 
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

