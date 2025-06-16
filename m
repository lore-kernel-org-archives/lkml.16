Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43012270EBD
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750065768; cv=none; b=MkDgtNPI9s2LoAf6Y8Z9AiaZx68SzihdLKCcewOoQYVRukSfhMN6OzNRn5s2GcljriY+jm07v9nJxJqf7iErlMw8XLunkM2afBKOtVCrRd8vxXNPvwVsxQC7zqiTWmAKNdV+ZYMCEkdudQ5hptGLF/l9c5G/vDcre0rf5ffkEp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750065768; c=relaxed/simple;
	bh=boaYqs6W2Ch9MV7MIDV7tFHWVXlXvSTuE+SZQidgsAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BzgIk12FWTpHYKNzksIRhpIifNdxBTrFHvENEfd/4EMimVbdoBym7OoCWu8KQKd6KoKpp/hpY7TG9INiVr1fxatWbd8YJUOHkPos7Trg9L0bvS3ugME2DvtrvdB0scDrYV65Po03izKR4Kkm+fmaIs2g3Kx6H+LrYHXKX9SoGx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=i6fPRhjn; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="i6fPRhjn"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso1126807e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 02:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750065764; x=1750670564; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4clW0hfNM59uFuEpnawSRjVBJDyxSvonnhwsOilymQ=;
        b=i6fPRhjnQZjdK8HXqHfTZaEscbWr/UIPbqEg7J++f3Hq1vFi70kq0wIxLaECCi8xXp
         itBZMq26Hs4HGhrOOJvdVaT/CQPAS07WrfQeD6LAYLF/qU0WSoaujeeYFW0j2tUCXcSt
         4pMptEtGAzaHx0T7CVq7Iv552TK7/d04NcR/1YfUSqCJwnsSP/rtW7NftW5ROs/p8yFO
         LTMgI+j+2FJf39hQpYgpR6GFIvw158JH20qFvMg0l93hgXNf+ZXU1BEvoitePGvkcdhJ
         AsBzBYPQPLNr0OVbPeOHiS0+dIoW78P1Ot20qFvhG9tRGQ4eifcxQgcevJyXeH45C4pv
         xidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750065764; x=1750670564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4clW0hfNM59uFuEpnawSRjVBJDyxSvonnhwsOilymQ=;
        b=je3t4eThMaDxhi5fJGyYd7Q3zu5dyxr3cqfUFR6rZHCmH2a2YzVhuXIPnEFBecer+f
         EBDOUMZW3TcVKnU9ZX6kOUjHxw0UIKTnHQ2qzTC92rvH55Qph/tnoJxI6FTnSVvAEVps
         4GPS/FoGSb75+4Qn3LKQS1FUZyfSchYS6/IjCGvSFbPahJrHYJZNKmYgoSYRxd4R9ARJ
         ais2mzWia9dA9yWzJjBKle5PiOWjULiEGuKyWToZwk9oqKjzNmpK8Oh7DSoRnBbG7dmn
         OZMtgdv3v1tiRHpHFwaqLRpAMzcVSVeLxxR/MQbmsevJBquP0PdIA6Pg0eDra6bCt9nV
         yFTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqWyTFHSnjqacAaTfpNA8FfTAEPP4yg7lEfbSBwQnFWE1Nb3RDLFQKe8Kkbkgx/MlNcZrLV3wbJbnrwfM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8TEqA0/eR3+JAzUT+Tk3z9PhBUjHSOomyxkQjeZfLHbqnAD2Y
	lKzaOpQB7oJCH2pcwvoKWME6ACG2HLCloOWCKzwHtsIdmLTlGI5Boa/6thmqDUn6lC6aq6acVoh
	clcmKOxj35KwD4Jl0My5UMc7d2/nMIEMI+uW6Vh4oqA==
X-Gm-Gg: ASbGnct+VX86FbWk+A6gztIbIQAnJin7bPduyg2bWwoJuJYFOma6+URFXpcYqE17Bju
	+2y9F57adzFbeJi06VYmQe40prgR6opvvn+2379Ipfoe39bBr82wc0WlodrbHewAwz+KzES7gHj
	u1v4+yc/ire7WiD45CdXhy8EW+tOc8YHdYCbh0cXBLHEBqKjDoZ1qKa7R8dieMbqyDoa/ZkgwaM
	VU=
