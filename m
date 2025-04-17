Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C2315A868
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744900233; cv=none; b=M51pmkSlIv5LetRuNq+jJZ/uLGnN8oPwUiupFNpZh6ir7Xm4jwIZQGjpt+NzTiPj7Hw9L/ERA6UrpatT0NGVCqP+zU9CDS/zb3226ynwhhOWWrgsQOdvDyFwg77h4c2LPmAEu5Ohy1k+RDvUPt0AqY+6mYwHFX9LXSk9GiuT8rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744900233; c=relaxed/simple;
	bh=YfCtmVGoFSkKpjhL5I0rf5Nt3BlAznqyCmYY6G7xfjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vv0ePlprHDbTRjkN9vCThVwG3037NtI4W/11i/9Xg8gzJmZoLJM6sZSEchzAi6Kvfg2X3PirM2w/24Com93c1KJka7A3jo6ROdOBTjnf0UFZHKYSY+nyOy0ewpIudzL7PIeoLptChXM6STkVZRv8lrkFqgukqZF7WIknFQLezPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NBY5wZli; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NBY5wZli"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e6ff035e9aso1606461a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744900230; x=1745505030; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfCtmVGoFSkKpjhL5I0rf5Nt3BlAznqyCmYY6G7xfjg=;
        b=NBY5wZli+mGhu80tt4Re9qjqMjo9M+95mJ6ODhRNeg3cpdaiCya4fic30ncfIGgK2H
         CBhHvoAJJZsd4cxXdSBRSZ1RkLWMwxExI3BrZq4d0lQ2CRZem1m2uyz7yVmgQsJzbfIZ
         gFZIbobLC4MON7Lxl2cuw27ocYFrDdmMNmRqmDDr/6RaeDbccEqsc75db3L/MqODKasI
         8X8e4odH3i9zNk6r91dwggZ/q1i5cKePdoicc8tqR/NmYZ8PWAYpKeZH7/6MRyzXNbQm
         lrMU/xT8J0nsUpNLARHAIqIPKDnOpWuAqnBg8AeFzCLJSo++hsMJ0BVrWnQIkEflybpO
         Z01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744900230; x=1745505030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YfCtmVGoFSkKpjhL5I0rf5Nt3BlAznqyCmYY6G7xfjg=;
        b=fCsW8uTFqOVFXtAMPaVCXYZCNpOtXn9pALDR5tCKIK9K294nPV3qXCOue0AKnh1BaA
         P+ui7GwH17kiYqXCxbK69QKAWBrgK9Yyf8U012HyCt0tm63FFQgN6nDPXUhcg+Q+iJYM
         auiGQW4T68V7ubf0M4lSbMzxzK772mZ11NMnejVVt5NqVoALNLLTBY3lsFOQWctoqLWN
         F0ODhihB9csbw/8IomaM6/CDq11cXbQ3/49NDXVEbi7t3++DEzv6Dvet4W8VIZnARKyf
         sza4n+utG4i/2zhs2geIJQZ/GeHYelCgy/oTDhJc1Fz+g+4tT1TlL1PB/M9g+Rxse1ee
         3z3g==
X-Forwarded-Encrypted: i=1; AJvYcCVSTzpODLi+H0hCHAUkm4i5MtD6mDTBK99wBxojbawIX5HzZHDpUNqKinCMtfPEJ1Y7cU2xt+yaQVRs0tc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg5Aw3325A7K93raEsJukGf4YNHtKf8gU5Cz4CN0XTx9U9T9ea
	Ji1lX2cVCw9V4YDgQSorON+UFE9ba3FrfhjyQwyodZjSakIIIab3ygpA5gFZjrGqI3i0swu+v4N
	lVI3b5ul/ZHPNuwTk3ElIHh0xX7X/23+ivQc=
X-Gm-Gg: ASbGnctAXcV/Ykrhmo4pF8LMmta7JSA52nIajhHczoky8IPKuab1vOLZ2tRofuKCVXc
	ue2ae1r4odQv7fuNs2UCQ9wUSdlnBcmp37lARONQQNxVDuxmoQyZIzDJQChuvZ2Qm2b9KTVaA3T
	8YK4yIZNwZw4FE2BAbmRwEXA==
X-Google-Smtp-Source: AGHT+IFZxqd6dHZ0yHZmXrWMeY0rwSMIk+68ltLSOlPISm2OgLSk5QDRQZVgLHh6syHr4hIv6K8BM9jF09iabjeO2LQ=
X-Received: by 2002:a05:6402:13c8:b0:5f3:f04b:5663 with SMTP id
 4fb4d7f45d1cf-5f4b75c4f09mr5402272a12.24.1744900230191; Thu, 17 Apr 2025
 07:30:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417124908.58543-1-ioworker0@gmail.com> <a825b3c3-55f7-4d90-a318-e20acf55e0cd@redhat.com>
 <CAK1f24mkswwY71EKourpw1y-KiFi08OkGzZSBkutoj+UCgbLMg@mail.gmail.com> <cc0d709a-3d9d-4802-b9ff-898cf7e5012f@redhat.com>
In-Reply-To: <cc0d709a-3d9d-4802-b9ff-898cf7e5012f@redhat.com>
From: Lance Yang <ioworker0@gmail.com>
Date: Thu, 17 Apr 2025 22:29:53 +0800
X-Gm-Features: ATxdqUFYz3uVZQ_i9Zh-WSIN1oYikhls0KPlV16HT-oXK5AZCnELPn8l460NKd4
Message-ID: <CAK1f24mYjKK0_cM0RA=FdKTro9CBwoPTWwkSYRzysUOMyHYmsA@mail.gmail.com>
Subject: Re: [PATCH 1/1] mm/rmap: add CONFIG_MM_ID guard for folio_test_large_maybe_mapped_shared()
To: David Hildenbrand <david@redhat.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Mingzhe Yang <mingzhe.yang@ly.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 9:26=E2=80=AFPM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 17.04.25 15:24, Lance Yang wrote:
> > Hi David,
> >
> > Thanks for taking the time to review!
> >
> > On Thu, Apr 17, 2025 at 8:56=E2=80=AFPM David Hildenbrand <david@redhat=
.com> wrote:
> >>
> >> On 17.04.25 14:49, Lance Yang wrote:
> >>> Add a compile-time check to make sure folio_test_large_maybe_mapped_s=
hared()
> >>> is only used with CONFIG_MM_ID enabled, as it directly accesses the _=
mm_ids
> >>> field that only works under CONFIG_MM_ID.
> >>>
> >>> Suggested-by: David Hildenbrand <david@redhat.com>
> >>> Signed-off-by: Mingzhe Yang <mingzhe.yang@ly.com>
> >>
> >> ^ should that be here?
> >
> > Yep, that's my email too ;p
>
> Best to stick to only one here -- same individual :)

Got it. I'll keep that in mind next time ;)

Thanks,
Lance

>
> --
> Cheers,
>
> David / dhildenb
>
