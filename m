Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CB52288C3
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 12:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738756927; cv=none; b=QXYzySGNlbQ39z4ZN4jmg6J+NxkIy3/0aC0WI1o1XVFSAsYV+SryURKHZiVLQSC8ES+v8JH3ajarTUzECBf8eYVPW31sAYTRe0ZJ2p33S+WpibdaUWmgbo8zHtrX0rWQ+jvRqO4PQRn9msoh6yafgD0/cLJLrdC6MGt41+6vuQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738756927; c=relaxed/simple;
	bh=ayE+rp/IcKvikaOy9R1FKceMOlhQSI0MWRUQIQ+36Ik=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fEKWM/Fg4HHKNqOtaTqyWT7Dd7L2zQ3DR+TI/rSdpIffKGqHrgsUdKiquY51N9r/WdUvUblpSLLbhqK3PfJ7jkFDyZgZUpVB9/prhKK3PsYYm4FArVGE1V2srpOc5oMUNggj0EjKMr86KR3CRO0UZkvzqcHkyz9Uu2oe6kJMu5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q2qsIVIY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q2qsIVIY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738756924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ayE+rp/IcKvikaOy9R1FKceMOlhQSI0MWRUQIQ+36Ik=;
	b=Q2qsIVIYy6rGf8SBXm0CXnohhirpc9BVneyxikfXsnYQzMZe+IUvhF6oOGwCIcvE/D0qfv
	MSnAQ8S8mRjftVd7fKtXwtDJF6XXDQzLPl4mcpuPGuWgbf4z9KTtd7PdCMSn161ZdyKfzk
	3uWXPOkoIX6EOMK8Eg2wTgT7CDOm8A4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-uF7wLELJO8CppjZk5LkQ_g-1; Wed, 05 Feb 2025 07:02:02 -0500
X-MC-Unique: uF7wLELJO8CppjZk5LkQ_g-1
X-Mimecast-MFC-AGG-ID: uF7wLELJO8CppjZk5LkQ_g
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38634103b0dso4148766f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 04:02:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738756921; x=1739361721;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ayE+rp/IcKvikaOy9R1FKceMOlhQSI0MWRUQIQ+36Ik=;
        b=vgAB76DC37Uj2TCn2cn/9UmJ/YBmdELFyF39rgJ7SJf82RlT0Hqqyg7SanchoNQy0C
         Kvg3QS5c/lkZ3tqTLUbMoo4Y+ad2SrIEFuv9/0gZ95bNdXTlhSGpjoKcZsYcADfsXMyO
         eRpKCb4qEFGhoZbCbMapXRoqWb2IQNhALxU5CyW34/mB7DcLI5rX0/4AWG9eBejTJ/17
         wQ4409umLMlYib9cEmQvq7eYmDiU1b8qTxMd4Jd6AzeN2ueNu8Ow8JMGo7+0peyvxVqw
         U+ZozXef0T8JjAkvQ99KSKu0arunapVcvtNSyY2LEvHzPEzvNpiwDKZIGHYLV7GgfJeV
         S7Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUueNbKe7UZix5Qvw+1kJdkBT6tI6fSyK2gIBGfZkKzC2hD0foV2AVIv6spsfW7CtkUgnK9+gkLoyFKA1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMNGGQLW5XXxzvJve+SMMKLU+SwqlKEpst6NxieBkKbnKXLXKE
	7j1Tp/+GQ0cbBpZegLHMawAiO8Ar4p1PIdeTVAmQr+qzaJOhfuwHhy3hTVGW5lhE2+ncb9EdEFh
	/gKmjKLn6AUlDxkvUPQUytWGbQL8JzIPoNbFdjtegG2xd4dVe5ZrWB3j3tsA/Gw==
X-Gm-Gg: ASbGncsQLO9NuwSKUkZ8ruxF2HwGLaOpT79//Wijc51YFBEwctdfa7sV83HIF9IEqQo
	NX5Ej6sK05yDwM0zfzuQzCU4DzDspgr5V7TKwe9Xu8OPS8gwIePRZQaFMQ2OzL96E2n5/6+1F1W
	SsazCrqZbRU4YfkJwnKVd915WXMuzWx3S/pdrWHYGaaQponQzkzHJ7tnPwBckIItPxEdIJ/VaLL
	cPaWyuOjQQ0Z3BMAPibNOAdkfQU0NNb9FpEUPsrLJ+NKhdrrZWJYolG7LDSutVk+b2tkhlvp30x
	tZpm+18xmCs0FlRFC9O6D6Buu6FjXT4=
X-Received: by 2002:a5d:6d81:0:b0:38b:d7d2:12f6 with SMTP id ffacd0b85a97d-38db48585c7mr1551974f8f.2.1738756921057;
        Wed, 05 Feb 2025 04:02:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFI79S0TKZG+9E6w6mg5uh7PaBSHBpX6hg5XxCyUDI3mB3oiFuhF5ZJTnQQuCKLUZeBoAUlg==
X-Received: by 2002:a5d:6d81:0:b0:38b:d7d2:12f6 with SMTP id ffacd0b85a97d-38db48585c7mr1551932f8f.2.1738756920635;
        Wed, 05 Feb 2025 04:02:00 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d96530fsm18567525e9.19.2025.02.05.04.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 04:02:00 -0800 (PST)
Message-ID: <21e53ffc5e2805e369fadc5e0cc582379a605ab4.camel@redhat.com>
Subject: Re: [PATCH v2] trace/osnoise: Add trace events for samples
From: Gabriele Monaco <gmonaco@redhat.com>
To: Tomas Glozar <tglozar@redhat.com>, Steven Rostedt <rostedt@goodmis.org>
Cc: linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org, John
 Kacur <jkacur@redhat.com>, Luis Goncalves <lgoncalv@redhat.com>
Date: Wed, 05 Feb 2025 13:01:58 +0100
In-Reply-To: <CAP4=nvRNvdULubjN1XPF8jNxY3tRdfy+9Vqv97EsKjzNGKyYig@mail.gmail.com>
References: <20250203090418.1458923-1-tglozar@redhat.com>
	 <CAP4=nvRNvdULubjN1XPF8jNxY3tRdfy+9Vqv97EsKjzNGKyYig@mail.gmail.com>
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

On Tue, 2025-02-04 at 14:35 +0100, Tomas Glozar wrote:
> po 3. 2. 2025 v 10:04 odes=C3=ADlatel Tomas Glozar <tglozar@redhat.com>
> napsal:
> > A proof-of-concept bpftrace script using this feature:
> > https://gitlab.com/-/snippets/4801190
> >=20
>=20
> I added another PoC using event histograms to the snippet. That one
> captures data from all CPUs, and thus can be used for testing on
> machines with a high number of CPUs where rtla cannot keep up with
> timerlat samples (in our measurements, >100).
>=20
> There seems to be an issue with division where most values are
> rounded up, e.g.:
> max:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 135=C2=A0 timer_latency:=
=C2=A0=C2=A0=C2=A0=C2=A0 134657
>=20
> This also affects the main histogram and seems to be specific to the
> event histogram PoC. The bpftrace one shows exactly the same results
> as rtla when run concurrently with it. Another difference compared to
> the bpftrace PoC is that you have to calculate averages manually from
> the latency sum and the sample count.
>=20
> Tomas
>=20

The patch and scripts using the new tracepoints produce reasonable
results on a large arm64 machine (128 cores).

Tested-by: Gabriele Monaco <gmonaco@redhat.com>

Thanks,
Gabriele

