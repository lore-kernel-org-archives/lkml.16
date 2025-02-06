Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C49922577D
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 09:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738832872; cv=none; b=YrAgfETztjyDgT0LkzpLyK6A0GxbFmsGtUUh/d4LVdyhLGOsvPw63ZPgDJ0hXSHhyFZWY2g2DmhDbTwAiyX8nl0nOaiQEAKBTXjK5LpcHELvJYCvpK4G8J7UtspTSjSUUviEQJo4nHAH/Y/VL+jSZj8ikkpEEJQU4Dnl/hnqTBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738832872; c=relaxed/simple;
	bh=USBL3Bi8iE9n2Sl7YVwR873K49AsaDipUTVzCmvsvW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dM1dxOsuDoyBKz3mFYzpO/xZH+3mPu0Y1/KqUJb7rMghAi1sVH6Pu0Cs+GXNKdcrUGJDf0BWIk5COBgL6Ns2Q82svLbMT6ZNOl626sUXzhP5vzuQlhzFPRuZJH/HLQ6HmFEcsgx99wj4o6Le3wzc8YzioJB5KEiczm1McIu0MW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TTeVRmYG; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TTeVRmYG"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30227ccf803so5622611fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 01:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738832868; x=1739437668; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USBL3Bi8iE9n2Sl7YVwR873K49AsaDipUTVzCmvsvW0=;
        b=TTeVRmYG9yuGvQjpU85pWYUsAw4BWCBqf1IocAjyPXizPIbBjl1rwxJR2hWwRKCioe
         XDdGVDgR5Yc6RQkrsiDb/SPhVypwgiriFLKvT3R8yKlGavjj5RCaPi9BST9TZpUpvItj
         IDUSemjHvxnbm7kLFUbV3lz2Ee7F8pxNLBZVs+oY/ih47WKbsru5ilxLFjDMMeJdXR4Q
         Tu4EgVoJZ2OGyJV5jevlCUefNh1RoYz6B7anDynHT64MtVtEtizFq6XRxAPhzoahG6ly
         W552pMWU5aC4Iq0r9kxYSxI0pJL2CGPYw7EAAA9DZstwhQ33lPFLqrWc51DxxBh67J6B
         ltuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738832868; x=1739437668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=USBL3Bi8iE9n2Sl7YVwR873K49AsaDipUTVzCmvsvW0=;
        b=Xd+SFWYvTflr7QVhQzZt1QkXkD64VHqxlTtWyEir1FQhMrTqedQqg3K6rYkitipBSj
         xdvjEKXgnTTs3X3MckLGC/8DesY0iMfWCAjWPOtetFzqIqvqdJUc6PFOQH697188LQSe
         KBOWKjUlY27Qn3KDwuQgJ+LgP1bqUNtmMyf58gf+CYSqKGh0QyV4FnLsBC63RIeQXHfC
         fRHU2S34tXZ+O5PCE286QpKV1omnKqvHMnV5fI/ci5q9fUvicXSsuunQsXvcoNvXE7fD
         RZlSeRfv0S+GAgps42ynCZZzsCjausE8UWDinCVL736t9M7gJryte0GYYSRC6ymjsCAS
         ZjAA==
X-Forwarded-Encrypted: i=1; AJvYcCXmltEbrM+NIgKjHsEnH/9tFwOLd//u2QtvVv5Fjx8BSB6SltRLmUE812xLAdSHMu1OBokZrNrwvvZbQWU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwu5pNg5jJdBaC9JiS1XA4XLonXR5QxSmnK+wI9PgYrq0BY28n
	8anmcBQIWP8qiQvIZyXWhptl0Rp62rgQmuKtpNfBrg6WD8Bb2DVyoeYE3cQq311+j1zrnEbWxEq
	nIcmIeUTMD7uydRIMnIPIhXFdTAHzkLX3QWHJqg==
X-Gm-Gg: ASbGncuGOJx3f8qLoWZTwjEOnYG7EuZvYb/R5Itw5ADyeF6LgIb4emuiPKzpOfi0EY7
	KL2POfhcTUNiTZDBub6R42Qm6WxLFYZS/AmKo2a99n3N46bc2YyPfk8+dJ8NebYhGQKLnRUc=
X-Google-Smtp-Source: AGHT+IFMvokVoCNJp7A3lkxgigywWrPi05v98IDrumPEAYrql6H51kRCzThn+r8IlTxIEYbaKMGx7LiQg6tGfTHRK7I=
X-Received: by 2002:a2e:a917:0:b0:300:1c9a:80ce with SMTP id
 38308e7fff4ca-307cf385308mr20165081fa.33.1738832868506; Thu, 06 Feb 2025
 01:07:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com> <PAXPR04MB845925677F9AB860552A421988F42@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB845925677F9AB860552A421988F42@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 10:07:37 +0100
X-Gm-Features: AWEUYZk9rGC_78qVqTxr81SNDU-6p5M6XpnmcdwLF8h4Nn9OhqhPBv8W52Ra8WI
Message-ID: <CACRpkdZ1zBkagd478Ee+JAUWrXF1z-Hts=dH+_jgT3Vi26W84g@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] scmi: Bypass set fwnode and introduce allow/block
 list to address devlink issue
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Saravana Kannan <saravanak@google.com>, 
	Aisheng Dong <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 4:31=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:

> > Subject: [PATCH v2 0/4] scmi: Bypass set fwnode and introduce
> > allow/block list to address devlink issue
>
> Any comments on this patchset?

The pinctrl changes look OK to me so for those 2 patches:
Acked-by: Linus Walleij <linus.walleij@linaro.org>
in case you want to merge it through some other tree.

Yours,
Linus Walleij
