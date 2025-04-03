Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC0E2459FB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743673238; cv=none; b=BVhCIKc1rLz/UNAq+GUky7+RudSW4B6WvXnp8+Vo8PxwYwFdxIgv4pkHOu31sqAfeRJPOrMJMJOXz/vGmn0Zhm4Yvi3lUPFPXfgnwae4wKhdHapz9o3NOvPTYqZgQcJwZXiWc/nMGAk6ni7yMDiRnlGSExKwpThf4oAlaONYg9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743673238; c=relaxed/simple;
	bh=WzsalunK3uz/JcGIaDbLEIdrDSctOaLsK5Ua8a0x9Ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GEbukLSIYRR/y6ZTaC3GFqEh+6gT9pNs0XgIRYAcQB7SnCnen22QRtD8H2S3/JuJpcePSBwk747oi13mWG/D1RuJderfIvD2u1mhvYch/MJs4jEySMK54lLNBgvwHdlZTtf+vjU+qsW/1pYn46kKMZ5+5rmZgzTZt2s0mDH5h2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q6M8iGIu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q6M8iGIu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBF41C4CEEB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743673238;
	bh=WzsalunK3uz/JcGIaDbLEIdrDSctOaLsK5Ua8a0x9Ps=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=q6M8iGIuclQIqDpFQvkWn6+p6swUx58RhUw26K5cu6DQ8XqS9Sc3/0ptj0BnoLJgq
	 jJcaLdngyMEUJgL1EGhDvHrmE1zws2uuxrj1svkOm7Tm1E898ZyIIBLQbb9T8NCNgU
	 ns0XIXVG59P3AhJkBjV5tJI+Rhr9BJN8Yy+bO/yK6IoR5QF2buwGQieaZy1u2snhl6
	 OcPWLdxbegGNntYpUKwrG119HtR2KI8YJvKbIuWIQUSWike+LIZPOu1SJoDW/Vubrz
	 H4/KV1jCEnM7pHCCT8EPyY5LJRu6jHayW7bNkd8uwRX/uwvWBhtnT+Hx1BSJ6vxg3e
	 yVPLDRwODk5Vw==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb12so1138994a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 02:40:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWRitiZ9D1ep5Gx4yr9WlabbJSVcPLTsfbKYZ+qwIjLMLK+VLhSNdpfUzNM87F/5QM+LGRNPspNsa2bByY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD8zwe2lVLbUu+ITsfGOlo1Rp4qbR8/zsK0yO64U0jfs3UROKP
	5+ZnUxSKSvIPkWGxseGSWEvGlAA7UYYHwHsYrRnl8RfM93Kw6SnmMSHqLu1QojHAwwcgi6LF9AF
	m/zFHi2slKtBzvfy86X2QqDYg80E=
X-Google-Smtp-Source: AGHT+IFiZrIG0pUE+pKViMjastRqGOMtAgm0YIRyI2nqCEZthyUO6iyQFwq7VOCErChZU3oXuptwZeufQHUTQyxnbc8=
X-Received: by 2002:a17:906:6a14:b0:ac6:b731:965c with SMTP id
 a640c23a62f3a-ac7bc0dc604mr157905766b.23.1743673236541; Thu, 03 Apr 2025
 02:40:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202504011011.jyZ6NtXx-lkp@intel.com> <Z+ttzRArSBMqfABz@rli9-mobl>
 <xqfrt2rueezh3upug2umvuw2r44luoaxfqycnmvkh5sezaosw6@h77yjfio4ws6> <348cdb14-f8cf-1e7b-44b2-79dc4dda4e35@loongson.cn>
In-Reply-To: <348cdb14-f8cf-1e7b-44b2-79dc4dda4e35@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 3 Apr 2025 17:40:26 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5iwFS15GU-_aPJSK8FzkxL-=eDJa+TW48QW1PC6RQxrQ@mail.gmail.com>
X-Gm-Features: AQ5f1JpU-0wXbARvlP1nSGCgqzPoN15JbefJ2EY_AQMyYHkgfkmRAxFJLZ4_HAw
Message-ID: <CAAhV-H5iwFS15GU-_aPJSK8FzkxL-=eDJa+TW48QW1PC6RQxrQ@mail.gmail.com>
Subject: Re: [linux-next:master 12681/13861] drivers/i2c/i2c-core-base.o:
 warning: objtool: __i2c_transfer+0x120: stack state mismatch: reg1[24]=-1+0 reg2[24]=-2-24
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Philip Li <philip.li@intel.com>, 
	kernel test robot <lkp@intel.com>, Guenter Roeck <linux@roeck-us.net>, oe-kbuild-all@lists.linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Alessandro Carminati <acarmina@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 5:36=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn>=
 wrote:
>
> On 04/02/2025 03:45 AM, Josh Poimboeuf wrote:
> > On Tue, Apr 01, 2025 at 12:38:37PM +0800, Philip Li wrote:
> >> On Tue, Apr 01, 2025 at 10:44:57AM +0800, kernel test robot wrote:
> >>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git master
> >>> head:   405e2241def89c88f008dcb899eb5b6d4be8b43c
> >>> commit: 9016dad4dca4bbe61c48ffd5a273cad980caa0d1 [12681/13861] loonga=
rch: add support for suppressing warning backtraces
> >>> config: loongarch-randconfig-001-20250401 (https://download.01.org/0d=
ay-ci/archive/20250401/202504011011.jyZ6NtXx-lkp@intel.com/config)
> >>> compiler: loongarch64-linux-gcc (GCC) 14.2.0
> >>> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20250401/202504011011.jyZ6NtXx-lkp@intel.com/reproduce)
> >>>
> >>> If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> >>> the same patch/commit), kindly add following tags
> >>> | Reported-by: kernel test robot <lkp@intel.com>
> >>> | Closes: https://lore.kernel.org/oe-kbuild-all/202504011011.jyZ6NtXx=
-lkp@intel.com/
> >>>
> >>> All warnings (new ones prefixed by >>):
> >>>
> >>>>> drivers/i2c/i2c-core-base.o: warning: objtool: __i2c_transfer+0x120=
: stack state mismatch: reg1[24]=3D-1+0 reg2[24]=3D-2-24
> >
> > Tiezhu, this looks like a loongarch GCC bug with asm goto, or am I
> > confused?  See analysis below.
>
> This is related with GCC optimization "-fshrink-wrap" which is default y
> on LoongArch, use "-fno-shrink-wrap" can avoid such issues, like this:
>
> ---8<---
>
> diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
> index 0304eabbe606..2d5529322357 100644
> --- a/arch/loongarch/Makefile
> +++ b/arch/loongarch/Makefile
> @@ -106,6 +106,7 @@ KBUILD_CFLAGS                       +=3D
> -mannotate-tablejump
>   else
>   KBUILD_CFLAGS                  +=3D -fno-jump-tables # keep
> compatibility with older compilers
>   endif
> +KBUILD_CFLAGS                  +=3D -fno-shrink-wrap
>   endif
>
>   KBUILD_RUSTFLAGS               +=3D
> --target=3Dloongarch64-unknown-none-softfloat -Ccode-model=3Dsmall
>
> If you are OK with this change, I will send a formal patch after the
> merge window.
Is this the same problem solved by the commit below?

https://web.git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=
=3Dobjtool/urgent&id=3D7c977393b8277ed319e92e4b598b26598c9d30c0

Huacai

>
> Thanks,
> Tiezhu
>
>
