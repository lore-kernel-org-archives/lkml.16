Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117FB1917F9;
	Fri,  2 May 2025 02:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746151364; cv=none; b=u3BibROgzng/smbH6CZO4Yu4AXMtL4BZnftasuYoa/+3aK28zPK6gw/Wa/OqgeCZrHrQBKD2UneyqjW18bNIMSRDmR87s2NKTT79dRfpHUtESdA5PpZE/4sPqjxLTEzIe4WNBSgOlsQNNFXyxZoZ/Tcik+iInukIgcVGGuDtyB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746151364; c=relaxed/simple;
	bh=qmxwRpsfyJ9UgETzVHghhTdLypACBqDGmSKsIDGu+Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSHKXP8DEf3yNgpg+Y2rKd9I9BHSF2Sm5N5ibigv8qw7A0clMMTfdTlH5vVjvqGIzfIY5a7T9qwb2wwnMgmWeQ99XT/Ed8nkB/vVf1ldrg6l8NyxavMGxKx0wLzdmh370Wyv8UuwDpPfQx4YYXzKvpmZmVKBrLDdeeBA4Pnn5oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VOP8xp0b; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VOP8xp0b"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22c33677183so17283575ad.2;
        Thu, 01 May 2025 19:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746151361; x=1746756161; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hQLz71BxI1qKeyKSbMaDBKwqW7bvuX7HjIO1mGm9HJc=;
        b=VOP8xp0b6TIFPgwcQoW4/7bN1dubXJY/wsN0jKC9nA9RKP2WBvxYjQZ+lZsfb6QPYl
         aaqNncW1Uot+ftKBxvnfAFdJaCkIy1nrQtrmyXyZbwS9GvWX4o6EtiOlugvSSwNjuMCs
         z6TctjIKcEwfz+onTbofa9ryDBHpEX+LylByAbNJarMcDIyO7oYvODyH5TRUCcv67Zqd
         qIqHOIqkCK/nsL2i7GZlB9s2SRF9OmSEHdaSbf+43WXpEaFDrDKHBYMn9XWomvD1KREV
         HTSNEUbG0FAp5mYFmuCxqvvPtvLnaTC+E1k8WmuVANuEfR0YuZZUwKoyeJ+dFrVsd+5s
         vM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746151361; x=1746756161;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQLz71BxI1qKeyKSbMaDBKwqW7bvuX7HjIO1mGm9HJc=;
        b=uwQ8ZuaSeOAZWCiqYi9IVk4SGa+rVN6OJa0wQLH4lFwBH7v+jVvdaBMQotIK+lMrP/
         8wxSXzRDiSVwBsOQQJNugTeuGBeeaeixdH+rWAA3do0SKYK7jJfMGfLe3t6vl33RwElg
         YTfeXJ3wocAqyr9ayFAHC+JFcTIAIyNHu30R+KijmqjSV8+rGqVd63UVfMv02YExcHCt
         STHEzQvr+khuf4DKMDN53UQZWgsPGjFvl0TdFHYKbDjOgFSUTGecmvq4MrYSrUSX77qe
         whTf0+n9s5mhiEOb/jSNg9gwyC4rVVZRdjulN/UhFwGO2XNgvsgmrrbeIZklA62NSs6W
         ojbg==
X-Forwarded-Encrypted: i=1; AJvYcCU/w7xtLwt0HyI7lkJHSc+XjENIxW2W71FpQZBKLy8hnO7bRtDfCdjyDY4YFnHj1l6GFcwegDqigBU=@vger.kernel.org, AJvYcCVDAAovSpdnWpldHjriBiCfeREKAhAb4++mmsNP+KHQtH5SChD3G7ghqlHtnRYMq9BWk5ByQpnmVj8YjccL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8VTzg6f2SwElU8LAdol/dIPYzqejFBmBlU27K6fuKUOC9UF4t
	lN1E0dlnkfx00nnITiTWUZOOkNnn5PqZCtYM/GvstVKYevB0T9/s
X-Gm-Gg: ASbGncvgPc9Qk6Ut0q2JtvWr9u8VTtvSRGM5yZWLVBHicQEODP+CzmZFDvDzbzAmypO
	4r2xNpsm0LN9walL/abeekVZbs9g3dF5A32oqVCt01b9k/+JkSX21wHBRTWbKI+C/yD/Y/uz8N+
	43e3AWYAw7SBysg7Z2zq3lU1tcvRrMPFHMKE5vwQGGrXUldEptUUG1k++Jn92Al3w5Lrh/D1XJn
	i9z6+6AebZ/LHlG/9yI5FWLNOKA6/DAXam4AicqG+iuYGuaacLgzs9YeDAzJYk+VsaUTcK12rN2
	gjJKkBFaqbDSehICJRUjztv02zUc16h5Ev3lLRFv
X-Google-Smtp-Source: AGHT+IH0fsdC1bCr15DovwTI0EksenohhXN/f1+YBOb+3aG0ZeZk4BMewoX63h4/1Sl4t+GkIQV5jA==
X-Received: by 2002:a17:903:110e:b0:223:5a6e:b2c with SMTP id d9443c01a7336-22e1033c72emr18934005ad.17.1746151360826;
        Thu, 01 May 2025 19:02:40 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e10915336sm3202065ad.184.2025.05.01.19.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 19:02:39 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 2E7A6420A6AB; Fri, 02 May 2025 09:02:34 +0700 (WIB)
Date: Fri, 2 May 2025 09:02:34 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Swapnil Sapkal <swapnil.sapkal@amd.com>, peterz@infradead.org,
	corbet@lwn.net
Cc: kprateek.nayak@amd.com, gautham.shenoy@amd.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: Re: [PATCH] docs/sched: Make the sched-stats documentation consistent
Message-ID: <aBQnuv9JLOHYayiu@archie.me>
References: <20250430062559.1188661-1-swapnil.sapkal@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/od7DRmGf10ovHP8"
Content-Disposition: inline
In-Reply-To: <20250430062559.1188661-1-swapnil.sapkal@amd.com>


--/od7DRmGf10ovHP8
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
                           s/cache-hot/hot-cached/ maybe?
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

The rest looks good.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--/od7DRmGf10ovHP8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaBQnsgAKCRD2uYlJVVFO
o1rmAQDY0wSps+OAkgB92W+IbP6KI4uHCEIkIVei2Wa6jquAwgEAjt5TuNUNn9AO
PDlCbsEHAM9tsu+BlI8yjTRiJsz8MAk=
=PfTb
-----END PGP SIGNATURE-----

--/od7DRmGf10ovHP8--
