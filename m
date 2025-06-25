Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAB7263F40
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864160; cv=none; b=BXvi++tGsPd38QcEsECYtvBFuUh3w4keMe496P4JlJuzCUGG7AvKZLrH0VzWMhothtuqDZO04wOClSV+5S6WSd52Dn+OZJ9YU+ArEXOBGhA/CvXv9UKvl/ALsPGIT0xrcpGkChyTAFfDBVN3pLN0DkyNSfpsCwV80fo5+W6Akr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864160; c=relaxed/simple;
	bh=K4mYB4tBUdPUMeyYHKQeTaMy0h6gvtr/bFiZgucNrGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nufZjyRIq1CwvbThFVrqb3xJV2XsIrcAHy30Z7MH1Xp7xCpVqxRFJz4cTNddpqk3CR9QeLZ+3LZKG+zUEsaw72HRBFEZTCTgACpCauVeAFaUtAV9EMMdiczpgkwCVi4AKopkUf08gfaTIq2ZwEF0KfPC7irV5Cn91DiIuNS1mBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mHgmM4BX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mHgmM4BX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C88C4CEEF
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750864157;
	bh=K4mYB4tBUdPUMeyYHKQeTaMy0h6gvtr/bFiZgucNrGA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mHgmM4BXZJdRLA0AG8FpjshWGQcHIqK9vLXP8xrXwqtKjH22HXCsv7UYj10oqkN8z
	 /LtHvk9uB6Yqvbg54izwnIFlWrolCXxgYCLU+9Ja2dMbiDosKca4o9IYdGzUsVuadL
	 /U1rd74XDe9OV+FGDFgI+a5+P3HwwmB7bsYlo6CDUHT/Eemt9BvChK3orbvOn3llqk
	 n9oNrj2ors43SO9zV7V8ebymMt700XOF19CF8WItb0PgFmxMJVYfPafMVqgAIe+9oV
	 l79yWiLyXnnSwK/S0REqytiLrnXK5ntYSrNe6n2mzp8+K//SrwW/JHfca66U7ij3iI
	 YiNUbuIIeSoVw==
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-31223a4cddeso5285327a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:09:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV2LMXjhc+g0Q4LOjjwWa3YaMb5B6E6bu1QY8hVN4pGEHVvJQYI+zL9S6wZgNLzYoLZSQjqBPNG8cZHv8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRDgcJnOEhdlrK2mcz1TTzSC8JFuOvZqBEg6RGjch9uICi8aAv
	SwllY8J8kvwqF6KZN/Q7xpm9oUfeQXV3xrOzPDr0kVRgkBclXO/rLphr+pmO1Y2j2b4nqAqnHch
	So0KIsybUS8MFjjGpu5viibLrs5F8NQ==
X-Google-Smtp-Source: AGHT+IHrqFJYwexIy4K3H44OAiL9zqXRsG/mR2uBGM9V193N8VPfdgtjIMDquzLnT+KvD4r/VPBCj9+QTqb0x8H7bj4=
X-Received: by 2002:a17:90b:4a0e:b0:313:287c:74bd with SMTP id
 98e67ed59e1d1-315f26b8a00mr5619136a91.33.1750864157037; Wed, 25 Jun 2025
 08:09:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624113223.443274-1-jason-jh.lin@mediatek.com>
 <669aae01778b4dbd49420fff053a6fa59078a9b1.camel@mediatek.com> <6e7ab8ab603ed8ac06c7a6b639f339c1d87f9ad0.camel@mediatek.com>
In-Reply-To: <6e7ab8ab603ed8ac06c7a6b639f339c1d87f9ad0.camel@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 25 Jun 2025 23:10:22 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9SKSwikTwog9aGL1LOdsgbnBFz-7wHRNWxa4fY36_dQg@mail.gmail.com>
X-Gm-Features: AX0GCFvhdG4cEt57zmk3oZRU1MyycMA7E8SYirD5Luit-6MBhB9-QKGa6QYUkZk
Message-ID: <CAAOTY_9SKSwikTwog9aGL1LOdsgbnBFz-7wHRNWxa4fY36_dQg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Add wait_event_timeout when disabling plane
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
Cc: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"airlied@gmail.com" <airlied@gmail.com>, =?UTF-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>, 
	=?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, 
	=?UTF-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?= <Xiandong.Wang@mediatek.com>, 
	"daniel@ffwll.ch" <daniel@ffwll.ch>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	=?UTF-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>, 
	=?UTF-8?B?WmhlbnhpbmcgUWluICjnp6bmjK/lhbQp?= <Zhenxing.Qin@mediatek.com>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	=?UTF-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?= <yongqiang.niu@mediatek.com>, 
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	=?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>, 
	"wenst@chromium.org" <wenst@chromium.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	=?UTF-8?B?SmFycmllZCBMaW4gKOael+ijleWTsik=?= <Jarried.Lin@mediatek.com>, 
	=?UTF-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jason:

Jason-JH Lin (=E6=9E=97=E7=9D=BF=E7=A5=A5) <Jason-JH.Lin@mediatek.com> =E6=
=96=BC 2025=E5=B9=B46=E6=9C=8825=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=
=8D=883:40=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, 2025-06-25 at 06:54 +0000, CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89) wr=
ote:
> > On Tue, 2025-06-24 at 19:31 +0800, Jason-JH Lin wrote:
> > > Our hardware registers are set through GCE, not by the CPU.
> > > DRM might assume the hardware is disabled immediately after calling
> > > atomic_disable() of drm_plane, but it is only truly disabled after
> > > the
> > > GCE IRQ is triggered.
> > >
> > > Additionally, the cursor plane in DRM uses async_commit, so DRM
> > > will
> > > not wait for vblank and will free the buffer immediately after
> > > calling
> > > atomic_disable().
> > >
> > > To prevent the framebuffer from being freed before the layer
> > > disable
> > > settings are configured into the hardware, which can cause an IOMMU
> > > fault error, a wait_event_timeout has been added to wait for the
> > > ddp_cmdq_cb() callback,indicating that the GCE IRQ has been
> > > triggered.
> > >
> > > Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC
> > > MT8173.")
> >
> > This patch looks good to me, so
> >
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> >
> > But fixes patch is not correct.
> > In "drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.", it does
> > not support cmdq.
> > The first patch to support cmdq is 2f965be7f900 "drm/mediatek: apply
> > CMDQ control flow"
> > I would change fixes tag when I apply this patch.
> >
>
> Thank you very much!
>
> Regards,
> Jason-JH Lin

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> > > Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> > > Reviewed-by: AngeloGioacchino Del Regno
> > > <angelogioacchino.delregno@collabora.com>
>
