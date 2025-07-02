Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35F72F5083
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 16:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751474348; cv=none; b=Ud+RDCeBssCUUHy6e79VjX2+irB6NeC4FGqPcG70ENSu0kPSrLIoM3g43wXv1gPTcOJeeAGNbAf8Ao+2QkT54vWrM4KP2xFxWX92oUVE3yYRl9XJSIaa4syw0zc0Hw2rfamoyH0UoNAohdkdN8KX9cu+D//ErDdFkPOP/md/Wz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751474348; c=relaxed/simple;
	bh=uaoDmFt5MdiEmWQDYL79r2WCwxdlNPXP2frjhUx9qbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sh5cRLioPaMTUOzJRH2QP39vQXUCRS3n73QMVmyGTy4zAgA5sDN5DOaNLMh4vKlP44Lf7OVXxMMwdsjJWWUYD86OXskruSO5NrFyFl8fGpjjg2cbHhsQSB6q8vmYf7jyCeeVte+CrcgUoh41KfyYjY7f0qSAasxL9lW/s3jL/24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ANDQRyUn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ANDQRyUn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751474344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jfc/aXVSwDrtCgjMQUEfsAD9qKlUmCpxUhW3T4bZimY=;
	b=ANDQRyUnWtGjMx+5FDWNp8o/l+yRRJzaxWPcnGQwnPQzRf1JnI7bxxz6OeAILyFgAgt+sc
	200eWYxKfaH4vxXUsSTVwfFJXWB5mFXyFsDzjn2V9EPLgQwztkgL0WTgPypctejcIHf+76
	+/ikRVXNuM+HpQv0yF1QFiKq8ajx1QA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591--0pHkxJ3M8SoMOhY3p61Cw-1; Wed, 02 Jul 2025 12:39:03 -0400
X-MC-Unique: -0pHkxJ3M8SoMOhY3p61Cw-1
X-Mimecast-MFC-AGG-ID: -0pHkxJ3M8SoMOhY3p61Cw_1751474343
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a985909a64so2921641cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 09:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751474343; x=1752079143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jfc/aXVSwDrtCgjMQUEfsAD9qKlUmCpxUhW3T4bZimY=;
        b=QsrUnAsPXcH0SJr9a7wjkYIUPeIQuAn4qcWx/fOtZUWG/dnUf4OjPgs0sx2rLEXA7C
         WKLHDKo3PGudSIsRDsWAxkMVC2F+EUZTNgEUzz3m8xFnOP92Z3EBGpYeBqJYGl/jbOeH
         /0rtYSez2HroJxnp80Puf/t3/ogVEBveGGUuK2+HOr+HIwf+b0m9MBJ7DVrm51lhrd4h
         BVsk+fydyqCW6Rb/VCPkyUD5BP6TfYYqhiD4yLma6BqDO/dLTojEVc9N0VUpoH/ObsJe
         sqt9E/EuJhqzPXWy0iNbUXrkipfiOKbseDYU2hkUTjL9i9SZEdhEIRM1n8tjl3Gz7/XA
         YZjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPMXazdAOkjvgSxwZvCgJA6EXWzOmpRnQ5FFzov0qWTCulvP3LaunBN/5JZa7r+/BdDmnQwBi4I1/Q1Ro=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBWCF53ZUyBJ8iHA0vo668+Ys5kLOCtUQs1nHIR/J47Et+gQC1
	Ve+gQi0Wk311cZi96bIb3WJt9Yg/MvRL6GW4KJHfkJlNM9DYS2fo894rvxH27fIRAd03GWFzY5v
	KPBGDE297GlX4m5n50GbLWjbPeqyRZcsFe9PllN99TndOxepYmw+uE0rf/I/YcOk8fvpJfApJ0M
	hk4+UNzO5eu2CVahLTzhKtKaAlP3mDM8zSfCZPtP5d
X-Gm-Gg: ASbGnctSvr2GI4bd4CxtPVkGGbX6q/dSwte55iB+mX8u5+pc8CzKCR1jftTiT3bEOpj
	KjJgZaGJqFkOyDJFKJxcQ9McPOkSnKWqrM/Ur+w042adkel87rGabJNvkP7c3D/amwgGfs33WlV
	QHCmH2Ib1zgE6pyrIy9a4MR95AYDdRdht7Y2WH
