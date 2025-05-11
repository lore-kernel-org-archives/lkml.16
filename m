Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF4B482FF
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 17:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746985115; cv=none; b=J2+Aj3G0POiW7tnnmrHhcZkhnPMhSqyCrz/avUXTDa7S0KoyFe11p67MV6RYLZnT9Zy2IS8C44YlJEhqxQDNjJDLZBAQ1fC4uyhPcGh328LnXneQ8ocK0TDzTK3/9xboI948OLx4wEpB229YtHKRUCB+4haw1IIrK5PJrFhWMvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746985115; c=relaxed/simple;
	bh=eBBZG/T8tWp3lz/GI9IwiMI7jMFA+cT2hqHx+2FpoNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FAj/ocwBqZrztB1oS1SWBNJFxFrFCGpUNhU2A53n8HawIJ9tQ5pHsOHvgZbohtfJNfwz79ekQC+n3Y5iHgqGMXWFy80mX8fIq6GJ16Am2Cs7/nTf/Oq050UJDEW/+pVhbAc8uJjeo8sm0tMQ1963QSYOoIfUSURt+0XWc8O8IfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lessconfused.com; spf=pass smtp.mailfrom=lessconfused.com; dkim=pass (1024-bit key) header.d=lessconfused.com header.i=@lessconfused.com header.b=L3qIKz4V; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lessconfused.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lessconfused.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lessconfused.com header.i=@lessconfused.com header.b="L3qIKz4V"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-af523f4511fso3053535a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 10:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused; t=1746985113; x=1747589913; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htpdGgGE0WJqHpqKCEDMnW5Vc8YelVzDOmwa66AXTRc=;
        b=L3qIKz4Vo0pKj8AjefDb3UDmmoQFDUkbGSPC98p2fgrAwaz162TyheWO/UnuETzf4M
         q/D3+uyzImAvT/rqyijHH8B/OxaCE0kuRhPfny/YISLvKj2a64ZU6KbKtAjRG7Jw3BNT
         PjdLXl36zv3QU5PLioDu/fnLA3bq91/7tysDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746985113; x=1747589913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=htpdGgGE0WJqHpqKCEDMnW5Vc8YelVzDOmwa66AXTRc=;
        b=dyjA6riizvOX0ykHQniJalSMq+viOgkHYlfaOuGSq5OYny9diXWY793UV3VrGaI5cB
         9vpgxTYL42ac/BEVO51TksL522tSXLykqHjnN/ciPy5qMCwuOI2cCixrUjWq+I2Boudc
         JqMhYz6SMis0zWe9NJYd1A6W7CaG7jNK9HA+0CdaKGw6IXw3iAM/sUiFR09zBGpzoMMB
         A2nSrdn7RhIIlvEK0aCxeuOxbJ72Q2XS5fH9hoVmWwPB0tnE/1/Q0gsc7WxwxQF1ADLu
         416z8P1D3YB3OLLm/o6gcSAzX8EDZ5SXcXPsTGNkdzPN0rtzA3vb6OpXiJFcNWr0Qssa
         giqw==
X-Forwarded-Encrypted: i=1; AJvYcCXzctMAdU68g7hf7sj0/MMJL8HVsTAAAtUYlEeQpheOLrp/S5jmsWGOyUxV1y/PQ0W4b/ZTI8zJQzRNig8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3EKtTxF0FJjlCEs70BfARQTfRWXLd11I+Pr+MXGDAnaTbHY3d
	DqaNr6goDegivzL7qTSCczUk+7xwc+IoA9ehmL097ZFLkbQsL3khSIe7cYYCEWlc7REmvqHbtYP
	hTeoujqUxrBslnVOjFQUIgPg/mfJlsSTXEd1NAw==
X-Gm-Gg: ASbGncs22d8LxRTdSIRM4/SR0Yadyuk2bGl59omxGjumt5N2O49aTbrOF/K6TiECf3I
	m4P1etKROo/6YloxlGjw/38R1zq5EXBdahJuqQZQ+M6+VGOrz8T1SVJaBnqx1mHFvHnq7PwX6OR
	iGinuk9s2NYZZ/9nI24aUkC1B3gRDGqPD9S4YxEbrTdrd5O55+xcOUXTGifCb2I7t8xqnffjEmp
	X5r
X-Google-Smtp-Source: AGHT+IGlWFjDOSR6LptznPfsrBGcmLqTeFU1+S1/2WDCbsxyxoLwah/czQtlkvxYzoeR/HfJw2W1NJ3/is38sxpCk0Y=
X-Received: by 2002:a17:902:e94d:b0:224:24d5:f20a with SMTP id
 d9443c01a7336-22fc91c2cdcmr176733505ad.48.1746985113315; Sun, 11 May 2025
 10:38:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511172732.1467671-1-da@libre.computer>
In-Reply-To: <20250511172732.1467671-1-da@libre.computer>
From: Da Xue <da@lessconfused.com>
Date: Sun, 11 May 2025 13:38:22 -0400
X-Gm-Features: AX0GCFtg3EgdoWRuH-CkzemoXtkQsOI76TednUqqH8u_ZIuzhBzf52QSqYFsAO0
Message-ID: <CACdvmAiqQj4NjazMvdwQtB5zX+SQs7bwXEchT5thNM83=bQBhA@mail.gmail.com>
Subject: Re: [PATCH] clk: meson-g12a: fix missing spicc clks to clk_sel
To: Da Xue <da@libre.computer>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, stable@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, this is an older version of the patch without Fixes tag from a
mv error. I'm sending a v2, ignore this one.

On Sun, May 11, 2025 at 1:28=E2=80=AFPM Da Xue <da@libre.computer> wrote:
>
> HHI_SPICC_CLK_CNTL bits 25:23 controls spicc clk_sel.
>
> It is missing fclk_div 2 and gp0_pll which causes the spicc module to
> output the incorrect clocks for spicc sclk at 2.5x the expected rate.
>
> Add the missing clocks resolves this.
>
> Cc: <stable@vger.kernel.org> # 6.1.x: a18c8e0: clk: meson: g12a: add
> Signed-off-by: Da Xue <da@libre.computer>
> ---
>  drivers/clk/meson/g12a.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index 4f92b83965d5a..892862bf39996 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -4099,8 +4099,10 @@ static const struct clk_parent_data spicc_sclk_par=
ent_data[] =3D {
>         { .hw =3D &g12a_clk81.hw },
>         { .hw =3D &g12a_fclk_div4.hw },
>         { .hw =3D &g12a_fclk_div3.hw },
> +       { .hw =3D &g12a_fclk_div2.hw },
>         { .hw =3D &g12a_fclk_div5.hw },
>         { .hw =3D &g12a_fclk_div7.hw },
> +       { .hw =3D &g12a_gp0_pll.hw, },
>  };
>
>  static struct clk_regmap g12a_spicc0_sclk_sel =3D {
> --
> 2.39.5
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
