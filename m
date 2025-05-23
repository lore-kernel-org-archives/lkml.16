Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239AD2949F4
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748023704; cv=none; b=XxCvEaCv96VB8h0w+lVRZ+X6AUBWSVl9IbmaSJteFswKjKsgf4EUbIvAul1SV5Y9xvkfnoiuJBDG+vrErY5iiZKrRqwEDzO4S+scShPAB4+hlB3ym+oB/RBXoHc7HjPpiySh7v2TQhUDxEwQpxJVa2fxGqlVwIk1eroh0OK30ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748023704; c=relaxed/simple;
	bh=evhV5bvbvbINEG98PnCDvgsHUB6u2zpOouaj4WsoLw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h0sBoftff2Pstr/VLJnfVwE3AqVYKonvl60104RbljGvWzBXdZXmSUzU6rkwQW1nqOpwygR8NBSf7s4ZvYxz/5VD2PCWQrvGvAc3R+908cBll589Xmr/E4EDdIDLlXdNb6xmLZgcM+R7NzAESEx9bukZ/GCj5PlLozjMCMcLcLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=FlYCaat8; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="FlYCaat8"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-47664364628so2199841cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 11:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1748023702; x=1748628502; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evhV5bvbvbINEG98PnCDvgsHUB6u2zpOouaj4WsoLw4=;
        b=FlYCaat8cxcOdG07Od3+IQMPEaeZ/cj7C7G+CCkgQ4bv/GI6umHl4xLSNTWDiIXFqU
         JA4Vye30P609ZCXIIwiJYJ0xOYKOLZMfAMVt/SxXymnTcv6eWtJoG61i6fXcI/I9EW96
         gikAJyZaStaB2z2ePRkQOBoOvBXM8Dg7/CoBuYlnMkjFSKX1y3zn5vlNtrxGA3bBlsdd
         oK0dFBFTQqgHEDYBrs3ldZ4CEFPBJ+pgFG+OxkPbjH5JscjjxpSr5yX7IXT4fB+tw8y3
         YN1dZQP3NeJuD7Ca56AoyzucMq5xkXdMr6ncL2r+dX7Lb+U/hfWnCWUkpMSpEdVi5UcH
         X/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748023702; x=1748628502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=evhV5bvbvbINEG98PnCDvgsHUB6u2zpOouaj4WsoLw4=;
        b=f8g6++WzADFEVdX9hrqKGNswdV0t5VUe6IkpigbTGzxn6KWTuN4qjmXEKgxnFbqodA
         rcSzZUmOpFuAvuLsra6wmgQUBjotAibP5K1IpUOhG6njrYW3gMknBQKC4ALBqR9WWQ/5
         P6ZZGbEHXvQDEo51+mpHrTSfOcS3WcEeTcIzvoDfqrB2r2Dfc37HkxUFQ5yd7mXBt5XF
         TeAbXLG8eU/3hg74v5davshDqi9FrUAw+TR9ZbQ3YCzQe7NNq7mOhC5I5RWjgCQ1B11W
         jGOUU3PoDcQoEBMRhrFWmZj3CdVfdfv/WF3J4jEXZk5ev0OsqnDBDUrzAIfhuskenHwm
         AXKg==
X-Forwarded-Encrypted: i=1; AJvYcCXoq3AY+E+g6hHi6o0APkYe/FuLR7bSfzWY7KRn2+L6ZizuMK4/SyrHCZ3kz8dq3298Bl+2CSGFKVGDAKo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMMlXUfeOsgmqaGim//LuizqOzHIlMgNsXcNQWYQmZdKL9AzLO
	FpCgUpYQ4DBAoQAi/0rzdOjScQnP3I0iRjtDBNQoy2sLAefV/W1LpiCSFLyqdPDNTERniUddoiJ
	mpwWoZqiI7gSZTDERUvCgzsoi2KxT74z7nCL/4LuVYA==
X-Gm-Gg: ASbGncuygeodil5kWpuiaiBoCb/wL/s6lLhddnpqiDQfbAUwl+CklGh3bXmrHnwBN0W
	l52JaJ4bq4OCPBccLetdDcJihN9nKSili6QUh8ZrEan6KYkoYGkVAtMuseujznoRe/Yc1sW+LnE
	lQ8fqhPxroHLFwBEtiJtdeIf1XWXaJeelSlzEhl9FS
