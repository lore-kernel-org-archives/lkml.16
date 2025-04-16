Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB891B4235
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744813803; cv=none; b=cfDzwsrDCcwCsqu5Oit2zT5/IXI/hIWWCsy9d77OId7UuaoETxna+6O7zHrZ2DKGoyQfrySoxdMzbsH0Cmj8+C/jvVQrvN0dgQ5eUUaI1zv1QLscB+iNx0gRecdGiUy8dLNbLbIogtdqpj4vVwx3pDCrtYHPjuy50o1jZUl7OFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744813803; c=relaxed/simple;
	bh=M3aKjuBSofdl/WfprYl6DJmKZ07dVKfFKg7ZK124i70=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b1uinERQaPuEYnTBdNCVFQhPxyaeej/LJA4/afB83ezOuAee3illgGCzlinitcMEC1A7PBwJ8ZKKke+KplJnQ4majMZlJDM5/bhehZ4KgsSlMtbNK4JHG8Yur65aSn5GsuOWCmb0GVtXfQp/XmuI43O975HaiKi8eGgp1KBfOGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HbiEyvuD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HbiEyvuD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744813799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=M3aKjuBSofdl/WfprYl6DJmKZ07dVKfFKg7ZK124i70=;
	b=HbiEyvuDHrLEnAhvbV3WpoERWnRtOq3ibcTdLRrMtW22cZz9+xT8wKPa2TdZlOJ0LjuPnP
	YYD9gKtLi8xsga/CvnOBFN4U+1ZuzOt6fIlsEEX9zdGcYH0K3LCN7YhDLATGC6XMSftx1l
	bi+ohyE1Diu156/HFTQ4fnvZlHEMkOc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-LyRY0oRYM_qXmEUYVeiQiA-1; Wed, 16 Apr 2025 10:29:57 -0400
X-MC-Unique: LyRY0oRYM_qXmEUYVeiQiA-1
X-Mimecast-MFC-AGG-ID: LyRY0oRYM_qXmEUYVeiQiA_1744813796
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3912b54611dso3846783f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744813796; x=1745418596;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M3aKjuBSofdl/WfprYl6DJmKZ07dVKfFKg7ZK124i70=;
        b=qAQykt78AIdpwyygsHb4yzU6ieZWxK3LtpEOpkUTWR9fjoIYxMnHEYFdbppR3wuXEj
         PN63w2qbAUkzpMS3DqVEMQ4/bLr1Ws7CfMfXWr6lMaQJxUYZ5RtEgfXM+BneSv/sQjbM
         utyCVGs9E40ewR3PUEWSMGSxU25TBWl4X57UsUPAc2FyNd1FKIrn5ugKtiuGnOQU/KNJ
         eT7A8LbGAkNwHAn/4VLh5BT8WrQXIfqdVsT0tthSGdqw+qU6oWPYenSX83MOY2nTR85w
         F9FzJ+Xq98oEnagYNPJRIONz/KfV/N6nGBTcvZ6VV4047lML5CZRCkVjLxqNQb6lw1Hv
         uxQw==
X-Forwarded-Encrypted: i=1; AJvYcCV5YhiSCMOD6wPvj1BEAYD0FdwnMq08gIu0bQhKX8XHVwOch06KxqXmABVZY16XZ4PJQNrBdG6ZBcNKmtU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywug0r1+VMXv2JWq+8twKCKZg9H4hqmycDbF9stwtffkGaNIzbG
	+zTwyY6iOMBDapoPn267fQCjBkPkWBgNm8ywgtI8jEyXos+6KXaooThhEAJxZbSAzPh3u6lDyUp
	ZNpVROQu0223w0GxiRNm0mRMsqov2pcJzUuhx3B8esVGIrCklLzYM1m3+/sy+TA==
