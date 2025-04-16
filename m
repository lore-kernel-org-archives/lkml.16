Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8219250BF8
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744811112; cv=none; b=N83CzPsaueMn8eKqepeE7g2ZKFSnsBs7ZAMVySXdlKz3n+Uz46fpGhYKZeilH13f11CoMpWdvs5NeEvg+HLVG+DexHb6GH7YKYPnjL+/rTMuSvnx2NEO4WR1Aenw9YpisYFDMrrWf1zahLOw736Wq9nR5g5EulD1IbPWq4/BE6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744811112; c=relaxed/simple;
	bh=SSGumOPO7KarJQZoMZ0YMRQJ+OOUafoEC97qoNhTAS4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=G0Va+JWQX542JbMlcfVv7upXQ5e3HlTxr/dJ2qgB84TVg5p7iYZ2ixzv0weRRAZ/V3lpLUeU1gzEkvUsAycYvmabhoRN74pH7/8zb+kAbI2ir8AT1qPSVXkqEhRXRPHZ9US0mXWwP6YbchuYyj5cT+A/aQfWDSjWFblzNUUI1i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=DIqVPSEp; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="DIqVPSEp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Sse+MWmWlUd4okV9BvuTdMxj6pvfwR3JRfox5MJ9mM4=;
  b=DIqVPSEpeLCVXm75PNoQiMZRvdri/xgpKOU7Ynad6EhLnwMuj1gOw5cd
   n9ppAAvhr8GLhMDrR5ZYn+tucmhiIpQW0AJ4Ju63tf6GpX6Hg0itN83Bc
   UWhgPHNNvcYa6TGD95MKDwHAny4suflBow3WZLRjTYqgDp9fR3ac026Qi
   U=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.15,216,1739833200"; 
   d="scan'208";a="218156110"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 15:45:01 +0200
Date: Wed, 16 Apr 2025 15:45:00 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Ayush Singh <ayushdevel1325@gmail.com>
cc: rujra <braker.noob.kernel@gmail.com>, johan@kernel.org, elder@kernel.org, 
    gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org, 
    outreachy@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [FIRST-PATCH] staging : greybus : gb-beagleplay.c : fixing the
 checks as first-patch
In-Reply-To: <490ab216-982e-4707-abe4-a5b8d0444458@gmail.com>
Message-ID: <eec572fd-3074-8f2c-f978-94841edf7a6@inria.fr>
References: <CAG+54DbvpWHyX8+ucEQpg2B6rNTJP11CRpYxcYVrKpKehzrK-A@mail.gmail.com> <490ab216-982e-4707-abe4-a5b8d0444458@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 16 Apr 2025, Ayush Singh wrote:

> On 4/16/25 17:47, rujra wrote:
>
> > added comments on spinlocks for producer-consumer model, rearranged the
> > lines on function calls where it should not end with "(" this bracket,
> > also removed white-spaces and aligned the arguments of function calls.
>
> Are these manual adjustments, or using clang-format?
>
> I do not care about formatting being "readable". As long as it can be done by
> a tool like clang-format, that's fine with me.
>
> Of course if you are fixing some checkpatch error, that is okay, but if now,
> please avoid formatting changes.
>
> The comments are fine. Although you probably want to add a space between `//`
> and the sentence start.

I don't think the kernel commonly uses // for comments.

julia

>
>
> >
> > Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
> >
> > > 8------------------------------------------------------8<
> >   drivers/greybus/gb-beagleplay.c | 16 ++++++++--------
> >   1 file changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/greybus/gb-beagleplay.c
> > b/drivers/greybus/gb-beagleplay.c
> > index 473ac3f2d382..fa1c3a40dd0b 100644
> > --- a/drivers/greybus/gb-beagleplay.c
> > +++ b/drivers/greybus/gb-beagleplay.c
> > @@ -73,7 +73,9 @@ struct gb_beagleplay {
> >          struct gb_host_device *gb_hd;
> >
> >          struct work_struct tx_work;
> > +       //used to ensure that only one producer can access the shared
> > resource at a time.
> >          spinlock_t tx_producer_lock;
> > +       //used to ensure that only one consumer can access the shared
> > resource at a time.
> >          spinlock_t tx_consumer_lock;
> >          struct circ_buf tx_circ_buf;
> >          u16 tx_crc;
> > @@ -642,8 +644,8 @@ static int cc1352_bootloader_wait_for_ack(struct
> > gb_beagleplay *bg)
> >   {
> >          int ret;
> >
> > -       ret = wait_for_completion_timeout(
> > -               &bg->fwl_ack_com,
> > msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
> > +       ret = wait_for_completion_timeout(&bg->fwl_ack_com,
> > +
> > msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
> >          if (ret < 0)
> >                  return dev_err_probe(&bg->sd->dev, ret,
> >                                       "Failed to acquire ack semaphore");
> > @@ -680,9 +682,8 @@ static int cc1352_bootloader_get_status(struct
> > gb_beagleplay *bg)
> >          if (ret < 0)
> >                  return ret;
> >
> > -       ret = wait_for_completion_timeout(
> > -               &bg->fwl_cmd_response_com,
> > -               msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
> > +       ret = wait_for_completion_timeout(&bg->fwl_cmd_response_com,
> > +
> > msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
> >          if (ret < 0)
> >                  return dev_err_probe(&bg->sd->dev, ret,
> >                                       "Failed to acquire last status
> > semaphore");
> > @@ -765,9 +766,8 @@ static int cc1352_bootloader_crc32(struct
> > gb_beagleplay *bg, u32 *crc32)
> >          if (ret < 0)
> >                  return ret;
> >
> > -       ret = wait_for_completion_timeout(
> > -               &bg->fwl_cmd_response_com,
> > -               msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
> > +       ret = wait_for_completion_timeout(&bg->fwl_cmd_response_com,
> > +
> > msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
> >          if (ret < 0)
> >                  return dev_err_probe(&bg->sd->dev, ret,
> >                                       "Failed to acquire last status
> > semaphore");
> > --
> > 2.43.0
>
>
> Best Regards,
>
> Ayush Singh
>
>
>
