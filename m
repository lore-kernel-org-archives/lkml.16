Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23E81C6FFA;
	Mon, 19 May 2025 09:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747648316; cv=none; b=ouKThA8Ap00t2Ej3CguDZaao0qu4KaiJI+/hXtaqa2dvSs4GTDfQFrgTEcsGX36Yeo/YdWGVmHyczRM7DDwmniHoD8WMp/GXpkXEwytvJbZ45bPC+Hr+0/JI7ap6iAI3cKo1n/teQfPcE8IW89zU5RzIuIQ59WbfvZtMcV7nGXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747648316; c=relaxed/simple;
	bh=J79iIRh+mb98roAnS0bOZnbKEfcnEGQWJzqWX8EOWTU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=moXpfgzKx/0zAyJoJiceiehEnB5P7P48I4UwIFh/aWlQY4VjTd0rjLfmUx634koDn4JbfSCR8AeIRRo5eQZD1VPymorqx7Ki5d808WxwV/bBExfJm3GzlNlPid/nE2OPBpcOMxOfrjtQ/1VgIr7pAOpsTCpWLhkqoKldwVFO22c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZXHo0vP; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZXHo0vP"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-acacb8743a7so709018466b.1;
        Mon, 19 May 2025 02:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747648313; x=1748253113; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tTo67rYc6P2/pwOcsI2e9jMG4F7lh9l1foadztUAX5o=;
        b=CZXHo0vP5CyYBQJkcvy0sVvKKuSEyUswE421gtTUZ/jLv/LTzGGHp0jcAmb8eYTYA4
         QNAL88vNmN8glDqWyCxqY5Ob3F0sBQXyHHqo52AcKyjLncFJcy9IytNlmM6VneHN8+zb
         9OkPXpPF2aCgcBbQztONa5FyxLOjozQrg6LjL2gyz9iYcApJmj3MtICPgXuaTQ2wIf2q
         jHSBy4ru+nYgg1ff/bWiQw9oAr/KZvD4pgcbVY5aXJgMI+zjZ+3rz39yxXBF4JQPOa3U
         71KP9ym33acFyY4UELdVCrJyBA7Thpu2zZciznSwjuPjlRWbDt0vXnGxiXIa5Qr8l3WO
         VMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747648313; x=1748253113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tTo67rYc6P2/pwOcsI2e9jMG4F7lh9l1foadztUAX5o=;
        b=QEnzQ71msGcduuBShD01WmelCIosl7hbjfWvIRtXlyS2lc5bKw/axzgC5rtz3jLgc+
         1ksqHoOakXDbqPGjVYcamP3wcFdttAXvvwQlqeksqF2kOSY4y4RyZ21JxpL1oaMGTyQp
         iDGnQO6ao0EWstnXCA18O4t+KOiPsTfgsZQjnFtf5pOG+2Vlz0yHEEVtmQ7/nEVXloEU
         yKiMc7x0n0tXjTtr2FQSb6ycZx48YxhUi8Gj4HrgZMzr2SGUGibGzy+sgBLylhf62LrN
         Ct+PpIdjboKMSkKefOR+rqcksX8xRl3AHREDyb6Zdo+pkV2MnzxLCcE01Cg8r+s5Th7i
         JiCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOKFfL9cIPaPmN6UX1zWWa9D6j3QueR/khmQX2OnVwvj6RLbEw+tYEvtqLHX/dxBsXBxgLG5g8mSjo92YI@vger.kernel.org, AJvYcCWgQTQd3zVu7Iw2mKAjqzXdGotu+LCdrQ99KTAtu9o4uMDTas80AWDTkzKgNb4u5hUfh5mlyIOjZO17@vger.kernel.org
X-Gm-Message-State: AOJu0YzPfP9C428ZK2EyCNmcYJ2NtBQxg2wWQN9f+wVtEC1yj5LZ7G/h
	yyElWTgqJVMSx1sj7UklSXxsoPU7ZdsDMeiKnYlF5ugUFYlsf/57mxwiBS3hKJqTIXL7Si3vl5N
	9ULCPfmJzNOMbjilqnd6fIrwmku35j/U=
X-Gm-Gg: ASbGncudCcQoVwq54O//SVNOlu+uBc6r4BfpN/fti/3MymYKL74RcinTVvsE3nQf7my
	ahjaavMWpRf6U842v2A8ptRMv6ULkgfHq576EKhEorY4VvCPCk2Vz9uzDdb5uCbbBnCs+MYjs2s
	FllaPBSkhf2wehvBtyGlDqlA9sUPrPM4Rm
X-Google-Smtp-Source: AGHT+IGR+8e8x8Sok3xUZE8cgeqjUKnwOVhy4Sl4Kmx2qf8ehVBRuvTdCHw2VOyPB7/eKFtGOUM9ED8HbFP7y/UVPDw=
X-Received: by 2002:a17:907:6d0a:b0:ad5:4cde:fb97 with SMTP id
 a640c23a62f3a-ad54cdf0454mr725360066b.29.1747648312724; Mon, 19 May 2025
 02:51:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250518080356.43885-1-ziyao@disroot.org> <20250518080356.43885-5-ziyao@disroot.org>
 <CAMpQs4+GiZpLfSHx9k_QfWjXtyrNS4LS4dOuCKLbS-F8OhpoWg@mail.gmail.com> <aCr86zZWBu8yofdD@pie.lan>
In-Reply-To: <aCr86zZWBu8yofdD@pie.lan>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 19 May 2025 17:51:39 +0800
X-Gm-Features: AX0GCFupcvxY2bCkqvadgNQfWqHGYIwTvjOwJ7e2Dvl3xHsg7x1_J87MI46UxRE
Message-ID: <CAMpQs4LNr3oKXbJq0dQVuHg_xCih=8CQCAeqK=4JdF+WzaRhng@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] LoongArch: dts: Add initial devicetree for CTCISZ
 Forever Pi
To: Yao Zi <ziyao@disroot.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Junhao Xie <bigfoot@classfun.cn>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 5:43=E2=80=AFPM Yao Zi <ziyao@disroot.org> wrote:
>
> On Mon, May 19, 2025 at 03:58:29PM +0800, Binbin Zhou wrote:
> > Hi Yao:
> >
> > On Sun, May 18, 2025 at 4:05=E2=80=AFPM Yao Zi <ziyao@disroot.org> wrot=
e:
> > >
> > > Enable UART0 as it's the boot UART used by firmware.
> > >
> > > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > > ---
> > >  arch/loongarch/boot/dts/Makefile              |  1 +
> > >  .../boot/dts/ls2k0300-ctcisz-forever-pi.dts   | 45 +++++++++++++++++=
++
> >
> > A minor suggestion:
> > As we can see, the existing dtsi/dts files are prefixed with
> > =E2=80=9Cloongosn-2k=E2=80=9D, would it be possible to keep the filenam=
es consistent?
>
> It's abbreviated since loongson-2k0300-ctcisz-forever-pi.dts seems a
> little too long for me, and naming devicetree files in form of
> <abbreviated-SoC-name>-<vendor>-<model> is common on other
> architectures.

Sorry, the length of the filename is not really a major concern for me.
>
> I won't insist and will change it if you consider consistency really
> matters.

Yes, I actually do mind, let's keep the naming consistent.
>
> > >  2 files changed, 46 insertions(+)
> > >  create mode 100644 arch/loongarch/boot/dts/ls2k0300-ctcisz-forever-p=
i.dts
>
> ...
>
> > --
> > Thanks.
> > Binbin
>
> Best regards,
> Yao Zi

--=20
Thanks.
Binbin
