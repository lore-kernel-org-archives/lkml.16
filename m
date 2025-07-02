Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F971940A2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 22:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751493662; cv=none; b=SkGaqsL8KDNHz1KEbge7Q9jL6+ACaKGwxJVKjwK0aoBxVkPE1y5jvaWulxArihQkvgmqFnHxwrP0xsqoMI9UTfAaoONMIa5AoIL2nIbrUfFD8b+Y67nORiK3FH1m8E8IHN5pLO6q2fYH4bSwhCcn0+ExV+zebIL6evRfEvEq1h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751493662; c=relaxed/simple;
	bh=5YYFOCsJnX8d3GevyvlTzzIk6SIuPizITf4JXt/BAEQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=R7Gdrcs/MJwG2SUMZNt00AlvuT8PbFNkFUOgfgfHt8okBDXXTIiilst9TT6ZSMug1kmk0ux+M7+0dbZ5fKUZ1ZGRWUNTIGE1iFCBbfvEL9cZc5+wEgMWu1Ef4lz3ejvbScLjTdMXiBwgG6RNPXhzro3p5YkIrD11qmIqtUwYgRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qdllhblg; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qdllhblg"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-235ef62066eso93731185ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 15:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751493661; x=1752098461; darn=vger.kernel.org;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5YYFOCsJnX8d3GevyvlTzzIk6SIuPizITf4JXt/BAEQ=;
        b=QdllhblgZYcTSc0dHzrkBVhmpCjZ5VktdepHl6WYuC8utcJW+JY9vLkaKakqeM4eWO
         5JEblFbSTk303ezoI67Lvz7y8TklZMjxmdraOqBS/8/feU6Iqef405BQa+hcUioJfIe9
         PRVdtjtigwnCp2hZ9IE5xOx7w04/jUFUW9wSIM6KLNv+s18OTUeB/n95co+mzAtFJn6x
         9bDDLmVJqx4C4iCVdrPRocnugmhStcdxrxeB+lM3cxgma/JLTwufNW+OCW4K2IKN3U2c
         UDE1OTG9gUr5GkIyTv/zQT5r5RR2qt1zvUnMfebKbDKzRTVnWzya95WQK7bFovAskvPg
         43xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751493661; x=1752098461;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5YYFOCsJnX8d3GevyvlTzzIk6SIuPizITf4JXt/BAEQ=;
        b=ZtkZ7oWspJh5/VevJUQd+vGiAIEgEq3G1Fh928yM9vF9QCtmOy5bdbcBMyWUrIr9B0
         TXAIGUTCic8uRdGjjFlidOUFwQmrwdqIEBBomxicyBQ24s2KmAeSoZOeaOq6sqb+QD+5
         OKtc90R/RfX1ZKlFdQNmyxwyqn6xmanMZMAWMSj4DJyc166NPMmVAjOIWb1tu+gmkQqW
         KhH906Y76dFFmGB8lmPKx7RRfZ1JNJu8YQKm9+Fx6kT65asaim6vHb8ZH9OMx6mhtlD5
         nHbZeKguADF4CVnNqPng5dAmpBVqJKTIrNbe/x1ks2tZceB9sexHG6fBMUypTIRG+GZz
         zg7w==
X-Forwarded-Encrypted: i=1; AJvYcCUVEW1+E+pWGzJIyp+QyMWtYDYHoyH3VMT71ajhxx3Qmbmjb4+zn8mm8Cz7lzZw+HN+eeAgveYwmAPlK74=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7n3cOpGUA5kmqFcP3RdKwYzQ82am2ygjdpQtznaXvmwWHneio
	RykOPhzq0D4ToW/ldD4hoCVDyLo04LQsy6PfYwkdyx9OEMFasmVp49Jw0joFfhmbUA==
