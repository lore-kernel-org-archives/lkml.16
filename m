Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F529279DBE
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750756961; cv=none; b=CihwU2XRvXf/gzQiyNq85ihaefictbTRp/WP5lGf9Zktf3zwEK77owedsVjLBywc+8nBqjZY3r603CEojrg409b7qlptADpFepsLJwMvQ2z5s6z/y9pJrGU0FVD/wSAKbpfackoK6mcchJw0y9OZt6iRpG+mnoD859rrd+UIJx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750756961; c=relaxed/simple;
	bh=Ukpq1jm45aKlAkIiV9+KqhS/HWscWUWDsBXAj4p/usI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k3hlYFS4HenDHZYU43Ihv5rbR015T/IgyVGzphC+qjN1ghVMROdXv9c9XLeQdCjO7ZjNh7FnW5WR/OlIHYIW7qC4jnC9mAOxpOktjH69h90IT0N3uwfdeGhgrEWDL34Aa8skxREupBzyWJIR/8Nc/Dnc4q3Yca6YPGGDQJoJ2G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YJH3iY9d; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YJH3iY9d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750756957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6i5R+n/vxWexSFBa34cQSzNcknWdUpndgD8c+k05TSM=;
	b=YJH3iY9dCKwFTh9ZDVv178HPgWEgRYAbHWsF2PF26YrQ77g/d9KJQV/WcGX2BqwRiyBzRA
	zOI3f8dPs4h38/UUe1wwfk7EopjRg+br6b0hjW1pFCHxkfQwyg+pkk0zior3gO5KStwdUF
	Ad+Mj0iS3EtEcL7mzvaJ8rhFrUedTgo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-119-spJ39d8ZPNGzgI5EnfYBxQ-1; Tue, 24 Jun 2025 05:22:35 -0400
X-MC-Unique: spJ39d8ZPNGzgI5EnfYBxQ-1
X-Mimecast-MFC-AGG-ID: spJ39d8ZPNGzgI5EnfYBxQ_1750756955
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d290d542so1480315e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:22:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750756954; x=1751361754;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6i5R+n/vxWexSFBa34cQSzNcknWdUpndgD8c+k05TSM=;
        b=iZBQVmSGg9Kp+C+c7djPwNJX8IVOh0z2WIqIkK9mm4+Kwheac3j+Mz6+i830+YMiFw
         /cRruKY93YkFloKoeuoYl7t5H0CaklNepSo6lnIr7dDVR8jHlWxTQPUW84DUNh3dzKJJ
         HXW7ERhOSy+uu3hSisMz6Xev/9rtdmWRXj0WdnWv0xZEnZltwvxTdYKuSMnvp8Tm/D9V
         9upflrjUBimyr+uKgy1dlP+jWDQPDVigEL15nzQQrKV5sXVUKjTfK9OuJiJeglupxEXB
         VDO5zpCR1DX1LOZV6t7K1RNVFgL2VdhcyXOXwcvlpR/EyGnrelzG2rL4uqDWdAOj85nm
         K4Ng==
X-Forwarded-Encrypted: i=1; AJvYcCUE/UdqUcfZu2ZkZEr/9QFJevIEwkOoLf6KbbnsBJ2NOcfoIYGquTGw2pjhvj38UGfaJXmmJMsxLxhLivo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL7WR75yk/mXaxLRX7nnCmDZGjo0RqoN0e229ZD1cc68xawsHg
	knNz6dY1Y1WzMuSyeg6HYaEBCPROfuuOB5HRE8JT78WwIlNcPL8T0HvdSERzExhyOE8nNdAykXI
	7ea0Bse6TQ1DHJhEnGOKTdjVi9idED4vOYm9ARbiLl676djuc8cc8J6QJZ9mdlNLFGg==
X-Gm-Gg: ASbGncvkhrwQWcj/aHK0hOi4pHQ5m/HhNclYoSV92h5q8sxJE1i/PeIawNEmcMnYr3X
	GK44wUrQOSuALVGE4ZDdvCxf38Y8x5KSVzq9CiFDoRht3fXjyOzFNOpWLnyHKT1fraPXOLRPXmn
	uRSacZFVDPuE863VwsVFWgY/eR3VaJkgH8Bqvy9+Fkk+89y8WNFJwLEjlGseMItgW2AgOxAD/UX
	D8mg+Ebnl9Ar6EndZldiEDd13bNGysoFNjnrNt+8eY6YfBgjeu8N5ibywdDxou/BLIQbE+9DRF7
	8q+T5OQTZ4wZ6lTOhFbQxNBZ0ZgiGg==
X-Received: by 2002:a05:600c:358a:b0:442:d9fc:7de with SMTP id 5b1f17b1804b1-453662c4ce5mr114324645e9.22.1750756954551;
        Tue, 24 Jun 2025 02:22:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDjlhoN4Ydt23k3YEBasRRqSzsYV7t/7wCcPkWzugVKQL+QOzhD83UOYUchZtB5g1nQg8jnQ==
X-Received: by 2002:a05:600c:358a:b0:442:d9fc:7de with SMTP id 5b1f17b1804b1-453662c4ce5mr114324445e9.22.1750756954162;
        Tue, 24 Jun 2025 02:22:34 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2445:d510::f39? ([2a0d:3344:2445:d510::f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453647082a2sm136692175e9.37.2025.06.24.02.22.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 02:22:33 -0700 (PDT)
Message-ID: <caef5686-961d-43aa-8141-c9c90ada2307@redhat.com>
Date: Tue, 24 Jun 2025 11:22:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 08/13] ptp: Split out PTP_PIN_GETFUNC ioctl code
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org
References: <20250620130144.351492917@linutronix.de>
 <20250620131944.218487429@linutronix.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250620131944.218487429@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/20/25 3:24 PM, Thomas Gleixner wrote:
> Continue the ptp_ioctl() cleanup by splitting out the PTP_PIN_GETFUNC ioctl
> code into a helper function. Convert to lock guard while at it.
> 
> No functional change intended.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>  drivers/ptp/ptp_chardev.c |   52 ++++++++++++++++++++--------------------------
>  1 file changed, 23 insertions(+), 29 deletions(-)
> 
> --- a/drivers/ptp/ptp_chardev.c
> +++ b/drivers/ptp/ptp_chardev.c
> @@ -396,6 +396,28 @@ static long ptp_sys_offset(struct ptp_cl
>  	return copy_to_user(arg, sysoff, sizeof(*sysoff)) ? -EFAULT : 0;
>  }
>  
> +static long ptp_pin_getfunc(struct ptp_clock *ptp, unsigned int cmd, void __user *arg)
> +{
> +	struct ptp_clock_info *ops = ptp->info;
> +	struct ptp_pin_desc pd;
> +
> +	if (copy_from_user(&pd, arg, sizeof(pd)))
> +		return -EFAULT;
> +
> +	if (cmd == PTP_PIN_GETFUNC2 && !mem_is_zero(pd.rsv, sizeof(pd.rsv)))
> +		return -EINVAL;
> +	else
> +		memset(pd.rsv, 0, sizeof(pd.rsv));

Minor nit: I personally find the 'else' statement after return
counter-intuitive and dropping it would save an additional LoC.

Thanks,

Paolo

