Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773EEDF59
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 03:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743736737; cv=none; b=Gg6tDozbl3mZ2UBw7LjafdYwPZbiObPc/OtrnE7HLCSUcFJRcQYdLZGmbKMkegWB7rdANGY2XbRB1C3tg67BVnoydhtWSFrCJLLYyBwonIps83QtmcD2Wr+alCaM6SJS5FhrDO0wQxC42UcX+mIGhH0qOx1R8Bivqagu0KneTww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743736737; c=relaxed/simple;
	bh=OBPJaD2piZjZcx1YB47wWfQirxBSVL+pRpiU5o+l2nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yh2ZWSWwtYqlc2RkIKU5r48x4hKUZl09nYQQ6PVeZTEhxc93xm+NOlQiDMDGf1Ufjt7Y/BNku0s8KBZxYc1FFZkBfFTNVwcl9X9ycYPGySG1TasubuV7+qHYJ1/vY2OvZhE9kxHnTlMw/QudfFIvghu75Aj2azB70e7z+UdiGrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MC8J6Sfp; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MC8J6Sfp"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5497590ffbbso1656374e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 20:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743736733; x=1744341533; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KfIdm8LMiVdTMrG147G2sckqziwbRabnu250NjOoGsk=;
        b=MC8J6SfpyiVAnqWiL/wZbl2ZR6q5AhF+U7SaVySBbaReMub16qo9E0lbBBtiihbtuF
         7w9gpim05UZIYxO9ZPDfPJ0aX3bm/R/uS8A4AXYPWzj3cEZX7YICiBuOVK6ry6edqqAU
         kiEhI7YbD2Xcg4lDK8F6Mwcn4c/hs5SdVAC3K/aI77McezPVPKnQIYhazjmZKDgoXI3j
         esi1cR3l8sJ7Eq96IPgZBnvkbmTrba+wpBY4B439wUTyTHmD3twO7IhjE5yKGPZzTpdn
         eIXHx+qtouc+H/gCGUgvg8vNt8+dCqQD00+EXdMPp7uytwU72nKn2pioWxXZvViJblck
         HcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743736733; x=1744341533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KfIdm8LMiVdTMrG147G2sckqziwbRabnu250NjOoGsk=;
        b=EvQC4Q3JRmmOU9wNVLi/QxDym7dZRtitIKpODtDN7Y5PRGAc251ajFR3P/7XNEYKdR
         BtDPwISmVCjxaz/IGXSjZ5vfl1B6fXHE/aAmhoj68+BgeBnZV0kCx9dJsAnZnA8uAbFy
         3JUD3CM+xRs9dy8le3tH0KK0DDHuNlZEgx44m2zeSIKqMWCteCUTSckLsmF1um1PhR5q
         zeMDH/9ehghAaupgN19biZFnVN0Cv1WIQywHciz19lnMWRvCSWdhe/sGSep5et4vThQq
         K2tzc84/mljilcXRF0xYR1ViWVIJZpF4k6Z9PIpLWiYPiGvesQTb4/oAF2ljL9ZbbCZi
         0jPA==
X-Forwarded-Encrypted: i=1; AJvYcCXiLH024fgLazBCwZllpXQ/klsjszV/dwWiuXUcqjUbcYuHnmAij3s+z37Kg+G7Sq2Z+0Tz7D+MPepb2GQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKKBtPl69UvJ5iVIs3IRyIGUUahp1AqvTt3TQUTTuCvDI07559
	JNAkbwABtIm5oShc9LRxuXi4e7ZA5cXZiuvSPjtZI8S859VuKDJGvF7B8/GeOXqo2538pJdd0zW
	Irgb4sNhKA9lc0XEkHxNkNSr9mF6f0EnKeb/iqA==
