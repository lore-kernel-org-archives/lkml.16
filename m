Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3488022616C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 12:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749816464; cv=none; b=LgrZbU5kxbMLTfA+6BoA1UBrTl8Db46/ZdbTsH/h4CUv+UqtbcI6B0HbtHwyBjOQ4KHGlFZZf4BGFB0MwWZYbI3AEgVYv1xqLOVup8VaALN6s03quK+Jl45POmNv/2jniU+RH/c+I5e3DIDvYbRPF+tuouDD6WnddG61dCM0ecc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749816464; c=relaxed/simple;
	bh=dw+/2d23CWYaflUCx8yRKTMFvgtfvTK0Uw26ZiXjycM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U9edJ1fOP94cNAAn4JlDenFZPzsu0koprs6bF9R2vLRUBjST3v6GN/Ko3Qf1IlUF2+lgGboub7b3MZ9YIHeF9Rh8BGBf5w57ITzp0FpuCNXPjw/F976Sv/S5Crx/g4dzi6gK08h89apnl8E0RZLOiSKeF4AGnbZ5MudkvKCFfGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=RvMTR4n1; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="RvMTR4n1"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so1192172f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 05:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1749816459; x=1750421259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=acAtLseFdOzXV3/vSQyIZE2n086nZk8lcarjj4fTGN8=;
        b=RvMTR4n1UrjRqNKwmHuENPKn3T8acwu52R5cI/RHsYQtkRaLUgVl+P87T1VUcVOjKR
         gcVXVzHJoSsJSItZmZ9sT21h2goqykeHpxvo06Ze5NoZa6O84wCx//IGw0c0imGWWaqU
         7MJWfDQsDEHj40yAFsi0rTowJeYKcDHeyTfq+ZN000xjXCP1EJ29XYuFFg4lK6TFdzmm
         gsW03rzUREo+ISUB1IgX4j2B5krOwn+rj389KJ7Ystg0cxZ02vEii+3tkmeWQTPE6gcd
         IfpZqhdjg5oDp66R8na1Nu9D3ZZd9XwYW/Omqh+gyxuJZupufcOZZWO98fAEjYH7k6cA
         BnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749816459; x=1750421259;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=acAtLseFdOzXV3/vSQyIZE2n086nZk8lcarjj4fTGN8=;
        b=sE6BD0+/TXMIB3n5TKS8GXfJXTGWHNoFjPIMFkhQqvebL5kDLnWa5g8owwMhB4P2lB
         2+M9Qrf1KyrsunyJlsuNBvS+HNNsFStETMWI1f9bJ+0ibk5riXkfp+zvsz3xl5nND/jm
         e5TkCVcmDvQp2Jp9GwtA7kSd5EcBuroxRIxysgUTm/V97H6LaANoAcnhm9M2ZGGivgsc
         585qukr4a7iJFBGYC0YJLot8mVukTdria+7+wb6BhhleW3wxXGehZriXhJt6yQsj4uiU
         7sz6cWvuFKQwIPtvH+7SY9eQG91Ncn/CFyGvkObJDpZtG2+5Fgns2G7/5UZf9kR1Focq
         /X8A==
X-Forwarded-Encrypted: i=1; AJvYcCV1qWMCgpr7aJcIBVmu+YiSthsscyTC07cR2eEd7el5JpStMU9XRGGYyamv5EpSsF/gLKggpttWpbgRZmU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrx4+15Wf9HKDkb/mi363Hklq+BzzpzAAcVnHJ0ERtmEXjHmH/
	I0NpmsIK+fvFCPAyuGX27lsTKHSUOB9P4vD+t3SdfaXi7sAwXBxlsIzmloN9DwMKF0eIlbfygrO
	aMksC/R8=
X-Gm-Gg: ASbGncvL8H/An18I8yesh9ciImCrRobe1T2wTOe/XQof+d3EQ7gRsrF0V/P0DiIu1bb
	3VxJtM5wdHdUUM0JO7TUHQM66n+PbaQLU+VZgEAEoQ/6hlBoFsxbg3yTzuB3Al3qM5KgGJEGH+R
	FGk23tcTA7mFFa9qEekQUwoA+IfaPhD/kYgDq/ZF5YspO7aEh2g63oXIFp2K3KxTwi0nAFaqJ3v
	wgX9ujsor6dxnIT6jhLjYE0SfKzIs88M+MtAGX2x5Zn6HaoBg+XCaa2Bw8UJRBEfehFGYAIJb3h
	vi8/rqGX4gd3LXAW4H/I9UPI+BGFnwKMZmkGK51KZzZpnqKf73TYZXVSgt0UjUKM1hHNtJxX
X-Google-Smtp-Source: AGHT+IFwnfrbQNhYn+RKjvnvWq1fAt1wi2tjoULYiVKtV8KdDn2x97sSGXlAbKnPKoBdZNwQjgkRXA==
X-Received: by 2002:a05:6000:1ace:b0:3a4:f723:3e73 with SMTP id ffacd0b85a97d-3a5686709d3mr2590339f8f.16.1749816459324;
        Fri, 13 Jun 2025 05:07:39 -0700 (PDT)
Received: from MacBook-Air.local ([5.100.243.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea15b0sm51167755e9.11.2025.06.13.05.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 05:07:38 -0700 (PDT)
Date: Fri, 13 Jun 2025 15:07:35 +0300
From: Joe Damato <joe@dama.to>
To: Yuesong Li <liyuesong@vivo.com>
Cc: Taehee Yoo <ap420073@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com
Subject: Re: [PATCH net-next v1] net: amt: convert to use secs_to_jiffies
Message-ID: <aEwUh3A3gvj64v0a@MacBook-Air.local>
Mail-Followup-To: Joe Damato <joe@dama.to>, Yuesong Li <liyuesong@vivo.com>,
	Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com
References: <20250613102014.3070898-1-liyuesong@vivo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613102014.3070898-1-liyuesong@vivo.com>

On Fri, Jun 13, 2025 at 06:20:12PM +0800, Yuesong Li wrote:
> Since secs_to_jiffies()(commit:b35108a51cf7) has been introduced, we can
> use it to avoid scaling the time to msec.
> 
> Signed-off-by: Yuesong Li <liyuesong@vivo.com>
> ---
>  drivers/net/amt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/amt.c b/drivers/net/amt.c
> index 734a0b3242a9..fb130fde68c0 100644
> --- a/drivers/net/amt.c
> +++ b/drivers/net/amt.c
> @@ -979,7 +979,7 @@ static void amt_event_send_request(struct amt_dev *amt)
>  	amt->req_cnt++;
>  out:
>  	exp = min_t(u32, (1 * (1 << amt->req_cnt)), AMT_MAX_REQ_TIMEOUT);
> -	mod_delayed_work(amt_wq, &amt->req_wq, msecs_to_jiffies(exp * 1000));
> +	mod_delayed_work(amt_wq, &amt->req_wq, secs_to_jiffies(exp));
>  }
>  
>  static void amt_req_work(struct work_struct *work)

Seems fine, but minor nit on the commit message -- when referring to commit
you should include the one-liner as per the documentation [1].

For example, maybe something like:

  Since commit b35108a51cf7 ("jiffies: Define secs_to_jiffies()"), ...

Otherwise:

Reviewed-by: Joe Damato <joe@dama.to>

[1]: https://www.kernel.org/doc/html/v6.15/process/submitting-patches.html
