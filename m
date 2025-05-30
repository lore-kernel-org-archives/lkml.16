Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10ED828312F
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 20:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748636771; cv=none; b=GlhqFG2jGZWrxlrTE3QOk2+0nDn3E7Do6pM7ILWZnGZCovzSlMZZZ9yt9yAjol3BY61BC+VZg0KMT6NAztWqsfVF74XUArw0U5nguf6//ZWpv1E9ySkZwxpfbSqLyGY7EYv6b6dJGEqGL8FlZkwHjYFXbZJC7X4CLh1UBsB8EcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748636771; c=relaxed/simple;
	bh=vn+2S0BPcPF9j6dxjX9RZOsCIr+BJ204l39ioxz+unk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pEAHoTN0VG/otAuuWJm8r6hH5FDymQkwj8KBRPrDcAD8Ya3hKQl4FXMl0mtpQIs+ROuj5cpssQk7c3Vu0AvenN99zVV/ca6MMmwgzxvHwUK84S+Bw3ViV/69zGqKtUIyYdF8xRaa4Ltu72ASiuRW8Ob+Gml6OThPYw7O2AzDQZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cSBNUgGA; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cSBNUgGA"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-30e85955bebso302917a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 13:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748636769; x=1749241569; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=flpFqUKLM2wJe1GS/z/DSdiWKrIaoRvufNvuehZ0Jt8=;
        b=cSBNUgGAcONhcBjmCoctgKmzj7SSLRlNkzO+qzblQxxb2r1KbLxvLXghM9ba7NSa/a
         4+MLVIF4VzXauDSDaol3IlnEcf7609+HtRGRydnNT5TyZpqfaMShzG+S1ENOGnt5iOiT
         LWHSZTSmPvxr0hUjAbYy2n42eY/Zj9ScrFPZj6yc0kku0ysjCH6Wkh7EMsE5FnA+h2Xi
         hoD9CxwdQSsmu7/Cml+3bAB3ge4EzS77+eYqSWprSKkRlkakQPVQO2wzh6+sN7xZitnQ
         PFXMmsBhKq/aWDgiCzyivTsT3omamsvOnstUAsp4wIC4JRHxJpCvLulFpvIV5K2LdFkI
         s5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748636769; x=1749241569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=flpFqUKLM2wJe1GS/z/DSdiWKrIaoRvufNvuehZ0Jt8=;
        b=sLqwheMiHTz2K83CpKmdtQH/1oidCDKvkspqj+1C5wyLMY6xXjrIw+5JmXoO4diihM
         eqFeryB+OPAGiUNJGKSUXTDvJqkuTG+MkOd3Gt936k+xZ2aT8TA0iUK2WDcvHBTpZUpe
         BbT18GMUPJDV6upmYTTcd8qjsK7uD+i6Fk+0Uy8gQo05HTDkKAsfFIzTLPqm8chh52nR
         /B81bdvhtbYdDE0gfXxWzO+kwK4VUeaN47nVtg6HCppoLdwksP0cuzxO9yKlSZcitC12
         PnftxxyHjK7QI4mucgFkXpqx9eabGoxQOJl+SXDjaV8nGeq8llZdNzwgk58IwRdTasCB
         tK9g==
X-Forwarded-Encrypted: i=1; AJvYcCVfFLD41xkD7rlU0iBqXmDNpixQy82QO7lHPtmPR1xhr4HC6zoZJuM/hBIL7KLBAk+8uB3kbS5RcenZD6c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqDv8eKjuEz9iadrPIvueFBnZXYclyS/66pCcCPBwi2Z3Zhwpb
	kOe4rXC+JMaTbAo9mzdC+DPP2XtQ5wbPYDBxICQ3LRUUxLdI9PPa0o1st5DzFVqx9/ceBX3KZ5E
	6qR/ghCYWJAzUSmFeomgZ4l3dG4ENUXY=
X-Gm-Gg: ASbGncu+oe7ZxotsJ0Bbm8ta5oee00o2px8xas7+gaAlSX2sLJwlFcUJp0bndMCJTf3
	NKa720pIwBO8O/Nj+Oz4pnAb0PCBQKFDmvZwVF04U/h1LcWYJfaVzBJTF0fyxSTQB7hcp/6XSdu
	k2vAIOEIwzgAtuGqq0CjDHvXEx54VCb0OX+w==
