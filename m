Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC8223534D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744796106; cv=none; b=atFUyJm2oDx7yjTP+uLaBIvI3NURfC1GKFnY5vuKWQgXxzJ3jA5JfAbHDL0FQewEhNMSVJsP9QCkWt3aRgfP60CkBj2bIVqLxtId3yc2ui9tij+ONsMQIcnlNRp6KpJ8h3sQ4A8Elk8AImBaNlE/WfVekXaY4AF27G8w4iX+ygs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744796106; c=relaxed/simple;
	bh=0LsiRsEyAZf+wy+fLg08t6UMmm0tdGr02V0DO9CEeko=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X4VAidcS2qT5U4qauWF+NnOMHiUis3uIOr6qDs+wpVfse6izs+Mw+ybbpYEh2cHhhUVR51Po9+qgflCcAs8kv4EN+SgfXUM7GbbrEXS9DdQPynXEkkYNeyrQzjRgXVhV185bGxFtCcgFi5R6uFlBEqUnihzPXA+8pW6T4RPu/SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eFMieImb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eFMieImb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744796101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=R38kvr6YYwHybVl0KvxrQLj4rrauk+WxuzNkAEl5+ic=;
	b=eFMieImbuCc4kYKAk0RwoV/KbaMBAycKbpMY9q3gchRUovr63rs17/vyuquKGuFQ3wWUpt
	lCkW1WRLKg/9N1HM3q4tpHZkDdGCXW6tTdcmxudmM9PfoceLBMTTqzkxEhe0bsak4uDs8X
	3t56Oyvx6jwFXIsfPZOKdc/w7wGHeOs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-Zj1ZnPilP4eSfVCL3JgAMQ-1; Wed, 16 Apr 2025 05:34:57 -0400
X-MC-Unique: Zj1ZnPilP4eSfVCL3JgAMQ-1
X-Mimecast-MFC-AGG-ID: Zj1ZnPilP4eSfVCL3JgAMQ_1744796097
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac27d8ac365so452313966b.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:34:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744796096; x=1745400896;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R38kvr6YYwHybVl0KvxrQLj4rrauk+WxuzNkAEl5+ic=;
        b=o1z8s78h1TkAyS1Jc20ATV9YCAL6AN9QHWv9k1STK1h+N4WUY+BM6QPH/LE2wd812M
         metVR6/IflEAMplvqgSgDsEXFfxm6ukmOttVgyLph0f4I9/HsdLvtqL3UeZ/v/JsWkj4
         pxYGGi8TU2USAKv4JRHYfAI6Lx3h+IWdynab2hqstKpE/6fw4L434E559LFwW3K3Q94P
         ii5aGw6UDpBkCtM955c7GFZNw/A+iBT6S3yWvUDBxMZyWSsoGGy0MoIMa4ei8lUSRkUZ
         zaXib32KZ0whjsVlH9rB9OvyifS27xGWoHgh7GKrIIfx4rqESf6tdW6nb5C2dSTRkLup
         uDhA==
X-Forwarded-Encrypted: i=1; AJvYcCXWmpu7l1kCMjub/dXAueE9DtJ8vCnzxETQ6GoZhfI8ihJtCNKMTKyQHTgDWDsnZy+e7X5irxP9my+eqiw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5elyOUPWNaAOWznXZAMK+yU+iQvU5g4mBti4cwF/M8PveWMo+
	Df9M7jH0pfE4QH5SMXDCSVyJZCMLBc8i5e9+K+iypNv4tyXGR5xMYcl/bwKE/D996fWV1+vmiRq
	G4CrRua5hKr+598lkZAd+r3VYCtpzpbPRg5SeVYZQ5F49kXR77g/XgZId92MThhS+Gwf/wkBf
X-Gm-Gg: ASbGncsbZZ24ep8tumLIkO3KCUh/uLymuvaJQWDBfeVCxM6pRnkd63z52BokrxbyWvz
	aV+cqF96XA9ifBOQoVA+Sfdy0TOmeOe3R5Tsq+6HZpPajI/PQikvFpD16ufcIG/8nRaF5DOjtGq
	vL6CDnEOSC2dQjtit7RqN7bcDyml8GC4exLEeEM22Y4zjROhDX/K0YglmmS4i8N5Ot3cDBrlJqr
	hoAF8aNR2PkHe9OuaGxlEVuOFHA+O2KCLus314BJ80jNOadPkZHn+AuKaqupVkLstCIBYDJvTET
	KTZjeoBCPEa0gvqn6oSeSgAdmzDOB92KihgLDI4=
