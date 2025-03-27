Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8826F12C7FD
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743089844; cv=none; b=tUZXBjBrpTkSX4PfxHZnibMs6Jc+15yKmYzC6Lu0MDbqHhoYtcB/89RdRihaZHZ16gOc+0YIK+CpfvTKM+/gFNq15VArI4JdvaZihSNYcEMCQB7XsgHEwTTQKsxAojY+U8p5GzpWaMAhvHUUyqyXjKvzqRPSw650j9ZmZ0ODuTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743089844; c=relaxed/simple;
	bh=qnzyEE09SZhDRDJ0WiICCQ/E3IQ1fEs6f/i6o9E83Wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aDsrvPPR7vrMUWJv8Y9iT2uw4unPsiYA8NXB+pMUDlnZhRQommfdzbnpDnTFhwGCHsSe73wc+7okqk6z4OvTeY8uMuq/cm1bLyii14wjKUc+rjcWJyAJRzPtIOw1QTliwv3AWlEjdupLBRX2NZ5UWNg9MnGS/PzLFoKCKoMspPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RQp6Fq33; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RQp6Fq33"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743089841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nFK7RsCREQDGF8kx/OiRKPVegGlb+uhCY2SliHPC3Zw=;
	b=RQp6Fq330aJFeTwIrAqD1SszzkgS8Q1L3nO6QMO1IOsX8wBoFzD6DZuypnAc8tYbZ5Cbd2
	9lax5Byl47lYDZrBbV7Y46H7Xnnp38RGT2Pc1K46/1btnGRNtkmVoLXvcJnASvicBGf2vd
	aere+39pg30ZfcJnXC3JxHvXY7IsjxY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-CKVF4hsbP2KPrTg21o0bYA-1; Thu, 27 Mar 2025 11:37:20 -0400
X-MC-Unique: CKVF4hsbP2KPrTg21o0bYA-1
X-Mimecast-MFC-AGG-ID: CKVF4hsbP2KPrTg21o0bYA_1743089839
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39142ce2151so553364f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743089839; x=1743694639;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFK7RsCREQDGF8kx/OiRKPVegGlb+uhCY2SliHPC3Zw=;
        b=PbGuS5NAHkYrsVXacqeYqpaAb0Tssl++gwiB+sOb/R5TqEMELtW5z7j2Z8mQ2Xp1TP
         pH49/THjDeLfiXnk4C1NHvV2YrWZ1GwazRswCLqlGUQ+dzQp8BcBT1iJq0FrALf2CYsj
         IhCtc2obNrZX0ifdCvAVRr/BQXYR0z7KnjyMI0XQ9sbGDRd/0azs9X5VZM1tReQ3ZItA
         sxDzNqzVuxaXDCYjZ0z7T+JwYbi2+gnXmFFfY44rCtrfe1JLaaxzoW9B21h8g2FOk+dj
         r7kuTaANtoIaS44VD/nhZd+0laHiLwdOD1/S+U8RUAsC3Pa5M55ckZ0Q33KY96H8Q8fK
         3CTg==
X-Forwarded-Encrypted: i=1; AJvYcCVAP54orjqD153a0GMLGOKyOsHoHBc7or6rCgI5zUtBd/nqZ+I2GlPwZtNNh3+RslDFkrjv7/QRQSLFC3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyztsIy5lVGRJediDZEb6FHacyVA6xFBZTpusu8u4T6awoWafqj
	8JB1hdkDkjlbDH+fKA+PauCCUu8yBipl2vshoLzKYrwlX12L+5VBkuh8ync+cS/DlNKxByfGQg/
	kMQ4wL5lcy2wQnEtnEuhsLez8LWkKktWPwZCH569zELo4adYzS8yamJXbGTo8IA==
X-Gm-Gg: ASbGnctJQGupXzi1PwisfAY9ep9UmEHHD5bEMRFBN5arf0MbD+jXY0hT6/pTo9yvpgI
	hedBSBADkd2j204YsRPHY4lO+Qa+S+gmVmuT0mp3i0sdGayl05Bf1gdsMi9cVdbOoMYXgHyuARU
	SrCEuMxToKROwvFPCaKX7YN25x6CxCrsTNFxgrx3VJit+lBQK4GUlTMsmC+rCwzm2roIN25ns8I
	5fucysmIrW7RiyXKdlze0Kjly1dtFf2pZyt2vcEMxrJjC+TlHL8Na/dgQ2SYJthyBsng7yu+Jc1
	0Jew/ZRrsX69RnklYqtjibQICSWgmaFheiRTpWoiDCAaeDnEn1sYHjQ6NUp9mdga
