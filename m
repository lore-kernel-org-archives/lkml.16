Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159C82D29AA
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750868000; cv=none; b=u9nwi3bGxGbGKpuw528Fo6hQ/2Rnn2CId6+sGUg33hcLWE82Fy2EKrakWL4Fp+s1V0C/80sPdmN3ZbFslwwwpGm7MwvdqtjeKGaPTxC2tEmaAueitPRBbemY8zVfp7OgITR1CwdiutMEEgUH+CZ2Ogbok6PrvIPOpCm2mpnVDfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750868000; c=relaxed/simple;
	bh=NWTU9KjLztibLwJOI0I2c5PwZ/pOAGxqqconYH3Cu6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SR/8dWu3hjsNSA7lSQQMv5K4IOoB/wNR2sFUrT9dj8tn62Na4XgxujhXYYnNaVnhfKzMAmK5jJNFJ2z77Jl8InFO6s+/9wYIvvD5P7dpgkakFSbkcC6hx/OVxgkjzbknu/ZmnuD48s8LeDJJj+K2aDSzcj0tiXq+/wM+dT1qI6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d18ef1gJ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d18ef1gJ"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553644b8f56so24546e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750867997; x=1751472797; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWTU9KjLztibLwJOI0I2c5PwZ/pOAGxqqconYH3Cu6w=;
        b=d18ef1gJJayIhzCC0CNsLd/2Qze/q+j7hLkQfhBdhiTcZxM4uT4NNZdj0Girdi1acT
         VJZcaWyHkcpcF/kntSP2kOG6J4Tp/0sXDN1fNfFYjqZJnC72A8HRShyPval3ElEYtkuP
         5vlTmAI7zxhkcXNG8YYfB23poAKIYZEmTK91f75wv0pLI6i6v6UNjpMUof6HjQTBvuOO
         SEceLBeWkkxksXbuMxm33yC2raH+GsGPpWqAoPvnIAdysjh/3aZ/X4ad+qO/JKvoaxDW
         31Et4fd25h+fzq23RJ1WKxGWlxxiRTgQVfSu3WN3rFqkCUSkYS0WVvWGd4+G1qUeXe91
         hFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750867997; x=1751472797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWTU9KjLztibLwJOI0I2c5PwZ/pOAGxqqconYH3Cu6w=;
        b=AmXua82/IzC10vxvGnH0C7md2vzetR8xcudr8Zt4J2ZC/epzpncB/TIoYTL4O78kVC
         FOVlI2bBMRK3xLdl/S745deWo04Me09busCeifrDtpzwyo/htPXYYdv1PVNwxC1F7i7C
         hoiriGGGtBiqQTTUOqeVoO/ahG5Tlj9sGq2FZ8Du/o/jzeyADeUf+bJrHQmrc6EP0CyY
         8ISSDAiS4v6Z7w98Ixvd5GEC4Ekjc72BQ/9+Xluu4hg6Nan+9d/wCcDheLk1++x1HQGj
         ZaPTBvcS5cvtMo6RaicNoGkbh9I5xB7JJSR4KKYgJhvYie5WGGnAvHDyffe6Dpwvgp94
         o+JQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFR5D3fNoEwCRdUewYKCeMD+MuZTP3ZcBxOxerJaMfnVKB01YBE/mPyots/663W1YyEvStMbIET3jkwq0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZM6FrBkyyiVSClb2AZ3dTjkaWGTh5yYTCo0CH9lORBUddhNDz
	PgB03xMI3kVx+FqkdkciBHd71Ur6kuUdD100eQrY7friAWoIl+TOZUEsrDfoSxWDXnrC479W1n4
	GYixZfPDjuzWpKMzDeAZBoBWHmIobXTleTzcalZxG
X-Gm-Gg: ASbGncuhqAGvPO1LYJqNviz6s1sQPRqt+YvNRH2OK2/faTwOL8EBjC+wReEmeCgTK8w
	12+ISDxGI6+AkX5qfpKiRELApBhhiaoLUrTHr3XuBXIPSCrdcuHhoGTZJlYs7SHOInNIq2hdiQr
	2kYCug3wupcFad09F7rIkPPa2YwrYedFOQonuocPDEN7Q=
X-Google-Smtp-Source: AGHT+IEmyNKuINV9suiw750iH+/qWaKx6g6apKTMylHrEHA2ab9ubUUotR8hKdCWlG9C6/ymBT3mjUvzDbJ2PDC7/J0=
X-Received: by 2002:a05:6512:132a:b0:553:ac33:ff24 with SMTP id
 2adb3069b0e04-554fdfbcef6mr1162599e87.55.1750867996478; Wed, 25 Jun 2025
 09:13:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-11-pasha.tatashin@soleen.com> <20250624-akzeptabel-angreifbar-9095f4717ca4@brauner>
 <CA+CK2bBu4ex9O5kPcR7++DVg3RM8ZWg3BCpcc6CboJ=aG8mVmQ@mail.gmail.com> <20250625-akrobatisch-libellen-352997eb08ef@brauner>
In-Reply-To: <20250625-akrobatisch-libellen-352997eb08ef@brauner>
From: David Matlack <dmatlack@google.com>
Date: Wed, 25 Jun 2025 09:12:48 -0700
X-Gm-Features: Ac12FXzsaTglwRDvyxmqrDF18P44C8borysbshJSxnL6KDEw4fT_csftD9wd1t8
Message-ID: <CALzav=d+XgS1bUs-v7+ws5nYU9y=4uc1c8oVLHrJ16qLpnUi9Q@mail.gmail.com>
Subject: Re: [RFC v2 10/16] luo: luo_ioctl: add ioctl interface
To: Christian Brauner <brauner@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, pratyush@kernel.org, jasonmiu@google.com, 
	graf@amazon.com, changyuanl@google.com, rppt@kernel.org, rientjes@google.com, 
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

On Wed, Jun 25, 2025 at 2:36=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
> >
> > While I agree that a filesystem offers superior introspection and
> > integration with standard tools, building this complex, stateful
> > orchestration logic on top of VFS seemed to be forcing a square peg
> > into a round hole. The ioctl interface, while more opaque, provides a
> > direct and explicit way to command the state machine and manage these
> > complex lifecycle and dependency rules.
>
> I'm not going to argue that you have to switch to this kexecfs idea
> but...
>
> You're using a character device that's tied to devmptfs. In other words,
> you're already using a filesystem interface. Literally the whole code
> here is built on top of filesystem APIs. So this argument is just very
> wrong imho. If you can built it on top of a character device using VFS
> interfaces you can do it as a minimal filesystem.
>
> You're free to define the filesystem interface any way you like it. We
> have a ton of examples there. All your ioctls would just be tied to the
> fileystem instance instead of the /dev/somethingsomething character
> device. The state machine could just be implemented the same way.
>
> One of my points is that with an fs interface you can have easy state
> seralization on a per-service level. IOW, you have a bunch of virtual
> machines running as services or some networking services or whatever.
> You could just bind-mount an instance of kexecfs into the service and
> the service can persist state into the instance and easily recover it
> after kexec.

This approach sounds worth exploring more. It would avoid the need for
a centralized daemon to mediate the preservation and restoration of
all file descriptors.

I'm not sure that we can get rid of the machine-wide state machine
though, as there is some kernel state that will necessarily cross
these kexecfs domains (e.g. IOMMU driver state). So we still might
need /dev/liveupdate for that.
