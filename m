Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CC322DA19
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746808779; cv=none; b=ZTArYV4DxcMWidsNPopk5olR/2LYsK+K17b5sFTFKTAihhe3+jwatzKFu8uZIPaT87aeRn0JzAbwheikvHictd0/3fwaObMHrjhlB1xlO0cKsLkzvavg3ACrrpShZljuMmhNtOura2uWDL+AbkbX3RXo+Zndai/PQXgengOzYK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746808779; c=relaxed/simple;
	bh=6FEviuXw5nGn+Hmig2ljKBflhhBQQp14Wbbejw59cLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YQkR320FYpkEV/nzYwI7IS+VeCL9i1RzyzOW+T79UDW1hZNnbcKiA811PeMFspBZwAKIYJW6Xpy3CfKWTEXb/iwyOt4SsKc6uJbkTYtwC7lIrRrj0P7UFb40kNd6O4FJvhb7GbaTa+lemxza5RNQvrGinEWBI8N/iD9c6+OUWX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LcwwKiOk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LcwwKiOk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADA30C4CEF4
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746808778;
	bh=6FEviuXw5nGn+Hmig2ljKBflhhBQQp14Wbbejw59cLs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LcwwKiOkRrU4HTLoEcVoE2rBxrlqmnmGkeedxE1J+aV3uNpQFISbOHZr9nLXyJEKq
	 saI349KCwa4MOuqC4Hsx5NU8bRcZOK9usTY+X1pOI1lyL3xhf9Mh3ZPrXiNF3941DO
	 twDNbnXxIiC/rkZcx8OW9aXWRehszCZ3KFZLGL5a55lzsebWEh8lGyrh0ERG1ghdB5
	 4nc/JShFW53K3Dy1awrzXQu5pRn8BdQnyKqSsezF7shv2oAq/13hBjBTKiqPKXp4XK
	 SjHqcdihOv4hD1Az9E4Ehk0xadD1B8UXzA6bLnG07KSEAxpfOti5RexkukbvCK25RO
	 AYFZRApdAbCQQ==
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6f2c45ecaffso23946616d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 09:39:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXeqi92R4aFpXlUC2qdG0gV0ZyP3mDQVzFffSjLMSQenQbvYcVd/j497LO4pJOEo+wvkZmRJPc7WkGMhF4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxE2l8wvG4zGXI5Nabn45TTZH3Ntck92MIerWAZWb84aOiz30B8
	6ZPCqLUaJrr/X8pMe10XgKhbyLE1FHW1qwln1Fuvyzv8dj4yCn6HcG0jK8apTgF8BjhYBtcotFa
	wRQUnJ7rzO3HpZK92y08SfhN2Tfk=
X-Google-Smtp-Source: AGHT+IG7Qkv6PwCNMeso0Mlb1IFTODYGTeFy1xHYEsIiAd+ZmwZRX+yjO9rDEckjmTlA1+pYKaNPj5PVlAFbcjtUo9Q=
X-Received: by 2002:a05:6214:27e5:b0:6e6:602f:ef68 with SMTP id
 6a1803df08f44-6f6e47aa6d9mr69893956d6.10.1746808777610; Fri, 09 May 2025
 09:39:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412010940.1686376-1-dylanbhatch@google.com>
 <20250412010940.1686376-3-dylanbhatch@google.com> <20250509161508.GB5984@willie-the-truck>
In-Reply-To: <20250509161508.GB5984@willie-the-truck>
From: Song Liu <song@kernel.org>
Date: Fri, 9 May 2025 09:39:26 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4rgcw3Dqam4Hethrkd0jqzuwebh365g-7xkg_g1QM78Q@mail.gmail.com>
X-Gm-Features: ATxdqUFiLngFQqOugoZ_DZ4xcnihIa5WKMk8-tSR7dUYRzJb_ZhDOHoUAqmfnVA
Message-ID: <CAPhsuW4rgcw3Dqam4Hethrkd0jqzuwebh365g-7xkg_g1QM78Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64/module: Use text-poke API for late relocations.
To: Will Deacon <will@kernel.org>
Cc: Dylan Hatch <dylanbhatch@google.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Puranjay Mohan <puranjay@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Roman Gushchin <roman.gushchin@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Will,

On Fri, May 9, 2025 at 9:15=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> Hi Dylan,
>
> On Sat, Apr 12, 2025 at 01:09:39AM +0000, Dylan Hatch wrote:
> > To enable late module patching, livepatch modules need to be able to
> > apply some of their relocations well after being loaded. In this
> > scenario, use the text-poking API to allow this, even with
> > STRICT_MODULE_RWX.
> >
> > This patch is largely based off commit 88fc078a7a8f6 ("x86/module: Use
> > text_poke() for late relocations").
> >
> > Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
> > ---
> >  arch/arm64/kernel/module.c | 129 ++++++++++++++++++++++++-------------
> >  1 file changed, 83 insertions(+), 46 deletions(-)
>
> On its own, this isn't gaining us an awful lot upstream as we don't have
> livepatch support (arm64 does not select HAVE_LIVEPATCH), however I'm
> not against incremental changes towards enabling that. Are you planning
> to work on follow-up changes for the rest of the support?

There are two patchsets that are trying to enable HAVE_LIVEPATCH
for arm64:

[1] https://lore.kernel.org/all/20250127213310.2496133-1-wnliu@google.com/
[2] https://lore.kernel.org/linux-arm-kernel/20250320171559.3423224-1-song@=
kernel.org/

Toshiyuki has tested this patch with both approaches.

Since patchset [1] depends on SFrame, which is less mature at the
moment (clang doesn't support it, kernel side code is very new), live patch
folks think [2] is a better approach at the moment. Could you please share
your thoughts on [2]. If it looks good, we hope to ship it to 6.16 kernels,=
 as
we (Meta) want to use livepatch in our fleet.

Thanks,
Song