X-Gm-Gg: ASbGncvDhUwLl9pu15vHocfEI08/uibsGaxqhByMSyTUGAoBUIAcW4eOZ2UYD0RMrQ4
	UypLP5BtB4ZZcRtEdmMosDyrW26jRbbhJ5XFHIv5zg0vnHny4cPmTyp38pR5TjLr/+0xLQEZKs+
	pW4OwtIQ5r1iRUuSuYfKA3qxd/ZWziosRAsPOCAQjSMNrsR4HyS8RxM6oc7hQ=
X-Google-Smtp-Source: AGHT+IEAe2mV9gBGz5BrikSEvE2BpQFjuuIONd2NAHgsz8SVHxZYPCAShKCqREhuRjuJWI6yt11nYFQCCFVnLfh8cbY=
X-Received: by 2002:a05:6512:1149:b0:549:4ac4:a453 with SMTP id
 2adb3069b0e04-54c232e2534mr217235e87.21.1743736733578; Thu, 03 Apr 2025
 20:18:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315194002.13778-1-marco.crivellari@suse.com>
 <20250315194002.13778-2-marco.crivellari@suse.com> <alpine.DEB.2.21.2503211146001.35806@angie.orcam.me.uk>
 <CAAofZF4gy6WJKLK4TzF5aV7+ca3gob5jVz3XQZyGrTpfnCsn_Q@mail.gmail.com>
 <alpine.DEB.2.21.2503211747150.35806@angie.orcam.me.uk> <CAAofZF5yaGMG0Kyax+ksfGngQ0T6AxvN5-60SnasQh7=OabaOg@mail.gmail.com>
 <alpine.DEB.2.21.2503260300290.29685@angie.orcam.me.uk> <alpine.DEB.2.21.2503281345010.47733@angie.orcam.me.uk>
 <CAAofZF65p+DnH8xA0+sfuZv=VO63Zgv4rQ6frrdEzQYoZ0MaWA@mail.gmail.com>
 <alpine.DEB.2.21.2503311348560.47733@angie.orcam.me.uk> <CAAofZF6Gnzm9isPt3NUuSPBmBWQsj56O43pPZAf64WEP8no2Rg@mail.gmail.com>
 <alpine.DEB.2.21.2504021933160.53907@angie.orcam.me.uk> <CAAofZF7YVK207bVYu5-p0CAKjpB7hHYomgd9wdV1J=5GkeNXbw@mail.gmail.com>
 <alpine.DEB.2.21.2504032112590.53907@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2504032112590.53907@angie.orcam.me.uk>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 4 Apr 2025 05:18:41 +0200
X-Gm-Features: ATxdqUH7RVZyMz3ja_N4WNP6WC9cuJszBZhHcEfue4vWowE7yrpheK4O9Az_Ydc
Message-ID: <CAAofZF49o1BeLYFjrkUsmv3BY9zRNJErazjRCYFtaM+N3aCrCA@mail.gmail.com>
Subject: Re: [PATCH v6 1/1] MIPS: Fix idle VS timer enqueue
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Huacai Chen <chenhuacai@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

No, I didn't wanna sound like "never".
I really meant the future patch series.

Depending on the load my full time job will have, it could be in the next
week. or a week later. :-)

Thanks!


On Thu, Apr 3, 2025 at 10:17=E2=80=AFPM Maciej W. Rozycki <macro@orcam.me.u=
k> wrote:
>
> On Thu, 3 Apr 2025, Marco Crivellari wrote:
>
> > Great, so I think that I will send the v7 without the "rename" part,
> > so we can address this in the future, if it sounds reasonable,
> > and find an appropriate name.
>
>  Well, from experience "future" sounds like "never" to me, but if Thomas
> is fine with that, I'm not going to fight a battle here.  I've got enough
> stuff to do now, including some rather urgent discovered last month, as
> far as the MIPS port is concerned, let alone other things.  Thank you for
> your perseverance with this effort anyway.
>
>   Maciej



--=20

Marco Crivellari

L3 Support Engineer, Technology & Product




marco.crivellari@suse.com
