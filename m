Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B232213240
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 12:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278493; cv=none; b=Oji7epSC92FNFN0HRw+voS3OsyB16y5o8hk3gbPZ3lNVBrxcCr3imVP4aPeOH1AzahShleDTZS0Z9RnuB+EuPgEg4Qqrz9HvoeJnatNXjbVtoA+nSc7JarY39v0nwcwbSEFUlt+1FlhZQVlZvBG6DbdVDxNmcT5Gu7WvoXLJt8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278493; c=relaxed/simple;
	bh=9/PlZZ087KepjRQHJ3VVHaEYdxb4zzSBZ6SoPrn3umY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rBIFmYAOccvLm8M5UwN9nWhcFHg3tPNQ4ecOnjYeRNpXpC3PzF9qLYaXKPgMy2i29/DkAXOTJ9Ujf7O3CGfqL0KGp5EpJfH8BRJwPdT7K+2KubGXj8QsziGi0l1MD/L1kmT3Iug3kaVHR9qi/LkyMaUtVrM1NZC4ZQ0LMRyWByA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OewWEt1j; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OewWEt1j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739278490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fKSs+sLqCcJjgSUWDlfYHoF40v2TZb/Swx/+NmEL0Eo=;
	b=OewWEt1jyICi2ozKgPh6Tw5q+uwOiXXLmhvyVWfSmYIn50sY2dJBM7zqjX8+pCg+lXgVv/
	9uAIftnc22a6T4afSAtuDbohgRLkKKA5wZl7OE3aMs/pbVACN7Dv1DICnumP7XnqVSVjvC
	A0sVCV3Pwh/Vo3uBJHZTRKvlwxS2C6I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-5Sxv5LgKOEKJhBrjRdkfIg-1; Tue, 11 Feb 2025 07:54:48 -0500
X-MC-Unique: 5Sxv5LgKOEKJhBrjRdkfIg-1
X-Mimecast-MFC-AGG-ID: 5Sxv5LgKOEKJhBrjRdkfIg
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38dda790cfbso1964205f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 04:54:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739278487; x=1739883287;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fKSs+sLqCcJjgSUWDlfYHoF40v2TZb/Swx/+NmEL0Eo=;
        b=oac67vxDWvTgdtC2EP6TPhOHRGycipyqYgCbzcmYooZuYNLIL7nQZ1zafgHEnT3SVJ
         oB2MDnb/0LDRts2VkceLaeugxjr+gOHKPXUrMz05Y/EU1cqO/mS2wrE0oDA/HTVNNXIh
         A+XRMLhgARpj4tTIvjBroWy9IH83xK8OkkcN5eA7YeaEfPQkQ61V28gZmuHOccsVMyvL
         H2iE8g1RPkWjSSCjYO/znwTmP5SpJS8bHHYSQ18KfRWPJrIqk9TDOWLswKwQ0zPQM02o
         X2DuhGLmqWQWQk7HGcdLJ3af+M5rwACXmMHuzJ45Ecc7edqyT7Ftyl7SiZSNIWHkmTx2
         WEJw==
X-Gm-Message-State: AOJu0YxsYmNMx6xhotYSF2I9tyufqgaDafWqcdVd+yIVG82/apcpUukz
	wKCEZ8denPrAN+rTkXIcVooFGFn5235rpggyMyKlZDgjJaLXc/K7RVlhKWuK439yZH3zgYIz4Pm
	tuo7tgh5em4VhUSNIne8cECCOF2isdAVcFfDD5rxmbTC20IMViKYHROLNlqHInQ==
X-Gm-Gg: ASbGncsuC8afD8sW8DrVniU1kX3IrcYrho77N4G6ya+dWVg9YbZPEAWTYRIXUya7kwb
	n+I+hc9TQ8BvRbY2VwUZRj80+B5btBstI7MUKCZKJN2p94uzF0DSInqSpRLaPV9WaBYpa80Tvfx
	Ji8jUskzo0rLGrAxUKNEfz1BaKxmPSjfwPzYi8CJRjJGhwEoJEyQEtgihsEZEvStvpKH+lgnN9E
	RhKEbgzjpvyB9BubMpuYiGN0VyrBfVEtpZWn3AoFV2/0kREnTLfH6cr9+5bkcY+/+E/jnB43OWk
	yt1GDdiVp+PjUMCoAIc/WeKyvbBUQTQ=
X-Received: by 2002:a5d:5f87:0:b0:38d:d299:7097 with SMTP id ffacd0b85a97d-38dd29972c0mr10618813f8f.5.1739278487451;
        Tue, 11 Feb 2025 04:54:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZp1ePHnPvWuNhJt0biLJza5EiNgPbgTOxahfwLR6Xs5KoKVIGtLRIa46r3e5LWR4vGc3NdA==
X-Received: by 2002:a5d:5f87:0:b0:38d:d299:7097 with SMTP id ffacd0b85a97d-38dd29972c0mr10618792f8f.5.1739278487013;
        Tue, 11 Feb 2025 04:54:47 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcd8213f2sm11734502f8f.67.2025.02.11.04.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:54:46 -0800 (PST)
Message-ID: <56aad1c92224c624f7404c4ef6076a6ec7299b13.camel@redhat.com>
Subject: Re: [PATCH v1 03/11] sched: Add sched tracepoints for RV task model
From: Gabriele Monaco <gmonaco@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Ingo
 Molnar <mingo@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	linux-trace-kernel@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>
Date: Tue, 11 Feb 2025 13:54:44 +0100
In-Reply-To: <20250211110307.GE29593@noisy.programming.kicks-ass.net>
References: <20250211074622.58590-1-gmonaco@redhat.com>
		 <20250211074622.58590-4-gmonaco@redhat.com>
		 <20250211110307.GE29593@noisy.programming.kicks-ass.net>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0



