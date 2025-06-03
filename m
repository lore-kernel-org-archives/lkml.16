Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE82946F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 01:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748915304; cv=none; b=a1smwDhQAAZ86wj69hsTn/TAXYTcVKEf6e14lDNrabHKoegrL8+AclQ+SXRBeqC5xvNHtlnPLioajsFhaFyGxvq2ZUT+d1zPf1I5p4bYpyTs97sSk4aiSzziPNxckOUG0UP8PHsz8AamPI+kacq4n9doo7xfeUNzUKTv3FEBZIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748915304; c=relaxed/simple;
	bh=zsNJJX1jJoWSC36VMv4Ppa5QB3krmJthNE6p+YJW0+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PLp6PXZX349GNzniQcKu25iVT8VmDGRIjm9t8mRtM+QLkOYv5JwuLFlNxaSPoP0oXgTyMmuJ4cKHRifdVYL0I6ltG5MDGiEqQzL+5Os/rpj4xMWiX0UGdsreqvcpHEJ44T5/amOjc8AExt5pdLF0rdFU3E5GpyGjsHTY1GJBzOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=YfEU+q1N; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="YfEU+q1N"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-86d2d9effe0so212705239f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 18:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1748915302; x=1749520102; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=smS8EjzcSloRPTQYvaADW34JGEeBewBx/Qxmpo51PM0=;
        b=YfEU+q1NfFpgQozLLIxqMBBNSfAuy8565eswIflP0Lstkd1E7hPIba0iIQW0BxWPD0
         LyMCdNmiFqGqkOALmxVGxw/hOVPGaJ28YEI+4ah4C0uKzyryHG5oRFmBfUvVwzQCYBp7
         YhOEAqu1Zt3Z0O59Jqhayll4PV7MsClUAsQstq24bgSCJ8mogFT7Z7M/f3kuRrSRYyum
         57Lxs3Ga+45Ddvya5+9N32J/+KlwuQP2gpRtLflSkjdEn+TeLK5rJQzOi/UR4vhEKY9B
         v4XBBFb7k2D+yyZQXLuFfe5A7vwTj9nHoMzOF0rDxOft5G5EmCOphHokqFOgtYj/10kU
         kqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748915302; x=1749520102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=smS8EjzcSloRPTQYvaADW34JGEeBewBx/Qxmpo51PM0=;
        b=RNxSxno/2EHYgYFe9C8iFWceIfL0N1YS7NN1g4LRNpUIAixvuqvJw2y1HHoMGmdPVV
         gUrqPBWehWRtAHlBims/0pnMpEdUBGG1p4pgVagaHkBSZSiPRScjo74bEDJIOhIiyJoT
         /neS1SkGFl1966Buk6kdt2CVV+XW6Rejh3WIzz3H50MgLGKVF+FISv4d9p8q6gYdsgRW
         8UM2Pb3cHrUS7FrgtK+hO8EQFdBjhjVrkiWTLM2EiWekOA8ZmrMxYT6MJEJNE7Nljib2
         9NnUEY3dfAnOL+sn/gfJhvTl1jmp2dj84V0r4IQb1FzTpNvCurd9YkxA7HTh7Y3z0D1n
         bpgQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9sKQB3fYRLRld0ctiraNGegohlE6FietskYGqMEpRjVtGKHRxc9EKybNKtgq6VkEnfnoafT9UUI74Bx8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfr8aZTFQuYSmWoLRQjLIsCyFLzw9G0Pn1S8RyU1mEAE8JRprC
	caJARbmyVsn2heSBG9YqXQ0DqOwbLCU2xDJOxp3yEZzQGGcNhREIJNzd2zArWOm6CkUYUwDd9/U
	cjXUyLfl9gEwOOJ3u4Dg8zP80H4EU9F6nRMzR/PDMCg==
X-Gm-Gg: ASbGnctaIDK7fTECf4zQUtYWAQ05VT43UcptQ0PGM6XyTe1G0rvuFYUYVvDty8pY9G4
	R7cL/ucI97vm3gQXewWYpjx4vpUAGqA9QE+iTo6OdNVgrm6uuggvo/V8VEjWJWJPZ/wCMTZs4/X
	PuWc/he1ud5tcktaldPxEBUUQjWv1eZ2itV6CmHRZBufUfNw==
