Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2A01DE4E6;
	Fri,  2 May 2025 07:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746172187; cv=none; b=Xgo0PfHPtrMgk5vBm35GPZnweRCV16btCfZXu1AnmvZc5urwii1f99+n4SIuWWBdwIBCCQmTz64TOmszjIY5WAcTEUPsqoGEkuaSXDxOnXvfsGsK4c5ESWo44X42ZV8gx4Q27yDbdpq9AfvOoSx8b7c+DiwYdQBQRl0MpvOywjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746172187; c=relaxed/simple;
	bh=o5gSQje4Y+mu4L+6ke4nM/194PCfXVpCu14D4bT7yVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y6imgSPCbmirUojLfnISKlbEf9bzRs+F6yS/Su3ib0tlC67Fk8FZtgyEZDIsUqhSFSJjeG9eAfPOHtScHYi+wS1BxxtBshTJTTe+6rn4qj/bfq9f2w/pv6UKR//VlfiZkALgvyZK+c/913QvXJR94C9ZDeofPMSvtPvk7NJwFXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fD9T6HDo; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fD9T6HDo"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-736e52948ebso2285702b3a.1;
        Fri, 02 May 2025 00:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746172185; x=1746776985; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AzzJ2mwmeJGHY4ioykKRI/8ZtKwwBuIJTZhkzuibLaE=;
        b=fD9T6HDoHuAUnU6lrlAMBTHSgrcID8+Rzd9fN1HGzi2HmWI0AU730TQ047AgTGs5h1
         sTmufdYcXQ3WGEAcXjf8IpEJa+1VokzokueYbKekdCwDbE+dnzkuRu2L2aVqP7+81kbA
         TXgV1Bf7c0lheGMiVzOyBm902h0bbr9OB/ZQTwkzwm2eSZZxAEmo7LuMAHdnR/D0EmTI
         9ZM5pU0EVw2cFI+++bvFvv3S3IRAEr35D3dHawZ0gtSK1SwlSaqhnQmG55GpAKfouCRe
         lOjwCvhmq2qnkgXu1Je0no1XsS8FvD4ONSP/N9v1sL/pgCa5yNlagGievu6nYymB3Erv
         HV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746172185; x=1746776985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AzzJ2mwmeJGHY4ioykKRI/8ZtKwwBuIJTZhkzuibLaE=;
        b=AaJtAmSOktiz0mpntR9Bag+6VO9AGUeBY3n1fKaBPAiLfmgSxR3HWXSI+TIly13vEx
         srARBwEb9jbV/K1yWbrJFm81R8m9EELjdD00F2rNk+mr6zJRQWucRyIo9IhuRY6mg68l
         NbXJKp2nkKjbve0gGJllIv0iNPeOgm19yuFmey94ogX1irkNB323wTYknc78uqeM+DFc
         ioYmtbt15HyNlSCJM7vXVzsvdYX0VbDQgyMyFGiGGCZR6ycu3Hv9VVZkFa4E2EC82aq2
         NUuCy9E8GHpHOpPfXob2tk0cYORth/97XethJxIDqnsvuGWjHreR66FK2cDq1380WpZI
         KbSg==
X-Forwarded-Encrypted: i=1; AJvYcCVRnDpxUHpFsdRNphYRJzbecLrly+gECKNLKlnUb9/v9x3r013YjlkGvuqMiSmqMtexCjuDcs9IfFE=@vger.kernel.org, AJvYcCX8XSkD4/sfdMQHs7lwn+VptgLxma6/OuisVSNjO/yPixSvvjBdo54BPG3YE36cuBgRYPE/wbTQtFkESxVz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0W5AfPuo3NPqU+sPsF18LPxmit1SxrPUhvqEabZIBkGi7mwl6
	GvCAyFPu/sJda1E62+l2FDnID2azEtCzNnL0g+UgADMkmx8mBKrKaOy71w==