X-Received: by 2002:a17:906:f594:b0:aca:d4d0:a735 with SMTP id a640c23a62f3a-acb42ad330dmr92702566b.43.1744796096556;
        Wed, 16 Apr 2025 02:34:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGA3tINUfuvkxHAN/j7OpwBay5sdkkyLpxkjrrvfKwXbTUdvRoKXKWFVl9vjG5myTqzr3sZpg==
X-Received: by 2002:a17:906:f594:b0:aca:d4d0:a735 with SMTP id a640c23a62f3a-acb42ad330dmr92699866b.43.1744796096039;
        Wed, 16 Apr 2025 02:34:56 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.134.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3d128932sm90388766b.88.2025.04.16.02.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 02:34:55 -0700 (PDT)
Message-ID: <4edad1940b2d05f1997895d4bbc11f02a921e8e5.camel@redhat.com>
Subject: Re: [PATCH v3 13/22] rv: Add support for LTL monitors
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: john.ogness@linutronix.de
Date: Wed, 16 Apr 2025 11:34:53 +0200
In-Reply-To: <19f424c910bfa0f4854117e3f8771aeb6e98a9d2.1744785335.git.namcao@linutronix.de>
References: <cover.1744785335.git.namcao@linutronix.de>
	 <19f424c910bfa0f4854117e3f8771aeb6e98a9d2.1744785335.git.namcao@linutronix.de>
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


On Wed, 2025-04-16 at 08:51 +0200, Nam Cao wrote:
> While attempting to implement DA monitors for some complex
> specifications,
> deterministic automaton is found to be inappropriate as the
> specification
> language. The automaton is complicated, hard to understand, and
> error-prone.
>=20
> For these cases, linear temporal logic is more suitable as the
> specification language.
>=20
> Add support for linear temporal logic runtime verification monitor.
>=20
> For all the details, see the documentations added by this commit.
>=20
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
> =C2=A0Documentation/trace/rv/index.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0.../trace/rv/linear_temporal_logic.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 119 ++++
> =C2=A0Documentation/trace/rv/monitor_synthesis.rst=C2=A0 | 141 ++++-
> =C2=A0include/linux/rv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 62 +-
> =C2=A0include/rv/ltl_monitor.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 184 ++++++
> =C2=A0kernel/fork.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 5 +-
> =C2=A0kernel/trace/rv/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 +
> =C2=A0kernel/trace/rv/rv_trace.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 47 ++
> =C2=A0tools/verification/rvgen/.gitignore=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
> =C2=A0tools/verification/rvgen/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0tools/verification/rvgen/__main__.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> =C2=A0tools/verification/rvgen/rvgen/ltl2ba.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 558
> ++++++++++++++++++
> =C2=A0tools/verification/rvgen/rvgen/ltl2k.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 242 ++++++++
> =C2=A0.../rvgen/rvgen/templates/ltl2k/main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 102 ++++
> =C2=A0.../rvgen/rvgen/templates/ltl2k/trace.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 14 +
> =C2=A015 files changed, 1465 insertions(+), 25 deletions(-)
> =C2=A0create mode 100644 Documentation/trace/rv/linear_temporal_logic.rst
> =C2=A0create mode 100644 include/rv/ltl_monitor.h
> =C2=A0create mode 100644 tools/verification/rvgen/.gitignore
> =C2=A0create mode 100644 tools/verification/rvgen/rvgen/ltl2ba.py
> =C2=A0create mode 100644 tools/verification/rvgen/rvgen/ltl2k.py
> =C2=A0create mode 100644
> tools/verification/rvgen/rvgen/templates/ltl2k/main.c
> =C2=A0create mode 100644
> tools/verification/rvgen/rvgen/templates/ltl2k/trace.h
>=20
> [...]
> diff --git a/include/rv/ltl_monitor.h b/include/rv/ltl_monitor.h
> new file mode 100644
> index 000000000000..78f5a1197665
> --- /dev/null
> +++ b/include/rv/ltl_monitor.h
> @@ -0,0 +1,184 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/**
> + * This file must be combined with the $(MODEL_NAME).h file
> generated by
> + * tools/verification/rvgen.
> + */
> +
> +#include <linux/args.h>
> +#include <linux/rv.h>
> +#include <linux/stringify.h>
> +#include <linux/seq_buf.h>
> +#include <rv/instrumentation.h>
> +#include <trace/events/task.h>
> +#include <trace/events/sched.h>
> +
> +#ifndef MONITOR_NAME
> +#error "MONITOR_NAME macro is not defined. Did you include
> $(MODEL_NAME).h generated by rvgen?"
> +#endif
> +
> +#ifdef CONFIG_RV_REACTORS
> +#define RV_MONITOR_NAME CONCATENATE(rv_, MONITOR_NAME)
> +static struct rv_monitor RV_MONITOR_NAME;
> +
> +static void rv_cond_react(struct task_struct *task)
> +{
> +	if (!rv_reacting_on() || !RV_MONITOR_NAME.react)
> +		return;
> +	RV_MONITOR_NAME.react("rv: "__stringify(MONITOR_NAME)":
> %s[%d]: violation detected\n",
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 task->comm, task->pid);
> +}

