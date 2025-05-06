Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14957280003
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 15:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746546636; cv=none; b=h3YJd80e5M00IhQNF5rFs0AdgViXYq/sQyhPMwaORCQ+2RYvXsXLKo3siuPIIWyx+l9U/AJJ5Xvme+gdnZEOek2v+a/nfJ5sej8ph/YpOHNdJXYTW5IpMQzPKrPuKfJlvdvu7EtEBlse7yWt+LSYH9I6I+T6rimMzFQEriUTpFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746546636; c=relaxed/simple;
	bh=dnsZARGoCRzVroUqWOHTICiuVS/j+Vu5+iMdjb06yFQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=dddqzZg71M9jTjkaIrZpIg2uvEFeVlVkuBTikQ+lVI/tLXB6MbLLYeUY4HqjlhIqwCPtReMtZpVzdo+zc+n5gv4xwheYfRUKejCOnIwvbJIc4CrOEvxfPZzFOdy6iBtOstz/rrN0qpUPxCrqzKuk6eNICky9VB1Nraf72iPxMyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HvmIQ6Vp; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HvmIQ6Vp"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ace94273f0dso335250966b.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 08:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746546633; x=1747151433; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/cd32lR18qNaF2U9DfiKee4Kiegk/8OhHBbE5vcd/o=;
        b=HvmIQ6VpQRF7JcjGMG9aZ/wwNRQ6RNweJzZVsieNNkBQIzV01UeZhIZWywknR9toSW
         Ug4pqE0ZZsbYmQjitehyackEZvqltr9TM9oexQo5+lAcJwKn1r25Eo4/Az/MCIjM2YeO
         ssB46FPzIxltKHTLmm9KSxHsihnfFD2oKCQn8WD1mF5mC64RTL4ByJ7OcaBafiPkilxE
         arRLBzYUGgngeQarwQWFzlA5PBtJN6bMco32e0DAVvE1W+1x/40XycP2m1xyr5dIMRkb
         biiCqsH8mZGjfcX5yNsXm8Qs+9K30Oaq9Q90HcjBAsANHbO3/er4cSY9/V3WNVna1ylq
         KUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746546633; x=1747151433;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v/cd32lR18qNaF2U9DfiKee4Kiegk/8OhHBbE5vcd/o=;
        b=usTXZ2/bDth2qOF9CttLw2ToSqmyZZi0K1SE7o8d85osDEMHDI5afgqhXJLM2kwu3e
         I5z0DS2e7zgAWG+E9mQS+ApOlKMwczXNsSWRFAQxWhdQstbsV/RP7akhdzNYbrEfHlm7
         DGwOz1sJPX7NUyyA4/WP8Y+ULiW2RXehBYJIFtMjTlCDWK/bFRxJgnqiVF9DzWMqVtUb
         HiZc6W5QoxkxVAHmoP1FlltMhICeZWEuGUrEmtsOR0bXZ+KEo+BHkfnzepUUHF8JQ0fA
         WNKPO3mGNA1yqEAQ04Tlt55/Hdq23H2ZO7IORDgzmx+nyszfWyMpIdq6TA7k/eDGPIQF
         ZyOg==
X-Gm-Message-State: AOJu0YzJweSrVeAMsfmCUSEKqguGEPkdx75cP78FoPkr8wXC/Ebn6W0o
	op2ZehCFWozYf1jEpo/vFJxyxgPnUljF3n1R1nyl0X6ZqobNX2wz
X-Gm-Gg: ASbGncv4hnpbsnpXAO4gr2XHss1T66Vd6NVlJtseK/L8S58kO3KG3U/Uulwvm6MUL0c
	OR1sOJ5lCc+wqpsd3MBMEUAB5luvZ8OR7emRrbzaCADjb9XxCHys5ocSpJXZpu4RD6Ubu5fhpz7
	kKuOchBsCZ64M76ejpDHwI/L6+y9u98FWDJQ8C6yNxX82zCfZcxxpWvQPsJ8tLVEUNb//zqw698
	ae/LErAxaMNiGYlp7VrxsWXHx75XhpQBS0nIhHMbDu4kvAQj+wIDkeBI9hjvPOnVCl+YuZTDdp6
	xEJEgFGWy5gy3FhTEOd+o6916uqCuLty2g0bAwqX0xH5OvqpKFZZf2Wd
