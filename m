Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5A428C849
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 09:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749029905; cv=none; b=hFrs/pYWc8NfbSfYTZE1YkXxE7Z1QpyojsmE4hDCe2v1V0uCPx+JHEMJJJxlC/MyLneWjOMLSZ+q3LBUIQd2cdQ+7asfyTpqD5QHFQASSyBnzMFxLIVsQv4k8puxgG3cDLqMFfpU3voC439yF9zAb9diuWM6l7dhWJML58ZTPdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749029905; c=relaxed/simple;
	bh=jpnVSxC75EQ10vHXIZ0wGKgad+cQai+ufsPJbvoqCTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L17ENpD4cD0XZn66H7/onm5jkf3q4CTswCeUiPJBWnFyGXuBT+JpPPp0DMBZ/nvTr7aPpjaPT1veD6mdrq2v5sxPtbfehnddcpL4p7FN9xV9z7N8CTLIzIhs4XdIGlv4oLNS+XMyEHsFbLJ7quyrFLXEtrFpxboE3VjhQMYa5g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=F68IY2jo; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="F68IY2jo"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-8731c4ba046so58464439f.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 02:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1749029903; x=1749634703; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eOIWCXEE0RxznYIyh26beXHBZUfQdbelgMFfKBCSM8U=;
        b=F68IY2jog384+sE/HANp0y33QI1QLT8kxydaHCo9nDMAjbviDCpIIXHKoP5NMuJo06
         2jOgt2IVE5o6YmtIiyJMMtzgPZVMOEViTWCnwZrMu+6vwRZl9DtUly7L29vLxx1hZ/Yi
         GAEwjMjg43unoyOjA3Q+jur+XNj0w4JhuFQ+dCS3SklRXblaaAVgxahTfUZUz0h4RnnH
         oWkbVddjNKZMCFSsz9oj19aSv6ig/BhUVSj6ZHS4iZ7o44ZhQJHCUTmzIG0NT4aX3lZL
         fjLbpXqVoS53oN4UR+zyJD6VTopxoHQDly30WeEZxsh5FlKDScoRw2idmANL/IRLYpD7
         rxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749029903; x=1749634703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eOIWCXEE0RxznYIyh26beXHBZUfQdbelgMFfKBCSM8U=;
        b=hrnUbda9eiUwHx5DcSHI5ovqtk5SXwLa2rigFoxBXD1CfX9m3i3tzZ3ODCLGPxO3r5
         zb4KXEaXnTg0AoU1rs9Ko6Ufu0tGfIoii0cYAgmPnrgGoiWUZhPRhjF98HLZ9qTt0l8M
         8cG7/B5R+45kbpojSFZkZNQkj3jCb6ZU6lgjpnQTABhQYTbxaZjyRRe7GpbKr4ATW/pS
         oEvq2kUv9y+B6nvd0RpaAQbhp4Sc0yDeDZLvR/s2NKnrZeZhmSnVJZ3krxqHKQwY5Lvv
         U42Zc/qakMGTo2M99yKAF7+RBOOJscvT2voT9YyrUiKWSlICOgB5H1xLJk3/e8SdgeND
         96og==
X-Forwarded-Encrypted: i=1; AJvYcCXD6LPOzTWbWL3vIwd7KQz/vs3ynWyk3QCP3eQwbV4RCrhAdmSdpv1wpmGNbJBwWCmiCBOIxSQmvbGWfBA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9J4L7KLQzZSJ3WVgGlj7PDVnjehRVsVroIbeLYIYXV7EvCpcT
	r07EtkDa25L98kBsUG2Q9Qc9zSa0J9el5geqNvlxESNtYsATbQIKlUyVIYDZEkbjTgu+aFMyE3F
	0PE9urGY8yxYUParnRDQNbxYUH0309IxddvmVShHQrg==
X-Gm-Gg: ASbGnctUtWqaIUvzrmQ64es8KEYsF2HEJvu4u92EN8xfbzfX3EzuFeE7HwynfkcqnaJ
	Nda8wFH74YY+cA0pqMgPuDgQxMdptCbNKnnuUgukpde4FavyqbgPf9/BpEx/FJY9a3Cugzc1iDn
	uxgqL6Rgie/W23bn6QzLZHsJdFymD5ib/YXKPMGXjDmGKUqQ==