X-Received: by 2002:a05:6000:2913:b0:391:3f4f:a169 with SMTP id ffacd0b85a97d-39ad175bf85mr3118547f8f.32.1743089838994;
        Thu, 27 Mar 2025 08:37:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiZcHoFwp0VdacVvgmlY4YT/HkKYT+1vUl9P2aKDuscGeuEHQ+PoWJjg4v6oTuSINpFMBLJA==
X-Received: by 2002:a05:6000:2913:b0:391:3f4f:a169 with SMTP id ffacd0b85a97d-39ad175bf85mr3118513f8f.32.1743089838413;
        Thu, 27 Mar 2025 08:37:18 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-25-55.business.telecomitalia.it. [87.12.25.55])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39abfc2115asm14199964f8f.4.2025.03.27.08.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 08:37:17 -0700 (PDT)
Date: Thu, 27 Mar 2025 16:37:13 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
	linux-integrity@vger.kernel.org, Sumit Garg <sumit.garg@kernel.org>, 
	Jens Wiklander <jens.wiklander@linaro.org>, Jarkko Sakkinen <jarkko.sakkinen@opinsys.com>, 
	Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tpm: Make chip->{status,cancel,req_canceled} opt
Message-ID: <bxm7fa2st6glsegemyxbwj4q47azl7h3qmg4vo7o4xqa4ahstj@frtabtwa7jok>
References: <20250326161838.123606-1-jarkko@kernel.org>
 <exzxzomw7wcobjuoje37x6i2ta54xzx5ho74t3atd7g74xltlb@ymw2pn3yo27b>
 <Z-VRWy8jLkA0cpow@kernel.org>
 <56428ff1ac4355482df881e6226518c2a62beb6d.camel@HansenPartnership.com>
 <Z-Vn91fADShpp65e@kernel.org>
 <Z-VpjSZSMOk73_Dg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Z-VpjSZSMOk73_Dg@kernel.org>

On Thu, Mar 27, 2025 at 05:06:53PM +0200, Jarkko Sakkinen wrote:
>On Thu, Mar 27, 2025 at 05:00:11PM +0200, Jarkko Sakkinen wrote:
>> On Thu, Mar 27, 2025 at 10:12:36AM -0400, James Bottomley wrote:
>> > On Thu, 2025-03-27 at 15:23 +0200, Jarkko Sakkinen wrote:
>> > > On Thu, Mar 27, 2025 at 10:58:00AM +0100, Stefano Garzarella wrote:
>> > [...]
>> > > > > @@ -65,6 +89,7 @@ static ssize_t tpm_try_transmit(struct tpm_chip
>> > > > > *chip, void *buf, size_t bufsiz)
>> > > > > 	ssize_t len = 0;
>> > > > > 	u32 count, ordinal;
>> > > > > 	unsigned long stop;
>> > > > > +	u8 status;
>> > > >
>> > > > Why move `status` out of the do/while block?
>> > >
>> > > I'm not a huge fan of stack allocations inside blocks, unless there
>> > > is a particular reason to do so.
>> >
>> > The move to scope based locking and freeing in cleanup.h necessitates
>> > using scope based variables as well, so they're something we all have
>> > to embrace.  They're also useful to tell the compiler when it can
>> > reclaim the variable and they often create an extra stack frame that
>> > allows the reclaim to be effective (even if the compiler can work out
>> > where a variable is no longer reference, the space can't be reclaimed
>> > if it's in the middle of an in-use stack frame).  I'd say the rule of
>> > thumb should be only do something like this if it improves readability
>> > or allows you to remove an additional block from the code.
>>
>> Reclaiming here is only shift in the frame pointer, nothing to do with
>> reclaiming resources or freeing locks. Consolidating value state into
>> single location does improve readability as far as I'm concerned.
>
>Anyhow, I reverted that change given the feedback :-)
>
>Since I'm late sending PR, I'll put this patch to my 6.15 PR.

Okay, so I'll not include it in my series and I'll rebase my series on 
your tree.

Thanks,
Stefano