X-Google-Smtp-Source: AGHT+IEEqPFu27tVsd7CtGRfMimvE7u2d+i+Pguv/eM7ydzb+2Us3v27PrZ0A03GNiTjSfTVnWdUAAi2kFrQWEya3d4=
X-Received: by 2002:a17:90b:3146:b0:312:1e41:3a51 with SMTP id
 98e67ed59e1d1-3124d37bf8amr2073130a91.1.1748636769243; Fri, 30 May 2025
 13:26:09 -0700 (PDT)
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
 <CABH-8xd1Nr1PpsPJnoNsur1LEEhphX6+WzKE14rc-ub_N7eS7Q@mail.gmail.com> <01100196f7f553bc-1cd7e537-430c-4138-b447-c432eaf77f33-000000@eu-north-1.amazonses.com>
In-Reply-To: <01100196f7f553bc-1cd7e537-430c-4138-b447-c432eaf77f33-000000@eu-north-1.amazonses.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 30 May 2025 16:25:56 -0400
X-Gm-Features: AX0GCFvUnAZ0vEU5pkcJxa6-8TptnB2D8YLYla7QmAUozo4lsFTFp0cRX02Ox1g
Message-ID: <CADnq5_MbwMv1Hr6+N-SLK9WtGCyzsRquaPZa0JxreL5ssuoHMw@mail.gmail.com>
Subject: Re: Regression: RX 470 fails to boot with amdgpu.dpm=1 on kernel 6.7+
To: Ozgur Kara <ozgur@goosey.org>
Cc: =?UTF-8?Q?Durmu=C5=9F?= <dozaltay@gmail.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Tao Zhou <tao.zhou1@amd.com>, Yan Zhen <yanzhen@vivo.com>, 
	Greg KH <gregkh@linuxfoundation.org>, Alper Nebi Yasak <alpernebiyasak@gmail.com>, 
	linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 8:39=E2=80=AFAM Ozgur Kara <ozgur@goosey.org> wrote=
