Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791E91E4B2
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 19:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743103799; cv=none; b=jCrV/n/45eYv87rSWpRYfrHDhO0gOjuqtdMfz4fdAzg1TX8WOyOoZ1o79JpEW6jpvZSsubV1tOcTMZ0NEQhh4GEOPDmJEuNNZjsWqiPPOHZXTcmgv7xzVwh8VOxrrVFl7RvfbfKqsmJOA4eKQLSLCPVs139K/LRL8oD5IgHqINc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743103799; c=relaxed/simple;
	bh=QuuZoXkB6r7i/dyce7l2jp0tvZLOXuVenD4Wt6a3XBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=brvrZtp/CqdcYLXqaY7KTEx4Pgj2sP3JiCFN4k4LyW+C8Yea1/a+Yt2RuwlHjeKuQH6FE8ySRzUnCLejastfx/rydoMfx7EX9Ykz0lQs7HFQ60yURT0asolOq0Hx4HcI3uhWIkuPSy6n0b9SoLAwo0+OX3vt86NB/XV5bHkxI1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=0wR1U5aj; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="0wR1U5aj"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4766cb762b6so14143851cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 12:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1743103796; x=1743708596; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4YRUd0dUXxsiI+NBlGETAhHA6/U48pzMrcLDXPVjVo=;
        b=0wR1U5ajgZ00jps5YHrHjyHohGZ7ejiMG80NxcVsgcArgKxCn83gPnb05FzGP8UDeO
         S7JsQw7hzhoQF13sjW15cP82CIhZSNwhL6LkgNZcv/iClBsS+h8xg2d34yqe6kL9t4W0
         Z2TXN9NSsk4CSw6A9L7cDDkP+N69oUHI4WayEibsfYbZ+h7ya4P1KVC2unrk88Ep7T72
         Bw/dNQE3d7JGgwRcy18euQ4eWXJ9ys+m3vUvsukzUOlrYc3eUJzmoGtqhacKivepOec4
         OJBif69e5NHP4BeDGCl9cnNdGKbXNGhMb4StfuK+p/ggRV2HbtBbXt+FscpF/ASuG0pw
         cDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743103796; x=1743708596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C4YRUd0dUXxsiI+NBlGETAhHA6/U48pzMrcLDXPVjVo=;
        b=B+uHLC8HNogPTecLdnIzMtXeCWyLprARHHn4ru/7JJI3nS17Nb5ao88Ojg0o+sZoni
         qZf5YWyFI3r4MX5b5ixkIdG3qyVDOB1wqMLTAA9mMXWmdNcUWYhU32IsfN7r6gw7bYuJ
         zSxRYxZb4ofy7//UzCFfRkMDik8RoKAF2eD0LvgqXBA0sOKsk8Vlh1yUJcNhmu6SW+ez
         vnggYxusHgId6YolacJ3C5MkO9xNppv4PD3GIOpWwUkHg9vydQK4xnpMUr+6bV+ajzSi
         eF/E8ectZKzJRDJ5goi5AFBwZ85jg5qzwzzXPXkXitchDluWG+26aL0IXV5RBRnpzagE
         lBHA==
X-Forwarded-Encrypted: i=1; AJvYcCUPephlooKSx28smWZpX6hUrTRZzjcYOmuoWDCh98I9AUNWz1LPAfSVZlX6sX6Db17DUXhFOWBkvwQPKqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbTgLyI9EfC4i0tPailiBgb+lBSS0PSAZ+Ddg0WNoweeF+DXSa
	44EkmukBYuyQFPBz4d/p88+NO614SJvobfLlUtLjm6i8dkb4nGN9H8nhMku6fagqyJxI+TG2I1W
	baZ4qD3/8w+QAdOZ/F6+XEP7yO/Nu+IxBZxH9Ug==
