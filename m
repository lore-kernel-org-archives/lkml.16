Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2F2136A;
	Sun,  9 Feb 2025 01:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739062830; cv=none; b=pKI17af5AOcGQTojpzrEMqxQ2PgJYWUxuj8nQttgYl4nvIdRxKdpV6riBJZAsoeoKVQinuOQM1iL1SuK9icxnNp1B/ReGMb6OMU8PA/t/Fc5hP25plpe+tUzSxN0TK8v738xkrDDYzytH5nmh48gZ3KZjJkYw3Cf/QYhzI0S9SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739062830; c=relaxed/simple;
	bh=+WDWPdJU9/RrGmJr8uBgMn/k1Tt1ijMuRWk5G/wrcTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MecZkecBUo/kShy5rzVpVFlV7qwQEWl8u/StJtj/nKu9dZqI6Wu0Jt8vmE+l8dalN2iRoGDoPT8OcoP0B7YKMpeboJeznHlFJwcHWH+rs94fwLRahcuTV9h2WphchvK+YrsJXzvf3r2tLNU1gA+pBEKZ5rogwAt3BYDLIrd3A6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MEdPSJQ+; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MEdPSJQ+"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4b11a11a4f0so811353137.3;
        Sat, 08 Feb 2025 17:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739062827; x=1739667627; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1QNyMKSJ0hbPU3JV/DSlubSfGXUIpdwEbIrWUYwGH8=;
        b=MEdPSJQ+TxTV+N8bucth1rOs/+BoCj5tlijA6yNgfGGm+LsS+SQ7VFg0lqFZsNCf0I
         0DVyQArnRWNfrYXBDLQK5lm7syiSiXH8tjtV/sWcnboqir2qPraDCTm5Pi6OBTycl+Fc
         coPoms+9+LLJZA7m5titxcohCl6MYJwcwvKk3pryZxBJRIYzgD6Q/r9yyWX96Za9UGDj
         HsIXr1EkiS1if8/g+Sya7vDxbqnqsbsyVWpBUSepiRl0tXeyEYilyFvLpuOh5MVwv/be
         7AXHWsSVRGXlxQZqEuaOVa6u/IZEhRDAaxLm8bBq/NJDyKRajjeCqFn0kguf/KW8jgwK
         CMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739062827; x=1739667627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c1QNyMKSJ0hbPU3JV/DSlubSfGXUIpdwEbIrWUYwGH8=;
        b=Wlh+hKwVhZtLBxPbgChiCJUWATa0MF5BuVJepAwPmUgarApFQBkJYy08jIKB5D5zbE
         HL5ojL1hsPUsWzca/LKjB4RQO2jJGv4t07hArsT7HHcMwrH+rraehecYqSqFDIQq/gQf
         Qyi4vRBHEQH1ifW+/K1qrF44SQMlO9EVT5Fu/EyS8/oVbwaWX7siGbAr8bihVrKL1WQD
         G7l7ztZ3YOelvcG1qXKYInjPTXWQhqwywy83TQmghbWBM60NZmyFgk3BZPQWM6olyJ6+
         2e53miXE6RzWS4cyuHI4+nQw6pmGDDOKGieLxJRya5ndWne2Obq/k7HP49d7tmjf9V1P
         gfUg==
X-Forwarded-Encrypted: i=1; AJvYcCV0dsOC4Z+lK2OpDICh7gDCkqyYrga/IBLFhlWIyKx80BrtUxiHaYn7BA60uEv+RRzGS/7Ak8bi6tDL@vger.kernel.org, AJvYcCVePZJTULfNq5DQZa2elGJD8SDu7VbqLsKx/AtaBk3q548oiTVT5kO0fb5q6oH+DntYWYRQg2Y3pXF/@vger.kernel.org, AJvYcCWyU3TuM9uBrjctyA1w40l02KGS1LxDJLXhbqb5lYdpap0XS1bXjfpJl1NIUOCbLMmZiM1insxRpcbhxUeO@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsy+xzD32dklhVFoJkSCV4OwSGIIFvz50EwF932hXCC7alhVZ8
	ivPxQzhwkjfJo9JXEhtNWdNXGxr5Fqmy2lUNU9TSqivqXI/juE4GTG1I/9XQUA1xgsyuLSw60SK
	S8dTwB0RqOHxWZM8kJD4NZKxFJNU=
X-Gm-Gg: ASbGncvMe3QvPoQhQbYn6quPU2D53Jb0ODMo2XTGU/YZfHsIIr3npYUUo9ByMpYrLve
	78xORFtCpW8D66l43FLgkr7vjvuE+FvYAsJdK5hs0xcM4dfAtqprCL6baNVuCKM3ZMh3L9ojL8P
	UTA7s1wdgQ0cxAEcR/VQ9Mba3RYP+IDQ==
X-Google-Smtp-Source: AGHT+IFLWFnU1Qw8fGqOUkm2sS5SvMcAKUH0QtXlpgwftaLaCUSnrvhOVYmXAaAgSRLNlyGtO1hm5jHRnEYHFNzWo88=
X-Received: by 2002:a05:6102:1627:b0:4b6:1a4e:9ed7 with SMTP id
 ada2fe7eead31-4ba85d86d4fmr5498626137.5.1739062827035; Sat, 08 Feb 2025
 17:00:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206132754.2596694-1-rppt@kernel.org> <CAM_iQpU9DDg2Oi33_dfPqVpd9j_2O+WD7ovo__f48BA9DztwXQ@mail.gmail.com>
 <CA+CK2bBrO+khpX+U3F+d8wCb3GutVD=3HtU-94gHQJSoenQcKw@mail.gmail.com>
