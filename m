Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5944433A5
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 01:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745718407; cv=none; b=geac58GgQo5cyPIiULnEUR8MHFl5AiWVKe0yI8vBhmsf0q2qgQwmI0afe2htX57bf8wTt3knNXLJzQ+Y4g+QELEVWBqPKTtlqjvt2t35RED1hDVNP3LawZp3mm1KA3PMrIggm63i39y4axm1eo781dA0BXAjlaAf6H3Auv/BORM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745718407; c=relaxed/simple;
	bh=SnY0OVfoDmbXp5koX1Ut+7k1dmo/CROGEsXd1gmHnO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pQCxOHxd534PZ7v88DCRZJHn/voTRNnV9tDp3vxenTJhcUTEiwY3tE3E2JOruGLT3y2nowl37oK57x1PP742OcdV7rRuf/Esd+BWhfI5XVNgqXJ1UkAfcOruwaX7zkmNUhVCzFzlAbQeQDZP9kirFBBp5p28UcA5EAWqPtOgcIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OjxSi1cn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OjxSi1cn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11935C4CEEB
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 01:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745718407;
	bh=SnY0OVfoDmbXp5koX1Ut+7k1dmo/CROGEsXd1gmHnO0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OjxSi1cn6I5f6ICjrjhXad56TRK1i+y/AHQUc/5otvDDX7e8TDm1YRqpkH4hH/fyH
	 0YFMywvkD/ZkBq/p7QXyE7sQFYbfvlTbECFwj1fRASa5Ffu1GHwJUtWXlOzEdR/8BF
	 WBIT8efXIoqHNb9FLAnQreDsJLDiRFPlTUY05MZh/0jSH4YF8mToo4nuPrxNmT1K+2
	 +MvbLrUEaIIvlAKsKRlTGJB/G3y0xRhWBd4TZ8+xfBs18SV6LKPdxtiux/pA95X32x
	 lEeECD631518qCrdROzHls1T3vX6194Fr4Cy7239dOcsEkt0LyidiDrBnf6URhFngi
	 3yDVgCn/TYSwg==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so4567246a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 18:46:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUej+06k7mPI0cplWUZYKb3A8+1t8zoHUPLeMt2UZHj6D4nJW9+66OazCpmT0WP7IEldpE2klSpMKzf4Hk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+CsF4mIx6d52XFIa+Rqi13IjLPW++drqjfl1Fmk7I/kaBHOi2
	pWjr97d2ANX5U14ppi0DZfAakVsbZnQiv6v3fseLUybKxsq9Gs0zjEZCLaTH4ZJ/h2kCw5VFIuH
	JNBGmefxNUomc/ymshsgDxWnoNA==
X-Google-Smtp-Source: AGHT+IHwFnZmrXrm96vl8R7jE4+InC0lzNGtdGV49DZM/HkH0U6QBLErQWPSVSddA8htDu0Z5bOVhme32UVMcNPgYiE=
X-Received: by 2002:a05:6402:3582:b0:5f4:370d:96bc with SMTP id
 4fb4d7f45d1cf-5f722673ab2mr5556823a12.2.1745718405627; Sat, 26 Apr 2025
 18:46:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409131306.108635-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250409131306.108635-1-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 27 Apr 2025 09:47:35 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-YRTsGZc6BK+Z55S8vDtyRiK8+YmH5ot9S-0uZ74ZvLQ@mail.gmail.com>
X-Gm-Features: ATxdqUFIcH_9J8n0sw5vPGyhuF-f63RdB61FF-kV0-kFcASs5EUXu7xSvR6Jfcg
Message-ID: <CAAOTY_-YRTsGZc6BK+Z55S8vDtyRiK8+YmH5ot9S-0uZ74ZvLQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] MediaTek DPI: Cleanups and add support for more formats
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	lewis.liao@mediatek.com, ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com, 
	jason-jh.lin@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Angelo:

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2025=E5=B9=B44=E6=9C=889=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=889:13=
=E5=AF=AB=E9=81=93=EF=BC=9A
>
> This series adds support to configure the MediaTek DPI IP to output
> more formats, such as YUV422 8/10/12 bits, YUV444 8/10 bits, BGR 8bits,
> and RGB 10 bits, and also performs some cleanups that improve the code
> readability when those are added.
>
> Even though some of those formats are also supported by MT8173, MT8183,
> MT8186 and MT8192, I am enabling them only for MT8195/MT8188 as those
> are the only two that I was able to test.

The whole series is applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> This was tested on:
>  - MT8195 Tomato Chromebook
>  - MT8395 Radxa NIO-12L
>  - MT8390 MediaTek Genio 700 EVK
>
> AngeloGioacchino Del Regno (5):
>   drm/mediatek: mtk_dpi: Use switch in mtk_dpi_config_color_format()
>   drm/mediatek: mtk_dpi: Add local helpers for bus format parameters
>   drm/mediatek: mtk_dpi: Add support for additional output formats
>   drm/mediatek: mtk_dpi: Allow additional output formats on MT8195/88
>   drm/mediatek: mtk_dpi: Rename output fmts array for MT8195 DP_INTF
>
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 117 +++++++++++++++++++++++++----
>  1 file changed, 102 insertions(+), 15 deletions(-)
>
> --
> 2.49.0
>
