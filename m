Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C226296168
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 23:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745624900; cv=none; b=gEfiZpvxDS6FjO4dCMkpo699q9fcY3Datuw5SWiC82oPBgOd/BXJ2mpejmXZ6KTdwi7TR12skDENozG+lIZubJKTYiceno7GfChyjmNA4p9H9dZUlifUmUK7ZlOPy8GYjsCPLNIUNKQmYlR6aF8vNnrerLhYWXTMO0bXwoyCP+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745624900; c=relaxed/simple;
	bh=rcwF2few5buON5TeOGJAeun8dgRx2Lc2YvNg/juyAHg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Td2hYmQM/PoDFBJxNJ0iuyuGaFLFAqBHUkEQIP1UCX9FKBlZaE5r+a+gzpFnyvp2VFPf8AS70iD/LkxmZRR9ABHPL/DQVf8f6AMDw/63FPsdZ4v4nZH9lz5/40cTCUPcNrr5s2FLL6l6ZujttVoQ0jxt1BTwlF/YUBaZbz7iykY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wGazmbqX; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wGazmbqX"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-30828f9af10so4966700a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 16:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745624898; x=1746229698; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I/x8iC+HcuQnN1vsmJzMK0s2/hjQW7GH3MOf75CWrrM=;
        b=wGazmbqXOEqDr749sBivdlPi1++6zNZI9dDWck3Tze9maTEKd04V7/O86fTvBJ1wdA
         9K76GpuU5YrcvpeIteZiOZJ9r5BHWRNYgnf+MVcJAnZRuYBPg9VpNXlkD9TqzcAqrvwj
         H//BZlLOKRwSkvHHv+WIAubhpVDp3DZlQv6xYSLGCv2Wo3+iIeKTwtBaX3usoccQ5j2k
         /Ovs+MgQHokXdKpKibqpqxfQesfd9VXUfg4MZjPIa+FuHamqcaimMF/nlcKtyZ+Rs9qc
         099n8P5udqpE4l1jMtGyxJGiKa0Vba/mztfQaZF/t5Obx4hXxHMNykyipq8myHkxz0+E
         zTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745624898; x=1746229698;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I/x8iC+HcuQnN1vsmJzMK0s2/hjQW7GH3MOf75CWrrM=;
        b=FfP5qHDd1BYefvQbCZvfGCJEYRdhO+SVOarLGSPn7pj+Jo6GaKoxtgL8wLX0EfjVZX
         Cuzxsmk9aSLnbFEW7mwSyyDYD+Bo95IO+K9bTcnQqmPyGSbehGQpBT4whXwIt6wcuUxw
         ZcORt7HfT9nXQwoHTvkIvaBnayh4Xt/9Wrnz/Yh3E92pwU74MWWJoZm1FCTX0DLJMspZ
         74b/ZoK3+ZAw1D/1TnIPH3ftyisoM1ZmzaP2qkcbnL+D08gsJILKAWtaCuLVHJ8aDPzm
         15IqYwQqXEx1Bvrd0hiR4ofpqbGL+H1tfWTzajUCIJE6b2+s5ckaGr9kqmJWLHiqnSwp
         36bA==
X-Forwarded-Encrypted: i=1; AJvYcCWNL/h0PP7tTBRV3++xPYtqVhOG9mjbAUE2bQB8tr1v76cMoQmw1YO2uKsvZh9vKDE19G3U9NHfVBCMLiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNZEQLGkz6iV1LqPIY/n9B2L0c4F60+yVsfcDAlbivHGfIwuyN
	TSn5u8oGLBglLP3KkF/a+Z7ZLxT6XUlRrE/2AcBVzQREL3oNk13W4yMD3iaMGAZ/a1PqltB4Wt9
	/bA==
