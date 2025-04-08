Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CEF263C85
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096807; cv=none; b=dtb3JjucJkCsx/hPMDqShmzaPnxjBL/2ANTC/b5L/oOlKEyHFEuyznUVGhBFgVRDLVW75tOUWoaYROVsvIQKFI+1uJe4p0ly6cBCnqS8Mg/OcbIkrj9qxhPhO5/whTGcKfWvvTU4cMpDzcHMqfPByLv9ZdZ+q3kt2hGrf/TDAmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096807; c=relaxed/simple;
	bh=4plZsCaDVN7RgvklUTtag7VRGzOr6OPuSI5iKrIgaLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cukFwWrBPqwR1NSbg28W3ZS92sZrfXVNZsDvg/NTJjSULtgecgcI344Z4Vybr/zY8dpYlEe1m03o5L4nmdAkNJkvtbU+k15JK3CP3VZvVLWa6SlGXs7KBdpY55Qb6eleV/qQTGGFrxetWYhD8icScokSEx4X6Z+JwX0MzUHlYOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B2c1O+v/; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B2c1O+v/"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaecf50578eso834112666b.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 00:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744096804; x=1744701604; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTwOlrF0d24dlqedylD50cDl9x2rs1fVLzWN9clcz/E=;
        b=B2c1O+v/NoDzL2/rOcS8ccndd+6Z7gy3o7EFuKOPs6q/760duqSmync+mcRRjMCWS6
         HfPNb/icX2IAwAEy+WKNHHT8E2TBz8wTHTxHIYBZ5jsyTiTCV5EqIK/yp9wQLwE1mvMv
         6hFXvDDQ3rsVdN2v7I066B857uB38+5vgtofeAIuFmRdTBkSzguXegNFwljDyMKo/NCx
         qaO/qOPbrFG10/Do+agwQZeTjKFeNLcv+0DaT2PzXyWFO8dtf5j99Q6d1ZCcrJ/hWR1Q
         Nznr2LBc3oLzQx5h34G/uYtMP17SxS7Tbfk/UMjZwvpoyd+Ajl1R/7Zt/bMsFpmEDqkA
         p+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096804; x=1744701604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTwOlrF0d24dlqedylD50cDl9x2rs1fVLzWN9clcz/E=;
        b=hNcZcOEsF/muKKnyofBrF/zJWQpSGhfVMt/m5G66v9SRQbmhkllGxYlWc5GzLZMMiK
         yTi/fp/3+NGU6/SnlF81WJeQoalObMSHPCn/FazPiYsEKtWXae19FGWPP2Lzrp+yOskU
         qotPIdTIHzO8UgBb0Bv5ozHXJn1vidBs4ho//nftWLiLv5/eBCMq6DGBXBen4sbPpkwo
         PTNjJa5KsEW0j1dy+avqwC1JG93UuwGjAoNLH540nXrKhq4V6gpRKoyVZuhr8Bk+MH5+
         MtP3z3m2s6SE8WBVtF9YgNfwspyx/lSKKbarf4TYmVCwkN46gVOlu6PHHU00tNgQwCdn
         IWvw==
X-Forwarded-Encrypted: i=1; AJvYcCUH2QjwJYRmeHyLs5Yxc+EIy4PAOcMSTNSZc0OuUAlD3QtWbDAT1P+ok0hAbom95qFIv7IlmdQceFEmrbs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCyKdxAc/WhSdSxQfdg4r8Rff111AbMGm8vq/EJuRo03rKkH4C
	cxKAIRjSwJTEgpvgILxsaVIyWNxehDDxfnid4IIuH4Ov2PFlHOIEKzU8W+fwDCHYCusNFm6KGNT
	Gqt3IwxbSOHepTmtioqEsR98Zsng=
X-Gm-Gg: ASbGncu46IsMUJJO2xvJRRfiCMGI3ciiRGEq0IE2Vn/88Jvqb9maLwlAXcMqFiF9tf5
	1/i6B/w8fsJvF3HgqbHl7pxH4a/BEwOP4nT/SlxcMqPHkJ4WWSwt6o11ziRpf+OPZAyYC5HpBkD
	2qKSJ38y/8vL729QDbMY3ROlpHZY51yy3F0DV2
X-Google-Smtp-Source: AGHT+IFnLlNvM1BA5x+l9kSxfc3WTETqn0b1CZzN+qipP7jflKN9kpZoK/A0y5io6eZihIBFI4b84z5Kk0ND9TuW5jU=
X-Received: by 2002:a17:907:2d11:b0:ac3:413b:69c7 with SMTP id
 a640c23a62f3a-ac7e76232e7mr756892866b.39.1744096804095; Tue, 08 Apr 2025
 00:20:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1744061673.git.abrahamadekunle50@gmail.com> <4ccdbfd3e8d74d99679927f294f71cfb694fcc6c.1744061673.git.abrahamadekunle50@gmail.com>
In-Reply-To: <4ccdbfd3e8d74d99679927f294f71cfb694fcc6c.1744061673.git.abrahamadekunle50@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 8 Apr 2025 10:19:27 +0300
X-Gm-Features: ATxdqUEJnYGusuodtr40_5xWJ_LxPs_XfjyQDlSUxGueIZpjAE19pNnaLRe8eqU
Message-ID: <CAHp75Vfp8Je1fUavSwTDAM_5_rDaDfXETa2oM5f0CjL1mxWX_Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] staging: rtl8723bs: Add white spaces around binary operators
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: outreachy@lists.linux.dev, gregkh@linuxfoundation.org, 
	julia.lawall@inria.fr, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com, andy@kernel.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 12:54=E2=80=AFAM Abraham Samuel Adekunle
<abrahamadekunle50@gmail.com> wrote:
>
> The code contains no spaces around binary operators making it
> hard to read. This also doesn't adhere to Linux kernel coding
> style.
>
> Add white spaces around the binary operators to increase readability
> and endure adherence to Linux kernel coding styles.

...

> -                                               psta->BA_starting_seqctrl=
[pattrib->priority & 0x0f] =3D (tx_seq+1)&0xfff;
> +                                               psta->BA_starting_seqctrl=
[pattrib->priority & 0x0f] =3D (tx_seq + 1) & 0xfff;

> -                                               psta->BA_starting_seqctrl=
[pattrib->priority & 0x0f] =3D (pattrib->seqnum+1)&0xfff;
> +                                               psta->BA_starting_seqctrl=
[pattrib->priority & 0x0f] =3D (pattrib->seqnum + 1) & 0xfff;

You mentioned Linux coding style, which also requires lines not to be
so long. These lines are. That's why a few versions ago I suggested
you to change these to be two lines each. I don't know how many times
to repeat this (it's third one).

--=20
With Best Regards,
Andy Shevchenko