X-Google-Smtp-Source: AGHT+IH9AiO07plJSRhLB6tkJdXaDFzPn2pHd+a7L3X+gKjm+z/Fz4czzaEUCOxKugIFDOgFxL19MklfYzAdFZ2DkVY=
X-Received: by 2002:a05:622a:5811:b0:494:9d34:fca5 with SMTP id
 d75a77b69052e-49f3394f70emr7714631cf.13.1748023701929; Fri, 23 May 2025
 11:08:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com> <aCwuZI7ek7XGaLN7@kernel.org>
In-Reply-To: <aCwuZI7ek7XGaLN7@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 23 May 2025 14:07:45 -0400
X-Gm-Features: AX0GCFt9InSi-jbnPqjcDUibRJENQKP67YavT0G51MPVz1pVL-VvRvyfzD-NRvg
Message-ID: <CA+CK2bBhe4zcxxgqE2X1OeWrWHr1qP_BQGzE7dRhtr1Rs+0S+w@mail.gmail.com>
Subject: Re: [RFC v2 00/16] Live Update Orchestrator
To: Mike Rapoport <rppt@kernel.org>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, dmatlack@google.com, rientjes@google.com, 
	corbet@lwn.net, rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, 
	kanie@linux.alibaba.com, ojeda@kernel.org, aliceryhl@google.com, 
	masahiroy@kernel.org, akpm@linux-foundation.org, tj@kernel.org, 
	yoann.congal@smile.fr, mmaurer@google.com, roman.gushchin@linux.dev, 
	chenridong@huawei.com, axboe@kernel.dk, mark.rutland@arm.com, 
	jannh@google.com, vincent.guittot@linaro.org, hannes@cmpxchg.org, 
	dan.j.williams@intel.com, david@redhat.com, joel.granados@kernel.org, 
	rostedt@goodmis.org, anna.schumaker@oracle.com, song@kernel.org, 
	zhangguopeng@kylinos.cn, linux@weissschuh.net, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, gregkh@linuxfoundation.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, rafael@kernel.org, 
	dakr@kernel.org, bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 3:25=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> Hi Pasha,
>
> On Thu, May 15, 2025 at 06:23:04PM +0000, Pasha Tatashin wrote:
> > This v2 series introduces the LUO, a kernel subsystem designed to
> > facilitate live kernel updates with minimal downtime,
> > particularly in cloud delplyoments aiming to update without fully
> > disrupting running virtual machines.
> >
> > This series builds upon KHO framework [1] by adding programmatic
> > control over KHO's lifecycle and leveraging KHO for persisting LUO's
> > own metadata across the kexec boundary. The git branch for this series
> > can be found at:
> > https://github.com/googleprodkernel/linux-liveupdate/tree/luo/rfc-v2
> >
> > What is Live Update?
> > Live Update is a specialized reboot process where selected kernel
> > resources (memory, file descriptors, and eventually devices) are kept
> > operational or their state preserved across a kernel transition (e.g.,
> > via kexec). For certain resources, DMA and interrupt activity might
> > continue with minimal interruption during the kernel reboot.
> >
> > LUO v2 Overview:
> > LUO v2 provides a framework for coordinating live updates. It features:
> > State Machine: Manages the live update process through states:
> > NORMAL, PREPARED, FROZEN, UPDATED.
> >
> > KHO Integration:
> >
> > LUO programmatically drives KHO's finalization and abort sequences.
> > KHO's debugfs interface is now optional configured via
> > CONFIG_KEXEC_HANDOVER_DEBUG.
> >
> > LUO preserves its own metadata via KHO's kho_add_subtree and
> > kho_preserve_phys() mechanisms.
>
> I've only had time to skip through the patches, one thing that came to mi=
nd
> was that since LUO is quite tightly coupled with KHO maybe we'll put them
> together in, say, kernel/liveupdate?

Thank you Mike, yes, a good idea, I also thought that it would make
sense for them to be in the same place, but initially I thought
perhaps KHO should be moved to misc/liveupdate/, but since it is
already landing in kernel/kexec_*, and it works with a bunch of core
kernel subsystems it makes sense to move LUO and KHO together under
kernel/liveupdate/

Pasha
