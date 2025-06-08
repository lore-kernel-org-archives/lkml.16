Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029511553A3
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 16:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749400383; cv=none; b=OPUEa+TjoVvRa5i+kH2iPpJCCtxE/u7M7nTovyhqGtWF7LasfFucM2E385w0sun4C73GE3tDzb4UY0Fv9WhFxLJkW0SzHXX7bSGE1qUBkvH4PNDR2RqRRA4O/vcBayp5MpDRInc4p7fMb3W3gm6Fko7A6vYQuvtUZp3MwwjzQks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749400383; c=relaxed/simple;
	bh=Tx4MGUsST5PHQCrNmFWznKqxDMYt7EFT3jPu2toPcB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m5e4grTfTvPdwiv70z8BNLR/ydxZRn5khsp6guTISzORCe5pn4jwMdOZwNkScD2Pfd6v9o6axQhgA0wMJb2hanakqX9v1QPMXywTR/xfI6wPKeSOskiS91MKT+hDrIssZ4V7IvZy3eNrw/w+7lh4dZS14JpVaZVricNsgMqMNRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=nVrbl6P3; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="nVrbl6P3"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4a58ebece05so41365961cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 09:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1749400381; x=1750005181; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OuRYivZ74nBEObAg4Esdur1pUm1rPSerTOQh0jJQjUg=;
        b=nVrbl6P39MLhWqELEXvO/ZI+xS01pQPrZfngKIWrbOsfbW4bvQ5jwfoYG0dhhjlFdD
         Qt2sAzchEQF1qMLM7+kGICBUyEoGuQoctoz2GG37mvvAZNGJW+Akhl6iIHWXuSHKrQ/W
         xI6eaej0oy00+wCaSaHEZMdWty45XacO9fPfIhT3Rfyv85JDTwizp28UCSwLwwRwi2Ex
         LADc2V3L0xWs/31NrYHHMif2PH5HIpYCtYJBAh9ZmEuJypw8rTh9YYA4eJRQHy7kXHMJ
         ERRsauysjKqGmE4vsvBehghPlzpUj48wE7A2uJEU+Y1rwbAXpR92xulDJrx+KzPLvIlD
         62IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749400381; x=1750005181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OuRYivZ74nBEObAg4Esdur1pUm1rPSerTOQh0jJQjUg=;
        b=FLHFBz87Z2zfRGsnMIzUnB+EAOeQPQeqFrwrkrTTOlmhPY1WZ4qbLXFv0sc5WW8KzC
         rMS6vpZGNf07ZfPvbaDx6lbZAZuNlfBdyc/6af7W0J8jW0lFlQoC+M5hOVs34lyYwD1S
         mQq9/Dvx7rFBltZNhz0T+K4Cw5SDVxsazOYgGwQVfMtxpve/f+4fe4w/lYGZQk8hkEnX
         bgW6kS0mt7DubkiKoPLagVEXhnRCMX3ahXZQEjj7EV0fSSxFV6OouDSDHQdUnPbZFx5N
         pu1zf2QMG6sKRWikOO6L5boEZAx6RPJKEbE9Jet30AWTCDCd84B8lCyA5iuBCuKSIqU4
         wA6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhhHyKHPV/fKKlocf5DQlhLfMd4Yst4AxATQZQcj7HZbARIVBhXDPa9te0IXM/3TJ6QseJNnVbr+PnMos=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpn2imMg7G7FBWAcGa0EXkINWysNTf3ObwNco1/vkp/nZuneBu
	APgVZfBYG0aVO2nh0nJ6rRsGB0XRc0NUtMrXYQywbH4bQWhcxFFIBDPFDsa1efxrjbg9548c1gU
	3LaxsxfKwwg8f+FHqBBu957zuPeQKJnGybDY47PAzkg==
X-Gm-Gg: ASbGncvaSKbs+c8PsBoVKpeXMShsY04y+mBgkKvhY7tcYw+XZJ81dFMXMcHsTuf2Xod
	zXzfUmTQq6Fc3Uqin5XBZts5VWrvC+sB7sNhwyjfsiiY9XTyqm/0Vg6IgLc1EuuZWIKJwUOtesF
	rBdWsJH53Y5E35v/wng2wv1yZRI2qOdg==
