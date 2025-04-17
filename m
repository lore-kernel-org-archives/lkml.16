Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB96F226CF1
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744881541; cv=none; b=NAfUGLhTcRtPNs1eSug2+UjCtqWNa2cG/9f1trCsTpRvnQCpstChSysTCCLeUvyFb8lggTzaYnAfVmZ2ViTrMQMqXjVkeZ6I1XDa3f2dzbqh3yvawgTqNNMWs+k6ww6Jr6W8PecIAR79Dmw7Q8uuZljats8Jgrj7eXYedv+mllw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744881541; c=relaxed/simple;
	bh=rPWwFdaXqE/AILRQDnfw+JUbkcYsqI7EzlaUzZcjtEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o/IUjSXIn3zze6+S3XzvmdPvU7KAHA0wc2bmL2hPD91xvISonYb7EdBolNJRbvh8mXUC7bG49fPlfFRdulpjhjjPC3H2oBPeoXIkRCognNr6kRTP9zARD7BTxrROzOU9Xq9hQYMvrJPr0m2wLio1xbzvoY7AjIqJnWqEil/tB50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UIutXDKY; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UIutXDKY"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c31e4c3e5so369134f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 02:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744881538; x=1745486338; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sNxEv9tO9qIHcy69dAwzXZp+t1x6DTKUOs23pJiw3Qc=;
        b=UIutXDKYRA7yZ7e3hnfyMR3WXynkdmCxXT1EVjhIBROldGB9ViWfAdEkksugGoMb+v
         EwKWO7Bf6f4gIzNv7W614s32KwQm/5wn4Lm3HgUOq5o1i+LKCFJYbDQaB2UbocUvUddH
         N5tFf+7D/2XGLie3SdID5EE8aFKywAlFRpBTKB58IBVUTTzPeakxeqzgeFZ4F03XpNPm
         HrkMssqi4kgk9gLLysR+uJUD8KBJTFgGU4UEk4PZYTzJW9ajwuFjwVDBPb2ZSXx3Vwcj
         jZp2yhcTdjpM6Ixo7CFkXjoLHjcCAT7K0LdE/QUxEZuBNrZJ81egGXq1hV4oXaQsUWnL
         0DUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744881538; x=1745486338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNxEv9tO9qIHcy69dAwzXZp+t1x6DTKUOs23pJiw3Qc=;
        b=Q/7YMfrpxUN34UaT5eKnv/d+LbsVeFGTrzJPLgNd1NkaNo62Bw/GYbzvC0GjT+NwvL
         4WG9CimiaNstKa1c7HJOBGKHOnZ8P8jaiKUrzgOMWX2HTVT7P7WpqSlCzjG8crb9FzQh
         hzOccItQ6pruM7jI3KlvcqEup8K8CjL4FUNj0Kkv6KF9Dzwx09oXtspOcQUJnxJ+YHsp
         3G3Jr5IHbEQ4P2ATtO/BZxUJdJuqhz/4RrLJICKD538eccUyxUwO7rORGezPbJ4zvZ92
         1nXucOSzh6aUM0aZpF9wCvXHoeMrVRUcfyY9rpIcQE20Q+hCGCcVXPzmPvrobY+X5RS2
         U3wQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfxnXOHeiGzCk4Rjrf3m7zcnjbLG8N58Wn8ruCQXYJUc+P1gaigEoYAICuvpi3bRNbyCRUYknXoVbiuHY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkywiC5e5OLBNCbnqW4WQ6wpwQqUALBJLoRtTZAIm/DNxL4FuT
	CaW3aOPgC3MCTJclu2NEsSWHkjJu/0BPJn1QgfsbCngUSn990qOA402qS7YniaI=
X-Gm-Gg: ASbGncumPOiFVQu0el18G6OuYZmHiWSWqlOYEEfvqnR6Dx9TiKhdyC36B69YTwM6oYs
	nL2c9CtUvwQ/g0GdO4EiG2j0RLS09kTgSujhDCrG9lhan2OErpXOQPdNAbApwU3QJTn31KbsytU
	5q68DhwlUFOY2DJc5UvYTnCzVgYCXmTKLtVK60y0X3KeJ4XjhwV2mvx6YDevtSGxGouzz6TUNGV
	H8pDtRkooiB6K21COlkHM/+uLwXl6JPWvC9khfnwBoeP/ni3Midkq5rlHLm+HlZ/d9hqdWnODN1
	dMzMhtNyp3u2ZiiiArrn5k34ehUh6qyqZWTBEmYG7mduEWUWTWSExw==
X-Google-Smtp-Source: AGHT+IE+lNVzc+JtkTRzHTVV4KBhVKi5P/u9VhXrhgXWTgt3BfhLfXCGGp1bz75na5Lj7vjorRqecw==
X-Received: by 2002:a05:6000:4021:b0:39c:2692:4259 with SMTP id ffacd0b85a97d-39ee5b18269mr4570589f8f.21.1744881537968;
        Thu, 17 Apr 2025 02:18:57 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96c074sm19077349f8f.28.2025.04.17.02.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 02:18:57 -0700 (PDT)
Date: Thu, 17 Apr 2025 11:18:55 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: gaoxu <gaoxu2@honor.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	"cgroups@vger.kernel.org" <cgroups@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"surenb@google.com" <surenb@google.com>, yipengxiang <yipengxiang@honor.com>
Subject: Re: [PATCH] cgroup: Fix compilation issue due to cgroup_mutex not
 being exported
Message-ID: <egk3tm2hpesqb6wwi7totjeueoyg3tewdnwt75dcksxvdgpzac@hstrl5e6ltyh>
References: <24763f5c8a13421fa6dc3672a57a7836@honor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kwivobgki5g3kkoj"
Content-Disposition: inline
In-Reply-To: <24763f5c8a13421fa6dc3672a57a7836@honor.com>


--kwivobgki5g3kkoj
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] cgroup: Fix compilation issue due to cgroup_mutex not
 being exported
MIME-Version: 1.0

Thanks, Gao.

On Thu, Apr 17, 2025 at 07:30:00AM +0000, gaoxu <gaoxu2@honor.com> wrote:
> --- a/kernel/cgroup/cgroup.c
> +++ b/kernel/cgroup/cgroup.c
> @@ -90,7 +90,7 @@
>  DEFINE_MUTEX(cgroup_mutex);
>  DEFINE_SPINLOCK(css_set_lock);
> =20
> -#ifdef CONFIG_PROVE_RCU
> +#if (defined CONFIG_PROVE_RCU || defined CONFIG_LOCKDEP)
  #if defined(CONFIG_PROVE_RCU) || defined(CONFIG_LOCKDEP)

seems more conventional wrt existing code.
But in principle

Acked-by: Michal Koutn=FD <mkoutny@suse.com>


--kwivobgki5g3kkoj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCaADHdAAKCRAt3Wney77B
STChAPwKqyP5TOaZps75D5ssU7jAWBvpo0KB2fzw1MVC3eyprwEAlHeCns1yqSzn
TRPdiKEYRKzjBiziU31l1xy6p2w6+AY=
=WZ83
-----END PGP SIGNATURE-----

--kwivobgki5g3kkoj--