X-Google-Smtp-Source: AGHT+IFuF/DDjoIRyOOg6n9S1MKOJe4FFEYA3jligAcELhRoJ6MxOU7E4D0SYHCcB1pFVLyWGxF3fvY4DpN/lsFVfjA=
X-Received: by 2002:a05:6602:4c85:b0:85a:e279:1ed6 with SMTP id
 ca18e2360f4ac-86d000fdd75mr1579564939f.11.1748915301709; Mon, 02 Jun 2025
 18:48:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250314092614.27372-1-zong.li@sifive.com> <aD3WKnyp_ffk60oF@debug.ba.rivosinc.com>
In-Reply-To: <aD3WKnyp_ffk60oF@debug.ba.rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 3 Jun 2025 09:48:08 +0800
X-Gm-Features: AX0GCFs480sGOOGNrguQ_lvoEsdO09nxDNbdUj7rtRkPH6awWaFU0LfDZJKnIyY
Message-ID: <CANXhq0r8DeksFQC2ht8jeLpfn-0Tvuy4LU52BOMAj-AAB83+5A@mail.gmail.com>
Subject: Re: [PATCH] riscv: traps: handle uprobe event in software-check exception
To: Deepak Gupta <debug@rivosinc.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 12:50=E2=80=AFAM Deepak Gupta <debug@rivosinc.com> w=
rote:
>
> Hi Zong,
>
> Thanks for taking the initiative for making cfi work with uprobe.
> And sorry for not noticing the patch earlier.
> Few comments inline.
>
>
> On Fri, Mar 14, 2025 at 05:26:14PM +0800, Zong Li wrote:
> >Handle the uprobe event first before handling the CFI violation in
> >software-check exception handler. Because when the landing pad is
> >activated, if the uprobe point is set at the lpad instruction at
> >the beginning of a function, the system triggers a software-check
> >exception instead of an ebreak exception due to the exception
> >priority, then uprobe can't work successfully.
> >
> >Co-developed-by: Deepak Gupta <debug@rivosinc.com>
> >Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> >Signed-off-by: Zong Li <zong.li@sifive.com>
> >---
> >
> >This patch is based on top of the following series
> >[PATCH v11 00/27] riscv control-flow integrity for usermode
> >
> > arch/riscv/kernel/traps.c | 9 ++++++---
> > 1 file changed, 6 insertions(+), 3 deletions(-)
> >
> >diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> >index 3f7709f4595a..ef5a92111ee1 100644
> >--- a/arch/riscv/kernel/traps.c
> >+++ b/arch/riscv/kernel/traps.c
> >@@ -386,9 +386,12 @@ asmlinkage __visible __trap_section void do_trap_so=
ftware_check(struct pt_regs *
> >       if (user_mode(regs)) {
> >               irqentry_enter_from_user_mode(regs);
> >
> >-              /* not a cfi violation, then merge into flow of unknown t=
rap handler */
> >-              if (!handle_user_cfi_violation(regs))
> >-                      do_trap_unknown(regs);
> >+              /* handle uprobe event frist */
> >+              if (!probe_breakpoint_handler(regs)) {
>
> If task has uprobe enabled and there is a cfi violation due to mismatch i=
n
> return address on shadow stack and regular stack, then it would be a cfi
> bypass, right?
> Perhaps we should be doing this only when we match that sw check exceptio=
n
> is due to forward cfi violation?
>
> Do you agree?

Yes, let me add a condition for forward cfi violation here. Thanks for
pointing it out.

>
> >+                      /* not a cfi violation, then merge into flow of u=
nknown trap handler */
> >+                      if (!handle_user_cfi_violation(regs))
> >+                              do_trap_unknown(regs);
> >+              }
> >
> >               irqentry_exit_to_user_mode(regs);
> >       } else {
> >--
> >2.17.1
> >
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