X-Gm-Gg: ASbGnctWwmskqXyq3IUJ7HEutRHaWLTQfsXLAAEMEj9uSF9FerAG2UDUcfIaOFLjRhH
	xcjk8nOg3tisO4TVpyy+QGDm3wG9jCHgy4RWIWubeL324IHqOWi0Yp9CuWl6S6es2mNx1P6NSDq
	PU9L38omT/PkSmdWENQ2A9YLYRFOxPuTCuQqY5Xeoshg14OyhZPtE2x9RjYTNF2psyJYANskngZ
	ka9CAW2i+WCGJfyhmtqqDzzUlPTEQBU1N1cnwNng9kjy08sPaLxitWdyDzQ0ktqUITZPYi+U337
	IGq4aEVZ/2+avK+V/UtM2RDdZ2zmOt9BMeL0ZFA=
X-Received: by 2002:a5d:47cb:0:b0:391:139f:61af with SMTP id ffacd0b85a97d-39ee5b1cf87mr2140988f8f.32.1744813796230;
        Wed, 16 Apr 2025 07:29:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmzjek8Rw/7fmoyQ/sF0qY6jOKHwHwLvp4Y/yffnHxieGarrZnnOuxkacClA21nZkn7yg+rw==
X-Received: by 2002:a5d:47cb:0:b0:391:139f:61af with SMTP id ffacd0b85a97d-39ee5b1cf87mr2140964f8f.32.1744813795804;
        Wed, 16 Apr 2025 07:29:55 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.134.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4d3453sm22492985e9.16.2025.04.16.07.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 07:29:55 -0700 (PDT)
Message-ID: <a85dcc1c6b493838abdc8716ae35fe4ad734db2b.camel@redhat.com>
Subject: Re: [PATCH v3 13/22] rv: Add support for LTL monitors
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: john.ogness@linutronix.de
Date: Wed, 16 Apr 2025 16:29:53 +0200
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
> diff --git a/Documentation/trace/rv/linear_temporal_logic.rst
> b/Documentation/trace/rv/linear_temporal_logic.rst
> new file mode 100644
> index 000000000000..232f9700cbaa
> --- /dev/null
> +++ b/Documentation/trace/rv/linear_temporal_logic.rst
> @@ -0,0 +1,119 @@
> +Introduction
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +

Just noticed you misplaced the sections in this file, it should be like:

Linear Temporal Logic
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Introduction
------------

[...]

Grammar
-------

[...]

Example linear temporal logic
-----------------------------

[...]

E.g. use =3D=3D=3D only for the page's title (which is missing) and --- for
the sections, otherwise you get it oddly integrated in the index.

Thanks,
Gabriele

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
> +Many materials explain LTL in details. One book is::
> +
> +=C2=A0 Christel Baier aund Joost-Pieter Katoen: Principles of Model
> Checking, The MIT Press, 2008.
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
> +
> +References
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +One book covering model checking and linear temporal logic is::
> +
> +=C2=A0 Christel Baier aund Joost-Pieter Katoen: Principles of Model
> Checking, The MIT Press, 2008.
> +
> +For an example of using linear temporal logic in software testing,
> see::
> +
> +=C2=A0 Ruijie Meng, Zhen Dong, Jialin Li, Ivan Beschastnikh, and Abhik
> Roychoudhury. 2022. Linear-time
> +=C2=A0 temporal logic guided greybox fuzzing. In Proceedings of the 44th
> International Conference on
> +=C2=A0 Software Engineering (ICSE '22). Association for Computing
> Machinery, New York, NY, USA,
> +=C2=A0 1343=E2=80=931355. https://doi.org/10.1145/3510003.3510082
> +
> +The kernel's LTL monitor implementation is based on::
> +
> +=C2=A0 Gerth, R., Peled, D., Vardi, M.Y., Wolper, P. (1996). Simple On-
> the-fly Automatic Verification of
> +=C2=A0 Linear Temporal Logic. In: Dembi=C5=84ski, P., =C5=9Aredniawa, M.=
 (eds)
> Protocol Specification, Testing and
> +=C2=A0 Verification XV. PSTV 1995. IFIP Advances in Information and
> Communication Technology. Springer,
> +=C2=A0 Boston, MA. https://doi.org/10.1007/978-0-387-34892-6_1

