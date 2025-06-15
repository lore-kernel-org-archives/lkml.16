Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830B527CB2A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 18:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750010617; cv=none; b=FlNjQr7ae4zTQsp1gMSY28eUuSdbV/TDq7/Sr1LBH18oIR0TrIQ2VZac/Gr22IvwrhzVbW1u9LgfNtpnW94PHDbb8ykA0gA24hRqyYiDOGnc1pf11nznoeH0yaRh+TmZfebiBdZHO6Vu/ezHoobCH2onUYe1wbb8WIXenyDjp6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750010617; c=relaxed/simple;
	bh=PlRTCFIaktTJrwTM9zdMzdYJh30vVq7axGeMrc1YG9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=KkSgcdxBZ809SsZQiCJQRNqofK1IaTugPHXzFdyUjgQoJwP2FmgCIG3Bs344mhiJicnf3rfO1+U+rp5viMh7ph/gRG5iueKfVgenpWSToMHS1MBe+M+RRI5lRmwiGDb8yMIDHubtLvjPE4dNRg8W3nTo0UWlglcdnf4Ijud8apk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=noa-labs.com; spf=pass smtp.mailfrom=noa-labs.com; dkim=pass (2048-bit key) header.d=noa-labs.com header.i=@noa-labs.com header.b=U1MDZ4zN; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=noa-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=noa-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=noa-labs.com header.i=@noa-labs.com header.b="U1MDZ4zN"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7cad6a4fae4so745912985a.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 11:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=noa-labs.com; s=google; t=1750010614; x=1750615414; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJzJWiAUcXoGUufc25EqKcGHZSJBHVOqDRbtVmrlin4=;
        b=U1MDZ4zNL/H8CMDpGIdJHYTqHrq0E7Bv+bDKpmkHDExiFvuKTeDYcS3GXTa4dRIvTg
         gb3EY5GQKLXZI+m3azZa5sdxVAhUjHpQ/E2mZy6iElCqIzTWo7dQRAfwngVY0mamEweB
         F8Pf5iEU8Ssev0mOwM8jdoe2bePCNF+7iEROiE/oWyb0d+9b0WrbBW2Dh4vFPASwqSS5
         wIme8GRTBmWIpTs4/0aMOduEiFcdkbYzDKGe21iM1lNm47UW6I3l3D3oFQXBToOOvMSL
         8pmHZ9UJQw3qg8eSkbqlKnVabR1LRcHvHZELIw6WDxZvYFqCXjyuDjHo18A357KEfaGv
         tyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750010614; x=1750615414;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJzJWiAUcXoGUufc25EqKcGHZSJBHVOqDRbtVmrlin4=;
        b=Lv6p8b1QhiRKs+qd4PIK73T9VcImhAszl6KYgBHem9MyE2CiTjOD321nywyDCeiZab
         iwwPMW8/D3Wx1dxI+W1iV0xHGJeUrpNi4xM3smXlMfNbxkTCWO1mP3w2+Vttaoq/YW+V
         dRg/7X3dMt+4/jK2ugaFQyZfPwQ8nCF/rnBYTPLyIgS/B96trVUIy+goEA1N0TJr8ZNX
         WWMQ1ngnOc22f1/AreH3EIXv4e5TlLxCQx7xza3UJHFG7lLWRYugDCzUx5Z8eHPE75CI
         V7asrKSQt1QK3PWdcab5b8B0cYW8gaGBhp7w8xE42cVikAlJEYdYwLxgWDMc3xqK66nw
         WoqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUH72IRVP9mSujdx8cMlox4NnMXG687xdaWrppSWplZazECSkvTgdJOTcWo22EbSUXlyH2jXx/61h/07w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgRi70ByUnpLALlXuhWHhBXcYqHJNjhA172zYRM3FGwHQ97Wh9
	ta6ue6rZDap1hc8NWHD1So/kk5Fw3H9TH+5/BTFCipb4GbFGgvxHeX13awpSSyNQvNofqmvJ78u
	9UyAlVRWhWu7gCbTPt752JdPk1HpN8+Jhg3V9frAHfcxGD7D9vcYb1caSYgrt
