Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0255638DF9
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 17:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738343286; cv=none; b=cFR/1UlTMSuUY7xev/IQSNv272I6hjtm5lPYozuTm614cMfFnxYSmoT8CJkvS99FslICpPHUlZfB6p3QhqG+No+oSzoSAbe0A+HqSeYvYGLCwxMyxMn9xA3Oose/zIPsXsfFAKPpt+wIlE4kWn7emPBCHb6xompF7i26pKdZFaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738343286; c=relaxed/simple;
	bh=YbPI8JZe9g/zD7JIgPUE9bTsUj4WBL6vQADV9p5w3ew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OpnZsIT40AGbwMBFTsqJZE8ZVlsEs8VANY/TIxtnkhZ3gUQ2HVMI3KCdN8kb4DcEBdFq9p3Dx0p5sIYrTPfdNxBbjxwqDdE3tBX1VffSCjmkvPT1tNV0GXBWaj9HTgByGl2KCtznS74rgiq0CG22nIYdbFDhzAa5D22nGHxBdTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lOO/IOHG; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lOO/IOHG"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-305d843d925so18101141fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738343282; x=1738948082; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YbPI8JZe9g/zD7JIgPUE9bTsUj4WBL6vQADV9p5w3ew=;
        b=lOO/IOHGpu6Z8Qy4WORkZ4iCyYA9gbP6htorYutU7EPkIeVEKtG4VoEi+73/bQkbJz
         Hw4jjfRRVo1MOdsin5uRu9AjtMdfawpBbQFfY3sgBIhM5LLbHYqIraxtdKEVOCybfndv
         AXv8wlC5DKGV6QH2v08v2tCng6PW9i39UdMmtyFNq9+HOwmORNIRoFk6LP31i+Pk1Gal
         1+IDXIiz4BAHwaBnDgDxSgMHqhzcK0G/XFhPvrmzsEvH5Dhvdq141BQCX4lAaUM9BSZp
         oO27BhDNAC49obCJYno6Wq9udshlrij27pdkh9LKYNCev1Pc9heaWhiy0FY42OU85xmW
         yzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738343282; x=1738948082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YbPI8JZe9g/zD7JIgPUE9bTsUj4WBL6vQADV9p5w3ew=;
        b=lhUtX3WFqN9A3xg6b5iJwaeXl/3zODbCcef1nztZdcjj79yxZUe8M+EWaw+bJGHhZX
         Zb3D9gqlkehnZKGPKQfJL1xzihVA7fp80zPSp1CuCb6Zr2Bl3UjwFqZqBSLXiZbKW6ZL
         HnlL9yyJV+rD54Pxhlj6GQ8HwIrTe2Upi7QbYi5ACAPbS0UNrt7yQf8H/EWejzlpR6Ui
         PXfPHqkFGg+0bHhBHLi8zpVt+xwtQvclCSf8Ia4npvrLCvp5nuVJfxrjeqzTuecP4StB
         11hhloLkvz706MrXPu90HN8kMuNewN9yNlryHpvEwts13fzX85ncBO+Nj/Ap8+wlGfzq
         0tgg==
X-Forwarded-Encrypted: i=1; AJvYcCVjFgvQcKJWVcuYSC3LSH7Hv5fI5tGWd/RSKznwwFJJTwQWLde0In72zEV8y6/vc2onVnmCFIVu0pdagic=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1bv7kK25Sgg3QIr26FP4oEXpk8uGoPOaFFm1L6AFhYjQFHVAL
	XxXRRn8LBqq+HosPWa9cVkf0lc1LBvWHHqOlo71WQJhw49WfIl5WDLVvBZH5oodXRTXQenAbiub
	i4rcB6W10/Fe+mZg30ydIUiXewHD4mBadvPpEjUlrFKX+KRO7UzY=
X-Gm-Gg: ASbGncsJLUlDkaU8ScEDr32lVfLoO4DBd50XUxpa07tSqoVSPrFCGU0LhOchKgwdXKI
	Y0W2Lnc32swuHR2M0RZPUUR93TlO4UyRy8+quNiks7L+KggBcJqII6tKTJ2VE3cdghNcJRSQ=
