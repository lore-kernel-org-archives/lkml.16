Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EA035973
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745876980; cv=none; b=moc+hcyKgESAInmf0ptLjc+DwkkO7tKTdpnQ4jgJOkriDqk1rcwJNC21iqqheltZMAJKRoWeMMwI5RvQEMHIzsX2sBzu7dHKQX6r+w9DWqWic+BtBE0ZAy8E6e+lIBrC9n5KxNRjMNXDWZvdKq6x9IcDc749yX/JbfOlYFnksOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745876980; c=relaxed/simple;
	bh=ghcCM9Iq6q5DZLQLtCB6Yi+vMX+2oa4GKdC99dDy0lI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Epw2YHXBTFZpWLVPbDratH7yi0ffhaHE9iFCqHff4cHz2y5Ikexv0JcTu3UiBggq//S8t1EBaIxgFDiCEAc4qaJmMpPKkV4d56DSb10wLqcaHA8hrmtjuFW0sEb/JyC+mNZHkQxth384C7M5uvTm0DJrZ+4RU6fQO1UDZRb+Z20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G6W9Jj5Q; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G6W9Jj5Q"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac3b12e8518so892932966b.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745876977; x=1746481777; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+X7+Sy3CmnHgJcf9KaxAsnYxZIlm7xiKcJg4Tb8SkUk=;
        b=G6W9Jj5Qjo3JB2NJCOkPpqn8c/SGaCQjf4m4v1T/jauDk6MwOk+AnfY55C2YL3ApTW
         Bwq4kwNEbsMQu/R3it3Lmss7esE32okgNBGrt0+Mf4dllBzO0JE5mEHJgaY9nGjRSovQ
         X0ZRTg4q6H56L6Vu0VDZokTuHnLD1E3EjN32jHRvyL6BhxX21ZppKZGMtf9fFopPDby0
         DvXPaIQ4dTd6Z8Zwmsao1CuZEOQw50oepEWm3EPkYY749mE3f/nZlQOcG+672oOm7Dcb
         c2x9VqJBkySGkl29EVPg9h0cvmRJVFPGBj5stSv8UDX8AQvB1HrRFFU2E5oX58QNe2Rz
         VrbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745876977; x=1746481777;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+X7+Sy3CmnHgJcf9KaxAsnYxZIlm7xiKcJg4Tb8SkUk=;
        b=iQKWx3IDCco00wXYKDqbGWzGbEV5s/FvMt48n3SyeF2TENLpGsqwknlqYVO7xUmxIg
         TNhk/HQzFmUE01pnPrzdm/z4KtOCYHe270O0XVciYYoM5R1eOyPvOhBDgQDtxBuzABey
         FRhgSzRvN68V7oGtxTSR5ed9I3q6pwC9duQRuiMmCc6ED4IQS3VwO4/raKv9mopxAchd
         9JY+SBscWQkbI3iwzvj/UOmxrHt6iqmOYwXdyxDU1GNnTyHS9bCXhXyvaeabEo47OEw5
         ku/o26nfrmz0h9ch43Hzw9Qcr14cHc8BhapmwMEbXLM+wH5k0azHVd3FnDTOMXxcwUEY
         FmMw==
X-Forwarded-Encrypted: i=1; AJvYcCVNmFGL2HTpEiI9SKio9mQrtver6dTGFc5HKrI6JtNaElTXcrIU1KSS80Ty6XTyNzwfCJ1tXgA4sVuf0qA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnN4yBdSq51ZvZXrL86qBirDH7f1TF7HkekAsK5lp3J647176f
	p4GPbjYGy3ocH32iEvsQJkMXdc94X+nNHWgGvZBGYAVqfwjDneuFnwQ/VYjEiKuf2+rlGtn2ap2
	q9h0TATKvqZQYW9esYTP4dfgxiymGPC7Jbv7A
X-Gm-Gg: ASbGncsDIEqWzMEPqmnOALyobwhMsQRCaJjemPN0+k5so1oqFhjFXISWau56QVMvPet
	DKc8n6cVWbY/Z3v7xZ41Z6iWSK6MN9T2jp9EYB0ubx47aE5kdPheMaWac2FB8PfcK11fz/LwH4d
	qLoHWEZ/HM171owUUEkDHqt97//ad67hTB1X8hKuVQfhCQUc8IBuRi
X-Google-Smtp-Source: AGHT+IEhiL11RcDgB5cdm/WKbBzF4reBDVGF/eKqJBGAFN4+OR+rR4wotFOAWpQCpwoRviJDtI5D1kPWUosQ4mYyNnQ=
X-Received: by 2002:a17:907:9495:b0:ace:6882:510d with SMTP id
 a640c23a62f3a-ace848f79d2mr984974166b.24.1745876976648; Mon, 28 Apr 2025
 14:49:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423061023.131354-1-dhavale@google.com> <894ca2d3-e680-4395-9887-2b6060fc8096@kernel.org>
In-Reply-To: <894ca2d3-e680-4395-9887-2b6060fc8096@kernel.org>
From: Sandeep Dhavale <dhavale@google.com>
Date: Mon, 28 Apr 2025 14:49:25 -0700
X-Gm-Features: ATxdqUFDtwc5SK3EYtcYAuQ_6XyuzSDvFJe-PtDs8peDgGVgf_ScKK1LcKd9hxc
Message-ID: <CAB=BE-Ru31S1Qq0Gmi9UXtaL6k4dcLdTUa-CJbmhuXb7a2dSeQ@mail.gmail.com>
Subject: Re: [PATCH v4] erofs: lazily initialize per-CPU workers and CPU
 hotplug hooks
To: Chao Yu <chao@kernel.org>
Cc: linux-erofs@lists.ozlabs.org, Gao Xiang <xiang@kernel.org>, 
	Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, 
	hsiangkao@linux.alibaba.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Chao,

>
> - mount #1                              - mount #2
>  - z_erofs_init_pcpu_workers
>   - atomic_xchg(, 1)
>                                          - z_erofs_init_pcpu_workers
>                                           - atomic_xchg(, 1)
>                                           : return 0 since atomic variable is 1
>                                           it will run w/o percpu workers and hotplug
>   : update atomic variable to 1
>   - erofs_init_percpu_workers
>   : fail
>   - atomic_set(, 0)
>   : update atomic variable to 0 & fail the mount
>
> Can we add some logs to show we succeed/fail to initialize workers or
> hotplugs? As for mount #2, it expects it will run w/ them, but finally
> it may not. So we'd better have a simple way to know?
>
> Thanks,
>
What you have laid out as race, indeed can happen if
erofs_init_percpu_workers() fails with ENOMEM. For me that is still
not catastrophic as workqueue fallback is in place so the filesystem
is still functional.  And at the next mount, the logic will be
reattempted as the atomic variable is reset to 0 after failure.

If you still think we need to have a log message, I will be happy to
spin up the next revision with logging for ENOMEM.

Thanks for the review!

Regards,
Sandeep.
