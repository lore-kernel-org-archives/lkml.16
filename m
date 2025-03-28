Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF4DDDC5
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 16:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743177733; cv=none; b=q+4efaF6ygyTz38oq90vHWxsZ5BiHlwLlFLqMRFf8HqdjUfD6QwA9rR3XORD6V9RJ7k2Z55nwaL+S0QfgESB7aMqzOHuDwkGC0qeBwcjAqrWkhD5IK2LEK1OqXg1GmvcF1xgrIBoLQEs1nYcRCnXONWgcZEayEcQaqwljBdltCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743177733; c=relaxed/simple;
	bh=qYBYMvjeXDPAYzY2e1Wu2w4F6bkztqDcKffiaC3Wj8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=btwaymhByCfbte8uIQ7ht+CyFfS636mYgOSUTPovQuz+tz9bd935nyp3DGyO8wLogNHhwVe4JMjI37IewqwmQ9m72LHC8MYEm4LqwC1tSPjpx4zBHbqyUdL6myOdRkCuXnKcIb3h9m8+eamOoU0Bo/3oKcbtBXQN0FPP0HZVZpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=HR+uczkC; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="HR+uczkC"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-72bf87b8fcbso657059a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 09:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1743177731; x=1743782531; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S6G0qiJQGXC3AXOvDxr6xdkIUMr8b4TCV0bYMLRr8pk=;
        b=HR+uczkCjcBhqkTsBjBMKLMrmLDnxMpSsY2TEEBlKitDM/BLljW6QT8zPtiZz37/2H
         VXHI0n8RYgX6Nlesm36cGpY/Ficrur33L/oWuSo5VDRAEoZgJm2MOTH5tKHlp/pKdiUZ
         HFW4mVOIGO+9uZ7VMuFAfP/eeTTIqqls9KBW+QYKZSoozeEWOJz6XFoDbRK1u5BoVB2i
         PNFgD1fVFQvzhqNYuan9lbfxWGWc3SXBEGbrEbEeOmtwjnw9Iy4B7c5wD51Gaam5f/Lf
         E5PVMojyI3jek3yE3Mau1D/y3oTdC6iavN18idHENbLHQGLsnS7xk1QewQKv+niHCWNw
         SkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743177731; x=1743782531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S6G0qiJQGXC3AXOvDxr6xdkIUMr8b4TCV0bYMLRr8pk=;
        b=u0mpJwTwHhWp0Vzw6A4kRWhWkqu+XSrjUVPSKSAETPQS/j4ri1hIpjUNmyxGeS8cwK
         lct2/SWz1oTbRXdNRaFht+7AubWV+xBYT5Vd48PA88EM09lCKd3E35+DAxvqMwoN2jsB
         UFArmwL9+PZW696RQHinaEuLQTAo6sDi30+UDSVF5fxYqG0PVhIhnOVs+Vo+zZlucNK6
         TIAarVYdHg9PoibdoHpJl/JANtC+3NoC7aDuFsg9EauyBQtBx+RUHDxXmnzgNUWccq36
         2ckFnT5Z1hxzKYxaJmTBsGGzHfSnKVDPyIZF8TLsXG/B5styCRbgEB2Xjz+pO1Etdy+G
         Otww==
X-Forwarded-Encrypted: i=1; AJvYcCUaztK2e7hDIhVao3Ss6H4HJJSKW3qsGvK3prR8HoY/ZuqYBz/8VchvOFhm6/7stnHjBvEu86QZZkFVuVE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz+ShrqM27y/viRJfIC5loPrY2YuzJ9HBC2/GrXE7Wjl68pWKe
	8aScc4GI4mK01vt0LcpuQ6/epm86OHNz4GB5nJtDhmqwr7efCz1ltFgMi9e5e44VSPaAJsWYHv7
	SW+NIrJBbO7qwbS6HHecxYhk+mgjqfv/tPl5o