X-Google-Smtp-Source: AGHT+IHM7A0yo5EwU0URGl5qPD/nSWVFx1Uch1mkQMPpJ9jiESTc768PtJKyMnU3hW6gMNfEhsZROCE5EGkLP46xzl4=
X-Received: by 2002:a05:622a:5a15:b0:4a2:719b:122e with SMTP id
 d75a77b69052e-4a5b9a40939mr176026001cf.18.1749400380740; Sun, 08 Jun 2025
 09:33:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-11-pasha.tatashin@soleen.com> <CALzav=eAWdADOyZHxCTF-eKwiYhw2ELj3mKJ+8uQY6sOf0Hmuw@mail.gmail.com>
In-Reply-To: <CALzav=eAWdADOyZHxCTF-eKwiYhw2ELj3mKJ+8uQY6sOf0Hmuw@mail.gmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sun, 8 Jun 2025 12:32:23 -0400
X-Gm-Features: AX0GCFshnOWS2B6OWr1wN-XQzYf4DQDY1vQdBPzBZzA3h43rNR_DwPDF1zPI47g
Message-ID: <CA+CK2bB61cv2JMVoMLqBAL1iFTK6w3WznPwWepePYk441V5RvQ@mail.gmail.com>
Subject: Re: [RFC v2 10/16] luo: luo_ioctl: add ioctl interface
To: David Matlack <dmatlack@google.com>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, rppt@kernel.org, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, 
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com, 
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com, 
	vincent.guittot@linaro.org, hannes@cmpxchg.org, dan.j.williams@intel.com, 
	david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn, 
	linux@weissschuh.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, gregkh@linuxfoundation.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org, 
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 4:29=E2=80=AFPM David Matlack <dmatlack@google.com>=
 wrote:
>
> On Thu, May 15, 2025 at 11:23=E2=80=AFAM Pasha Tatashin
> <pasha.tatashin@soleen.com> wrote:
> > +static int luo_open(struct inode *inodep, struct file *filep)
> > +{
> > +       if (!capable(CAP_SYS_ADMIN))
> > +               return -EACCES;
>
> It makes sense that LIVEUPDATE_IOCTL_EVENT* would require
> CAP_SYS_ADMIN. But I think requiring it for LIVEUPDATE_IOCTL_FD* will
> add a lot of complexity.
> It would essentially require a central userspace process to mediate
> all preserving/restoring of file descriptors across Live Update to
> enforce security. If we need a central authority to enforce security,
> I don't see why that authority can't just be the kernel or what the
> industry gains by punting the problem to userspace. It seems like all
> users of LUO are going to want the same security guarantees when it
> comes to FDs: a FD preserved inside a given "security domain" should
> not be accessible outside that domain.
>
> One way to do this in the kernel would be to have the kernel hand out
> Live Update security tokens (say, some large random number). Then
> require userspace to pass in a security token when preserving an FD.
> Userspace can then only restore or unpreserve an FD if it passes back
> in the security token associated with the FD. Then it's just up to
> each userspace process to remember their token across kexec, keep it
> secret from other untrusted processes, and pass it back in when
> recovering FDs.
>
> All the kernel has to do is generate secure tokens, which I imagine
> can't be that hard.

Based on current discussions at the bi-weekly hypervisor live update
sync [1], one proposed idea is for LIVEUPDATE_IOCTL_FD_* operations to
be managed by a dedicated userspace agent. This agent would be
responsible for preserving and restoring file descriptors,
subsequently passing them to their respective owners (e.g., VMMs).
While the complexity of implementing such a userspace architecture in
a cloud environment is unclear to me, introducing kernel-enforced
security boundaries around /dev/liveupdate tokens themselves (instead
of CAP_SYS_ADMIN for the device node) seems too complex and
potentially risky to incorporate at this stage of LUO's development.
If finer-grained, token-based security is necessary, it could perhaps
be an optional extension to LUO in the future managed by a dedicated
CONFIG_*.

[1] https://lore.kernel.org/all/958b2ec3-f5f1-b714-1256-1b06dcf7470f@google=
.com/
