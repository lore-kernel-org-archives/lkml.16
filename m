Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630422973CD
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744723346; cv=none; b=BiOoqdd+h+z3oAiWlQfsYl1AWH+aFjRWl75sqaqRZW+8x9rpLA797KsTHyBBOVo+Iqf+TO/eETfzJTQzk9Klnhfv7wiWiUn4YJ7Nd1eAi9Gmgy8KWtbdve+4BpPrOctKJypF4MXqFZmh6P/63FKZfImY4NgafXi53rYEjsE99Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744723346; c=relaxed/simple;
	bh=uhrdF/Esb1J5fkXzShpFrMmHaVmoJl8veFfF6D6zqs0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nVQ4DlL2lp3Ks7AUxSpmhgPG/JJU1jrzSkbBittEGqoRCRYgt6ygEKTJFbXdAdtwynurXs9Wzjyk5Qx99VRRb8gCL7EMtMojnofrE1xdNITgTKowvRtdqyySKdnHkc91l5EOo48QuwGhiUhuovyvurb/V9BGCS9dGVKfAEfBOu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zf2nsq/P; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zf2nsq/P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744723343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uhrdF/Esb1J5fkXzShpFrMmHaVmoJl8veFfF6D6zqs0=;
	b=Zf2nsq/Pu92GpD64BydoDZ9PMfZ5YGWLnMeeZL81Wwr8LJ56RVJ2WQMeW7RqxgxpoGB/SF
	gyTs2i5htDXB00F6FqOMmoUzAv6y2Yocgv/TTxlDcFoypfaMOrPV7z8cxi7Og94mA/ZE2U
	uaue/pmcFoTplPBHfyIoMM8GCSgd6g4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-VOEYzjC4PzmjK7-USnDLOg-1; Tue, 15 Apr 2025 09:22:12 -0400
X-MC-Unique: VOEYzjC4PzmjK7-USnDLOg-1
X-Mimecast-MFC-AGG-ID: VOEYzjC4PzmjK7-USnDLOg_1744723332
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d734da1a3so28475055e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:22:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744723331; x=1745328131;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uhrdF/Esb1J5fkXzShpFrMmHaVmoJl8veFfF6D6zqs0=;
        b=b7XT664M1M/N4DfPcXKSiSCt36849uQoOvSGoBDaAnMXodG15we8S5VimeUO+zX8b0
         gea/FMoN/p3DhPxY9rVDlf6YAgSYwtwlmjUGqnlysDyhUFRXASXeiR7BjBZJRza0VX4M
         higv4ktCgZb71ZJ//OHFSSsu8lcFUio5dbAjMfrKH/qlE1YG0xo1OJr941glVQkG3XDR
         nGxGVJ5hS/pjoZaxPu4qdQ8qz63GvHin+meuOGR3LXLV42YSkI3xp5wZIz9uc+37GBaF
         Mij4VzCbY0C/lCXIU7L3Eu7KHk1wVmYaVorrMpWZ1IdApYsBW2dgZDslAxouvYeqnKs2
         jm5A==
X-Forwarded-Encrypted: i=1; AJvYcCXsdy+LjfkhEaUk9xREg729CuxxAM1q25mfuoG3mgF/820DkFwAmJVhtvn3s5VmGoi7Wh0fMbwrw7dGlRg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoVRXUdlGE3bcFhWf/mBARF7SleLigtTUoz1qW762tgbdPof/p
	674sKTtWZJsn1vHs0vbkpM9EIdqInPw/MRsIArjT86EvQMtA4bmR47BdjjcqWHvWehACPxba9ak
	+3+VotfSO7tVFi/TqSfeF+fxK5qSTYdCqArc6MBgly12tc3jtnGtGG2rxBPhP5g==
X-Gm-Gg: ASbGnctJek9oPA+XYsviN5U793n98jTTyj5Ln2khEnzAjVzwTd9Qb+hXU1ntp0wBBnM
	AwzKPyoC7hYmg1i6qMkLsY4tLqi+28DpjgU5F5n0iJ0ypB4AFMDQHw97ZixGDC+qRThNruo+AIT
	qyim3rQc7/7hu3rZhvBZnDakNQil5Yu+aPA0kQm6zPdBTY2hyaLKeYqZ/YTko8GZVgGf85eqNrK
	Ak5HbF1U1NIvJIsNWTBuCd0A/KMsQFfRWckgEpKh3l+MKvJVqQ+F7cBeZ/B9hSJORmdfaGRpXha
	WfeuJIqPle+7f2KZ7webnxFws7lBsJWiHxAM8CQ=
X-Received: by 2002:a05:600c:3b9d:b0:43d:934:ea97 with SMTP id 5b1f17b1804b1-43f3a9af8c5mr158421135e9.27.1744723331642;
        Tue, 15 Apr 2025 06:22:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrVIzsw/MlpQYyplsS+Pm66g9UgnCSwiS+3mjL8gHm4frhdQDR9k80Sd+ubKTZl8EgLKeS4w==
X-Received: by 2002:a05:600c:3b9d:b0:43d:934:ea97 with SMTP id 5b1f17b1804b1-43f3a9af8c5mr158420855e9.27.1744723331224;
        Tue, 15 Apr 2025 06:22:11 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.134.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f207c8fb4sm211039285e9.35.2025.04.15.06.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:22:10 -0700 (PDT)
