Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831BA187346
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 18:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738262431; cv=none; b=MK88nh1y6aoPGZrpTsNxXmaWXm+n3h8bKMAu9GsHkBxoUpEVb93JlJ9Sjf/SueX8Sg4fMvDInwgBRSBpiJgzDqDnxJk1CNiaAl/KrcXi/q0OocChPCqMRNGlPXuUGvWEqIRS2T48RaUHrl3sBEz5RyjCw6IR6Bboh+nYG5KrUEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738262431; c=relaxed/simple;
	bh=PZGkakFNco4kbSBjz1opxRPk8R7MLaQEpY8TCV6WYk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T4HKyLSNKWPwxt08ojo2k+z2ZdAiKMvSPTtCHm6KV+bIbbmO4y0YhMNCs8CyHY1kod2izO95MD8RPiLkZziZvpzjqubkLd26lJDY1v/GMpBuoC/weIVFcgcKyu3xrr4R4wydJYXjFj1+Z4gQiqekFOxHT29AMY4IcvWfxz8UEl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=P2d14isu; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="P2d14isu"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-540218726d5so1171155e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 10:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738262427; x=1738867227; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZGkakFNco4kbSBjz1opxRPk8R7MLaQEpY8TCV6WYk8=;
        b=P2d14isuB/UpS1h0JVpov8wUPkxiHqsBn7NOfpqfF6i0ksAR2P1b//+Jz8ug1DTjND
         L8oIsZ/gBOuNcclS0f2e3de2FWsjMd4JlNlRkQ7cPBqoHtM8tGGVUBlfCIy17Fi3Y397
         I9oL9BgPSh72WtpGWEv6oeMmKA5RCzezM+MkvlYXED6yjV4tLV/A5CD1vDvzJ/iqjDvy
         dAetuwoyA28ByAbO6rlmZE4AMsSneSEi3T44GPITaQopDHIaQQarqLbpzFvrJ39KPjzc
         r+3kbr5YzhIHsKvpbhxggswjo9p2y1/9KEm03UCJcfNW5sM9b2kVQzHB7M/wzDWVUF1y
         M6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738262427; x=1738867227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PZGkakFNco4kbSBjz1opxRPk8R7MLaQEpY8TCV6WYk8=;
        b=lmw9N3N35PbeE/Vq4sR6a2YPH1nAJhR1wMrZD9ttqKXZ0KX+jXrt3Jj0QiWnCFFCsV
         XCt8w+ZI6dP0ObvUaYoKUyN+V5QTrQuiYbNijV6wzfeW0L6Y7HCKWCEEM1KWXgsGZnVP
         gCqmkO81o6eErIR50bnUljbwVzio7nrSNO9PCs3A3YasKbWxRoOet58cPqkmnu1Odvdu
         qIV3UXtkjEm5lgn4N6YsJDf+CsYM8jecwIXj3xhCY5mHBC37zTSA13r4UXd8KuRrzZUg
         JnTl/eRtK/RTnemZTLEBd9mCAIJJmkpfkx9kFuhPaNsqCGG6Uy7Xx2Z4XNhZ++o3hTSw
         O0Nw==
X-Forwarded-Encrypted: i=1; AJvYcCXXrNddiWKc2Gjf1ZqFqUWDxeVhdALCwwl+giQVrLKapErwuc9+NzNToVjj26exwUesHVU3iw405X6BoP4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxIhFN0UdXmSqk/hIUEKCscCp5ChoEnXm4wl7YMSoZLr5WGaT1
	sT0SIByosIONO6cBbAspo8jcQcO4DLqdm3Dma/aKNWZCPcy7jinFMRlxGn76bywnKdQ68SxiFEC
	rcISHlNnqwmvQeKIPyT7pfwJnUP9zenMQ0CuU2A==
X-Gm-Gg: ASbGncv7GqgC5TLJV0PvoOdrKIzfkyEDheCUrTTL5rln5JKlCbbPTpT6CxxyTZLfOXL
	2fgnQZCY1kVaz7coQmj6oRilwnaQNK2ykdtWsGlUKczaOLuLGpHqmsNy/kJo71qTHGkec27CiNh
	9WuoucFtvGFLlg4RiHPdmw6TEeis4+
X-Google-Smtp-Source: AGHT+IGTxA9Lst4wTIFbwdnHGpnqqupbNJQuRozQiYPZiFE1ggaSkErWWKv0+xtu4qHAe68MDpH55DgfT9AWtcrExiI=
X-Received: by 2002:ac2:4e45:0:b0:542:2e04:edc5 with SMTP id
 2adb3069b0e04-543e4ba6c02mr2187230e87.0.1738262427290; Thu, 30 Jan 2025
 10:40:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129155525.663780-1-koichiro.den@canonical.com>
 <CAMRc=Mdim2aSBs+JsL8dECfG0Vvrvcq6CHaGHbBoVhNhSZn9Kg@mail.gmail.com> <2kz6mz6nglozgrwudkgziles4wievwfkkl2oo7qyvosirchjuw@y3wfna5dsekv>
In-Reply-To: <2kz6mz6nglozgrwudkgziles4wievwfkkl2oo7qyvosirchjuw@y3wfna5dsekv>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 30 Jan 2025 19:40:16 +0100
X-Gm-Features: AWEUYZnj93d-FrMXvMxOaT44mXfI_4z33u8XVZrqCy6OvCJmKQ4xghRlKCNsUtU
Message-ID: <CAMRc=Mc3qBXaATpYRAXeHne0+mBjErivjvUe4rBEj2ksansatQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] Introduce configfs-based interface for gpio-aggregator
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 5:04=E2=80=AFPM Koichiro Den <koichiro.den@canonica=
l.com> wrote:
>
> On Thu, Jan 30, 2025 at 11:30:59AM GMT, Bartosz Golaszewski wrote:
> >
> > 3. I don't think the user should need to specify the number of lines
> > to aggregate. That information should be automatically inferred from
> > the number of lineX attributes they created instead. [...]
>
> I agree that it's essentially unnecessary, but considering the current
> state of gpio-sim's configfs, having the user set num_lines doesn't seem
> too unnatural to me. What do you think?
>

No, this is completely different. We cannot figure out how many lines
the user wants gpio-sim to have without explicitly providing that
information over the num_lines attribute. For the aggregator, we know
exactly how many lines the user wants - it's determined by the number
of line groups. We can simply wait for the live attribute to be set to
1 and then count them. While at it: there's no reason to impose a
naming convention of lineX, lineY etc., the names don't matter for the
aggregator setup (unlike gpio-sim where they indicate the offset of
the line they concern).

Bart
