Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB371993BD
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750435479; cv=none; b=n8jGjKX5wKTf22MXvlwur3vuDXPuhPR/zkArBtRs+UCwr3R7ypPXmFFhnfUXYCV4t3RQxcB9YNXAAeDJawbM6C9hWQmDfnVaolmX6SFxeKidMG0rkkNg30SINFM/69K2L25nlD2JbGS7oLeAe/huaizOuvk3Y8xNPdQutA7fvX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750435479; c=relaxed/simple;
	bh=KBcGLgy3ZycCDoT7xlJdzPZ1CdI0tHu42dibypRo3EE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q3Tc41WWQay0+au+yVZqGz6KaaQ5N67yQGUrjs9zBlb4YiCyBwuBo4Zom8QZGA/R284QGlpvthjYw4ZgPEAp59qNhnvbtR7tMPor6LPxS/NVouT9l+d7ALwknoDPxquIPkZ538nbGoL4feyP/fx3T5uKCesPMxu2TYxzMEqRGDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=q/4MxPsY; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="q/4MxPsY"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4a5903bceffso22616851cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 09:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1750435477; x=1751040277; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBcGLgy3ZycCDoT7xlJdzPZ1CdI0tHu42dibypRo3EE=;
        b=q/4MxPsY/qDx4YUkyPzL64dH/K0Sw71gttFssB3sh1sASpJk+3HuY3do/Jpomr6oEa
         sFLBGUzzl2jU52Q/vLKVSTXWSSoxoLpqn0ZbbTef7VsOkA/t2SDhbsHO1REWZqGUWdHJ
         Ir6FjWW0n5rrs8PTfcY1iz+TmiCQXeG/4d+WSy/W6yMTaPUBv9X0NYam44DhsAOknwvq
         gyxjhBnJVlB5KQfbhPcT5gAR78nVBHWnH2wtwf4ZVt28T2UYt8ZfjrzfZKh6fzdOm3/7
         OPKOprwyVl8iFJ2sm1nm4KLLeQcSknMoqIH+MaEovXRobvnrBPFOhLO1j7LyrdQKTAbO
         nvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750435477; x=1751040277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KBcGLgy3ZycCDoT7xlJdzPZ1CdI0tHu42dibypRo3EE=;
        b=KO52tIVwSPm19+9vq28/eGqLCbOLHQVIsm8N4Obv7eeUWipmTfJJlnIVJ6109qT/43
         Bi1Yni4DRvkoVfiuRxtOiKWJhHMvFMLfQs4g9QtVKQ7Jr/ADhn9b5uPo8Ycjp2zHb1G7
         1P/NWfuIDJNCYkZZl7rtm35Ut06MPEfAdXzoqy9F1sN526msQIVmjIfupZ27jkxTJuYG
         cG9hWWVmQiBdMF3Nm3IOKpd0g4bK80Mql5WEO6kUG2pkOw9tTMJwg2+pBKqCJQ9cUNk1
         txQO0WbqXRKz0/Qww7KPMsF9GQHaiMWT+Dkr2n3/xIpehAbOy7MWB9KXS5ORFimguErY
         y4fg==
X-Forwarded-Encrypted: i=1; AJvYcCVpSSVFH5Z91fowwwIczUNLuy7oHztETI6tBjsKUGHJpUG6fF+dy8EGG2lq8D3tW1cFdHgoBrhedXksXls=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx00+BQCdFB5BXA5qESl+k8uQxDZEHbDERrp36iN70EfKbQocdl
	CMcU04dBbkuUiQhGUxAp/h/mB4V12TwAvX4K05xVZRUL6NtUXNT4wLy0DBRyzeKP/C5Y5AubKUN
	E1afcixYvZWv7o8EW3Hqi877HU7WFWp7RKj+YJGr9TQ==
X-Gm-Gg: ASbGncsA3BUIvFDV4eaRSM667QzjOz/+Rii/QUg7uahJO1lrHxm5uo5SbNO26ZVgfd+
	R8lVBpP+xiuaKlT5xpCLngEHZ7zG4BnlbUqpMPYIqTO269auu8t9Gt8hhUj2dQj+MWVlJ5M4owb
	q2liIM/cQybotdyC9jA2HbNY5Qt/7deSuC4qKKYeaB
X-Google-Smtp-Source: AGHT+IFYMkrIV8rD7Pif2HmczDwpVC2FXm+jHHb0EasflVe0vI4Kty5fEm7Qn6/47uvi0pcg9jQaBOvaY3LbpyffyhQ=
X-Received: by 2002:ac8:5e4b:0:b0:494:adff:7fe2 with SMTP id
 d75a77b69052e-4a77a24907bmr54563871cf.43.1750435476818; Fri, 20 Jun 2025
 09:04:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <mafs0sekfts2i.fsf@kernel.org> <CA+CK2bA7eAB4PvF0RXtt2DJ+FQ4DVV3x1OZrVo4q3EvgowhvJg@mail.gmail.com>
 <mafs0sek3n0x8.fsf@kernel.org> <20250617152357.GB1376515@ziepe.ca>
 <CA+CK2bAtO7BA5iptRfA_oa=5sUz_t-0F3Lu8oae1STnijXrPPQ@mail.gmail.com>
 <mafs05xgtw5wn.fsf@kernel.org> <CA+CK2bDWAPSmTdnD7vw4G00nPsM8R_Zefs_G+9zvSqTJqPb9Lg@mail.gmail.com>
 <aFLr7RDKraQk8Gvt@kernel.org> <CA+CK2bAnCRu+k=Q78eA4kcAebxA9NgOorhwRqu-WxC913YBsBw@mail.gmail.com>
 <CA+CK2bB3P1vX658ErkP4_-L6WZSOCcenEwUdX1qS=poDjs=i+A@mail.gmail.com>
 <aFP7wwCviqxujKDg@kernel.org> <CA+CK2bDqO4SkUpiFahfUx2MUiE8oae9HmuaghPAnCwaJZpoTwQ@mail.gmail.com>
 <mafs0ikkqv3ds.fsf@kernel.org>
