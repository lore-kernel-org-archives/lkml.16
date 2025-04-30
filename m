Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374AD2620F1
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 15:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746028744; cv=none; b=pMI2dILu3hIMKqQrHhUrbAGd7QIwA5PshF3mhWsQVMvFEHzjJ6WWUjQvaXjhW/wN6mMQ4Hy8CB0MKysx8BNTA7NcqckOdoU/VOgNwou9c1rqeOAZVYE9c5VsmGcJoCCaIt8zy18zu5aEpQJixV5tQn48s4TIMRtHq95SnjvO7gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746028744; c=relaxed/simple;
	bh=cgmdNn6FUxX0htn73GrEa/J+UxnbhR5h0g7mD2ownLU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=doyMjyKb+SjansNPIyTm7I/O33eQgzSQWji12l6vyoP6n3x1DE772PCxiOG49PpL9618QbNjKLItPgLsmzS+Shfo+i9Jj5cCmundDl1jKoWiJTL4B9YngMDxLE78DfsZ1wVwgQ6GZHuDUx6+DtWXEv/Fs+nSKrr4laZ6bDPzQhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MuQgOg7n; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MuQgOg7n"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff6aaa18e8so45836a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746028742; x=1746633542; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8DSp/U3Zuc4Ubu3lCujB3LGSSziOdcYloj3ckCB3HXY=;
        b=MuQgOg7nJydbDOstDWUY1OMA0RX9UBlSukE7rTq7kYpFphJveFp72nhFMPAwvgGiCt
         4RPBifkADVsN3fNdqSE52bQBgD3lUKwCndXOcVe17FB5a90JTfCfM9s6qp0T1Cv2XnlA
         ug41mCLyPZaz0EZVtrNFCD4JqCXfBnSfEi3O3+6bS6OTTj9qHk6J+WBKuv3UfQQWgXIz
         gHP+38bojcDIN9C1VlJ7eyh7MO3fJbqxNan3Wm5axB/IlpsIsLvBZuSXnWuQ+t0h9oHN
         T5Ez8tIz2eQ6v9tsp6o1eX3fm8T6hZi3MwBun5aku8XtGgBGQnvOICmyWDks58eogxh7
         dv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746028742; x=1746633542;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8DSp/U3Zuc4Ubu3lCujB3LGSSziOdcYloj3ckCB3HXY=;
        b=iRhDIzVMGsvOkrNfOmIRmEXQirdOl3UKmeupbCZtT01hheOsZlcqZ4lgKvWSPMA6I5
         RyarxNrAlMXIN8OyZue/I1MFMZeHZY3IyTLloN43UVeH+YqZXOYgNAM3FNGqnPQJ8LMJ
         rCTfd0pvm2k79hTfxToatOSItWhj9XpUBOkX25FS4Lu+241fxmyuGM0XuermAuA/AhTS
         Fz8XqN+IA6bHjIu7d3NxlO7RIo/Rg4h4QWNaysV6Ke8swFYRyuJB9l6V1YKn73os3SsJ
         5B5Xx4yJmrxa94XkOVBAa3ZsY5NCYkqSHw+PfAYoETcu3CRp+fv7i/Z+OVEcz7Y5TwM0
         Uzsg==
X-Forwarded-Encrypted: i=1; AJvYcCU1M9PQUrdsdvLqWk7y59oGmInTRsHRyMTq7Fo+z0NYxavktbC7NMfTsbcF0Kt6liNdRiT0K/KYBMQH/OA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfM03CkOdmyhm8+ib4wcpt3mW8w7dWVBxqaOeuE2QAHtDWDyrO
	bNGuN7YSs4pZc3XLO0i4cdZDBZQ01DOT6FarT2WxtRu9XixC6EUuqOFr3XCjsABmMaIo0RtjuwY
	bBg==
