Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9CF20FA9B
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 13:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738676125; cv=none; b=JeAoFVOedCLK698AIKGw0qds1aJcVHWiD20oqa10UEIIz+hsOaAP0lnOtFxB2NTznx96AV7CdXqYy836UUeH3BlXdezoRXYtxlu7avOacyR0dLeQabj7shh/r0goWxPTAIEE7WC38TPDx7pZF3kXJV9lkA/ldqncSD/YbLbRXUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738676125; c=relaxed/simple;
	bh=JV3BNjA3BqQvufGTY+ytUgeeitaZPiDOaSBuz/gglQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mQ6hXYsaVQIcU9mSrAB/Zia2qc9DN0SR7LJ/PSO4IXuf5cbmSLKtSuOPim+RusE60z/mbsGT35R7UJ46GrxGWFReVlODOXz60ClIIohU++qFMJYcZB8hE0NCV4AxXhhdGguFHJxQew+XfBLWGzdikq7p4CC6JIBdxHOPMhrgIW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fk6g67lN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fk6g67lN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738676121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q7zHF/JvGQhbmzpDX8U/7SveUcBjozFywVEOZh0Mkhs=;
	b=Fk6g67lNRTrD2GIEpfO9g+MHL2h4loRWDUynRUr3fpzMf2gKgqtnNdnZ1kcPZQ4U8i8HyJ
	euT5cS0zYbEF2/4TEefodaNF5hT6rJfYlBl0UeWW3RrqmwLadqFuO5ZO0fPoLMnyXOrTv8
	9ONQNu9su+FjVNL3vHYVnfn9Sirjy/U=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-eRCLEpG7PrSayZua8dH2oQ-1; Tue, 04 Feb 2025 08:35:20 -0500
X-MC-Unique: eRCLEpG7PrSayZua8dH2oQ-1
X-Mimecast-MFC-AGG-ID: eRCLEpG7PrSayZua8dH2oQ
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aaf901a0ef9so492137066b.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 05:35:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738676119; x=1739280919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q7zHF/JvGQhbmzpDX8U/7SveUcBjozFywVEOZh0Mkhs=;
        b=BX46Mr9nPY7FNTcSLkiqUDia6YscpZ3vxqQQ/yVOgCLRJnA8eCjrV/Ag7B0cIJG8hE
         q/2SpcvEzPz9PGINX1MzUg9BAHnS4vvxzIHJjWeONGyVINEuGWpVF/7R8MTAgOobRL3w
         IqmZ0CuZ4KCKlQZm4jgntI8He3NEGJ585k2/KuvYz9DcoDiyYg/ye1L3MaGwob8CcXNW
         +OABDxEtFcgbVx55FwHDu6pPxpR6+qkwIAo6Rw/kqDJgM8AVKpR/gD/OXLBsvJADG3p2
         +0JlpAjfR6nb4kRsfwCk9HSXr933JdrulYRdsoap4K8rRWEz256QtAx3njizh4OZV5Dx
         6CjA==
X-Forwarded-Encrypted: i=1; AJvYcCXKXDpyqjoMifbwSNQrGyLT+v95BtJYC/6D42XsBKxvlJ0aGxaXmyLH2GgxIveg+yZb1tDPrbISAoNtTe0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdBD/oLc4sA403L1Xdi80miQp11Fx4h7UsCGryaDkImu8jByN2
	y1X7yi7Z0s7fW4loTEgFZT/t6y7/4KquqKdDUcWimsXVkCEmE6HwwoQFHt1KoGde84vbWk4iFhu
	i3W6hZfUbWIRXInj3dVnBTeWMUplRZpjTBBtVsqytia9Aa+U+I25Ke6yyAzyxVbvs8oZQoRzjLK
	QeCG29VigQf3dRl17CLRArM0DpkwmRybQwztdV
X-Gm-Gg: ASbGncvl+lm7JOEzunoCCnoJjFICC9rmVpEMWYkZGO0zGjWArTVN80MHWr+x2CoBalk
	aOvDGtEsqHz6m20xYYiU5JzqXs5BKqX25VzfDp+o9srjjgsnqhYDC1IkU2Smezg==
X-Received: by 2002:a17:906:6b17:b0:ab6:d575:9541 with SMTP id a640c23a62f3a-ab6d57596fcmr2295660366b.19.1738676118805;
        Tue, 04 Feb 2025 05:35:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQyNZ1zFA8JAY/KtD95RTHjfORdE4Cje3fpR1/nyJsOcP6SudPE/Vp6vUC8rTSidIxRyJdkiofR4fmIJabZcw=
X-Received: by 2002:a17:906:6b17:b0:ab6:d575:9541 with SMTP id
 a640c23a62f3a-ab6d57596fcmr2295656866b.19.1738676118429; Tue, 04 Feb 2025
 05:35:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203090418.1458923-1-tglozar@redhat.com>
In-Reply-To: <20250203090418.1458923-1-tglozar@redhat.com>
From: Tomas Glozar <tglozar@redhat.com>
Date: Tue, 4 Feb 2025 14:35:07 +0100
X-Gm-Features: AWEUYZmRxU_emUlB_7qFxmTcQu7MxIBoaSaHpAe48IjFMrz9TipzOHm2LidJm9Y
Message-ID: <CAP4=nvRNvdULubjN1XPF8jNxY3tRdfy+9Vqv97EsKjzNGKyYig@mail.gmail.com>
Subject: Re: [PATCH v2] trace/osnoise: Add trace events for samples
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	John Kacur <jkacur@redhat.com>, Luis Goncalves <lgoncalv@redhat.com>, 
	Gabriele Monaco <gmonaco@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

po 3. 2. 2025 v 10:04 odes=C3=ADlatel Tomas Glozar <tglozar@redhat.com> nap=
sal:
> A proof-of-concept bpftrace script using this feature:
> https://gitlab.com/-/snippets/4801190
>

I added another PoC using event histograms to the snippet. That one
captures data from all CPUs, and thus can be used for testing on
machines with a high number of CPUs where rtla cannot keep up with
timerlat samples (in our measurements, >100).

There seems to be an issue with division where most values are rounded up, =
e.g.:
max:        135  timer_latency:     134657

This also affects the main histogram and seems to be specific to the
event histogram PoC. The bpftrace one shows exactly the same results
as rtla when run concurrently with it. Another difference compared to
the bpftrace PoC is that you have to calculate averages manually from
the latency sum and the sample count.

Tomas

