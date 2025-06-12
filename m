Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C9C8F40
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 05:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749704651; cv=none; b=jCpH3pFZmC4JOekwvJwIRnR29K2BQTahnafSMkr7zxTsfd0JfTsFP8DkF1ED3YO71a1JAc2s2bSMNs3o4HfaMRezFd2kJvGEGqUIZjQQ67w7dky64TEMicPfWvlF0YtvHVxKK3BR8jxNiDP5g8Mmt9xxcf15ASsvCB+tzuJqVl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749704651; c=relaxed/simple;
	bh=lT61RXR++NcySR6/RQlo5VkWKX3/DpZu19gKRxLwc9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L6kCStqu1La3+qC/KuwrZQlblZd90mt3sphmUAs4M4VqLjILlfapDuAfi38b7ocedxawGyIcR+LvsG+A7gmRI1VhtuXTBZgUYqup8qWmN0aou96pqkebbCCwuTgZJYVtKo8koC/7vWP57rm9nInxcZtnDGYdZiryVhZuA0++FpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iB6iP59S; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iB6iP59S"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-23633a6ac50so7222465ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749704649; x=1750309449; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W6r8e7Fw59ZWedLKYju1tRc3TQYtMZ2U4teZHPzlD0k=;
        b=iB6iP59SoqhwD4nnu6qnapzaoxtwb428YJ7MNzKsL7Fwh5dTvmlihOsdmVkBDu4iht
         x65KffnJDQyVzIN1CNYsNxcESFhlZfIn+9hxT9wGbD2VjHqCnQ3xVJqjAFnwnAQR7y+N
         ADnz9RcdV+yrHwyOteRvCHn17o/C5pVQ95soE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749704649; x=1750309449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6r8e7Fw59ZWedLKYju1tRc3TQYtMZ2U4teZHPzlD0k=;
        b=YmC4QllJzv8yeS4vmD11h7PIOuH0HFVG/yj1JuQdvESh2WWusxYeIWqsBT+C1mrHc5
         kYv3MiEP7xnarXTh1BIjT+YRVrWNSQFV2trOdl+MS8kKaZe+j2CGRs9IwmAfrK9KERjH
         qAoDijzP0ICMx0tf7VLReGBGA286fg++RlkkgaA612M1sUEyZo6zUFf+C2SXTSEP5Bbn
         ADAQw0Bxs3oWMr7VW08NA6z9BUK63cRA+DBZMRYZB9SN5vCmAd1U7bwj77SNazlQx83l
         zGiFl/aWIP9J+oFHbC1nbCh8RqwGnXpGaI5qChFinyt1W3vpn5j8gdaAJytYJI1jxMcZ
         jSpg==
X-Forwarded-Encrypted: i=1; AJvYcCVfdP1TsdUizNz919TNmmCl1U9rrF1fL9YYCJteiRAY8YSLEteCSc0xChapVEGaq1PRGZjsyiZHBSxFfzg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6VwpcIx/Sx5Rvwy02Ohn8H7wxJqcACuplbqaMu8o+qQtdlykY
	DOpj9WQD9gYwlaH3x0bNdWN/4wNRhHIB6jz2PIFIfNFp8dMmdol9AQ/QvdZGjYPzdg==
X-Gm-Gg: ASbGnctuTNlL2zOwzuEGHAT114jLhNw3FFedd4Ic/jJtNILHXTN6KDF51PNzz+C6bBD
	a5bVtMjpr1SDctlvZUFd4550lPVokHPdNeDsXjq8h3/N+ox7VvSfSxiYnQiMOo+T/FYPlVd3sVE
	IVSkeBLFDcNmHTuBBigV4uxVxW34xzlLyM8lZowUbqjDz24Ix3vUHhu+hUp3KXGgewH9/cgCARk
	JRFIO80rEkMUJ/5+Y93qkz+HgrHN5pp3+udYhvVvLQ7+wQGiOHGv6QFjJ3ho2kNR+5HUyxkVO6F
	dpJNfP8/OMKvk1RN9UY6rYh5aCjQ3vUUc3UwTArV4ozy6aBntUOQxUiAYAHlCxoUdg==
X-Google-Smtp-Source: AGHT+IGeKQSxkczV8S+QUwl5tRJhb9rbzfk+IBqR9gTkUXX9tBbQqIjwP5qfbSnKVd6Bo+Y8XOZRxQ==
X-Received: by 2002:a17:902:f605:b0:234:d7b2:2aab with SMTP id d9443c01a7336-23641abc3c0mr84979595ad.14.1749704648947;
        Wed, 11 Jun 2025 22:04:08 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:68c8:ceca:d8e4:322c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e6f9878sm4753525ad.151.2025.06.11.22.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 22:04:08 -0700 (PDT)
