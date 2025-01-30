Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999C814A099
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 21:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738272909; cv=none; b=Wo9tfgxOU/cx9tBqh8IFLgXJBoxr3rUbaatDju/E8DGvR4kusl/twLxP9+tu2HpBPVauljeUu+ektMHO5ol+BWnOnMagg3/GMH+3o57Gyfg4uWmL5SLubfitigHj0hcNjv/RJYlMGMMFfm0KXt6s4yS4VzUEcswRhAvo/dmXDxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738272909; c=relaxed/simple;
	bh=BC1KfROBLDnPToXKqgthdVv82cvdrNStv3/J/JxrgGg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YVYU7wfeVjBRfLXQhaRh5n0+DDtcDBVfchKLZVcCXsY5359cJPGifRwruTcO5CrMkvehU3ST6InINN9mGLu4haOkLbTD82IO7UZDDKZg/TVpskmm8VkhjNsZxFoyk/IYPOwnwqX0bvtkt+qGGScwa6nUDnMSxoIITA+NEaErCfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WSJbeFMH; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WSJbeFMH"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361f796586so14767245e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 13:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738272906; x=1738877706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rEMYcSSn+YjMiKX35dVd3WXjXJTXr2hti4Ywwh63NGc=;
        b=WSJbeFMHoN37P3BwmijSm5uP4KAKi1P/eHAnu5l6KihDBfshUzRUEd33wbM52UZ5CQ
         SO4gj5ckIgRlPPnpllFRtZaGhWhyauX2+jXnnB+gpgZhTl1WKSS7F462q/Ry0LlSl/56
         bL+1od0z6TWz56MQCC+Nys+26rqgwGv8mr3H4EyGh18L5018Y61pX2w7NaLEi+aT4DwH
         Q9RDYcX3Lz2juvbNL1PqxFlnEyxMgOViUE96KPa+ta2L5vIgCQdvQV7GykNfcenh1MQp
         ZXaM+xqYs1sXUBEeggH+3o8ECkDzpMMJH4kq6uo8e9EPpFhH2Pu08siCu4owAj+ibq5z
         Kgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738272906; x=1738877706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rEMYcSSn+YjMiKX35dVd3WXjXJTXr2hti4Ywwh63NGc=;
        b=urnY0Xm5Mf3J2x5+KQWSnRu+qA/FIPdZU94+vg5tHG+FwZHn4Ea4q2+RIF8AlJbCkl
         kd7Eq3Oqs6DUuLwQt28OJKi0mohtWzla7+GBCEcyaubA7Q1eMAYb+VSmrYpKhAizsNyB
         Yr/ACs7RC66NRxn7LMiw2Z8als0EvMu/0jvWElZrUFZ0rEyLujTHhmL9iUzqj3RJe8pg
         U47zWfUJdgTENQyO7HfpRVhtptgB/Z/g6XSBKSzn4BRspteagTpHJzQMPj6tp9sk8Adz
         40NST+k8SVkAEKkGgbtN9IeLuC6FDKukujbUL7UCbffOZE/WywkaIB0ph0UTlT2uMMiJ
         m86g==
X-Forwarded-Encrypted: i=1; AJvYcCUx/2OEJVoAFbR3gW8rK7EbTlykEi8xEe7rBTvs7oXND8Lc8ldAbkYe1P3k9iqBsVp7VC1FAzivJN2PC4Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YztqEp0ZJjsgLy5jbPiwuM5YOiGLlU5M3FB2zsZZv4d3sZqhYbq
	F8zLoeRuPt5J7BZMiPMRsJ0QjULMSQOELHh8VDZPm7mZs8TmTDOzeariDQ==
X-Gm-Gg: ASbGnctv8uPy5ZKYYX1EgtqShzguxj5bP58BRw9UCVVzXRA6ZjrCx9icW8kjDa2y8rA
	zSLSvLVXegf7sbROKRRBl56o3QGiE19/mBuNq5FUir2ZPaQMhBDRPlsJS1QNe3BN/pa9vJn1gTD
	C9tk4fVHMzpDh2+9BXXNATkBOk8z9IvMoY59RV4yrdM2UVp+7mKaZ4t5wc7anDqJxujNH5FNzEc
	DW+OAjBZlYYGVPQKUFOobasf3SBgBtt1q1YMkEwlnGy1IGjSBgCTUXUiLSk1RVxUKCNJAwELxc1
	YuBMzPtdesgVu5oZaemD0IdDAMkMGv+olI3pS1yd5/OAGgM1iIqttg==
X-Google-Smtp-Source: AGHT+IHtGbBGp2suP1Bkv9M0iWU6qrr+nPl9rL6lFNGYg9zlX2COF0tarb8/7dEeW4qNmjIjx6s7Tg==
X-Received: by 2002:a5d:688b:0:b0:38b:ed18:3979 with SMTP id ffacd0b85a97d-38c5196ae46mr6539341f8f.31.1738272905626;
        Thu, 30 Jan 2025 13:35:05 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc2ede0sm70986595e9.21.2025.01.30.13.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 13:35:05 -0800 (PST)
Date: Thu, 30 Jan 2025 21:35:04 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andreas Schwab <schwab@suse.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv/atomic: Do proper sign extension also for
 unsigned in arch_cmpxchg
Message-ID: <20250130213504.285b4675@pumpkin>
In-Reply-To: <mvmed0k4prh.fsf@suse.de>
References: <mvmed0k4prh.fsf@suse.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 30 Jan 2025 10:25:38 +0100
Andreas Schwab <schwab@suse.de> wrote:

> Sign extend also an unsigned compare value to match what lr.w is doing.
> Otherwise try_cmpxchg may spuriously return true when used on a u32 value
> that has the sign bit set, as it happens often in inode_set_ctime_current.
> 
> Do this in three conversion steps.  The first conversion to long is needed
> to avoid a -Wpointer-to-int-cast warning when arch_cmpxchg is used with a
> pointer type.

Doesn't that break things by discarding the high bits of a pointer value?

	David

> Then convert to int and back to long to always sign extend
> the 32-bit value to 64-bit.
> 
> Fixes: 6c58f25e6938 ("riscv/atomic: Fix sign extension for RV64I")
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>  arch/riscv/include/asm/cmpxchg.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index 4cadc56220fe..427c41dde643 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -231,7 +231,7 @@
>  		__arch_cmpxchg(".w", ".w" sc_sfx, ".w" cas_sfx,		\
>  			       sc_prepend, sc_append,			\
>  			       cas_prepend, cas_append,			\
> -			       __ret, __ptr, (long), __old, __new);	\
> +			       __ret, __ptr, (long)(int)(long), __old, __new);	\
>  		break;							\
>  	case 8:								\
>  		__arch_cmpxchg(".d", ".d" sc_sfx, ".d" cas_sfx,		\

