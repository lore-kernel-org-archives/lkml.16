Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA4822541D
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 08:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738831010; cv=none; b=mC5OKUVN4Eu5bfP6jIaQdBz8Mp4sTbq973BHZfyrHZtQj8l/JfawD6QGsbqMr8MiPsJQmzv734w7L/sj5zDyLymV+hxigXDWjW60azda7cxKWj2CxGg9E/xn5wxFegnnSfJfGLASuJSvSrggixyLKaY0qb7xik9dM1aorjxTW7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738831010; c=relaxed/simple;
	bh=EbaJo1CPgqeiSr7GjUgaiUm+thJLXNrjx31UM5aAq5o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tBYeWg7yX525icPOJI20ZOdj+9fLGH7IfmLhfwwj5q3HhZDxKJCrVrULmxSlFUhY7FDZnil3BBjgxVqIdK2jaVGgyqTs/vQUYv9nircpUys6HNLec4s2/ELfN2apUdIO2IPRotuA7smuXovQ1E3T5pmP6MSAEUeHQ8QZsE4/U6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GNjhYUhI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GNjhYUhI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738831007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jgm++d8qawW/jYXEWDCtTkLpIjEZmLLSJeGeo61b7eY=;
	b=GNjhYUhIo+BEIuNUZY+8ZgUwc+VEnYlcJPOS/e5LG/Sru3T4lZQfaBXApNxoM6MkxA55Zf
	6EWf4L8p8sDCmY4Qs34CXx8jDadAEKXiES5utx0P6FiqE+bTwzPw+Ugdo9D+LZlTRIOK2+
	iMA+AO7dGtJyUkXtxJB9r90jSHeAj3M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-kcGEfxR3Pv-uFSumBJGPGA-1; Thu, 06 Feb 2025 03:36:45 -0500
X-MC-Unique: kcGEfxR3Pv-uFSumBJGPGA-1
X-Mimecast-MFC-AGG-ID: kcGEfxR3Pv-uFSumBJGPGA
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43619b135bcso2874365e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 00:36:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738831004; x=1739435804;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jgm++d8qawW/jYXEWDCtTkLpIjEZmLLSJeGeo61b7eY=;
        b=wxm2vTkp6jS7aMyl8yxzQ6WDljjmWz2QR9HYfyuSDIXP9clyPmC4kJDOiDtnIjD5rz
         NNWFhJPpStrly9FvakSTgIj0bm4EhQxdzK7zOf/udNjKzEAZRZlT8ef+1HEO63W2wiMJ
         71xR47YlFmU0DeNu7UXnCRraoc4wVryzTR0x/WU90hZhX4IV2DG7TAYxTxhBMR2bmJBs
         JawFCSyb/NDKXJ60JXg1GFwxjRxKQcyb7OSWnjQ5FRTelesBbe5Mz8RWnYLUi2H/f8Jr
         HxVrMjxwkfgHXKJNuhYmjvB01KOej57PMN0gX928HhhiN2NuYORljm4dzU4ui1Kra1uM
         750w==
X-Gm-Message-State: AOJu0Yyp/qllz1ROyq8/m+P7pAd3y/udfAFTUIvs7pJR0p0ahEF5wwdc
	LTvMZQsAu7IodDZ2hpXUMj4iVuC9QZPejDP0iaqFOnHmgL1cocInKdANjn3yuOcxv+Rki+mJ2CT
	ABo8ggZPtb44CHoIs7Y7AuDcklRWkRK2bJIs0ow/Six8CKKpN/wL4Lc6aB+UoOw==
X-Gm-Gg: ASbGncsMyHpVdOxZzbgkwuxMfoF/yfH7xfUE2ibcUp7s4VocTW3a/vjdllmVEkLkHTI
	8Zer2afVPRUc3SaA/vNquhu2HTpb9mtL+AdZE01I+IuLgKNCKm00rduQw3jF95JP7RL8rzfNEMw
	w8vPitCpeFus0ghuv36kuYWgTViQpkURWywYGu/F/bVeK7xmughjm9LIjRZCYu9C0lW//5WCmXv
	CYVO20jgJ5ZuGMCNR/rbTOxlCF/Wk004K3RSfNJ5n66xiNBF04xKZ8R5w/wykCMQD2mXhl/Pi9s
	1wUtFRdwB8/j2o//lXO4KL6dN6xg1uw=
X-Received: by 2002:a05:600c:3c8e:b0:436:f3f6:9582 with SMTP id 5b1f17b1804b1-4390d433bbamr42454295e9.8.1738831004466;
        Thu, 06 Feb 2025 00:36:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFj/MmAVM8fe+Dnvzu/cvjpk828Tlny2S+XF/GaeoBwhrOTbslBJtdNx1EJBPP9Js3Vv5QzOA==
X-Received: by 2002:a05:600c:3c8e:b0:436:f3f6:9582 with SMTP id 5b1f17b1804b1-4390d433bbamr42454045e9.8.1738831004023;
        Thu, 06 Feb 2025 00:36:44 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde2fc01sm1100749f8f.93.2025.02.06.00.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 00:36:43 -0800 (PST)
