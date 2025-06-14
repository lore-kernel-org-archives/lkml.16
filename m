Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5917D7E1
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 14:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749909681; cv=none; b=oeUbdN6avgEbAPX4bA7mi9LQKk1A8bAJZAQmTmxmEO4wYcpgucgaYvOFsIvtox5vsyxjIh+Xyl4U+EybceO+7zgMy1muQSVst5idcp+cq+Foi4dAClGEzvmU5SgBYhRmEN4lLD1XKyuGMSF5nQwlQTCAaSGoR6tsmBSkmo3qIEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749909681; c=relaxed/simple;
	bh=qTaXos2HZ7xVL5Y0pPPBHugIKaVACTveW/ZDQ/awo6Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sFNLjJtpEqt/ml6FSKqwUrn83MJYrns4orpYVZUQQ+il5h6bYu6sokg91b2ekRgliamp4Zj5n/RUyMNCgT2Zk0JynGmIXO+Wt+zhMev3NCcLxcEzPFNFkxkEWo3lrbKhozQi2qStm5KinqAtdSJtV/Wgox4yPyQ6C93bKxMsGDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=NUnHeqpU; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NUnHeqpU"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4a4323fe8caso22611641cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 07:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749909677; x=1750514477; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nTXHY6wX6VBco0tfqY3kkR8mW7cNMyrMEL9LHLlxgX4=;
        b=NUnHeqpURQeB1h8lDlHt4NORjDxpzIDUZdDgnxAK8NfTBKUh3oPD63HSNyXnP3fITe
         zyAU/DtFEjNslBuQpGU8YhsKinaF+1spqFZdChNRlffIianrRnSVvqny5kFOpvwKsZRA
         5OApZFxahFnjQtfePTbJBnuoI+5PoULxpboGGgrVZ2H+H0BLmaM+lkeZ3Pt0nKoSVHnd
         nlswJSeTYJdhoiA++oJDYZZxaYkm8ZS8UoccdfmE1WMssmvfoPTmogR+OEBACVmYNkmC
         13uOfxCFz9oPQsS6vgXhRwvUqxNHhZp4orNwaJYfst882qMxfgWF4DGQL0nOAPyg2PbT
         BF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749909677; x=1750514477;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nTXHY6wX6VBco0tfqY3kkR8mW7cNMyrMEL9LHLlxgX4=;
        b=FWfQcWua2vBVKncO/x3G3jJQ8dM1omq3uabu5pKsjUa9WuQJs8t8ITzzHk+KH/W8SD
         doO8zWkukxGS2y091YjHUWVDs/vDU/CCnyGcO1JIb5TJS73VO16WOk1EnqvADRk4SsUX
         QRaWXBFzs4mTIO0LmqqVfoqXvXEkdX+6gWoNxQmwyfXai248Qh4j03EOCqkspdok7v+N
         r1I4791N0YhtZJaa0UAIofjkRLDr3F2uDJYVlUcYHx/gIvY4d0SJlajoafb2vXw0IRIa
         5d99+R7VleOz1N9rR3i4XOrm9t4XIjqLR3+XlF3aytVCbNjNsL0BYVlnmmK6IuhJdSLO
         U0lg==
X-Forwarded-Encrypted: i=1; AJvYcCUx/uD3xO+xfSi5Od8yHdCZKBwERAr+efuQGTeT2eacPxsq+EymuMMeVtAgTD9UhQdgMnHOEvTkVlNh08Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp9C8OkZWv3ZJeaxXefSquuoD2dJFAnE0YCpQ6fg6g+YfkE2xt
	9wkGtbF48UP+FeGQ0bbPvQhh153q4KDjOub1zVjg6uz3qoL4gJeW3D/Jc44n/4ysL7s=
