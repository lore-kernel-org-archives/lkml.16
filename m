Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B63278E71
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744370259; cv=none; b=E1TRfFjbcT3g0JoFac7+wB1QkOyhhx4XV8zuJbQbvVdAEn432z420pEaUmaUzygCpYBd72Dnn3vPDDUitg62/4yKNX8omGmRdDbO/IZuWpwYlaXgqDuWp2+wMqgl4aiT5XoYeqxiLZI4ZsTYZPXWVM9+wZ0s3z7Xj2SMdST2/l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744370259; c=relaxed/simple;
	bh=DrjNZmizWKtNRJdVgXAhCpAIzYJRQNjfNpdFEhS8+tc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FSpvFxjhkjmBi7MODcdI8jRYWrVH3973tILqx9AyiCN7LoI06NJefdG/FmmtY7K1nIrcItbBVErOtNmNzfPu4/D4c0vZml55gAdk+feAmti+zhQyvQwPUjiONcoMaYr5JriFhg4Tv313EwNZCMOGyV+zIF/mIiqDH6BZOyWFWJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=anLWymwo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="anLWymwo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744370256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=C0+uD6S7CtDdVRvvjRZyIcRhZZIa6u1wyyxqu9o0fxg=;
	b=anLWymwoVWxPFlJ6olHDI2Nh0TLwKC9HXfoilQec7HG7qocb/P7ZZvcJjjc45Avtge1XJr
	O0l7fsvBQQNrvCLRwaIWa8q4C49xkHHUPY5fcXE9JgoHnBXB4X45Z65FG6kKhls/z1nIZ+
	wVOo7gX8NCW164U8axN/ZIPr/RqW8h0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-FNgGj9ugNhORcjPFoPzp8Q-1; Fri, 11 Apr 2025 07:17:35 -0400
X-MC-Unique: FNgGj9ugNhORcjPFoPzp8Q-1
X-Mimecast-MFC-AGG-ID: FNgGj9ugNhORcjPFoPzp8Q_1744370254
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43ceeaf1524so12297895e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 04:17:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744370254; x=1744975054;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C0+uD6S7CtDdVRvvjRZyIcRhZZIa6u1wyyxqu9o0fxg=;
        b=mKB6vrQzBWU2RxCJnSD44uPTuN9IRFjq+YxJIIydw/EK7GvnMViWAhYSh1SOBZ6iq+
         2VVSxxg5Gar3VleWoH99mTJLNt/Zsi8GOJ5DqAd91MK2nAqvVttWvm0oVfFVV6OKBtoN
         xIPjNCK9+6DI6Sy9XAyYlyqFKfysn9xdOfNb2OlmM4BuoNjprb7zBcTIUclkEFXC/7gD
         5VgvScN8t9aKUW2VKFB7l696Yh+PWnHnUtdWTvXBu+tWHFoqs8P4tfAkWW6I7LowpTe2
         0itW2jd1/uGw0+/dk1FoszC086rg+8l1MsuH6dVKiLRikyHBzy5MJxZ6nM99THJ3+4G7
         D4Qg==
X-Forwarded-Encrypted: i=1; AJvYcCW++ID4OAZsBArQC2Tr/4ARhASTJfZ+PkA4fnaDVG3Enq8U+XMZ2qZkWUp3n3/QUXFjGGzwBpZUUuf1oJw=@vger.kernel.org
X-Gm-Message-State: AOJu0YylmHCSwKFSV+uuLKHi8hqlJBxoOhSPmt4cs5EGGmJ2wnpivovg
	FHPcebf4QYL4BGAyMuGt/JxY6NkjlWFQ1/5RqQUPjcS/r7PqXhhQB6FCdn+9+R3tvQ532p6+U9I
	xcuNrqCnA0QLxKa26+UPo9PktRWLnxdBeZu10uEVlP52ajYfi5vAcaOc1hYugXg==
X-Gm-Gg: ASbGncstUXDTMjSSlISibLCCwvY79Vfnx3n6T9TwX6JjG+Es0Ejb9VTmByL12kPfuMN
	IGL1zwmXf9WgUzQpes6rKot7K4qAYqZDh0f07hnKWwaZVbv8xGgIi2ft+IKod85kUJ0/LuNaFKB
	tPQBM1tzl7WVyl4e7gQ77+PvIKuBS2jEV+sAtzr+I85i4HxFynSmNdC3Y797qZMF4nOCj8n53AV
	T4GDWrRGKTPVeQSoMkwICNAD2c0s1mCVZjT0bUL/SqEQzjiFVC/7JDdzo0XShIy80HJuIF3y82u
	vBOikZuZc7Mh602bzjrKlookdbYt20iP20aF3Q==
