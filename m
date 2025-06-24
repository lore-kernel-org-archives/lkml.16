Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB4127F4F5
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750756637; cv=none; b=TmtzplZFJOw9CHqUPhKS2VBhUU7EkymDGeChk0yoTli545bUic10BmDwMUTUfiTV1P5zpYODTqRPu9668PuWlXvtzSbDCm/cI1kQHXH/rarUzrGGZ80Yt5U74S0IYOniaJWlTdm+hOv2ihRCZsWAl2kHVV/qd9ypXaIPip+hIYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750756637; c=relaxed/simple;
	bh=/605AmhGbAfDeIETNYnNawRr46IUCgfjgXQHfhn4OgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gFcOIHxNFpjX2xv6g3FpM6GJb/+uRdgqZKKSQlzKJiS8TxqoXTWcV0bjehR08S5CGOvxKeyLZDj8heUoQuIIn2FOVvIIDbknoivpwsxJ7l2MO6zEr6XkmnRiBwVlrKEfxd40tl1mDQZJ4cOHLEiGHMNg6XwNgfDiX1a2SfnkHOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q/E1bzjB; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q/E1bzjB"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32aabfd3813so44451101fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750756633; x=1751361433; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r0iPOvxdd1+R1sWyl977efxlDLfDFP8LBWLuB/lbhrw=;
        b=Q/E1bzjBw67MpwSPxXoLSdSghe/Ce+MfF8SZc3Rx8srTY4PIYbgkTOGyyy7azvtUG1
         JF3stOVziISLgnGBEwThPGpr4ZW0FFaghb024aNh9e2ZjDhQ1+2n8jBgtRavAhGWZ1dO
         M8woPQbYHEmiExiXPN/exf/Z8mCY39r2LTIIY8Ei3vp4dkcxCp1otuMPRcbXaAUw4WQS
         aEvDF/yo34KITGrcm8OjDGsbsT9nZtyrenE7XAhaGokZgZCFo/E7UNgkleKc0Eol1VPg
         khQsShys6OM20IIxQKF9vJtF1F5eWg5u9dPoyRs7Hgkos2o6I5uqNjLwimBztbOqf4aN
         DuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750756633; x=1751361433;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r0iPOvxdd1+R1sWyl977efxlDLfDFP8LBWLuB/lbhrw=;
        b=DkPfndFPHWbdZzXGKMjjeK2+WVpeHEF/p84eXzWHNV2VqB9hNaI/UA+I0RG+JmDd9+
         wJPRDsQGdjhBx4Ds1UxE+874tbZ3HlwbUKBbfx+v3in9uEW+kFo/JEiSzN7ZrTVPdvHv
         eflPLF9BdU237nvalzI6G0r0v7Leyn+LX8wM4xWfmIIHT2McJkyy+lxEFCMMpbymYbh/
         LSY2NkN9yPge4R1vX0Rj0D/Tte3avCw0wcoDbl06WzX/qz0LQIz0pRlQZVSgSZZKOgmJ
         w7eK3n7WJmwH80sVCORi+speTd4vrImbuhgpRVwSrPln7xInbZlrjfwiC/Cd9vJYJROq
         O2Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWibCVX2wLOqHMooJjkln8m4NgYaWF8sM1+NpM9zBsbdZ2pSNT0vLf815lLDhQCyuI2tK8h9wa/i2z4g8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo1gtOMV+kfOqWdx9jq0GaLYY2ftk9l0BtBjmm9z8qY6v3WIXR
	yFq8rJnlrMsyXBao/SaOEXR74ofFhKBti+PUj0OLTabgC5lvmtIpmWVAc4csQS+cJKj315J/SuQ
	PtNykcOxkIUVNfd1KQYFkqJlpCYkj6wjFcQUmhNEB
X-Gm-Gg: ASbGncsY8+cpIgHTARePENaUqTiuqL2EiMIdSeWrHGuYg5zG76N44fuUKZLzq0u1gWa
	qBDSdsHBjB8jCqsKv1CCBEwZoMmcACPX7nefvY1wf0fh8A6VZekPny4vqwiVlm6E8hL6qPr5FB/
	JebuIyWIWBredwGESXi7lEdLxss5T8RzpqXrOFCQ2GquiLVKNpbUR2v3tigIaalGG0aIMK3rZdc
	IPl
X-Google-Smtp-Source: AGHT+IGD0AD7nL9psVg42SQAr7/G4s8Vqp9RY8v1mqTFDOSfiaH+DNQTWGTac+zcDwvEIrO7POg1pz7X+xSnL83Jg0M=
X-Received: by 2002:a2e:be92:0:b0:32a:7386:ca13 with SMTP id
 38308e7fff4ca-32b98f17070mr45211481fa.22.1750756633312; Tue, 24 Jun 2025
 02:17:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1747817128.git.dvyukov@google.com> <138c29bd5f5a0a22270c9384ecc721c40b7d8fbd.1747817128.git.dvyukov@google.com>
 <CACT4Y+ZcQV3JWEaeh7BXNwXUsoH6RcVRyG2iNUA+_mrOBOHfNA@mail.gmail.com>
