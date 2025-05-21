Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C83628EA64
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 20:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747860038; cv=none; b=GRsRxNDI6a/8kctDc/gv95pdD/JJKZtp9nnHnUTsBZzIfa1bNu+/gbYT4LvTLc06ZtcMYGUUrhHU5LouP4OOej2Dk03nABIr3mepG6XuDlmv41H+DCPekNJes5rQ/bDoynBnI4ge/iCd4MSz61khCFAh8zJ6nvCvArF3jtrWyN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747860038; c=relaxed/simple;
	bh=zbjY1wizS23vo58PabGXx/GKrU4ugGQE+QWdx9Y90HE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qr4KJhiqBHNLSuMR6wMeea5j6q7InUjlzjStkG38Wj6p6gxH+H+wb7TxiKwW36l8TcWgUpG8RtpOxmpVqC8Sj4Np56wG7XGdPOZ8dMs+PQy8Ns2uIWmXEN79mLsUwSoEhfhxrLF1O8rsEOT1V2GZp0l9EC7oxtTCVwqFP8Yc+qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TjAQIjZP; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TjAQIjZP"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-231f61dc510so1143675ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747860036; x=1748464836; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e8RIINbhOGI/c2NEEqIGsIubtNjwgvOZk5mJqYlzXzg=;
        b=TjAQIjZP6FCN5hWP+eyi1ayVY1f9+gOmKc9VUpQFB1MKsiVCa4YmBSbMOX5JMQ03AF
         wfp8kskeIOiDcceW6ExRJJv1kRFcjaFVeRwmg8uIZcKFddwk/X1/EZMHNUfkPUYJ+C3K
         A5nLsyjUBhhFvEDsIVrbuXXfdQs747V76LwV89j0MS1XatYC5TbtGqIPacRzFSGse2Mx
         OVeHwAnRp619ak/QZvACf6AseZPR0XhtAhz8tUKXflzvJLzoGX5yOT1QQT0nZFv+W9dA
         isWla/mge0aEsbnsAan8bsA6fgJKcbNGUIUXw3ywcfT95cH7364fZVDrhS/VDdxzJq5a
         9NOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747860036; x=1748464836;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e8RIINbhOGI/c2NEEqIGsIubtNjwgvOZk5mJqYlzXzg=;
        b=GfvjNmGA4PdIDTw+Dt+Tg5n09sZmywVZ7ssFnJT2B2mqE1rf+0a/94Bz41TjSEZ8Nj
         6ziUnIWnIQCNo9IYxuV1i1hlog6IKa7ECPz9JUE8ahgjzPiKmTzB7O2l7imsUGvumGkz
         UUGYcxvnfJaFsU3uH8tKUuJf90e9257OsDYHo8Ft6E7MP1EOdPzBUdlxvuuvwAg4aBTj
         m1ksKC4Y19cLhOnX0e6EHFGIJAYfdjCUObi4KnNqrDiX21RZ0arMuOvkXmVkwXkHqG0i
         KKuJLB8vB1ZFGQQBSZkbncTtmLJ9scT46S1ommtPpwtMZZWhKucCM6gxR5yB8OHlIhM7
         qgTA==
X-Forwarded-Encrypted: i=1; AJvYcCWzudWfR6XNRvc+xl4vSCVwQjScs/nM9zweirumV/J7KaNn0WdoaAvb6UEcAyUpWSy+QoMeTh18FgCPWo8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVk8fUuifncTYb1+/HhKxWvTDrgbhlBBcErHBYpxYasG+5Cyob
	nqCet56O9yJWAEdjshU/edcMnnlRGgB7Zt7CXRG59RdqADnH4SIfeBUYfMQuyDdmGw==
