Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D286A187346
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 13:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745586295; cv=none; b=R32cuDzgxwkieIuiebCOgaCsyl/IiNkMOHtdZHy5R5KxB0EStWpjVG3/JLzHnBu64c/MuyShq7DI6EqfLtUlpHFeQks72ax7dsdxU+WkhF/OoawOrXDBnIvtbqnhC2l5RMje5cFMAOHj6I2goIPfNMAlTtpIxIOrfUlpQV0DBZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745586295; c=relaxed/simple;
	bh=Zj97Ex1RSi1g+9gUZ/Tcp04w18dKEFAHI9+Rpiyg+So=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rAii5LNcR6pEVjCX/i8nlzOxTXa3TxMLWbPbIkOQFlKHKBxeDsW2jltblzoh+kwrUzzCzpIQHXRS/FUMizCNq61ZXFxlKnZIp8oziYD8aBV8lscHGUhozQIkERR6BQhpMaeZnos+SYjEf9sQ2NVU1SYpEOfrVs/m4FQs67h/o7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ok96HLrN; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ok96HLrN"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso1327125f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 06:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745586292; x=1746191092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r3J3GqbcEJHK4SoFItL9fayn3ipBLH7O0WRijmWDcMA=;
        b=Ok96HLrNCxIYbo8MHrqW9hIoOfMacx6NX8an+nX/bPIE5zCna84JnOdVS8976z1cRb
         TcOyu5dAuG/eSu0uCIAhVD9fGuKs+MbjpFlDFKULdmFZsApXIjyVt0X1k4Who6hLtc0a
         1wynf2X8i8pWfInNEUY22/Z8anep8YZc3Oiy4R9EjxDuFu7hgSm602Z7a9Rwm2j6iZLo
         smXJG8IMWUHZ0oJ7OSG6OhjZPK9QqAdB3p+kUhtWVHmc0cHWJj6dNgQI+zMmiTp/eTy6
         yrX1ultimLgU52BnmaT3409f5t1/dOtsuCR7H69lisnO/9bM1PoWJbGgZi4nh6QKGjpq
         SLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745586292; x=1746191092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3J3GqbcEJHK4SoFItL9fayn3ipBLH7O0WRijmWDcMA=;
        b=lJzyL5w3fGaIDB/p4urkRUc8P6mi6832qPR0wPbshYvRiJdUYUARnd8WfNkGxNNJhs
         7Iv/ITvL11KJ5VCTGnIuCjFdvzRscqwDAFwZEscQwbvzb12RlNhnNHRqwWGH4hg7HLVA
         YSUarEvPKJkNKFRNVtThBj86GGEwsRLuNo34KmlyK7e/byflS/OgSYOq4Q/toLGXAN6b
         oLogzi4Tjz3qwWw+sYQIkoVPO5HRN5a7b9U2nU27FSqe3UMHuQnqGDb4P4jXbsgNEgX2
         gds+asbk0BhST1OMRkEjLHJ36SJAs8YEHmiNierYVBA9XDIzCKB3CXF++RsnwYcdxkKJ
         xnFg==
X-Forwarded-Encrypted: i=1; AJvYcCUObGccyn3wyc1azl0MrvIoHQeiLmOzyXk4j6FvenuppAT5hVQn3qVWrcWEq0xr4mmRB/gE6RzSfXv+TUw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7WJQwBevebjsDQrnke0WIw3aaEhmdzlx0f/nTAaAORV0GlicK
	LruuHbUKLmtLyWPQht6dXPgXre7aebliU8VcFBlsryrUXA0YNbBcM8yK9XBVkvM=
X-Gm-Gg: ASbGncvmD4ed1YNNaBzKbsHZwEtDbWR3D+KXr1DrCzAQvjv00kCnbyH092sRSdPE8mG
	cBPIiSodkDboisP9XA3nolArrCp8rq+Tg+UGL93OXkv9MfkJFOH3SeD8wtSi7Y/00OJk1NbRSSD
	TK5Xkq5Q3m7EDdlB0c/9MiS3/00uPrudXU+OvhJmbnigi12cTjFE+F4uOG12yQSQfgBuHePeH40
	QW2fquT9VDJGCIInZbdvM458t2IgvfdZCuJavQmQiOGVwEpD7SqBeik0IOKVQhK18R00xRoGvb6
	kOjwybffP9Z043GbNiN8CRg04bevZmqJEitjIq6SS6EpGw==
X-Google-Smtp-Source: AGHT+IHxVgPrxzsyigbQs+XS+4aY9YzDl52Yt9wjdLrlTN9Cnijbn8pi0uqCi9dQ7/1RBszsnzma0A==
X-Received: by 2002:a05:6000:400d:b0:391:29f:4f87 with SMTP id ffacd0b85a97d-3a074f47161mr1713472f8f.49.1745586292037;
        Fri, 25 Apr 2025 06:04:52 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073ca56d5sm2350498f8f.32.2025.04.25.06.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:04:51 -0700 (PDT)
Date: Fri, 25 Apr 2025 16:04:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: jstultz@google.com, tglx@linutronix.de, sboyd@kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 3/3] alarmtimer: switch spin_{lock,unlock}_irqsave() to
 guard()
Message-ID: <1ec38ba3-000f-4e26-b18f-95ffb3583836@stanley.mountain>
References: <20250424144819.24884-1-suhui@nfschina.com>
 <20250424144819.24884-4-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424144819.24884-4-suhui@nfschina.com>

On Thu, Apr 24, 2025 at 10:48:20PM +0800, Su Hui wrote:
> @@ -230,15 +226,15 @@ static int alarmtimer_suspend(struct device *dev)
>  	ktime_t min, now, expires;
>  	int i, ret, type;
>  	struct rtc_device *rtc;
> -	unsigned long flags;
>  	struct rtc_time tm;
>  
> -	spin_lock_irqsave(&freezer_delta_lock, flags);
> -	min = freezer_delta;
> -	expires = freezer_expires;
> -	type = freezer_alarmtype;
> -	freezer_delta = 0;
> -	spin_unlock_irqrestore(&freezer_delta_lock, flags);
> +	scoped_guard(spinlock_irqsave, &freezer_delta_lock) {
> +		min = freezer_delta;
> +		expires = freezer_expires;
> +		type = freezer_alarmtype;
> +		freezer_delta = 0;
> +	}
> +
>  

Don't add the extra blank line here.

>  	rtc = alarmtimer_get_rtcdev();
>  	/* If we have no rtcdev, just return */

regards,
dan carpenter
