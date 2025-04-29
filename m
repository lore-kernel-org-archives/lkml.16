Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B4B2D3211
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745927076; cv=none; b=Ofwo/AXWRhB6nokFIojxXIy86v0+W6U3kS0+YCEUQ+cVbyYZAuVhDtFnQZH5kVypjLoqJsQ0m5yXoQwBg1vOOltZClEbqgSHZ936Re1Hi/2yJB0S0uFzLEgVrknFVXgfC+bOw6/N5O1GyZu9qMjBreElHxPjIpP13EoNneA5gII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745927076; c=relaxed/simple;
	bh=4vcRTEE1p4gHLVkWgtf0fYhZp+LO0lNCHFeQzHhFmk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vb6KVbXHEwzXGXLN9x8Lhb/t/mg8qQq21hHBZDIxwyiiKdjSEm9SZILv6rh1/d2KSmUvvmCG+0hxoJTe2IozrBM3ssKrgUvWwdwwRRdHHQYPAs4OskHofLXIljEEqgi2y0dhRbtdAnVNiaqsiDu6pFhmyi8E+UwsqdKjk2KuGNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=kXP45FYg; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="kXP45FYg"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b1a1930a922so3106125a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 04:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1745927074; x=1746531874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yzJHSP3MS0syJfOa/96YV4wvogpjUA3oAjisshOP/+Y=;
        b=kXP45FYgSt3zfwvFt/ln0igXoDO18HD6sno0F5xmrv/GhqPimsAVErVgvxNJI8mFh0
         kbcuRWnx79XBZIr+02xBOJVI2mKcp10Fu0n+WGK6Ym2lsQCv/F/UEUivl7scsrnXRoTB
         db/3FDapQBUJkgRd8dG05RSMX5n3CusWPf6mbv1PQB+BNsL8djm79snWTREAl/Hgn2CA
         76+xSYBB3G/7wfGzlkP6UbvRLGo/PEGyD1+ppByMoWd3dbjPwarNE/4CgMq8Vvwim0L7
         9+gO6UaOAc+Gm+mRZuu/J1p3GRyeTD3+ucxMFaB0XKPeFAn1j2AdZ2Zkw66ajDOcVj7e
         9VpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745927074; x=1746531874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzJHSP3MS0syJfOa/96YV4wvogpjUA3oAjisshOP/+Y=;
        b=bo2wqBhdpQFX9ZdxFDkK8aXK5zdBqFDoINnkvK3ZFamQSYODi1UArKtYOTfQE53f4g
         vJD9Zrbno7mzuRLoZvHbmbPoJM3mWmKThF5vQi2kpJ5cW6HULW2Llt2WeMCMhW2ZNXtF
         /SnLat2PpJT3Zk6o5hKMJzB+VpNXfWWo+TTihDmw/x/sBe1PcmPIoeeY7LcIPLXdNS23
         R9+G5nHDzLgvO/q3/u8cxFDpEsgz69x1fO9C9PC0HLOYC9LBPo1+YPS49FWijaltUFIN
         xvOVSU1RTGUw7sRGCehoQMiEt0fIxSm/iIx5MTL42FMo7TE8fHowwcb8q/tGayLXr/8m
         NI3w==
X-Forwarded-Encrypted: i=1; AJvYcCV4xQOh5FoZv7NliDWYgU2blJw8vjEhSmEfHmj6i/NlaINPc7MlI/W/S7QniiaiaxFbprZrzAwmB9x0HPw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGEqQtAGZ0yC0WQazgHSKSzOItOhRUR7md1RrnWhTTpqhOXdXp
	MxMLsVndfDBca86sUFe0Wt8/ouNAFRXBHs4Pq86sumF3+4xwxsDYJKcQErTXv1ZBenBuXfGjx+U
	=
X-Gm-Gg: ASbGncvZNmh1LCcFwCKo/7ykNTCAeoDwCWLo8Pr/Efg1r6nLRfvV4ley6ZjetQfuiug
	GysxlYb3+V8OGVDjw2ZZKmrYd9+W68foEofsciAqOrkDr78+M2sXaviHuXWO3Zvc4XWJnVYGn86
	1Zr9Q1XoELXyJlW4KIJ/H2mBln/vrpjVjxtGdLi4LKv24EF3DzDwCU0C2M5zQUFrijqwQWw0+UN
	IWSzqN2zXh0FGrnyFRO/50fhdBty5FGBUBB7/uIohU76B8czhkg9Mx4xii22O/JeaFOukLd2OMM
	k14+N7Nft3NpKUE1QeErp2F533efw5HDJ1lV48/v
X-Google-Smtp-Source: AGHT+IEYgwsVKsbtIYVQP9gwgDywBl/zdKA1+1Yjlt44G10TJc3OlBVSAXYAq91oHtaPyzunvUH2RQ==
X-Received: by 2002:a05:6a20:9f8d:b0:1f5:591b:4f73 with SMTP id adf61e73a8af0-2095cec6f1fmr4302271637.34.1745927073977;
        Tue, 29 Apr 2025 04:44:33 -0700 (PDT)