What about adding more context here (see below).

> +#else
> +static void rv_cond_react(struct task_struct *task)
> +{
> +}
> +#endif
> +
> [...]
> diff --git a/kernel/trace/rv/rv_trace.h b/kernel/trace/rv/rv_trace.h
> index 99c3801616d4..f9fb848bae91 100644
> --- a/kernel/trace/rv/rv_trace.h
> +++ b/kernel/trace/rv/rv_trace.h
> @@ -127,6 +127,53 @@ DECLARE_EVENT_CLASS(error_da_monitor_id,
> =C2=A0// Add new monitors based on CONFIG_DA_MON_EVENTS_ID here
> =C2=A0
> =C2=A0#endif /* CONFIG_DA_MON_EVENTS_ID */
> +#if CONFIG_LTL_MON_EVENTS_ID
> +TRACE_EVENT(event_ltl_monitor_id,
> +
> +	TP_PROTO(struct task_struct *task, char *states, char
> *atoms, char *next),
> +
> +	TP_ARGS(task, states, atoms, next),
> +
> +	TP_STRUCT__entry(
> +		__string(comm, task->comm)
> +		__field(pid_t, pid)
> +		__string(states, states)
> +		__string(atoms, atoms)
> +		__string(next, next)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(comm);
> +		__entry->pid =3D task->pid;
> +		__assign_str(states);
> +		__assign_str(atoms);
> +		__assign_str(next);
> +	),
> +
> +	TP_printk("%s[%d]: (%s) x (%s) -> (%s)", __get_str(comm),
> __entry->pid, __get_str(states),
> +		=C2=A0 __get_str(atoms), __get_str(next))
> +);
> +
> +TRACE_EVENT(error_ltl_monitor_id,
> +
> +	TP_PROTO(struct task_struct *task),
> +
> +	TP_ARGS(task),
> +
> +	TP_STRUCT__entry(
> +		__string(comm, task->comm)
> +		__field(pid_t, pid)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(comm);
> +		__entry->pid =3D task->pid;
> +	),
> +
> +	TP_printk("%s[%d]: violation detected", __get_str(comm),

In your workflow you're probably using events and errors together, but
wouldn't it help printing the atoms together with the violation
detected?
At least to give a clue on the error in case the user doesn't want to
see the entire trace (which might be needed for a full debug though).

The same could be said from reactors, the user doesn't have much
information to infer what went wrong.

> __entry->pid)
> +);
> +// Add new monitors based on CONFIG_LTL_MON_EVENTS_ID here
> +#endif /* CONFIG_LTL_MON_EVENTS_ID */
> =C2=A0#endif /* _TRACE_RV_H */
> =C2=A0
> =C2=A0/* This part must be outside protection */
> [...]
> diff --git a/tools/verification/rvgen/rvgen/ltl2k.py
> b/tools/verification/rvgen/rvgen/ltl2k.py
> new file mode 100644
> index 000000000000..e2a7c4bcccc9
> --- /dev/null
> +++ b/tools/verification/rvgen/rvgen/ltl2k.py
> @@ -0,0 +1,242 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +from pathlib import Path
> +from . import generator
> +from . import ltl2ba
> +
> +COLUMN_LIMIT =3D 100
> +
> +def line_len(line: str) -> int:
> +=C2=A0=C2=A0=C2=A0 tabs =3D line.count('\t')
> +=C2=A0=C2=A0=C2=A0 return tabs * 7 + len(line)
> +
> +def break_long_line(line: str, indent=3D'') -> list[str]:
> +=C2=A0=C2=A0=C2=A0 result =3D []
> +=C2=A0=C2=A0=C2=A0 while line_len(line) > COLUMN_LIMIT:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i =3D line[:COLUMN_LIMIT - li=
ne_len(line)].rfind(' ')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 result.append(line[:i])
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 line =3D indent + line[i + 1:=
]
> +=C2=A0=C2=A0=C2=A0 if line:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 result.append(line)
> +=C2=A0=C2=A0=C2=A0 return result
> +
> +def build_condition_string(node: ltl2ba.GraphNode):
> +=C2=A0=C2=A0=C2=A0 if not node.labels:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "(true)"
> +
> +=C2=A0=C2=A0=C2=A0 result =3D "("
> +
> +=C2=A0=C2=A0=C2=A0 first =3D True
> +=C2=A0=C2=A0=C2=A0 for label in sorted(node.labels):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not first:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 resul=
t +=3D " && "
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 result +=3D label
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 first =3D False
> +
> +=C2=A0=C2=A0=C2=A0 result +=3D ")"
> +
> +=C2=A0=C2=A0=C2=A0 return result
> +
> +def abbreviate_atoms(atoms: list[str]) -> list[str]:
> +=C2=A0=C2=A0=C2=A0 abbrs =3D list()
> +=C2=A0=C2=A0=C2=A0 for atom in atoms:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size =3D 1
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 while True:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abbr =
=3D atom[:size]
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if su=
m(a.startswith(abbr) for a in atoms) =3D=3D 1:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 break
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size =
+=3D 1
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abbrs.append(abbr.lower())
> +=C2=A0=C2=A0=C2=A0 return abbrs

I get this is just a matter of preference, so feel free to ignore my
suggestion.
This abbreviation algorithm doesn't work too well with atoms starting
with the same substring and can produce some unexpected result:

LTL_BLOCK_ON_RT_MUTEX:                b,
LTL_KERNEL_THREAD:                    ke,
LTL_KTHREAD_SHOULD_STOP:              kt,
LTL_NANOSLEEP:                        n,
LTL_PI_FUTEX:                         p,
LTL_RT:                               r,
LTL_SLEEP:                            s,
LTL_TASK_IS_MIGRATION:                task_is_m,
LTL_TASK_IS_RCU:                      task_is_r,
LTL_WAKE:                             wa,
LTL_WOKEN_BY_EQUAL_OR_HIGHER_PRIO:    woken_by_e,
LTL_WOKEN_BY_HARDIRQ:                 woken_by_h,
LTL_WOKEN_BY_NMI:                     woken_by_n,

"woken_by_*" and "task_is_*" atom can get unnecessarily long and
while reading "kt" I might think about kernel_thread.

I was thinking about something like:

LTL_BLOCK_ON_RT_MUTEX:                b_o_r_m
LTL_KERNEL_THREAD:                    k_t
LTL_KTHREAD_SHOULD_STOP:              k_s_s
LTL_NANOSLEEP:                        n
LTL_PI_FUTEX:                         p_f
LTL_RT:                               r
LTL_SLEEP:                            s
LTL_TASK_IS_MIGRATION:                t_i_m
LTL_TASK_IS_RCU:                      t_i_r
LTL_WAKE:                             w
LTL_WOKEN_BY_EQUAL_OR_HIGHER_PRIO:    w_b_e_o_h_p
LTL_WOKEN_BY_HARDIRQ:                 w_b_h
LTL_WOKEN_BY_NMI:                     w_b_n

or even

LTL_BLOCK_ON_RT_MUTEX:                b_m
LTL_KERNEL_THREAD:                    k_t
LTL_KTHREAD_SHOULD_STOP:              k_s_s
LTL_NANOSLEEP:                        n
LTL_PI_FUTEX:                         p_f
LTL_RT:                               r
LTL_SLEEP:                            s
LTL_TASK_IS_MIGRATION:                t_m
LTL_TASK_IS_RCU:                      t_r
LTL_WAKE:                             w
LTL_WOKEN_BY_EQUAL_OR_HIGHER_PRIO:    w_e_h_p
LTL_WOKEN_BY_HARDIRQ:                 w_h
LTL_WOKEN_BY_NMI:                     w_n

I used the following code to come up with this:

def abbreviate_atoms(atoms: list[str]) -> list[str]:
    # completely arbitrary..
    skip =3D [ "is", "by", "or", "and" ]
    def abbr (n, s):
        return '_'.join(word[:n] for word in s.lower().split('_') if word n=
ot in skip)
    for n in range(1, 32):
        abbrs =3D [abbr(n, a) for a in atoms]
        if len(abbrs) =3D=3D len(set(abbrs)):
            return abbrs

Which could even be tuned to use 2 letters per block instead of 1
(improving readability by a lot actually)..
'bl_on_rt_mu', 'ke_th', 'kt_sh_st', 'na', 'pi_fu', 'rt', 'sl', 'ta_mi',
'ta_rc', 'wa', 'wo_eq_hi_pr', 'wo_ha', 'wo_nm'

What do you think?

Thanks,
Gabriele