X-Gm-Gg: ASbGncs+ye1vO9WMtOaODL+jAl85OQPHCE8NENWQolhKXMDMPqPBdBwopkQaFJiafWp
	5HrRQ5eP+mnieWw0/g45+SpjGpRefq5sr6hkRxxb9c9xTEuU464HO2yX+n+tF56Hv1gf31hkqnU
	VDXuNacYrLWxf7WCjEOSoMQXkMxqM/kkFDGia9M6HcTZ2S4YF9k+cwR37SBSDzf0rKsHPAM69j1
	3FSzBUwDjbknhrQ5qePOP0AdsW1MEaq8/YDRO1tVgE7w9eR6uCDUn403eqyatouPNR0FbrVI1Js
	5KLYcKE1O0l7Pq08bgGd3lFKKlNBXjgCQaZ8KzhvpvGsalMm4JVpTAkkQ7EkHs+uZSoGeWNTgio
	wcLOOoinAEKNoHZjxjY0r9xOU4g==
X-Google-Smtp-Source: AGHT+IHDiIAwk+uz0OudEeATqnSO6nPpVuOzvJ1wuRGvTRD+SRVc2cuLeUcnoBRIQVOolJcAB4ZmKQ==
X-Received: by 2002:a05:6214:2a84:b0:6fa:cdc9:8aef with SMTP id 6a1803df08f44-6fb47725ff5mr45184906d6.17.1749909676663;
        Sat, 14 Jun 2025 07:01:16 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35b20fbdsm32064376d6.11.2025.06.14.07.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 07:01:16 -0700 (PDT)
Date: Sat, 14 Jun 2025 10:01:15 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: David Laight <david.laight.linux@gmail.com>
cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 next 03/10] lib: mul_u64_u64_div_u64() simplify check
 for a 64bit product
In-Reply-To: <20250614095346.69130-4-david.laight.linux@gmail.com>
Message-ID: <327ss83n-nq57-n674-02ss-369638np8s21@onlyvoer.pbz>
References: <20250614095346.69130-1-david.laight.linux@gmail.com> <20250614095346.69130-4-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 14 Jun 2025, David Laight wrote:

> If the product is only 64bits div64_u64() can be used for the divide.
> Replace the pre-multiply check (ilog2(a) + ilog2(b) <= 62) with a
> simple post-multiply check that the high 64bits are zero.
> 
> This has the advantage of being simpler, more accurate and less code.
> It will always be faster when the product is larger than 64bits.
> 
> Most 64bit cpu have a native 64x64=128 bit multiply, this is needed
> (for the low 64bits) even when div64_u64() is called - so the early
> check gains nothing and is just extra code.
> 
> 32bit cpu will need a compare (etc) to generate the 64bit ilog2()
> from two 32bit bit scans - so that is non-trivial.
> (Never mind the mess of x86's 'bsr' and any oddball cpu without
> fast bit-scan instructions.)
> Whereas the additional instructions for the 128bit multiply result
> are pretty much one multiply and two adds (typically the 'adc $0,%reg'
> can be run in parallel with the instruction that follows).
> 
> The only outliers are 64bit systems without 128bit mutiply and
> simple in order 32bit ones with fast bit scan but needing extra
> instructions to get the high bits of the multiply result.
> I doubt it makes much difference to either, the latter is definitely
> not mainsteam.

mainstream*

> Split from patch 3 of v2 of this series.
> 
> If anyone is worried about the analysis they can look at the
> generated code for x86 (especially when cmov isn't used).
> 
> Signed-off-by: David Laight <david.laight.linux@gmail.com>

Reviewed-by: Nicolas Pitre <npitre@baylibre.com>

> ---
>  lib/math/div64.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/math/div64.c b/lib/math/div64.c
> index 397578dc9a0b..ed9475b9e1ef 100644
> --- a/lib/math/div64.c
> +++ b/lib/math/div64.c
> @@ -196,9 +196,6 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
>  		return 0;
>  	}
>  
> -	if (ilog2(a) + ilog2(b) <= 62)
> -		return div64_u64(a * b, d);
> -
>  #if defined(__SIZEOF_INT128__)
>  
>  	/* native 64x64=128 bits multiplication */
> @@ -222,6 +219,9 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
>  
>  #endif
>  
> +	if (!n_hi)
> +		return div64_u64(n_lo, d);
> +
>  	if (WARN_ONCE(n_hi >= d,
>  		      "%s: division of (%#llx * %#llx = %#llx%016llx) by %#llx overflows, returning ~0",
>  		      __func__, a, b, n_hi, n_lo, d))
> -- 
> 2.39.5
> 
> 
