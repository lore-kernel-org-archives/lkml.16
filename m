Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0EF2F42;
	Wed, 29 Jan 2025 18:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738175544; cv=none; b=LqAWXVXp26Y2qxAXs/cyMYPov7Ovr5RranR3nKC6634q6w6PrTImjpaiVEd9axgbp8ZMLmcuxLMlIg8LMoTIqAtVmjrg2iY8j80/W18qo4ACivZxYJC7h+w45e0uqVY+N32jcKOfSkGeBulSeMbDe9kTLBSEdGIvcSi0c2rtbaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738175544; c=relaxed/simple;
	bh=K9A2ZzHW9aa0/ZLJzLddQaGMcaWSRibKtgMqTXiulZ0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ok+BLxydSPoB1OhYDABEr6RmDYHoYSnlHuKPlwARVnpbARHhN4tnfRnZzLx3OAFC++Nngq49vqGnPIeUjatfM382/Z357le5Nm8PQmcIuK2Q+qx3+1dUq6GYvA92ORFZcsYtKQxUTPBBo5gm1pxTWHwXQmwNPTkluXrswdmk3Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=Kf1tqT0R; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="Kf1tqT0R"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5FxketsI1/QAFICFVmiNh+XmasDvJJACrrNZ7xX79Ds=; t=1738175540; x=1738780340; 
	b=Kf1tqT0RVqyhbS8+9VMPwxM91tTFFby+jdxAprzY2TVH7NO5UyR1KQKMUdHxV7Ppv9am64xPHKH
	H1jGJX6gwZJhYzl8Hxp0FvXi/nX/bPqabTtthbiIM1LlFL/6sUcGbbrVMyGyWnaJWoOfeRKDiHPc7
	ToHKBOxfy/UqYYHu0E1jB+UvPpT1O9SZHbUeFs/cG8eH8C3fyTkw5sexjBmPAz4ghF5dzc/e/R9x8
	hjtgwEkn5Py1MM5NiIVNx+f8j7tvlVGwD9pqCeI8zM4hPqLlcmk9y7B3zsMcaF3t4ETrjKd/ilg/l
	IsVE5pXz8hkvD/wcR8q/xb6/VpQhKgpJxN+w==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1tdCrE-00000001Oj7-0YGz; Wed, 29 Jan 2025 19:32:12 +0100
