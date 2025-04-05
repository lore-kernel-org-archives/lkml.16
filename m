Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48DE1C84B7
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 08:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743842374; cv=none; b=Eo7WxEqCcCHRq2sFhz4hXmj8hb90EekjgGotwlPfrjX2K3GMj6cKPx1lFHLznT6ZjZYofmz+Y6QTbfYk1kyuJsKdXKiuWs9rtVz4UY9FTmD8MIRHqOo7KFXlE+i7EMHdjwMRC/ooAyYLqBuMzCpCuhBvmoEWGHQmwS+wOS/a/YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743842374; c=relaxed/simple;
	bh=c3BIYK43I4We76fB4omK5efuxzC1dYKzB3cx6OP+pdU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=tFUomtfkhzcISIurxnU+oXeOjcDmkqYWWZbX/7KvKFCQHkhqecuxIj8hEBFpM1pNqg2AXWSfXGE6CKjmFrqPY5ODgo21uJihgAaECVzWSxy4At1z5jQ4tgCS2R2rzbDu9P4vxlwDn2z+MEogln3G7LRY1kC/+cv6fYwS36eDDYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=bwyeaMVH; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="bwyeaMVH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=eKmBR1yXRsio+9Qiuhd7k6lFs4sEx1U1qvNooYoxyFM=;
  b=bwyeaMVHFC8Qv5Hz/z532RZqC/ERf1ftvedWMJtaws6GRhxmDTLvAzDx
   Mq5L/SS8X0nj05vhomOaxQYyAgWj4L4AlZ5fk0TV6rz8CPOfkk1Onk08Z
   79mi0PkmRnAIZ44Nc7u41tYiKprZwzaYaeajUbRrcTKgdzCuLQ79VtCFw
   M=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.15,190,1739833200"; 
   d="scan'208";a="216487729"
Received: from unknown (HELO hadrien) ([50.225.219.62])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 10:39:22 +0200
Date: Sat, 5 Apr 2025 04:39:21 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Greg KH <gregkh@linuxfoundation.org>
cc: Erick Karanja <karanja99erick@gmail.com>, outreachy@lists.linux.dev, 
    philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: rtl8723bs: Optimize variable initialization
 in rtl8723b_hal_init.c
In-Reply-To: <2025040532-only-quickness-21f2@gregkh>
Message-ID: <8ab69fd-2f65-749a-9c28-1c4e3ba9ab@inria.fr>
References: <cover.1743820815.git.karanja99erick@gmail.com> <f7b63d834b98aedfe2ce277d8008d7e398ea29ba.1743820815.git.karanja99erick@gmail.com> <2025040532-only-quickness-21f2@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sat, 5 Apr 2025, Greg KH wrote:

> On Sat, Apr 05, 2025 at 06:14:48AM +0300, Erick Karanja wrote:
> > Optimize variable initialization by integrating the initialization
> > directly into the variable declaration in cases where the initialization
> > is simple and doesn't depend on other variables or complex expressions.
> > This makes the code more concise and readable.
> >
> > Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> > ---
> >  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 155 +++++-------------
> >  1 file changed, 41 insertions(+), 114 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > index e15ec6452fd0..1e980b291e90 100644
> > --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > @@ -152,13 +152,12 @@ static int _WriteFW(struct adapter *padapter, void *buffer, u32 size)
> >  void _8051Reset8723(struct adapter *padapter)
> >  {
> >  	u8 cpu_rst;
> > -	u8 io_rst;
> > +	u8 io_rst = rtw_read8(padapter, REG_RSV_CTRL + 1);
> >
> >
> >  	/*  Reset 8051(WLMCU) IO wrapper */
> >  	/*  0x1c[8] = 0 */
> >  	/*  Suggested by Isaac@SD1 and Gimmy@SD1, coding by Lucas@20130624 */
> > -	io_rst = rtw_read8(padapter, REG_RSV_CTRL+1);
>
> Ick, no, now the comment doesn't make much sense, right?
>
> The changes you are making here are odd, why are you wanting to do this
> type of thing?  What tool suggested that these are a good idea?

I made a Coccinelle script that does this, but it's not clever enough to
detect the comments.  Like for checkpatch, the results of Coccinelle have
to be reviewed.  Many can be inappropriate.

The goal is more like to address:

int ret;

ret = 0;

julia

>
> thanks,
>
> greg k-h
>
>
