Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A7118A6A5
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 14:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744209095; cv=none; b=EaoQ9DrMKRujn6jXzbptQX2oYtiYT3ZhEaeznHd1jaj+4TyEjiz844N9hxyO3rGCPdyp+/VW5Gkb/On6zEOo7t3KtjUHNcQ47inN2wlibu8tWSFcXMIVh12IxExHBF8uxdcZe2PWc9bOQw1tpcljdoP4n+S9etMa42fBHeJMAf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744209095; c=relaxed/simple;
	bh=OkMWtlaCHFz94VPXhhboq3VaT9gsh5ncKm1X+sD+RRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ia9YFgzmlbIk2ma9NOG1KMLpXPwQn7ov/VZOatZQqG9CLyxleOnWYd6an4nXOs0/JlBOFKb/1aKsDQ3tQBoAMCzR8F3BLXGMy8MgtusRbTr41BNnE0QuyWDCgfISC6tH/rwEXC+9GRVN4+WUyOM2PJtreZmiG/43IWDMfMPMdnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mxf1o8OA; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mxf1o8OA"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6feab7c5f96so66882357b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 07:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744209092; x=1744813892; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oFEL98j0Nv64o0yCV8CrzqGFLc958Qmn2qWiAuOU8rY=;
        b=Mxf1o8OAYwFVRs7PTuEaqjrzKWee3xELh9AbT9axDAG4t1Ee2zHEmtS6NjkJSdsBDm
         p7ARO2kNnT+R8pDWuq8LGq6lbY2RhAdilnEkx/jY5uPa/ehOExbRiFvcaolDnvIBuy7x
         CuZqDpOCLj5vSxUcrMvg3jnXrFueqsGOvIOB1uGbhj6LBBfk8dl6xPaurWQJzGsJVCMH
         Qxjz2B5gsemAnIUSuUfsQ6IvCz7kTuty1/86i50ocJCwvkdItpJLRoVDaAyED+WyZ2sD
         FlEqlNaSRMJvZWtUOKlsctTN5uRC1KdFR+p+gTjv6CRrjvHA+fkAnxoo4oFhAl3nz6ii
         jaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744209092; x=1744813892;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFEL98j0Nv64o0yCV8CrzqGFLc958Qmn2qWiAuOU8rY=;
        b=f/9AVGcGwQkVuSLxwwxcURMmdYSSnz4KUGRRddN3WtOunohEBHKzDhuQBeCG/0AuPh
         1Q/DUt6kwMXD5fCMn4PtahvsV4bks759PBv1pceQv0Tu1bS3IJYVqYukot8kocgNtiSm
         fXCAuvybzGxbeevhHWWO9iJPfhJK0xes8hAt+PCeFgLZkJWxCVq2awvfaHcSu8B4eL8G
         77xGLcgKuxsvk4KsA+MQPqyi/FZYOP5uPHZLyCmQpk01p6F3SSYC8rRFA4dwsSzCOBIJ
         oxEdQmJfBmLwx5VaIqmS9hUK1CeHsv12LE/rdkTdIxXDiELu6UWnQwo9ydWRslKNZc7c
         hh7w==
X-Gm-Message-State: AOJu0Yy2/PAswMtsrxGRkX/2dH4t9lSJiwvaRIR2QbfTNtaPG4GmEBiI
	favtOuMMo4o5Sgtrtt7j5jVyQ4GCQMYqKLyY6KyWiD5780YqSghlQACzWkatvJNPKgLEF8U5Mxf
	rhmyQ5HMT7gOd7r11cXO8Q9b/ljASjR/HZScfdw==
X-Gm-Gg: ASbGncszZWJ7WSaOgFwqUFwoYtnEytT7drrpj+7wuOH5v3RTHvqVVhcW9WYAc5st2+c
	edZjb3xxPF++HopcT+e6+vhcsLFuq05oM227kbtmgj6xqiVgLNdNyWzsgQDJL5QRo0bP138+WwK
	GF0ECy4VrLRjfHFvZzUjl6WkGyxG+1RGFTbBpqlIXTAbTelYLPtsIghpY=
