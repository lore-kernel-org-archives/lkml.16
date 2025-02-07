Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4952C194C6A
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 21:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738963010; cv=none; b=jBXumvHDfmpCU9fuVfUoHkrtf8Wgut2QcR3d3gWashyF9Ulxtqdk9pZKA6gtd2EIPGobhEaWAXb8Y7D9dPFuAO4+LfGrU8RrL3JVqQfgJ49OquXMuniD9rvH2lsLnetQ96+3PKU9qNuTaeQxfLDHLoik00juYUfje73Zxq5DJbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738963010; c=relaxed/simple;
	bh=tSBYpWuHOc+ZSGX7JVf17JwArISvxdwYn5upuBAulJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uFSriVVQw4rsXn0L2RqM2aIrt3DGhMoLetKfSdlyO2WSV+5b3CwIOEuGfvDchJKgvRzviV7O87kwajy6E9arWAmRZNY1HMn1SJlg75WtHCZS0DbrCofVCXqgIbZ4RA1okE1u7THuUL9P0gfj1syEWmpemb/T1kDHxdNcmRBC5zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FdRc4l04; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FdRc4l04"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21bb2c2a74dso5979055ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 13:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738963008; x=1739567808; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RNwfis5+EODCvIV+QcxMV5yTHpwRgr+/7It6WEYAhfY=;
        b=FdRc4l04uHFGvf4KIU32+5zmJyuA6n2V5b5cipSu9olSe2fT1fj1aF/Ou387ELCnin
         ZIaSRuh8SL2kBfP4IvJlDZvDdQXWQcRk4/59rKPSONhtshRR/Bjy2OPTyyMb0opNHzJA
         B/G79i9t+L1cbkjUq++BEXBeqC4kaj3vKtnK9cMJl7ZuQjWrs8JWAVJ6l2xh5vFcUDt/
         odknFrdvqSRrTQIR/7Miy3CSOmsH04CcSB79inbs5gC7FzbgiGc4Yleb4P3fke1wqXPB
         LwgQhzuLilf6B0UPHY4rm3JE3YL8EdpH7K3eUWsXt6mFONGeJgLf2kIFsGyma7o/rM32
         m+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738963008; x=1739567808;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RNwfis5+EODCvIV+QcxMV5yTHpwRgr+/7It6WEYAhfY=;
        b=moDK1ol092gavDUOjLBCZAUUJriVX+79w/rkEfd26OEAFunyByaPbDOYWZQH64tk2P
         XprFIEsszw7hssZSOHeqZAJeO8doWwe9vQTdyAB5L2iP7Vk+7CfiLNVnXOskfYy3mChQ
         Ks/ECiCqrxFTqtgtQTryWvp4ALf6+MjzH+d2R2yqlaMe34ec1A+RHNfvK7Rk76Tr+iwE
         BO5w3kd95rrAWoMJXBrwYjjp8qLOfuUZa+jM/McJuVBl7rO4BxprV2UMtMbv8o+yXYKR
         1PmOXCw8ZJZoGTqyZzDyobVffU6ah+iWAiuoG5E80qtiKJORMRIToD02nQooP7sJtzxX
         jZPg==
X-Forwarded-Encrypted: i=1; AJvYcCUCYG7UgOelYFxV2DjkrkZW8XpCNVTsboKsgDtFx2wIvdAjQiI3GzOWbSiro0dm3DQl6FCXQP5ZKgsPpuI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw78c/fEuUXG3h4dReRFzSj7o4QZYW4GU3TmU9sagkw7wTUwNxd
	qQ86wb8EdX6j0sM2i8I8uvLiZwAGo5Wwp03UlZPEK7fRY9OvHCIH