X-Google-Smtp-Source: AGHT+IHI07h3SWN4IWAmyQVPi93u++g4HV+GJJA/f5Bx3Mmaz6zA7XcY0iCTzxN3fSgKlR7yFWQWug==
X-Received: by 2002:a17:907:1c1e:b0:ad1:77ae:d18e with SMTP id a640c23a62f3a-ad1a4b1119fmr1056367866b.56.1746546632859;
        Tue, 06 May 2025 08:50:32 -0700 (PDT)
Received: from smtpclient.apple ([212.59.70.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c02f3sm735850766b.92.2025.05.06.08.50.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 May 2025 08:50:32 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [RFC PATCH 7/9] x86/mm: Introduce Remote Action Request
From: Nadav Amit <nadav.amit@gmail.com>
In-Reply-To: <09b6eb12ede47b2e2be69bdd68a8732104b26eb0.camel@surriel.com>
Date: Tue, 6 May 2025 18:50:19 +0300
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 kernel-team@meta.com,
 Dave Hansen <dave.hansen@linux.intel.com>,
 luto@kernel.org,
 peterz@infradead.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Yu-cheng Yu <yu-cheng.yu@intel.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B4BBD0D6-8EF4-41F3-9D00-D448658F2C4C@gmail.com>
References: <20250506003811.92405-1-riel@surriel.com>
 <20250506003811.92405-8-riel@surriel.com>
 <03E5F4D7-3E3F-4809-87FE-6BD0B792E90F@gmail.com>
 <09b6eb12ede47b2e2be69bdd68a8732104b26eb0.camel@surriel.com>
To: Rik van Riel <riel@surriel.com>
X-Mailer: Apple Mail (2.3826.500.181.1.5)



> On 6 May 2025, at 18:16, Rik van Riel <riel@surriel.com> wrote:
>=20
> It gets better. Page 8 of the RAR whitepaper tells
> us that we can simply use RAR to have a CPU send
> itself TLB flush instructions, and the microcode
> will do the flush at the same time the other CPUs
> handle theirs.
>=20
> "At this point, the ILP may invalidate its own TLB by=20
> signaling RAR to itself in order to invoke the RAR handler
> locally as well"
>=20
> I tried this, but things blew up very early in
> boot, presumably due to the CPU trying to send
> itself a RAR before it was fully configured to
> handle them.
>=20
> The code may need a better decision point than
> cpu_feature_enabled(X86_FEATURE_RAR) to decide
> whether or not to use RAR.
>=20
> Probably something that indicates RAR is actually
> ready to use on all CPUs.
>=20

Once you get something working (perhaps with a branch for
now) you can take the static-key/static-call path, presumably.
I would first try to get something working properly.

BTW: I suspect that the RAR approach might not handle TLB
storms worse than the IPI approach, in which once the handler
sees such a storm, it does full TLB flush and skips flushes of
=E2=80=9Colder=E2=80=9D generations. You may want to benchmark this =
scenario
(IIRC one of the will-it-scale does something similar).

> I think we have 3 cases here:
>=20
> 1) Only the local TLB needs to be flushed.
>   In this case we can INVPCID locally, and skip any
>   potential contention on the RAR payload table.

More like INVLPG (and INVPCID to the user PTI). AFAIK, Andy said
INVLPG performs better than INVPCID for a single entry. But yes,
this is a simple and hot scenario that should have a separate
code-path.

>=20
> 2) Only one remote CPU needs to be flushed (no local).
>   This can use the arch_rar_send_single_ipi() thing.
>=20
> 3) Multiple CPUs need to be flushed. This could include
>   the local CPU, or be only multiple remote CPUs.
>   For this case we could just use arch_send_rar_ipi_mask(),
>   including sending a RAR request to the local CPU, which
>   should handle it concurrently with the other CPUs.
>=20
> Does that seem like a reasonable way to handle things?

It it. It is just that code-wise, I think the 2nd and 3rd cases
are similar, and it can be better to distinguish the differences
between them without creating two completely separate code-paths.
This makes maintenance and reasoning more simple, I think.

Consider having a look at smp_call_function_many_cond(). I think
it handles the 2nd and 3rd cases nicely in the manner I just
described. Admittedly, I am a bit biased=E2=80=A6=
