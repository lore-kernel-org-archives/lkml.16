Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B5A254B0A
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 15:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739287454; cv=none; b=lh22GcNR0YveFzAnhssa1ctL53cd+6XaPNqXJ9DVHzCGQT8Eu7GrBtXF/twJLSQJWqMpBs1mfuD0Bg6y878TmWxWF3APdIG63nr2vZXH44IZp9a0BEQiVt3bNW18mXlL4YrmNlMJicMXBGe2sBR5ObOynDr51xlxZ2lE4iVMmH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739287454; c=relaxed/simple;
	bh=jdMdgLerobsP+yMcSdARJ6BtI8zGEUAwkq9ZKb+/l68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eO159uVIFbASBKop7tp6lQSor82xKpE3DqvSNDSJWPUWPkYvVKzzLO/rhMCtZ4zfCUKQDMQZLg7GYXb10FOavD6t68nBMapCbigPAJZpn6BG3ISQYHVVGurxHI5ZQl9tCPXFm89SqbT0yJSYQYJoV/QBeibtPo69Z7iRVMV5hiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=H319oK41; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="H319oK41"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5de5e3729ecso6487529a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 07:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739287449; x=1739892249; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NBvU4Dm8bwzLR9Wj8jIUktjjWFEcu/PHjQzCficyKJE=;
        b=H319oK41WqIiB3iRZc10DwubNF8cPsHZCoAU9H9l2gGcIX++SEErgJk47fZWBuMBFC
         IqBas9xi/IpQv0Ox106bjQpUoPYzeYhBRuaYr/xMZET/aAx42kcUa+ef2m4Ols0Qcvct
         Edf8cyBG2ZDhbS1Fty0NdRZ1rCsjVdENc00qpa95QV5CUrWAQg9aWN7+wqj2xYlz1x/G
         JddRrrlmrVUQvlhOctZEBEanWj9fSSaVXqprrGf6afTAoyaB3SuXpHD/KK12EgOTIJ9T
         ckpcL70djZvyuf3SXQdiMZXCf+Yy+wdBsy76uKMPlg19vxRZs/OC7fdSq1EsLu8AU9Hi
         ZE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739287449; x=1739892249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NBvU4Dm8bwzLR9Wj8jIUktjjWFEcu/PHjQzCficyKJE=;
        b=RR9pCN9D13MFfT/zppjYCl0c79dl1ckZ4kvLNyNzcJqgMeuUae2zoZenSOSO+eYkoq
         j3Y8UR07fiP57nHfcTW6Z8XnLohbLrOjM03HmIfwFxwTj6LyeRLjjhDseVcz+87vkkoD
         xJ0nJkqvxLV04ht9az2RewGgeagOk5rblg6UP5P0Al/dZzTLmHEej8x6IuYPO8v7Fwl4
         MwFEng18OKqnSNJopAG2PCjO0U3ZxA8JQT8d5aw4Zp70JGXUTS7a6H6ErueO7fE9NX16
         0/4Dhqyo+PRKwtfxwiewOYEIUwghhpSn4F4KE+L92DKu3qC5o3+zG94ztqDz+WcmINni
         UlzA==
X-Forwarded-Encrypted: i=1; AJvYcCU+XCj19EtlGc2SptU4Nv+eGgPciMdHkvzsYS24Uic5P5cddAHJ/Pp8VcilXJ2EHburD0kUSRJ9SXr4ydg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXH0+IaIqoFs/jieFC93xnRRdlbFK3HEd9vKIPp7LtaEYDgtla
	512o0W+PA0nyc23xLtrONfsnABdktUyYhJMpIYa4y6dfVyDgLxayJLXcUmNcJtc=
X-Gm-Gg: ASbGncvo6dtk9OpEWMMTfVbKTQWVi9t2Yja1cSMNnms+n2XyW32tzXWugF6J0IkfYFR
	ogC6wYkuxPNdD8xxiczIiFszZmuyZDcWt8zU1r3+7tEFdMidIjFSCJ/BSWEJrCtyLHV1ztTYeaJ
	HH/GTOWyxo4JeRKpp4w3o3avmAtUpCg7oRJmaLliHeiC3P+vuve3Aph0x8ZsgOIZw6d/CBEqC9r
	bfOdCzvTMxs0cIafOsJeE+iRc9/cEJE0Yj/SwUzSvWm2VJ/V4Dv5OrwBY6H3k2n5Ux6MZhPj6Yn
	Ijv09mAn5NLrnSdrVw==
X-Google-Smtp-Source: AGHT+IERX4U02RBjjELzamqHtVUVOA9PKYON51fVOHE8xRaV3mjjYDHIg8FH5jXIOBBQliZ9fehckw==
X-Received: by 2002:a05:6402:4605:b0:5de:6bc2:7bb with SMTP id 4fb4d7f45d1cf-5de9a3dc37amr3981363a12.17.1739287449386;
        Tue, 11 Feb 2025 07:24:09 -0800 (PST)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de4e6d60bbsm7856667a12.15.2025.02.11.07.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 07:24:09 -0800 (PST)
Date: Tue, 11 Feb 2025 16:24:07 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Christian Brauner <christian@brauner.io>, 
	Shuah Khan <shuah@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, pedro.falcato@gmail.com, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Oliver Sang <oliver.sang@intel.com>, John Hubbard <jhubbard@nvidia.com>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v7 1/6] pidfd: add PIDFD_SELF* sentinels to refer to own
 thread/process
Message-ID: <gij5nh63s73dj5u33uvzl5lbmsvoh6zr5xnqpnfltwi6aamy7j@47iop2wgtdac>
References: <cover.1738268370.git.lorenzo.stoakes@oracle.com>
 <24315a16a3d01a548dd45c7515f7d51c767e954e.1738268370.git.lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s774j6juqpksx26a"
Content-Disposition: inline
In-Reply-To: <24315a16a3d01a548dd45c7515f7d51c767e954e.1738268370.git.lorenzo.stoakes@oracle.com>


--s774j6juqpksx26a
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 1/6] pidfd: add PIDFD_SELF* sentinels to refer to own
 thread/process
MIME-Version: 1.0

On Thu, Jan 30, 2025 at 08:40:26PM +0000, Lorenzo Stoakes <lorenzo.stoakes@=
oracle.com> wrote:
>=20
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  include/uapi/linux/pidfd.h |  24 +++++++++
>  kernel/pid.c               |  24 +++++++--
>  kernel/signal.c            | 106 ++++++++++++++++++++++---------------
>  3 files changed, 107 insertions(+), 47 deletions(-)

Practical idea, thanks.

> diff --git a/include/uapi/linux/pidfd.h b/include/uapi/linux/pidfd.h
> + * To cut the Gideon knot, for internal kernel usage, we refer to

A nit
https://en.wikipedia.org/wiki/Gordian_Knot

(if still applicable)

Michal

--s774j6juqpksx26a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ6trlAAKCRAt3Wney77B
SacWAPwM6cjj3sPJP6MuZliNrQSB1iRXPL96jf7fhryBBezaDgEAzpQV4pbefEW3
T3w/EV38bXlaUQpqVL+5QFF3BmA2uwg=
=WNsn
-----END PGP SIGNATURE-----

--s774j6juqpksx26a--