Received: from bytedance ([115.190.40.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25912ad3sm9981561b3a.13.2025.04.29.04.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 04:44:33 -0700 (PDT)
Date: Tue, 29 Apr 2025 19:44:28 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Kexin Wei <ys.weikexin@h3c.com>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [External] Re: [PATCH] block: remove test of io priority level
Message-ID: <20250429114428.GB3896701@bytedance>
References: <20250429082934.GA3896701@bytedance>
 <adca39d3-04fc-45f5-8e34-0d06714f0ff9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adca39d3-04fc-45f5-8e34-0d06714f0ff9@kernel.org>

On Tue, Apr 29, 2025 at 07:50:11PM +0900, Damien Le Moal wrote:
> On 4/29/25 17:29, Aaron Lu wrote:
> > Ever since commit eca2040972b4("scsi: block: ioprio: Clean up interface
> > definition"), the io priority level is masked and can no longer be larger
> > than IOPRIO_NR_LEVELS so remove this now useless test.
> > 
> > The actual test of io prio level is done in ioprio_value() where any
> > invalid input of class/level/hint will result in an invalid class being
> > passed to the syscall, this is introduced in commit 01584c1e2337("scsi: 
> > block: Improve ioprio value validity checks").
> > 
> > Reported-by: Kexin Wei <ys.weikexin@h3c.com>
> > Cc: Damien Le Moal <dlemoal@kernel.org>
> > Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
> > ---
> > Kexin reported a LTP/ioprio_set03 case failure, where the test would
> > pass IOPRIO_CLASS_BE with priority level 8 and see if kernel would
> > return error. Turned out she is using an old kernel header where the
> > change introduced in commit 01584c1e2337("scsi: block: Improve ioprio
> > value validity checks") isn't available. During troubleshooting, I find
> > this priority level test confusing and misleading so I think it should
> > be removed.
> 
> What is confusing and misleading about the fact that we support only 8 priority
> levels (0 to 7) and should check for it ?

I meant when I'm troubleshooting this LTP issue, I looked at this level
test and had no idea why it didn't work.

> With that said, the test is indeed redundant for the BE and RT class because we
> have:
> 
> int ioprio_check_cap(int ioprio)
> {
> 	int class = IOPRIO_PRIO_CLASS(ioprio);
> 	int level = IOPRIO_PRIO_LEVEL(ioprio);
> 
> And the macro IOPRIO_PRIO_LEVEL() will mask the level value to something between
> 0 and 7, always. So necessarily, level will always be lower than
> IOPRIO_NR_LEVELS. So please reword your commit message to explain that rather
> than describe what a user may or may not use when setting an ioprio field.

No problem. Does something below look OK to you?

"
Ever since commit eca2040972b4("scsi: block: ioprio: Clean up interface
definition"), the macro IOPRIO_PRIO_LEVEL() will mask the level value to
something between 0 and 7 so necessarily, level will always be lower than
IOPRIO_NR_LEVELS.

Remove this obsolete check.
"

> And also simplify the patch:
> 
> diff --git a/block/ioprio.c b/block/ioprio.c
> index 73301a261429..f0ee2798539c 100644
> --- a/block/ioprio.c
> +++ b/block/ioprio.c
> @@ -46,12 +46,8 @@ int ioprio_check_cap(int ioprio)
>                          */
>                         if (!capable(CAP_SYS_ADMIN) && !capable(CAP_SYS_NICE))
>                                 return -EPERM;
> -                       fallthrough;
> -                       /* rt has prio field too */
> -               case IOPRIO_CLASS_BE:
> -                       if (level >= IOPRIO_NR_LEVELS)
> -                               return -EINVAL;
>                         break;
> +               case IOPRIO_CLASS_BE:
>                 case IOPRIO_CLASS_IDLE:
>                         break;
>                 case IOPRIO_CLASS_NONE:
> 
>

Will do.

Thanks,
Aaron

> >  block/ioprio.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> > 
> > diff --git a/block/ioprio.c b/block/ioprio.c
> > index 73301a261429f..60364d3faf800 100644
> > --- a/block/ioprio.c
> > +++ b/block/ioprio.c
> > @@ -46,11 +46,8 @@ int ioprio_check_cap(int ioprio)
> >  			 */
> >  			if (!capable(CAP_SYS_ADMIN) && !capable(CAP_SYS_NICE))
> >  				return -EPERM;
> > -			fallthrough;
> > -			/* rt has prio field too */
> > +			break;
> >  		case IOPRIO_CLASS_BE:
> > -			if (level >= IOPRIO_NR_LEVELS)
> > -				return -EINVAL;
> >  			break;
> >  		case IOPRIO_CLASS_IDLE:
> >  			break;