X-Gm-Gg: ASbGnctRQ6JRTIG7nPjG/LqQk3kJC2Pvd/aFvHl7hJYqJQE6q4bL5AUjw12R/R0j4bD
	BU4f1Ycy1F5o0z2DHtzL8M+wnMh46uPWdUUPNNSU+ll22KiN/Z34uHlM0aaknDVRFXyc2EbZa5F
	6mPJMm42MZRB3xx2Lpkj6abnuEHLRxK2c44Ktu0e/1fw961yR0azPGnIXkdeRpiKMqZtwrLgUXj
	phC7CE1bpUi2912JH3bA/WiwLzim6liixe/6BwemaE3ZItatiK+QGDqdCgkugS6Xi8PuNTIsUxi
	O8nE/9/7iTpjFdrv0PkOv6a7RMj0Qo/EeDez10tf8zzOGyiRH7DIz5gULVe1+utdoZv5WxeDKjs
	rcH0kKAEU1ZGcgIYhRywf6DqU3aM=
X-Google-Smtp-Source: AGHT+IFWhfr8eMQeyoGAHZpfW3xBnV+hWPIDqTflQQXz1A1UZnZRmo37vQSO8OyDvOPpm/xdlB+AMQ==
X-Received: by 2002:a17:903:1b66:b0:22e:1858:fc25 with SMTP id d9443c01a7336-233d6dda119mr168815ad.9.1747860036185;
        Wed, 21 May 2025 13:40:36 -0700 (PDT)
Received: from google.com (202.108.125.34.bc.googleusercontent.com. [34.125.108.202])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb084cd2sm10025558a12.54.2025.05.21.13.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 13:40:35 -0700 (PDT)
Date: Wed, 21 May 2025 20:40:30 +0000
From: Peilin Ye <yepeilin@google.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Eduard Zingerman <eddyz87@gmail.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf] bpf: verifier: support BPF_LOAD_ACQ in
 insn_def_regno()
Message-ID: <aC46PuLHp6yjTBJR@google.com>
References: <20250521183911.21781-1-puranjay@kernel.org>
 <80ef5e2e-c2d9-45b7-9a48-f8c1a4767eae@gmail.com>
 <CAADnVQLgPBcRAqKfCXQwZae2jKDfp=xSFZCgzHgg-jcBTYp-yw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAADnVQLgPBcRAqKfCXQwZae2jKDfp=xSFZCgzHgg-jcBTYp-yw@mail.gmail.com>

On Wed, May 21, 2025 at 01:04:47PM -0700, Alexei Starovoitov wrote:
> On Wed, May 21, 2025 at 12:13 PM Eduard Zingerman <eddyz87@gmail.com> wrote:
> > I'm confused, is_atomic_load_insn() is defined as:
> >
> >           return BPF_CLASS(insn->code) == BPF_STX &&
> >                  BPF_MODE(insn->code) == BPF_ATOMIC &&
> >                  insn->imm == BPF_LOAD_ACQ;
> >
> > And insn_def_regno() has the following case:
> >
> >           case BPF_STX:
> >                   if (BPF_MODE(insn->code) == BPF_ATOMIC ||
> >                       BPF_MODE(insn->code) == BPF_PROBE_ATOMIC) {
> >                           if (insn->imm == BPF_CMPXCHG)
> >                                   return BPF_REG_0;
> >                           else if (insn->imm == BPF_LOAD_ACQ)
> >                                   return insn->dst_reg;
> >                           else if (insn->imm & BPF_FETCH)
> >                                   return insn->src_reg;
> >                   }
> >                   return -1;
> >
> > Why is it not triggering?
> >
> > Also, can this be tested with a BPF_F_TEST_RND_HI32 flag?
> > E.g. see verifier_scalar_ids.c:linked_regs_and_subreg_def() test case.
> 
> I suspect it was already fixed by commit
> fce7bd8e385a ("bpf/verifier: Handle BPF_LOAD_ACQ instructions in
> insn_def_regno()")

Ah, right; I did it when adding support for riscv64 (which needs_zext).
I targeted bpf-next because at that time only x86_64 and arm64 (both
!needs_zext) supported BPF_LOAD_ACQ, and didn't realize this could
affect arm32 (needs_zext).

It should've targeted bpf with a Fixes: tag instead.  Sorry for any
confusion.

Thanks,
Peilin Ye

