Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9489D43146;
	Fri, 23 May 2025 13:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748005516; cv=none; b=sOszeGDnrm1tWf4dKU9NpGLkSYuPfGvNF+X8FZ8x4bOjAkPxQw15hjxcxWdyEhEJhzO2k4jUwwrSaeuPUDI1KpKuTkI8HXaqzCV8FRjQREkQryPFkrkDx5/x4eLx9qwbZ6q3ouHkdfdxku3P0wYR7ETud+o4snB+mvW7VFKR4+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748005516; c=relaxed/simple;
	bh=8ofzuUgD2JIzTK1lz8qH1gPuOkGPJrKZYXjMipRjVWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tFfKqdWttTLRvBu3NqapF/D9RPqcb2zkshc5L7zVC0LIDPuyxYRsLAxewoI08D25wzZ4IMO0Ys1Ez7TQXw5RrJaVkYj2d/oWZV291T9NzicrkMSHRH7GERc8W7t6tz97N3Y+ckNOU0s1GBkQsSiTlGfND6CWVwZydRhMNHoU0TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GOZWARO4; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GOZWARO4"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-31062172698so91454731fa.0;
        Fri, 23 May 2025 06:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748005512; x=1748610312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ofzuUgD2JIzTK1lz8qH1gPuOkGPJrKZYXjMipRjVWM=;
        b=GOZWARO41lHed8v7lohOMfadQF4Yq/dHAmWdBmQQC4b8mJaaupK1ZU0Ub6EFrdomRZ
         2FZnscPIZNleISO0IWsaRtjLhGtdZA63vyyGHXntKoEcVMa3jVEaGGw9tbSg+76vO437
         ShLV6xd3GRKhafJnunez4tw60ylXAoqqdXUe2RWnYSemZxivN0GBRKFUlt2CFPf5VhsB
         Q76xNasbpBHkTovNrMqI94T4DVlAXlUl8HfPDxr3TDuaqL/CEbfP4NsB2WTK4hP2yC9C
         10G0MrgRHLnBYNPRu3BUB+0llIDM/kEsshMEXhJvRjdRWGGUq+0x1W2TSqUiwDx9dSMh
         YKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748005512; x=1748610312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ofzuUgD2JIzTK1lz8qH1gPuOkGPJrKZYXjMipRjVWM=;
        b=JJ0BGQFlRYlyRPHxEHR4rB97owAPcYv9wdBcN7Epu0k+pJ7pM0nBlkZ1aBA+4oIAt2
         +YhaT3VAl5SozbZtTy7lUypE4n4gtqpACRkRzziHiW9CJcikTTx991BKQj2CU5u8YPxi
         7uYPstQC/6wwWqj/8E5na4EGqqwn9YfzUXZZSIWnP8+5NgPEM110RuqKYBL2ogxyN9O6
         jZ4fTi+Xy5c3bOy5rWETjTJk9YuUdyDjwPdecB/vfGihkQiLcUTbNvpgpP2sDecHr98K
         DAgUnFtqtgNImBvjkx1L8riQFHW1Ky1sU5+RddsY0JBUCHn6dB+Xd20GZE3L8mhkd+yT
         jhTg==
X-Forwarded-Encrypted: i=1; AJvYcCXNJb14u+FERBT86c/2PuaOLtqrkDRIMh4UlRshPFSn9YUa2fz52qLdgXwx3TwKwDUTkElDRtr4QysP@vger.kernel.org
X-Gm-Message-State: AOJu0YyafXHkfcNAX9SNxt4SibynGQ1j84QjIUbV/zdUOiMZ6OVg2FnU
	Winc2pweN6CU0ApwMNBEwDp9ZuQfE/vM6xCGs+tBKcL5qgluXUk3GXFhgxGA4e/d58u7MV0JE1E
	HjEYtfFM/b0hhMZ9tiFn2CBBe7Y3BOcg=
X-Gm-Gg: ASbGncsyCl41c+9VP0u3JD9+ya4j5yPjkrD0XgI3O0Y7yjBegDFU+boSCREzbLAs0qc
	mHiAmmCo54xceLEqtCt3L7NGko87/eRlbs5R0wMj6W+V7bOM//PlvKFIAZxRyK6aBZZYJpF1qY7
	eq8LYA/u2fP4I25ZOhc57q7TM5NfiUeMKXXN+/sfO8fzWc1aUV3FurNFkXc5l0uxGw
X-Google-Smtp-Source: AGHT+IGr3CXT6N9oc1FChq+L2zQvwNAD13bnITSFZ0E/+/W3e8EL95eryfIkki8B2q4B/f1OTLeeKFeZTaRvi6X9Tc8=
X-Received: by 2002:a05:651c:1608:b0:30d:62c1:3c0a with SMTP id
 38308e7fff4ca-32950c5a0demr9757581fa.25.1748005512185; Fri, 23 May 2025
 06:05:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521092826.1035448-1-dario.binacchi@amarulasolutions.com>
 <20250521092826.1035448-4-dario.binacchi@amarulasolutions.com>
 <CAOMZO5D-d7bmBfXKe936W5QjmsukRRX3y0ge+xtizqFx0HPE8A@mail.gmail.com> <CABGWkvpPMry26DP4Wo8WEGhokdkf5GdLd=+O5SqRdh-8JBqt_w@mail.gmail.com>
In-Reply-To: <CABGWkvpPMry26DP4Wo8WEGhokdkf5GdLd=+O5SqRdh-8JBqt_w@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 23 May 2025 10:05:00 -0300
X-Gm-Features: AX0GCFtNxWfmT8UPK_lUQ62v_RjY-1XASOWkmtujernBQbwR9phsII3yQ0Wll2Q
Message-ID: <CAOMZO5DBL0BD_YbByqTHRGq_FkxG9vD_ycXiPTJdQ4WfmKfitA@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: mxs: support i.MX28 Amarula rmm board
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	michael@amarulasolutions.com, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dario,

On Wed, May 21, 2025 at 10:20=E2=80=AFAM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:

> So if you're okay with it, I will remove all references to the LCD
> display =E2=80=94 both from the commit
> message and from the DTS, such as the reset pin, for example.

Yes, that's OK.

> We have two models, one with 128MB and one with 256MB of RAM.
> What's the recommended way to handle both cases?
> Should I define a new DTS file named imx28-amarula-rmm-256mb.dts
> that includes imx28-amarula-rmm.dts and override the reg property of
> the memory node?

Or maybe you can describe 128MB in the dts and let the bootloader run
a fixup on the memory size, adjusting it if needed?
