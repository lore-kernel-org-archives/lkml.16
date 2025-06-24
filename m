Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E524224882
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750758521; cv=none; b=dqUl2NTkyb1kKDqB3z8T50QxMKnylOibFg4AMxUIGyv3v1eB5ZwgNx8z3WaQboiAsBxX1T0d6fJGiYnF4yteR2Qiy3fO3okSKjY6EtfokHfjMnKC1UaR9oBaa8BmkjMfVqK9pkyxbDB1yMV6nqB2Fbj/RRvYLZyoeFpimibpD3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750758521; c=relaxed/simple;
	bh=23TpECU5tynvP7T6iEGzG6aLrvVV7gzw9uy4LUoxbys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nl/fOw5s+BE8Dz1KunkKTo1FpR7CIjQhpSTJK+yMDqA1Q95EV0LbB/BJFzxf85QsmDOZbgZMRBrHFaOXu4JbhFG/kVQmmF5Add6tZ+EgIRzoFm1G81uzRXiyee4LhpE3h7t7P+cdUU5pdfX5mgqYfiT/trSruZFI9mQl1viS4PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EQ//Kgz5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EQ//Kgz5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750758519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O+s/38bmfrKUgR691mJEWuNgTDqg+4vEShmznsL1cQE=;
	b=EQ//Kgz5pQm0oTKlbJ9ZHb1BT/9z9IrjM2l4WYaiS5X3/YE8BCj4XGBiTKM415zjmR76yv
	HaErHPolZA96NXal72RUcAIPj6QDosPvSI9+BPutU3D7sVwk2MKrKEtsiCWkHCtBVgZJB4
	LkgZt/E2bIJO0hQrIOQlEz6po1q0RrU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-Gw1RgEOjPziWIQh7GFypsQ-1; Tue, 24 Jun 2025 05:48:35 -0400
X-MC-Unique: Gw1RgEOjPziWIQh7GFypsQ-1
X-Mimecast-MFC-AGG-ID: Gw1RgEOjPziWIQh7GFypsQ_1750758514
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a6d90929d6so1013787f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:48:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750758514; x=1751363314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O+s/38bmfrKUgR691mJEWuNgTDqg+4vEShmznsL1cQE=;
        b=EL5C0iwV24tsmNHVZ+ccZ5qQrBoIFG/3aJHffcGsGFQe9FvByRyds5ZfnAuGX0fDh0
         ugwS+h95fdX0+8A2yBftZtdxiSfJJogxs9zNnY+YHPAKNZCJNUob6qMWdf2C4wSzRc4/
         en1uvHB3jjbo93em3Xm0yM5/3dohXKpOarohoKu5pVJNfwO3EOV3wBYgZ2N13nJf4r6s
         14bJcaqygKYW75rzpLhCu9Ndt+TNTqGiGmMV6vWM5TZabglWh1M4aDYQjhOqxGsXL0A7
         hTMIAy3rInFpEwkJVFZxsHQdYUh82W1PZlmjKamK3iN5UlwZZDNQpe7oCSE4gPxeQ7/6
         YA6g==
X-Forwarded-Encrypted: i=1; AJvYcCU/BuK2I5qf2/NIsPUqAjZQlmfX654w1HYf5DqX6Gul4hn+mchbIG02/ecCWf1CjSxVGpBvgkEYfCVldd4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkGIZuAqEvrn5XK3nIXCpJork7gHEQdYCBui1P936sqAwDnC7p
	tU2DrL87aBvYNxolfsgXmMfjeeRnSrRQmLXU5IYTnEkXb45fQIA0bQK3EYc//+Zz3Rin/7z2jJL
	wCxpY3toZUjyLNI4wuNroZWNlAq8Br4EevEYMxit8SUzIK15eyLJbi7ccWhc1o6Zsag==
X-Gm-Gg: ASbGncvy0A7WXJJkrA572j06/0Eo1pz+JdE0cTK8vPvsCVi7aRG6zonDOCAdGEbiUYP
	iF6/BNIZ5PopKtj9lqVkHe7I3MBFZRtjrQq58WzOdbJd4gK7lAc+ouWDM15TCA44OZV37nWuq00
	PwMKknoQmUXtnj+EoXm9EluzKhPZEFjloV5tHk0l9aUOliAuWKDcb1RndD1EZgXG7OWMe1a5cRE
	nxD3ILqGFcPIHFjVci9I5ireJch2zCUnjasPGGoarW4FmbGJt4UpqMLz0aOWcv0R5DZ2NKLNuBx
	i0S1t+E9euHmOtbG/6tdUfKLWswpSA==
X-Received: by 2002:a05:6000:178f:b0:3a5:3a3b:6a3a with SMTP id ffacd0b85a97d-3a6d1319045mr14327740f8f.54.1750758513863;
        Tue, 24 Jun 2025 02:48:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGc4+gXT6eeJIpAuc/btHMsFkS2IAKmVrYVCuTgdqHkkmTRT4msNaypU5mlZaABoATTTkh/IQ==
X-Received: by 2002:a05:6000:178f:b0:3a5:3a3b:6a3a with SMTP id ffacd0b85a97d-3a6d1319045mr14327718f8f.54.1750758513473;
        Tue, 24 Jun 2025 02:48:33 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2445:d510::f39? ([2a0d:3344:2445:d510::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f22e2sm1524751f8f.55.2025.06.24.02.48.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 02:48:32 -0700 (PDT)
Message-ID: <287fc833-a643-40d3-b663-72446e1344f5@redhat.com>
Date: Tue, 24 Jun 2025 11:48:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 13/13] ptp: Convert ptp_open/read() to __free()
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org
References: <20250620130144.351492917@linutronix.de>
 <20250620131944.533741574@linutronix.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250620131944.533741574@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/20/25 3:24 PM, Thomas Gleixner wrote:
>  	scoped_guard(spinlock_irq, &queue->lock) {
> -		size_t qcnt = queue_cnt(queue);
> -
> -		if (cnt > qcnt)
> -			cnt = qcnt;
> +		size_t qcnt = min((size_t)queue_cnt(queue), cnt / sizeof(*event));
>  
> -		for (size_t i = 0; i < cnt; i++) {
> +		for (size_t i = 0; i < qcnt; i++) {
>  			event[i] = queue->buf[queue->head];
>  			/* Paired with READ_ONCE() in queue_cnt() */
>  			WRITE_ONCE(queue->head, (queue->head + 1) % PTP_MAX_TIMESTAMPS);
>  		}
>  	}
>  
> -	cnt = cnt * sizeof(struct ptp_extts_event);
> -
> -	result = cnt;
> -	if (copy_to_user(buf, event, cnt)) {
> -		result = -EFAULT;
> -		goto free_event;
> -	}
> -
> -free_event:
> -	kfree(event);
> -exit:
> -	return result;
> +	return copy_to_user(buf, event, cnt) ? -EFAULT : cnt;
>  }

I'm likely low on coffee, but it looks like the above code is now
returning the original amount of provided events, while the existing
code returns the value bounded to the number of queue events.

Cheers,

Paolo

	