X-Received: by 2002:ac8:7f88:0:b0:4a7:14c4:2385 with SMTP id d75a77b69052e-4a9769dc844mr57214451cf.42.1751474342913;
        Wed, 02 Jul 2025 09:39:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEw4yAkotoG5cEMZRyDySUOCQVlKJOYuRgpyGuPwZ8EjflOgtMDslQB7Zt3culBn1OKv5gWCFnk2utBfWB+tRY=
X-Received: by 2002:ac8:7f88:0:b0:4a7:14c4:2385 with SMTP id
 d75a77b69052e-4a9769dc844mr57213911cf.42.1751474342348; Wed, 02 Jul 2025
 09:39:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620085618.4489-1-gpaoloni@redhat.com> <20250701195939.3e297e20@gandalf.local.home>
 <CA+wEVJY2a_ERXemup7EefPPXHOv8DAfyauuP6Mn5vHYFkbbBcQ@mail.gmail.com> <20250702104058.3cf9c1a3@batman.local.home>
In-Reply-To: <20250702104058.3cf9c1a3@batman.local.home>
From: Gabriele Paoloni <gpaoloni@redhat.com>
Date: Wed, 2 Jul 2025 18:38:51 +0200
X-Gm-Features: Ac12FXz3zMqkdtDe-RC_XPl6_jJB2pqOswiPd5qPN2SMzw6LBfOWhsDDoFVoMcA
Message-ID: <CA+wEVJY+WbHECt3Vu+23B2PrpVoaRnaY=ncnXP3aHAjbgVNVMg@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND] tracing: add kernel documentation for
 trace_array_set_clr_event, trace_set_clr_event and supporting functions
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 4:41=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org>=
 wrote:
>
> On Wed, 2 Jul 2025 15:45:41 +0200
> Gabriele Paoloni <gpaoloni@redhat.com> wrote:
>
> > >
> > > > For each of the documented functions, as part of the extensive
> > > > description, a set of "Function's expectations" are described in
> > > > a way that facilitate:
> > > > 1) evaluating the current code and any proposed modification
> > > >    to behave as described;
> > > > 2) writing kernel tests to verify the code to behave as described.
> > > >
> > > > Signed-off-by: Gabriele Paoloni <gpaoloni@redhat.com>
> > > > ---
> > > > Re-sending as no feedbacks have been received.
> >
> > Now that I am reading this I realized that I missed the most important
> > discussion comments from v1, so I am adding them back here inline
> > below (BTW one more reason to avoid RESENDs):
> >
> > While working on the documentation of __ftrace_event_enable_disable,
> > I realized that the EVENT_FILE_FL_SOFT_MODE flag is mainly used
> > internally in the function itself, whereas it is EVENT_FILE_FL_SOFT_DIS=
ABLED
> > that prevents tracing the event.
> > In this perspective I see that, starting from the initial state, if for
> > a specific event we invoke __ftrace_event_enable_disable with enable=3D=
1
> > and soft_disable=3D0, the EVENT_FILE_FL_ENABLED is set whereas
> > EVENT_FILE_FL_SOFT_MODE and EVENT_FILE_FL_SOFT_DISABLED are not.
> > Now if for that event we invoke __ftrace_event_enable_disable again wit=
h
> > enable=3D1 and soft_disable=3D1, EVENT_FILE_FL_ENABLED stays set,
> > EVENT_FILE_FL_SOFT_MODE is set, while EVENT_FILE_FL_SOFT_DISABLED
> > remains not set. Instead if from the initial state we directly invoke
> > __ftrace_event_enable_disable with enable=3D1 and soft_disable=3D1, all
> > the status flag mentioned above are all set (EVENT_FILE_FL_ENABLED,
> > EVENT_FILE_FL_SOFT_MODE and EVENT_FILE_FL_SOFT_DISABLED).
> > Now I wonder if:
> > a) such a behaviour is consistent with the code expectation;
>
> Yes, and I verified it by looking at the comments in the code. But this
> should have been documented at the top of the function too.

Ok thanks, in the next revision I will also add info that
contextualises the possible
state transitions.

>
> > b) if it would make sense to have a standard enable invocation followed
> >    by a soft enable invocation to end up in the same state as a single
> >    invocation of soft enable;
>
> No, because the two need to be done together.