X-Received: by 2002:a05:600c:c87:b0:43d:b33:679c with SMTP id 5b1f17b1804b1-43f39703f1cmr21202115e9.14.1744370253754;
        Fri, 11 Apr 2025 04:17:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEu5BZQg9v9iDNKZyWhCKsOKXFE0K3ALj/z3npJEc/xk124/mHTVBxfzJlwFTZ4POEuZDU3og==
X-Received: by 2002:a05:600c:c87:b0:43d:b33:679c with SMTP id 5b1f17b1804b1-43f39703f1cmr21201935e9.14.1744370253316;
        Fri, 11 Apr 2025 04:17:33 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f20626c19sm85983055e9.15.2025.04.11.04.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 04:17:32 -0700 (PDT)
Message-ID: <ce9ef5e41c17953010bd31d19e7d2840cd533066.camel@redhat.com>
Subject: Re: [PATCH v2 13/22] rv: Add support for LTL monitors
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: john.ogness@linutronix.de
Date: Fri, 11 Apr 2025 13:17:30 +0200
In-Reply-To: <5dbd62940b252ee49777e9c4298eadd644bf6526.1744355018.git.namcao@linutronix.de>
References: <cover.1744355018.git.namcao@linutronix.de>
	 <5dbd62940b252ee49777e9c4298eadd644bf6526.1744355018.git.namcao@linutronix.de>
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

On Fri, 2025-04-11 at 09:37 +0200, Nam Cao wrote:
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
=A0=C2=A0=C2=A0 |=C2=A0 97 +++
> =C2=A0Documentation/trace/rv/monitor_synthesis.rst=C2=A0 | 141 ++++-
> =C2=A0include/linux/rv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 56 +-
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
=A0 | 552
> ++++++++++++++++++
> =C2=A0tools/verification/rvgen/rvgen/ltl2k.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 242 ++++++++
> =C2=A0.../verification/rvgen/templates/ltl2k/main.c | 102 ++++
> =C2=A0.../rvgen/templates/ltl2k/trace.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 14 +
> =C2=A015 files changed, 1431 insertions(+), 25 deletions(-)
> =C2=A0create mode 100644 Documentation/trace/rv/linear_temporal_logic.rst
> =C2=A0create mode 100644 include/rv/ltl_monitor.h
> =C2=A0create mode 100644 tools/verification/rvgen/.gitignore
> =C2=A0create mode 100644 tools/verification/rvgen/rvgen/ltl2ba.py
> =C2=A0create mode 100644 tools/verification/rvgen/rvgen/ltl2k.py
> =C2=A0create mode 100644 tools/verification/rvgen/templates/ltl2k/main.c
> =C2=A0create mode 100644 tools/verification/rvgen/templates/ltl2k/trace.h
>=20
> diff --git a/Documentation/trace/rv/index.rst
> b/Documentation/trace/rv/index.rst
> index 8e411b76ec82..2a27f6bc9429 100644
> --- a/Documentation/trace/rv/index.rst
> +++ b/Documentation/trace/rv/index.rst
> ...
> =C2=A0
> diff --git a/include/linux/rv.h b/include/linux/rv.h
> index c7c18c06911b..c8320fa3a94b 100644
> --- a/include/linux/rv.h
> +++ b/include/linux/rv.h
> @@ -10,6 +10,10 @@
> =C2=A0#define MAX_DA_NAME_LEN	32
> =C2=A0
> =C2=A0#ifdef CONFIG_RV
> +#include <linux/bitops.h>
> +#include <linux/types.h>
> +#include <linux/array_size.h>
> +
> =C2=A0/*
> =C2=A0 * Deterministic automaton per-object variables.
> =C2=A0 */
> @@ -18,6 +22,52 @@ struct da_monitor {
> =C2=A0	unsigned int	curr_state;
> =C2=A0};
> =C2=A0
> +/*
> + * In the future, if the number of atomic propositions or the size
> of Buchi automaton is larger, we
> + * can switch to dynamic allocation. For now, the code is simpler
> this way.
> + */
> +#define RV_MAX_LTL_ATOM 32
> +#define RV_MAX_BA_STATES 32
> +
> +/**
> + * struct ltl_monitor - A linear temporal logic runtime verification
> monitor
> + * @states:	States in the Buchi automaton. As Buchi automaton is
> a
> + *		non-deterministic state machine, the monitor can be
> in multiple states
> + *		simultaneously. This is a bitmask of all possible
> states.
> + *		If this is zero, that means either:
> + *		=C2=A0=C2=A0=C2=A0 - The monitor has not started yet (e.g. because
> not all atomic propositions are
> + *		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 known).
> + *		=C2=A0=C2=A0=C2=A0 - there is no possible state to be in. In other
> words, a violation of the
> + *		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LTL property is detected.
> + * @atoms:	The values of atomic propositions.
> + * @unknown_atoms: Atomic propositions which are still unknown.
> + */
> +struct ltl_monitor {
> +#ifdef CONFIG_RV_LTL_MONITOR
> +	DECLARE_BITMAP(states, RV_MAX_BA_STATES);
> +	DECLARE_BITMAP(atoms, RV_MAX_LTL_ATOM);
> +	DECLARE_BITMAP(unknown_atoms, RV_MAX_LTL_ATOM);
> +#endif
> +};

