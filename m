Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F7B1C84C0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 18:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743618536; cv=none; b=F3AObRw2PIRT8P6YAlLX/RqBZqOtM0xSmAk3pv5ewMl3+duE0baqRm3VKleUBADKjTMdb60NaJ8gECQExRhSoGhEpy2qLlfj/msvKqhRs7u5wm5vFaslwd0ncJQkvTWVqBhWdEkT7O8vsgCkuxxUN//8usFHteHTzyF5t3Lw9Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743618536; c=relaxed/simple;
	bh=D3m5WoVt0h/8wkwTuJYrj8u9HKSDTlsX+T9QXbwiNP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pq+LfINE1O4jmestFeJ9GI3B2pf+tfu8TECMO2hvNOjPYxFi5aeb2yURNpaDsSXBa+XbrJdmrljK5kG/D8pk4KGqigUvhdBy6ZBmSO2+wdAhFA/HiyDDNZ2xwheFaF3gtG3ZxPaIWVbRRc0ITIImOad7nXoolbM42djbLZSNHNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=QttT0U/t; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="QttT0U/t"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e3978c00a5aso76453276.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 11:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1743618532; x=1744223332; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3m5WoVt0h/8wkwTuJYrj8u9HKSDTlsX+T9QXbwiNP8=;
        b=QttT0U/tgZ2RcKzvg9upsB6tlV8UjxTlJ7sIc3ekFpxKwkLqbGZWucobtggxfmi8yz
         VAVzTWCZ0CO+Tige88YmNL7uawgDdB7RZr9/Y+CH0UCIatx5bsUf0YZgq4oGwLjrpPln
         2tfJloeA/rXFCEiSdbtE6R0bAUm8JI26Cb1s3kK1jq5a/OLmPESlD+jHxoNf/z7/InFf
         TBrZAjdmzXClEbmiRJugTHDHUZojPwpG4SvUbZm4BvQagJkXAK5XCySr/1KeHVVxOpYS
         Ygq+E3GH2e0gUgNDdmOfAdJpnGg5RvaQwOIZLg0LgSko2c6G+71jHA/VXVkfFfsGlAhY
         s04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743618532; x=1744223332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D3m5WoVt0h/8wkwTuJYrj8u9HKSDTlsX+T9QXbwiNP8=;
        b=GofptoVElMTds/u1GehdWTa7g6ZSBe3VFWdnl3ocU5u/QbSECkYAbFKFU0A2bi42jC
         oWWvEks4ssXSPPyituH8lkynk6cOnQf4ywIBU4De9VJXSKW2+UBZQTztOzXodnOuLl0I
         ud4/PvKCn+5pzB+XAzwcN/IjYc28/ZGaPLIXUoyw9Z2/C+L3NRO+akl/xb4AHbf7z626
         v41IzG6Mbiq02jaLWoIdVy5fwAskh+8eLquyfIgUcL/G0fCvIhv9JQkbjYnkDefJRhGT
         Z+KyBY65t+/KZNXW1jdk4Eh7dOIIf6GrRm4LyZUphDYGK2+GShl02PcMaqjpRQmZTwlP
         DNCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd5DQoTZjgH2hpC87CCix+5/qi6ZZXI6wT6jMGlSmG4XCN/SeU6e1KrCMFr82dmEXxqiQ1GjBj2vK+ERo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdUQDkfzh1D1VBJJ6JO7NxEnL34lfIfAox9S62yfx4H4jKHg9Q
	Zr4UJ07u9WTwCI+YH/ZPLehOW76V5ZDpNeOho6qjI/QnNqfpPwRIctHL7qb/NUYxCBZgsWfR1BQ
	SFr1jGGreS8Y23Sv57mt/YyAM2rGCMfvoQ6A2iojHX4ZpDgY=
X-Gm-Gg: ASbGncuXNGn0qYu3u3SgsNFX2yy+rnlz9BjY3j5zreTNoNpUn/NhNHPq+5aKkj6rCrz
	a51B9ww1WcyHcQktHtJgkly1zjWOLnOc19OjcFw66iwdbV2+fZzq14hZolNjLnqEXcL+26caT1c
	CTZMtO2qVOltBXIq1qOEFHo2NKtQ==
X-Google-Smtp-Source: AGHT+IHnExvPdDbkaYXl6TfzQuj2zh7liH916FifwMkueNLtDrglF+QixKyEuVLYWMHZBQP9nMP76oqS/6aEZzpPBHw=
X-Received: by 2002:a05:690c:6986:b0:703:c3b4:45d7 with SMTP id
 00721157ae682-703c3b44963mr40875207b3.28.1743618532599; Wed, 02 Apr 2025
 11:28:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2a4f2c24-62a8-4627-88c0-776c0e005163@redhat.com>
 <20250401124018.4763-1-mowenroot@163.com> <20250402093609.GK214849@horms.kernel.org>
In-Reply-To: <20250402093609.GK214849@horms.kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 2 Apr 2025 14:28:40 -0400
X-Gm-Features: ATxdqUGTOorUCYsRGQ4r2FDIOcagFPztRxz3oaDvDqEej0LSOzdzpbCppUGWWfU
Message-ID: <CAHC9VhQAdxADGrqEDH4kUuoXsUS_E92UtTDcf+uF7J=QavkP3g@mail.gmail.com>
Subject: Re: [PATCH v3] netlabel: Fix NULL pointer exception caused by CALIPSO
 on IPv4 sockets
To: Simon Horman <horms@kernel.org>
Cc: Debin Zhu <mowenroot@163.com>, pabeni@redhat.com, 1985755126@qq.com, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 5:36=E2=80=AFAM Simon Horman <horms@kernel.org> wrot=
e:
> On Tue, Apr 01, 2025 at 08:40:18PM +0800, Debin Zhu wrote:
> > When calling netlbl_conn_setattr(), addr->sa_family is used
> > to determine the function behavior. If sk is an IPv4 socket,
> > but the connect function is called with an IPv6 address,
> > the function calipso_sock_setattr() is triggered.
> > Inside this function, the following code is executed:
> >
> > sk_fullsock(__sk) ? inet_sk(__sk)->pinet6 : NULL;
> >
> > Since sk is an IPv4 socket, pinet6 is NULL, leading to a
> > null pointer dereference.
> >
> > This patch fixes the issue by checking if inet6_sk(sk)
> > returns a NULL pointer before accessing pinet6.
> >
> > Fixes: ceba1832b1b2("calipso: Set the calipso socket label to match the=
 secattr.")
>
> There is probably no need to repost for this, but
> there is a missing space in the Fixes tag. It should be like this:
>
> Fixes: ceba1832b1b2 ("calipso: Set the calipso socket label to match the =
secattr.")

Thanks.

Not sure if the netdev folks are going to pick this up or if I'll end
up taking it, but if I end up taking it I'll update the tag while
merging.

> > Signed-off-by: Debin Zhu <mowenroot@163.com>
> > Signed-off-by: Bitao Ouyang <1985755126@qq.com>
> > Acked-by: Paul Moore <paul@paul-moore.com>

--=20
paul-moore.com