Received: from p5dc55cec.dip0.t-ipconnect.de ([93.197.92.236] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1tdCrD-000000049rK-3gTf; Wed, 29 Jan 2025 19:32:12 +0100
Message-ID: <284bc1ed837f0994114534ae7e3d4f6cc0d64f4e.camel@physik.fu-berlin.de>
Subject: Re: [PATCH 1/4] alpha/uapi: do not expose kernel-only stack frame
 structures
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Ivan Kokshaysky <ink@unseen.parts>, Richard Henderson	
 <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, Oleg
 Nesterov	 <oleg@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, Arnd
 Bergmann	 <arnd@arndb.de>, "Paul E. McKenney" <paulmck@kernel.org>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Magnus Lindholm
 <linmag7@gmail.com>, 	linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 29 Jan 2025 19:32:11 +0100
In-Reply-To: <20250129094312.27399-2-ink@unseen.parts>
References: <20250129094312.27399-1-ink@unseen.parts>
	 <20250129094312.27399-2-ink@unseen.parts>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Ivan,

On Wed, 2025-01-29 at 10:43 +0100, Ivan Kokshaysky wrote:
> Parts of asm/ptrace.h went into UAPI with commit 96433f6ee490
> ("UAPI: (Scripted) Disintegrate arch/alpha/include/asm") back in 2012.
> At first glance it looked correct, as many other architectures expose
> 'struct pt_regs' for ptrace(2) PTRACE_GETREGS/PTRACE_SETREGS requests.
> On Alpha, however, these requests have never been implemented;
> 'struct pt_regs' describes internal kernel stack frame which has
> nothing to do with userspace. Same applies to 'struct switch_stack',
> as PTRACE_GETFPREG/PTRACE_SETFPREG are not implemented either.
>=20
> Move this stuff back into internal asm, where we can ajust it
> without causing a lot of confusion about possible UAPI breakage.
>=20
> Fixes: 96433f6ee490 ("UAPI: (Scripted) Disintegrate arch/alpha/include/as=
m")
> Signed-off-by: Ivan Kokshaysky <ink@unseen.parts>
> ---
>  arch/alpha/include/asm/ptrace.h      | 62 +++++++++++++++++++++++++-
>  arch/alpha/include/uapi/asm/ptrace.h | 66 +---------------------------
>  2 files changed, 62 insertions(+), 66 deletions(-)
>=20
> diff --git a/arch/alpha/include/asm/ptrace.h b/arch/alpha/include/asm/ptr=
ace.h
> index 3557ce64ed21..693d4c5b4dc7 100644
> --- a/arch/alpha/include/asm/ptrace.h
> +++ b/arch/alpha/include/asm/ptrace.h
> @@ -2,8 +2,68 @@
>  #ifndef _ASMAXP_PTRACE_H
>  #define _ASMAXP_PTRACE_H
> =20
> -#include <uapi/asm/ptrace.h>
> +/*
> + * This struct defines the way the registers are stored on the
> + * kernel stack during a system call or other kernel entry
> + *
> + * NOTE! I want to minimize the overhead of system calls, so this
> + * struct has as little information as possible. It does not have
> + *
> + *  - floating point regs: the kernel doesn't change those
> + *  - r9-15: saved by the C compiler
> + *
> + * This makes "fork()" and "exec()" a bit more complex, but should
> + * give us low system call latency.
> + */
> =20
> +struct pt_regs {
> +	unsigned long r0;
> +	unsigned long r1;
> +	unsigned long r2;
> +	unsigned long r3;
> +	unsigned long r4;
> +	unsigned long r5;
> +	unsigned long r6;
> +	unsigned long r7;
> +	unsigned long r8;
> +	unsigned long r19;
> +	unsigned long r20;
> +	unsigned long r21;
> +	unsigned long r22;
> +	unsigned long r23;
> +	unsigned long r24;
> +	unsigned long r25;
> +	unsigned long r26;
> +	unsigned long r27;
> +	unsigned long r28;
> +	unsigned long hae;
> +/* JRP - These are the values provided to a0-a2 by PALcode */
> +	unsigned long trap_a0;
> +	unsigned long trap_a1;
> +	unsigned long trap_a2;
> +/* These are saved by PAL-code: */
> +	unsigned long ps;
> +	unsigned long pc;
> +	unsigned long gp;
> +	unsigned long r16;
> +	unsigned long r17;
> +	unsigned long r18;
> +};
> +
> +/*
> + * This is the extended stack used by signal handlers and the context
> + * switcher: it's pushed after the normal "struct pt_regs".
> + */
> +struct switch_stack {
> +	unsigned long r9;
> +	unsigned long r10;
> +	unsigned long r11;
> +	unsigned long r12;
> +	unsigned long r13;
> +	unsigned long r14;
> +	unsigned long r15;
> +	unsigned long r26;
> +};
> =20
>  #define arch_has_single_step()		(1)
>  #define user_mode(regs) (((regs)->ps & 8) !=3D 0)
> diff --git a/arch/alpha/include/uapi/asm/ptrace.h b/arch/alpha/include/ua=
pi/asm/ptrace.h
> index 5ca45934fcbb..2c08d74deac5 100644
> --- a/arch/alpha/include/uapi/asm/ptrace.h
> +++ b/arch/alpha/include/uapi/asm/ptrace.h
> @@ -2,72 +2,8 @@
>  #ifndef _UAPI_ASMAXP_PTRACE_H
>  #define _UAPI_ASMAXP_PTRACE_H
> =20
> -
> -/*
> - * This struct defines the way the registers are stored on the
> - * kernel stack during a system call or other kernel entry
> - *
> - * NOTE! I want to minimize the overhead of system calls, so this
> - * struct has as little information as possible. It does not have
> - *
> - *  - floating point regs: the kernel doesn't change those
> - *  - r9-15: saved by the C compiler
> - *
> - * This makes "fork()" and "exec()" a bit more complex, but should
> - * give us low system call latency.
> - */
> -
> -struct pt_regs {
> -	unsigned long r0;
> -	unsigned long r1;
> -	unsigned long r2;
> -	unsigned long r3;
> -	unsigned long r4;
> -	unsigned long r5;
> -	unsigned long r6;
> -	unsigned long r7;
> -	unsigned long r8;
> -	unsigned long r19;
> -	unsigned long r20;
> -	unsigned long r21;
> -	unsigned long r22;
> -	unsigned long r23;
> -	unsigned long r24;
> -	unsigned long r25;
> -	unsigned long r26;
> -	unsigned long r27;
> -	unsigned long r28;
> -	unsigned long hae;
> -/* JRP - These are the values provided to a0-a2 by PALcode */
> -	unsigned long trap_a0;
> -	unsigned long trap_a1;
> -	unsigned long trap_a2;
> -/* These are saved by PAL-code: */
> -	unsigned long ps;
> -	unsigned long pc;
> -	unsigned long gp;
> -	unsigned long r16;
> -	unsigned long r17;
> -	unsigned long r18;
> -};
> -
>  /*
> - * This is the extended stack used by signal handlers and the context
> - * switcher: it's pushed after the normal "struct pt_regs".
> + * We have nothing to say to userspace.
>   */
> -struct switch_stack {
> -	unsigned long r9;
> -	unsigned long r10;
> -	unsigned long r11;
> -	unsigned long r12;
> -	unsigned long r13;
> -	unsigned long r14;
> -	unsigned long r15;
> -	unsigned long r26;
> -#ifndef __KERNEL__
> -	unsigned long fp[32];	/* fp[31] is fpcr */
> -#endif
> -};
> -
> =20
>  #endif /* _UAPI_ASMAXP_PTRACE_H */

This seems to break the build for the bpf tool on alpha:

In file included from libbpf.c:36:
/build/reproducible-path/linux-6.13~rc7/tools/include/uapi/linux/bpf_perf_e=
vent.h:14:28: error: field =E2=80=98regs=E2=80=99 has incomplete type
   14 |         bpf_user_pt_regs_t regs;
      |                            ^~~~

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
