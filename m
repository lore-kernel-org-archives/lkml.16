Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE65EEACD;
	Tue, 17 Jun 2025 03:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750129862; cv=none; b=RH38vKxuVX0XCUSglatCz9zRlAZd5Syrdp63FiPZoyd8MN3AV+7CA8fJaeQsCrH1JduoyM61WXPLzwxJHCaGn4KJSAvUpPYYcQh1mBmg74HBVofNA85Epv7ZiEb59zmNqXcgHy8mTQn0Q65a9a+Nvr4uLyZ1lJuuW/VqzWkf8ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750129862; c=relaxed/simple;
	bh=P2gwYOiJnrjoyWPiA6pZyt/pEwOiSDOqtgbrjnRu1iU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dfkg3XNs2Ebsol2L1UHqyiwWod0QyxxPsdQhLu++xTiybDhtIR/GLFGpMIjxi6CNb7hRI7Qd5NTDEtjKQ9LHJE2Tcnr59Ja7SiwbFZ0FnLGWfsR5L6faKMR9kz4fZ1fif9Uhe6Q0sq9FqOjHvE+A/Y+oFdLVKLPU8RMN4eq+0io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ODYErfOc; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODYErfOc"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3d8020ba858so59155215ab.0;
        Mon, 16 Jun 2025 20:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750129860; x=1750734660; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P2gwYOiJnrjoyWPiA6pZyt/pEwOiSDOqtgbrjnRu1iU=;
        b=ODYErfOcrZO3a57JiUFV7NoaweCpNUDefUEXKNls/FnW4YvHR5UV9CV+PvlEx0g6aI
         D9TPU72zvpUzX8Al5nxGBRuK5eKN1MYlvbUXO9DddxMVaQX4vcJgO/p0vsfamq9X/0bg
         rIubqUEFhsMpdLhkGvyI4X+eHvp6Ewk9LZ6GAfXgeI1KigAcLT0XkwUNAE1fn3NMD1QY
         J9BsFPkkLhkZxuKpbFf2aZawfw7WCwfls0DIyJwr4GMajFD8bVzsAatfLi68JVKLg1tT
         C/lRYzC2Rp+yy+ujDc+pxBVxgatyRWPFeuSbGl8E89P/btg1FQhpL+Rfx6JgGuoVrFLK
         N+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750129860; x=1750734660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P2gwYOiJnrjoyWPiA6pZyt/pEwOiSDOqtgbrjnRu1iU=;
        b=l8hCn9NWMTjmbuQTL4UVO4VPckqmPh8mfcvkLZuYSr0ZxLqMn6clNRhjp+UEyF2EDU
         RVqHFLpGMO+JzFE8Ss7Z5+yYtChjGiYRhi2jtKsHdIVgXWsVF1RdQi4GHJWGiJJvBNU4
         j0rKjFcRYrxBjJafFJjbfjBKhtIB1CMqPfwS9ZjL5lcKY6DEiAlyHsvR1OPpj6LATH4P
         XQXew8Tlrz3WtWoFwarg7bwGestJDAv2EIJL0MFC+mY4mL9ivvWQmolaIargi7NvD+uB
         Su2FCdQ/mZbDipb4u04weQN8y+P5+U3XpQDgvsJSde1zdsZG7zU1bKUyDwdXdIWWN1sT
         AJyg==
X-Forwarded-Encrypted: i=1; AJvYcCW7FC+TrVuogAhbn016DxM1aJ5qQ946c+CkgzrS1K6hGnZq+vN0C8OhQsahv8fHK2P3lkpYRpgOzrP1Yy0=@vger.kernel.org, AJvYcCWax9xk9D/RflwLO0lugSK+bj1/ztIFlJ0em33yctVH1Jy2a2j6rMcTZcJ/DVaL8e0mRow+coX4t4PcC1w=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy0EqbFVvEHQJre1MWfJuiZ1kR1uQkkJGikXl/R/vJZPI6x+9p
	91HObYJdGLgy7s2z1q4xvUBfYY1Uv+0HMe8ozUkX6cM1voe3RP5IJ+fZmgFUFIfEtk+EvX6dyaZ
	5kmTy31bNcUWOlrb6KRW2GREzHAQ/aKliaw==
X-Gm-Gg: ASbGnctQVKHPbrcC+CY3KM62zmcw+IJF4NJ8lrjFL1sFmuDckfn7H2WgzpeT3lZQWAP
	MrMmhY39IK0v6A9/Ns4OEsxWlAh6ncbxMhmeWwwxYiKwJJJ1BKEflgpCMY6dswE1QL+TAjm3UIn
	pu64OiSIEWTQ03tDJv/jdVUVgV+cL+LkEQ/obBNkFhiiw=
X-Google-Smtp-Source: AGHT+IFWF5+sonwVVmB+qjbCSxuREmn/dwQdsR/W3KQqnPbe6ziX7kjtYy8RNsdmB6AUVA30QSZ5mEJRvN+CmMgcRyY=
X-Received: by 2002:a05:6e02:1a8c:b0:3dc:8bb8:28bf with SMTP id
 e9e14a558f8ab-3de07c53a5fmr140594005ab.5.1750129859764; Mon, 16 Jun 2025
 20:10:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613035216.1924353-1-shengjiu.wang@nxp.com> <db0f3982-b99e-4d90-8c28-9d49c3c5e478@sirena.org.uk>
In-Reply-To: <db0f3982-b99e-4d90-8c28-9d49c3c5e478@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 17 Jun 2025 11:10:46 +0800
X-Gm-Features: AX0GCFsdiAMCEgrN58xEAmml1SNxBQX_zH9RXUwVJ0VaRKlKnOtIjQdMfzgdkrg
Message-ID: <CAA+D8APtPr-_m0nGnQqQu50MFsWCn-C6mBOc_ZWE2ggmUtFftw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: wm8524: Remove the constraints of rate
To: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, perex@perex.cz, 
	tiwai@suse.com, patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 7:21=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, Jun 13, 2025 at 11:52:16AM +0800, Shengjiu Wang wrote:
>
> > WM8524 is a codec which can only work in slave mode, the bit clock and
> > frame sync clock are from cpu dai, if there is any constraint, the
> > constraint should be from cpu dai, no need to add constraint in codec
> > side.
>
> No, there is a need here - the constraint is enforcing that the ratio
> between the MCLK and sample rate is within spec which is a common
> requirement for audio performance.
>
> > On the other hand, with the constraint of rate in codec requires the
> > sysclk to be fixed, which brings unnecessary limitations on sound card
> > usage.
>
> A common pattern is to only enforce constraints once a sysclk is
> configured.

Thanks for the comments, I will update the commit to only enable
constraints when sysclk is available.

Best regards
Shengjiu Wang
