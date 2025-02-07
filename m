Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5212A195FE5
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 21:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738962519; cv=none; b=MK9zrr32bVVLWJ7BWPQwjQAxMTT2+Jp6iSVHuDshGi0AeuB2v1sw12lJwuuHQUUBtaHvCexv4TIk8ONjzLKht8jfqJD5zT6gz277Tx7VFnSUO0DBGcaLWsWS2wEI41OCIagj/+KjWPV1cXJIKRmuIAk9SVJGqRfNNJTxAnjJpU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738962519; c=relaxed/simple;
	bh=Vfay3xfwl5ZL7vb7CBY/ipNeneNfsYNQSe4jRhVaRa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZcrIY7ir7B1SzrC6tAaeyhDPenglSMKziYypTxIfBMqWPkXnDU2gg7XenfFa71HBkpEMtzGAljkUtuuyG5XNsezLMVs/8mwVUkG+PKLzcJf2v1t7LSqQwL4ZdHo95u3DUVGbOH6+H5q28LefA5AktZw7adcNkXVcLziz+bqad8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XtZph6Qp; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XtZph6Qp"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21f4aa501a4so3872285ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 13:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738962517; x=1739567317; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DNwtoW5NAkLPNOoSFU7Fis59JOatiRfYCOIj5bFClDc=;
        b=XtZph6QpdPQeQkR61LksElah2CT6thVEMLktaM3MJfpkOzKd2ldQP4mLrotEBqcbmL
         p/1g65vVgExXBUCUZlRsNkPRKov61WlRaYcFiPtzrXFI3wELG/yZtTpBUsOJndTd+bLL
         SFMRsQHr4CQhgoC65RL2eCer8ToupuAdnoltOCi/nyhs+4la5g/zXFF1lrqUj0bWybjN
         hkibb/qMGtMpYDHo0wWQ2B0LBKGAnckxO2ul+Z+I+FWPtfYHkm/zd8ZK6tLuPYhMJs+L
         stRBFMspCJRxo+coUB2iMY1yivxw6UEiVnQrFWJlR/YHW/khLICXPcxSkmwPd2wnKYPF
         eNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738962517; x=1739567317;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DNwtoW5NAkLPNOoSFU7Fis59JOatiRfYCOIj5bFClDc=;
        b=fprwAo0NCgfEp7ymNgH1ZBON4BhZFOQL2T+OcN8bEHPBvBtSMnIJlX+XLC3ypyqOO9
         aEmgpBnYPA84DHtD0J5r73heP8dCnvKOJX3YMPKNGC0PrVuQStRfGpM1xjSQGg+dMcFI
         TSzkX/imVW/3v1KRswNI02ol8ueRPZHCagV4/PIu7GWMjTeUCykiC1SKnzsYldkhQUp1
         K182aq6z2oxTkUfIWISuEi4PjjnB7zPErhUkOmozS2F3kmS5YnLtHXWcSFg8ai0QYSxt
         Gt9yi83X12kX/s9ox03i0iI2D/mA/F61kYBaIqAYR+vUfUseh3VzkWidN/PJJChV0uBy
         QxjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk6iyiOipJXDv5wxvExrOVPx8sfhSBQERnl4Y80jWL4fvoDiIvGQp3LQYJE/MHeD/tOnykHnmzqOLNXuw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhUgtsFBdzf8GHhtU2swPTkTRnQ5/gUdJQHVBRbDAdKPB2hlw+
	+ZLVWEH0GrUz/Hvt6t0W/RJN7hSvNTbqNWJD0KcJf0WKkMQOYkAK
