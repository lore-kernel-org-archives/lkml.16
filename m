Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6604B1E6E
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 03:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746588518; cv=none; b=HqFNRBkIzFXuMXJz88fEf7CPB9vIKbNRnN+wehs1GrM04FUPWkwxHkl0pJncXmkJDiW59Cyd9MQ8qoXqoWKkP/oSrc8t9BPcO17+uQHvWA/Ytn4k3Po43vDO4rwPPjaIsvyoDkTRfLa4I/sHYc5ZIIxXTQtYl+B6Qn0LEzfgPJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746588518; c=relaxed/simple;
	bh=T/S6X650aT/P83grI1vn4Iyj07dvzwG+F/Lus9JFLjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JmyeM2BB4AOCyhEyMx2s6mg8W1mwn+oLUAWscYvB3ORVlwTZ6wzISSxHCZ7vhpNXJVc2kVle9zH5gDf9Lg+znngkXQrA1BU0xO3p8VoWP6qONIjmb4JW3tfEmOiQg/2ydB4mmvZT9bxE27AUrtT0CgTAnAmqRCzbuw0Xp7LzTvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=i5ocSWlj; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="i5ocSWlj"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54b1095625dso7748795e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 20:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1746588514; x=1747193314; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iv4fa6bEf/aYGtRZMNVXuLVHA7gtDCzPA8PZ/66V1hw=;
        b=i5ocSWljjpoKWhBa8xWJWT7SiRzBOV8b3+PkwcQRIOD1JhKsj5OUmLCnHtEBEsN6ts
         BAHC9KS+xEEEQ8BjZ1P3QYkq7da/31PJ8AZuLwCSu2s8FD5I6qKNPOpUwAjx/6RpIMew
         kYKp/lboD6ff9+cLDufk5T4V0wwf22eUN6u/aZmJ1gK7DviH1aHme0CvdjIDmNzixY1F
         qCIGBfrNSNUjMxgb5xpFIkOghL7FepJp5xEDxmYffvqDCjCiD0T5sGjiVX9CCP09dfdL
         BkCJD/9PdBUH9l2Z1gaIIvcJVKhv1lMGi4PreBTsPsxbg1EZIlRPgTPSixoFgGPyguJz
         Aiaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746588514; x=1747193314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iv4fa6bEf/aYGtRZMNVXuLVHA7gtDCzPA8PZ/66V1hw=;
        b=CsDWC9GytOeSu7zUCe3dAK6xSX8tqdOP0d7i/tT2z3MLalkwhkJUqm1yfvKoeydDJ0
         Bk49FCb9gHQfmJikVpXPf9sWfMnT6HRAIDwqsS5eHZ0+IXA0HlhHZCQuA127GnGU6bVe
         VtSMNd3lMKcBjFwRv4AoG4J55Nyv3N3M6AkT0GIA1vwRAOaYvEjjZDxAWfM2z4Gw6hcF
         khZSlSlq9src3GuN34z8C0x5F0CRgygHJHMlHIE4Qape5ItfYOJ2OVr6YVLPNOZ3A5UQ
         KsyKMRoQcucCOqFGjSTKIHyYap6q1bGo4ZH0wDZPPTmudVFhwcxJL2IdltQ/ilU60u+A
         LkbA==
X-Forwarded-Encrypted: i=1; AJvYcCWTU82s5d5nIMX2sFsrKUMJ8rzZXFTl/AgXuGsoAQwjkhwXJia2PwtJCvciTvCSj306IJJCady80zzxMHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJJtIRsNSLnYXR802dsBjX/Mpy5rSWHMv1DnEu5+lzGCEKWO4C
	aJwogdJ+1EL6jcx0P5Cem0Zxj0pEj8Fwqm/1rZacNBp6/v1Rt2wdfFaXb31xG9GN23JN0+NfuxS
	SdnAPPqVGIpuQmIQANvllihjbRC31k/quAB8Sag==
X-Gm-Gg: ASbGncuDyEJD7FIEMBOG7WrunAC+cHL+BuLu0//EZ5isgFd0T2ZIueG0DIoPmLCpbJg
	qTCNnjVgqrcX1PH5ktcktniTOlRF7WTZoACKqspAbU+zu/B7BZsXR3MVNb4RTQkZkxz9ZeNgH1D
	qcL1RSu/8+7ZYj8gcFwzjbMe28HWTb5IxaSjc=
