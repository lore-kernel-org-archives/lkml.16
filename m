Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132E2223320
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 12:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744892012; cv=none; b=L4KA728X6RXQypscsxXy1290QZiwhJZZQUn9TSOhFTWgCXjqTVpelfkop2HjC/ucCts1QyJsNe/J718YTyX3DcaNPovjgU+CPMRSF2e7oURAPm56vSEKT1nGdkBFdqxWMQPyET3f2UX9UdM+pREdupujASO5WNeKzYDwHqOMf9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744892012; c=relaxed/simple;
	bh=lEso+tP9DMfItOz6/cUYaHOT59nTEkHn5AJ0F7V2euI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DVCDMNObf+iYkOewQ2cd/xP94mb4kWpDbNNDrNCSIsHFhvVA0SdLHyp15kxuVpIW+kvOf3Lo9BNtvJACjpgGTQik+bQcRPY0QWbJbon8EA9AuOHT77K2539tCodFVR6hh2244Oj79b5iwt6tmfY0xtW3dJuYzSOk4RSBGZbZJZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QY6588nP; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QY6588nP"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso404135f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 05:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744892008; x=1745496808; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XwwwJQjRzixrZdNswPn1ZA0lqwm9eOl4vv52O8RBkKY=;
        b=QY6588nPrB/+2lN+cY1ntktz71FFv4ffBANlY58fpqF8660iBthroDrE58QqGK1niL
         x/tbhDyTfU05GgjlGSiHW3R/oHHp6QkBlHbmTIaF/He+5ctvyzrXMapM7uneK26U3lJx
         REjgDtQLX4f+V44ni3+kEPYmpB1jMM2ejt1vTkUjlib4Bh1iXkd8hBxAAOimAQpFBoWr
         HAh+/QL7S8kq4qlxNaVf58OTZq945bHq5lJ5RMtmTcr1xOfz5ogqK2qmo1LsZFK5vOVz
         BLjLFNSHRmfK7oOufJfdijP79BVL6ONN+yZuFObViybVf4LYD/KdcgKm8Xahws0qUM7A
         OZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744892008; x=1745496808;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XwwwJQjRzixrZdNswPn1ZA0lqwm9eOl4vv52O8RBkKY=;
        b=AXmCkKdQRENHcNKs8OnU6rVqkAMbCap0QtSNUoGShpaom9UtLSKCHhIasVkSrPlP+P
         xGx07VtBAaCIVYvcPF5aV/GuygPYdFjLoTDbrXB4w865DOueNIQOkItfwWte4/3u7cT3
         qyU5a2fFKN0pF+ZIpaLGIyR5uK5jbXk0HTv5tsJ//abgTd4Tyuy7qe/udfzdhzCm0Ksy
         mB1xt32x74mECYrpdEsK3oARItaCDKgik7uZ8FwWkGNT3KJuYRGWhQJ8/wIQSkRIF1AP
         1w4Z1P/v2irFIumHmfzPZyV9hkQKq/d4qoXH0Vso/NEDC+OwWKWIyrD1oGH6wFU4mTfQ
         Dgpg==
X-Forwarded-Encrypted: i=1; AJvYcCXmA53OQmlykydJy4caaeUoM6EjAIlA/kpVz4xNrM4IyP3dfW4z00I2bqkbCyzz2YkhLH+2RDs5VaBaYGg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVJ3tFSsevBU94pBccMnDUJFPONcFRQU6POe4e9Im7aCottHKI
	3NzqTszQMori7dTfmojbMwEJ+52glzBLv285o5VVA6S2ePQN//8o/ZRgF8Wi5ng=
X-Gm-Gg: ASbGncunx+E/XY2b725/grIUYULxEQWKaYjf4/OyRNw7yCww/PFSKdxImXJIeJ0Xqzf
	uVTHXaLVuAoS/nXSIIaYc98OFm9tz3U+rYCob0PcHw40THfznDK8X0+MCBFuDRbmbqzxO5+bth8
	3hE8IUVHjP51wiPHWNCpSSWRxqW35NI2WiyO6ucmlrHgA02htU6diRnw1NmjUzVNY2XV+T7ExYr
	RS24trbG8uxO0qeDwnsAhW4ndGBO+Ou5iLIesalMliDvnQTQV7ibUEe9h6MsDLW52PjQXAHvVuZ
	s9VOm/XW90iCy4Qs3STdYVn3umK0/MMhO+eGJTQvb0g=
X-Google-Smtp-Source: AGHT+IHxuOS3fOIpeSg2ZQzBVBzTG6yxBBL0V6EGPuazSqxHnz3g+H+9mAg1G+Wi3MNm7dm9CPQRQw==
X-Received: by 2002:a05:6000:4586:b0:39c:30d8:ef9c with SMTP id ffacd0b85a97d-39ee5b19f94mr3979472f8f.24.1744892008153;
        Thu, 17 Apr 2025 05:13:28 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf44572csm20694445f8f.90.2025.04.17.05.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:13:27 -0700 (PDT)
Date: Thu, 17 Apr 2025 14:13:25 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Peter Zijlstra <peterz@infradead.org>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Frederic Weisbecker <fweisbecker@suse.com>
Subject: Re: [PATCH v2 10/10] sched: Add deprecation warning for users of
 RT_GROUP_SCHED
Message-ID: <3sfn3j2l7wmsstzmtkxa7cyz4w3hmkdqya7nhdwrqlvfosoixv@q5wu2xluuwxf>
References: <20250310170442.504716-1-mkoutny@suse.com>
 <20250310170442.504716-11-mkoutny@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gg5h43zosnhgapna"
Content-Disposition: inline
In-Reply-To: <20250310170442.504716-11-mkoutny@suse.com>


--gg5h43zosnhgapna
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 10/10] sched: Add deprecation warning for users of
 RT_GROUP_SCHED
MIME-Version: 1.0

Hello.

On Mon, Mar 10, 2025 at 06:04:42PM +0100, Michal Koutn=FD <mkoutny@suse.com=
> wrote:
=2E..
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
=2E..
>  static int cpu_rt_runtime_write(struct cgroup_subsys_state *css,
>                                 struct cftype *cft, s64 val)
> {
> +	pr_warn_once("RT_GROUP throttling is deprecated, use global sched_rt_ru=
ntime_us and deadline tasks.\n");

I just noticed that this patch isn't picked together with the rest of
the series in tip/sched/core.
Did it slip through the cracks (as the last one) or is that intentional
for some reason?

Thanks,
Michal

--gg5h43zosnhgapna
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCaADwYwAKCRAt3Wney77B
SVbpAP9a18ps1Mlop2Kvui9Ou5OH961COs9cP3fAdWToTBZ5qAD/ZRiZn4x+NNy6
/Ijz8wkaCGsedh894qkf7S5ruXmZpw8=
=82a+
-----END PGP SIGNATURE-----

--gg5h43zosnhgapna--
