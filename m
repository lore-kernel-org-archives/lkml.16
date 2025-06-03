Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF6A4B5AE
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 14:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748962173; cv=none; b=Q8OLuNgOfXYGdHlQ5S7dAqE4gKQmDXOPo7oDZbFj2sakexuuL5OhBbVc851DpDV5lJUkFTKpKqwrUgrYqHOb0K9Lw15LtOOtRU9cNt8IDPsdmoBxqRYHBT108LVpc6k0ki4A+VFaMySXBM9UOQuRfI13C4mW8aPcW2iCkPkfDPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748962173; c=relaxed/simple;
	bh=Ex3LHxHEHJ4BZQ38M7qwegLl2zSlvRBxwaOVQhyHde4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AVWxE7NVdVOaCH5iAoT40RVOM0xOXgPQ7oAyjnpNkcZ5QsZ+KQIfhQuLieFifUF7scEZxu4jo9h58S10kDQFN+nFyIJjIin9G+kw6lZ/ejLHIUulAw7IMRhypYg7WHEBVyZTeNrD1PxOlWxlfBQ3vU5jCTz0j08MARy2CXtLkTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YjkSn1dZ; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YjkSn1dZ"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso7318735e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 07:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1748962170; x=1749566970; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ex3LHxHEHJ4BZQ38M7qwegLl2zSlvRBxwaOVQhyHde4=;
        b=YjkSn1dZmHZhA/6TYufayxKqC70zA6znDbflQDTnjnBrsWaxljYkBbPCxK81coZf0h
         CUjA8ptdll9T29L8j2aQJd3HiSeL99XHEjTdmpU9UGxccQor9H9lmue6AQfr0htn/kB3
         wzvWy4MRrBLjVJ0kRP0Wd/HHLLPULCRE3O05gOTYmCU9y5A1sG/GZSTWAoXHx9+8SozE
         i5yGn6m8tiyenOGWzVSXuyqkkuoEKQBenmQrtjLgMyQgX0NpUuRajuV39NtmZj1UV7Gg
         O1vM+Jr5TZ769wW0eneZOzAoMxliOfVvEzkEhaLfUyc7/ZdYeoTzb/kFqlnPWqBUPpfZ
         mxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748962170; x=1749566970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ex3LHxHEHJ4BZQ38M7qwegLl2zSlvRBxwaOVQhyHde4=;
        b=mvmQBn0iDgz4FUTsqP1QePzmGIhEheAl7c07gShxZH6I9QwbAMHgNLDBUpPtojj1YF
         Jqbvrl4ByZMpJtIBIgjkPhU7IlYbXTtvr1Lzspnobr964XyBl4Sc9lzHl7RAwmH8USxG
         FDsvFHBJjRRF3eR8oZZ4Rl+c4R/Ei54HJjpKa9lNQm2jbcsJOOU+DSVTDXIXgYrG1ky8
         7PJKyCwoSb3HVHRAmVUbMiPtXpdpSi9m/2BJCSB6yZX9ZkAyoBy6i62sCpK4ZaNtqxp4
         FTjqqGtlsdbw+OPBSDjPGbJH3pXaSoDgJF2AbMiTlzwiDXE3MyiHO70VawB9oH5zhdhT
         Muuw==
X-Forwarded-Encrypted: i=1; AJvYcCV+C2XvSAecEIs7mmlJbm0Ll8iA2d9p7vWLXEJjbx2+S2+h/ghv5y3B060+GdouzSR7FP/p7xTkpo8krI0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS4Y0q8FK4yuJscUApXPb6lAbpwtrAAe0+AEuw+ruK7FZcAb0Z
	EbpWscTFiber0hIDktFw5+xzydJ5S3VlkFJSi97TlV9Z2SONgFuHVIVvCugRo8+0xDUhKJ83bu8
	3DtwCAqlqSNt78wmXZTK4P4V1EdJR176/OPsRtmlLCQ==
X-Gm-Gg: ASbGncsW7MCpUI0pVn2GJ+74C7RmBWznLV7pR4W74iTH5LyjRZlnmxlQ7Lrndc+g+Pw
	lWs9wH+A/yq0wo6HqCXlXSW00/5caV/hu8CxP6J4lRxc/G7Hqs2lJqhPn5N8UeMMHQYbCv4MrFI
	7Yt4J6jGGfhaoGvtfMHcmrrXymS6cW875vLYRzH2tOJ5N4EC9irv/EMnOLMEzTBWRynIk43hyHu
	w==
X-Google-Smtp-Source: AGHT+IHc0KihO6QMjKjy0pMBkN2tQA80vRJ1vg3x2S+UcGNd55YVBv2aTqZA0Vmu7gFOqc5cx2vs3hmS2lLX+V2bUMY=
X-Received: by 2002:a05:6512:318d:b0:553:23c4:6822 with SMTP id
 2adb3069b0e04-5533b8f6183mr5171073e87.13.1748962170032; Tue, 03 Jun 2025
 07:49:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250529222403eucas1p1923fe09240be34e3bbadf16822574d75@eucas1p1.samsung.com>
 <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <20250530-apr_14_for_sending-v3-1-83d5744d997c@samsung.com>
 <CAMRc=Me9cWfe2mL=Q6JQbAFjpd55MOBZuAWC793Us0criiQr4Q@mail.gmail.com>
 <4519844e-b1c0-40a7-b856-a6e4a80c6334@samsung.com> <20250603-cuddly-certain-mussel-4fbe96@kuoka>
 <CAMRc=MfXashaEscE1vF_P6cs9iOCBerfNFiB4yC+TX76fZ87nA@mail.gmail.com>
In-Reply-To: <CAMRc=MfXashaEscE1vF_P6cs9iOCBerfNFiB4yC+TX76fZ87nA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 3 Jun 2025 16:49:18 +0200
X-Gm-Features: AX0GCFs2qeMG4HtPzgixdlaSw6fJIrCjF4lFG8AFOQDBjIfm0hhKZz_Zk6uhWO0
Message-ID: <CAMRc=Mc-jjULmc=3fS0qZgXbq9Sgfg8JBoH7peWML1PdyyyH+A@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: power: Add T-HEAD TH1520 GPU power sequencer
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
	Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 3:35=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
> > >
> > > The compatible string could be updated like so:
> > > "thead,th1520-aon-pwrseq"
> >
> > Should not be separate node, you already have one for AON.
> >
>
> Agreed. And as far as implementation goes, you can have the same
> driver be a PM domain AND pwrseq provider. It just has to bind to the
> device node that represents an actual component, not a made-up
> "convenience" node.
>

I'm seeing that there's already a main driver under
drivers/pmdomain/thead/th1520-pm-domains.c and a "logical sub-driver"
under drivers/firmware/thead,th1520-aon.c which exposes
th1520_aon_init() called by the former. Maybe just follow that
pattern, add a module under drivers/power/sequencing/ called
pwrseq-th1520-pwrseq.c and call its init function from the pm-domains
module?

Bart
