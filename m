Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D458F64
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 01:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749087354; cv=none; b=aDfb+Ugw7K0v0ANbvxa7K/HbCGX8LVDXKICu/P4JXVrH+r0ffe5w+V3Z18jjOAmbjovWhK/xGEStji/DfTdGyK5u4dcNWJtWAUpetBK1ev8XAaC5o5k4Jvbi61YKdSyBiSQcThK+w7N+pm7T4372Lv3Z4ZBmXv/mwRbb5ez3mzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749087354; c=relaxed/simple;
	bh=4RXk8f8EkB/3oJ32sdPfocuVh+q/Yys+CY6YmDBvtLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ueCHfJFDYkUU69qVb7/iiBOAjghYI65VtBn/qONbwFM0/1WkgJSh3m5YywUW61H6RyRk6y0aj4jRI8Xc8XLO37LmLGiOPWIGI30WICnfAK4QuD8rsOzjixsKU1eIOA1PQdcr/1h3X0eE5wM5FSqE79KE2EHh4AUKs4S+ztYo0k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t/DaLJDm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t/DaLJDm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 396B7C4AF09
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 01:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749087354;
	bh=4RXk8f8EkB/3oJ32sdPfocuVh+q/Yys+CY6YmDBvtLI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=t/DaLJDm7Bbztq4ZSQgSfTbEQ2CeZyyEuXbb51PKmE6YxJ+DaiK87EIsb8tfnSB78
	 VUMfRZ5JO2xKG76cEh+c263tK+vI4N/nLYfm0KdUKSVFLa49GTHtYEzMf5JAsdpIes
	 Fw18uQPqoJ/Fk3sqXpY81rVtMJl5u6QuVacFLXL4x4cCt1nQQztJD8wGFGzs/U8w/k
	 VL1cKwROIC4+A/DlSj3bLmJIHqZXXOajXPyxhnuqEOImpEoMvyzfxUeoeR+WZ3qXG3
	 Bfw5uu9LJD2fmBdkWV2BafFx0syvqG2vpaUZu+Eui35C0cGBQdUWWEQwgbudZbAnog
	 NTQ1eQf5KCTTA==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-602e203db66so732130a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 18:35:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX0zdste7RXwSvArkxLLO16JUdrvYEgvBtQN+9mScB07CGS38vZcg8hNMh3RfKRyH6gjh3K8DYs5ZO4SDg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzxVw+mEP25L1rcxjEW7gxjDN9o0XSj7+JmA2GwK3eKaLIe4ui
	ajRzDMtsqjFyS01zHybQTGIFslIWNr7aExjKLTVvWkSi6zIPaR44DIBDdSLuPF1Y7Cz7TYqQtd7
	SdK6863joupQ5/fgDlG+Ngu4auM9Aun0=
X-Google-Smtp-Source: AGHT+IH4UnRqhPWLuPo2FSLiR1pJcQVvNb1gSqgjVarPI/UAaFyvX1m2wjEm2/UyOAI7UXmspLHHTfnWNdDqdkF7A2E=
X-Received: by 2002:a05:6402:1ecf:b0:5ec:c990:b578 with SMTP id
 4fb4d7f45d1cf-606e9694034mr4945973a12.19.1749087352757; Wed, 04 Jun 2025
 18:35:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526065512.13215-1-zhangtianyang@loongson.cn>
 <1876bf9a-a77d-40a5-bedd-643df939bfbf@linux.dev> <93915902-0a91-921f-1953-b35f1742efb6@loongson.cn>
In-Reply-To: <93915902-0a91-921f-1953-b35f1742efb6@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 5 Jun 2025 09:35:42 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4_ERm8cZ-Xzeie2wkZKi5VVCT3qi5xeuRTYQvMYC=pTg@mail.gmail.com>
X-Gm-Features: AX0GCFtdFyvzZPZ5giLq09aBpz7LpbU3m5nyunlEN9HUMd3phao4bf-Hy8Y02TE
Message-ID: <CAAhV-H4_ERm8cZ-Xzeie2wkZKi5VVCT3qi5xeuRTYQvMYC=pTg@mail.gmail.com>
Subject: Re: [PATCH] Loongarch:Fixed up panic cause by a NULL-pmd
To: Tianyang Zhang <zhangtianyang@loongson.cn>
Cc: Yanteng Si <si.yanteng@linux.dev>, kernel@xen0n.name, zhanghongchen@loongson.cn, 
	wangming01@loongson.cn, peterx@redhat.com, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 9:17=E2=80=AFAM Tianyang Zhang <zhangtianyang@loongs=
on.cn> wrote:
>
> Hi, Yanteng
>
> =E5=9C=A8 2025/5/27 =E4=B8=8B=E5=8D=881:47, Yanteng Si =E5=86=99=E9=81=93=
:
> > =E5=9C=A8 5/26/25 2:55 PM, Tianyang Zhang =E5=86=99=E9=81=93:
> >> From: zhangtianyang <zhangtianyang@loongson.cn>
> >>
> >> Fixes: bd51834d1cf6 ("LoongArch: Return NULL from huge_pte_offset()
> >> for invalid PMD")
> >> ERROR INFO:
> >>
> >> CPU 25 Unable to handle kernel paging request at virtual address 0x0
> >>           ...
> >>   Call Trace:
> >>   [<900000000023c30c>] huge_pte_offset+0x3c/0x58
> >>   [<900000000057fd4c>] hugetlb_follow_page_mask+0x74/0x438
> >>   [<900000000051fee8>] __get_user_pages+0xe0/0x4c8
> >>   [<9000000000522414>] faultin_page_range+0x84/0x380
> >>   [<9000000000564e8c>] madvise_vma_behavior+0x534/0xa48
> >>   [<900000000056689c>] do_madvise+0x1bc/0x3e8
> >>   [<9000000000566df4>] sys_madvise+0x24/0x38
> >>   [<90000000015b9e88>] do_syscall+0x78/0x98
> >>   [<9000000000221f18>] handle_syscall+0xb8/0x158
> >>
> >
> >> In some cases, pmd may be NULL and rely on NULL as the return value
> >> for processing, so it is necessary to determine this situation here
> >
> > Your description is a bit vague. Could you please specify
> > on which machines and in what scenarios this bug can be
> > reproduced? I believe such information should be included
> > in the commit message.
> >
> > Thanks,
> > Yanteng
>
> Sorry for the late reply.
>
> I will provide more detailed information in the commit of the next patch
I think this bug is not machine-specific, just provide something about
the test program.

Huacai

>
> Thanks
>
> Tianyang
>