Message-ID: <d8187fcd53c62272d7e1a8dad327c4f2a5f07188.camel@redhat.com>
Subject: Re: [RFC PATCH 03/11] sched: Add sched tracepoints for RV task model
From: Gabriele Monaco <gmonaco@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Ingo
 Molnar <mingo@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	linux-trace-kernel@vger.kernel.org
Date: Thu, 06 Feb 2025 09:36:41 +0100
In-Reply-To: <20250206081942.GJ7145@noisy.programming.kicks-ass.net>
References: <20250206080952.98478-1-gmonaco@redhat.com>
	 <20250206080952.98478-4-gmonaco@redhat.com>
	 <20250206081942.GJ7145@noisy.programming.kicks-ass.net>
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



On Thu, 2025-02-06 at 09:19 +0100, Peter Zijlstra wrote:
> On Thu, Feb 06, 2025 at 09:09:39AM +0100, Gabriele Monaco wrote:
>=20
> > diff --git a/include/linux/sched.h b/include/linux/sched.h
> > index 9632e3318e0d6..af9fa18035c71 100644
> > --- a/include/linux/sched.h
> > +++ b/include/linux/sched.h
> > @@ -226,12 +226,14 @@ struct user_event_mm;
> > =C2=A0#define
> > __set_current_state(state_value)				\
> > =C2=A0	do
> > {								\
> > =C2=A0		debug_normal_state_change((state_value));=09
> > 	\
> > +		trace_set_current_state(state_value);	=09
> > 	\
> > =C2=A0		WRITE_ONCE(current->__state,
> > (state_value));		\
> > =C2=A0	} while (0)
> > =C2=A0
> > =C2=A0#define
> > set_current_state(state_value)					\
> > =C2=A0	do
> > {								\
> > =C2=A0		debug_normal_state_change((state_value));=09
> > 	\
> > +		trace_set_current_state(state_value);	=09
> > 	\
> > =C2=A0		smp_store_mb(current->__state,
> > (state_value));		\
> > =C2=A0	} while (0)
> > =C2=A0
> > @@ -247,6 +249,7 @@ struct user_event_mm;
> > =C2=A0							=09
> > 	\
> > =C2=A0		raw_spin_lock_irqsave(&current->pi_lock,
> > flags);	\
> > =C2=A0		debug_special_state_change((state_value));=09
> > 	\
> > +		trace_set_current_state(state_value);	=09
> > 	\
> > =C2=A0		WRITE_ONCE(current->__state,
> > (state_value));		\
> > =C2=A0		raw_spin_unlock_irqrestore(&current->pi_lock,
> > flags);	\
> > =C2=A0	} while (0)
> > @@ -282,6 +285,7 @@ struct user_event_mm;
> > =C2=A0		raw_spin_lock(&current-
> > >pi_lock);			\
> > =C2=A0		current->saved_state =3D current-
> > >__state;		\
> > =C2=A0		debug_rtlock_wait_set_state();		=09
> > 	\
> > +		trace_set_current_state(TASK_RTLOCK_WAIT);=09
> > 	\
> > =C2=A0		WRITE_ONCE(current->__state,
> > TASK_RTLOCK_WAIT);		\
> > =C2=A0		raw_spin_unlock(&current-
> > >pi_lock);			\
> > =C2=A0	} while (0);
> > @@ -291,6 +295,7 @@ struct user_event_mm;
> > =C2=A0		lockdep_assert_irqs_disabled();	=09
> > 		\
> > =C2=A0		raw_spin_lock(&current-
> > >pi_lock);			\
> > =C2=A0		debug_rtlock_wait_restore_state();	=09
> > 	\
> > +		trace_set_current_state(TASK_RUNNING);	=09
> > 	\
> > =C2=A0		WRITE_ONCE(current->__state, current-
> > >saved_state);	\
> > =C2=A0		current->saved_state =3D
> > TASK_RUNNING;			\
> > =C2=A0		raw_spin_unlock(&current-
> > >pi_lock);			\
>=20
> > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > index 165c90ba64ea9..fb5f8aa61ef5d 100644
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -491,6 +491,12 @@ sched_core_dequeue(struct rq *rq, struct
> > task_struct *p, int flags) { }
> > =C2=A0
> > =C2=A0#endif /* CONFIG_SCHED_CORE */
> > =C2=A0
> > +void trace_set_current_state(int state_value)
> > +{
> > +	trace_sched_set_state_tp(current, current->__state,
> > state_value);
> > +}
> > +EXPORT_SYMBOL(trace_set_current_state);
>=20
> Urgh, why !?!
>=20

Do you mean why exporting it?
At first I was puzzled too (this line is borrowed from Daniel), but the
thing is: set_current_state and friends are macros called by any sort
of code (e.g. modules), this seems the easiest way without messing up
with the current code.

I'm not sure if it would be cleaner to just drop this function and
define it directly in the header (including also trace/events/sched.h
there). It felt like files including sched shouldn't know about
tracepoints.

What do you think would be better?

