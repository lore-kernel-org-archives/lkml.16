Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21C11AF0D6
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 21:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738963803; cv=none; b=N4YI1vEnRZXqr08bEY+cuFXnzM35sSbMREoHY5V6meXILScdYeEsooE1F8yDtSRkjWTI0YurhpB2edRK9arUowWsBD1UifqJnhBE2KLUvcrenj3rvd7tbbgFDpQ80w0bYBveDL20A27yr5m2WJAr9LDuW9TNJmC5LXtWZvlmrP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738963803; c=relaxed/simple;
	bh=8dRlDI5WmSmXm0KKjj2yjaKPB4VGUf/sFQBj7bC46Ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ax+1OOgiXrGfbHaDj4LPJUeO5nUGUGgJyYmgbQIv32SypjbrgZAgQF0IkWZtUK7DWE1jO0VbSpfJEqc5oOvGmoex36j2IXhW+XY31VBzdOJ+GxjPrBOn+y8NKEtsBHYDxDErGVpQs3VtNm1WrY3xzETm0jdHEv0DML4a/FvLbNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aINefycw; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aINefycw"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-219f6ca9a81so7655ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 13:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738963801; x=1739568601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WpmqbDlVKgWI46RiBOd7cmqJb5HFtWlucmHwOHZfM5g=;
        b=aINefycwRwhIpwSPcrB9tIHeZv0hVncY+2bhaCAQ/ZMYfNpbj0+V4jqPbASXrjG6BT
         SIPR7C9pQRRJrXfVzPPeeTQLul4lJHXaaRGcOOO3pvL4+CB41W+6CC2/yzhTe2tYMHVv
         WfevarCD3iKkWXmysP9HpH4bml8KtI3Gp9OqKSvt5LAFDTf8Gi6lTkpZOyXdixAGGBfk
         cXx6EmZmeRlfS9Lv/yBK3hf1RSgqPE+kvudXMbZkBKSYLpZpcvBkt8sogLkRL7toH75G
         psZ578OvlI0W4R/u1e+a8dwm8utPs+ZbJgY2Zf3XTKf6s4kf74lBI2e8LHJRK8wsyZVs
         Eb4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738963801; x=1739568601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WpmqbDlVKgWI46RiBOd7cmqJb5HFtWlucmHwOHZfM5g=;
        b=d/QpY7D3nlDvAUHIhPZoVVEj2zudIc1Li6GH6vx2VfQTWnLiWon2cwUpdgfDO59+PJ
         vdj0UHvymF7vqCM+2p9imRGnFx7k84plGkEnt2LUnqJ2Bl5irO0PpX/NJ281xzBGXiqg
         djePiNbBm5ChkGOeXSRorbNgLGbNQkZz2k7bou4NGX9374tYbGKWDJHM7/s+MpBmowqz
         ynga+SHK+foab4fojW18c7nA5eaErZn7AEJzIwlnBLfW3Ttlm16JMkx5ZTydjaAFuUBT
         aMRP3qsMVWkEJY8j/WP1Aa6qQ159hVcC1ht1VE+8b6V7+nPB+jUv6j2k4U1NLyq/LoLz
         BSYA==
X-Forwarded-Encrypted: i=1; AJvYcCWQnB4qo/PKqx4QhWLQbzY/8eInC4LWaBSIalPp0Z1T0gRVxDn3UIOZw88QNhPJP+0kPYT2cDnePEcFbbs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnQOYKaJM1jzkyfxoslIzN0O03RHCdS8WzDfMbwVWDBAw2RJIe
	j2Z9nIprRENluKaaClPXK7bMSYhFqCOYrwkm5NnyaeFrL9K/gdwGlITD8hp4tg==
X-Gm-Gg: ASbGncsh4qAqfrTdU+QgJX1xh1SnL+tCXVp+C1WB9jd5/qZ3K5VTOFJVkmIVj8vZtGN
	/x6u6Bdg5N861q5lDFZqczHXt5WLcicQt7hNjvCKtwf9Cpx8Y0P9shM2Z+DHM4SnD8Er/SjZo09
	EdjoLbh/uVbMCet3R/ep1zN9aHeYDsA2qSKz1hR4zGcI21qPJF2QtDSJkDjOL7Lhnbp/sP4bU+M
	K4gWFMfTU9X1OLQpGLeK75/FDqcOqPFGpomgfvYDO0IhnsVzdZztdVRLm7zyOXGFRe2GTO7cRKz
	rNNk4Ahfeam0XGynttYiTtAMRYgMj6KP7KPGaRBgu5JE16tRN6jwAg==