Mmh, we have a lot of those ifdefs in quite inappropriate places, but I
think we can do better than this.

What about something like:

#ifdef CONFIG_RV_LTL_MONITOR

struct ltl_monitor {
	DECLARE_BITMAP(states, RV_MAX_BA_STATES);
	DECLARE_BITMAP(atoms, RV_MAX_LTL_ATOM);
	DECLARE_BITMAP(unknown_atoms, RV_MAX_LTL_ATOM);
};

static inline bool rv_ltl_valid_state(struct ltl_monitor *mon)
{
	...
}

static inline bool rv_ltl_all_atoms_known(struct ltl_monitor *mon)
{
	...
}

#else

/*
 * Leave the struct empty not to use up space
 * In a later patch we could do the same for DAs..
 */
struct ltl_monitor { };

#endif

> +
> +static inline bool rv_ltl_valid_state(struct ltl_monitor *mon)
> +{
> +	for (int i =3D 0; i < ARRAY_SIZE(mon->states); ++i) {
> +		if (mon->states[i])
> +			return true;
> +	}
> +	return false;
> +}
> +
> +static inline bool rv_ltl_all_atoms_known(struct ltl_monitor *mon)
> +{
> +	for (int i =3D 0; i < ARRAY_SIZE(mon->unknown_atoms); ++i) {
> +		if (mon->unknown_atoms[i])
> +			return false;
> +	}
> +	return true;
> +}
> +
> =C2=A0/*
> =C2=A0 * Per-task RV monitors count. Nowadays fixed in
> RV_PER_TASK_MONITORS.
> =C2=A0 * If we find justification for more monitors, we can think about
> @@ -27,11 +77,9 @@ struct da_monitor {
> =C2=A0#define RV_PER_TASK_MONITORS		1
> =C2=A0#define RV_PER_TASK_MONITOR_INIT	(RV_PER_TASK_MONITORS)
> =C2=A0
> -/*
> - * Futher monitor types are expected, so make this a union.
> - */
> =C2=A0union rv_task_monitor {
> -	struct da_monitor da_mon;
> +	struct da_monitor	da_mon;
> +	struct ltl_monitor	ltl_mon;
> =C2=A0};
> =C2=A0
> =C2=A0#ifdef CONFIG_RV_REACTORS
> diff --git a/include/rv/ltl_monitor.h b/include/rv/ltl_monitor.h
> new file mode 100644
> index 000000000000..78f5a1197665
> --- /dev/null
> +++ b/include/rv/ltl_monitor.h

You hate macros don't you? :)
Anyway I really like your approach, very neat.

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
> +#else
> +static void rv_cond_react(struct task_struct *task)
> +{
> +}
> +#endif
> +
> +static int ltl_monitor_slot =3D RV_PER_TASK_MONITOR_INIT;
> +
> +static void ltl_atoms_fetch(struct task_struct *task, struct
> ltl_monitor *mon);
> +static void ltl_atoms_init(struct task_struct *task, struct
> ltl_monitor *mon, bool task_creation);
> +
> +static struct ltl_monitor *ltl_get_monitor(struct task_struct *task)
> +{
> +	return &task->rv[ltl_monitor_slot].ltl_mon;
> +}

This means ltl monitors only support per-task, right?
It shouldn't take much effort putting an ifdef chain here and defining e.g.
PER_CPU in the header file to choose a different get_monitor.
Or directly an ltl_monitor_implicit.h

I think this patch is ready without it, just trying to brainstorm how we co=
uld
potentially extend this.

I need more time to play with these, but it looks promising.

Thanks,
Gabriele