In-Reply-To: <mafs0ikkqv3ds.fsf@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 20 Jun 2025 12:03:59 -0400
X-Gm-Features: AX0GCFsQhPGk-ls7Li1zkHXTCt1at0pTBUhnscC7tj8uZk3G-noKoK_lGxaGFUA
Message-ID: <CA+CK2bCA_ggpvbY+MQPaAHsN7MOzV7D3=MYvfAP4cFwhThJpPw@mail.gmail.com>
Subject: Re: [RFC v2 05/16] luo: luo_core: integrate with KHO
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, jasonmiu@google.com, graf@amazon.com, 
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
	stuart.w.hayes@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 11:28=E2=80=AFAM Pratyush Yadav <pratyush@kernel.or=
g> wrote:
>
> Hi Pasha,
>
> On Thu, Jun 19 2025, Pasha Tatashin wrote:
>
> [...]
> >> And it has to be done before kexec load, at least until we resolve thi=
s.
> >
> > The before kexec load constrained has been fixed. The only
> > "finalization" constraint we have is it should be before
> > reboot(LINUX_REBOOT_CMD_KEXEC) and only because memory allocations
> > during kernel shutdown are undesirable. Once KHO moves away from a
> > monolithic state machine this constraint disappears. Kernel components
> > could preserve their resources at appropriate times, not necessarily
> > tied to a shutdown-time. For live update scenarios, LUO already
> > orchestrates this timing.
> >
> >> Currently this is triggered either by KHO debugfs or by LUO ioctls. If=
 we
> >> completely drop KHO debugfs and notifiers, we still need something tha=
t
> >> would trigger the magic.
> >
> > An external "magic trigger" for KHO (like the current finalize
> > notifier or debugfs command) is necessary for scenarios like live
> > update, where userspace resources are being preserved in a coordinated
> > fashion just before kexec.
> >
> > For kernel-internal resources that are unrelated to such a
> > userspace-driven live update flow, the respective kernel components
> > should directly use KHO's primitive preservation APIs
> > (kho_preserve_folio, etc.) when they need to mark their resources for
> > handover. No separate, state machine or external trigger should be
> > required for these individual, self-contained preservation acts.
>

Hi Pratyush,

> For kernel-internal components, I think this makes a lot of sense,
> especially now that we don't need to get everything done by kexec load
> time. I suppose the liveupdate_reboot() call at reboot time to prepare
> final things can be useful, but subsystems can just as well register
> reboot notifiers to get the same notification.

Correct. If subsystems unrelated to the userspace live update flow,
such as pstore, tracing, telemetry, debugging, or IMA, need to be
notified about a reboot, they can simply register their own reboot
notifier.

> >> I'm not saying we should keep KHO debugfs and notifiers, I'm saying th=
at if
> >> we make LUO the only thing driving KHO, liveupdate is not an appropria=
te
> >> name.
> >
> > LUO drives KHO specifically for the purpose of live updates. If a
> > different userspace use-case emerges that needs another distinct
> > purpose (e.g., not to preserve a FD a or a device across kernel reboot
> > (i.e. something for which LUO does not provide uAPI)), then that would
> > probably need a separate from LUO uAPI instead of extending the LUO
> > uAPI.
>
> Outside of hypervisor live update, I have a very clear use case in mind:
> userspace memory handover (on guest side). Say a guest running an
> in-memory cache like memcached with many gigabytes of cache wants to
> reboot. It can just shove the cache into a memfd, give it to LUO, and
> restore it after reboot. Some services that suffer from long reboots are
> looking into using this to reduce downtime. Since it pretty much
> overlaps with the hypervisor work for now, I haven't been talking about
> it as much.
>
> Would you also call this use case "live update"? Does it also fit with
> your vision of where LUO should go?

Yes, absolutely. The use case you described (preserving a memcached
instance via memfd) is a perfect fit for LUO's vision.

While the primary use case driving this work is supporting the
preservation of virtual machines on a hypervisor, the framework itself
is not restricted to that scenario. We define "live update" as the
process of updating the kernel from one version to another while
preserving FD-based resources and keeping selected devices
operational. The machine itself can be running storage, database,
networking, containers, or anything else.

A good parallel is Kernel Live Patching: we don't distinguish what
workload is running on a machine when applying a security patch; we
simply patch the running kernel. In the same way, Live Update is
designed to be workload-agnostic. Whether the system is running an
in-memory database, containers, or VMs, its primary goal is to enable
a full kernel update while preserving the userspace-requested state.

Thanks,
Pasha