On Tue, 2025-02-11 at 12:03 +0100, Peter Zijlstra wrote:
> On Tue, Feb 11, 2025 at 08:46:10AM +0100, Gabriele Monaco wrote:
>=20
> > diff --git a/include/linux/sched.h b/include/linux/sched.h
> > index 9632e3318e0d6..9ff0658095240 100644
> > --- a/include/linux/sched.h
> > +++ b/include/linux/sched.h
> > @@ -46,6 +46,7 @@
> > =C2=A0#include <linux/rv.h>
> > =C2=A0#include <linux/livepatch_sched.h>
> > =C2=A0#include <linux/uidgid_types.h>
> > +#include <linux/tracepoint-defs.h>
> > =C2=A0#include <asm/kmap_size.h>
> > =C2=A0
> > =C2=A0/* task_struct member predeclarations (sorted alphabetically): */
> > @@ -186,6 +187,12 @@ struct user_event_mm;
> > =C2=A0# define debug_rtlock_wait_restore_state() do { } while (0)
> > =C2=A0#endif
> > =C2=A0
> > +#define trace_set_current_state(state_value)=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 \
> > + do {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 \
> > + if (tracepoint_enabled(sched_set_state_tp))=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 \
> > + do_trace_set_current_state(state_value); \
> > + } while (0)
>=20
> Yeah, this is much nicer, thanks!
>=20
> > =C2=A0/*
> > =C2=A0 * set_current_state() includes a barrier so that the write of
> > current->__state
> > =C2=A0 * is correctly serialised wrt the caller's subsequent test of
> > whether to
> > @@ -226,12 +233,14 @@ struct user_event_mm;
> > =C2=A0#define __set_current_state(state_value) \
> > =C2=A0 do { \
> > =C2=A0 debug_normal_state_change((state_value)); \
> > + trace_set_current_state(state_value); \
> > =C2=A0 WRITE_ONCE(current->__state, (state_value)); \
> > =C2=A0 } while (0)
> > =C2=A0
> > =C2=A0#define set_current_state(state_value) \
> > =C2=A0 do { \
> > =C2=A0 debug_normal_state_change((state_value)); \
> > + trace_set_current_state(state_value); \
> > =C2=A0 smp_store_mb(current->__state, (state_value)); \
> > =C2=A0 } while (0)
> > =C2=A0
> > @@ -247,6 +256,7 @@ struct user_event_mm;
> > =C2=A0 \
> > =C2=A0 raw_spin_lock_irqsave(&current->pi_lock, flags); \
> > =C2=A0 debug_special_state_change((state_value)); \
> > + trace_set_current_state(state_value); \
> > =C2=A0 WRITE_ONCE(current->__state, (state_value)); \
> > =C2=A0 raw_spin_unlock_irqrestore(&current->pi_lock, flags); \
> > =C2=A0 } while (0)
> > @@ -282,6 +292,7 @@ struct user_event_mm;
> > =C2=A0 raw_spin_lock(&current->pi_lock); \
> > =C2=A0 current->saved_state =3D current->__state; \
> > =C2=A0 debug_rtlock_wait_set_state(); \
> > + trace_set_current_state(TASK_RTLOCK_WAIT); \
> > =C2=A0 WRITE_ONCE(current->__state, TASK_RTLOCK_WAIT); \
> > =C2=A0 raw_spin_unlock(&current->pi_lock); \
> > =C2=A0 } while (0);
> > @@ -291,6 +302,7 @@ struct user_event_mm;
> > =C2=A0 lockdep_assert_irqs_disabled(); \
> > =C2=A0 raw_spin_lock(&current->pi_lock); \
> > =C2=A0 debug_rtlock_wait_restore_state(); \
> > + trace_set_current_state(TASK_RUNNING); \
> > =C2=A0 WRITE_ONCE(current->__state, current->saved_state); \
> > =C2=A0 current->saved_state =3D TASK_RUNNING; \
> > =C2=A0 raw_spin_unlock(&current->pi_lock); \
>=20
>=20
> > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > index 165c90ba64ea9..9e33728bb57e8 100644
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -491,6 +491,15 @@ sched_core_dequeue(struct rq *rq, struct
> > task_struct *p, int flags) { }
> > =C2=A0
> > =C2=A0#endif /* CONFIG_SCHED_CORE */
> > =C2=A0
> > +/* need a wrapper since we may need to trace from modules */
> > +EXPORT_TRACEPOINT_SYMBOL(sched_set_state_tp);
>=20
> _GPL
>=20
> > +
> > +void do_trace_set_current_state(int state_value)
> > +{
> > + trace_sched_set_state_tp(current, current->__state, state_value);
>=20
> Should this be:
>=20
>  __do_trace_sched_set_state_tp() ?
>=20

Mmh, you mean avoiding the static_branch_unlikely in the helper
function, since it's supposed to be used before calling it?

I checked all references of tracepoint-defs.h's tracepoint_enabled (the
macro actually doing this static_branch_unlikely) and it seems they
never use the __do_trace_ function but only call trace_, in fact
repeating the branch.

Your suggestion seems definitely cleaner but I wonder if that can have
unwanted consequences (we are exposing a function unconditionally
calling the tracepoint) and for that reason it was preferred not to do
it in all other occurrences?

I'm not sure if saving one branch would justify the change only in this
case. Thoughts?

> > +}
> > +EXPORT_SYMBOL(do_trace_set_current_state);
>=20
> _GPL
>=20

I'm absolutely not against this change but, out of curiosity, would
that imply non-GPL modules are not going to be able to sleep going
forward? At least not using this pattern.

Thanks,
Gabriele