X-Google-Smtp-Source: AGHT+IFBFlzCF/3konHaqIqI9CK1xWNyw3X90IbPuYfx7dRCuzvgqC0d/zqkP3bOBjxwlKot4y/ptAzDn4fM9VfIHmk=
X-Received: by 2002:a2e:bd05:0:b0:302:3d74:a1af with SMTP id
 38308e7fff4ca-3079685761amr46280801fa.20.1738343281879; Fri, 31 Jan 2025
 09:08:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129155525.663780-1-koichiro.den@canonical.com>
 <CAMRc=Mdim2aSBs+JsL8dECfG0Vvrvcq6CHaGHbBoVhNhSZn9Kg@mail.gmail.com>
 <2kz6mz6nglozgrwudkgziles4wievwfkkl2oo7qyvosirchjuw@y3wfna5dsekv>
 <CAMRc=Mc3qBXaATpYRAXeHne0+mBjErivjvUe4rBEj2ksansatQ@mail.gmail.com>
 <CAMRc=Mc5WWNErJfEQ4sFRQm_+vDRMa7KBKSPSnP3W8scu4G19A@mail.gmail.com> <CAFGk_a0U=jSQD85UKC1e=pSWr8W9y_MMAFyPVFOcE-fUZry7-Q@mail.gmail.com>
In-Reply-To: <CAFGk_a0U=jSQD85UKC1e=pSWr8W9y_MMAFyPVFOcE-fUZry7-Q@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 31 Jan 2025 18:07:50 +0100
X-Gm-Features: AWEUYZlvRg98a9oJdVcNuXVOzrkvtFgK-r_h-N8R-DciwqWu7dIkrkJ06iQZopY
Message-ID: <CAMRc=MfmMhZ0CS=e-YNHdH49rZ=Qgr8rQKd4aYCfS3jh8qKLdg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] Introduce configfs-based interface for gpio-aggregator
To: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@canonical.com>
Cc: Koichiro Den <koichiro.den@canonical.com>, linux-gpio@vger.kernel.org, 
	geert+renesas@glider.be, linus.walleij@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 8:26=E2=80=AFAM Maciej Borz=C4=99cki
<maciej.borzecki@canonical.com> wrote:
>
> On Thu, 30 Jan 2025 at 21:48, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > On Thu, Jan 30, 2025 at 7:40=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:
> > >
> > > While at it: there's no reason to impose a
> > > naming convention of lineX, lineY etc., the names don't matter for th=
e
> > > aggregator setup (unlike gpio-sim where they indicate the offset of
> > > the line they concern).
> > >
> >
> > Scratch that part. There's a good reason for that - the ordering of
> > lines within the aggregator. I'm just not sure whether we should
> > impose a strict naming where - for an aggregator of 3 lines total - we
> > expect there to exist groups named line0, line1 and line2 or if we
> > should be more lenient and possibly sort whatever names the user
> > provides alphabetically?
>
> If I may jump in quickly (I provided some initial feedback on the
> configfs interfaces
> for the first internal patches). I think it's preferable to have
> strict and explicit, even
> If more verbose, line ordering in the aggregator.The motivator for
> this is that whoever
> sets up a new device through the aggregator does not have to second guess=
 what
> the driver will do. Implicit ordering could perhaps be fine if the
> consumers were to
> impose some set of rules themselves, but I fear there would still be
> some ambiguity
> left if free form names were for e.g. [1, 02, 10]. In the end they
> would probably settle
> on some mechanism which would mimic what we could already do in the
> driver itself
> and avoid any further confusion for the user.
>
> Cheers,
> Maciej

Fair enough, I was thinking that just sorting the entries
alphabetically would both allow the lineX scheme AND leave some leeway
for non-standard naming but it may indeed end up being confusing with
no apparent advantage.

Bart
