Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2D72FFBD1
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 01:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746496640; cv=none; b=uUiznjABtRC4QbiIFY1m6TJ2Sr4Nz9wa7BmNUZZ1+3jdGhQkKr6EtAHrv+gkSbtq5UQLQAq/7++rO9wxuwJWeZrNJ7hWaVChwN4+HO8v6DKSnDNUv5ON0bo44Sz5meOiq3kPif4hWpBRUOUtLxj1THvnZvjFDb4Z1wcK7MRIbC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746496640; c=relaxed/simple;
	bh=GcujGxTbZYE7JFHOyTzqDZUglih6/x3xc8UjQW+kwO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h15vLtwCCCI4b55wjpZt9+wjpsX8oM8YO7A/SxhBzqOf/2rv4I3B9EOAMxfoOYyToUQo9jrXrf8U9NvkvVm5NDkZsrQXW0RfTlD7zZFO7yz8OD6WQ8CnPy1E7Jq/CkKcASz7Zu2cWCfsLroKY5mu/MznyLiv8VJudoPoXjGhfXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LtR8iSQ2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LtR8iSQ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DBB9C4CEEF
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 01:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746496638;
	bh=GcujGxTbZYE7JFHOyTzqDZUglih6/x3xc8UjQW+kwO8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LtR8iSQ2HyI9KvysJ4LKmYbXDSD1exrjcIE4WfX2V+yPulNyjyl4KJpzjsjIm2njd
	 PWUgikwzpVeOoqozplh3bxG4QSFZNEPY+Z4PKkN4Nmst90A2DbXuePoRFqjHuLs7J9
	 plJCWSelzcPCFXb/8l/tqOBQizQMJE+eS9Sig7kBJL4ybONrWbIcw3EtaT0WL86aLp
	 2lWWCBXAilseGcHIOyvhb7g7NRJr/uhJm/qSszyg+BVWt7nejjS1g3bPUzU3Ih0Gw7
	 yu2DRvkhA7guxoHXl38sJIM/6a66wgPy9n/pLsz+z1wg+c+ZdzgaCFL6+iKLLIJVPG
	 FPEtrnMi9/qaA==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso3811955a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 18:57:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWyQ5/iNJttnm3bRu660fJLzoBLG1BPld8PYa8nHXVGPCW8BgRBNpgOnSL5OKPP0d4rE/9l+VzFxjqK+cQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNIn6wBqeuTu3UL/oYfaMfLGW9Co+e5PktuvWURJnmIPC10EKG
	PmlH2yhrdMM0P6tJfZP3nz/s7+L3rGY4W4rsGB1RDQCr5AAfzZTgtA9MFBmwz2JkpVVXQVhuEZM
	yCFa4zSjDzJPbbJ8n8hJmYjmfzEk=
X-Google-Smtp-Source: AGHT+IEW+qhiUIwAl4qxAFtWxnpsr2fNdZ5q214kSR7RvMJBA5hjfE2KvozatcvWFTtD9swSf93dkpdgvh7xB+DDhmc=
X-Received: by 2002:a05:6402:3605:b0:5f6:fab2:9128 with SMTP id
 4fb4d7f45d1cf-5fb7029c45bmr941293a12.19.1746496637104; Mon, 05 May 2025
 18:57:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415072118.3774454-1-chenhuacai@loongson.cn>
 <aANVMaepni3KeABI@kernel.org> <CAAhV-H65jh29ccYzcaJf1=QpDuV5xZfBd-1Kr0=in_nk-Z4h7Q@mail.gmail.com>
 <4687ce6c.9c7.19674e259ef.Coremail.wangyuquan1236@phytium.com.cn>
In-Reply-To: <4687ce6c.9c7.19674e259ef.Coremail.wangyuquan1236@phytium.com.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 6 May 2025 09:57:07 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6mTpo5vurm0qYufVwqyQWG2dEXJ4Yd6B+ZfXwx3MLgSg@mail.gmail.com>
X-Gm-Features: ATxdqUGYPwa28w30iCCJKi130plYyJhEuHp-nL08mDHVHOi0EM6vQ8XEuJSKNV8
Message-ID: <CAAhV-H6mTpo5vurm0qYufVwqyQWG2dEXJ4Yd6B+ZfXwx3MLgSg@mail.gmail.com>
Subject: Re: [PATCH V2] LoongArch: Introduce the numa_memblks conversion
To: Yuquan Wang <wangyuquan1236@phytium.com.cn>
Cc: rppt@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Yuquan,

On Sun, Apr 27, 2025 at 9:43=E2=80=AFAM Yuquan Wang
<wangyuquan1236@phytium.com.cn> wrote:
>
> > -----=E5=8E=9F=E5=A7=8B=E9=82=AE=E4=BB=B6-----
> > =E5=8F=91=E4=BB=B6=E4=BA=BA: "Huacai Chen" <chenhuacai@kernel.org>
> > =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:2025-04-19 15:57:16 (=E6=98=9F=E6=
=9C=9F=E5=85=AD)
> > =E6=94=B6=E4=BB=B6=E4=BA=BA: "Mike Rapoport" <rppt@kernel.org>
> > =E6=8A=84=E9=80=81: "Huacai Chen" <chenhuacai@loongson.cn>, loongarch@l=
ists.linux.dev, "Xuefeng Li" <lixuefeng@loongson.cn>, "Guo Ren" <guoren@ker=
nel.org>, "Xuerui Wang" <kernel@xen0n.name>, "Jiaxun Yang" <jiaxun.yang@fly=
goat.com>, linux-kernel@vger.kernel.org, "Binbin Zhou" <zhoubinbin@loongson=
.cn>, "Yuquan Wang" <wangyuquan1236@phytium.com.cn>
> > =E4=B8=BB=E9=A2=98: Re: [PATCH V2] LoongArch: Introduce the numa_memblk=
s conversion
> >
> > Hi, Mike,
> >
> > On Sat, Apr 19, 2025 at 3:48=E2=80=AFPM Mike Rapoport <rppt@kernel.org>=
 wrote:
