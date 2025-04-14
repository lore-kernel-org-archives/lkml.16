Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57576EEC3
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744657965; cv=none; b=lwgD2HdCy77YAVltBsIqlH08Xp4J/kfyJ7OAHFE/AqEg29SWLV6gehgUHP8dXCGfWaJOMwfKu0n00CAeAn8IcZbo6ldUZKCRvMpNOcp0L/itq7Ses1FE/S2Qg30apChqbD022k0P/irkVGZgCrVyoiwNXzN7lNNdyWkqEHukLPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744657965; c=relaxed/simple;
	bh=IhRuZepcsCK+qXWZ2V/TC2+eiOz/oDuk2WL53L5B6yQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S8cgaNJ+5n3nUVUqrTXuCUVH/NnEweFyCw8OtL1tthjIU+v8SN0t+vUIY/9l/5QoFvy+dHvlTfwE9R2Ef7Lirfj6wsC/2Q/rRrQAToI3LHNmb72TrNEm0DWQW4kdTzTHkNWyZijzoKiqYGIWJ+N9zYpZ/1/H5+Fb5DDO7grnEMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CgodgVfz; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CgodgVfz"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso7481379a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 12:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744657962; x=1745262762; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IhRuZepcsCK+qXWZ2V/TC2+eiOz/oDuk2WL53L5B6yQ=;
        b=CgodgVfzQrNdKjCFAf2UUavBqkSOvtiA80Z6nbjyu8Z+9RtLMk/HQwoufEwcRopBjc
         LorWD4l40Z5bf112wP2yv6rEVMGdn9H1PTxkKs0Nynmm/hzILKsxHO+ph8wtQCvfIQoo
         WN0u9SgWyTEUHcgxL29Ys2I0UxAsoTn2G0qlJ+UXn8xR20eBaLQ1N8qz2d7uaqVpaJRj
         jJOuZ8Vfjy89IRDoz5UD5CqFd2VHTT71s9KqOFXlvG8u8N4hb5qE85+4PlPKTZ1HrS8t
         e260M2HgK9ZdScNrj63OdvmXWnNWd9oaS0AlOpes9IaTu9yN/kLRI1cz8JYrDLuUcuHt
         6oIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744657962; x=1745262762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IhRuZepcsCK+qXWZ2V/TC2+eiOz/oDuk2WL53L5B6yQ=;
        b=pwYpXmTAs3xJ2ovr/tr4yIugZ5GsH9qq1HNSOQfY+qHl0RtHRMeWNnpDUPKwP3hBiv
         I/Ajl1tQZTpnOkARzwQpFQHxmbLO2IQ9AodI2a0w3qOH4Jn8eDZat9pQMOc2qvfK8PJa
         WgfrqXjgQdBtiUl5MUZFwcaMBkpeQDj44DDbUls4L9W8TnQHFFqhpmnsL6N2nO8AwS3w
         esRN3gFnyAPD9+tcZzrmvs1ssqLw6UBUbPNho8IYCx/3sL0X2njDHwkWOlz+K25hEj+o
         /WNAEJMZH5Mqc+iMmzeIr8ZkcnTNpe3sbR0KKIoC6yisHMW0rOjMV+DEoQfUUV7zNR2g
         HtBw==
X-Gm-Message-State: AOJu0Yzsi5cEJDYJRfVz+oh3zgwDm9pvzGIlHFCPguqZ8bQoefEvS/6T
	w6A3ceUNFN+IM3OCTmOrhpc9+QMkV9W4LHQhVVCor6rfAdiGuuBL2SxsySyWkhvuyO4rhfKLe3p
	LyMZSnmnjmIRBweFobluDQ7yTHvM=
X-Gm-Gg: ASbGncucainlOJOyGVwo15gdKW11AMj2VLQc3s7vKUdbKNu/USIf45PlhLYsLP+Knek
	j5Ct7rclUbnpmbGcPeaNWR6rds3fxFKYocYceglgOIZIx2mYCZra92h3PM3UgiNS7JQbZ8j43BV
	fGLi/TZNvzH5C5whoXjctJ6w==
X-Google-Smtp-Source: AGHT+IFxF/KeOC1drCOZxzAXvht1UzKdbif9N42GIKSFCTyDDMAkuOVstF1j0XKVOdLkYakfDJDgT9bVW1rm1LQtqB0=
X-Received: by 2002:a05:6402:4313:b0:5ed:1444:7914 with SMTP id
 4fb4d7f45d1cf-5f36ff07bd3mr12628106a12.28.1744657961414; Mon, 14 Apr 2025
 12:12:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKSQd8Ug3Vk3A7eE6nB8UbhmOBBzVpfAqDYLf35Ym444MeQRdA@mail.gmail.com>
 <Z_0oWnbcjsekHXJd@gmail.com>
In-Reply-To: <Z_0oWnbcjsekHXJd@gmail.com>
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Mon, 14 Apr 2025 21:12:31 +0200
X-Gm-Features: ATxdqUGOyTIOkL9eowq55FR8vghkoYqcCwXMFoEutNgWRmJ6JQHp0mXG2SacIts
Message-ID: <CAKSQd8V4xBQgx3x+SpRBq7pEdEr6zUw_NmajL=X-k=-APDUz2Q@mail.gmail.com>
Subject: Re: [PATCH -v2] x86/cpu: Add CPU model number for Bartlett Lake CPUs
 with Raptor Cove cores
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Pi Xiange <xiange.pi@intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Tony Luck <tony.luck@intel.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	John Ogness <john.ogness@linutronix.de>, "Ahmed S. Darwish" <darwi@linutronix.de>, 
	x86-cpuid@lists.linux.dev, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 5:23=E2=80=AFPM Ingo Molnar <mingo@kernel.org> wrot=
e:
> * Christian Ludloff <ludloff@gmail.com> wrote:
> > > +#define INTEL_RAPTORCOVE IFM(6, 0xD7) /* Bartlett Lake */
> >
> > Please fix this. It has the core and the product reversed. That is, it
> > should be INTEL_BARTLETTLAKE and /* Raptor Cove */ to match
> > the bulk of that file.
>
> I switched it around for this commit - see the updated patch below.

Thanks.

> > And yes, you also want to fix this for INTEL_PANTHERCOVE_X
> > and /* Diamond Rapids */ entry.
>
> Please send a patch if you have the time.

Peter had proposed...

https://lore.kernel.org/lkml/20250214130205.GK14028@noisy.programming.kicks=
-ass.net/

--
Christian
