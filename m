Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92C2214A7F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 19:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745004459; cv=none; b=H1oGjlVD/XyQbHaunKehjVKEHf43nb0G7JeSYwoHmwNJcQPMwXRcntp5q6h4SoMYcAdTDELyNjyQP6yelv1nVL6Nc48e2/ftMV6M6qWp2pjT0KCktW2cvbw75fnn6LqabAD9sSTWdSQCOSL6Ao/7LROg0OpfLexPw5592TNy36M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745004459; c=relaxed/simple;
	bh=PXliZB9xDy/vBKgpgY3nlv+6pXp7lLwAFFvpUkQS7Es=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eviMWAYJXHqGjML0MJeID33EFXHl50oCApfbLEkS9LMBLUCzBf7MI+gLbznaNNQG/CWs0K3wQQESZ/iX4+S4+YB3m/Kg0XH7fm6FUXrWcz22jaPIH7GfFYFRivNtJs8LTYtcrwZ2BrmRrEx3tCfJ2iMjh9qlJTrQGqRr9+ERSic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QdY/lNT7; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QdY/lNT7"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-879d2e419b9so1886294a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 12:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745004453; x=1745609253; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PXliZB9xDy/vBKgpgY3nlv+6pXp7lLwAFFvpUkQS7Es=;
        b=QdY/lNT7zclZKdg/OeKALt+1UpSEbv4Ny4/0XdAX5gaN0mewPmy36NOeYKjNeZ92KM
         BGygNAdpLH7RM32FQCKfAQZgAfoz0sjzOg+K02LpyuXNDmC/awTnrGdp2MJeE3vl5Gcm
         Mp7M0I2DRIiIVxALmvxGOMug+hrJmzJGg/Z0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745004453; x=1745609253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PXliZB9xDy/vBKgpgY3nlv+6pXp7lLwAFFvpUkQS7Es=;
        b=etL3vRSUJNzxHZOxabDkvM4OPJ5m7cIrQNuNwvdfITCkMDqfG/HtMrYZK782b+dldu
         yabnv6Wg4u8tV3Ksl3BUKHxSoAn8whvjwo9TGEg2oom6KscRdQAyMeHcSP3sSHQpecyu
         RPCyg83csGUH0awP0hO+zsCTyk58JVOyCKtYs1w/VOHieyxqN0mA724AnUxUKWIs54+i
         Br/kRosJBaF/7miamjFupgavUsmAYS7n0EStCQcy/OBVp2JPQgdjorCdovoOMOnlqoRc
         JEUxj2LtmChKP3jkWYl6Wyl2BaEO3eBnSlovZs2s7YnRtJayqJbj8w5MpDI1mE53BdGy
         pn6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUGi2YZ+Oge6at1M4ohhUJwlv8O6ikKPc/e2ZDvAr1wIv98i8w8S4QwIfujjiXaKgwprr4iDNrUJbmiS+A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaZwHLCFYhKw/R9sNqO+Nl91hDgNQ8bYjMn1HKjxSUoXj8BbTK
	ylX+5KJfsrbxYYvetW5zHWGrAboU1KmLYdqTR/Pr6Ymsh009U4qhAQvJhqb99m6ajfQ37j621JM
	=
X-Gm-Gg: ASbGnctMX8cKnoP+fRSKA4yb7dgJA7es2FG6C/ylKuDZZqZneNu3pFEgn3LTmp6s2yJ
	8FMogm2HGlDztP2tTvl9zwdCQWZiIuk0GerpphvjtRFUwu3eQEqqe7jnBX2XyYAehfDKEPCb04Q
	GUBZhYebXJG9xZjkbqAsT6sgpxxebg+In6A09OLclwNZz6iUWRNopplt01tTrm2KNLnAXgT6dsT
	+yPstpZP3wA2kDFS30skdvhIHf0KZxEewiP/WtKATbS4Sk+ImOp3Q5lhtpKnGZV4B4klATSgGpo
	kaHVpo0nSz0Ls+/cyL+XvENchkeYFW81fNTJOq7skR5DAguWoNedolm3aILyJJEZnD1qpZY9RKK
	H6b1b
X-Google-Smtp-Source: AGHT+IGSGN8tfTkAWGM+HvawBxa72+JkKlHRYREtB9XwiQyFRwggYl7+s0aLtkhHzxC9szgbNJjqcw==
X-Received: by 2002:a17:90b:5748:b0:2ff:7ad4:77af with SMTP id 98e67ed59e1d1-3087bb6e9dbmr5529979a91.20.1745004453456;
        Fri, 18 Apr 2025 12:27:33 -0700 (PDT)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com. [209.85.216.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087df4fdcesm1631077a91.39.2025.04.18.12.27.31
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 12:27:31 -0700 (PDT)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-303a66af07eso1697034a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 12:27:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWyzWo6dL1oN6jHDwlfYqXkVyLu6ckodeIsvGfy6Rgp8j+OF8IMfFk04nG+9xFbY9UUel3Xns8zE9dYSdk=@vger.kernel.org
X-Received: by 2002:a17:90b:4ecf:b0:2ff:692b:b15 with SMTP id
 98e67ed59e1d1-3087bbca3b0mr6080668a91.33.1745004450746; Fri, 18 Apr 2025
 12:27:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331143710.1686600-1-sashal@kernel.org> <20250331143710.1686600-4-sashal@kernel.org>
 <aAKD+zsLwx8pBSOE@duo.ucw.cz>
In-Reply-To: <aAKD+zsLwx8pBSOE@duo.ucw.cz>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 18 Apr 2025 12:27:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WvoAxfipbsG1O-WXBfoPn2kEvgQk495AdMike7swgnpQ@mail.gmail.com>
X-Gm-Features: ATxdqUE0FNJ4-KqG291tKKSsSflmlD7l8xzy9IRc-kV_X-qxA7cNZEuYYXsJ3pQ
Message-ID: <CAD=FV=WvoAxfipbsG1O-WXBfoPn2kEvgQk495AdMike7swgnpQ@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.10 4/6] arm64: cputype: Add QCOM_CPU_PART_KRYO_3XX_GOLD
To: Pavel Machek <pavel@denx.de>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Trilok Soni <quic_tsoni@quicinc.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, will@kernel.org, mark.rutland@arm.com, 
	oliver.upton@linux.dev, shameerali.kolothum.thodi@huawei.com, maz@kernel.org, 
	bwicaksono@nvidia.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Apr 18, 2025 at 9:55=E2=80=AFAM Pavel Machek <pavel@denx.de> wrote:
>
> Hi!
>
> > From: Douglas Anderson <dianders@chromium.org>
> >
> > [ Upstream commit 401c3333bb2396aa52e4121887a6f6a6e2f040bc ]
> >
> > Add a definition for the Qualcomm Kryo 300-series Gold cores.
>
> Why are we adding unused defines to stable?

I don't really have a strong opinion, but I can see the logic at some
level. This patch definitely doesn't _hurt_ and it seems plausible
that a define like this could be used in a future errata. Having this
already in stable would mean that the future errata would just pick
cleanly without anyone having to track down the original patch.

-Doug