X-Gm-Gg: ASbGncsEdHFFBHbvbiQDR7O4b2GOYFzai/48gsRntgk+R6nldelvrs9k3rbYWEBAKb0
	FEqCUMVfYXofqCXUSANThzx+5uqiKRyjFvx9NyORpIqKtpwH/5iPRNhnncie9qu0u6ObbCtCiDe
	OnQKWP/2Uh7mkTECGRcc2vrvvgvfEsgMK0A7EWzbQUNgu4JYbZUUFMGzAcK5hGDyTG5QRQKOT4T
	I+vs8Eoj5MHfS8b+lp0R6CnZBRjtuTIfy/NKbTvOo7sF1gtSmAhR9t2brOQdTuvCGq/6jNihLO5
	28cC+h7u4aBrriMpexujMUZRL5MlhsaKk7tX92FqQZoPRroERTTq+VJyyrGoSXGDC6oJ3EuDw2n
	CbXB7N1XuZYrg4ap4oVfdCcTRQY4vEdHs9gx8YA==
X-Google-Smtp-Source: AGHT+IFeH0m2dNn02wNTz56CuRzim+pAyvmjWbYc7FcKMGX+ehKDGHSrKlm94sLbkFRFlLq6G0OPHQ==
X-Received: by 2002:a17:903:4b43:b0:236:7079:fafd with SMTP id d9443c01a7336-23c6e5b7737mr77658625ad.36.1751493660515;
        Wed, 02 Jul 2025 15:01:00 -0700 (PDT)
Received: from bsegall-glaptop.localhost (c-76-132-13-32.hsd1.ca.comcast.net. [76.132.13.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f1d72sm146381475ad.66.2025.07.02.15.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 15:00:59 -0700 (PDT)
From: Benjamin Segall <bsegall@google.com>
To: Aaron Lu <ziqianlu@bytedance.com>
Cc: Valentin Schneider <vschneid@redhat.com>,  K Prateek Nayak
 <kprateek.nayak@amd.com>,  Peter Zijlstra <peterz@infradead.org>,
  Chengming Zhou <chengming.zhou@linux.dev>,  Josh Don
 <joshdon@google.com>,  Ingo Molnar <mingo@redhat.com>,  Vincent Guittot
 <vincent.guittot@linaro.org>,  Xi Wang <xii@google.com>,
  linux-kernel@vger.kernel.org,  Juri Lelli <juri.lelli@redhat.com>,
  Dietmar Eggemann <dietmar.eggemann@arm.com>,  Steven Rostedt
 <rostedt@goodmis.org>,  Mel Gorman <mgorman@suse.de>,  Chuyi Zhou
 <zhouchuyi@bytedance.com>,  Jan Kiszka <jan.kiszka@siemens.com>,  Florian
 Bezdeka <florian.bezdeka@siemens.com>
Subject: Re: [PATCH v2 0/5] Defer throttle when task exits to user
In-Reply-To: <20250618081940.621-1-ziqianlu@bytedance.com> (Aaron Lu's message
	of "Wed, 18 Jun 2025 16:19:35 +0800")
References: <20250618081940.621-1-ziqianlu@bytedance.com>
Date: Wed, 02 Jul 2025 15:00:56 -0700
Message-ID: <xm26qzyyb6cn.fsf@google.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Aaron Lu <ziqianlu@bytedance.com> writes:

> For pelt clock, I chose to keep the current behavior to freeze it on
> cfs_rq's throttle time. The assumption is that tasks running in kernel
> mode should not last too long, freezing the cfs_rq's pelt clock can keep
> its load and its corresponding sched_entity's weight. Hopefully, this can
> result in a stable situation for the remaining running tasks to quickly
> finish their jobs in kernel mode.

I suppose the way that this would go wrong would be CPU 1 using up all
of the quota, and then a task waking up on CPU 2 and trying to run in
the kernel for a while. I suspect pelt time needs to also keep running
until all the tasks are asleep (and that's what we have been running at
google with the version based on separate accounting, so we haven't
accidentally done a large scale test of letting it pause).

Otherwise it does look ok, so long as we're ok with increasing distribute
time again.