X-Google-Smtp-Source: AGHT+IH7Loe3yBsdJbgPro+qKKP/pCBpNyXxJNx3TLDEJWLtaRWnOwM722RyEO1qOlSWQ3fwqgYFfjmRQ/M=
X-Received: from pjvb12.prod.google.com ([2002:a17:90a:d88c:b0:2f8:49ad:406c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3cc8:b0:2fe:b470:dde4
 with SMTP id 98e67ed59e1d1-30a332f2c30mr6844147a91.12.1746028742479; Wed, 30
 Apr 2025 08:59:02 -0700 (PDT)
Date: Wed, 30 Apr 2025 08:59:00 -0700
In-Reply-To: <20250430084852.GN4198@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250429150638.1446781-1-carlos.bilbao@kernel.org>
 <20250429133941.063544bb4731df0ef802440c@linux-foundation.org>
 <20250429210650.GD4439@noisy.programming.kicks-ass.net> <433c6561-353e-4752-b9cf-155e49e62e63@vt.edu>
 <20250429221049.GG4439@noisy.programming.kicks-ass.net> <94faa778-38d5-4ea5-aa0d-9259b56999a4@vt.edu>
 <20250430084852.GN4198@noisy.programming.kicks-ass.net>
Message-ID: <aBJIxJ-2Lfke1MGq@google.com>
Subject: Re: [PATCH v3 0/2] Reduce CPU consumption after panic
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Carlos Bilbao <bilbao@vt.edu>, Andrew Morton <akpm@linux-foundation.org>, carlos.bilbao@kernel.org, 
	tglx@linutronix.de, jan.glauber@gmail.com, pmladek@suse.com, 
	jani.nikula@intel.com, linux-kernel@vger.kernel.org, 
	gregkh@linuxfoundation.org, takakura@valinux.co.jp, john.ogness@linutronix.de, 
	x86@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025, Peter Zijlstra wrote:
> All that said... the default more or less does for(;;) { mdelay(100) },
> if you have a modern chip that should not end up using much power at
> all. That should end up in delay_halt_tpause() or delay_halt_mwaitx()
> (depending on you being on Intel or AMD). And spend most its time in
> deep idle states.
>=20
> Is something not working?

The motivation is to coerce vCPUs into yielding the physical CPU so that a
different vCPU can be scheduled in when the host is oversubscribed.  IMO, t=
hat's
firmly a "host" problem to solve, where the solution might involve educatin=
g
customers for their own benefit[*].

I am indifferent as to whether or not the kernels halts during panic(), my
suggestions/feedback in earlier versions were purely to not make any behavi=
or
specific to VMs.  I.e. I am strongly opposed to implementing behavior that =
kicks
in only when running as a guest.

[*] from https://lore.kernel.org/all/Z_lDzyXJ8JKqOyzs@google.com:

 : On Fri, Apr 11, 2025 at 9:31=E2=80=AFAM Sean Christopherson <seanjc@goog=
le.com> wrote:
 : > > On Wed 2025-03-26 10:12:03, carlos.bilbao@kernel.org wrote:
 : > > > After handling a panic, the kernel enters a busy-wait loop, unnece=
ssarily
 : > > > consuming CPU and potentially impacting other workloads including =
other
 : > > > guest VMs in the case of virtualized setups.
 : >
 : > Impacting other guests isn't the guest kernel's problem. =C2=A0If the =
host has heavily
 : > overcommited CPUs and can't meet SLOs because VMs are panicking and no=
t rebooting,
 : > that's a host problem.
 : >
 : > This could become a customer problem if they're getting billed based o=
n CPU usage,
 : > but I don't know that simply doing HLT is the best solution. =C2=A0E.g=
. advising the
 : > customer to configure their kernels to kexec into a kdump kernel or to=
 reboot
 : > on panic, seems like it would provide a better overall experience for =
most.
 : >
 : > QEMU (assuming y'all use QEMU) also supports a pvpanic device, so unle=
ss the VM
 : > and/or customer is using a funky setup, the host should already know t=
he guest
 : > has panicked. =C2=A0At that point, the host can make appropiate schedu=
ling decisions,
 : > e.g. userspace can simply stop running the VM after a certain timeout,=
 throttle
 : > it, jail it, etc.
