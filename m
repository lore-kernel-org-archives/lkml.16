Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D80F1F428C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750061127; cv=none; b=KQyh2bJJXbzo+Fld22sM0koMUfQcsp5yM8ZWII1mf+S73hyj9WzLwWAcCdJkhS1NdBd7kVcyxY/RQAQQ2Z9ovQVzIyouwxlnRGqeF7KXVIYus6Lb9vl0ErPxciqccawoqeu7kJ1d3VYBsH8kXRn8TpdYZjTeP7XAvNHLASwktv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750061127; c=relaxed/simple;
	bh=nyf2g989nH7J3pvCSN0gr3wDLJxFEUoowOZ4vMGp6J8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iVyaDPmhAjkzuHjx2+7HLt0oqQruemQd+bQOXSKQSt6kmExk+iANINXkOfvucpPAiqPgPZj8jSKiLKpt3psR07wuqF0bY7SYXgkGWVetoKo8QoIWUmG0yqdlH/0FkeSf9s9GumNgfRLMHPuY+z5lrjqJ3hiMVGX5WJ+Cc+/tWEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JJefz5RG; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JJefz5RG"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54b10594812so4157929e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 01:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750061123; x=1750665923; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywH8Dejsdq3x0VdIrtMd2wFdmECbqVFAg+zOSDofJ2s=;
        b=JJefz5RGZlrQY03Wq03TJ94YFJyignEWyGXHKpL+FwbygEHUAj9a3rxUI9EhYnTHyQ
         wAyDY7n45nN0vHunGupFGfpKW1RXIrMYZa0uQ6brESkicX6ngQFf+mW+tTX67My81c7V
         0qYpUlrs2TPt3I8tQxTV0ko+1218f/64A9QvZ44h4hW4Fnmiy5yVv0nFDUA7TOj0gz5t
         1a7twkvo3jWhrGqPbQ8DUrkziGQeMeySx95fpptSTlMJAwTW+BHDPxY4FSpQPCWzFMkC
         cOPETOxTx2QcvGBu6FTWIvgda9ggHLXmZgxFYoUtkrzHYWWRHti3EStFHzYiRemKgrIP
         ZHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750061123; x=1750665923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ywH8Dejsdq3x0VdIrtMd2wFdmECbqVFAg+zOSDofJ2s=;
        b=O/6bxBbndgMNdFsZtpKNn/Dk6RR7XwUF1KMMyddqi+hsFZeSb6lTa0Ujwn59IlUNou
         sE//OS5ClHCCevLs6E2QHgd00LE194c2NYMwXOxXWFT6/hClApFoWxEubfFSs/JTvkIb
         LJTZOMLZ5XUU4iQBF8+pE/w5015ac53F4Iltj00/Zm+Hw/6u12uaKbZKQn9MM2nmXQiI
         481pqYo85Xfm1dXaboW9kJEj+ahHjgKI3Y/47peoJicgKZ8/qXT6foeR23qYUgejaR2T
         rTKyo4gGIXvNswn8J36DXRAXYviKOsm0xezZ3JDYpmPswrFNfdsIBcCujgcJM20/Hx9b
         TymQ==
X-Forwarded-Encrypted: i=1; AJvYcCWglATdbwf4pRWLDpHYMwwC+QLebZVJII2oo70OMEnujzdwobGkLBTA+KeipHXeA5ek2KCqjnFQ4PrSOkk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOSTkN0Fd71NyCTYRck2kpxseCgIubpk/8wsievDViFz/7a+ts
	vVHubsQ7dAWwERe1cfFXkdToNPk668zqf23yI+UNfwIfIXA6b5rg64YZ31RKpDZQjCyeiu7JDpE
	o5zPa9zPD8TWHgJwOvtg8B0WQCYZECZrPuAQukPBpMQ==
X-Gm-Gg: ASbGncv+derBbMPI1Nx6dRsAD0RlXMWfTE9SgnBYnxU6hNmJ/CGvvZPXgQwz5rueEvP
	4MutBkd6jTaW2DFH8eRxH4/+5QpvmM3OrDEfGzP1YvnHapkXfFCqgN1kY4R90JGCmqUcTjXcdLV
	eWoCrEbDxyWPveLHxHTIrTChjRjozW8lqYHhKbYfyRuBrRPkzpDnIa5t5maCSQ0K5NiH0pXwc1+
	44=
X-Google-Smtp-Source: AGHT+IHui39rGOe78ZVv1GL/qozjTCuN+gIRPTaD2LzbbRuwGK+ExSJGXv1lf4f3l/OzpiTJL7GG+3gb2jdEJtZBUck=
X-Received: by 2002:a05:6512:3e07:b0:553:2fa8:8405 with SMTP id
 2adb3069b0e04-553b6f4f34bmr2175898e87.56.1750061123552; Mon, 16 Jun 2025
 01:05:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
In-Reply-To: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 10:05:12 +0200
X-Gm-Features: AX0GCFsKseF3x4tMXUWhM7GW0aQJySrNOOS0VJu19t9Ohnme0LPMU6-HMe9h4i0
Message-ID: <CAMRc=MeTmwgbHv9R_=GFmjkAV4Nvc-SeSCOz1k6pnGUrF+R9Mg@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Introduce HDP support for STM32MP platforms
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 12:16=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clement.legoffic@foss.st.com> wrote:
>
> This patch series introduces the Hardware Debug Port (HDP) support for
> STM32MP platforms.
>
> It includes updates to the mmio gpio driver, the addition of device tree
> bindings, the HDP driver, and updates to the device tree files for
> STM32MP13, STM32MP15,
> and STM32MP25 SoCs.
> The series also updates the MAINTAINERS file to include myself as the
> maintainer for the STM32 HDP driver and adds the necessary
> pinmux configurations for HDP pins on STM32MP157C-DK2 as example.
>
> Signed-off-by: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>
> ---

[snip]

> ---
> Cl=C3=A9ment Le Goffic (9):
>       gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip
>       dt-bindings: pinctrl: stm32: Introduce HDP
>       pinctrl: stm32: Introduce HDP driver
>       MAINTAINERS: add Cl=C3=A9ment Le Goffic as STM32 HDP maintainer
>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp13
>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp15
>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp25
>       ARM: dts: stm32: add alternate pinmux for HDP pin and add HDP pinct=
rl node
>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp157c-dk2 b=
oard
>

Patches 1-4 and 5-9 can go upstream independently. I suggest taking
patch 1/9 through the GPIO tree and providing an immutable tag to
Linus to take patches 2-4 through the pinctrl tree. Linus: are you OK
with that?

Bart
