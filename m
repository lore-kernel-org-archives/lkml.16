Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1C8189BB3
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 18:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738781130; cv=none; b=oHV9RNJtJKVlCfWY+l7MeearoErktpaiuzWPqwTJ34zAm+CAc6cXafW1Dcko68k0VoNLVLhb2ZIbQF7Vo3SdJHiR9qxsuBH9AXO96L1gF4udPHUIl+/UzOso8OxGaV67OZM9GvNkjAA0ka10PjSbfqimOadBbse3Xk1HFB101U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738781130; c=relaxed/simple;
	bh=mx7W3Eh4QvKtUBLSiT/4VmvO1/iLZDwSr+NLnQ+cD9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=LkIFD9Fz7Bip4dRL220cLxI7n0okpGsg6+46oqmD2/o1dE1Dz8sbHp4nV6r4ajNcw7YLTlY/PEzXQHn1OGv0IrJvUe0KpbPC3HhCjV/b0pcA567TuAmsYcFAlo98NYn4cXJbMpRFRw1NZ9Keqf9aEA4WPVacZokN60g8vegSttk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=WQx+5U/N; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="WQx+5U/N"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3d03ac846a7so137565ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 10:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1738781126; x=1739385926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s4PsJJZ4IZmY21NLAFj3oN3i3BEG9tWiG+e1PKPQRmE=;
        b=WQx+5U/Nyto2z+Fy5jnU5WmqMs0hTSBeF1KZtMS4SVMOE+1inbX/h/qe9amGmIm9Xq
         7kcS9MeduSDK8hE6r8rKQCya0jjoLw4/7UdEQmD1MT35glSS653hHJO9WnQFw8Qioqj3
         J9aCb2ajy3D8Ifv0VX+yobwdSI1gVuETm+17hQEbcF53gA6sRYKVwroMpv+7Jh+BXNmS
         T4X1qHqsZU8W04fK8Xe7zEs9kb5kWWa0J+jYXdOmEj0Ed/s2Jgp0wn2BDg0uZ+z+RVD+
         pNW4wp/KQr1kEjIpnADn/Qd44/Gm38aaOjyADxtw6ur+x615vpmAR3QB3q7jp79jgXbm
         9oDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738781126; x=1739385926;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s4PsJJZ4IZmY21NLAFj3oN3i3BEG9tWiG+e1PKPQRmE=;
        b=MMA1taMO7KzTF53Wwg7N/fj+a4bLXic1cvqKYwLyXJw2K01/Xqbk+uTIc4Dif2fA6Y
         kBN1oo+CsOyE0p53/TnHFdgnSEHTOHtmnQDG4eRw+SYhZNrWkg6TtEGUHU88OIHbrgUk
         7G6sUUvEd3cLuzKpKQOCXpK1xjuSYwbcoksf4EGVD/8eJfXVdw0LrxnLU8d/cYN9SkiL
         f2XJNWWFZ7OgpItubmBBxhYAVfDQMF5XHye71JaZxWLIe5dqPH8Av8GOFiHYDZdGYoNf
         VIVqBNDSLv3HdXgm+HFY0Tf20+77Yh7faHWWMEMhwPcv86HOYvHFBLt2TU5HAHQtKC6q
         Fp4w==
X-Forwarded-Encrypted: i=1; AJvYcCXzt3Q6YO45QteyJN/1CQ+dlsyOoAOKS9gZ6U21/LtFgSTlI2ESncpVcNuzjRXjiUjMZc7HRqdiT1J6ams=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZgn8vlhca89cunefizM1pzvBIPqKmRuHw3SlLBYngiEYUKFcU
	tC9OD7zempY9mZz9ylVxYpuYQU8IM1lDgNKykvCEMTIpM3DX25HCeCoqvQL7Wpw=
X-Gm-Gg: ASbGnctmVEgQrxbMiaEt8cBVnZIG7igikW3Lvx5mfMbiyJBUzT6niObQeGh2PzoVFZ+
	puK/VIMWPsU3xtsNYmoCsIwitgJqf4uFe+kBVIDGHT+YzIMSXJO4ma187wKVbQv5gdiAxoCEOde
	7hmVoF+4aES1GR9hf012qvNKnlTCzUwUE+iZ0G0RLjMLQz6Q7cTsLf1Zo9wNaZvmohNxOeyK4hi
	sqKwy7TBrVzLa7zBjTr9ycw2U84U3N4CiQ6hxJ6fTSppkCEHmXWCfSQ5pRRXXENagh9YGL9o/VX
	mb2tzr6Cvoc=
X-Google-Smtp-Source: AGHT+IEv4D0EXesOy2KXf6peR78fA+ZoVihX6c9sA5VRODgg/4D76XYo58u681gXGutwixDhi4Hz2Q==
X-Received: by 2002:a05:6e02:2688:b0:3d0:2b88:116c with SMTP id e9e14a558f8ab-3d04f45aff3mr35526325ab.10.1738781126462;
        Wed, 05 Feb 2025 10:45:26 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec745b4ffcsm3359682173.47.2025.02.05.10.45.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 10:45:25 -0800 (PST)
Message-ID: <35d4b9be-3d08-4eaa-8750-7b34ec6e6064@kernel.dk>
Date: Wed, 5 Feb 2025 11:45:24 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/12] io_uring: Use helper function
 hrtimer_update_function()
To: Nam Cao <namcao@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
References: <cover.1738746927.git.namcao@linutronix.de>
 <9b33f490fb1d207d3918ef5e116dc3412ae35c1e.1738746927.git.namcao@linutronix.de>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <9b33f490fb1d207d3918ef5e116dc3412ae35c1e.1738746927.git.namcao@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/5/25 3:55 AM, Nam Cao wrote:
> The field 'function' of struct hrtimer should not be changed directly, as
> the write is lockless and a concurrent timer expiry might end up using the
> wrong function pointer.
> 
> Switch to use hrtimer_update_function() which also performs runtime checks
> that it is safe to modify the callback.
> 
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> Cc: Jens Axboe <axboe@kernel.dk>
> ---
>  io_uring/io_uring.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
> index ceacf6230e34..936f8b4106cf 100644
> --- a/io_uring/io_uring.c
> +++ b/io_uring/io_uring.c
> @@ -2421,7 +2421,7 @@ static enum hrtimer_restart io_cqring_min_timer_wakeup(struct hrtimer *timer)
>  			goto out_wake;
>  	}
>  
> -	iowq->t.function = io_cqring_timer_wakeup;
> +	hrtimer_update_function(&iowq->t, io_cqring_timer_wakeup);
>  	hrtimer_set_expires(timer, iowq->timeout);
>  	return HRTIMER_RESTART;
>  out_wake:

The timer is known expired here, it's inside the callback. Is this
really necessary or useful?

-- 
Jens Axboe

