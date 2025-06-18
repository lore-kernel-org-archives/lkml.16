Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0037D2192F9
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 22:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750286301; cv=none; b=CK3/gE/jyJegQYjw8sRwTJYWSf7s4TI/2FkEMi6mzM4DpnD1MhY9tIjSb1Ak6GJJBvNSzWXHlFGX11ur/7WcovdoJLP4vZjM1pHk62zhuGGTYjSs6b9KcbLfLTKjcIT8wjj9DbmSvxYexv4sjf7L4AcVnUcRozyBBvMOqvHrsTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750286301; c=relaxed/simple;
	bh=TIR41IOuSunvaJR25QNHhYWA22u3V9nnI7bWi22GJFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ddDbiMpaELWNAiT1Pbvq9As6uBY7pRfmA9hkg9RVfziTyI3FgIwaRQj2GvOLpQMC3Gtrj0RVh5yzPpr2JqsaxsyJQuPruQ5Zo8Txy5FUkBOuC3AtHa8xZnwg7cphi3/Jr8n9UqbCnrkPf2NDKj41/63q/8Kr66eOhi4Zs7DwZrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kVxxHkCq; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kVxxHkCq"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-528ce9730cfso41188e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 15:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750286299; x=1750891099; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsHGAv3KLKvTQx3+E9vEHRVCKTx/eVy+7jBAKLwsTFk=;
        b=kVxxHkCqXzO2khu3Ns4kF2I4i2pv1sww5VRDCwbPB9QOijZeTQI+af6tb2Mcw+fidd
         2OXMcaK6VBz3q5EFEG5r1g/c0tOtKQDjSv8hTX1GkQDoRKv/9Gc+Ozic8WqKiZw2t0oR
         CoWQ9vRg4TBKFySxXJtNMfXKQBu9BZi61pDBznlsEhNIfLGThLQLrZJc9RW5UnFoXulw
         lPaYxoYyKy/JkPvk50kn/nZYb37fKBcFBnrFXiOX7P2f8/oXaDzwrSb1hMxDuRRJERY2
         3JUBcszP8qWv6x6117BM1dNaNhnM0uSH1tmrqwFZcVbHZwSdFeNJnhE2jm6REGC3iB2w
         s8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750286299; x=1750891099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsHGAv3KLKvTQx3+E9vEHRVCKTx/eVy+7jBAKLwsTFk=;
        b=KMvy/0HHW/61YLIKeGuBRs8ZQI5fucUitZ7gqYlG5LhhEh0+rCpTewpOoXZkpyH4iP
         q/pHBWgi13MNaiMPukOCxwopTJuD73UcRg+VvYItUTgu9DL0d55mynV2rvwcpFdbAd3k
         bjvtHeMs8OsvLJ9nyIcq5yTG7pC9HAAwDsVV+kTX/Vk5ATs4BMjl/ysuaYcdZGuuApLb
         6tFsxfdQDc8MY6AUTO23ixHC/3Qo8lMpp8WSof8k1glwPmIXm37qm+o0Psr3AliQphqu
         BJff3nmqlsBw4Qq508dm8DCLQBa6/by3F5M2nVnXKNrBz6R9rBzmtRYDfgYh0gR9uE7W
         uXTA==
X-Forwarded-Encrypted: i=1; AJvYcCW+K6fpITUm2DR8KLdgdDIy2hO28UCASds4aeRSoGO6Ef4JPkS8e52pzcL2MAS3h76CH/IWmGBpVjmn+xY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzQaZ59WhO/LXObrpuNMMCzF9I6iA+Q95ylucYBPLTUfTHF2i2
	59U5uICE6yFPR/Rv1cNMOBzxGlMIYoWGyAZ9tJC8Z2qxdOIGeVW/lAD5v4qVdRGSmpQispNN4nR
	V5jz6gCxv01l8qMy+B2wc5z8j/GikUlYM/u+0yJWC
X-Gm-Gg: ASbGncs030tv6oM7iDRtehBL6e0ZgU8tDd2fC2RBG3S6STGtbx/rueHDiXaQwuItT+4
	3E6xx20olQGWQTjDsA05WdhJc6oPZu81JjCfRNkmHFiVLHMoBsKht6lkTHlzcVnrsHrkeDhWYmP
	gv4uMpGOBnJtk3tKt8gqPIaTcFbyStpD2HvD7SE6DkhWD53j0iSZwL+z33SacHplLXd8ST1+jB1
	yc1Pgb8bUG3
X-Google-Smtp-Source: AGHT+IEYnKxZeMI22cVOqi2KgqbYGF7ATdIrfk1pS5aaosjaTntvjwtL7OmyjDPScNP/9EgIMAXTOOMt75dvMIeUqaE=
X-Received: by 2002:a05:6122:8c19:b0:516:18cd:c1fc with SMTP id
 71dfb90a1353d-531498af39fmr12536842e0c.8.1750286298616; Wed, 18 Jun 2025
 15:38:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1746821544.git.jpoimboe@kernel.org> <10ccbeb0f4bcd7d0a10cc9b9bd12fdc4894f83ee.1746821544.git.jpoimboe@kernel.org>
In-Reply-To: <10ccbeb0f4bcd7d0a10cc9b9bd12fdc4894f83ee.1746821544.git.jpoimboe@kernel.org>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Wed, 18 Jun 2025 17:38:07 -0500
X-Gm-Features: Ac12FXz8EY8EOZIyXs2WYExliGXD0DSkt01oqP4HIN5HacKUWBKwLvpl3N7gxLI
Message-ID: <CADBMgpxP31YyRMXkHnCvjbb7D8OaUuGKbR9_66pRjGsBd57m8A@mail.gmail.com>
Subject: Re: [PATCH v2 59/62] livepatch/klp-build: Introduce klp-build script
 for generating livepatch modules
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	Petr Mladek <pmladek@suse.com>, Miroslav Benes <mbenes@suse.cz>, 
	Joe Lawrence <joe.lawrence@redhat.com>, live-patching@vger.kernel.org, 
	Song Liu <song@kernel.org>, laokz <laokz@foxmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Marcos Paulo de Souza <mpdesouza@suse.com>, Weinan Liu <wnliu@google.com>, 
	Fazla Mehrab <a.mehrab@bytedance.com>, Chen Zhongjin <chenzhongjin@huawei.com>, 
	Puranjay Mohan <puranjay@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 1:30=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org>=
 wrote:
>
> +
> +# Make sure git re-stats the changed files
> +git_refresh() {
> +       local patch=3D"$1"
> +       local files=3D()
> +
> +       [[ ! -d "$SRC/.git" ]] && return

As a user of git worktrees, my $SRC/.git is a file containing a key:
value pair "gitdir: <path>", causing this script to fail on a [[ ! -d
"$SRC/.git" ]] check. Can this be handled, perhaps with a check if
.git is a file?

It seems like the check is just to confirm the $SRC directory is still
a git tree, in which case maybe adding a -f check would fix this:

[[ ! -d "$SRC/.git" ]] && [[ ! -f "$SRC/.git" ]] && return

Or if the actual git directory is needed for something, maybe it can
be located ahead of time:

GITDIR=3D"$SRC/.git"
[[ -f $GITDIR ]] && GITDIR=3D$(sed -n
's/^gitdir[[:space:]]*:[[:space:]]*//p' $GITDIR)

Thanks,
Dylan
