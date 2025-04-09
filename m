Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831D1259CB3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 15:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744213320; cv=none; b=KmtskockPacDT0Tc6yYXrcHZucgi36LWtM8MI2tDkMocXBp772kQ4LnTeWuIdSnGzljxCIDwuDaFnjwOlS9mL7Qk/VqmfpEuOIsy0w+SujBPjaryBcZ8stAaICFR+dEqnQQtdB4ydOj4aNfC14fdBfSya6T2AXSMrtpV83c2sVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744213320; c=relaxed/simple;
	bh=Q6OGpSVxIa1TzU8YTuINcPALNgKDev2a8ASm19SQxQ0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=p5yYKqMIEnwaSQGlV80Rpkd6ZA6nuA0J1/yGC/UhuvmLvIq859jYFjwF1tKG3UEEMexxzZ5MWQTiQV5GVco0KpalwtSETN9jnM+/Ry/P7Tt+lkiA5ePu+J9YhOz4w309Ga8NTmig0zmlB1U0fpU8HgDJEG2GV5uyx1aLshDCKMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=RPyiv0vG; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="RPyiv0vG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=S+qn1CnEm9/PZdH4urciI0YYFqE/hTqAghA1/E92Jp0=;
  b=RPyiv0vGv/s3jdJSIhzSTGQiMhP5yA96I0DQMXd0vCFqZjPAu+rGKnIp
   2pOo14+CdPYOo2nSBeofqi5E+lCN0m0HYDoYBO4W2XfQH1EAXSe+k6bDG
   4Iu5t4thKUe7d97T2xAPgcz7RVzftLBA5u8OyW/xWt5OIQJlC8dh6nhu2
   o=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.15,200,1739833200"; 
   d="scan'208";a="217160243"
Received: from 74-95-99-105-richmond.hfc.comcastbusiness.net (HELO hadrien) ([74.95.99.105])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 17:41:56 +0200
Date: Wed, 9 Apr 2025 11:41:54 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Erick Karanja <karanja99erick@gmail.com>
cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, 
    philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] staging: rtl8723bs: Initializing variables at
 declaration
In-Reply-To: <0fb58ca930030af2a4c730b0f5328e64210b795b.1744192642.git.karanja99erick@gmail.com>
Message-ID: <9dce3c-6ac-8b7e-fdbc-75e14f73fcc4@inria.fr>
References: <cover.1744192642.git.karanja99erick@gmail.com> <0fb58ca930030af2a4c730b0f5328e64210b795b.1744192642.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 9 Apr 2025, Erick Karanja wrote:

> Make the code more readable by moving trivial
> initializations up with the declarations instead
> of wasting a line on that.
>
> Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> ---
>  .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 39 ++++++-------------
>  1 file changed, 11 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> index 5dc1c12fe03e..d134d185bfae 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> @@ -120,13 +120,10 @@ static s32 rtl8723_dequeue_writeport(struct adapter *padapter)
>   */
>  s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter)
>  {
> -	struct xmit_priv *pxmitpriv;
> +	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
>  	u8 queue_empty, queue_pending;
>  	s32 ret;
>
> -
> -	pxmitpriv = &padapter->xmitpriv;
> -
>  	if (wait_for_completion_interruptible(&pxmitpriv->xmit_comp)) {
>  		netdev_emerg(padapter->pnetdev,
>  			     "%s: down SdioXmitBufSema fail!\n", __func__);
> @@ -242,8 +239,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
>  						/* pxmitbuf->priv_data will be NULL, and will crash here */
>  						if (pxmitbuf->len > 0 &&
>  						    pxmitbuf->priv_data) {
> -							struct xmit_frame *pframe;
> -							pframe = (struct xmit_frame *)pxmitbuf->priv_data;
> +							struct xmit_frame *pframe = (struct xmit_frame *)pxmitbuf->priv_data;

I'm not sure that it's worth making this change here given that it makes
the line even longer.

>  							pframe->agg_num = k;
>  							pxmitbuf->agg_num = k;
>  							rtl8723b_update_txdesc(pframe, pframe->buf_addr);
> @@ -326,8 +322,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
>  		/*  dump xmit_buf to hw tx fifo */
>  		if (pxmitbuf) {
>  			if (pxmitbuf->len > 0) {
> -				struct xmit_frame *pframe;
> -				pframe = (struct xmit_frame *)pxmitbuf->priv_data;
> +				struct xmit_frame *pframe = (struct xmit_frame *)pxmitbuf->priv_data;

This also makes a long line.

>  				pframe->agg_num = k;
>  				pxmitbuf->agg_num = k;
>  				rtl8723b_update_txdesc(pframe, pframe->buf_addr);
> @@ -357,12 +352,9 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
>   */
>  static s32 rtl8723bs_xmit_handler(struct adapter *padapter)
>  {
> -	struct xmit_priv *pxmitpriv;
> +	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
>  	s32 ret;
>
> -
> -	pxmitpriv = &padapter->xmitpriv;
> -
>  	if (wait_for_completion_interruptible(&pxmitpriv->SdioXmitStart)) {
>  		netdev_emerg(padapter->pnetdev, "%s: SdioXmitStart fail!\n",
>  			     __func__);
> @@ -408,13 +400,9 @@ static s32 rtl8723bs_xmit_handler(struct adapter *padapter)
>
>  int rtl8723bs_xmit_thread(void *context)
>  {
> -	s32 ret;
> -	struct adapter *padapter;
> -	struct xmit_priv *pxmitpriv;
> -
> -	ret = _SUCCESS;
> -	padapter = context;
> -	pxmitpriv = &padapter->xmitpriv;
> +	s32 ret = _SUCCESS;
> +	struct adapter *padapter = context;
> +	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
>
>  	allow_signal(SIGTERM);
>
> @@ -435,16 +423,13 @@ s32 rtl8723bs_mgnt_xmit(
>  )
>  {
>  	s32 ret = _SUCCESS;
> -	struct pkt_attrib *pattrib;
> -	struct xmit_buf *pxmitbuf;
> +	struct pkt_attrib *pattrib = &pmgntframe->attrib;
> +	struct xmit_buf *pxmitbuf = pmgntframe->pxmitbuf;
>  	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
>  	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(padapter);
>  	u8 *pframe = (u8 *)(pmgntframe->buf_addr) + TXDESC_OFFSET;
>  	u8 txdesc_size = TXDESC_SIZE;
>
> -	pattrib = &pmgntframe->attrib;
> -	pxmitbuf = pmgntframe->pxmitbuf;
> -
>  	rtl8723b_update_txdesc(pmgntframe, pmgntframe->buf_addr);
>
>  	pxmitbuf->len = txdesc_size + pattrib->last_txcmdsz;
> @@ -557,15 +542,13 @@ s32 rtl8723bs_init_xmit_priv(struct adapter *padapter)
>
>  void rtl8723bs_free_xmit_priv(struct adapter *padapter)
>  {
> -	struct xmit_priv *pxmitpriv;
> +	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
>  	struct xmit_buf *pxmitbuf;
> -	struct __queue *pqueue;
> +	struct __queue *pqueue = &pxmitpriv->pending_xmitbuf_queue;
>  	struct list_head *plist, *phead;
>  	struct list_head tmplist;
>
>
> -	pxmitpriv = &padapter->xmitpriv;
> -	pqueue = &pxmitpriv->pending_xmitbuf_queue;
>  	phead = get_list_head(pqueue);
>  	INIT_LIST_HEAD(&tmplist);
>
> --
> 2.43.0
>
>
>
