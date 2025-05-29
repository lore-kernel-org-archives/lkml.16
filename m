Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBC71632C8;
	Thu, 29 May 2025 17:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748539645; cv=none; b=SFoEzVWUX5TvFu66nCBu8hMgmjXXmeTbE8O1txqA8xeBN5ROSRQCW2AG0TSdqrSE8y+E+CV4ZBuvGKnNEfxDGpx9rdGIxRJ3bjaJP8M4HdKTYjbNOuGDMlKKHnhM+osGeOM/Gii2y/X2RtkHKJKlgxiVXJ/imOXrDWQKIRPDT6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748539645; c=relaxed/simple;
	bh=ajQTKsp2k+COAp8eVCvXoYherc4TbcmqdYiY2XM3q3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JiMKTRhSpMpZtK5zAxCnOn+fAXur79AsujwppK8+6C5sO0rEctRRBUIlKq+whqvbfvtzYEWv+Ra5/asNYufTpjjQ8n7aBMiMp5ty6/TyhR6sJc7IxOf3BQ7TpqURehR0P4mR6G7NghBlARtWBVB076BJhkNbn3uRhkf53lSE4jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IBXHrB3N; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IBXHrB3N"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3dc7294716cso9480345ab.2;
        Thu, 29 May 2025 10:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748539643; x=1749144443; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajQTKsp2k+COAp8eVCvXoYherc4TbcmqdYiY2XM3q3g=;
        b=IBXHrB3N1RrePZo4OYoOpczOqtRSOgHjm2g+1cpa3NvpT8fMOuf/i+VGE8Uyo+Kq9X
         t7XxhXtSjibIjUfOAImQl8Fa2uUE4Nc/Utwwo2dVABOla3Wg/R7le5nC9MWi2m3++780
         1wHr3CWseJ9ObdbpFxOEu0KB+nLJDlbaJXNybp6y1O9dBWoSXyQitw8fzTFCdAgdfVeS
         rr8Wqg1Jp+TjZAG2Moe/P243kdPSHHi2+S77WuvQ+EC0TfGk0V4MYXWNrfJ+Lj6KLhbW
         bJ92/ZeaayLkfwiGaLQ5bvisnUybMHsAQFf43BYTJ/Ezffnnl8MsDBhRZe19OPa9gfRd
         v3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748539643; x=1749144443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ajQTKsp2k+COAp8eVCvXoYherc4TbcmqdYiY2XM3q3g=;
        b=UWeXpICKyE4vQWkC//y63OjacWVrWoSB4mMD7AGtKn2TZkn6HGAxeBiAsf7YE4nduS
         rgEawvqJCGhPFobiHn8Fl9CFUnr5OQ5Zejwyh8LVuC0MUHfrXFw/IO2QXQWdfO1tajhG
         hZohrs0QvW6gg7BemD9VeVC70K5seMotZWEX4fCR+AOVsc8YmjQhQmcUWaGE97ldkToo
         N8DSEikeRCG1lNz7RQySwZPKPrzCXeeuxbOaHn+sipceU4RTHiBhGFZTsGDSX6PvEBLB
         HLso8JeGUXIxrK/oty6EjdAJY843yPKW8SJZmgKTLK3rpfRJrogiQQWUwW1erm1h+oTX
         Y9Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWSsjiHJNNh+Ej4hSTiJoZgrg3+l+QKHE6RJ3j8xlL8rv7ondurKfRg9VtCfKQabNfw9ZLs0gJHexeH@vger.kernel.org, AJvYcCWWNyeOJLovV7rtMh/WS6vHkqr74nnznGOj6/8AC7e9kC15D5/fXncs4G3pu5/tik53IXh9IwZL/v/zC82Q@vger.kernel.org
X-Gm-Message-State: AOJu0YzFymTobhfgWsq5hG+oGVCdUg26f96T7Uow53bZdMgKuv2wCUYh
	Wj+Jf+64gMsh4h2A6KLk6xSS9ZHs6XmZvDGgeiCltWoWXGhDReOVwHPquOk3h9VME7yk5JU8AZO
	XtYAVeESeaPvLDch8fEfZmQs4C15S2Ko=
X-Gm-Gg: ASbGncskJd0YUTKPAr+Rgf7mhob4Ycyn9aXMwQw6p2rJZxO/tiw5cEAwp0vmkjJ7CEi
	3FUPJVh3NxOeGH30wjzxJlaMrXx3b1v8xVK1W8CQf/Lw7pOefT9Cj9Cl98rr2d8XTcKD1E7zxWs
	T1FXmg3PxhdQkX6TWbYs+sWpXzACAts6ywUKB5kqMXgA==
X-Google-Smtp-Source: AGHT+IGmfLftFKbDjPUrwhZwicuqQxLIwzoCfWWeirKpn1IUl46FhVaamkvogKo9NxIBYcyFiWPlwqFTeQ9zfcW19XI=
X-Received: by 2002:a05:6e02:3c86:b0:3dc:857c:c61e with SMTP id
 e9e14a558f8ab-3dd99c289c0mr9051885ab.15.1748539643157; Thu, 29 May 2025
 10:27:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <174735136138.1544989.11909422896170025756.robh@kernel.org>
 <20250528221823.2974653-1-joseph.kogut@gmail.com> <20250528221823.2974653-2-joseph.kogut@gmail.com>
 <20250529-impressive-real-monkey-a7818b@kuoka> <CAMWSM7i+eyV4t3xzSXdDyGrBr101V9rG1xMgsTbpjyqpu+hjYw@mail.gmail.com>
 <3a2b9bfb-81b0-473a-b58c-76a2dd7f434e@kernel.org>
In-Reply-To: <3a2b9bfb-81b0-473a-b58c-76a2dd7f434e@kernel.org>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu, 29 May 2025 10:26:47 -0700
X-Gm-Features: AX0GCFvNxRjPdyr8yhbcLu1TfazWvzDwAFaQdGZbh1fnbTEWqCXXjJppI9Ifugk
Message-ID: <CAMWSM7h-naYcgy7hrfNd0tDLTx21jFmvV4X8vU1V4py21PNVPw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: rockchip: Add Radxa CM5 IO board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Steve deRosier <derosier@cal-sierra.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 29, 2025 at 10:07=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 29/05/2025 19:00, Joseph Kogut wrote:
> > I've reviewed the man page for git-send-email. If I'm understanding
> > correctly, I should only thread the *cover letter* of the patch series
> > when submitting a new version. That didn't work for me here because I
> > didn't initially include a cover letter, then tried to thread the
> > first patch in the series. I see now how that would be disruptive.
> You should not thread manually anything. b4 does it for you. If you want
> to use git-send-email, then you also don't care:
>
> git format-patch -v3 -3 HEAD
> git send-email <whatever-to-and-cc-arguments> v3*
>
> That's it. No manual threading.
>

I wasn't aware of b4, it looks like a great tool for this workflow.
Thanks again for your help, I'll give it a try.

Best,
Joseph
