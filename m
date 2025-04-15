Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9317314A0BC
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 17:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744739410; cv=none; b=M9BIF1km5xtqNm9NqLYtn6u67I0Ua92gbYXYDwP8vSIoie3eVGvybycex0AbwGwIOsQ84UW7X0l0B8+aO9jlz7HkBO7d3g5ryqnS60Ell40lNTSY+b8fGlYIY3dcfd2062H1aW2P52j/mq4rdsXkaxRLzQU8MyG9upjlu7qovqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744739410; c=relaxed/simple;
	bh=2DDraCRBSOxhRBkwD6t5r0ljoLPgp7ePQm95QzbrtRo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W67CeATj21OmWcbEGvCUl/E1i9ATIed/ox71MaVXojXD8R1Mnb83MLSz+e9AVE99J3DTcTENpYVlhgBOH8bUm0vPpTOpASQydF1Xu7g7atlFkXvUtkxhl8cm1+Waj1UXo1ipzqaoFlyIODg2d9cdPQk/6qaTZ7f5wvfnXnegqVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBdQX+JI; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBdQX+JI"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso30007945e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744739407; x=1745344207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+IGWIj7wJf2syx4oFrUDfBsiIa+csd+QPQhKjMt4s0=;
        b=YBdQX+JIvzhD2xT1l+mGSsNzuWdJrbfMmOIsNwy6xXtzDZcj8xq108wRjjG5ZgrNwZ
         q9fxHWnbqmxVZ6jlbmFhoKghQj32JbxAS+0PRBwOYYqfGULCT1eW+9shHr+pGw+Ldmw9
         Q7cUg853mkg5VYk0+hvAMgSURgsU3bfzDmP6xlAW22T6bDF2vHvDt4QBc8OisqP9YwXB
         GRDDs0bOwBaKqDW/ZppUcQiplEuDFtFBfPL3A0kM/A2rMzIbMpQhFNonMXWAyi+2F4Y2
         eiuZQsd94ztxjMMOQ+zBmG9lPp24sbgDq4Rkmlu5gylLRTnGeIitJai/VXSiGw26qHgX
         WqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744739407; x=1745344207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6+IGWIj7wJf2syx4oFrUDfBsiIa+csd+QPQhKjMt4s0=;
        b=MgAuwVwyJ49EmSd9w40tnaCAOKpCGWHSQXFms4LKJrb+g2pd1NhwZwp6MT3lGdGZS6
         zQn1dGFe2ij0vBXej8nQvwxkukIpc3umFcbp0stasKByPkyiuZR4bP4Tj2JOvRHFjQrY
         eMf2uuy6XPzoT2ImYrsRjk2PPfG7y+XxhLQJs9fmf6zI6lQWmzFT4DrXRQ7P9gU3nsLY
         CvtrWVFkGxzt/98wCEswhU9HhXOAFst1P2SEa+XVQItGaSmjQYQgBRfoc5Tmo6WQXR4W
         A5l4FXsHfTHY1KB3QHFAXSiwCLuCJiroCg1Igvjhd2lrwF9BqsPVh7tY1+e16Uq8Zu2d
         5FTQ==
X-Gm-Message-State: AOJu0Yx2UswcrtmL31xfrpAGQK/hA2aMF/jqXgywL3clD+WtnMt5b2fA
	SKhQRNcMbo/4HqKD7GH4q6ueQzxNJmGw22CGll6J7SEXkfzD77Eq
X-Gm-Gg: ASbGncvnDmeU9YquRDF2Nt2n9Do/S+s3q0oEVOEl22yGA0kMmM3/WTlqOzdxFzchqJR
	7KPNOKiXsYNw0NPuCcQz9QJvIF0wR/VejDT0Z4c4WZ6S/1hCaORW9JrsFrbcv4fEPpYyWyU0K4q
	qw+Mxm9pwszAzFrMbly0mnMlRi2waoJXba3A6bYCBKjd6qZl9CySFT+ngm1UHRbkkX8U0fhbtfy
	z17/AFZozHJihYrsTmotqynIPFiFrDTeyNUV0XE0lFvHqM0dDb0+OxIJmYMxm7Iq/rjOrUK4o3w
	LNLx6N7HBRJowFUimG/Ll/vjA4HDtaCLJuXClXEjoqYbafG3zpYA7aGLh/qXy6FHaa58kw3KdXm
	A1JAzk9Rq5I8h5Q==
X-Google-Smtp-Source: AGHT+IE3i8VtO3PBfqgbBWmg2DDySB7SdvtC/HDCOe/CZN1bS/jhP7VKIrMumPdFpVsM3+ICA3VQdQ==
X-Received: by 2002:a05:600c:4f45:b0:43c:eeee:b70a with SMTP id 5b1f17b1804b1-4405a0ef6c7mr254705e9.22.1744739406749;
        Tue, 15 Apr 2025 10:50:06 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f207cb88asm216195775e9.37.2025.04.15.10.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 10:50:06 -0700 (PDT)
Date: Tue, 15 Apr 2025 18:50:04 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>, "H . Peter Anvin"
 <hpa@zytor.com>, Linus Torvalds <torvalds@linux-foundation.org>, Peter
 Zijlstra <peterz@infradead.org>, Anil Gurumurthy
 <anil.gurumurthy@qlogic.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Sudarsana Kalluru
 <sudarsana.kalluru@qlogic.com>
Subject: Re: [PATCH 02/17] scsi: bfa: Rename 'timer_mod' to 'timer_module'
Message-ID: <20250415185004.4bf93486@pumpkin>
In-Reply-To: <20250414102301.332225-3-mingo@kernel.org>
References: <20250414102301.332225-1-mingo@kernel.org>
	<20250414102301.332225-3-mingo@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Apr 2025 12:22:36 +0200
Ingo Molnar <mingo@kernel.org> wrote:

> We'd like to introduce timer_mod() in the kernel, so make
> sure the namespace is clear.

You global edit didn't work.
Even the first two changes are broken.

...
> -	use_idlect1 = omap_dm_timer_modify_idlect_mask(use_idlect1);
> +	use_idlect1 = omap_dm_timer_moduleify_idlect_mask(use_idlect1);
...
> -void __init s3c64xx_set_timer_source(enum s3c64xx_timer_mode event,
> -				     enum s3c64xx_timer_mode source)
> +void __init s3c64xx_set_timer_source(enum s3c64xx_timer_modulee event,
> +				     enum s3c64xx_timer_modulee source)

Most of the changes seem to be wrong.

	David
