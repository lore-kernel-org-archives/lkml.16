Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6D9214209
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 11:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738842446; cv=none; b=l4Iq/O0pDED7GT/5kV8Heyw0rNBJoa+DMur2YrWP8Etm8JLnzNtbkuxoUL0ezopyvzQ1kueVoYz2szvsOnbxFO57l7ievT8s0DhOjFOXqKV2WIgaT91akbQxw5/yzoq9dq15T+lQnyc5Y69JK35yPzU6CllZBRAbvjUobmlBEjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738842446; c=relaxed/simple;
	bh=AMWkR6CPbEIZ9CWJ+BxLk20utJFtx/vWZZQqfZfEUG8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kaa5VQcqAv1zm8iKar+R3rcuSbdXaN2yZEvrCgVrfEYz3IGITzirZCi1jXpO5thDlV8lhdAubK50FGEHJqCKJRb853EmXAaVqVZqAopCPpIdnJYLqhafUnFb4j7wgsSt58qrkGHBCISJvaNdpSXYaHNbGOvYqh7v8Ny6hxP7p4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WE/kkZ+h; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WE/kkZ+h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738842443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Dy2FKCeBq1SU957TE4mxB3MK1uzhlMiHCxjSG5afeJI=;
	b=WE/kkZ+hv3bJYjq3xBtfr3A2He9nyBWmbpkfjS9JFH3gr24mm8F2OpL46fTGc0NJN33BMP
	f8LTcComX0TDieOCrZ0EbmUF/73HQUbK9oVKipLSY2OP0CFsbq7UMWMn1PJ1uzCwfLk49D
	DhpbI1rL+cOdZhdkklGvLhYhBaJGqVM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-sbZCbILVM5OiVa_ROPzvKA-1; Thu, 06 Feb 2025 06:47:22 -0500
X-MC-Unique: sbZCbILVM5OiVa_ROPzvKA-1
X-Mimecast-MFC-AGG-ID: sbZCbILVM5OiVa_ROPzvKA
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43621907030so6684855e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 03:47:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738842441; x=1739447241;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dy2FKCeBq1SU957TE4mxB3MK1uzhlMiHCxjSG5afeJI=;
        b=CSi1wuoPMwPr4QLahFUYY3qidA3Rv+JsMTa9Mut8fGau3/WpEBAuK201h1jhLGWhAN
         r3OCDa8+4IPhSU9D/B2o95jGS2XG+nmRDZCrlXxxrsuruUyNVyLMi2+omSYgO4cn1qzP
         lH52+U9DemwXcch3gaa1cwhtW58melLRUFOwCG+idd9Tp3TBWIvpGf0U1p6uTT45eOrx
         /ZILU/hW0KEv9ax9voCgazxhmPTEi06ojWGm1M1uWwdQxV3YFnkSQkCY2qsJVoizQ33Z
         nvStatpH4zk/+l9EMPNIDuQY3oo1YmN2uhdNOgWE4mO2bn3740dACWzCsDP8jWpjo5SI
         qNLw==
X-Gm-Message-State: AOJu0YyfOSQ3wweiQjuPUZkc5em+c0uMY1y7fUPLOzdx11g/+vnlNk+s
	DwiPFVUPQmhAjUUoUKq8f1NH+4k8NbKYzSqlWBGt3JEcvQL6edBb/Uf59c0lWQonEhpKPv/fucu
	qjInVOLOlC7b9tiM4VgMqKUcPxzeJvFv4w3rQgtjb1EGUIdZIlYseznVIx0vS4SgbaXAJl5c7
X-Gm-Gg: ASbGncsAwMxGDSBjW+7MmLakx0ykqLq+32tJKsS6ujfKb1Kkb8R5ltpcMZW7xRZp05O
	vLSjJkiTztIgad0SGCWwAs1Jk+HylN6nasgvEKl8jYi0aTLUFNnDRIdaHfvjAWExGbgb/5NxTdJ
	R0Hnz9fWLnE7pd8g4AJvhxKXz+Kib1fz2kWnUdF/t2dBgpFDZyUKwHYreq/4bpX3LmqoL5LDhWD
	QszoGiA/gfv49oyan9F2EqF/CGRhE4AjOS18kGjMeY/Y15EgP1e4PGwAfbO9yAD5BdoZAuCZLse
	U85+7eX1GDESvBoBo89bK9uYeIp6cH8=
X-Received: by 2002:a05:600c:4586:b0:434:a734:d279 with SMTP id 5b1f17b1804b1-4390d43e90emr76244575e9.16.1738842440792;
        Thu, 06 Feb 2025 03:47:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFIZzkUxVZHwTwp/9vlaB//pSPOdWyQfr606Hz2/0/dN8YRTYL7OQ4AmFikgXi+GNq+gARynw==
