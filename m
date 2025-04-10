Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FEF1D61BB;
	Thu, 10 Apr 2025 07:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744270231; cv=none; b=e86nee5k5MNDbbmSbG33NQZmzLBF9so6/TEpctkixLhKCSHjV/zUJxf5Oe3IOWsxOs7kmb8qlZOnlxqVVyAAySs5McDTCrF16a86VMlInitqAChDJUAK0PSg1wYAUnRPcHobDPTJBehkM+mK5KNQ1pld4gjJqFT0EE9glkBsfP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744270231; c=relaxed/simple;
	bh=iFW+QfyIwEbGD+j1q5thV7kMOb3+F5ptBk/zfUifQ5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KWTVwvClIiXeHKz2izooH1o6mI4lU0e2Je90DmNhn7XpOQG9i6j/hiuGVw+/At8PKTzg7BcJn7FAHt9sgLNQkCpAYyf6TKaoZ83RLMpZV9Whxn4EhKXIQqK3Km+BmMHZYkSRx/2OFCwZN7knfJ/SMCJo7SbWKGRM7fQ1+qM0ERU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-523fa0df55dso1537482e0c.1;
        Thu, 10 Apr 2025 00:30:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744270228; x=1744875028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9o1fBfdX3QCvvMjGP9Bb3+iIudc9m8AmMEftLcu43No=;
        b=BiC0slc7q6cMyUMFEiBHhvs/68vibZA2bTv7SvDgR+pg02qOQzu+LFkm49W8HNHoPz
         oKS0qoyIlnNEYyceOA+UIY04anMh4X0ZD7w9LfNeJOyyPCpF9m8ZffmW143JiqhbSQEM
         whvbx1ZuXn/ZUAk1VE662a+A+vvXGRQUAkjng8e9hoM6NztJPGyq7bKsXMQjqiUVU3SC
         FanLMVZg8sXqAJE/6Eq0zCDzP9ekFTecGcA4hrPiTnn0kxAfFDM6t8n7lg4c3temX2ZJ
         jAHweZcCyBZTaz9clz6h3HbgmkK99DbxXt/upxdp0msvqpjoDtEZUeHmPWlvRRwMlVVZ
         v+Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVSiUg+vBC6J4Uuj8QqNQ9euW0fr+aBNVAawI9I54UehftYMlFN4HG9uo0Egx5ZfiIRz6XXe/JZfMghLTu0GUI=@vger.kernel.org, AJvYcCX8fvHIxgJlQPeY+71uppnTYy+WJ85lG6abE9Coc7nGiPZY2acRHSrF1rEhKF5qb/dNwtJqPQp/O2DSBJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmGCH4Ilr8BVIvUFxzrObj+7N6wsM0cW+38+VGozvSqYpEws1M
	lsMVegiejN/uVox0MkkKDbCyVx+2aLbUk2SK1FSinM/laoZRn/zMNvdC061IEgg=
X-Gm-Gg: ASbGncvgF35mXmj57ZSZregf56TGxoVp63dJ6A3CLVpAnjUx/v1IMTKnn6gK9PQHfvt
	1HI7lieTNCVFuiuJJ9FHWSZFcBETTaXYlUsgWx3oeeYGdUw+KbJ2DEyTLkARNkVReSz1hWxPQuT
	M2dY+YR5ut0URr35mO8TAcSCgPZwhocIkuXQVadhtf7rKFNXtNFRtE7e0PX/fPvOgfuw8yO7l05
	Dscp0/c5zoIzQLxtMeTowXZwH/xnzwPY6RUGrKrnQCwohynGpcE5/yIzgnK24AhM97WODfsImZe
	ZgTmsDzdeBA93wiSqM/VN6r2RNwhIECswqFAcO0IroEqvo5b03/vcZ4EAcy9c20IoUInaleGcxX
	CTGWldyJzNj1rKA==