X-Gm-Gg: ASbGnctLu0VnrF0/KdFlgnPkM48jCB05FZv3gfMxZ8Xib9yUHAcTGErpx4oMcHnhzUw
	7ihngo/YN58yELVSXWmsUGQA1Dxf3JRbZ15glgnWrz30rk26xflzyyik2mevbaCsqW2USvfVdIy
	htcV9dAbQ9kPEv1U3UdP+aL8Av/7exhsmkq8lnMa8=
X-Google-Smtp-Source: AGHT+IHmKJiIAuGir5eLdnuzQYUg+lTpLRvScYqP43GjNb2vxGbldqJeyd7c81dwopkHCLQbzICpBpWIbb/q/WAmcLc=
X-Received: by 2002:a05:622a:4018:b0:477:1126:5a33 with SMTP id
 d75a77b69052e-477843dee70mr963831cf.1.1743103796128; Thu, 27 Mar 2025
 12:29:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320024011.2995837-1-pasha.tatashin@soleen.com>
 <20250320024011.2995837-2-pasha.tatashin@soleen.com> <20250320144338.GW9311@nvidia.com>
 <CA+CK2bBovJ68FPOqD5J-_xmzy_mm8gNhJW80EsWGLgq+NhuX5Q@mail.gmail.com> <20250320192601.GG206770@nvidia.com>
In-Reply-To: <20250320192601.GG206770@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 27 Mar 2025 15:29:18 -0400
X-Gm-Features: AQ5f1JoqJbUNa31EKiHpHgysa1IL2SgJB7qz5YDT-dhXwuOYY82RJ56s9rbmlGw
Message-ID: <CA+CK2bDNoOe06bWAnAkgX-AF5zf5+KasNMeJOt3YcnHh=0893Q@mail.gmail.com>
Subject: Re: [RFC v1 1/3] luo: Live Update Orchestrator
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: changyuanl@google.com, graf@amazon.com, rppt@kernel.org, 
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org, 
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, ojeda@kernel.org, 
	aliceryhl@google.com, masahiroy@kernel.org, akpm@linux-foundation.org, 
	tj@kernel.org, yoann.congal@smile.fr, mmaurer@google.com, 
	roman.gushchin@linux.dev, chenridong@huawei.com, axboe@kernel.dk, 
	mark.rutland@arm.com, jannh@google.com, vincent.guittot@linaro.org, 
	hannes@cmpxchg.org, dan.j.williams@intel.com, david@redhat.com, 
	joel.granados@kernel.org, rostedt@goodmis.org, anna.schumaker@oracle.com, 
	song@kernel.org, zhangguopeng@kylinos.cn, linux@weissschuh.net, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	rafael@kernel.org, dakr@kernel.org, bartosz.golaszewski@linaro.org, 
	cw00.choi@samsung.com, myungjoo.ham@samsung.com, yesanishhere@gmail.com, 
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com, 
	aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, jgowans@amazon.com, 
	Pratyush Yadav <ptyadav@amazon.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 20, 2025 at 3:26=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Thu, Mar 20, 2025 at 03:00:31PM -0400, Pasha Tatashin wrote:
>
> > > I also think we should give up on the sysfs. If fdbox is going forwar=
d
> > > in a char dev direction then I think we should have two char devs
> > > /dev/kho/serialize and /dev/kho/deserialize and run the whole thing
> >
> > KHO is a mechanism to preserve kernel memory across reboots. It can be
> > used independently of live update, for example, to preserve kexec
> > reboot telemetry, traces, and for other purposes. The LUO utilizes KHO
> > for memory preservation but also orchestrates specifically a live
> > update process, provides a generic way for subsystems and devices to
> > participate, handles error recovery, unclaimed devices, and other live
> > update-specific steps.
> >
> > That said, I can transition the LUO interface from sysfs to a character=
 device.