X-Received: by 2002:a05:600c:4586:b0:434:a734:d279 with SMTP id 5b1f17b1804b1-4390d43e90emr76244265e9.16.1738842440442;
        Thu, 06 Feb 2025 03:47:20 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde31e09sm1537030f8f.99.2025.02.06.03.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 03:47:20 -0800 (PST)
Message-ID: <1818165c4cbaedfb7314f4a200a273454ce49b63.camel@redhat.com>
Subject: Re: [RFC PATCH 03/11] sched: Add sched tracepoints for RV task model
From: Gabriele Monaco <gmonaco@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Ingo
 Molnar <mingo@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	linux-trace-kernel@vger.kernel.org
Date: Thu, 06 Feb 2025 12:47:17 +0100
In-Reply-To: <20250206085738.GL7145@noisy.programming.kicks-ass.net>
References: <20250206080952.98478-1-gmonaco@redhat.com>
	 <20250206080952.98478-4-gmonaco@redhat.com>
	 <20250206081942.GJ7145@noisy.programming.kicks-ass.net>
	 <d8187fcd53c62272d7e1a8dad327c4f2a5f07188.camel@redhat.com>
	 <20250206085738.GL7145@noisy.programming.kicks-ass.net>
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

On Thu, 2025-02-06 at 09:57 +0100, Peter Zijlstra wrote:
> On Thu, Feb 06, 2025 at 09:36:41AM +0100, Gabriele Monaco wrote:
>=20
> > > > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > > > index 165c90ba64ea9..fb5f8aa61ef5d 100644
> > > > --- a/kernel/sched/core.c
> > > > +++ b/kernel/sched/core.c
> > > > @@ -491,6 +491,12 @@ sched_core_dequeue(struct rq *rq, struct
> > > > task_struct *p, int flags) { }
> > > > =C2=A0
> > > > =C2=A0#endif /* CONFIG_SCHED_CORE */
> > > > =C2=A0
> > > > +void trace_set_current_state(int state_value)
> > > > +{
> > > > +	trace_sched_set_state_tp(current, current->__state,
> > > > state_value);
> > > > +}
> > > > +EXPORT_SYMBOL(trace_set_current_state);
> > >=20
> > > Urgh, why !?!
> >=20
> > What do you think would be better?
>=20
> So I would think having the tracepoint in-line would be better.
> Because
> as is, everything gets to have this pointless CALL to an empty
> function.
>=20
> If this were x86_64 only, I would suggest using static_call(), but
> barring that, the static_branch() already in the tracepoint is the
> best
> we can do.
>=20

Ok, I see your point now..

Adding the trace_ call inline seems far from trivial to me, but we
could indeed do what's suggested in tracepoint-defs.h and practically
use a static branch to call this trace_set_current_state, not sure if
this is already what you were suggesting, though.

Ignore the inconsistent naming, but something like this should work:

diff --git a/include/linux/sched.h b/include/linux/sched.h
index af9fa18035c7..7b9d84dbc2f5 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -223,6 +223,12 @@ struct user_event_mm;
  *
  * Also see the comments of try_to_wake_up().
  */
+
+#define trace_set_current_state(state_value) do { \
+	if (tracepoint_enabled(sched_set_state_tp))   \
+		do_trace_set_current_state(state_value); \
+} while(0)
+
 #define __set_current_state(state_value)				\
 	do {								\
 		debug_normal_state_change((state_value));		\
@@ -332,7 +338,9 @@ extern void io_schedule_finish(int token);
 extern long io_schedule_timeout(long timeout);
 extern void io_schedule(void);
=20
-extern void trace_set_current_state(int state_value);
+#include <linux/tracepoint-defs.h>
+DECLARE_TRACEPOINT(sched_set_state_tp);
+extern void do_trace_set_current_state(int state_value);
=20
 /**
  * struct prev_cputime - snapshot of system and user cputime
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 149d55195532..9fc2be079bb5 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -491,11 +491,12 @@ sched_core_dequeue(struct rq *rq, struct task_struct =
*p, int flags) { }
=20
 #endif /* CONFIG_SCHED_CORE */
=20
-void trace_set_current_state(int state_value)
+void do_trace_set_current_state(int state_value)
 {
 	trace_sched_set_state_tp(current, current->__state, state_value);
 }
-EXPORT_SYMBOL(trace_set_current_state);
+EXPORT_SYMBOL(do_trace_set_current_state);
+EXPORT_TRACEPOINT_SYMBOL(sched_set_state_tp);
=20
 /*
  * Serialization rules:


