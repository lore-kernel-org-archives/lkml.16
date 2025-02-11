Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C5DEC5
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 01:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739236864; cv=none; b=gjoMFBUMJe2MUSgg1s99Z827x1xwcc8sTRntw/03pwWWZCVejugbXPt5ReUhmrHpT1163ESPkT1kb8blEwK+Mki1eEaOlcxQyKeE/ebI/d0A9WIb5R+NX+rid6oO04ewsEGBscuw1IrRXplCqKtpU+MTSsKNFBqfw2vcSY44TJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739236864; c=relaxed/simple;
	bh=MaQFdnDPn6oDlBBV4WvI2w9SEnAIQ/HcPGa1Cc/3bcU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tSgyVMk90MbmpmwL8t06Yw2SqA0PCZ6YG+QoG8aED7cr78NqiyMvbfL8bgIu1wrJcOQ8SUCy5s7T7gjd5HPHzCknDWoLIcKdJOng0giXtfsSPoppXSjfXAJtQHBnUi7n9onkS8PH2OVoXMEeA2c1Dr9p4IeNuC1aPAGiQyMo/Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBgodye8; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBgodye8"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-726d2529db4so1254497a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739236861; x=1739841661; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MaQFdnDPn6oDlBBV4WvI2w9SEnAIQ/HcPGa1Cc/3bcU=;
        b=CBgodye8mh2HlkTEut/DqYzbyFbptRge/cEWIWSYDGKtbLb3GdQiGCz4f2RMWtJLhq
         Xyq3HtdH7RdeZUoQI6sKOBD/9e57Pzqzg3mKv2uW7vE1PwzmqUvzjiNQpWcDT1uJMNK2
         0QMEUYAg00w6ccABq3+NEoMWMvLSgY20SlILntJHdh6ssoS4Lxl6vFXhbemhhAF3ZNhn
         7c5HHV8Y/6Q16A3unQj1pFzW06KumlvNyuBoehu20iXqGOsFRcV9aWbPwHG+GwQ4QVcv
         OPYA+vuD7zqMPZ++V9/xJ8Tdrc4V6T+Ni6HFUOXOVFnyshZ+Rswit9ojLAtLOsUDzEz0
         4wjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739236861; x=1739841661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MaQFdnDPn6oDlBBV4WvI2w9SEnAIQ/HcPGa1Cc/3bcU=;
        b=V8N6Cfs1KenkQWFSEr0l03nUZGB2zmfYa1SVVUlqsU/I3GQISSwZ6hlMqi1EHr3S6I
         1c3b96BBc3ZC5eHPNDufRpfM0HitRcv1XL4ypjg4eMBlp0UIOrtDEU2hwvYjI+nIwRVh
         +sqaYXwNbkU8CBK2Co0KIdQcT2XZxkCac3OnMbBONkWr78X/cNyk8hgMNX3Xbqj55q60
         c3Tr4F+r6cXzrnFWgLBW70MhOu9GckA0njR+JtDAeAqE+4nu4mFtyRngiHPnuN7GE6dN
         bUGIs0x5Ar7o4RVvpwjDxSpNo8w10vLKyhUQf34jjFkYavEWLzjHLbSIhdDJ2PDT5GAr
         X85Q==
X-Forwarded-Encrypted: i=1; AJvYcCW7MrFFD0KxtPrn/f20qkZwOR+MgyC6xVezlaUqChpBUwTy4zcWNg0lugTkTW7AVDGEJOU+jPAHyllz/A0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcL2+FwMXpyAn78ktWn+O1pwSyJ65uCSzN78sDgiTZUVX0pBV0
	xNSHjCdgKp+5qGTU6W9kzY+l3jE+ioLrr7norrwUsREiCAMDdRyYGLKWE45/c+ANoK2bVhpxvPs
	GVvuWuq2yyMGcxO6cy7Cjoe+0wfw=
X-Gm-Gg: ASbGnctSpSLHocn2VohDOmYnmaGvlGTQmYhoFopTOI+paIrYAnvl/sYweSnvqIP97wM
	GuR4birGPG6ZXu10E0wV63nYxV3LThxwTZhYmJd6z7aFEEUjIzSChLY1OQ7ZGzuMlV/JJhaw=
X-Google-Smtp-Source: AGHT+IGm048wWiFiLM3RnwF5VP9mdTr1NFDjC4UyHl5DciC8UMYJ0TxacQ6z8oYB1tJinGY/z+rTq+yN8/oOxkM5FtY=
X-Received: by 2002:a05:6870:8a08:b0:29e:63c3:3392 with SMTP id
 586e51a60fabf-2b83ed3354fmr9621320fac.15.1739236861596; Mon, 10 Feb 2025
 17:21:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113095833.1805746-1-zhangchunyan@iscas.ac.cn>
 <20241113095833.1805746-2-zhangchunyan@iscas.ac.cn> <87frl0snf6.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87frl0snf6.fsf@all.your.base.are.belong.to.us>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Tue, 11 Feb 2025 09:20:22 +0800
X-Gm-Features: AWEUYZlvl4mGCqJJI-gBI3cTxlXAt19H2Jtwaartczfba4mVGW4RfhZKYAMKh-E
Message-ID: <CAAfSe-tRFEXiXJ=tHVnXy4Kb6O7-E2Sr_xybLYxma=ypMhqz9w@mail.gmail.com>
Subject: Re: [PATCH V5 1/3] riscv: mm: Prepare for reusing PTE RSW bit(9)
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 30 Jan 2025 at 16:42, Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org> wrot=
e:
>
> Chunyan Zhang <zhangchunyan@iscas.ac.cn> writes:
>
> > The PTE bit(9) on RISC-V is reserved for software, it is used by devmap
> > now which has to be disabled if we want to use bit(9) for other feature=
s,
> > since there's no more free PTE bit on RISC-V now.
> >
> > So to make ARCH_HAS_PTE_DEVMAP selectable, this patch uses it as
> > the build condition of devmap definitions.
>
> Heads-up: It seems like Alistair's series [1] that removes the devmap
> PTE bit will most likely land in 6.15.

Yes, I've been keeping an eye on Alistair's series, intended to update
this patchset after Alistair's patch that removes the devmap PTE bit
got merged.

Thanks,
Chunyan
>
>
> Bj=C3=B6rn
>
> [1] https://lore.kernel.org/linux-mm/cover.11189864684e31260d1408779fac9d=
b80122047b.1736488799.git-series.apopple@nvidia.com/
