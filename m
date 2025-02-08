Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C0F243362;
	Sat,  8 Feb 2025 23:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739057968; cv=none; b=Yphk/wPudCypzkjoXVSvU5TROoIyP64XV12jNIYhBLZuUdQYxaF40Bw/VMa0ZVi0KPk9r/e0eTiZxh9NYoezDyCTo+GeV4SpdOeUBeQ5D7zuTQKgWnRYCD0fvwLz3DOukMX+m20yZ4YUQR8m9Z614blHT0k5jfu7eOMHgHYASME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739057968; c=relaxed/simple;
	bh=2dVVtcLNPSUA6MeLpL203ddCM/waOY8DSh4WRZBT3L8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b1qcoOp3Egh2aKwt/VWz0UqYSanxIvE6UoKcNJdc+lqaXxaTI3IOPyvlhpSMH/DbjUMK4T3jZ+rMiUq5/hMAdIK8E6KVPm2A9ua+KjjOGPVZQN38j/VwbZshvoDtHA6YjeJhBAmwH72vkYoV73kcBAfTpwn5OhMg1xvMyBqUdm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFZSLWZq; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFZSLWZq"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86707fe3eccso1226618241.0;
        Sat, 08 Feb 2025 15:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739057965; x=1739662765; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLLi9zQ99OQKa4jeeM1uEjERWUaiY/XgjD2LAy4mnqo=;
        b=IFZSLWZq3IoHH4BgHOMrj+mG8q5j0DEZbgLcKUA2ohKYzTdDgvQiy7ex1f4dQxZ6aL
         QZ/CsVUZEzQEH8Y4GuAlAFEDAW4wdFSgdRFrIXxUl3gcJVpIcws/iUTm1RnHtnAaoOsy
         OgRfx2dAleQJbrDYQXdHUjOZGP0Dxf1juJfcybZSDn8j66tLE+JgE8Tvfgpv86GLw/OL
         zBW6i3WBZAcVWyui6dEmzu4DXljl4zAp4KEnVLGMFmlYbAG2KFnS8E8uS1OyMKvZiIqE
         7VNUL7p+otgbzlgP7JTpU9j93gBQhi9DdWjMMrTdWdutgiJ7/sTkrVzLEQADgJtVKVPu
         iLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739057965; x=1739662765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLLi9zQ99OQKa4jeeM1uEjERWUaiY/XgjD2LAy4mnqo=;
        b=gDKvQKHUvCqXZ+evZZSmzS8ufTW9SY/AdU4FpT+/esySEsksz+yV2prtv3KUEA3cpz
         G/HLWBAFCMh7wIwGemlv0XlzOMqL3aHogu+JRAgfr8v7zyX5rD1aN+wooJkW5y3BzB5M
         DaUxntCEbqZoyiH5NZdQXBCeQ19rVeocssKmY1VMPeiHSAUucSwHw57OqLITOLs1eruH
         t9ofTGUhTt65omGsdBUEhe0x6KtXgtBJR1cCJeG+zM7F7MnDK6wzFWfUX0FdKds6Cxy6
         +7I5Gt1COPVXCGUCQdDDNNOle8h/x5TrxgdWStY/Z/0xJ7VF1o7YRYzI2pwVxyvugPvT
         lOfA==
X-Forwarded-Encrypted: i=1; AJvYcCULkiURm1vlBk0kOSVtLSMG3zBEQhCBq7Uh3mR7PeXbYqpiCrbB+r8IiKgehOeotkyeJ5Xgk5KV9GNz@vger.kernel.org, AJvYcCWhXMJxDVc9p4dWXBNr/zUY7c0TznlZdM1AnyBiN8+XkUNKwfD4yvZOneRbhN7BKE+dsK4k7KBjAJro@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4Dnk2cawJjmIKHb9lx1D/jQUdTMuwCjILvlwdlPrrlV4R9ycy
	4kfWjXV1Uuj/P5/YTDgRLhKtrSgjYnt8RBYiaaQGOVaiFxukmmuetXIqYvgx2Oa3uUiXnjSXbZ/
	yXaO97XaBHc/WOMYYTNjeFVz4G/k=
X-Gm-Gg: ASbGncv6rGQC4Tq8095X4HdGu5+O9zLLafxNB6Zp16dvO07FlP5hWarBQIMJ6FJTc7T
	qzx0ghaoPNmRLecfsJucJLjzq3nfpo7kfzbqUrg1jIuIackdyeyR0n0p1z3O+JEan9lxb5yFGsh
	lps1gs0TrdQp8jJqpiiyWMTxKh9fBnbw==
