Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60495139D1B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 03:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743390878; cv=none; b=OnRBhBcYX+6ucb2b/N5cGyiASpdepjkKrs+GygvA3Duo3j/Gmk3nSxnrRJLWsfye2huCRXqBmbQpiMAAMuYHrnM8LEd5qrjFKOkJ+k8QFG5xHjhereNQOtUSbGqXHOsk0ZH3X4x3BfAYgj/NWGxiCGCG9e7m+nhx2rahw6fvrM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743390878; c=relaxed/simple;
	bh=Sc5ObmbImI/vSISRN/11Dhe0athtts0hKi7q/ZDxr5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dN5IrE8brpTD2opNBktf1jS032PmiNKmoVa3bIttTZpz6Fx/C+AjHP57sE0qozDt+Iitlemfq7UelQSr04ffvbZ+fNOraQzx8TC2xJYOaK6Dt00V+qGYVrtvLjyWZB7JNJQ5qJTr38e76V3E6YY8CwK87YpAYA21JVI+Kc/MJtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1MAehcQZ; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1MAehcQZ"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so726751466b.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 20:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743390874; x=1743995674; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VMO1QGK0kZtFj1xGxtjV8T/YmC7nhGXlI25kqEbZCC0=;
        b=1MAehcQZw+1HgCKk6++A7fwX/zDTbl48a4VQneRM3qjjJwZtIVhztn8PUmHyb1+OG5
         y/niPHwB5zJDlfGxhB729wIcLCiDsKJZ2s0q/+1uzw/urYzFq+MQ4ma93BEPA4lF396M
         3B+Q/zIMtnFTsXBzN8NI9O3IDjXF7BlKV98khbPC0A85mBbvpwmKIkNo8VYDa97DxFO2
         cwj+Ae3WAVZwx5qJ5HZ8dWQ7keo1wY2S/zwNjBS91kavPKj3CVhyQShiNs2Xxa+yRg9h
         mIA8J8JSRo5n9frcVp61KG2jDVTNO+OydKM55t0q0D64FVRRYPzrSm/44/JSsWHjV/bA
         mDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743390874; x=1743995674;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VMO1QGK0kZtFj1xGxtjV8T/YmC7nhGXlI25kqEbZCC0=;
        b=aapRiQXtPkqXk1QzWxsEVLjALRAXFU3LsSQ5bY8dn7hQ5R/qTZUONW+ihZNQdeqmKQ
         tncvzk+Zb8Kn9WBkiLDMzccaX2OhD6Vi38a8t/+MvLdhkjVWFNtnt8WVq79lqrd99cZi
         fpa4CbQOohS7UaaIka2GbHZTOPTUS3hggFr7CXLebZOxJO6jOqgaD8jSPffh8Hz5Re21
         PFUybacQ961qmuuRsnzbtODK6tjGJRYB9462NtcwI3Hh5v6L8ouxVtwWg5VtSqc8vCa7
         HzmSPpPNyFV7POksb4dke59AtL2LxWPKHPXP62Nvlgvl7HctirDoyDwDQ81XoXuEaQaj
         derA==
X-Forwarded-Encrypted: i=1; AJvYcCV87fpI+kcjoM7UwWj/sW3xAkBalqOcPvKivKdCgYDuW750kVjQ+FR6JFqnfiz2TwgU4NoFZQdrT2nPDx4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCbEpnnFmboGLxkhgN4D9Yh5EXqPZiTVo5+J6kerX2yJzNilEx
	m1UC3Exn6OGOqpEEfi6/dYB+i23S6I8P7Z9ThFXwiRmSmKTSInPz4+Nstakck62yFaEsXqxQdj5
	fNOCalG1ND1lx8TzScWkBOePm8eC+gMjN2mzk
X-Gm-Gg: ASbGncv2eJIWGCFql55RDQ+bt//O26O+Szp2d9SltWgp//veceMdtSFKkqzJGwf7Zuo
	OhSshgz43nP1SGhKGPVNtxM8dGzJajy1K/fGpTZYJXZtXGuLqge3p1gqZxeigc74UP9fSZyeGs1
	rjsaP0SC6yMkk8bJR+2boN5Q==
X-Google-Smtp-Source: AGHT+IEcjCiEdaVFhcaOLq6mYf51/rkQa4ioe/o8LrmJDJwCNxC3Y52svPuxkHyAq3hpvK2OLIxqMGFAGsTRXjA4wrs=
X-Received: by 2002:a17:906:5657:b0:ac7:391a:e159 with SMTP id
 a640c23a62f3a-ac7391ae30emr508952466b.60.1743390874365; Sun, 30 Mar 2025
 20:14:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331022011.645533-1-dhavale@google.com> <20250331022011.645533-2-dhavale@google.com>
 <45548d9e-4cfa-476d-9eaa-b338f994478c@linux.alibaba.com>
In-Reply-To: <45548d9e-4cfa-476d-9eaa-b338f994478c@linux.alibaba.com>
From: Sandeep Dhavale <dhavale@google.com>
Date: Sun, 30 Mar 2025 20:14:21 -0700
X-Gm-Features: AQ5f1JroCNq4Yy5sw2hbu7GoipaHkBCgmdnmK2oAA_WFw0A02wR6icNSL4dPg3U
Message-ID: <CAB=BE-S6Brg0e277mdY-d3ZwrGeUe3idz37_FJVaTesAFTGfnQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] erofs: lazily initialize per-CPU workers and CPU
 hotplug hooks
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-erofs mailing list <linux-erofs@lists.ozlabs.org>, Gao Xiang <xiang@kernel.org>, 
	Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, 
	Jeffle Xu <jefflexu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"

Hi Gao,
> Do we really need to destroy workers on the last mount?
> it could cause many unnecessary init/uninit cycles.
>
> Or your requirement is just to defer per-CPU workers to
> the first mount?
>
> If your case is the latter, I guess you could just call
> erofs_init_percpu_workers() in z_erofs_init_super().
>
> > +{
> > +     if (atomic_dec_and_test(&erofs_mount_count))
>
> So in that case, we won't need erofs_mount_count anymore,
> you could just add a pcpu_worker_initialized atomic bool
> to control that.
>
Android devices go through suspend and resume cycles aggressively.

And currently long running traces showed that erofs_workers being
created and destroyed without active erofs mount.
Your suggestion is good and could work for devices which do not use
erofs at all. But if erofs is used once (and unmounted later),
we will not destroy the percpu workers.

Can you please expand a little bit more on your concern
> it could cause many unnecessary init/uninit cycles.
Did you mean on the cases where only one erofs fs
is mounted at time? Just trying to see if there is a better
way to address your concern.

Thanks,
Sandeep.
