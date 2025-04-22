Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265FC23A9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 23:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745365095; cv=none; b=YhS9+pbyjQ8Wj6gsD80amA0uObLIz0c0hcCeFQ+QYe4NBkmMh2un7Krc2yUbrgp+YIM+PF1KJECcMRXx9p5lielPoP4Aybp2G5oWhmSYnZCoK5hibXSMFD0j7wUEQtEWMR0EJKe3W0kqSc2UTUi6JQfBoQlLGGujNqGWla8b9KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745365095; c=relaxed/simple;
	bh=TqqG2LNoGAsx+ipRc6k+98pvB+ZsqGkBZ71g80FvpJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=syd6tN0ntyLCdKuvPYREGBrpdhNimiaen9j07lfUy5LhjGkrsz6JTp3AVMMxJogKdNpWmNQj9+mNVPe2EaN/Dy8rZq1XFsoxwQIVotrq6PShbR7caiz4mAHZG/nh5tzYy48G1JHPAz6duoqq33BHK2DVhs3l8HKcs9del07NlVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aCwqvyCH; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aCwqvyCH"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43690d4605dso46495245e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745365092; x=1745969892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9kiJiDrNu9QrIuFhHw/PerDEHgA00oOzzMbUOabBrU=;
        b=aCwqvyCHGAKFcR4wTrkrwFooTuhQPj+7Tw2WqA99/W9VdGx5VkAjXk/HqCQNsXeee4
         8K70iQQf3SK+b9s3O8IAKXRPzUoQ8ln8JPLK2JV8Pn4Vlgx5skFh9xWRSxwkD+BL4S0O
         mkkjhV2q99L1GzKMNE16vYZ3pXExfuinzWpBIUCg3NSBzE/asQT7u+NN0Eo8n6ztyIAG
         Ak27KJGi3Wv23yzpHNcH0ap4RGZlJuHM+UGTKqCsMMpN3lFgFrquJAwcHKj/l29LFAJO
         OPz3qe1IT5HcKKqY/+VZLYRx+eN1Ujsf1NYvR7sAKq1N6NCPh5ztBN+rnsDEOsugh7AM
         x5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745365092; x=1745969892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9kiJiDrNu9QrIuFhHw/PerDEHgA00oOzzMbUOabBrU=;
        b=cD41mp13ZMF1vmOgNPuPte3OC8LyP5B2isHCTFnwsBHNRroFY7OYzCHD7xhR0icQvV
         lqpIYdh5Xs5+QA00JHL05GjF7FG8JNJ+j0YggFOaQsXsBBQe2kcOoTboc5E1MpG19Jfy
         SZ77jiqRYwon/VtPERSJ/iWel7cl4BRAuioCUpzD3beZ/Q/LbDZY4lAumwAS87ZC7gB/
         LHsz+7+MvZZy6RofILpN7P5Bfb9ZWba7Da1jgMEUP4kz7mokQYO5yURcVfwQpxLViKUv
         0VaqZ83fnownom3ej1fkFniz19Y+iC6B7jgXATjrK7qPKBpaz0kkS0emJHX9SrXhC1L2
         ctYw==
X-Forwarded-Encrypted: i=1; AJvYcCWv+41DQ9yi1QJxYO5jQ5rUktTlIPbHQh7uDVLBSqemjo5TB8Yz821i5G/vY+cgjBibJ0zeoVVyjewthko=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcui03qIm8SV8IHZkIt7IHZiYAOjaiE9Pz4plstGndozwO5BdX
	njqm54YcWAITOz261AocI4iT28jpSVpUme6MiP/Z6Bn4VM8cnBBXsiWmtIGPoNPj+HeQG14cStM
	/fz4H6KnkMW8lInPTRnLYJ7GzIq4=
X-Gm-Gg: ASbGnct7u8iVCRtjS/2jp2DfRmvxm0Dkn53QoNACRbLbt7QpkLda/0a1Wg1fV4ZKS13
	18pVWmRRAT+Htwm468fT4GxIYoNXgNUIIWYssRkowi7Qt3oQhrwPgnpoZ+PSp4WzWcmiYnNAG37
	i/ObxM8ZPu564u9AVVyJ65sdLFzqAJqMjh5CjkOg==
X-Google-Smtp-Source: AGHT+IFlAw4QwnAeq8ICRHIT4XzndH17qxJiG/ozfs8w7WW8IXGmj4geQ8Ck9Gk6XOZj40O7vAal0b2EWix5vCTUHO0=
X-Received: by 2002:a05:6000:4021:b0:39c:1a86:e473 with SMTP id
 ffacd0b85a97d-39efbb22a85mr13199515f8f.56.1745365092332; Tue, 22 Apr 2025
 16:38:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wgjZ4fzDKogXwhPXVMA7OmZf9k0o1oB2FJmv-C1e=typA@mail.gmail.com>
 <CAPM=9tzj_OBFJNsN9j7nMs4OR3=V9yrPmaH7VvN-KNYUYhf-vQ@mail.gmail.com>
In-Reply-To: <CAPM=9tzj_OBFJNsN9j7nMs4OR3=V9yrPmaH7VvN-KNYUYhf-vQ@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 22 Apr 2025 16:37:59 -0700
X-Gm-Features: ATxdqUEoSvCDRf1Q9lbRQSiW8TgUsi4yvpytg9q4clGEDlxihZ16pM0M261XUS4
Message-ID: <CAADnVQ+KnfDLd-=Mg1BDJxCf80K_=RN0dJy_yp681gf1dQMhtg@mail.gmail.com>
Subject: Re: Linux 6.15-rc3
To: Dave Airlie <airlied@gmail.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Vlastimil Babka <vbabka@suse.cz>, Sebastian Sewior <bigeasy@linutronix.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Alexei Starovoitov <ast@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 4:01=E2=80=AFPM Dave Airlie <airlied@gmail.com> wro=
te:
>
> > Alexei Starovoitov (2):
> >       locking/local_lock, mm: replace localtry_ helpers with
> > local_trylock_t type
>
> This seems to have upset some phoronix nginx workload
> https://www.phoronix.com/review/linux-615-nginx-regression/2

3x regression? wow.
Thanks for heads up.
I'm staring at the patch and don't see it.
Adding more experts.
