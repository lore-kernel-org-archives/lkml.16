Received: from mail-oa1-f97.google.com (mail-oa1-f97.google.com [209.85.160.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B854F225413
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 19:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744832857; cv=none; b=mLM9Fy60ExtGh6P7AznRGW+aCly+4X+hG2+Gk6bPhTYKsLnhrg50R2ZrotELCE1qiyNMQHSZmCutIcHRqNei6ZoG46hFm1R+iAyYru2KnOx2jxHshJO9LWLQgfIXqkuxCG54EXIkx5/kWdqsJA9g+fmwPz+DIlgB01ofBXiL75M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744832857; c=relaxed/simple;
	bh=nmFbN8Jvti+aMcvdpLVr3RTBQY+w/ZlzYQcItC+kw5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HzxAeW6Af/5U+jSEGEb8wheUTN8Zxf2Oi9ZqUvc2xcBcI318/wwdgFaPaoT+4AE8vc+F23ZRcGHRWTxOZ7mjARXs4e4FHtTncs1d4OUOlc4uCTzo4ICunkjZwFyGaWf4sSutKNL/oWOR8b4EjyC1FhpE7nsSAiM0/pmjXS7oLBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=cIzBWt5j; arc=none smtp.client-ip=209.85.160.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="cIzBWt5j"
Received: by mail-oa1-f97.google.com with SMTP id 586e51a60fabf-2c1c9b7bd9aso4274683fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744832855; x=1745437655; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6Z9Eo3ldxsL6anf4/4F6dhkx8sn/QEC09Uie3Va9hcw=;
        b=cIzBWt5jiOkVqPN2LIGrRmsqTwQHY5694RMUusL6EkSO/egpxGcOzV9m0cf9u9Xul6
         xkz/e/+D4wPX3Cs9uCuFw6JQO24sFmywP/Qm+pe/uRSGfDkTODOKj3Vvx+X3Jxa42z9v
         6gFNogCt7pgg0WN/Q46GZ/XDfqus1ZN6vE0YB0tx8qujyAEu55vZOqeqI06j3ScxOh+3
         jSuV+/a0G3LPK8uErcacOPsGOGiqOhY7wMkZkMk3Uc7FSytB7VY+lMGhD4BfwJUxfhaZ
         cOBfM7CH4OEXmEAPAYLU9HSBWA4X9WAyy+tJ8pzZm1RkRVarGco1Zef2sD916BVrLUlH
         FV/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744832855; x=1745437655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Z9Eo3ldxsL6anf4/4F6dhkx8sn/QEC09Uie3Va9hcw=;
        b=c8m3/wmlMi/6pVZiOMHTJbdVDa3n0BnkkbxlUsxdp0d+oXEYoPw6tg+5oVy9JZ859M
         arJhGPkmZ8xU+REY7oNFhxTeZVtJG6T2SHgJeNUe6kCYe4dEbYYdwcdHwOJP2V5iwDUy
         eSnGD+XCqznxcgspP393r4ipx6n5vQwjZgXA1D2vS16Ag2WAmAEj4K2zvUlBN7UqBA6p
         dTI6oKgjthbzDqAcdBCMIqCMOo6hUJN9zcpn0L6YpSKC6qMUAq4jSyL2rW6M+pgvZaig
         1LK/ej01+UKLWWv6tX0wvhEgngfWQMr0650GD2WWLX5grs2VBC2NcnBv6X7Fpw5Zv3lj
         mX9A==
X-Forwarded-Encrypted: i=1; AJvYcCXQeOoTGsR4yRsbuyjrsKNDFska01g2RGvz2lWrAmx1akyMqEIfJbotppTGcShQ7yOgBToXhcQLGSCzbB0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvKi/hSvbwtsf+W5y4r0ceLbLRiVcGnvSpl5dYBOLC8kdEyFl/
	CErA3kmiQWFdualXHPxYhP9QnOm3lsjryn4jqAVJxoi7afs4LSxj5gck2ALQZ+HdbZMifjF4xKB
	v2vswvOCIMj+GmWkcbRTqqDorXdKNHr2F
X-Gm-Gg: ASbGncsymKyMt9qpjU9t3ZH/7/yJ9IMpPVeimXxCjaMORuUgWyW+fdo6KXhS43S912E
	Djjspl2mWzu7RLcoeBuNcf+ReUs4WZdLlwTDFkb3mIn3FTqIChZyhCTGdWwq7sk+UyDp0iirzHu
	vcqk6M3WbTpnexwaQzpCpdEJb21SBDYFZ04MmPrpoFaZMLMNW5VNcmzB8K95k+l5ycqBTgoshDC
	/9WjjuWZkrJctkx0yLaaJsyoP5/9env7bmb6jluc1aPvMZyBIhPW26+p+jTiJVCMyYYmKPABZTV
	lDMQEQ6+D3kqA8F+BN1xO+b5kwpn4EWqqFtxSXxLQjonOg==
X-Google-Smtp-Source: AGHT+IHlwyfJxVMiDiN9x6Wgi13vU3cyT5vEzRavgbyocC7QMrrwBfs+HSwVE22KOOJbvZEl5GHu8B2jnJJ9
X-Received: by 2002:a05:6871:6282:b0:2c1:b4ce:e43c with SMTP id 586e51a60fabf-2d4d2b9d85bmr1888654fac.21.1744832854718;
        Wed, 16 Apr 2025 12:47:34 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-2d0969cc5ddsm800307fac.23.2025.04.16.12.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 12:47:34 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id C637D34035E;
	Wed, 16 Apr 2025 13:47:33 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id C55E2E418F0; Wed, 16 Apr 2025 13:47:33 -0600 (MDT)
Date: Wed, 16 Apr 2025 13:47:33 -0600
From: Uday Shankar <ushankar@purestorage.com>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ublk: remove unnecessary ubq checks
Message-ID: <aAAJVZ8Bob8rosaa@dev-ushankar.dev.purestorage.com>
References: <20250416170154.3621609-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416170154.3621609-1-csander@purestorage.com>

On Wed, Apr 16, 2025 at 11:01:53AM -0600, Caleb Sander Mateos wrote:
> ublk_init_queues() ensures that all nr_hw_queues queues are initialized,
> with each ublk_queue's q_id set to its index. And ublk_init_queues() is
> called before ublk_add_chdev(), which creates the cdev. Is is therefore
> impossible for the !ubq || ub_cmd->q_id != ubq->q_id condition to hit in
> __ublk_ch_uring_cmd(). Remove it to avoids some branches in the I/O path.
> 
> Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>

Reviewed-by: Uday Shankar <ushankar@purestorage.com>

> ---
>  drivers/block/ublk_drv.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
> index cdb1543fa4a9..bc86231f5e27 100644
> --- a/drivers/block/ublk_drv.c
> +++ b/drivers/block/ublk_drv.c
> @@ -1947,13 +1947,10 @@ static int __ublk_ch_uring_cmd(struct io_uring_cmd *cmd,
>  
>  	if (ub_cmd->q_id >= ub->dev_info.nr_hw_queues)
>  		goto out;
>  
>  	ubq = ublk_get_queue(ub, ub_cmd->q_id);
> -	if (!ubq || ub_cmd->q_id != ubq->q_id)
> -		goto out;
> -
>  	if (ubq->ubq_daemon && ubq->ubq_daemon != current)
>  		goto out;
>  
>  	if (tag >= ubq->q_depth)
>  		goto out;
> -- 
> 2.45.2
> 
