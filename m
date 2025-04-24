Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D45222564
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487542; cv=none; b=uDg3eB1YXXZ49C2FSuHyK3Bdhcad48x7cJmJhqUrq1YccBwk4FR/XZKKaAIyTZdSe9oHIqGbJSwCjEwxrjcjC9KQMHHfmx9/l0Smcd2C6CYUqpqm6dK4xPc+KauBrB86cTwCgjL9xtQ1c0TdAFFUH4uT8W1IGZm8N3zuPcXEK0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487542; c=relaxed/simple;
	bh=NB2oNOCnxG85GWEANUQdzI220Wn03rrzKWljOGrWZgs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m3rMAbdhLk4JP1fLNrxIjGJJng0noJsyLNHLlsrHeG2ka6HvDBL3vgd8LacNECrYirIkt6n7bBCdvJhgQ2InrrNLPpLl9Pn8nR8TEMFCUmbaGNHUFg8A7ki41hscy//Q+qV0TQ+06/ujuk8HtxLgkWfD4SSWridedhpas5O+lz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mexL5FXw; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mexL5FXw"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30bfc8faef9so8890611fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745487539; x=1746092339; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NB2oNOCnxG85GWEANUQdzI220Wn03rrzKWljOGrWZgs=;
        b=mexL5FXwkVk6ZCT3PHNvquF/XJMY+abzirVAT9TFiEjpv7FrgzHXU/Eowns2X3iDON
         M+Gmm7vH7ayY1tdRynNUsp5Xg6R4A/bbW2gMJ42YjaBWxXsNi8/emnHqcvDijNecEBUh
         gvjqZBi7yGKiBNoXMgo5zMfpUW2ZAdh0VF/tAeT6rJZr5uGMgXtKBL8Keb56AR2urjiR
         /5au8IcGkFTNrprm1XG+pkHpW750tT31F0VUuo/hn0UyAzuI01gDPl78EpEHnYrw4dXg
         6eQ3kz+A874s/P3CEQuy43mBtyBknzql8UlmO/eKSgqI8dzSZMv1/a+wZaRPOWZBs4VU
         DOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487539; x=1746092339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NB2oNOCnxG85GWEANUQdzI220Wn03rrzKWljOGrWZgs=;
        b=JlmVXHZgFHtaGNT6QJaI9e0uAPVLMhu+jc5Vg0+KtNIDBKyvqAFODpM3SimXEpE8I8
         HX+1oKGKaa83lPua+hDvEeU2/TxX1dhOJgVsEmmrtYuej1LB25aX4hat4Ltwu605rrZH
         QgBj0XElfOsGSS2t/8lG1mGpuim3/8NlZ8iju8us2mCvUQHKPcjwc9RJ+9TwMGPTvuOB
         ALSFcBOTsyW1odH7fRv6gBegEYNIGUg31Cz4yyEPspUuqnRJPr86/UkIxnq0h9ZUpds8
         FWnraPI6Vs5UbcvtoMI9NvZHNd4Eud3VbJqq9XfLX0xvQEhAH6I+kiiruL5gxpJAaLDV
         lTvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLB0gvxE84d//X+sBywZ6ZiDxG/Kp1FMXzROk/i4t0lWhjFdO4dOagiNJAdbOBglc3pMr5SgSFDGizMvg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc+in7VAop9rsJ9EeGhpzpfPo2edFlsSi5XqK28LPfoVRCcmbJ
	S9/64hxOgolb79OL9SRPU0hlieSXLt6cY0fKsC9CsV0zbZaiiQXHKGEoHkuWbmGJjXI/3UqVi/B
	r0ET06iFR98n8B3BoQP88Kbs3PNc=
X-Gm-Gg: ASbGncvbAqLcrsRCpsDpPhoj7p18v19n2VzH8a1T40Na4GeUT3tFVp0MVc5nSkJ+0EY
	HJBtQWl/xXQM7E0t5QwxJIL0S55+oepRcH85nH8zt8gzM8pfc3GmMJFo8YR4BR/2pc4M0hz3UAl
	iG6ewUCLri5tJNQmcvSVmpyA==
X-Google-Smtp-Source: AGHT+IGxVjnHtPNegbr3C7Imfp6iB6vUgpa+DyLIQKc23y3BGS5YQua6rG4/E/4fQIRZ0NImjw5iKW4U3PoyKnwuILY=
X-Received: by 2002:a05:651c:1614:b0:30d:62c1:3bdd with SMTP id
 38308e7fff4ca-3179eaf48d1mr7393771fa.23.1745487538397; Thu, 24 Apr 2025
 02:38:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202504241621.f27743ec-lkp@intel.com>
In-Reply-To: <202504241621.f27743ec-lkp@intel.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 24 Apr 2025 17:38:41 +0800
X-Gm-Features: ATxdqUEbFuGWETRbMvxzKfov8XBuQuSyhGaBkFQpEJHsk77t9tC6s3UekgRaWuw
Message-ID: <CAMgjq7AHR9zg+-BRhMeE_06endOP1dno0=rKZjU2CUmUzbh0ow@mail.gmail.com>
Subject: Re: [linus:master] [mm, swap] 7277433096: swapin.throughput 33.0% regression
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	"Huang, Ying" <ying.huang@linux.alibaba.com>, Baoquan He <bhe@redhat.com>, 
	Barry Song <v-songbaohua@oppo.com>, Hugh Dickens <hughd@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Kalesh Singh <kaleshsingh@google.com>, 
	Nhat Pham <nphamcs@gmail.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Yosry Ahmed <yosryahmed@google.com>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 4:40=E2=80=AFPM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
>
>
> Hello,
>
>
> note:
> from commit message, this regression should be expected. we still make ou=
t this
> report FYI what's the possible impact of this change.
>
> below details just FYI.

Hi,

For most workloads with random swap io, there shouldn't be any
regression. I checked the test and it's doing a sequential swapout
with 8 workers (after a fresh swapon?). I was expecting
bae8a4ef3efb56bb7e83bafd3c0856845aeaf605 ("mm, swap: use a global swap
cluster for non-rotation devices") to optimize it. Seems that's not
enough?

I guess we might also need to disable the cluster shuffle in
setup_clusters for HDD. The shuffle was meant to reduce lock
contention on swap cache, the contention is clearly not an issue for
HDD, the bottleneck for this test is IO, that might be making the IO
more randomized. Or maybe clusters will better be sorted by offset for
HDD.

It seems this test can be easily reproduced with `$USEMEM -n $nr_task
-W -d -p $TMP/pidfile $((size / nr_task))`, I think it's not a real
problem in productions, but I'll try fix this if have time.
