Received: from e240-11.smtp-out.eu-north-1.amazonses.com (e240-11.smtp-out.eu-north-1.amazonses.com [23.251.240.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33325221285
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.240.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747916776; cv=none; b=uTjsfZBwWgjUx7tIJqDZX37kxDh+ASByYD4IgfDWov8lbIgoV6fG33av+sVL4tsdCLckcB9HuRPE1HzJPE6dKFKqjPH6S6H7kAG+cpYR3uRzYjjKDLz0jfZwdIxbrmnrGJyJ//tb4QupCZoOSZTFHjIlXpoYjCxvGNH3COUQuoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747916776; c=relaxed/simple;
	bh=XTSbICosLaHaU9aRpnsLBowCzYh5rd17I756IGIFYiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GWJBZCLTO5klI6Od/mNuVIDJYGv5CA+IA+vtW5JpiiPNsE8tVMU1bxIXhayiklJPmzn/xggSo+lhY8VM87+purVASCr6CLpBun/+kXgCVID/uCP/27SMRElmNEsOCn29msp+iMMbpecYKwT1R4GEaP2oAIcHZLguPBXI+ivdSiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goosey.org; spf=pass smtp.mailfrom=eu-north-1.amazonses.com; dkim=pass (2048-bit key) header.d=goosey.org header.i=@goosey.org header.b=LL7W0Fjg; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=IOln51q9; arc=none smtp.client-ip=23.251.240.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goosey.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eu-north-1.amazonses.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goosey.org header.i=@goosey.org header.b="LL7W0Fjg";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="IOln51q9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=iuunfi4kzpbzwuqjzrd5q2mr652n55fx; d=goosey.org; t=1747916772;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XTSbICosLaHaU9aRpnsLBowCzYh5rd17I756IGIFYiE=;
	b=LL7W0FjglT7G/c9sx4tUwHLD/wWVS+yez4okbEARaMZly95E1DuND1T+C15dVt2+
	mzGmFxI53JpV/Ga3T0oJuMzoHz/xXHvMdwgK3NdLifYNjPbK4As20cREiQlDoPmPrvw
	MB/7mrVR6UFHDLWByhNx3hT9nfDeU/yV9KLZgG+dSLSfmzFyDF58DpQr1j30Hki0kDq
	thpXs9ZwqoOqNp4HwYMTVOa/tWkUe0HvMWf1Mr2oIuxCTDhp3HogTYGaXfcwxmNmQOi
	SGZztAaf6nNa7RXnjvotgnARA8Fx9goMSOO9Hpqb6IthcHOvzygDym9+c/tZEXb1ebz
	MUrjPiCHag==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=bw45wyq3hkghdoq32obql4uyexcghmc7; d=amazonses.com; t=1747916772;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=XTSbICosLaHaU9aRpnsLBowCzYh5rd17I756IGIFYiE=;
	b=IOln51q9t3A9++uV33TR3wPtQyuRONGYY1yyBog0H9bXO7TUbUnnEwEinsYhZaGV
	0Uaa76EUQJm4ICUd7TuELmNAIigPYHqjQ/TDPErWc9pl/N/1SEFysx4U8kvQyxIBmQX
	re5P585ksYvR3Hs947aGd18ZD7FeHW53PjMWhLmk=
X-Gm-Message-State: AOJu0YylrcPg+mslKIheDkdr1oY3OIwgv9Fnn4Ki6eECfS742ehmYsv0
	L9vIeVlUifFPwupAAwUdgH6Zys4jH8n9ga8HiOMjYrsjEkmjOk/eoAwIvz/e8/JWWSV54RTkQ8a
	N88IT5GhA4rZb15TjEKjzHDOJi4J6HXU=
X-Google-Smtp-Source: AGHT+IFnvCMK1Q+jo/7u8pQJvKjn2XW9lqSU5ELyGJ+Q2XTYVSnGqTYm8CaHXI61ZokxmvOk4GpNZP0+EL6XvWTWjQE=
X-Received: by 2002:a17:903:4b4b:b0:22d:c605:a30c with SMTP id
 d9443c01a7336-231d43d5532mr374201045ad.11.1747916769730; Thu, 22 May 2025
 05:26:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABH-8xdaDFjWyQ40Nyo59Gm5kD3Qi5hh76o-uam1yC3wNtJNqQ@mail.gmail.com>
 <01100196f7d63f35-a7b596e2-fbb8-49e5-8645-e67ca6a0048d-000000@eu-north-1.amazonses.com>
 <CABH-8xdDjLv9c+E7OdTFjtoEHT5Q2-oQGouOpygi_5c-W3cyvQ@mail.gmail.com>
 <01100196f7e25204-35c40c23-8070-4aaf-ae45-7ac2625cbf90-000000@eu-north-1.amazonses.com>
 <CABH-8xd1Nr1PpsPJnoNsur1LEEhphX6+WzKE14rc-ub_N7eS7Q@mail.gmail.com>
In-Reply-To: <CABH-8xd1Nr1PpsPJnoNsur1LEEhphX6+WzKE14rc-ub_N7eS7Q@mail.gmail.com>
From: Ozgur Kara <ozgur@goosey.org>
Date: Thu, 22 May 2025 12:26:12 +0000
X-Gmail-Original-Message-ID: <CADvZ6ErJ+2wFwWpEiORPe+YUFDm3cqMb_r1PVAM3=b75BRYOjg@mail.gmail.com>
X-Gm-Features: AX0GCFvCJYHUcwI3ftpqsdj2rmbV78za5rhEDeF6HqdDJPjBc_Zajx9EY_uS7UI
Message-ID: <01100196f7f5535c-36f0aa54-4ca2-48a4-8438-bdd3d73cb45d-000000@eu-north-1.amazonses.com>
Subject: Re: Regression: RX 470 fails to boot with amdgpu.dpm=1 on kernel 6.7+
To: =?UTF-8?Q?Durmu=C5=9F?= <dozaltay@gmail.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Tao Zhou <tao.zhou1@amd.com>, 
	Yan Zhen <yanzhen@vivo.com>, Greg KH <gregkh@linuxfoundation.org>, 
	Alper Nebi Yasak <alpernebiyasak@gmail.com>
Cc: linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Feedback-ID: ::1.eu-north-1.jZlAFvO9+f8tc21Z4t7ANdAU3Nw/ALd5VHiFFAqIVOg=:AmazonSES
X-SES-Outgoing: 2025.05.22-23.251.240.11

Durmu=C5=9F <dozaltay@gmail.com>, 22 May 2025 Per, 15:15 tarihinde =C5=9Fun=
u yazd=C4=B1:
>
> I'm using dual monitors. I disconnected the HDMI to test with a single
> screen, but the result was the same. I also swapped the HDMI ports,
> but the issue still persisted.
> I'm not using DisplayPort =E2=80=94 in fact, it's a bit weird: I convert =
VGA
> to HDMI and connect it to the graphics card. I'm not an expert of
> course, but since there were no issues on the LTS kernel and the
> problems started with kernels after 6.7, it made me think it might be
> a kernel issue.
> If needed, I=E2=80=99ll set dpm=3D0 when I install (i don't know when) Li=
nux
> again and test it.
> If I remember correctly, when I added amdgpu.dc=3D0 to GRUB, nothing
> changed =E2=80=94 the system still froze after GRUB.
>

Hello,

i suspect this is related to latest patch rather than a kernel bug so
i will add Aurabindo because you may be affected after cfb2d41831ee
commit.
first of all, is there any chance you can revert this commit and test kerne=
l?

$ git revert cfb2d41831ee

So after commit, dmcub ring calls became much higher and some power
states became unstable i dont know i'm not expert but  these usually
have to do with things like dmcub firmware and  power gating (gfxoff)
or post-reset ring buffer access.
maybe this commit is that  vmin/vmax update call may now be made much
more frequently and this may cause dmcub to not synchronize properly
some power states to become unstable or firmware to crash.

we might need to look at the contents of
/sys/module/amdgpu/parameters/force_vmin_vmax_update but  vmin vmax
potential call height might be giving an error.

So I added Aurabindo Pillai, should have added you after 3 different
bug reports.

Regards

Ozgur


> On Thu, May 22, 2025 at 3:05=E2=80=AFPM Ozgur Kara <ozgur@goosey.org> wro=
te:
> >
> > Durmu=C5=9F <dozaltay@gmail.com>, 22 May 2025 Per, 14:58 tarihinde =C5=
=9Funu yazd=C4=B1:
> > >
> > > Hey, thanks for the reply, but I don't use Linux anymore, so I can't
> > > provide any logs or test it further. Also, FYI, this bug has been
> > > around since kernel v6.7. If I install Linux again soon, I'll try to
> > > test it. Could you please advise what I should do about amdgpu.dpm?
> > > Should it stay at 0 or be set to 1? When I try booting with 1, the PC
> > > freezes right after the grub screen. I've used Linux for 2-3 months
> > > but still don=E2=80=99t really know how to debug these kinds of error=
s
> > > properly. Thanks!
> > >
> >
> > Hello,
> >
> > not problem maybe we should talk about this separately but kernel
> > lists are progressing complicated with too many development patch
> > content that is not very suitable for this.
> > we can also see it as a problem with kernel, gpus or amd company and
> > too many firmware and drivers.
> >
> > if it is hardware based especially gpu related, kernel doesnt
> > intervene fully at this point.
> > the system can be opened with amdgpu.dpm=3D0 but this is not correct an=
d
> > you did a very good job reporting it.
> > maybe by adding amdgpu.dc=3D0 the display core is disabled but this
> > prevents you from getting 144 mhz.
> >
> > we should make sure that there is the correct firmware under
> > /lib/firmware/amdgpu.
> > did you use DisplayPort and did you get 144 mhz output?
> >
> > $ journalctl -b -1 will give you some information.
> > $ glxinfo | grep OpenGL can also give you the problem or error.
> >
> > So kernel developers and AMD developers should look into this issue
> > but i think it is most likely a firmware blockage on the AMD side not
> > a kernel side.
> >
> > Regards
> >
> > Ozgur
> >
> > > On Thu, May 22, 2025 at 2:52=E2=80=AFPM Ozgur Kara <ozgur@goosey.org>=
 wrote:
> > > >
> > > > Durmu=C5=9F <dozaltay@gmail.com>, 22 May 2025 Per, 14:27 tarihinde =
=C5=9Funu yazd=C4=B1:
> > > > >
> > > > > Hello,
> > > > >
> > > >
> > > > Hello,
> > > >
> > > > did you get a message in dmesg from kernel, for example an error li=
ke this?
> > > >
> > > > https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1106268
> > > >
> > > > The dmesg command will give you an output maybe journalctl output o=
r
> > > > mesa (glxinfo) output would also be sufficient because we need to k=
now
> > > > which upstream it is affected by.
> > > > and thanks for report.
> > > >
> > > > Note: because there are two similar errors i added the necessary
> > > > maintainers for upstream.
> > > >
> > > > Regards
> > > >
> > > > Ozgur
> > > >
> > > > > I'm experiencing a critical issue on my system with an AMD RX 470=
 GPU.
> > > > > When booting with recent kernel versions (6.7.x or newer), the sy=
stem
> > > > > fails to boot properly unless I explicitly disable Dynamic Power
> > > > > Management (DPM) via the `amdgpu.dpm=3D0` kernel parameter.
> > > > >
> > > > > When DPM is enabled (`amdgpu.dpm=3D1` or omitted, since it's the
> > > > > default), the system either freezes during early boot or fails to
> > > > > initialize the display. However, using the LTS kernel (6.6.x),
> > > > > everything works as expected with DPM enabled.
> > > > >
> > > > > This seems to be a regression introduced in kernel 6.7 or later, =
and
> > > > > it specifically affects older GCN4 (Polaris) GPUs like the RX 470=
.
> > > > > Disabling DPM allows the system to boot, but significantly reduce=
s GPU
> > > > > performance.
> > > > >
> > > > > Things I=E2=80=99ve tried:
> > > > > - Confirmed that the latest `linux-firmware` is installed.
> > > > > - Verified correct firmware files exist under `/lib/firmware/amdg=
pu/`.
> > > > > - Tested multiple kernels (mainline and LTS).
> > > > > - Using Mesa with ACO (Radeon open driver stack).
> > > > > - System boots fine with LTS kernel (6.6.x) + DPM enabled.
> > > > >
> > > > > System info:
> > > > > - GPU: AMD RX 470 (GCN 4 / Polaris)
> > > > > - Distro: Arch Linux
> > > > > - Kernel (working): linux-lts 6.6.x
> > > > > - Kernel (broken): 6.7.x and newer (currently tested on 6.14.6)
> > > > >
> > > > > Thanks in advance,
> > > > > Durmus Ozaltay
> > > > >
> > > > >
> > > > >
> > >
> > >
>
>