In-Reply-To: <CACT4Y+ZcQV3JWEaeh7BXNwXUsoH6RcVRyG2iNUA+_mrOBOHfNA@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 24 Jun 2025 11:17:02 +0200
X-Gm-Features: AX0GCFtx9xo4E4KpHl5vuVPWiygHr-7wuE4SYxFwbhYZWVvp6RZryjcT_it7kDc
Message-ID: <CACT4Y+anDdNU9rh1xsDRs7vZRfXbbvjFS3RRBu1zVejrp11Scw@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] rseq: Make rseq work with protection keys
To: mathieu.desnoyers@efficios.com, peterz@infradead.org, boqun.feng@gmail.com, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, aruna.ramakrishna@oracle.com, 
	elver@google.com
Cc: "Paul E. McKenney" <paulmck@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 May 2025 at 10:59, Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Wed, 21 May 2025 at 10:52, Dmitry Vyukov <dvyukov@google.com> wrote:
> >
> > If an application registers rseq, and ever switches to another pkey
> > protection (such that the rseq becomes inaccessible), then any
> > context switch will cause failure in __rseq_handle_notify_resume()
> > attempting to read/write struct rseq and/or rseq_cs. Since context
> > switches are asynchronous and are outside of the application control
> > (not part of the restricted code scope), temporarily switch to
> > pkey value that allows access to the 0 (default) PKEY.
> >
> > Signed-off-by: Dmitry Vyukov <dvyukov@google.com>
> > Reviewed-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Cc: "Paul E. McKenney" <paulmck@kernel.org>
> > Cc: Boqun Feng <boqun.feng@gmail.com>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Ingo Molnar <mingo@redhat.com>
> > Cc: Borislav Petkov <bp@alien8.de>
> > Cc: Dave Hansen <dave.hansen@linux.intel.com>
> > Cc: "H. Peter Anvin" <hpa@zytor.com>
> > Cc: Aruna Ramakrishna <aruna.ramakrishna@oracle.com>
> > Cc: x86@kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Fixes: d7822b1e24f2 ("rseq: Introduce restartable sequences system call")
>
> Dave, can you please ack this patch? Ingo said he was waiting for your
> review before taking this to -tip.

Are there any remaining concerns with this series? If not, Thomas,
Ingo, can you please take this to -tip tree?

> > ---
> > Changes in v7:
> >  - Added Mathieu's Reviewed-by
> >
> > Changes in v6:
> >  - Added a comment to struct rseq with MPK rules
> >
> > Changes in v4:
> >  - Added Fixes tag
> >
> > Changes in v3:
> >  - simplify control flow to always enable access to 0 pkey
> >
> > Changes in v2:
> >  - fixed typos and reworded the comment
> > ---
> >  include/uapi/linux/rseq.h |  4 ++++
> >  kernel/rseq.c             | 11 +++++++++++
> >  2 files changed, 15 insertions(+)
> >
> > diff --git a/include/uapi/linux/rseq.h b/include/uapi/linux/rseq.h
> > index c233aae5eac90..019fd248cf749 100644
> > --- a/include/uapi/linux/rseq.h
> > +++ b/include/uapi/linux/rseq.h
> > @@ -58,6 +58,10 @@ struct rseq_cs {
> >   * contained within a single cache-line.
> >   *
> >   * A single struct rseq per thread is allowed.
> > + *
> > + * If struct rseq or struct rseq_cs is used with Memory Protection Keys,
> > + * then the assigned pkey should either be accessible whenever these structs
> > + * are registered/installed, or they should be protected with pkey 0.
> >   */
> >  struct rseq {
> >         /*
> > diff --git a/kernel/rseq.c b/kernel/rseq.c
> > index b7a1ec327e811..88fc8cb789b3b 100644
> > --- a/kernel/rseq.c
> > +++ b/kernel/rseq.c
> > @@ -10,6 +10,7 @@
> >
> >  #include <linux/sched.h>
> >  #include <linux/uaccess.h>
> > +#include <linux/pkeys.h>
> >  #include <linux/syscalls.h>
> >  #include <linux/rseq.h>
> >  #include <linux/types.h>
> > @@ -424,11 +425,19 @@ static int rseq_ip_fixup(struct pt_regs *regs)
> >  void __rseq_handle_notify_resume(struct ksignal *ksig, struct pt_regs *regs)
> >  {
> >         struct task_struct *t = current;
> > +       pkey_reg_t saved_pkey;
> >         int ret, sig;
> >
> >         if (unlikely(t->flags & PF_EXITING))
> >                 return;
> >
> > +       /*
> > +        * Enable access to the default (0) pkey in case the thread has
> > +        * currently disabled access to it and struct rseq/rseq_cs has
> > +        * 0 pkey assigned (the only supported value for now).
> > +        */
> > +       saved_pkey = enable_zero_pkey_val();
> > +
> >         /*
> >          * regs is NULL if and only if the caller is in a syscall path.  Skip
> >          * fixup and leave rseq_cs as is so that rseq_sycall() will detect and
> > @@ -441,9 +450,11 @@ void __rseq_handle_notify_resume(struct ksignal *ksig, struct pt_regs *regs)
> >         }
> >         if (unlikely(rseq_update_cpu_node_id(t)))
> >                 goto error;
> > +       write_pkey_val(saved_pkey);
> >         return;
> >
> >  error:
> > +       write_pkey_val(saved_pkey);
> >         sig = ksig ? ksig->sig : 0;
> >         force_sigsegv(sig);
> >  }
> > --
> > 2.49.0.1143.g0be31eac6b-goog
> >