X-Google-Smtp-Source: AGHT+IFGWSAl0YF8xmQ0bkqFQwE3kUAYPuX6gbFCDm0JaFRr4jPu3Vx+zTClObJXZ7KBW0uBCZiCol26qfk=
X-Received: from pjbos15.prod.google.com ([2002:a17:90b:1ccf:b0:308:64af:7bb9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:586e:b0:305:2d27:7ca7
 with SMTP id 98e67ed59e1d1-30a0133b15fmr2060649a91.16.1745624897759; Fri, 25
 Apr 2025 16:48:17 -0700 (PDT)
Date: Fri, 25 Apr 2025 16:48:16 -0700
In-Reply-To: <4a4b1f18d585c7799e5262453e4cfa2cf47c3175.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250410072605.2358393-1-chao.gao@intel.com> <20250410072605.2358393-4-chao.gao@intel.com>
 <f53bea9b13bd8351dc9bba5e443d5e4f4934555d.camel@intel.com>
 <aAtG13wd35yMNahd@intel.com> <4a4b1f18d585c7799e5262453e4cfa2cf47c3175.camel@intel.com>
Message-ID: <aAwdQ759Y6V7SGhv@google.com>
Subject: Re: [PATCH v5 3/7] x86/fpu/xstate: Differentiate default features for
 host and guest FPUs
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: Chao Gao <chao.gao@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"ebiggers@google.com" <ebiggers@google.com>, Dave Hansen <dave.hansen@intel.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, Stanislav Spassov <stanspas@amazon.de>, 
	"levymitchell0@gmail.com" <levymitchell0@gmail.com>, 
	"samuel.holland@sifive.com" <samuel.holland@sifive.com>, Xin3 Li <xin3.li@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Weijiang Yang <weijiang.yang@intel.com>, 
	"mingo@redhat.com" <mingo@redhat.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "john.allen@amd.com" <john.allen@amd.com>, 
	"mlevitsk@redhat.com" <mlevitsk@redhat.com>, Chang Seok Bae <chang.seok.bae@intel.com>, 
	"vigbalas@amd.com" <vigbalas@amd.com>, "peterz@infradead.org" <peterz@infradead.org>, "hpa@zytor.com" <hpa@zytor.com>, 
	"bp@alien8.de" <bp@alien8.de>, 
	"aruna.ramakrishna@oracle.com" <aruna.ramakrishna@oracle.com>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025, Rick P Edgecombe wrote:
> On Fri, 2025-04-25 at 16:24 +0800, Chao Gao wrote:
> > >=20
> > > In the later patches, it doesn't seem to change the "user" parts. The=
se
> > > configurations end up controlling the default size and features that =
gets
> > > copied
> > > to userspace in KVM_SET_XSAVE. I guess today there is only one defaul=
t size
> > > and
> > > feature set for xstate copied to userspace.=C2=A0The suggestion from =
Chang was
> > > that
> > > it makes the code more readable, but it seems like it also breaks apa=
rt a
> > > unified concept for no functional benefit.
> >=20
> > In the future, the feature and size of the uABI buffer for guest FPUs m=
ay
> > differ from those of non-guest FPUs. Sean rejected the idea of
> > saving/restoring
> > CET_S xstate in KVM partly because:
> >=20
> > =C2=A0:Especially because another big negative is that not utilizing XS=
TATE bleeds
> > into
> > =C2=A0:KVM's ABI.=C2=A0 Userspace has to be told to manually save+resto=
re MSRs instead
> > of just
> > =C2=A0:letting KVM_{G,S}ET_XSAVE handle the state.
>=20
> Hmm, interesting. I guess there are two things.
> 1. Should CET_S be part of KVM_GET_XSAVE instead of via MSRs ioctls? It n=
ever
> was in the KVM CET patches.
> 2. A feature mask far away in the FPU code controls KVM's xsave ABI.
>=20
> For (1), does any userspace depend on their not being supervisor features=
? (i.e.
> tries to restore the guest FPU for emulation or something). There probabl=
y are
> some advantages to keeping supervisor features out of it, or at least a s=
eparate
> ioctl.

CET_S probably shouldn't be in XSAVE ABI, because that would technically le=
ak
kernel state to userspace for the non-KVM use case.  I assume the kernel ha=
s
bigger problems if CET_S is somehow tied to a userspace task.

For KVM, it's just the one MSR, and KVM needs to support save/restore of th=
at MSR
no matter what, so supporting it via XSAVE would be more work, a bit sketch=
y, and
create yet another way for userspace to do weird things when saving/restori=
ng vCPU
state.

> (2) is an existing problem. But if we think KVM should have its own
> feature set of bits for ABI purposes, it seems like maybe it should have =
some
> dedicated consideration.=20

Nah, don't bother.  The kernel needs to solve the exact same problems for t=
he
signal ABI, I don't see any reason to generate more work.  From a validatio=
n
coverage perspective, I see a lot of value in shared code.