X-Google-Smtp-Source: AGHT+IHmuA9yI8oIa2KsmkgQWv2DRmFgZtiHlP+mcm3z0bsdHAAi0IXmrnafXkrbEDLixwCrvDHR7uvtSxfCF6dSkfY=
X-Received: by 2002:a05:6102:548a:b0:4b3:fee3:2820 with SMTP id
 ada2fe7eead31-4ba8714179fmr4328252137.9.1739057965418; Sat, 08 Feb 2025
 15:39:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206132754.2596694-1-rppt@kernel.org>
In-Reply-To: <20250206132754.2596694-1-rppt@kernel.org>
From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Sat, 8 Feb 2025 15:39:14 -0800
X-Gm-Features: AWEUYZmi8qx_aJGxEbGM8RQjVoiD2zsmGiS4HbL5u3CyG-yT-ostr9_GwuABT9M
Message-ID: <CAM_iQpU9DDg2Oi33_dfPqVpd9j_2O+WD7ovo__f48BA9DztwXQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/14] kexec: introduce Kexec HandOver (KHO)
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexander Graf <graf@amazon.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Andy Lutomirski <luto@kernel.org>, 
	Anthony Yznaga <anthony.yznaga@oracle.com>, Arnd Bergmann <arnd@arndb.de>, 
	Ashish Kalra <ashish.kalra@amd.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Woodhouse <dwmw2@infradead.org>, 
	Eric Biederman <ebiederm@xmission.com>, Ingo Molnar <mingo@redhat.com>, 
	James Gowans <jgowans@amazon.com>, Jonathan Corbet <corbet@lwn.net>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Pratyush Yadav <ptyadav@amazon.de>, 
	Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, 
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Usama Arif <usama.arif@bytedance.com>, Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Thu, Feb 6, 2025 at 5:28=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wrot=
e:
>
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Hi,
>
> This a next version of Alex's "kexec: Allow preservation of ftrace buffer=
s"
> series (https://lore.kernel.org/all/20240117144704.602-1-graf@amazon.com)=
,
> just to make things simpler instead of ftrace we decided to preserve
> "reserve_mem" regions.
>
> The patches are also available in git:
> https://git.kernel.org/rppt/h/kho/v4
>
>
> Kexec today considers itself purely a boot loader: When we enter the new
> kernel, any state the previous kernel left behind is irrelevant and the
> new kernel reinitializes the system.
>
> However, there are use cases where this mode of operation is not what we
> actually want. In virtualization hosts for example, we want to use kexec
> to update the host kernel while virtual machine memory stays untouched.
> When we add device assignment to the mix, we also need to ensure that
> IOMMU and VFIO states are untouched. If we add PCIe peer to peer DMA, we
> need to do the same for the PCI subsystem. If we want to kexec while an
> SEV-SNP enabled virtual machine is running, we need to preserve the VM
> context pages and physical memory. See "pkernfs: Persisting guest memory
> and kernel/device state safely across kexec" Linux Plumbers
> Conference 2023 presentation for details:
>
>   https://lpc.events/event/17/contributions/1485/
>
> To start us on the journey to support all the use cases above, this patch
> implements basic infrastructure to allow hand over of kernel state across
> kexec (Kexec HandOver, aka KHO). As a really simple example target, we us=
e
> memblock's reserve_mem.
> With this patch set applied, memory that was reserved using "reserve_mem"
> command line options remains intact after kexec and it is guaranteed to
> reside at the same physical address.

Nice work!

One concern there is that using memblock to reserve memory as crashkernel=
=3D
is not flexible. I worked on kdump years ago and one of the biggest pains
of kdump is how much memory should be reserved with crashkernel=3D. And
it is still a pain today.

If we reserve more, that would mean more waste for the 1st kernel. If we
reserve less, that would induce more OOM for the 2nd kernel.

I'd suggest considering using CMA, where the "reserved" memory can be
still reusable for other purposes, just that pages can be migrated out of t=
his
reserved region on demand, that is, when loading a kexec kernel. Of course,
we need to make sure they are not reused by what you want to preserve here,
e.g., IOMMU. So you might need additional work to make it work, but still I
believe this is the right direction.

Just my two cents.

Thanks!