Yes, following your explanation below I see now.

>
> > c) eventually if we could get rid of the soft_mode flag and simplify
> >    the code to only use the soft_disabled flag.
>
> The reason for the soft_mode flag is that this needs to handle two
> users of the same event. One has it enabled (no soft mode at all) and
> the other has it disabled in a soft mode.
>
> The SOFT_MODE flag is to state that there's at least one user that is
> using this in soft mode and has it disabled.
>
> Let me explain the purpose of SOFT_MODE.
>
> When you echo 1 into the enable file of an event it enables the event
> and it starts tracing immediately. This would be: enable=3D1 soft_disable=
=3D0.
>
> Same for echoing in 0 into the enable file. It would disable the event:
> enable=3D0 soft_disable=3D0.
>
> To enable or disable an event, it requires an expensive update to the
> static branches to turn the nops in the code into calls to the tracing
> infrastructure.
>
> Now we have a feature where you could enable one event when another
> event is hit with specific fields (or any field).
>
>   echo 'enable_event:irq:irq_handler_entry if next_comm=3D=3D"migrate"' >=
 /sys/kernel/tracing/events/sched/sched_switch/trigger
>
> The above adds a trigger to the sched_switch event where if the
> next_comm is "migrate", it will enable the irq:irq_handler_entry event.
>
> But to enable an event from an event handler which doesn't allow
> sleeping or locking, it can't simply call
> __ftrace_event_enable_disable() to enable the event. That would most
> likely cause a kernel crash or lockup if it did.
>
> To handle this case, when the trigger is added, it enables the event
> but puts the event into "soft mode" disabled. The trigger code would
> call __ftrace_event_enable_disable() with enable=3D1 and soft_disable=3D1=
.
> Meaning, "enable this event, but also set the soft_disable bit".
>
> This enables the event with the soft_disable flag set. That means, the
> irq_handler_entry event will call into the tracing system every time.
> But because the SOFT_DISABLE is set in the event, it will simply do
> nothing.
>
> After doing the above trigger:
>
>   # cat /sys/kernel/tracing/events/irq/irq_handler_entry/enable
>   0*
>
> That means it's disabled in "soft mode".
>
> But let's say I also want to enable the event!
>
>   # echo 1 > /sys/kernel/tracing/events/irq/irq_handler_entry/enable
>   # cat /sys/kernel/tracing/events/irq/irq_handler_entry/enable
>   1*
>
> The above called __ftrace_event_enable_disable() with: enable=3D1 and sof=
t_disable=3D0.
>
> Which means "enable this event for real". Well, it can't forget that
> there's a trigger on it. But the event shouldn't be ignored when
> triggered, so it will clear the SOFT_DISABLE flag and have the event be
> traced.
>
> But if we disable it again:
>
>   # echo 0 > /sys/kernel/tracing/events/irq/irq_handler_entry/enable
>   # cat /sys/kernel/tracing/events/irq/irq_handler_entry/enable
>   0*
>
> It must still remember that there's a user that has this event soft
> disabled and may enable it in the future.
>
> When the trigger fires, it will clear the SOFT_DISABLE bit making the
> event "enabled".
>
> The __ftrace_event_enable_disable() needs to keep track of all the
> users that have this event enabled but will switch between soft disable
> and enable. To add itself, it calls this function with enable=3D1
> soft_disable=3D1 and to remove itself, it calls it with enable=3D0 and
> soft_disable=3D1.
>
> Now technically, the SOFT_MODE bit should only be set iff the ref count
> is greater than zero. But it's easier to test a flag than to always
> test a ref count.
>
> Hope that explains this better. And yes, it can get somewhat confusing,
> which is why I said this is a good function to document the
> requirements for ;-)

I think I understand now:
SOFT_MODE means that one user requested a soft enable for the event,
however that does not guarantee that the event is not already enabled from
a previous standard enable (in which case the SOFT_DISABLED flag will
not be set as it would compromise the previous user).
So a soft disable request is needed to "undo" previous soft enables; this i=
n
consideration of the SOFT_DISABLED flag (telling if there is an active user
with a standard enable).

Many thanks! This really helps to better contextualize function expectation=
s
in the next revision of the patch.

Gab

>
> -- Steve
>