>
> Sure, I mean pick whatever name makes sense for this whole bundle..
>
> > > through that. The concepts shown in the fdbox patches should be merge=
d
> > > into the kho/serialize char dev as just a general architecture of ope=
n
> > > the char dev, put stuff into it, then finalize and do the kexec.
> >
> > Some participating subsystems, such as interrupts, do not have a way
> > to export a file descriptor.
>
> Interrupts that need to be preserved are owned by VFIO. Why do we need
> to preserve interrupts? I thought the model was to halt all interrupts
> and then re-inject a spurious one?
>
> > It is unclear why we would require this
> > for kernel-internal state that needs to be preserved for live update,
> > which should instead register with internally.
>
> Because there is almost no kernel state which is machine global and
> unconditionally should be included. eg Interrupts for devices that are
> not doing preservation should not be serialized. Only userspace knows
> what should be preserved so you must always need a mechanism to tell
> the kernel.
>
> > IMO, the current API and state machine are quite simple (I plan to
> > present and go through them at one of the Hypervisor Live Update
> > meetings). However, I am open to changing to a different API, and we
> > can expose it through a character device.
>
> Everything seems simple before you actually try to use it :)
>
> > > Also agree with Greg, I think this needs more thoughtful patch stagin=
g
> > > with actual complete solutions. I think focusing on a progression of
> > > demonstrable kexec preservation:
> > >  - A simple KVM and the VM's backing memory in a memfd is perserved
> > >  - A simple vfio-noiommu doing DMA to a preserved memfd, including no=
t
> > >    resetting the device (but with no iommu driver)
> > >  - iommufd
> >
> > We are working on this. However, each component builds upon the
> > previous one, so it makes sense to discuss the lower layers early to
> > get early feedback.
>

Hi Jason,

Thanks for your thoughts. I agree with your observation about
components being worked on separately when they might be intrinsically
linked. Especially, given that kvm/vfio/iommu all have FD counterparts
to the global states, or device state.

> I think part of the problem is there are lots of people working on
> pieces as though they are seperate components, and I'm not sure this
> is entirely wise, or the components are actually seperate.  I see
> fdbox and this luo patch series as effectively being the same
> component, just different aspects of it.

You've articulated precisely the point we discussed at LSF/MM. Based
on that conversation, the next proposal will focus on unifying FDBox
and the Live Update Orchestrator into a single, cohesive component.

Here=E2=80=99s a summary of the planned approach:

1. Unified Location: LUO will be moved under misc/liveupdate/ to house
the consolidated functionality.
2.  User Interfaces:  A primary character device (/dev/liveupdate)
utilizing an ioctl interface for control operations. (An initial draft
of this interface is available here:
https://raw.githubusercontent.com/soleen/linux/refs/heads/luo/rfc-v2.1/incl=
ude/uapi/linux/liveupdate.h)
An optional sysfs interface will allow userspace applications to
monitor the LUO's state and react appropriately. e.g. allows SystemD
to load different services during different live update states.
3. Dependency Management: The viability of preserving a specific
resource (file, device) will be checked when it initially requests
participation.
However, the actual dependencies will only be pulled and the final
ordered list assembled during the prepare phase. This avoids the churn
of repeatedly adding/removing dependencies as individual components
register.

To manage the preservation logic, we'll use specific handles
categorized into three types: fd, device, and global. Each handle type
will define callbacks for the different phases of the live update
process. For instance, a file-system-related handle might look
something like this:

struct liveupdate_fs_handle {
    struct list_head liveupdate_entry;
    int (*prepare)(struct file *filp, void *preserve_page, ...); //
Callback during prepare phase
    int (*reboot)(struct file *filp, void *preserve_page,...);  //
Callback during reboot phase
    void (*finish)(struct file *filp, void *preserve_page,...); //
Callback after successful update to do state clean-up
    void (*cancel)(struct file *filp, void *preserve_page,...); //
Callback if prepare/reboot is cancelled
};

The overall preservation sequence involve processing these handles in
a specific order:

Preserved File Descriptors (e.g., memfd, kvmfd, iommufd, vfiofd)
Preserved Devices (ordered appropriately, leaves-to-root)
Global State Components

Let me know if this direction aligns with your expectations.

Pasha