Message-ID: <63d8320abb309ef649780af44d14b9d993bab697.camel@redhat.com>
Subject: Re: [PATCH v2 13/22] rv: Add support for LTL monitors
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: john.ogness@linutronix.de
Date: Tue, 15 Apr 2025 15:22:09 +0200
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
> @@ -8,6 +8,7 @@ Runtime Verification
> =C2=A0
> =C2=A0=C2=A0=C2=A0 runtime-verification.rst
> =C2=A0=C2=A0=C2=A0 deterministic_automata.rst
> +=C2=A0=C2=A0 linear_temporal_logic.rst
> =C2=A0=C2=A0=C2=A0 monitor_synthesis.rst
> =C2=A0=C2=A0=C2=A0 da_monitor_instrumentation.rst
> =C2=A0=C2=A0=C2=A0 monitor_wip.rst
> diff --git a/Documentation/trace/rv/linear_temporal_logic.rst
> b/Documentation/trace/rv/linear_temporal_logic.rst
> new file mode 100644
> index 000000000000..68574370eec3
> --- /dev/null
> +++ b/Documentation/trace/rv/linear_temporal_logic.rst
> @@ -0,0 +1,97 @@
> +Introduction
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Runtime verification monitor is a verification technique which
> checks that the kernel follows a
> +specification. It does so by using tracepoints to monitor the
> kernel's execution trace, and
> +verifying that the execution trace sastifies the specification.
> +
> +Initially, the specification can only be written in the form of
> deterministic automaton (DA).
> +However, while attempting to implement DA monitors for some complex
> specifications, deterministic
> +automaton is found to be inappropriate as the specification
> language. The automaton is complicated,
> +hard to understand, and error-prone.
> +
> +Thus, RV monitors based on linear temporal logic (LTL) are
> introduced. This type of monitor uses LTL
> +as specification instead of DA. For some cases, writing the
> specification as LTL is more concise and
> +intuitive.
> +
> +Documents regarding LTL are widely available on the internet, this
> document will not go into
> +details.
> +
> +Grammar
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Unlike some existing syntax, kernel's implementation of LTL is more
> verbose. This is motivated by
> +considering that the people who read the LTL specifications may not
> be well-versed in LTL.
> +
> +Grammar:
> +=C2=A0=C2=A0=C2=A0 ltl ::=3D opd | ( ltl ) | ltl binop ltl | unop ltl
> +
> +Operands (opd):
> +=C2=A0=C2=A0=C2=A0 true, false, user-defined names consisting of upper-c=
ase
> characters, digits, and underscore.
> +
> +Unary Operators (unop):
> +=C2=A0=C2=A0=C2=A0 always
> +=C2=A0=C2=A0=C2=A0 eventually
> +=C2=A0=C2=A0=C2=A0 not
> +
> +Binary Operators (binop):
> +=C2=A0=C2=A0=C2=A0 until
> +=C2=A0=C2=A0=C2=A0 and
> +=C2=A0=C2=A0=C2=A0 or
> +=C2=A0=C2=A0=C2=A0 imply
> +=C2=A0=C2=A0=C2=A0 equivalent
> +
> +This grammar is ambiguous: operator precedence is not defined.
> Parentheses must be used.
> +
> +Example linear temporal logic
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +.. code-block::
> +
> +=C2=A0=C2=A0 RAIN imply (GO_OUTSIDE imply HAVE_UMBRELLA)
> +
> +means: if it is raining, going outside means having an umbrella.
> +
> +.. code-block::
> +
> +=C2=A0=C2=A0 RAIN imply (WET until not RAIN)
> +
> +means: if it is raining, it is going to be wet until the rain stops.
> +
> +.. code-block::
> +
> +=C2=A0=C2=A0 RAIN imply eventually not RAIN
> +
> +means: if it is raining, rain will eventually stop.
> +
> +The above examples are referring to the current time instance only.
> For kernel verification, the
> +`always` operator is usually desirable, to specify that something is
> always true at the present and
> +for all future. For example::
> +
> +=C2=A0=C2=A0=C2=A0 always (RAIN imply eventually not RAIN)
> +
> +means: *all* rain eventually stops.
> +
> +In the above examples, `RAIN`, `GO_OUTSIDE`, `HAVE_UMBRELLA` and
> `WET` are the "atomic
> +propositions".
> +
> +Monitor synthesis
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +To synthesize an LTL into a kernel monitor, the `rvgen` tool can be
> used:
> +`tools/verification/rvgen`. The specification needs to be provided
> as a file, and it must have a
> +"RULE =3D LTL" assignment. For example::
> +
> +=C2=A0=C2=A0=C2=A0 RULE =3D always (ACQUIRE imply ((not KILLED and not C=
RASHED) until
> RELEASE))
> +
> +which says: if `ACQUIRE`, then `RELEASE` must happen before `KILLED`
> or `CRASHED`.
> +
> +The LTL can be broken down using sub-expressions. The above is
> equivalent to:
> +
> +=C2=A0=C2=A0 .. code-block::
> +
> +=C2=A0=C2=A0=C2=A0 RULE =3D always (ACQUIRE imply (ALIVE until RELEASE))
> +=C2=A0=C2=A0=C2=A0 ALIVE =3D not KILLED and not CRASHED
> +
> +From this specification, `rvgen` generates the C implementation of a
> Buchi automaton - a
> +non-deterministic state machine which checks the satisfiability of
> the LTL. See
> +Documentation/trace/rv/monitor_synthesis.rst for details on using
> `rvgen`.

You probably read a lot to write this, do you mind adding a brief
Reference section for the curious reader? Asking for a friend ;)

Something like
https://docs.kernel.org/trace/rv/deterministic_automata.html#references
would do.

Thanks,
Gabriele