:
>
> Durmu=C5=9F <dozaltay@gmail.com>, 22 May 2025 Per, 15:15 tarihinde =C5=9F=
unu yazd=C4=B1:
> >
> > I'm using dual monitors. I disconnected the HDMI to test with a single
> > screen, but the result was the same. I also swapped the HDMI ports,
> > but the issue still persisted.
> > I'm not using DisplayPort =E2=80=94 in fact, it's a bit weird: I conver=
t VGA
> > to HDMI and connect it to the graphics card. I'm not an expert of
> > course, but since there were no issues on the LTS kernel and the
> > problems started with kernels after 6.7, it made me think it might be
> > a kernel issue.
> > If needed, I=E2=80=99ll set dpm=3D0 when I install (i don't know when) =
Linux
> > again and test it.
> > If I remember correctly, when I added amdgpu.dc=3D0 to GRUB, nothing
> > changed =E2=80=94 the system still froze after GRUB.
> >
>
> Hello,
>
> i suspect this is related to latest patch rather than a kernel bug so
> i will add Aurabindo because you may be affected after cfb2d41831ee
> commit.
> first of all, is there any chance you can revert this commit and test ker=
nel?
>
> $ git revert cfb2d41831ee

That patch has been reverted (it's included in my -fixes PR this
week), but we are in the middle of the merge window so it may take a
bit for the revert to land and make its way back to stable.

Alex

>
> So after commit, dmcub ring calls became much higher and some power
> states became unstable i dont know i'm not expert but  these usually
> have to do with things like dmcub firmware and  power gating (gfxoff)
> or post-reset ring buffer access.
> maybe this commit is that  vmin/vmax update call may now be made much
> more frequently and this may cause dmcub to not synchronize properly
> some power states to become unstable or firmware to crash.
>
> we might need to look at the contents of
> /sys/module/amdgpu/parameters/force_vmin_vmax_update but  vmin vmax
> potential call height might be giving an error.
>
> So I added Aurabindo Pillai, should have added you after 3 different
> bug reports.
>
> Regards
>
> Ozgur
>
>
> > On Thu, May 22, 2025 at 3:05=E2=80=AFPM Ozgur Kara <ozgur@goosey.org> w=
rote:
> > >
> > > Durmu=C5=9F <dozaltay@gmail.com>, 22 May 2025 Per, 14:58 tarihinde =
=C5=9Funu yazd=C4=B1:
> > > >
> > > > Hey, thanks for the reply, but I don't use Linux anymore, so I can'=
t
> > > > provide any logs or test it further. Also, FYI, this bug has been
> > > > around since kernel v6.7. If I install Linux again soon, I'll try t=
o
> > > > test it. Could you please advise what I should do about amdgpu.dpm?
> > > > Should it stay at 0 or be set to 1? When I try booting with 1, the =
PC
> > > > freezes right after the grub screen. I've used Linux for 2-3 months
> > > > but still don=E2=80=99t really know how to debug these kinds of err=
ors
> > > > properly. Thanks!
> > > >
> > >
> > > Hello,
> > >
> > > not problem maybe we should talk about this separately but kernel
> > > lists are progressing complicated with too many development patch
> > > content that is not very suitable for this.
> > > we can also see it as a problem with kernel, gpus or amd company and
> > > too many firmware and drivers.
> > >
> > > if it is hardware based especially gpu related, kernel doesnt
> > > intervene fully at this point.
> > > the system can be opened with amdgpu.dpm=3D0 but this is not correct =
and
> > > you did a very good job reporting it.
> > > maybe by adding amdgpu.dc=3D0 the display core is disabled but this
> > > prevents you from getting 144 mhz.
> > >
> > > we should make sure that there is the correct firmware under
> > > /lib/firmware/amdgpu.
> > > did you use DisplayPort and did you get 144 mhz output?
> > >
> > > $ journalctl -b -1 will give you some information.
> > > $ glxinfo | grep OpenGL can also give you the problem or error.
> > >
> > > So kernel developers and AMD developers should look into this issue
> > > but i think it is most likely a firmware blockage on the AMD side not
> > > a kernel side.
> > >
> > > Regards
> > >
> > > Ozgur
> > >
> > > > On Thu, May 22, 2025 at 2:52=E2=80=AFPM Ozgur Kara <ozgur@goosey.or=
g> wrote:
> > > > >
> > > > > Durmu=C5=9F <dozaltay@gmail.com>, 22 May 2025 Per, 14:27 tarihind=
e =C5=9Funu yazd=C4=B1:
> > > > > >
> > > > > > Hello,
> > > > > >
> > > > >
> > > > > Hello,
> > > > >
> > > > > did you get a message in dmesg from kernel, for example an error =
like this?
> > > > >
> > > > > https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1106268
> > > > >
> > > > > The dmesg command will give you an output maybe journalctl output=
 or
> > > > > mesa (glxinfo) output would also be sufficient because we need to=
 know
> > > > > which upstream it is affected by.
> > > > > and thanks for report.
> > > > >
> > > > > Note: because there are two similar errors i added the necessary
> > > > > maintainers for upstream.
> > > > >
> > > > > Regards
> > > > >
> > > > > Ozgur
> > > > >
> > > > > > I'm experiencing a critical issue on my system with an AMD RX 4=
70 GPU.
> > > > > > When booting with recent kernel versions (6.7.x or newer), the =
system
> > > > > > fails to boot properly unless I explicitly disable Dynamic Powe=
r
> > > > > > Management (DPM) via the `amdgpu.dpm=3D0` kernel parameter.
> > > > > >
> > > > > > When DPM is enabled (`amdgpu.dpm=3D1` or omitted, since it's th=
e
> > > > > > default), the system either freezes during early boot or fails =
to
> > > > > > initialize the display. However, using the LTS kernel (6.6.x),
> > > > > > everything works as expected with DPM enabled.
> > > > > >
> > > > > > This seems to be a regression introduced in kernel 6.7 or later=
, and
> > > > > > it specifically affects older GCN4 (Polaris) GPUs like the RX 4=
70.
> > > > > > Disabling DPM allows the system to boot, but significantly redu=
ces GPU
> > > > > > performance.
> > > > > >
> > > > > > Things I=E2=80=99ve tried:
> > > > > > - Confirmed that the latest `linux-firmware` is installed.
> > > > > > - Verified correct firmware files exist under `/lib/firmware/am=
dgpu/`.
> > > > > > - Tested multiple kernels (mainline and LTS).
> > > > > > - Using Mesa with ACO (Radeon open driver stack).
> > > > > > - System boots fine with LTS kernel (6.6.x) + DPM enabled.
> > > > > >
> > > > > > System info:
> > > > > > - GPU: AMD RX 470 (GCN 4 / Polaris)
> > > > > > - Distro: Arch Linux
> > > > > > - Kernel (working): linux-lts 6.6.x
> > > > > > - Kernel (broken): 6.7.x and newer (currently tested on 6.14.6)
> > > > > >
> > > > > > Thanks in advance,
> > > > > > Durmus Ozaltay
> > > > > >
> > > > > >
> > > > > >
> > > >
> > > >
> >
> >