X-Gm-Gg: ASbGncup0xqKyJGnblqVRBhGiec5ZxolmiOvc0dMxi9KEyiaGnd6SVObkof3FRCPn7b
	vIvEO7QPjdOXk9+o5qBklQ+Tg/F699cbhCPrtXT0k4hJWQR6knBqOZ8wrHHlA8JmzB/Re/zpIkd
	znlzQ8NCd/jOYI6H0beAsN8nUB5CfqIpfJ7KR2O9Ccsw==
X-Google-Smtp-Source: AGHT+IHOdM0tFaPGlKuBpxxcBaNQZgl/tLp0WzYy1mmPLjEcUufeWBRfHXaQNDnJQFtgO9AF5n/mz803UFZs7w6NFhA=
X-Received: by 2002:a05:620a:1714:b0:7d3:b8d2:8790 with SMTP id
 af79cd13be357-7d3c6ce4ec2mr993841585a.44.1750010614442; Sun, 15 Jun 2025
 11:03:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdUyX-7Qh7RcdrFPmL++OSVFuUqXks6NArsssQvHX_Epog@mail.gmail.com>
 <20250614123139.16634-1-pavel@noa-labs.com>
In-Reply-To: <20250614123139.16634-1-pavel@noa-labs.com>
From: Pavel Nikulin <pavel@noa-labs.com>
Date: Sun, 15 Jun 2025 22:03:38 +0400
X-Gm-Features: AX0GCFsRiW12EPy-LfD0r_TEr1K5nekWbKpDM0M_9ocR-T6s_SVWlIPbM2-GMh0
Message-ID: <CAG-pW8F7MPc2SMBto_XturSMz3MSULHjZn=_dH7EMHSzkQ_7HQ@mail.gmail.com>
Subject: Re: [PATCH] Fonts: Adding all Terminus fronts from 12 to 32 in bold,
 and normal versions
To: Jocelyn Falempe <jfalempe@redhat.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 12:53=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> converted

Fixed


> > --- a/lib/fonts/Makefile
> > +++ b/lib/fonts/Makefile
> > @@ -14,7 +14,23 @@ font-objs-$(CONFIG_FONT_PEARL_8x8) +=3D font_pearl_8=
x8.o
> >  font-objs-$(CONFIG_FONT_ACORN_8x8) +=3D font_acorn_8x8.o
> >  font-objs-$(CONFIG_FONT_MINI_4x6)  +=3D font_mini_4x6.o
> >  font-objs-$(CONFIG_FONT_6x10)      +=3D font_6x10.o
> > -font-objs-$(CONFIG_FONT_TER16x32)  +=3D font_ter16x32.o
> > +font-objs-$(CONFIG_FONT_TER6x12N)  +=3D font_ter-112n.o
> > +font-objs-$(CONFIG_FONT_TER8x14B)  +=3D font_ter-114b.o
> > +font-objs-$(CONFIG_FONT_TER8x14N)  +=3D font_ter-114n.o
> > +font-objs-$(CONFIG_FONT_TER8x16B)  +=3D font_ter-116b.o
> > +font-objs-$(CONFIG_FONT_TER8x16N)  +=3D font_ter-116n.o
> > +font-objs-$(CONFIG_FONT_TER10x18B)  +=3D font_ter-118b.o
> > +font-objs-$(CONFIG_FONT_TER10x18N)  +=3D font_ter-118n.o
> > +font-objs-$(CONFIG_FONT_TER10x20B)  +=3D font_ter-120b.o
> > +font-objs-$(CONFIG_FONT_TER10x20N)  +=3D font_ter-120n.o
> > +font-objs-$(CONFIG_FONT_TER11x22B)  +=3D font_ter-122b.o
> > +font-objs-$(CONFIG_FONT_TER11x22N)  +=3D font_ter-122n.o
> > +font-objs-$(CONFIG_FONT_TER12x24B)  +=3D font_ter-124b.o
> > +font-objs-$(CONFIG_FONT_TER12x24N)  +=3D font_ter-124n.o
> > +font-objs-$(CONFIG_FONT_TER14x28B)  +=3D font_ter-128b.o
> > +font-objs-$(CONFIG_FONT_TER14x28N)  +=3D font_ter-128n.o
> > +font-objs-$(CONFIG_FONT_TER16x32B)  +=3D font_ter-132b.o
> > +font-objs-$(CONFIG_FONT_TER16x32N)  +=3D font_ter-132n.o
>
> Please use descriptive names for the font files, matching the
> font names.

Adjusted
