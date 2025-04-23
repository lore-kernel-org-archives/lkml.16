Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23DF21FF4B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 16:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745425502; cv=none; b=Vm1nTQa1PlL9GAvgdHad9mTrdl5HtEFDGim5jERPtc890ehYn8XEaf6cp28txGmSiCg/fTIQBgQFhy/EplPSUMjya5eC1P/wPHCrb5SdsdCjt2X2WN7k6rGDYWEFVylV8Niled1KGZXqyq/zjek/XYG1WM5cHHJ03j6mo5AQgSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745425502; c=relaxed/simple;
	bh=UZUl8ZBAi7dgPDJ8euDojEqEbT28kZCyiDvTkg397HM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EbysS96nhhjLSn0ZZf5VxypisJAK68a9KjXwWYW+oZlwY0WvZ/pWBjjtEQm8cZYju/V+45mrbTj1oFpp6FHOcdiKT8Vrg3JJW/jLsWQ55QImxtLSEeaHlQXdZ3OWy46jWNfwXIoEc1kU5f54I2Zco98HGQ2nqBz368PzxQtgHrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZgGin65T; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZgGin65T"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso2085907a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 09:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745425498; x=1746030298; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UZUl8ZBAi7dgPDJ8euDojEqEbT28kZCyiDvTkg397HM=;
        b=ZgGin65TFE2okOgAcQhR1Z/VnZyz3Kyn852b8st9m5Do4NotVzeoHzKB651HygR3qN
         Wh79BZXvne8WWyAI8hAjpd7nI3TxpqtvXVUtdQ70WNtGA6pcWRPtH2CDqn1zuYPRb1A7
         2fA2racidNG3QX6HBuJdQl7IlfG2U98IMpGZPG3rgR94eEfqcy3wBlA4TwJPss4SUIae
         XrpYIKkoGqQwa/1DmXqidyb8r4BKb2WEKZqjgpS4lR9qTfVLYlnnLQuvjmY9LBqnJCNu
         Cuq3j5lY+D0LuR4EmWC8eVpvUNL20qdifd2NKNsRMjforTd93E0z76XXN7VV9rsJHxfl
         r03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745425498; x=1746030298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZUl8ZBAi7dgPDJ8euDojEqEbT28kZCyiDvTkg397HM=;
        b=g/obhCDTI+SAVvAhBeumn1A6yM48WNR4iO4A0u9lepz1ZcFLMIQxDH55zsfrJXg+g4
         bKRiN16kPPi28OMoWGzlDIhNHEs7WnPkqnVl78ln78LHQWgk1xwc960XkCXWbA0U+lZu
         wcrTNhtmDUdr4l37+BbP2SRVZB4eXWr/Y8OcG8b0QW5lPqy1ewMbmi9IuZ10ivX6zQCR
         01mlqd9/e7onk/cNFI3eFfVOfPnBVQ8jjgGHcjqSIzZv8nYYvrgsT3in91d4fXF6eQ8d
         J8xT/NH3wJ12NHPbgvSTFeX7JAU834sjOpj8ZMOtfXNhq7LkMs0WAgwWnbuHpcCCXfah
         Vmwg==
X-Forwarded-Encrypted: i=1; AJvYcCWB5BgmoseY3BIfHEFFvi4SpWT3QMB2AQSIiA1Z4c3lgYohGv22HcJzoOflDLm6nwY5/jv+pNSQQuvH2co=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn6Z4o6019ubyWG321/eQOYO+9nIV0veGR7xt/KOdGDtOHDSL9
	P8tx7ccsdgQjb5gDt03UXfgBxAiRIaUVgYNpPV+i0FiCjl7ObuULX/2trjXog7w=