X-Google-Smtp-Source: AGHT+IHRVpqqQcL95885VdrdpyBvN89mmkxIZU6+3qzFWNLh+wBb2l1zbH2piMCbuTmgwMmhCOFlh/Z9OxL+pEKfjTw=
X-Received: by 2002:a05:6512:3f1d:b0:545:441:52d2 with SMTP id
 2adb3069b0e04-54fb95fc541mr452808e87.23.1746588514476; Tue, 06 May 2025
 20:28:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1744169302.git.hezhongkun.hzk@bytedance.com>
 <b3af3747daefa00177b48f4666780da58177f7c0.1744169302.git.hezhongkun.hzk@bytedance.com>
 <aBHYT27M1tRxNLRj@stanley.mountain> <CACSyD1M8EZ-qEhSGsLTAs+i+YMGPMw-+39Es1SLg-OxEbgg9yA@mail.gmail.com>
 <aBRtJdD6P1rgTsuA@stanley.mountain>
In-Reply-To: <aBRtJdD6P1rgTsuA@stanley.mountain>
From: Zhongkun He <hezhongkun.hzk@bytedance.com>
Date: Wed, 7 May 2025 11:27:57 +0800
X-Gm-Features: ATxdqUEpVU2jD7ikyZC6T62CndZocg-lExlEj4Pp9luYeKfvaUnUCLsCl63KMuk
Message-ID: <CACSyD1PmGFru7RBPOhSqKDhec6Zf06rkRHvk0os_5LBGFkq2Xw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH V3 2/3] mm: add max swappiness arg to
 lru_gen for anonymous memory only
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, mhocko@suse.com, 
	yosry.ahmed@linux.dev, muchun.song@linux.dev, yuzhao@google.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 2:59=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> On Thu, May 01, 2025 at 09:56:57AM +0800, Zhongkun He wrote:
> > Hi Dan
> >
> > On Wed, Apr 30, 2025 at 3:59=E2=80=AFPM Dan Carpenter <dan.carpenter@li=
naro.org> wrote:
> > >
> > > On Wed, Apr 09, 2025 at 03:06:19PM +0800, Zhongkun He wrote:
> > > > +             /* set by userspace for anonymous memory only */
> > > > +             if (!strncmp("max", swap_string, sizeof("max"))) {
> > >
> > > This pattern of strncmp("foo", str, sizeof("foo")) is exactly the sam=
e
> > > as strcmp().  It doesn't provide any additional security.  The strncm=
p()
> > > function is meant for matching string prefixes and it's a relatively
> > > common bug to do this:
> > >
> > > intended: if (strcmp(string, "prefix", sizeof("prefix") - 1) =3D=3D 0=
) {
> > >   actual: if (strcmp(string, "prefix", sizeof("prefix")) =3D=3D 0) {
> > >
> >
> > Yes, I understand the difference.
> >
> > > I have a static checker warning for these:
> > > https://lore.kernel.org/all/30210ed77b40b4b6629de659cb56b9ec7832c447.=
1744452787.git.dan.carpenter@linaro.org/
> > >
> > > If people deliberately misuse the function then it makes it trickier
> > > to tell accidental mistakes from deliberate mistakes.
> > >
> >
> > if (!strncmp("max", swap_string, sizeof("max"))) {
> >
> > The length of swap_string is 5 because it's read using sscanf, which
> > will add the null terminator \0
> > at the end of the string. If we input max into the interface,
> > swap_string will contain max\0, which is
> > equivalent to the string "max". Since we only need to compare the
> > first few characters(There are other
> > possible inputs as well.) =E2=80=94 effectively treating it as a prefix=
 match
> > =E2=80=94 I used strncmp.
>
> I'm a not sure I understand.  You say you are treating it as a "prefix
> match", but sizeof("max") is 4 so this is not treated as a prefix.  Did
> you mean to write strlen("max") which does not include the NUL
> terminator?
>

Hi Dan,  sorry for the late reply.

I agree with you that we should use strncmp for prefix matches
and I will update it later.

Thanks.

> regards,
> dan carpenter
>
>