X-Google-Smtp-Source: AGHT+IF4v5ddVlhpl7XXkiqtBokzQ91W32mmENzyPvsi71Y4dYxLX5GlEjhKpMuyRO1Bkz53IVfT2sXx2EzFFMEWN8s=
X-Received: by 2002:a05:690c:9b07:b0:6fd:6589:7957 with SMTP id
 00721157ae682-7053ae8ca3bmr49692347b3.32.1744209092075; Wed, 09 Apr 2025
 07:31:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYtdXHVuirs3v6at3UoKNH5keuq0tpcvpz0tJFT4toLG4g@mail.gmail.com>
 <CA+G9fYuHhz2YCafabKK+QMJiDuM65OcxpaW9TN-=u56r_kyGSA@mail.gmail.com> <2025040216-directive-unmapped-5301@gregkh>
In-Reply-To: <2025040216-directive-unmapped-5301@gregkh>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 9 Apr 2025 20:01:20 +0530
X-Gm-Features: ATxdqUGsFIk4VNkjjSv0a16kAsaDqgjo9GWyB8SFwTjeyfnGkilfWAombhlDVSY
Message-ID: <CA+G9fYsefOWiHbnnbOjjG4kaX3o4hKOkOtDpVfzQNd+E9ycc8g@mail.gmail.com>
Subject: Re: qemu-i386 boot failed on mainline master - no console output
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: open list <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, 
	linux-mm <linux-mm@kvack.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Vinod Koul <vkoul@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Apr 2025 at 16:57, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Apr 02, 2025 at 02:24:53PM +0530, Naresh Kamboju wrote:
> > + Linus
> > + Greg KH
> >
> > On Wed, 2 Apr 2025 at 14:14, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > >
> > > Regressions on qemu-i386 devices boot tests failed with defconfig on
> > > the mainline master no console output.
> > >
> >
> > The qemu-i386 boot failed with no console output and is still happening on
> > the latest mainline master branch.
> >
> > > First seen on the char-misc-6.15-rc1 merge 25601e85441d ("Merge tag
> > > 'char-misc-6.15-rc1' of...)
> > >  Good: [08733088b566b58283f0f12fb73f5db6a9a9de30] Merge tag
> > > 'rust-fixes-6.15-merge'
> > >  Bad:  [91e5bfe317d8f8471fbaa3e70cf66cae1314a516] Merge tag 'dmaengine-6.15-rc1'
> > >
> > > * qemu-i386
> > >  - boot
> > >
> > > Regression Analysis:
> > >  - New regression? Yes
> > >  - Reproducibility? Yes
> > >
> > > Test regression: qemu-i386 boot failed on mainline master
> > > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > >
> > > Anders bisected this to,
> > >   # first bad commit:
> > >     [eb0ece16027f8223d5dc9aaf90124f70577bd22a]
> > >     Merge tag 'mm-stable-2025-03-30-16-52' of
> > > git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>
> But this is bisected to the mm merge, not the char-misc merge, right?
>
> And is this just on i386?  Nothing arch-specific in the char-misc merge
> that I can see, so I would place bets on mm doing something accidentally
> on 32bit systems.

The qemu-i386 boot pass with the latest mainline kernel with
clang-nightly and gcc-13.
 Linux version 6.15.0-rc1 (tuxmake@tuxmake) (Debian clang version
21.0.0 (++20250402105505+c57b9c233a87-1~exp1~20250402225526.1363),
Debian LLD 21.0.0) #1 SMP PREEMPT_DYNAMIC @1743981563


Links:
 - https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/naresh/tests/2vUkJBr5vV419fzcTFDkOmiIkax
 - https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/naresh/tests/2vUk3KcyEleDxVppDpZ1jeSIx0j

 - Naresh

>
> thanks,
>
> greg k-h