X-Google-Smtp-Source: AGHT+IG8vOXK+h+y2p/PdmXHtYUOgTT0CvnkZ6qhAFOmZ6ZirSdzqcS/OrgftpiwqYuby9tRcEPX+da9XrFykmbetkg=
X-Received: by 2002:a05:6e02:1c29:b0:3dc:87c7:a5b9 with SMTP id
 e9e14a558f8ab-3ddbededa44mr20700675ab.10.1749029902722; Wed, 04 Jun 2025
 02:38:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250314092614.27372-1-zong.li@sifive.com> <aD3WKnyp_ffk60oF@debug.ba.rivosinc.com>
 <CANXhq0r8DeksFQC2ht8jeLpfn-0Tvuy4LU52BOMAj-AAB83+5A@mail.gmail.com> <aD-cE9IGrV6nOUjX@debug.ba.rivosinc.com>
In-Reply-To: <aD-cE9IGrV6nOUjX@debug.ba.rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Wed, 4 Jun 2025 17:38:11 +0800
X-Gm-Features: AX0GCFv8-KLRNyJz3iFIGgmal8-qIs3VXEvUr1UzUc56Y1s2sLF1iT12dkOeEaE
Message-ID: <CANXhq0pATf+gOHLbft5bo5GxoD9xKBfq=NA4t3o_2M=0DeKWEA@mail.gmail.com>
Subject: Re: [PATCH] riscv: traps: handle uprobe event in software-check exception
To: Deepak Gupta <debug@rivosinc.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 9:06=E2=80=AFAM Deepak Gupta <debug@rivosinc.com> wr=
ote:
>
> On Tue, Jun 03, 2025 at 09:48:08AM +0800, Zong Li wrote:
> >On Tue, Jun 3, 2025 at 12:50=E2=80=AFAM Deepak Gupta <debug@rivosinc.com=
> wrote:
> >>
> >> Hi Zong,
> >>
> >> Thanks for taking the initiative for making cfi work with uprobe.
> >> And sorry for not noticing the patch earlier.
> >> Few comments inline.
> >>
> >>
> >> On Fri, Mar 14, 2025 at 05:26:14PM +0800, Zong Li wrote:
> >> >Handle the uprobe event first before handling the CFI violation in
> >> >software-check exception handler. Because when the landing pad is
> >> >activated, if the uprobe point is set at the lpad instruction at
> >> >the beginning of a function, the system triggers a software-check
> >> >exception instead of an ebreak exception due to the exception
> >> >priority, then uprobe can't work successfully.
> >> >
> >> >Co-developed-by: Deepak Gupta <debug@rivosinc.com>
> >> >Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> >> >Signed-off-by: Zong Li <zong.li@sifive.com>
> >> >---
> >> >
> >> >This patch is based on top of the following series
> >> >[PATCH v11 00/27] riscv control-flow integrity for usermode
> >> >
> >> > arch/riscv/kernel/traps.c | 9 ++++++---
> >> > 1 file changed, 6 insertions(+), 3 deletions(-)
> >> >
> >> >diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> >> >index 3f7709f4595a..ef5a92111ee1 100644
> >> >--- a/arch/riscv/kernel/traps.c
> >> >+++ b/arch/riscv/kernel/traps.c
> >> >@@ -386,9 +386,12 @@ asmlinkage __visible __trap_section void do_trap=
_software_check(struct pt_regs *
> >> >       if (user_mode(regs)) {
> >> >               irqentry_enter_from_user_mode(regs);
> >> >
> >> >-              /* not a cfi violation, then merge into flow of unknow=
n trap handler */
> >> >-              if (!handle_user_cfi_violation(regs))
> >> >-                      do_trap_unknown(regs);
> >> >+              /* handle uprobe event frist */
> >> >+              if (!probe_breakpoint_handler(regs)) {
> >>
> >> If task has uprobe enabled and there is a cfi violation due to mismatc=
h in
> >> return address on shadow stack and regular stack, then it would be a c=
fi
> >> bypass, right?
> >> Perhaps we should be doing this only when we match that sw check excep=
tion
> >> is due to forward cfi violation?
> >>
> >> Do you agree?
> >
> >Yes, let me add a condition for forward cfi violation here. Thanks for
> >pointing it out.
>
> Cool, I'll send out another revision for my cfi series this week.
> If you send out your uprobe fix, I can include it in my patchset.

Hi Deepak,
I have submitted the v2 patch. Please let me know if further
modifications are required. Thanks
https://lists.infradead.org/pipermail/linux-riscv/2025-June/071483.html

>
> >
> >>
> >> >+                      /* not a cfi violation, then merge into flow o=
f unknown trap handler */
> >> >+                      if (!handle_user_cfi_violation(regs))
> >> >+                              do_trap_unknown(regs);
> >> >+              }
> >> >
> >> >               irqentry_exit_to_user_mode(regs);
> >> >       } else {
> >> >--
> >> >2.17.1
> >> >
> >>
> >> _______________________________________________
> >> linux-riscv mailing list
> >> linux-riscv@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-riscv