X-Gm-Gg: ASbGnctbM5Lp9qfPBmyYYEIzh0KmKVQQI3J3bw8YHCWcxWt56dKKqfJ3ee3uFbqwVm+
	3z54ZEujusRCGzOW8mr5w6AZJTWgIejSQodvv+8OccAaFbVfhsazjEZAbgkwCfMq54e8myizNmm
	Fz6mhA7lF+hlpKa6e4lCta+GSXoQ==
X-Google-Smtp-Source: AGHT+IFADzNU03cXbAbhHDbtnSsdcn7VfjDVFkPBYFpuag6zZCgoVTX+CDLsqNcb7YZJQ58Ma4O68Ya7pCE48hLZl6k=
X-Received: by 2002:a05:6830:4389:b0:727:3a2e:2132 with SMTP id
 46e09a7af769-72c4ca57a45mr7687987a34.21.1743177731160; Fri, 28 Mar 2025
 09:02:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326074355.24016-1-mowenroot@163.com> <CAHC9VhRUq0yjGLhGf=GstDb8h5uC_Hh8W9zXkJRMXAgbNXQTZA@mail.gmail.com>
 <20250328050242.7bec73be@kernel.org>
In-Reply-To: <20250328050242.7bec73be@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 28 Mar 2025 12:02:00 -0400
X-Gm-Features: AQ5f1JqR6F0XsVs30PNGrh2y9naOsg1JHm34kVbGEXFksP6pfuXuFw3UH1I7hgE
Message-ID: <CAHC9VhRvrOCqBT-2xRF5zrkeDN3EvShUggOF=Uh47TXFc5Uu1w@mail.gmail.com>
Subject: Re: [PATCH] netlabel: Fix NULL pointer exception caused by CALIPSO on
 IPv4 sockets
To: Jakub Kicinski <kuba@kernel.org>, Debin Zhu <mowenroot@163.com>, Bitao Ouyang <1985755126@qq.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2025 at 8:02=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
> On Wed, 26 Mar 2025 15:38:25 -0400 Paul Moore wrote:
> > For all three function, I'd probably add a single blank line between
> > the local variable declarations and the code below for the sake of
> > readability.  I'd probably also drop the comment as the code seems
> > reasonably obvious (inet6_sk() can return NULL, we can't do anything
> > with a NULL ptr so bail), but neither are reasons for not applying
> > this patch, if anything they can be fixed up during the merge assuming
> > the patch author agrees.
> >
> > Anyway, this looks good to me, Jakub and/or other netdev folks, we
> > should get this marked for stable and sent up to Linus, do you want to
> > do that or should I?
>
> Thanks for the CC! Feel free to take it to Linus if you're happy with
> it. We don't have the posting on the list so it'd be minor pain to apply.

Will do.  As long as it gets up to Linus somehow I'm happy.

> As you say the safety check is probably okay, tho, it's unclear from
> the commit message and comment how we get here with a v4 socket or
> perhaps not a fullsock..

Good point about the root-cause/reproducer; there was some discussion
about this issue on a separate private list and I think we lost some
of the information along the way.  The initial report was for the
connect() case, but while looking into the problem I noticed a few
instances with a similar pattern and since we're only talking about
one additional NULL check during socket-level ops on a CALIPSO marked
socket (nothing per-packet), I figured to err on the side of safety.

Debin Zhu and Bitao Ouyang, considering the other suggested changes to
the code, would you be able to submit a second revision to the patch
that incorporates the suggested changes as well as an improved patch
description which includes your reproducer and notes on testing?  You
can send the email to the LSM <linux-security-module@vger.kernel.org>
list while CC'ing the netdev <netdev@vger.kernel.org> list, the
SELinux <selinux@vger.kernel.org> list, and me directly (just in case
there is another issue with the mailing lists).  This should also give
you an opportunity to try posting to the mailing lists again ;)

--=20
paul-moore.com
