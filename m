Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105E520D505
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746002866; cv=none; b=LTFo2OGVEkvOHtE5MymlvgSZQ3lVLIO7wm7kFdsbzbVBDY1r6vA5OkDMd5AWDOveqsJFkmpdtCgoh9Fd4lbZz4/eSnytWfrmEUIgHCQIIkueJhf8FY6BA2lNKvAGtmKq3+WS3t5BY/TRRTwvQBTvSY0n/4YWPVD05hbko/KH6TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746002866; c=relaxed/simple;
	bh=pkk4FnwFjZbg+KuXgTwOxKB73qBogdOwMrt/pQB1i8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gt+NUooVl+fFIW2qvgoKTJ2DrBAe0hML+7/upWCSvdnk7o2KtQP4Q9Y2lre/uCyMzbqLAU3Dmv9ykZLgWVWH+F7Dwp4Imhf5/1OpZ9zc2cEQcWXJCCLOjtxzdQvNqV2aOgWjmI8mA6BOiqjPXYITDA+ldSD70GxnnRcOnWh7mUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mPMKmzsN; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mPMKmzsN"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30bfc79ad97so8070741fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746002863; x=1746607663; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yr3vymS/gup0DlCuygO2tVK9TIK2xinHjdJneX0gB48=;
        b=mPMKmzsNAsOgfw/fU/+j8ThtLpO/5At4w6jmSV0s218XOhJ3xzHJ/1nxUogsmiRSLK
         YdHIMXc8tp9YWGe96LK4hgwIUN3StpKZACEJlnj7bJ6hZYCBzCQKEjCmqzbzX0XfLqme
         XylUAvsj/m4x1tfE2UqBNvKSgc3oQTewDmXvqOlaOcRe5LVVFsrAlqN4ipS7jXtDK9CI
         HBZbvNLKFLKPCAYXp/4+R3lu1+y7fQVn7O92SQgO95zjghxpIL58Dz+st19KXg+as7iB
         X+MNkbHRo5aatM7pEV+6FzdU3wuM39b/tMfnzmjehTk5GWmas/cSBnUNfSgD7vU8t2NP
         FDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746002863; x=1746607663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yr3vymS/gup0DlCuygO2tVK9TIK2xinHjdJneX0gB48=;
        b=XOdZ9Oej8tikSW6m2b8ufZUIgqAPK+0Yb39Vtv+j/8V1rY8f8pkZ0QkvbmX5mo2bJr
         4Nx7gc4zRmJleztX1DZ0EGIBd+2E6e0RWAO/ymijeNVeFaWYAAUlhasKBq9z6leyrhDw
         FOItP0tQhdpbMVEL0eKwBJ+pzd2pbzVqLamsBvPoAN5GnQNUfocomzkEHjL3Kr6ZPUNY
         r/IHyMogTHGn1ou/2hG3fV1B/pmUYoLmvXzYPW3HPK2L1rkoPQDFlIVdrXrXj8+SqgRL
         wUg4kpPiQUXdosSTs/lbOZ6WzQWyjDSPrsVuvxRUDPHlwvG28z+ZUA49OA3/GMxQJngy
         +nRA==
X-Forwarded-Encrypted: i=1; AJvYcCUJqlR7oDLL/+Ojx/8EljKkwg/ui6OOyXPwqev3HnBDVH7Q73KyBvwgvhwwXDr3S1LKKsQ6lrsIR8o+qbI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvk4hzCMp5PhSmefkVlaknR6RhP2D5NB+XPNOakt3F+mBeFNrt
	jpadxAvSpDyNOEn75uwJAak5Pg16jRXIfSuegyhik30AeMHVeInh/W/Fh9iRrATE4NwDLROeCPx
	EkfAO3U7rcMpgrE8IhKM7AL9GmOkoPQlLDaBmc2wbgsLYV9fZ
X-Gm-Gg: ASbGncvrFa2hgUolp/fC/8L9SYDLvWsVIfy0gxcvncwdtgqxP7Cu8Kr4SDiWXid7sij
	uunN52/DqDcUHrcYCoUZAuChWH0Kvoc7JLu9/ez5EUqLvntZcA8w/+/Y8eLxse1SSTqb2cM6gW1
	Njlxh0Yqx+KsX93iEM0ATWtg==
X-Google-Smtp-Source: AGHT+IHpp2NWMXBPtPmK+nwFyhBtZNA2vTr8wwH2QoJMNsLq4Gpf5YQeAvTFVW+tFyTNW4iV9HptwjcCEVW6Oahyl44=
X-Received: by 2002:a05:651c:54a:b0:309:20da:6188 with SMTP id
 38308e7fff4ca-31e7cff0c78mr7933041fa.6.1746002863004; Wed, 30 Apr 2025
 01:47:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430175001.4d12e01f@canb.auug.org.au> <4386227a-3dc9-42c4-9cc1-827dad1556be@kernel.org>
In-Reply-To: <4386227a-3dc9-42c4-9cc1-827dad1556be@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 30 Apr 2025 10:47:32 +0200
X-Gm-Features: ATxdqUH8wc4eV2JI38qs8w_0ktGCGFATczhejqgAF5f1Rqzi-aVwrIV_qYeISlk
Message-ID: <CACRpkdaxTJ96hpJqs=xWVD4gSLdgc=m9uq+rbJKrJL+jgC645g@mail.gmail.com>
Subject: Re: linux-next: duplicate patch in the pinctrl-samsung tree
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 10:29=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> On 30/04/2025 09:50, Stephen Rothwell wrote:
> > Hi all,
> >
> > The following commit is also in the pinctrl tree as a different commit
> > (but the same patch):
> >
> >   0a5b9be31f78 ("pinctrl: samsung: use new GPIO line value setter callb=
acks")
> >
> > This is commit
> >
> >   9e4c444755b1 ("pinctrl: samsung: use new GPIO line value setter callb=
acks")
> >
>
> Thanks, I will drop mine.

Thanks Krzysztof, my bad I didn't think about splitting the series across
submaintainers, I should have. I hope this doesn't collide with anything
in your tree.

Yours,
Linus Walleij