X-Google-Smtp-Source: AGHT+IHP6x7/nnWTD43CmRO0CpbJGNj6KB/SNxwdoOzxC7LfXgdBO2BKOfnZMBUjldNgUy6Lg8WukQ==
X-Received: by 2002:a17:902:aa08:b0:20c:f40e:6ec3 with SMTP id d9443c01a7336-21f69e34933mr559535ad.22.1738963800724;
        Fri, 07 Feb 2025 13:30:00 -0800 (PST)
Received: from google.com (147.141.16.34.bc.googleusercontent.com. [34.16.141.147])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa2d831a1csm1670429a91.44.2025.02.07.13.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 13:29:59 -0800 (PST)
Date: Fri, 7 Feb 2025 21:29:54 +0000
From: Peilin Ye <yepeilin@google.com>
To: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: bpf@ietf.org, Xu Kuohai <xukuohai@huaweicloud.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	David Vernet <void@manifault.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Quentin Monnet <qmo@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Yingchi Long <longyingchi24s@ict.ac.cn>,
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>,
	Neel Natu <neelnatu@google.com>,
	Benjamin Segall <bsegall@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 0/9] Introduce load-acquire and store-release
 BPF instructions
Message-ID: <Z6Z7UsB-AGD_Xhdq@google.com>
References: <cover.1738888641.git.yepeilin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1738888641.git.yepeilin@google.com>

On Fri, Feb 07, 2025 at 02:04:54AM +0000, Peilin Ye wrote:
> Peilin Ye (9):
>   bpf/verifier: Factor out atomic_ptr_type_ok()
>   bpf/verifier: Factor out check_atomic_rmw()
>   bpf/verifier: Factor out check_load_mem() and check_store_reg()
>   bpf: Introduce load-acquire and store-release instructions
>   arm64: insn: Add BIT(23) to {load,store}_ex's mask
>   arm64: insn: Add load-acquire and store-release instructions
>   bpf, arm64: Support load-acquire and store-release instructions
>   selftests/bpf: Add selftests for load-acquire and store-release
>     instructions
>   bpf, docs: Update instruction-set.rst for load-acquire and
>     store-release instructions
> 
>  .../bpf/standardization/instruction-set.rst   | 114 ++++++--
>  arch/arm64/include/asm/insn.h                 |  12 +-
>  arch/arm64/lib/insn.c                         |  29 ++
>  arch/arm64/net/bpf_jit.h                      |  20 ++
>  arch/arm64/net/bpf_jit_comp.c                 |  87 +++++-
>  arch/s390/net/bpf_jit_comp.c                  |  14 +-
>  arch/x86/net/bpf_jit_comp.c                   |   4 +
>  include/linux/bpf.h                           |  11 +
>  include/linux/filter.h                        |   2 +
>  include/uapi/linux/bpf.h                      |  13 +
>  kernel/bpf/core.c                             |  63 ++++-
>  kernel/bpf/disasm.c                           |  12 +
>  kernel/bpf/verifier.c                         | 234 +++++++++++-----
>  tools/include/uapi/linux/bpf.h                |  13 +
>  .../selftests/bpf/prog_tests/arena_atomics.c  |  50 ++++
>  .../selftests/bpf/prog_tests/verifier.c       |   4 +
>  .../selftests/bpf/progs/arena_atomics.c       |  88 ++++++
>  .../bpf/progs/verifier_load_acquire.c         | 190 +++++++++++++
>  .../selftests/bpf/progs/verifier_precision.c  |  47 ++++
>  .../bpf/progs/verifier_store_release.c        | 262 ++++++++++++++++++
>  20 files changed, 1164 insertions(+), 105 deletions(-)
>  create mode 100644 tools/testing/selftests/bpf/progs/verifier_load_acquire.c
>  create mode 100644 tools/testing/selftests/bpf/progs/verifier_store_release.c

Looks like the llvm-18 CI job passed but the llvm-17/gcc ones failed.
I'll debug with llvm-17 and see if I need different #ifdef guards for
the new tests.

Thanks,
Peilin Ye

