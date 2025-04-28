Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980551DEFC6
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 23:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745881317; cv=none; b=YfThOic8WlhL6SLda4GpAf6hUC35zvOIYTumhWNl/ICJfSw0SczJPUiQzCqdBDRw2OaNiJHNJWYoFo+8BgKihpzCvoo5oWdsoh4V42rUUaHDSDWxogr9n26R3SYxNfUYQsYY099bRES+dDhYTEZTci7cjCEQWMOTHFpHH+rsKAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745881317; c=relaxed/simple;
	bh=HwBT/ovUEv8UzpWAZc2njxR0ZKeSaS/THTkBms/bELM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aHFPKwaiKWcvAuarEYLn7Kfqe5lM06o7zgsNmufEP9prxLa4iRrOpx15ECKUdUzLPCj6uH77c8L3DIYaqHKo/GxOO6Rl+4ctRp4mTBR//eCR44OiKrcfmcv76oOV1ktNasdHhl9onO849hmplVcZRIyUI2iR7GyporTxtEcz75Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qJHzpRfZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qJHzpRfZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1338DC4CEEA
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 23:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745881317;
	bh=HwBT/ovUEv8UzpWAZc2njxR0ZKeSaS/THTkBms/bELM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qJHzpRfZ+tCuI02iRkM858HwNpAXUci3xSnPoO2kSqMlpLH3MrTzZTRU91ZzwV6fg
	 YJeHtF/oidckWUJvg6SPJX98M05AoKqEHWy7cvVPR6UJf7CPtg/SpfqJGHR3R2gPYt
	 /0nm1odKhCoCQI7K+n/d+d7SAsdHHoMETwGyruiAqjufqzGINX7Rt2XNRq0lsnBKJG
	 sx+4Z+QwV19xl39JylyUArWFVbkWmLKYRCXjGZkUuckn9JVzJL2oA7Th/wFb3eDVlH
	 WUlVS25qp02PTXy38HrD+mdv6oP/FT9vHvoqKQiPqF6KveNAu4SjOTD0Nt8OWVRkJ+
	 1Gn79zG0zHPqw==
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfe808908so4235e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:01:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWF7RN0s7enNA32zgIjGbipDsqUk3gybiwZ40yMvNbsCl3svB476zcs58ZqOCNg/aEXEcvajAV/2eg+CxQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJmb2ySPGd3udkISYYyptOATIaGLwNzsIowc6tKcJoRwDl2Wmq
	WmTx285Iu1CjNd7IvRvQNqqekOBs/A0yFoRVx6ZB+VvQr+3wwOk/YzL4i6SYfVf4YJhYRoCDts3
	yKKQY2YjX8rEIJffSAWmBfYIozSA6I5aOA/12
X-Google-Smtp-Source: AGHT+IFltF0sFMEKKxvR5oEXrKzNbNJnpjWpEV2T1C13cir292/kbjIpYGja2HYoKWTK4fMkgc7VXYkgS3IGbLrZCG4=
X-Received: by 2002:a05:600c:35ca:b0:439:961d:fc7d with SMTP id
 5b1f17b1804b1-441acb99999mr528205e9.6.1745881315845; Mon, 28 Apr 2025
 16:01:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250310120318.2124-1-arbn@yandex-team.com> <CAM_iQpWewprQzQgMWk0yMr=LCFUCGztJ4+G-NFt8gqe81XuUcg@mail.gmail.com>
 <CAPAsAGyOcyi1PLK_mjdf9STX4HOxNnBU8t3d20fSS3QO+znwNg@mail.gmail.com>
In-Reply-To: <CAPAsAGyOcyi1PLK_mjdf9STX4HOxNnBU8t3d20fSS3QO+znwNg@mail.gmail.com>
From: Chris Li <chrisl@kernel.org>
Date: Mon, 28 Apr 2025 16:01:44 -0700
X-Gmail-Original-Message-ID: <CAF8kJuNVCezdk6SZSYKp6EOByYbc=tVgP2F-5G=obbjaa=pyTQ@mail.gmail.com>
X-Gm-Features: ATxdqUFGsN2yKGjnSWE8Z8P2YNgx5olP5cHe8TNU73XJyrvNYVVrVxIXXPjB6GI
Message-ID: <CAF8kJuNVCezdk6SZSYKp6EOByYbc=tVgP2F-5G=obbjaa=pyTQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] KSTATE: a mechanism to migrate some part of the
 kernel state across kexec
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Cong Wang <xiyou.wangcong@gmail.com>, Andrey Ryabinin <arbn@yandex-team.com>, 
	linux-kernel@vger.kernel.org, Alexander Graf <graf@amazon.com>, 
	James Gowans <jgowans@amazon.com>, Mike Rapoport <rppt@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Eric Biederman <ebiederm@xmission.com>, kexec@lists.infradead.org, 
	Pratyush Yadav <ptyadav@amazon.de>, Jason Gunthorpe <jgg@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, David Rientjes <rientjes@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 5:19=E2=80=AFAM Andrey Ryabinin <ryabinin.a.a@gmail=
.com> wrote:
> > Hmm, this still requires manual efforts to implement this, so potential=
ly
> > a lot of work given how many drivers we have in-tree.
> >
>
> We are not going to have every possible driver to be able to persist its =
state.
> I think the main target is VFIO driver which also implies PCI/IOMMU.
>
> Besides, we'll need to persist only some fields of the struct, not the
> entire thing.
> There is no way to automate such decisions, so there will be some
> manual effort anyway.
>
>
> > And those KSTATE_* stuffs look a lot similar to BTF:
> > https://docs.kernel.org/bpf/btf.html
> >
> > So, any possibility to reuse BTF here?
>
> Perhaps, but I don't see it right away. I'll think about it.

There is some possibility to use tools to lighten the repeat portion
of the load.
For example, the use sparse checker to example the struct field.

>
> > Note, BTF is automatically generated by pahole, no manual effort is req=
uired.
>
> Nothing will save us from manual efforts of what parts of data we want to=
 save,
> so there has to be some way to mark that data.
> Also same C types may represent different kind of data, e.g.
> we may have an address to some persistent data (in linear mapping)
> stored as an 'unsigned long address'.
> Because of KASLR we can't copy 'address' by value, we'll need to save
> it as an offset from PAGE_OFFSET
> and add PAGE_OFFSET of the new kernel on restore.

Agree, there will be cases requiring manual intervention. It is
unlikely to fully automate this process.

Chris


Chris