X-Google-Smtp-Source: AGHT+IEU3c+ZXC9asy7zunAQLhEms0N8OOIiZxDv5KYjW91SpzndoqVlpeU34scyZLcCXrM9e8Hpow==
X-Received: by 2002:a05:6102:5548:b0:4b2:9eee:666e with SMTP id ada2fe7eead31-4c9d4246c31mr840038137.4.1744270227911;
        Thu, 10 Apr 2025 00:30:27 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c9c98afd43sm487261137.20.2025.04.10.00.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 00:30:27 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86dc3482b3dso1581657241.0;
        Thu, 10 Apr 2025 00:30:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUDyzqS+SZVzpGKdc4WgLTHbdKFIs1PrY3SnwOjywJBvL9FbNgGuXYoLMt4YXKQbrc4tFwnI8HvDxaWNbQ=@vger.kernel.org, AJvYcCVfJHB1GPx78fqB6w9z2wWNrszqOt/qJCqwSOkEFtbTXSgljuW13MK8giagBaj+ABbFzQbImL1dWc+t/gb0YaM=@vger.kernel.org
X-Received: by 2002:a67:f5c7:0:b0:4c3:b75:16e6 with SMTP id
 ada2fe7eead31-4c9d3fc4c38mr837750137.10.1744270227560; Thu, 10 Apr 2025
 00:30:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409061129.136788-1-fujita.tomonori@gmail.com>
 <CANiq72mbci8kxEx5jrq=HVc6WKuJqq8NCLzNsjH1wFcJNoHm+w@mail.gmail.com>
 <CAMuHMdWtgSjxeGYJVNzeWPOCd9nUWeKQnCtFQaROQ1o=r_-QwQ@mail.gmail.com> <ab0490cc-ce86-4492-a088-fd2ae03f1475@app.fastmail.com>
In-Reply-To: <ab0490cc-ce86-4492-a088-fd2ae03f1475@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Apr 2025 09:30:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXk+MfwPtm_whA2nWde0t_Ft=n=4xCO9hqAm-yuS+He5w@mail.gmail.com>
X-Gm-Features: ATxdqUEn3DKP5E0KW6CdNHS_yejpIaRbcErnLPFBtAL1D8Oqr0CTfb75MAhqP40
Message-ID: <CAMuHMdXk+MfwPtm_whA2nWde0t_Ft=n=4xCO9hqAm-yuS+He5w@mail.gmail.com>
Subject: Re: [PATCH v1] um: fix incompatible argument type in iounmap()
To: Arnd Bergmann <arnd@arndb.de>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>, 
	Stephen Bates <sbates@raithlin.com>, Danilo Krummrich <dakr@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Wed, 9 Apr 2025 at 21:07, Arnd Bergmann <arnd@arndb.de> wrote:
> On Wed, Apr 9, 2025, at 19:07, Geert Uytterhoeven wrote:
> > On Wed, 9 Apr 2025 at 16:48, Miguel Ojeda
> > <miguel.ojeda.sandonis@gmail.com> wrote:
> >> On Wed, Apr 9, 2025 at 8:16=E2=80=AFAM FUJITA Tomonori
> >> <fujita.tomonori@gmail.com> wrote:
> >> >
> >> > Align iounmap() signature with other architectures.
> >>
> >> Most indeed have `volatile`, but nios2 and m68k don't -- Cc'ing them
> >> just in case.
> >
> > Indeed. Apparently the volatile keyword has not always been there...
> > Why does iounmap() need the volatile keyword?
> > Why does pci_iounmap() not have the volatile keyword?
>
> In the old days, a lot of drivers marked MMIO pointers
> as 'volatile void *' rather than 'void __iomem *', so iounmap()
> and the readl() family of accessors need to be compatible
> with that type to avoid a warning.
>
> By the time we introduced pci_iomap()/pci_iounmap(), this was
> no longer common, so they never needed it.

IC.

> In theory we could go through all the old drivers and
> also remove the 'volatile' markers from struct members that
> store __iomem pointers, but there is no practical benefit to
> that.

Most drivers must have been fixed already, as m68k allmodconfig
does not complain.  Still, I guess I should update m68k to match the
others, right? (FTR, that also builds fine)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