X-Gm-Gg: ASbGnctqbzSETTUeVrAFHpQZmmlzeJFUJA6binhaiPKb1na5cSxKcxDbdi6izK+2xGT
	BxXhIjI71csr3I4WxGbsZT8XT5g0cHtibtVAym2ZjtkI/VJnLBXqVuB/exTVpToI1VqYnt6gDd8
	IjGKoyRA0ApFnXfANL7P5uofjgnIDmq5w7Fu5VWs/Cwcev4KJqZaF6Z7Jqhuawr5d5jOupaziwC
	dsCpiojVaQ/2dSmipS2dUaO5c5KoKn1tZOq4mdmMqv9A72N1cpnOkZ35FtyeJm0gRh/2HFH8Ct2
	P0TVSOZ/pxZanYhuyM3wI/7oPs1C2glM2pcuh+1c
X-Google-Smtp-Source: AGHT+IHoafilKSMg6oQYkCchR2ZWjqE81/BpCUb5hHit37M11UCUEseXQA29GQdjLzaIhm3aGRLtuA==
X-Received: by 2002:a05:6a00:340c:b0:736:a8db:93b4 with SMTP id d2e1a72fcca58-7405890a9f3mr2851356b3a.2.1746172184557;
        Fri, 02 May 2025 00:49:44 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dbb804sm940553b3a.52.2025.05.02.00.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 00:49:43 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id E238E420A6AB; Fri, 02 May 2025 14:49:40 +0700 (WIB)
Date: Fri, 2 May 2025 14:49:40 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Swapnil Sapkal <swapnil.sapkal@amd.com>, peterz@infradead.org,
	corbet@lwn.net
Cc: kprateek.nayak@amd.com, gautham.shenoy@amd.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: Re: [PATCH] docs/sched: Make the sched-stats documentation consistent
Message-ID: <aBR5FLEq66tuoEXm@archie.me>
References: <20250430062559.1188661-1-swapnil.sapkal@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eU9GqSvzh0dpF/EK"
Content-Disposition: inline
In-Reply-To: <20250430062559.1188661-1-swapnil.sapkal@amd.com>


