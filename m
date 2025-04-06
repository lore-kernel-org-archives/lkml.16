Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0C48528E
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 16:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743958227; cv=none; b=nona4TV5+S+edif1Kdp6p/55XH/DRp6ibR6AiV7CZmckwkw3/ZO2k3yl0qceihPb+wHTqhWcI5cKRMSxBYmLXqtG0UHBaXzEAjJANt0UVUwcuV7BBvs4v8bwLWlpet6HN50/FuSZbZLENPN1XaYBO6fG2O3dNFIgVYXp2nv30JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743958227; c=relaxed/simple;
	bh=O/ObsG6NTir58TKc4fMJ3s6XxYR9YL+LTg1B159OMR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gZM4uLBJKHxeewurPlyKl/IT14uiADATxLH+eyHLakWjGL28afYUS0SHS30QMVRElMo4s5iFa+Ahh/R+JZTwwH5NOIDVdzvD0zRW4oV7XRwImmeO/pBHD4qBi7GrpxxOGZtV/km1B0rppKzv69eqlT7cNyYxJqHMKmXgEvS3I7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=HcZ0MX4S; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="HcZ0MX4S"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso6559391a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 09:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743958223; x=1744563023; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ofvTYq6OVdukl6A+l5RpRSvyxUTCeuH/7ysugrt6vyk=;
        b=HcZ0MX4Scv0Z9+g5C48hSmQ7dlPEKG6GxOHEoE8ana4Vva86OW0BepVgSDSSsdi6dS
         IlrCxbVcGaAgzvAaRAXX52lWC3SuoPJ3q64LsN2rTCNn8y8+8BMbUJ0+PS8smcMNlSey
         NNiXp1C+eZAkPJ2nFiSIuLHvQ6qQHTqjdVnZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743958223; x=1744563023;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ofvTYq6OVdukl6A+l5RpRSvyxUTCeuH/7ysugrt6vyk=;
        b=hd5Iqv98qxMMaiXsBnCyJ8CYCGWUm216UqS30xRzzKyiH7igk8GJ3bZi6gbZWMRoKH
         pBdodpFA1tavxYIVxUbJQfrT7WSvhIl2XdPueUTrOGd48Kc9ZssSWk+Zma995SblPW5b
         av8ve4ubNW+IKooHHVnkWUhqOs4hkDRJMbFSGrJOpaaZW2wwgY6yOa52eknpWivYc3md
         DGzgNlORM8yySWfbwMLi/O1wWuM0DbgLib9iSbex/UuYwEN7kDyxrZE0rpsZtO8F/LVk
         VLahoOif39ZNa+u428Pyidx73ZqEz5+f3+u+5COpRAzqKTuQ9Sx4IbLkMvqkmMI8YKWT
         d28Q==
X-Forwarded-Encrypted: i=1; AJvYcCWSbs+mLTipkI/1oD6z02XqC5Yq8tSd7N9EjWz9WEOq9UFnes8IsALaeIKSZv+ayPQ/Ra5/pcPBssG5T6k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7NzGzFGJKcFm6pYeqEveZtaivx990IlcmoV2CmZAEN2TOfimO
	c2AGOSCYEVIKeaI5U8ErdhquF3wj8ZkuUHeL4wjTtCJSlgIq42f6XN4yScpcCh1NkPUCOs02WQc
	Pjlk=
X-Gm-Gg: ASbGncsUC6g0TJEaAdvek8yFW0kVcJPMlOvNVbGsSynNENmW8kmuBu4OXuOCQNhGXjr
	CNUGR0IpYlgj1Hu/imE3jbDAO03In/o2jyRaLvRiByD44qFZPfp1wCHSVi4dJRTqMxaekS1c7xH
	aFwp111P6ayNZs/gLNjnMm/Adc/SKJ/0emafKzBqZy1gsZf/LZejlrrCh2qbSn2KWN39LiRD2iT
	gBkiB5ohkeFc89cW5pOQ/eVZpupGz8r1joJimjl4OhQY3lhW/qj8VX2NqwMFdLGBIcxR19rZUDv
	RVXg+8A/ngkhG407dsgVs5axixz4glszMVWvHrQaPSGlMLdK2PiCOT+ixpLzQmxFmaPFRcR4DJu
	smRlpH+C/UMdZgZ13SGQ=
