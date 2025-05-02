Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C12F23C4EB
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 13:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746194189; cv=none; b=pOl1cT51Lteh7LSztYw59gVGsveFxTBJ5g5nTZoBiyKAsQsmu5Q9OwQpdMWZcNZqCzsj28KEEVD4AEIZ+R72+zjyr2G6M7YIPJT0xVBnnzrHjF8JsrQDe5knN9ZAPaSoZt/NndsVWlwUdY4+PihNEtnOzRx4jvtkJ6KOB0xPlCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746194189; c=relaxed/simple;
	bh=KTca0jPwud8wUrK/AW8BuT4QJDYZxiA4bBOkeX9AIDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HMbVbVZxM5dL0tmD4ZIu5KPsAlxNaW9TSB+2rpNdd+XUCb7StimVjLFFhoMpdyTcLkEdClydyZTvoeH+Oj7ALNwRgZmL6boB9tM2Hb7hcV20yV5IQR3pTYIEJjYlxjD4Gj+PCWw6xjkOEs2IoJE+mZyUTm/SYJTcwV9sIoTEH4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EBlcFTjs; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EBlcFTjs"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5f4b7211badso2999219a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 06:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746194185; x=1746798985; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KTca0jPwud8wUrK/AW8BuT4QJDYZxiA4bBOkeX9AIDk=;
        b=EBlcFTjs88LOMLkmIx0RVJD0aEvgKpFreLKbPVnnbEJIzEa2ZmVhwHuho2xUki+98L
         KX2Y9+BwUa4jVo6cunHgLWdVxnBqNjucv8lshyYgzhRMCvC2rRkp5axVUMUP8Q+VbfNL
         V+mSKBEtwuCRhy7CecImYObcggStvj4eYhGzedhm6TZHIeTFrS2YpD14p5QXoJyxFXro
         sR/hEdZsTipuG0mjB0tuAwNcAfZwx5evcQZ7Yy/7pykOw/X2ZaoZkHy0W551pla6p2tQ
         PqCvIEW/j4/noV/4a5krKlbl0c+pkFHkWpbwdMksh2MDqO4ct/Iuw0wIGpu3KsTyBXId
         pZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746194185; x=1746798985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTca0jPwud8wUrK/AW8BuT4QJDYZxiA4bBOkeX9AIDk=;
        b=mVgg93TumoXcdBQbSaPWIOtiSUGd+VQzd6WkXl83bHeOnh7BGd0i2uzgZopejYVA5Z
         s+FnLoHh4g+5e5OdGxr/yalPC5YYKz+AXUI9mZjEkuWVGwXRSuSspuPKhc1oxHAskAVo
         vO4IrhchNRPpWCDcBBp9Zpa3p5/8rBR2VCdHMmiwbEhM5ZIlJxBc8sQUVBlkAb8FAwPp
         JuVi1kT6WRYlktTBabg0ptIY3stgI8C4QasL5g/KyB3d+0RtxgEds+YK+LO6PLqtveHq
         eXTsJ61nIA6YfFiuI6mBRPLUc6BIlVfc6nFSv64THuCB3DJ048uJoE4Qs/ssM2QDN2Ak
         hwFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyhppvnEnE2n19QLgIgLWkw4I0a2KBpJn4KbSm/5FIBOb8Po2H0lT6cTi8YgmGx8v7oxfOQJlglYfUJRc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjOR/jgfG7FXglTnk6tJIT/BojDG+ei36YRQ2aJXBf4g/Ke2x6
	32r7Ag6MnAkthZ10NJC9axuKzq/io/01WL1ftaNbPPll1ETvuMQkh3wPzqBfGeo=
X-Gm-Gg: ASbGncsVHu0JIRTEmpA/HT4PBkZz6jlYwvoIt6Iaqiq7lbRM487NQ3K+GquuBaKGh2x
	u+sxhrGb/akdRsNFEQMzWHTLCrxWaYB+IR4uLTvvKID6kY4fKryur8hLzV5cjGXdlE6bMIOt6ol
	mn8owkfV3unv1JZtm2397XHtGbJTBrPVu3SYlDrRmIRdDIp6W7ARiu+j0fc7LAzQ83f/WiRW6ub
	6+OILR9rynBa3pGZ4U7Fv0m/o6DqcLIXULCEySfGysl39SdonKvqOESMY7jBfPR7beuwDWtbUZX
	sq1D+NQt1V4f5vLgSv5tG1l/FMJCKi7VaP1Ncd5D9gA=
X-Google-Smtp-Source: AGHT+IGDk3lZvXaJbz5u1RYzr3AwmWH9DrNVK0V1dOVap/hvi5RJCgkKC/cdhumSVO205tSbEm2pPA==
X-Received: by 2002:a05:6402:35c5:b0:5f8:3b33:f838 with SMTP id 4fb4d7f45d1cf-5fa77d4e2c5mr2333759a12.0.1746194185227;
        Fri, 02 May 2025 06:56:25 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa7781d7d9sm1262222a12.47.2025.05.02.06.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 06:56:24 -0700 (PDT)
Date: Fri, 2 May 2025 15:56:23 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Max Kellermann <max.kellermann@ionos.com>
Cc: tj@kernel.org, hannes@cmpxchg.org, cgroups@vger.kernel.org.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kernel/cgroup/pids: add "pids.forks" counter
Message-ID: <uylrr7ajj6qttrcvbout4lhm3lfcepgjm5maizvitnyghjnr2o@xy2hdbgaxyxs>
References: <20250502121930.4008251-1-max.kellermann@ionos.com>
 <bbublxzpnqrzjq5rmmbp772w2darjoahlewqky7caanaknglbx@6wuy5nidsnu3>
 <CAKPOu+_8cbUk=8d41GQGOvUrmG9OuaNVuSQrksDcUQMyFc4tiA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kra6mtvbexkct673"
Content-Disposition: inline
In-Reply-To: <CAKPOu+_8cbUk=8d41GQGOvUrmG9OuaNVuSQrksDcUQMyFc4tiA@mail.gmail.com>


--kra6mtvbexkct673
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH] kernel/cgroup/pids: add "pids.forks" counter
MIME-Version: 1.0

On Fri, May 02, 2025 at 03:23:26PM +0200, Max Kellermann <max.kellermann@ionos.com> wrote:
> Sure you can do everything with BPF, but that's several magnitudes
> more overhead (if you worry about the atomic operation in my patch).

I worried about users that don't need the counter ;-)


> we want to monitor all servers permanently and log every counter of
> every cgroup.

OK, I assumed the process "clock" is only useful transiently for
debugging...

> Later, if we see (performance) problems, we can reconstruct from those
> logs what/who may have caused them. The fork counter is an interesting
> detail for this.

...since it's more of a proxy measure over other cummulative stats that
are bound to actual resources like cpu time or vmstat:pgalloc* [1].

> It's very useful for us and that justifies the (small) memory+atomic
> overhead, but others may have a different opinion. If you don't find
> it useful, we'll just keep the patch in our private kernel fork (like
> dozens of others).

OK, let's see if someone else finds it so useful too. Definitely thanks
for putting it forward as first.

Michal

[1] This is actually something that I find missing for memcgs.

--kra6mtvbexkct673
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCaBTPBAAKCRAt3Wney77B
SUICAP9FPoTgmVlgQWFY3pAG/IFC10hHsnu4SAHLUWIyfhOuDAD/WQRVXN3N6Oz+
5Rgx9X1B10JdKHP5pChzNGJ8MnxCAgE=
=EbS3
-----END PGP SIGNATURE-----

--kra6mtvbexkct673--
