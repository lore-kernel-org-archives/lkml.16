Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E166267F6A;
	Tue,  8 Apr 2025 10:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744108609; cv=none; b=EW0OYqJ9sQESKmayaGzn2WYQe8UGRrbqJgEkew/aGGaCp8OVeB0RbGhRT2jC/0OwdfB8tRJHIVFGyMzBYh1p5HEE6/pm1t2vz1uIr7zslx6999iP4sW/gqjKvv057pvyEUVW4gu15x4tAeIJW9+0WbmpsOINSLvuEOgTdUpZxEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744108609; c=relaxed/simple;
	bh=ZuWwkuwqeHf0fYJ4ELuETBzDTnsElQHXyQMu2I/1L4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/+ZxaUSAk9xlIbefsrveiP1KQZNXvJwl27xSFPSyHJFqO6Ll63OdGPJavCEG/vRWPPx80wj0nQK3U90bauha/+gEL/XNpOhdMhkPytwdqo5tUTJH5jCAW/SbSl63aQzBAeDJjxEjXAhP3K6FuHL0Z2i1M/EcwyWzHmdX83kdr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U8d68dZ4; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U8d68dZ4"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so972068566b.1;
        Tue, 08 Apr 2025 03:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744108606; x=1744713406; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZuWwkuwqeHf0fYJ4ELuETBzDTnsElQHXyQMu2I/1L4A=;
        b=U8d68dZ4P6MMD3OpJzcuU91TLyycoCLO/6b0xFSkFcZ6m7N5hTNRTEx8l41Q+eO7Sf
         tzIBw8SAQWLbeURjAz35eiq/nKM3Vgj2/6c0m73EKdwspIzm/T113JYUA6I8bU1tRHjm
         tkCknrF+md7ZhLA7GsnFC1z7L+/i7ud5hE48WAO8mbP5rseeyDUtXUk3NT1BBw7W+6qQ
         5k8YyvUfuN/1r02GTCBSJBD31QJOXQNvLTepe4V7T3gRC/rtsOfplNM5EQRB4icbXzPx
         m6m2nPkJIwDxa+MN/13iiHq6RctDoh4OYquyOTDVWYQTx9cGj9bGPKH7cQkmIefBv1+j
         VgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744108606; x=1744713406;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZuWwkuwqeHf0fYJ4ELuETBzDTnsElQHXyQMu2I/1L4A=;
        b=gi9mQL5OvPbbQkF8iZk7VhMdfaUsNv7Ky0Qq4PB9dmbECtJMG2ir8ixxy1ocdhyDJl
         GWlB29TIqxEQWgqdIkoogqQMIzThX7tH2erL+5RXL88bf0Axj9AHBge+1FUK5NjNTr8W
         1ktaP0q4zYCNge+IgFj7/EmwhIJBwrkVsPHbY87ucvtRZPEq+buL6S0DqjYnJt57bcMn
         1CeblKMYEvjPSpE1yK4s0ClKRa7rqh0WPELzSVk/r+8/mynoopddeZfZPfGdbV3XH4uI
         5da3+8MqkVcyKuECDj7iWX7A9kN1Hk3Hy/bJwvxDgHjMN5B5ir9t3xnXxy8fZp/6yvRp
         XvtA==
X-Forwarded-Encrypted: i=1; AJvYcCUUrMNn+yyNx1QSW+2GQzdaU9/Z3bVfhWLzVMZd39I62eJs+YIFnsPEs6jPJlZ/an/O9xRooVn04WGWAQ==@vger.kernel.org, AJvYcCXS8wAsImfYUxHgqNo/r6cy1I8HHK38vT/snonsOYFIKQHKwKehvpfbEU0OfhFyljqSV99y2IWj1y7KbOg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAJmKK9LwWTcij6YpRd0ajGnwmgA+C3667OTNNs03k0eZRpkdX
	wbBcKBpYi42GffXTCJJkxoaReqIJji5RBlvKtc0mo18cDRbVsm8MbE7k/1MI
X-Gm-Gg: ASbGnctlvQ4jm7UANScD9+Wb4BMvix4JmpLanPq7RcnuQkXsw4Y1Lo9E4qpszrzuvNH
	vZYjfCDdOtPXWvcpOoZ5+rGYvtU0ppNIGuUIkfEaOBnWzVezD7gUD0nasn8vN0GzA9hWzwT9qgS
	NZWEBLP9oWoHFd7PrutOgaTFf+HbgHk9OASfjL/UW8017EJt7POZv2kylthtKPaolQTyj5ktPha
	CjvPlcF5begwdNEGShErng1VvfnF6/ag0AztlTpbM1zudLFk5wdvl5o8rXx5Hd8QDrD4bdeJp4Q
	mII3TVvsL51WDmm+wuzVCxXRgai6jOWiNdCAX6n6Kw==
X-Google-Smtp-Source: AGHT+IGL16tlNnfVYVbAhIxKoFpPCwkhvAE4A2TUaiFxYi0ePohEgWmQXUX49wV5hpSFloCwrFx3Cg==
X-Received: by 2002:a17:907:a4d:b0:ac2:7a97:87fb with SMTP id a640c23a62f3a-ac7e727cee9mr1238023166b.33.1744108605456;
        Tue, 08 Apr 2025 03:36:45 -0700 (PDT)
Received: from pampelmuse ([2a02:810d:a1:6000:959d:6b59:1561:d2b4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c0186aebsm890142466b.158.2025.04.08.03.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 03:36:45 -0700 (PDT)
Date: Tue, 8 Apr 2025 12:36:42 +0200
From: Gon Solo <gonsolo@gmail.com>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-spdx@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts/spdxcheck: Limit the scope of git.Repo
Message-ID: <Z_T8OiLQzKDGhOJs@pampelmuse>
References: <20250225-spx-v1-1-e935b27eb80d@chromium.org>
 <12647854.O9o76ZdvQC@radijator>
 <Z_Tgp8L_8goc63K1@pampelmuse>
 <Z_TtXaRnaU1zXbXv@pampelmuse>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_TtXaRnaU1zXbXv@pampelmuse>

It's a known problem:
https://github.com/gitpython-developers/GitPython/issues/2003
https://github.com/python/cpython/issues/118761#issuecomment-2661504264