> > >
> > > Hi Huacai,
> > >
> > > On Tue, Apr 15, 2025 at 03:21:18PM +0800, Huacai Chen wrote:
> > > > Commit 87482708210ff3333a ("mm: introduce numa_memblks") has moved
> > > > numa_memblks from x86 to the generic code, but LoongArch was left o=
ut
> > > > of this conversion.
> > > >
> > > > This patch introduces the generic numa_memblks for LoongArch.
> > > >
> > > > In detail:
> > > > 1. Enable NUMA_MEMBLKS (but disable NUMA_EMU) in Kconfig;
> > > > 2. Use generic definition for numa_memblk and numa_meminfo;
> > > > 3. Use generic implementation for numa_add_memblk() and its friends=
;
> > > > 4. Use generic implementation for numa_set_distance() and its frien=
ds;
> > > > 5. Use generic implementation for memory_add_physaddr_to_nid() and =
its
> > > >    friends.
> > > >
> > > > Note: Disable NUMA_EMU because it needs more efforts and no obvious
> > > > demand now.
> > > >
> > > > Tested-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > > Signed-off-by: Yuquan Wang <wangyuquan1236@phytium.com.cn>
> > > > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > > > ---
> > > >  arch/loongarch/Kconfig                 |   1 +
> > > >  arch/loongarch/include/asm/numa.h      |  14 ----
> > > >  arch/loongarch/include/asm/sparsemem.h |   5 --
> > > >  arch/loongarch/include/asm/topology.h  |   7 +-
> > > >  arch/loongarch/kernel/acpi.c           |  11 ---
> > > >  arch/loongarch/kernel/numa.c           | 108 +++------------------=
----
> > > >  arch/loongarch/mm/init.c               |   8 --
> > > >  mm/Kconfig                             |   1 +
> > > >  8 files changed, 16 insertions(+), 139 deletions(-)
> > >
> > > This is really cool simplification!
> > >
> > > I wonder if maybe we can take a step or two further and make loongarc=
h to
> > > share more code with other architectures.
> > >
> > > Is there a strong reason not to call numa_memblks_init() from
> > > init_numa_memory()?
> > > And more broadly, maybe loongarch can be even switched to arch_numa?
> > This is a minimal change for Yuquan, I will make it in linux-next as
> > soon as possible so Yuquan can continue his work.
> >
> Hi, Huacai & Mike
>
> Where could I know this has been merged in linux-next? After that, should=
 I
> re-push the commit "introduce numa_add_reserved_memblk" ?
>
> Sorry for my unfamiliarity with the community rules.
Now this patch is in linux-next.
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
?h=3Dnext-20250505&id=3Dcb49fa125c0115824233ee3ef167af6c5c8b23db


Huacai

>
> Yuquan
>
> > Switching to numa_memblks_init() or arch_numa will be done in future,
> > but need some time because some machines seem to need some hacks.
> >
> > Huacai
> >
> > >
> > > --
> > > Sincerely yours,
> > > Mike.
>
>
> =E4=BF=A1=E6=81=AF=E5=AE=89=E5=85=A8=E5=A3=B0=E6=98=8E=EF=BC=9A=E6=9C=AC=
=E9=82=AE=E4=BB=B6=E5=8C=85=E5=90=AB=E4=BF=A1=E6=81=AF=E5=BD=92=E5=8F=91=E4=
=BB=B6=E4=BA=BA=E6=89=80=E5=9C=A8=E7=BB=84=E7=BB=87=E6=89=80=E6=9C=89,=E5=
=8F=91=E4=BB=B6=E4=BA=BA=E6=89=80=E5=9C=A8=E7=BB=84=E7=BB=87=E5=AF=B9=E8=AF=
=A5=E9=82=AE=E4=BB=B6=E6=8B=A5=E6=9C=89=E6=89=80=E6=9C=89=E6=9D=83=E5=88=A9=
=E3=80=82=E8=AF=B7=E6=8E=A5=E6=94=B6=E8=80=85=E6=B3=A8=E6=84=8F=E4=BF=9D=E5=
=AF=86,=E6=9C=AA=E7=BB=8F=E5=8F=91=E4=BB=B6=E4=BA=BA=E4=B9=A6=E9=9D=A2=E8=
=AE=B8=E5=8F=AF,=E4=B8=8D=E5=BE=97=E5=90=91=E4=BB=BB=E4=BD=95=E7=AC=AC=E4=
=B8=89=E6=96=B9=E7=BB=84=E7=BB=87=E5=92=8C=E4=B8=AA=E4=BA=BA=E9=80=8F=E9=9C=
=B2=E6=9C=AC=E9=82=AE=E4=BB=B6=E6=89=80=E5=90=AB=E4=BF=A1=E6=81=AF=E3=80=82
> Information Security Notice: The information contained in this mail is so=
lely property of the sender's organization.This mail communication is confi=
dential.Recipients named above are obligated to maintain secrecy and are no=
t permitted to disclose the contents of this communication to others.
