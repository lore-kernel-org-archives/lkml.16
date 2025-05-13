Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAFE645;
	Tue, 13 May 2025 04:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747110741; cv=none; b=i1Xvro7707BGkZngLFkYLhVFHOETrEPUtJoh+ZqhCahGjN9/R8i0zc2C7IO0m/jCFBaO4RWegoOnhFjCsuPBjXXM+d+8wEZUHGXE703HRrelk7tIVZj8XLRkmd7tD8cBb3pxA9M+55GC2qMQLiwtBwN/wwR7iskCOJw0+Yxe9WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747110741; c=relaxed/simple;
	bh=o8iDR24xbfL2rsSEZ1sJwX09SCwQcDR0mH7BGnJxXTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GIdWbtiEbKt/elGqo+jLehS/E237It50sThL3C0jx4C/InG000CCABSqs2ZEByIriwTU2x2+iD+A1HCChoOJRmej+4QUO0e55y56zSNNHHCdZ00H6ucYoNRsl4lmQ5zmj1lpmZH8Fs953xVC06s7YGVOW3VlBn94DnX8ieAHn/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jp/PB0wb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jp/PB0wb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72F36C4CEE4;
	Tue, 13 May 2025 04:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747110740;
	bh=o8iDR24xbfL2rsSEZ1sJwX09SCwQcDR0mH7BGnJxXTY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jp/PB0wbu/U0ldGVMj0Hg4Bm2D/hxbRB4lwitABmGC/PcTp/RSNP2+O2C3xW3dS3m
	 xJYmR1qD0wNRGTglEpsN2EwI65j5y1bfzQ2Gw6fxEr9n6OpPuOegIYGkQcFBzUM//D
	 RJr8JvwsAOW2kmy7c48rP6R3jzH0vtPjIC5Wt+0WwWR7YjuKOTj6hiq98evbWIVWFh
	 OBacBqvb2bn/pNtNyWVS5aSz1tJ9ALsBoUcPrBqke4Jp1Wh7UlkX25sQ1XABaypKSz
	 j91i1G0yYktMt5/5hkG1c6xMI8pzVDIMonsN6eo/T0R5HJrIsIfNXyA5Ds6tXwa65p
	 iLLk+LbogdWew==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-326bb1d3e34so46379571fa.3;
        Mon, 12 May 2025 21:32:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGLFbMWiX1JC0UnKFBBW8ZTmHCfP3QgoJ1C8IBlqQc9j93kgOWbrZPc+Hz4tA1Oh+dSFNlDpL0SLL3I2z8@vger.kernel.org, AJvYcCVFsGz/4EWQxkbK51fbuGuNBODTmI9fluJ3ty9eKQ3RBOS4xDFwlhoOJ0dN75uqTfkAH60kj4SoGV8y@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/15p5Zsk1sNOPSILnxXW8o0uZU9RiPE0WwOW/bYwFYjdH9qM1
	Fhcosld6St1jU96GxAXWTCK5CcEIxVKWbTgNwzCNW9FgpjQOl5Qxp7jJOqPqOJM5PnPpKBpfq6/
	CG2nrMUlLJoOUS4Gs+Q1IXk5sC54=
X-Google-Smtp-Source: AGHT+IHY3Llz5XOMjuFiZGd6z8ODSxNXGVT2ITgUXCWdNVkKPJBf6NobM4kFbwChnI57esXwLkFHoJlFRngRGP7klFw=
X-Received: by 2002:a05:651c:150c:b0:30b:9813:b011 with SMTP id
 38308e7fff4ca-326c4627e6bmr85553211fa.28.1747110739185; Mon, 12 May 2025
 21:32:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241222002957.2582212-1-masahiroy@kernel.org>
 <CAK7LNATVrJLPQSCVTxKARm_4wk=Piem1ZHMA-8c8CfaZPs0H7Q@mail.gmail.com> <CAMo8BfKgLgWiTVre_zSy3SMm-tJySgmJpVDphtE7C1kFZsuwZw@mail.gmail.com>
In-Reply-To: <CAMo8BfKgLgWiTVre_zSy3SMm-tJySgmJpVDphtE7C1kFZsuwZw@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 13 May 2025 13:31:43 +0900
X-Gmail-Original-Message-ID: <CAK7LNATT0=TOT0jjC_vfS5Wi+oaenutRnVair5rbCqfPmRDpDw@mail.gmail.com>
X-Gm-Features: AX0GCFu2ziBT3SNUDUoAYSyWCSywDwx_UoslA3wU5oJaUWKy-mUBeIyvV5Qj8H8
Message-ID: <CAK7LNATT0=TOT0jjC_vfS5Wi+oaenutRnVair5rbCqfPmRDpDw@mail.gmail.com>
Subject: Re: [PATCH] xtensa: migrate to the generic rule for built-in DTB
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: Chris Zankel <chris@zankel.net>, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 17, 2025 at 1:27=E2=80=AFPM Max Filippov <jcmvbkbc@gmail.com> w=
rote:
>
> On Sun, Mar 16, 2025 at 1:37=E2=80=AFPM Masahiro Yamada <masahiroy@kernel=
.org> wrote:
> >
> > On Sun, Dec 22, 2024 at 9:30=E2=80=AFAM Masahiro Yamada <masahiroy@kern=
el.org> wrote:
> > >
> > > Commit 654102df2ac2 ("kbuild: add generic support for built-in boot
> > > DTBs") introduced generic support for built-in DTBs.
> > >
> > > Select GENERIC_BUILTIN_DTB to use the generic rule.
> > >
> > > To keep consistency across architectures, this commit also renames
> > > CONFIG_BUILTIN_DTB_SOURCE to CONFIG_BUILTIN_DTB_NAME.
> > >
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> >
> > Ping?
>
> Thanks, applied to my xtensa tree.
> Sorry for the delay.
>

This has not been available in Linus' tree yet.

Will you send a pull request in the next merge window?


--=20
Best Regards
Masahiro Yamada
