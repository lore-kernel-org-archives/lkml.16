Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2985214A66
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 11:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746443675; cv=none; b=RYaLOCi4gblK375JQeqxXmv85kCCxXge+QHk3VdoFlLgRyR2Uetv6LrQisiwFbz9XMxK1R5wV7EdZLBOE5GHFcyI2B0dczpRmG9tdEBmBcLj1nC/ieq9D7MMW306SW8PEQcHX8GOtlMTv/1hhGPwpcK9uwIkdkxe/epCYAZOkh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746443675; c=relaxed/simple;
	bh=31386Q9Xq2jWeka9KmylJqcLzw/rURQTCXcWBThQ81w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JS/7bZFIoJsfmEng0X7Eywz6bPuycJGGWkr6VNrWAsiZHNBaUgEOo8NcVWPrlTcjYkRXaI/FRUtmSWcoO7+aCQAc/qr9yqM/YcwwgIH9biLkuYyC85yT/GysP4hAs461Jwm9fXEq7DVQ7+nBbyt2QsSaG6XIZT+sS5Ai7jvxTyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=E1HRpI/Q; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="E1HRpI/Q"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5f62ef3c383so7912876a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 04:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746443672; x=1747048472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oxyVQwu31n5AyE1lT6wRJweYjUVMbaBVub5F7yoYO6s=;
        b=E1HRpI/QzoyanEhkyc+ohXrLx9SsQD1FhdoW39RYj1xBy3cawmS+WJdAdWwwJ9OMP2
         wl8xz3cglszoj0I+3h4qOTzUp71n+Vq9xPLNweBAqQqeYR/kwZOhnm96uZknirQMHL2n
         bIjgIAVGdYFK0wgefykp6vK5Kr72h8k09Bq5l1E9kUdYFjUnMrZ0oEFBQ9AUvSJTBLBj
         sLbFksNyKFdAiZ6aqMIWOfk7LUKblxxZ/1BOatQImQncDU+ssmUyI5vnS2omA/G1Ws0G
         Q8PjTa6/qej4Xoz9WvJrQuBNtrMCiz6c+RXY4omPndqiPT8yhRVuIRdew+epkViWp4L1
         73qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746443672; x=1747048472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxyVQwu31n5AyE1lT6wRJweYjUVMbaBVub5F7yoYO6s=;
        b=Jdmtbupc2p4+Q0WDsfg+VakJ+JV3/vjMR34AyG/slaTdA7WpwPLcuxFmWSXcaUQbOj
         LQeeVhxF5CUVd9l2PPEreJNzEG5EjN3WL01do8RzcpPuW6c0aAkJPEEAiFsR6aii8zU5
         O4eBVhUWOeciUx0s45DhILh489/4OE8pV0Eyw7gelq2aFko6JgqfbpFaCXotJeg0ty/z
         M2qkGTo/ag8jmFa0KR0J/XcwzIFLFFrLvoXxRreKRXQxLYrAGCfl+0MLRGYBkmUI7kDy
         GT5MKqVN+vEbD2jyOKjt+L+2m5rLgQs5p72sWkoKm7p1C3YDhL7QLR5R7AHO92uSKcad
         jQZg==
X-Gm-Message-State: AOJu0Yz2Uv7xvCM72wkUYCbrXhY/7tESRnDmmE1JOg7GBqTLFFB7+p0B
	sYNM/fGe9W/O8XPKY+6/k/QhNgj2a+jXxF+jYqdRDdAySUQPvYpsPklQ09qHn/cAU03IjwjZOVJ
	s
X-Gm-Gg: ASbGnctbBPRrCOB5HfuNKrRb0OONAkqEwmORB6N2fmzmTRFEia8qpbbNAGpR/V+sSOm
	eYeC4ZUfFrcUQk+bwiTAf8PV4F+ONRQVWxiIrtuzQMNOliaIeJJLBVvrFMXDWH5xHUwD0/Hc52M
	jZ3XVHFOIl+m4ErnOJjX7a0iQQwm2tbiFwgoJVm1yFjCdAVIil3At7xLR8wEDocURemz6Bk81OE
	7nzkt/wP/RjyNfqpWhho0/pbuoFOLdc99dg4OFERYs7YYRM+adP3BsS7NAKtGo7we3fnvOrokSX
	YFRR3YePIKwGJm0xczNxgOMNWRJOUgEtwtho+oPgkSvu/lyVYywKeHMcBqW/Pw==
X-Google-Smtp-Source: AGHT+IEY8aqXbYBLDZiTilbQnt6X/mi2qWeyrxpS5qbbbq9HNaF4GXXdRcoD2qvHmt8Oju9+Mnx6yQ==
X-Received: by 2002:a17:906:730e:b0:ac3:853e:4345 with SMTP id a640c23a62f3a-ad1a4a8da9amr527831266b.45.1746443671987;
        Mon, 05 May 2025 04:14:31 -0700 (PDT)
Received: from localhost.localdomain ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa77755777sm5263348a12.6.2025.05.05.04.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 04:14:31 -0700 (PDT)
Date: Mon, 5 May 2025 13:14:29 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jon Pan-Doh <pandoh@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>
Subject: Re: [PATCH v4 20/20] ratelimit: Drop redundant accesses to burst
Message-ID: <aBidlTlYPSpi1mBd@localhost.localdomain>
References: <b0883f20-c337-40bb-b564-c535a162bf54@paulmck-laptop>
 <20250430010524.3614408-20-paulmck@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430010524.3614408-20-paulmck@kernel.org>

On Tue 2025-04-29 18:05:24, Paul E. McKenney wrote:
> Now that there is the "burst <= 0" fastpath, for all later code, burst
> must be strictly greater than zero.  Therefore, drop the redundant checks
> of this local variable.
> 
> Link: https://lore.kernel.org/all/fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop/
> Link: https://lore.kernel.org/all/20250423115409.3425-1-spasswolf@web.de/
> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

Looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