Date: Thu, 12 Jun 2025 14:04:03 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2] wifi: ath11k: mark reset srng lists as uninitialized
Message-ID: <rxaibpgtf37w3th5lnt3w574w443yononqjoglyfktlcxe26qg@jpmtkckrotzp>
References: <20250529035708.3136232-1-senozhatsky@chromium.org>
 <5857380e-ced9-4118-b9a0-ce926b25c11c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5857380e-ced9-4118-b9a0-ce926b25c11c@quicinc.com>

On (25/06/12 11:30), Baochen Qiang wrote:
> On 5/29/2025 11:56 AM, Sergey Senozhatsky wrote:
> > ath11k_hal_srng_deinit() frees rdp and wrp which are used
> > by srng lists.  Mark srng lists as not-initialized.  This
> > makes sense, for instance, when device fails to resume
> > and the driver calls ath11k_hal_srng_deinit() from
> > ath11k_core_reconfigure_on_crash().
> 
> Did you see any issue without your change?

We do see some issues, yes, on LTS kernels.

[..]
> > diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
> > index 8cb1505a5a0c..cab11a35f911 100644
> > --- a/drivers/net/wireless/ath/ath11k/hal.c
> > +++ b/drivers/net/wireless/ath/ath11k/hal.c
> > @@ -1346,6 +1346,10 @@ EXPORT_SYMBOL(ath11k_hal_srng_init);
> >  void ath11k_hal_srng_deinit(struct ath11k_base *ab)
> >  {
> >  	struct ath11k_hal *hal = &ab->hal;
> > +	int i;
> > +
> > +	for (i = 0; i < HAL_SRNG_RING_ID_MAX; i++)
> > +		ab->hal.srng_list[i].initialized = 0;
> 
> With this flag reset, srng stats would not be dumped in ath11k_hal_dump_srng_stats().

I think un-initialized lists should not be dumped.

ath11k_hal_srng_deinit() releases wrp.vaddr and rdp.vaddr, which are
accessed, as far as I understand it, in ath11k_hal_dump_srng_stats()
as *srng->u.src_ring.tp_addr and *srng->u.dst_ring.hp_addr, presumably,
causing things like:

<1>[173154.396775] BUG: unable to handle page fault for address: ffffb4e4c046f010
<1>[173154.396778] #PF: supervisor read access in kernel mode
<1>[173154.396781] #PF: error_code(0x0000) - not-present page
<4>[173154.396824] RIP: 0010:ath11k_hal_dump_srng_stats+0x2b4/0x3b0 [ath11k]
<4>[173154.396839] Code: 88 c0 44 89 f2 89 c1 e8 3a 14 06 00 41 be e8 25 00 00 eb 6e 42 0f b6 84 33 78 ff ff ff 89 45 d0 46 8b 7c 33 d8 4a 8b 44 33 e0 <44> 8b 20 46 8b 6c 33 e8 42 8b 04 33 48 89 45 c8 48 8b 3d 45 a3 a0
<4>[173154.396842] RSP: 0018:ffffb4e4dceefc50 EFLAGS: 00010246
<4>[173154.396846] RAX: ffffb4e4c046f010 RBX: ffff90d1c3040000 RCX: a0009634a5d28c00
<4>[173154.396849] RDX: ffffffffb0279d80 RSI: ffffffffb0279d80 RDI: ffff90d2e5d17488
<4>[173154.396851] RBP: ffffb4e4dceefc90 R08: ffffffffb0249d80 R09: 0000000000003b82
<4>[173154.396854] R10: 0000000000000004 R11: 00000000ffffffea R12: ffff90d1c3041c90
<4>[173154.396856] R13: ffff90d1c3040000 R14: 0000000000002828 R15: 0000000000000000
<4>[173154.396859] FS: 0000000000000000(0000) GS:ffff90d2e5d00000(0000) knlGS:0000000000000000
<4>[173154.396862] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[173154.396865] CR2: ffffb4e4c046f010 CR3: 000000005ca24000 CR4: 0000000000750ee0
<4>[173154.396868] PKRU: 55555554
<4>[173154.396870] Call Trace:
<4>[173154.396874] <TASK>
<4>[173154.396883] ? __die_body+0xae/0xb0
<4>[173154.396890] ? page_fault_oops+0x381/0x3e0
<4>[173154.396896] ? exc_page_fault+0x69/0xa0
<4>[173154.396901] ? asm_exc_page_fault+0x22/0x30
<4>[173154.396908] ? ath11k_hal_dump_srng_stats+0x2b4/0x3b0 [ath11k (HASH:3de7 4)]
<4>[173154.396923] ath11k_qmi_driver_event_work+0xbd/0x1050 [ath11k (HASH:3de7 4)]
<4>[173154.396942] worker_thread+0x390/0x960
<4>[173154.396949] kthread+0x149/0x170