X-Gm-Gg: ASbGncsl8pCigHNRjarfc6vx5Ds2WZj8LTd0QES5pZOBH/KVapq2Ufp/mBbfyinLLsA
	e6oD6sgoGPPt7P7dbF5zgfuugwctQrDWDomK8QqUyfwDIHrZr36CQ6u7y5qBk81SzYdsNuwOx6S
	jfeW8n7BzmLi3uQcMvDvLZXEI7UIf5WiJETy9aPn2xOgkcGe50jrWMtKvWmeiCP8OQb2qgBtt6B
	OYkdBvTL1J9n/4kWAoUkkibfvN2Nzi+TNy6+OO/buF5ILPuycPnjmMuNFeFJayycanAYr9a5wLU
	Uv1Vev8xWZWl/HoZE7fKA5lh+CldR4REQmya8Boy1a+WhmZGIDYyvg==
X-Google-Smtp-Source: AGHT+IECnLr69XeqlNUPp80PbPls6iG0WXFfbfyE/BP3BoQYxLUa2ayM6cnJTYHsprF9OCroQezF1g==
X-Received: by 2002:a17:906:6a2a:b0:ac7:981d:b137 with SMTP id a640c23a62f3a-ace3f551cb3mr242155566b.22.1745425498153;
        Wed, 23 Apr 2025 09:24:58 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace3175d95esm247744766b.173.2025.04.23.09.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 09:24:57 -0700 (PDT)
Date: Wed, 23 Apr 2025 18:24:53 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: Oleg Nesterov <oleg@redhat.com>, linux-kernel@vger.kernel.org, 
	mrpre@163.com, syzbot+adcaa842b762a1762e7d@syzkaller.appspotmail.com, 
	syzbot+fab52e3459fa2f95df57@syzkaller.appspotmail.com, syzbot+0718f65353d72efaac1e@syzkaller.appspotmail.com, 
	Andrew Morton <akpm@linux-foundation.org>, Christian Brauner <brauner@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Suren Baghdasaryan <surenb@google.com>, Wei Yang <richard.weiyang@gmail.com>, 
	David Hildenbrand <david@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	Mateusz Guzik <mjguzik@gmail.com>, Joel Granados <joel.granados@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Wei Liu <wei.liu@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>
Subject: Re: [PATCH v1] pid: annotate data-races around pid_ns->pid_allocated
Message-ID: <wdnzpfz4yh3oq6ikxne2zbyvkfzdvy7cuxeepwvoifff3esinf@4gct3653ajfh>
References: <20250423115542.7081-1-jiayuan.chen@linux.dev>
 <20250423135101.GA28646@redhat.com>
 <25a402bb9ddfecba22b5b24684d950494fc7410d@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6wgikdkq7qdwujcq"
Content-Disposition: inline
In-Reply-To: <25a402bb9ddfecba22b5b24684d950494fc7410d@linux.dev>


--6wgikdkq7qdwujcq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] pid: annotate data-races around pid_ns->pid_allocated
MIME-Version: 1.0

On Wed, Apr 23, 2025 at 02:33:37PM +0000, Jiayuan Chen <jiayuan.chen@linux.=
dev> wrote:
> However, not all places that read/write pid_allocated are locked,
> for example:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/t=
ree/kernel/pid_namespace.c#n271
> https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/t=
ree/kernel/fork.c#n2602
>=20
> So, in fact, the pidmap_lock is not effective. And if we were to add locks
> to all these places, it would be too heavy.
>=20
> There's no actual impact on usage without locks, so I think it might be m=
ore
> suitable to add these macros, KASAN can recognize READ_ONCE and WRITE_ONCE
> and suppress warnings.

Wouldn't it be nicer to add data_race() to mark those places where the
race (presumably) doesn't matter? (Instead of _ONCE'ing places that are
under the lock.)

0.02=E2=82=AC,
Michal

--6wgikdkq7qdwujcq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCaAkUUwAKCRAt3Wney77B
SRzrAPwNBW5fqlMeeGRKV+wfM8cG+K0kq+NR8THRMlrvm5brmQD/RIEqRredSJRl
2GL2A12ahk8xF0yMJStXp4zIwpFakws=
=UmVZ
-----END PGP SIGNATURE-----

--6wgikdkq7qdwujcq--