In-Reply-To: <CA+CK2bBrO+khpX+U3F+d8wCb3GutVD=3HtU-94gHQJSoenQcKw@mail.gmail.com>
From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Sat, 8 Feb 2025 17:00:15 -0800
X-Gm-Features: AWEUYZkp7_4rFtvLgYaHqSNG2VFYTpgh1ezDSM27S0gX2m2SV5kBvj6jdSbSZAc
Message-ID: <CAM_iQpW4--H6wqcx-=O5_PhEOkdrZN52qUhRRZO9xwpMxxLPaw@mail.gmail.com>
Subject: Re: [PATCH v4 00/14] kexec: introduce Kexec HandOver (KHO)
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org, 
	Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Andy Lutomirski <luto@kernel.org>, Anthony Yznaga <anthony.yznaga@oracle.com>, 
	Arnd Bergmann <arnd@arndb.de>, Ashish Kalra <ashish.kalra@amd.com>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Borislav Petkov <bp@alien8.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Woodhouse <dwmw2@infradead.org>, Eric Biederman <ebiederm@xmission.com>, 
	Ingo Molnar <mingo@redhat.com>, James Gowans <jgowans@amazon.com>, Jonathan Corbet <corbet@lwn.net>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Pratyush Yadav <ptyadav@amazon.de>, 
	Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, 
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Usama Arif <usama.arif@bytedance.com>, Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 8, 2025 at 4:14=E2=80=AFPM Pasha Tatashin <pasha.tatashin@solee=
n.com> wrote:
>
> On Sat, Feb 8, 2025 at 6:39=E2=80=AFPM Cong Wang <xiyou.wangcong@gmail.co=
m> wrote:
> >
> > Hi Mike,
> >
> > On Thu, Feb 6, 2025 at 5:28=E2=80=AFAM Mike Rapoport <rppt@kernel.org> =
wrote:
> > >
> > > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > >
> > > Hi,
> > >
> > > This a next version of Alex's "kexec: Allow preservation of ftrace bu=
ffers"
> > > series (https://lore.kernel.org/all/20240117144704.602-1-graf@amazon.=
com),
> > > just to make things simpler instead of ftrace we decided to preserve
> > > "reserve_mem" regions.
> > >
> > > The patches are also available in git:
> > > https://git.kernel.org/rppt/h/kho/v4
> > >
> > >
> > > Kexec today considers itself purely a boot loader: When we enter the =
new
> > > kernel, any state the previous kernel left behind is irrelevant and t=
he
> > > new kernel reinitializes the system.
> > >
> > > However, there are use cases where this mode of operation is not what=
 we
> > > actually want. In virtualization hosts for example, we want to use ke=
xec
> > > to update the host kernel while virtual machine memory stays untouche=
d.
> > > When we add device assignment to the mix, we also need to ensure that
> > > IOMMU and VFIO states are untouched. If we add PCIe peer to peer DMA,=
 we
> > > need to do the same for the PCI subsystem. If we want to kexec while =
an
> > > SEV-SNP enabled virtual machine is running, we need to preserve the V=
M
> > > context pages and physical memory. See "pkernfs: Persisting guest mem=
ory
> > > and kernel/device state safely across kexec" Linux Plumbers
> > > Conference 2023 presentation for details:
> > >
> > >   https://lpc.events/event/17/contributions/1485/
> > >
> > > To start us on the journey to support all the use cases above, this p=
atch
> > > implements basic infrastructure to allow hand over of kernel state ac=
ross
> > > kexec (Kexec HandOver, aka KHO). As a really simple example target, w=
e use
> > > memblock's reserve_mem.
> > > With this patch set applied, memory that was reserved using "reserve_=
mem"
> > > command line options remains intact after kexec and it is guaranteed =
to
> > > reside at the same physical address.
> >
> > Nice work!
> >
> > One concern there is that using memblock to reserve memory as crashkern=
el=3D
> > is not flexible. I worked on kdump years ago and one of the biggest pai=
ns
> > of kdump is how much memory should be reserved with crashkernel=3D. And
> > it is still a pain today.
> >
> > If we reserve more, that would mean more waste for the 1st kernel. If w=
e
> > reserve less, that would induce more OOM for the 2nd kernel.
> >
> > I'd suggest considering using CMA, where the "reserved" memory can be
> > still reusable for other purposes, just that pages can be migrated out =
of this
> > reserved region on demand, that is, when loading a kexec kernel. Of cou=
rse,
> > we need to make sure they are not reused by what you want to preserve h=
ere,
> > e.g., IOMMU. So you might need additional work to make it work, but sti=
ll I
> > believe this is the right direction.
>
> This is exactly what scratch memory is used for. Unlike crashkernel=3D,
> the entire scratch area is available to user applications as CMA, as
> we know that no kernel-reserved memory will come from that area. This
> doesn't work for crashkernel=3D, because in some cases, the user pages
> might also need to be preserved in the crash dump. However, if user
> pages are going to be discarded from the crash dump (as is done 99% of
> the time), then it is better to also make it use CMA or ZONE_MOVABLE
> and use only the memory occupied by the crash kernel and do not waste
> any memory at all. We have an internal patch at Google that does this,
> and I think it would be a good improvement for the upstream kernel to
> carry as well.

Good to know CMA is already used, I could not tell from the cover letter.

The case that user-space pages need to be preserved is for scenarios like
RDMA which pins user-space pages for DMA transfer. Since the goal here
is also to preserve hardware states like RDMA's I guess the same concern
remains.

Thanks!
