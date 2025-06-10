Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3647D221FB2
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749574759; cv=none; b=BdKkQUB4Fa4W6PiB5V36XvdjHc4ntnbZuSHCSAt1r5rvxu+oU/yxFzmXIKjTb/Gf26Yt7w4O7S2FX7Zx3aSK98YmhFG/tdBiYHDhz2CxnZTRP7HEtS0sfZMgKS8QPIVWDrPvJJLOJHWvm4ap0JyK6GjgjX1KP3qVFPGHDjLsug4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749574759; c=relaxed/simple;
	bh=8DdNfwjgj139DEq2bn4GfoSJLG+m3GPjIEZGs5Alap8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bRWFifFm1DtM1VbTHXgosEGCIKqm6te9boF8yikDkzQGqbc26fjOCD5/1xvIRCfJCDY+ZlLXOh5ewsej8hQ7bY6mfDbTkJ0gWDZ1SsNzWjTcIuMZe9+0fr1zPI0/J4Z+ujAEy15Tr4MUPCpmp2Hdh561tfUDqtCKh6jmcm8VFS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pfA7v2j5; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pfA7v2j5"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-601a67c6e61so367a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749574756; x=1750179556; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DdNfwjgj139DEq2bn4GfoSJLG+m3GPjIEZGs5Alap8=;
        b=pfA7v2j5jfIqvurgrSP5YdczJl1MJSS/EbA4ezJOQ5tCOf4/bUHT2ZEEj2EvdkhNAH
         k5yX4KVLcAXgT1zsPh5KxP2+kOvww4uv/BimjNj06bX32BMRE0NMIIkXGMaoB9yj6jZJ
         X35P9qtmhYiSx6+zBx0pxQ/nnaVUAABLJM8MsUbcpn98atFomHzbbfhUACErunGWqtw+
         tNuyyVNbNMZ7t0AncfWDc6X9m1iCnsQMkz3+vPAEG2Ft8o3RJ52EMUbbFBUlfO0JmiYX
         ydftAP8JLt0zpOxLB1AN4/oATJ+oeb9WzO7v27nmtijbp+29SGFmhQEZ7Io3T/85+rm9
         0ZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749574756; x=1750179556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8DdNfwjgj139DEq2bn4GfoSJLG+m3GPjIEZGs5Alap8=;
        b=E/KQycxzsv7CjUkfSxv5a6oG2RgHqViomYskssCoYCmNv3Ftr2JypU57vPl8soayjO
         BVdRc48WnloXZFHluccB0QLT3Wj4GGk61UmhdpnUo17qtQLzrOHNuDY+fuljLu/qYqlF
         R+Xv5EAXcnyumMW2QrF+to6CwAARynoS4Y7PL0/9h3P0CKf5bQl2uK8bs8ekOP0LfbH0
         TdAc4Ck6xWubwrzXBGFpmuOooRI/PH1s4zfCACOWx4LW+HBbbL9KzcYb9PWLOfH2cWeW
         C+NlkFelp/8/7xKkmyr0NkWZOKlQko8A3CxAqdhtPo/YHg2Zeg65OHAA0gtPZwlFyNQw
         iuHw==
X-Gm-Message-State: AOJu0Yz+mxTQXuj0h+UVR/pjnlpatc1XqTFUNTlie9k8RG+m+y3MAu3k
	I9GkFa+YWRfsJriICznECaA6G/WElIefdqwn3yJBy7XSJnnrqfB0U5zP7UUzFDoYpksX7nzwbC4
	UBow2qmYXoP+0EQNHYLACDRiqI2+o2P8DPjaRVYJQt/UxsvDGytYCj5OM
X-Gm-Gg: ASbGncuHM0yI0sy0c32+RYA4RP5A5FpJXNcWCBEDxL+emK9XfBXRfgaKxPL/PEbs/jt
	b7ue32a2exCYUJkY9Fl7HwUrKDGypmNjlBS+9qg7tQ101psFGYojQTuTM79VpYELjHA3AZtt2ph
	Efwq9K6Rda0Hr00QgK5YzBHSZF8oxju2nTwOpJn2JcXV0=
X-Google-Smtp-Source: AGHT+IFHgH7B3qe7Ezwbp04DhkXrz+YAg7VQFjxBJASIUVt7JokWaJsT/0dNRwXRYWfdz42tsS5PgvinQXkjPY6JLAE=
X-Received: by 2002:a05:6402:4543:b0:608:203f:196f with SMTP id
 4fb4d7f45d1cf-60844a7d7e5mr6673a12.3.1749574756301; Tue, 10 Jun 2025 09:59:16
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530185239.2335185-1-jmattson@google.com> <20250530185239.2335185-4-jmattson@google.com>
 <574f8adc-6aea-4460-9211-685091a30f5e@linux.intel.com>
In-Reply-To: <574f8adc-6aea-4460-9211-685091a30f5e@linux.intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 10 Jun 2025 09:59:04 -0700
X-Gm-Features: AX0GCFtUxEPr7inOMprPmI_sitxPIX2gv1QlRpTuYqs2PDV-GxmAPLTPEpqEiUA
Message-ID: <CALMp9eSS09bzdUs2JPnaQKM6ALWjxJNqWTsNYM5LOnSJjyRanQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] KVM: selftests: Test behavior of KVM_X86_DISABLE_EXITS_APERFMPERF
To: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 1:42=E2=80=AFAM Mi, Dapeng <dapeng1.mi@linux.intel.=
com> wrote:
>
>
> On 5/31/2025 2:52 AM, Jim Mattson wrote:
> > For a VCPU thread pinned to a single LPU, verify that interleaved host
> > and guest reads of IA32_[AM]PERF return strictly increasing values when
> > APERFMPERF exiting is disabled.

> Should we consider the possible overflow case of these 2 MSRs although it
> could be extremely rare? Thanks.

Unless someone moves the MSRs forward, at current frequencies, the
machine will have to be up for more than 100 years. I'll be long dead
by then.

Note that frequency invariant scheduling doesn't accommodate overflow
either. If the MSRs overflow, frequency invariant scheduling is
disabled.