X-Google-Smtp-Source: AGHT+IEsBvyH0Zky97WuBrKbbjvEScgzySvzxn3rYYtDfdyw86suCq566xBi9HBUjAShIE2Mm9O+XZUWm2PEcQ1RjmQ=
X-Received: by 2002:a05:6512:12ca:b0:553:2ed2:15b4 with SMTP id
 2adb3069b0e04-553b6f4d916mr2068254e87.57.1750065764330; Mon, 16 Jun 2025
 02:22:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250614-apr_14_for_sending-v4-8-8e3945c819cd@samsung.com>
 <CGME20250615105256eucas1p21dba29a1450757d9201b2a9c7f0e34e8@eucas1p2.samsung.com>
 <202506151839.IKkZs0Z0-lkp@intel.com> <9765c970-55cc-4413-9fd0-5e0cdfa900fa@samsung.com>
In-Reply-To: <9765c970-55cc-4413-9fd0-5e0cdfa900fa@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 11:22:32 +0200
X-Gm-Features: AX0GCFvGdfEg2CPyKVWjNTkacG-9vOyaV6LbrgzY6YJIQBzVINyrlmiwiBnsQKI
Message-ID: <CAMRc=MeG40TxMj3ezeC0iUBBo8w99RXQWOQBsfG4ZAJdbA+dYg@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] drm/imagination: Enable PowerVR driver for RISC-V
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: kernel test robot <lkp@intel.com>, Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran <fazilyildiran@gmail.com>, oe-kbuild-all@lists.linux.dev, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 11:09=E2=80=AFAM Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
>
>
> On 6/15/25 12:51, kernel test robot wrote:
> > Hi Michal,
> >
> > kernel test robot noticed the following build warnings:
> >
> > [auto build test WARNING on 4774cfe3543abb8ee98089f535e28ebfd45b975a]
> >
> > url:    https://protect2.fireeye.com/v1/url?k=3D6c3bc994-0cd954c9-6c3a4=
2db-000babd9f1ba-30c2378fa012fc4a&q=3D1&e=3Dc39c960c-4d5f-44d7-aed7-0097394=
dfc81&u=3Dhttps%3A%2F%2Fgithub.com%2Fintel-lab-lkp%2Flinux%2Fcommits%2FMich=
al-Wilczynski%2Fpower-sequencing-Add-T-HEAD-TH1520-GPU-power-sequencer-driv=
er%2F20250615-021142
> > base:   4774cfe3543abb8ee98089f535e28ebfd45b975a
> > patch link:    https://lore.kernel.org/r/20250614-apr_14_for_sending-v4=
-8-8e3945c819cd%40samsung.com
> > patch subject: [PATCH v4 8/8] drm/imagination: Enable PowerVR driver fo=
r RISC-V
> > config: riscv-kismet-CONFIG_DRM_GEM_SHMEM_HELPER-CONFIG_DRM_POWERVR-0-0=
 (https://download.01.org/0day-ci/archive/20250615/202506151839.IKkZs0Z0-lk=
p@intel.com/config)
> > reproduce: (https://download.01.org/0day-ci/archive/20250615/2025061518=
39.IKkZs0Z0-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202506151839.IKkZs0Z0-l=
kp@intel.com/
> >
> > kismet warnings: (new ones prefixed by >>)
> >>> kismet: WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM=
_HELPER when selected by DRM_POWERVR
> >    WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
> >      Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dy] && MMU [=3Dn]
>
> I believe this is triggered because RISC-V can be compiled without MMU
> support, while MMU support is mandatory for ARM64.
>
> Would an acceptable fix be to require an explicit dependency on the MMU,
> like so?
>
> depends on (ARM64 || RISCV) && MMU
>

I'd put them on separate lines. While at it: how about enabling build
with COMPILE_TEST to extend build coverage too?

Bart

> >      Selected by [y]:
> >      - DRM_POWERVR [=3Dy] && HAS_IOMEM [=3Dy] && (ARM64 || RISCV [=3Dy]=
) && DRM [=3Dy] && PM [=3Dy]
> >
>
> Best regards,
> --
> Michal Wilczynski <m.wilczynski@samsung.com>