X-Gm-Gg: ASbGnctj3k5BLDoh5FTb5ljuClU3AT8aJXR3LoryYJNHDyxnOaLjRWWVtTkAdyVdImq
	pJ6VCS7o6Wbz562fyMrb4ZckRXfBzbIH2Kjbym2fUnYusRlE/36Wapqb0BVvgh/YO6i2uIBeKYp
	JQ6mXVOAbtl11aA8oOHKUNS+s3u5xWqCOoylMg56+xCdE7FbXaOzrtE2jNZes9eSVUc6dsEc/F/
	QQA6VtO6omoQ/RjDGiqhY4u/gyjifYbcbv8OIV3CW3uazgrUVFvEEpKz4P53onHqT15UKbKnAZi
	hyQpblxrbL3wEvrVGEkT3Jbzu+zCJX0RKvHe5+TBKwCUQg==
X-Google-Smtp-Source: AGHT+IG7vESP8azt9GczTBfxOLdpqjvfcrPZObAFWKe0qqiWdhbID8gN78EyRVnqqitLdetTcTT9Sg==
X-Received: by 2002:a17:903:2987:b0:215:94ef:6071 with SMTP id d9443c01a7336-21f4e7cbb57mr27027495ad.14.1738963008175;
        Fri, 07 Feb 2025 13:16:48 -0800 (PST)
Received: from debian-BULLSEYE-live-builder-AMD64 ([2802:8012:30:9200:a83e:911f:eb3e:1cb7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653b143sm35410395ad.54.2025.02.07.13.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 13:16:47 -0800 (PST)
Date: Fri, 7 Feb 2025 18:16:25 -0300
From: Gaston Gonzalez <gascoar@gmail.com>
To: Kees Bakker <kees@ijzerbout.nl>
Cc: linux-staging@lists.linux.dev, dpenkler@gmail.com, 
	gregkh@linuxfoundation.org, arnd@arndb.de, dan.carpenter@oracle.com, ajithpv.linux@gmail.com, 
	roheetchavan@gmail.com, niharchaithanya@gmail.com, eleanor15x@gmail.com, 
	everestkc@everestkc.com.np, skhan@linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] staging: gpib: tnt4882: remove unused variable
Message-ID: <ftwx3ukfpkybcbkjqrracieyr4pjh5kytw4yqabitqofmszz3c@264bh5sig2el>
References: <20250207150427.153982-1-gascoar@gmail.com>
 <20250207150427.153982-9-gascoar@gmail.com>
 <3753eb61-e198-4f4c-97d8-4634c1b8165d@ijzerbout.nl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3753eb61-e198-4f4c-97d8-4634c1b8165d@ijzerbout.nl>

On Fri, Feb 07, 2025 at 09:18:45PM +0100, Kees Bakker wrote:
> Op 07-02-2025 om 16:04 schreef Gaston Gonzalez:
> > Remove unused variable 'retval' in function 'tnt4882_update_status'
> > 
> > This change removes the following warning:
> > 
> > warning: variable ‘retval’ set but not used [-Wunused-but-set-variable]
> > 
> > Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
> > ---
> >   drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 2 --
> >   1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
> > index 2e1c3cbebaca..a681bf559b46 100644
> > --- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
> > +++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
> > @@ -704,12 +704,10 @@ static unsigned int tnt4882_update_status(gpib_board_t *board, unsigned int clea
> >   {
> >   	unsigned long flags;
> >   	u8 line_status;
> > -	unsigned int retval;
> >   	struct tnt4882_priv *priv = board->private_data;
> >   	spin_lock_irqsave(&board->spinlock, flags);
> >   	board->status &= ~clear_mask;
> > -	retval = nec7210_update_status_nolock(board, &priv->nec7210_priv);
> You cannot remove a function call just like that. At least, not without
> describing that
> it is OK to do so.
> >   	/* set / clear SRQ state since it is not cleared by interrupt */
> >   	line_status = tnt_readb(priv, BSR);
> >   	if (line_status & BCSR_SRQ_BIT)
>

You are obviously right on this one too. I'll look into this one more
carefully and I'll send a v2. 

Regards,

Gaston
