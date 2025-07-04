Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E922F2372
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 10:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751624092; cv=none; b=qYjQ0rG3EQfzZ9RQUFA/JtjJDIx3eWpHrXFp25QsCMYTMJQjnt/0KDRYq1x9wFkveSxJuFaIIj+OfTtnpMyJxWooAI5+aCWNv6iNEpK3mQ1C6mte1geMlFCC+hw1wO04sJJR6HWsTIdIJa9nDeHgiIYiSWRmmfDe8Q4k9I2Bin0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751624092; c=relaxed/simple;
	bh=GKE72V5Ap3nmXRftAYUsWmL/cCl3QWNHzFKLZHh4uBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lJkNdW8cRA018vgu9Biydl03bNcsKUyf696IyzOiZwZt/GlHNnGRzIey4+/W/pASF0rOG5cjMCIswQUuqFmDQqCD2C2QNSdbtxno2ujud1O/ztWbh6wtrJAjO3uFAy2Q/y6MaHGeEV/Eht+AXaORaw+hEfyT5JtTbs4UMymA+pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=U8u35zEz; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="U8u35zEz"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b3507b63c6fso820236a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 03:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751624090; x=1752228890; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4fTZsufhobrcLHUOAcRJ3Fl2i32zbzHVNr3uBnZDQ4=;
        b=U8u35zEzYzK+VDCh/2X3aeFCUloZcGWk93zbSnsE3oJQyzFCH4B7Sq0eiVE3NriVLS
         VWqAZBnOP4996SeGzrsKRh50D2qKknEXNqL6Gka5smPMAyiMbhfwazozB+xNKTahoZUS
         8Li5RaSUgRvY+lQDo6LNNLa0sYrscMTXO1jWReLMfmeLeokA5rJlYrMpqxvTFoCF7bzC
         7ApgQiSNMnV+7kDlBOPl2ZKyCk+xn1ALxCrdRJXgs2Lgk8jkkm1uadmHd0/4NW1kwslQ
         VzvowHHJQKnHfdLU6NY+KXWIPX+Mxg3MotHIVTQfNrd9w4ezkS+WslvQv+NfFmkFQbAF
         d/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624090; x=1752228890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n4fTZsufhobrcLHUOAcRJ3Fl2i32zbzHVNr3uBnZDQ4=;
        b=l64mLt4FjJI3DIXBDSE3idohi8IoIiPi+l2bHJaOPBeR6kkVcLibcpELjmc4nj+WFH
         wgDdf3fSpeRNZTDWdLO/FR5CpoaC73oyI0+Vog/L7UO+1hPk7/VSxbxIEtmdYyOL1VYN
         IiT4JywwrSKHgeOkM/r804ExIR2Kev3cwJd+Z7RI6bIA3JZzTRHFdX/Tg///ckpN5iaN
         dzmqG2QFYxUC151k2uCz8cWfrSjVGp4C2Yt4455gYZt32s5B1pwZ694e+vjqUV+bhB5I
         OYehKxkTVV4KqRFGE5o4tgHHjTuC8JcfpE+yU8ldmLakGMEx+NlMp5w8X9M70ztLIPG4
         jxUg==
X-Forwarded-Encrypted: i=1; AJvYcCUsfD4cBIyUIKbZ4bk60hyFAVaZrl1d1SXbwh/PGAiIvZWe8FktqfbZuexzGAhJqRXU74j5i8UABqbUPXI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIU/I3JpCkOJocvtCvi6u6FSEZt+YDE4PPxcwLofByZpkO3xMr
	Y6RMWPPuYaC7nUOD7RXqUyVZqBfvsPBO5txx4WW97Q6DvYXTOIDQAjokMM4uXbpKY3kG1yV4ILk
	K2ydyGl0sTJtPN9F/y8p1IT3B+fRiOPRe5QqE26aDYg==
X-Gm-Gg: ASbGncsNFUmdK2Jvr45+sFMAyutv+GU48qpvTNSm+R8d9HAdgV8t8VKRusg7mvJpQgh
	9WeDlv4lGnqqz7ETfDOGr4sw+ULthj91fw/lFxzqZ2Bl4OYL+3ktIjXNGqNcAKFPsjhX56bsHZ6
	wXOEHk0Tjf+y0bbzcPzJ8oSzs6u+zzqVtMWoNhM9cgVoLlATNjjiuNaqY/dT1fr/k1a4vw86zUE
	zGV
X-Google-Smtp-Source: AGHT+IFjwg/psNUtt35b9Gmob0BLVqWk1GkmmuqjzaAL0gJFNIEsazYmsIVCo4iVpxvsNBxNzV3/0MwU6x9tzdeiXKA=
X-Received: by 2002:a17:90b:1fc3:b0:313:23ed:6ff with SMTP id
 98e67ed59e1d1-31aadcf4979mr1915406a91.1.1751624090581; Fri, 04 Jul 2025
 03:14:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org> <20250701114733.636510-12-ulf.hansson@linaro.org>
In-Reply-To: <20250701114733.636510-12-ulf.hansson@linaro.org>
From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Fri, 4 Jul 2025 15:44:14 +0530
X-Gm-Features: Ac12FXyDa0B0X6sfvOQzisE8yH6dk2kS-j3Pq5vg4WlBzfStBdZqCfBVav2JDDs
Message-ID: <CA+Oz1=ZnwUX2_s0rvY28um8eMDqqWKkJ5KRc+hqgL_7ghQf8Wg@mail.gmail.com>
Subject: Re: [PATCH v3 11/24] cpuidle: riscv-sbi: Opt-out from genpd's common
 ->sync_state() support
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Hiago De Franco <hiago.franco@toradex.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 5:20=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.org>=
 wrote:
>
> The riscv-sbi-domain implements its own specific ->sync_state() callback.
> Let's set the GENPD_FLAG_NO_SYNC_STATE to inform genpd about it.
>
> Moreover, let's call of_genpd_sync_state() to make sure genpd tries to
> power off unused PM domains.
>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: linux-riscv@lists.infradead.org
> Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
> Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xi=
linx ZynqMP ZCU106
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  drivers/cpuidle/cpuidle-riscv-sbi.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>

LGTM

Reviewed-by: Rahul Pathak <rpathak@ventanamicro.com>