--eU9GqSvzh0dpF/EK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 06:25:59AM +0000, Swapnil Sapkal wrote:
> diff --git a/Documentation/scheduler/sched-stats.rst b/Documentation/sche=
duler/sched-stats.rst
> index 08b6bc9a315c..ad68cf1c99e1 100644
> --- a/Documentation/scheduler/sched-stats.rst
> +++ b/Documentation/scheduler/sched-stats.rst
> @@ -86,13 +86,16 @@ Domain statistics
>  -----------------
>  One of these is produced per domain for each cpu described. (Note that if
>  CONFIG_SMP is not defined, *no* domains are utilized and these lines
> -will not appear in the output. <name> is an extension to the domain field
> -that prints the name of the corresponding sched domain. It can appear in
> -schedstat version 17 and above.
> +will not appear in the output.)
> =20
>  domain<N> <name> <cpumask> 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 =
19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 =
44 45
> =20
> -The first field is a bit mask indicating what cpus this domain operates =
over.
> +The <name> field prints the name of the sched domain and is only support=
ed
> +with schedstat version >=3D 17. On previous versions, <cpumask> is the f=
irst
> +field.
> +
> +The <cpumask> field is a bit mask indicating what cpus this domain opera=
tes
> +over.
> =20
>  The next 33 are a variety of sched_balance_rq() statistics in grouped in=
to types
>  of idleness (busy, idle and newly idle):
> @@ -103,12 +106,13 @@ of idleness (busy, idle and newly idle):
>          load did not require balancing when busy
>      3)  # of times in this domain sched_balance_rq() tried to move one or
>          more tasks and failed, when the cpu was busy
> -    4)  Total imbalance in load when the cpu was busy
> -    5)  Total imbalance in utilization when the cpu was busy
> -    6)  Total imbalance in number of tasks when the cpu was busy
> -    7)  Total imbalance due to misfit tasks when the cpu was busy
> -    8)  # of times in this domain pull_task() was called when busy
> -    9)  # of times in this domain pull_task() was called even though the
> +    4)  Total imbalance in load in this domain when the cpu was busy
> +    5)  Total imbalance in utilization in this domain when the cpu was b=
usy
> +    6)  Total imbalance in number of tasks in this domain when the cpu w=
as busy
> +    7)  Total imbalance due to misfit tasks in this domain when the cpu =
was
> +        busy
> +    8)  # of times in this domain detach_task() was called when busy
> +    9)  # of times in this domain detach_task() was called even though t=
he
>          target task was cache-hot when busy
>      10) # of times in this domain sched_balance_rq() was called but did =
not
>          find a busier queue while the cpu was busy
> @@ -121,13 +125,14 @@ of idleness (busy, idle and newly idle):
>          the load did not require balancing when the cpu was idle
>      14) # of times in this domain sched_balance_rq() tried to move one or
>          more tasks and failed, when the cpu was idle
> -    15) Total imbalance in load when the cpu was idle
> -    16) Total imbalance in utilization when the cpu was idle
> -    17) Total imbalance in number of tasks when the cpu was idle
> -    18) Total imbalance due to misfit tasks when the cpu was idle
> -    19) # of times in this domain pull_task() was called when the cpu
> +    15) Total imbalance in load in this domain when the cpu was idle
> +    16) Total imbalance in utilization in this domain when the cpu was i=
dle
> +    17) Total imbalance in number of tasks in this domain when the cpu w=
as idle
> +    18) Total imbalance due to misfit tasks in this domain when the cpu =
was
> +        idle
> +    19) # of times in this domain detach_task() was called when the cpu
>          was idle
> -    20) # of times in this domain pull_task() was called even though
> +    20) # of times in this domain detach_task() was called even though
>          the target task was cache-hot when idle
>      21) # of times in this domain sched_balance_rq() was called but did
>          not find a busier queue while the cpu was idle
> @@ -140,12 +145,16 @@ of idleness (busy, idle and newly idle):
>          load did not require balancing when the cpu was just becoming id=
le
>      25) # of times in this domain sched_balance_rq() tried to move one o=
r more
>          tasks and failed, when the cpu was just becoming idle
> -    26) Total imbalance in load when the cpu was just becoming idle
> -    27) Total imbalance in utilization when the cpu was just becoming id=
le
> -    28) Total imbalance in number of tasks when the cpu was just becomin=
g idle
> -    29) Total imbalance due to misfit tasks when the cpu was just becomi=
ng idle
> -    30) # of times in this domain pull_task() was called when newly idle
> -    31) # of times in this domain pull_task() was called even though the
> +    26) Total imbalance in load in this domain when the cpu was just bec=
oming
> +        idle
> +    27) Total imbalance in utilization in this domain when the cpu was j=
ust
> +        becoming idle
> +    28) Total imbalance in number of tasks in this domain when the cpu w=
as just
> +        becoming idle
> +    29) Total imbalance due to misfit tasks in this domain when the cpu =
was
> +        just becoming idle
> +    30) # of times in this domain detach_task() was called when newly id=
le
> +    31) # of times in this domain detach_task() was called even though t=
he
>          target task was cache-hot when just becoming idle
>      32) # of times in this domain sched_balance_rq() was called but did =
not
>          find a busier queue while the cpu was just becoming idle

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--eU9GqSvzh0dpF/EK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaBR5FAAKCRD2uYlJVVFO
o3QKAP9Ge618P+KuauhJsx9azoMfO8C5B5lg83PuMsjz8bf2MwEA/zQ4GFbbCd+S
ET6fGkbkSSOLFEmm5ZFvbAFPfaaCgQw=
=TxDO
-----END PGP SIGNATURE-----

--eU9GqSvzh0dpF/EK--
