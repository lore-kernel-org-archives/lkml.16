Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393B72A1D7
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 13:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743427192; cv=none; b=U+E4vz4A4HDHnmIEyNTVnIcMmfQnp+hty9eWnjSqYKV71IezQOBSMd9sF6BnYw3OWUf764AdlzgONO5gmYWKtxzlpLMftxFOzhvTeC0ChvEf6udAtfVqFY6F6wTvJzGD2bsYBEhnJ6mGBv8XcwpJSp8EgGeNLLqS/abvx29CwHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743427192; c=relaxed/simple;
	bh=P6DCTUit0leEkPXg7yvciyfLzZCMNlz+axqKHwql/cg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UKvD058P+55nFV/unbJ4fPss3AZd0+XuNOsq9GLBMEI6tstoKxKFrgNZWoH/0cCWaenc+aTLFDr17j8lbEushf0TfoutGh2V5KxZ3XQPfOaUH9gjrcgdle3zcUjdfrWIoyaG/dJDEMY7PgDArZN0RbScHiWzvmZzo7XQtk6+2qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bdFmwDFu; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bdFmwDFu"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso3948936f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 06:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743427188; x=1744031988; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YcmYk5PTzxCtOJOaVVP5nkeOuljxOTS0F0qSnk/8Fxg=;
        b=bdFmwDFuhB+0Gfw/nwoixHXAPnagSqngq0oFhy2OTzNvXJUcT0sNuoFCClUQw7uBuz
         KYkkxUpMQ+H3ShxhEUeJI6F60G59kUzJCwNBboyjzYLrbyihXmIwVodeSQz2j9U0IvN/
         zF1Aivt/B5O02E+hiCLTunMTIrj9e0kfF2Bafh95oUgsPZVqqcOYqL4xu+36mTrTv6cA
         sH5hF3AAX74wkDfaZ73JFf2ssrSIvIXT9UDDCjafcx0zbWkFkg8UvK47i/JDfqkbincz
         F8Gj8ccNJhtEYlT6HVf05ggMwyv/gzfd28sexlGo4qjUSra8fi2vHU9FWxfmB6Z2qJbB
         hK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743427188; x=1744031988;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YcmYk5PTzxCtOJOaVVP5nkeOuljxOTS0F0qSnk/8Fxg=;
        b=GofaBJM6xsiknln99bdxvoTB7IvtPyIZ5D63u0aB84YUWcidTjJ+B5NdKAktJdAOOj
         IqO7WatpKTZRkZ6dPvFo+LU8dOGLZW4k2xm1ol2uE2IG7V9K6w8Sne1S8vcxUIXZ0s8Q
         2pO4Vx7INbot8Mpqzi3PQZWZILYnwWDDeUwyclCsj0u3ffbWDYXGFvttbLnqBEwGyIUG
         9/77LlKdqoiONLgN5BmITFdsGH3xpT2IjeOVtKLW81U7oSGNCboB6xYeyky+AyySrSkh
         jFlbngmnjFMN5QuP5qv1M0aezocYiN+4h6Kiru1csZF+kRcKLJPwTZW04UscM4vBonX2
         rxWw==
X-Forwarded-Encrypted: i=1; AJvYcCUwX4tUGpFTSGNjz+yMgLavkv7+YvSqIub8Rwx6c/+CKH8Dqyu+U24I+F1I4H5ElinRKNatq/cLQSbLQxM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqsxaTroP1781nPlwoZmyT8yx/JgOnsxxWtpDbutDoAsKpxe8G
	TGlZ72DiMc6sYYcwdDJcHkEJ8nJT/ltOYxQiE9K89rlj69ejyp+n6PZ4kQJIhZk=
X-Gm-Gg: ASbGnctCyXu+ilDaMK1EMOnFLhzH90fOq+Y7lXYcQKrVljMRVfhKz010+9Iktc4vpfo
	JUjhyNZWfUmG30TfNeuezJqFnjA9+na36KCX2PaEVJj6rUJuv5K5mRalETCFoISKik4RbZqeTHZ
	Q6uyNdCvkqWMRoBGF7YBKkRKN/aHvUeVnOWhQ5inkIEu6xR4g57tiAx2b16jeo46Pv+yw6vlfzB
	KrvrEM+J0TOBaFCTsW/Gfe+S8JYqm+U2HOTfdUDPmuFTOU/S2YiWf1KTWJAFtXGNqA4bO6trzZT
	BDbUy4Pvs946I9J2YO0mKCrgDaZEI9R+4FjeQc3i0mwIhCd9KD1vLNmJM4EZZKqP5/bo6U//xVl
	g5Kb3wFhojIvYCTggYkmiY9+ShbPtXvpJKdqtSg==
X-Google-Smtp-Source: AGHT+IGZqmArJyrihK4euVLU0horXdZgOg53706JbhiZUWs5TDnkpgzuRWwj3lskoRyG6Hkk8G0VLA==
X-Received: by 2002:a05:6000:2b06:b0:399:6d26:7752 with SMTP id ffacd0b85a97d-39c12117ad8mr5124011f8f.38.1743427188556;
        Mon, 31 Mar 2025 06:19:48 -0700 (PDT)
Received: from u94a (2001-b011-fa04-3f62-b2dc-efff-fee8-7e7a.dynamic-ip6.hinet.net. [2001:b011:fa04:3f62:b2dc:efff:fee8:7e7a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1dedcfsm68393265ad.193.2025.03.31.06.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 06:19:47 -0700 (PDT)
Date: Mon, 31 Mar 2025 21:19:36 +0800
From: Shung-Hsi Yu <shung-hsi.yu@suse.com>
To: "Naveen N. Rao" <naveen@kernel.org>, 
	Hari Bathini <hbathini@linux.ibm.com>, bpf@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>, 
	Mark Rutland <mark.rutland@arm.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Alexei Starovoitov <ast@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Vishal Chourasia <vishalc@linux.ibm.com>, 
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Miroslav Benes <mbenes@suse.cz>, 
	Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-trace-kernel@vger.kernel.org, live-patching@vger.kernel.org
Subject: [BUG?] ppc64le: fentry BPF not triggered after live patch (v6.14)
Message-ID: <rwmwrvvtg3pd7qrnt3of6dideioohwhsplancoc2gdrjran7bg@j5tqng6loymr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

On ppc64le (v6.14, kernel config attached), I've observed that fentry
BPF programs stop being invoked after the target kernel function is live
patched. This occurs regardless of whether the BPF program was attached
before or after the live patch. I believe fentry/fprobe on ppc64le is
added with [1].

Steps to reproduce on ppc64le:
- Use bpftrace (v0.10.0+) to attach a BPF program to cmdline_proc_show
  with fentry (kfunc is the older name bpftrace used for fentry, used
  here for max compatability)

    bpftrace -e 'kfunc:cmdline_proc_show { printf("%lld: cmdline_proc_show() called by %s\n", nsecs(), comm) }'

- Run `cat /proc/cmdline` and observe bpftrace output

- Load samples/livepatch/livepatch-sample.ko

- Run `cat /proc/cmdline` again. Observe "this has been live patched" in
  output, but no new bpftrace output.

Note: once the live patching module is disabled through the sysfs interface
the BPF program invocation is restored.

Is this the expected interaction between fentry BPF and live patching?
On x86_64 it does _not_ happen, so I'd guess the behavior on ppc64le is
unintended. Any insights appreciated.


Thanks,
Shung-Hsi Yu

1: https://lore.kernel.org/all/20241030070850.1361304-2-hbathini@linux.ibm.com/