X-Gm-Gg: ASbGncsP4k2iJJbdGYBuJGkq+k/+zdpKgSOQ719/e6VCdS9kUA1rWMGf3T7YNn+Ot/B
	8nmU2FJ1tveCM8kJ+53q/IqbH/Qm1lPQ6rdT/Jf3IClLUzZZuQPg5BwJbZU9Jxv/4n3WfLA3oIB
	sV/XHfF6/O3i8KCe0ZBg41J0MXEA7YjSbt8JaOKXpVkvDJMPGC0r1f48C3cKQbuXn2rNd6Zlp2C
	M2dgjHqe87Jtjf1fX7QEGvvnWuygnFCSIjIYVE9tkiY2DBdQzUVjA/f3cc8ogaOhdY+BlFSqK5V
	h2kgZMS9i9GYWawp/uaIxaq6BqEFIlWa3M0j9x4WdZKI0Q==
X-Google-Smtp-Source: AGHT+IGY69ccVENQ9aVm67cFOHoewSil0EpIe4Hb+Xap4piHWnmLeaSUd+548Z41LXsXUEPd9624dw==
X-Received: by 2002:a17:903:2381:b0:21b:d105:26a7 with SMTP id d9443c01a7336-21f4e70e4f2mr27557855ad.6.1738962517525;
        Fri, 07 Feb 2025 13:08:37 -0800 (PST)
Received: from debian-BULLSEYE-live-builder-AMD64 ([2802:8012:30:9200:a83e:911f:eb3e:1cb7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653b02dsm35044015ad.74.2025.02.07.13.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 13:08:36 -0800 (PST)
Date: Fri, 7 Feb 2025 18:07:56 -0300
From: Gaston Gonzalez <gascoar@gmail.com>
To: Kees Bakker <kees@ijzerbout.nl>
Cc: linux-staging@lists.linux.dev, dpenkler@gmail.com, 
	gregkh@linuxfoundation.org, arnd@arndb.de, dan.carpenter@oracle.com, ajithpv.linux@gmail.com, 
	roheetchavan@gmail.com, niharchaithanya@gmail.com, eleanor15x@gmail.com, 
	everestkc@everestkc.com.np, skhan@linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] staging: gpib: ni_usb: remove unused variable
Message-ID: <tkq6c4e33nhct6lsxjqm4iwanefplvyvhqain3ofnctpbvx26p@royoj2icj4h7>
References: <20250207150427.153982-1-gascoar@gmail.com>
 <20250207150427.153982-7-gascoar@gmail.com>
 <2a172c30-3df6-4f5b-a63a-04d279738b64@ijzerbout.nl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a172c30-3df6-4f5b-a63a-04d279738b64@ijzerbout.nl>

Hi Kees,

Thank you for the review.

On Fri, Feb 07, 2025 at 08:46:53PM +0100, Kees Bakker wrote:
> Op 07-02-2025 om 16:04 schreef Gaston Gonzalez:
> > Remove unused variable 'adr1_bits' in function 'parse_board_ibrd_readback'
> > 
> > This change removes the following warning:
> > 
> > warning: variable ‘adr1_bits’ set but not used [-Wunused-but-set-variable]
> > 
> > Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
> > ---
> >   drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 2 --
> >   1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> > index d0656dc520f5..b7f221def217 100644
> > --- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> > +++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> > @@ -427,7 +427,6 @@ static int parse_board_ibrd_readback(const u8 *raw_data, struct ni_usb_status_bl
> >   	int i = 0;
> >   	int j = 0;
> >   	int k;
> > -	unsigned int adr1_bits;
> >   	int num_data_blocks = 0;
> >   	struct ni_usb_status_block register_write_status;
> >   	int unexpected = 0;
> > @@ -460,7 +459,6 @@ static int parse_board_ibrd_readback(const u8 *raw_data, struct ni_usb_status_bl
> >   		pr_err("%s: bug: status->id=%i, != ibrd_status_id\n", __func__, status->id);
> >   		return -EIO;
> >   	}
> > -	adr1_bits = raw_data[i++];
> Careful. You're removing the i++ as well.

Ok, you are right. I missed that.. I'll redo the patch.

> >   	if (num_data_blocks) {
> >   		*actual_bytes_read = (num_data_blocks - 1) * data_block_length + raw_data[i++];
> >   	} else {
> 

regards,

Gaston