X-Google-Smtp-Source: AGHT+IF93Y0499elx6gM+wOZuyGrc4VR3+GCM2Zk6YCV6e8SrBiizc3hcWsnFXzowNwyba/o4iyHoQ==
X-Received: by 2002:a05:6402:35d1:b0:5ec:da2e:6e30 with SMTP id 4fb4d7f45d1cf-5f0b5d8ac6cmr6733942a12.4.1743958223308;
        Sun, 06 Apr 2025 09:50:23 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087f09effsm5433823a12.35.2025.04.06.09.50.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 09:50:22 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac34257295dso731105366b.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 09:50:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXbvlok/PWBFp8mLY43GLi0hMXnXUF/au01/QRpJKnlcZOgB5TmryVTZXMqRqEfkAfChbQaWHMNSEIg3+Y=@vger.kernel.org
X-Received: by 2002:a17:907:7ea1:b0:ac7:b363:862c with SMTP id
 a640c23a62f3a-ac7d6d7f0a5mr843077966b.34.1743958222006; Sun, 06 Apr 2025
 09:50:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNATT_+Z6x0kBy9fkTTucM5NTv0XiG9TYKNDOwL2M9y3WhA@mail.gmail.com>
 <01070196099fd059-e8463438-7b1b-4ec8-816d-173874be9966-000000@eu-central-1.amazonses.com>
In-Reply-To: <01070196099fd059-e8463438-7b1b-4ec8-816d-173874be9966-000000@eu-central-1.amazonses.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 6 Apr 2025 09:50:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh-k04MsoEC0SGKff2Snm6bBF_e+0pHOKwaWv4umZ_SnQ@mail.gmail.com>
X-Gm-Features: ATxdqUGbf7IOrFQnAOhosXAPF4OA1DEnI6vLKh28dp-C3AEUyfL3-SlU4pa-MHg
Message-ID: <CAHk-=wh-k04MsoEC0SGKff2Snm6bBF_e+0pHOKwaWv4umZ_SnQ@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for v6.15-rc1
To: Damian Tometzki <damian@riscv-rocks.de>, Masahiro Yamada <masahiroy@kernel.org>, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Vlastimil Babka <vbabka@suse.cz>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 5 Apr 2025 at 22:43, Damian Tometzki <damian@riscv-rocks.de> wrote:
>
> i got the following error after this pull request.
>
>  MODPOST Module.symvers
> ERROR: modpost: missing MODULE_DESCRIPTION() in lib/tests/slub_kunit.o
> make[3]: *** [/home/damian/kernel/linux/scripts/Makefile.modpost:147: Module.symvers] Error 1
> make[2]: *** [/home/damian/kernel/linux/Makefile:1956: modpost] Error 2
> make[1]: *** [/home/damian/kernel/linux/Makefile:248: __sub-make] Error 2
> make[1]: Leaving directory '/home/damian/kernel/build'
> make: *** [Makefile:248: __sub-make] Error 2

Bah. And the reason it doesn't show up in my normal build tests is
that my 'allmodconfig' tests end up picking up SLUB_TINY - which
disables a lot of slub cases, including this test.

And my normal non-allmodconfig tests don't enable SLUB_KUNIT_TEST.

That said, I'm not sure if making it a hard error was a good idea in
the first place. It *used* to be just a warning, and it used to be
enabled only with 'extra_warn'.

So switching it on to always warn was probably a good idea, but then
also making it a hard error may have been a bit excessive.

In related news - I also wonder whether SLUB_TINY should just be
turned off for COMPILE_TEST. It's not a very interesting config option
to test for, and it disables much more code than it enables [*].

Testing this without SLUB_TINY, I see that it *also* triggers this one:

    ERROR: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o

so the claim in commit 6c6c1fc09de3 ("modpost: require a
MODULE_DESCRIPTION()") that "all known instances of this issue have
been fixed" is clearly wrong.

For all we know, there are lots of other cases like this that just
never got tested with W=1 at all.

I think I'll downgrade the error() to a warn() again, and make
SLUB_TINY depend on !COMPILE_TEST.

And I'm not even convinced we should require module descriptions for
silly test modules, but whatever.

We'll see if something else pops up, but making the lack of a module
description a fatal error was clearly not right as-is.

              Linus

[*] In fact, I'm not convinced SLUB_TINYT ever makes sense at all, but
that may be too unrelated to this to worry about.
