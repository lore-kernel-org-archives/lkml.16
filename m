Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88B02BAF9
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 03:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738206620; cv=none; b=BMCPQEPdGgxqR5krhONeb1iDpzC3hFGDdG1WfJdcEyiZPw47E8Hru0sr4k2dTgNx22pqFuKJqc89t4EIfmVnRwddsd9vgpNjQQDzA2n+V1J98EBO0LduqMzaKpu1i/4ARjH7teEagn204cxFYYVK0jNP94JcO9VQ2wpe2FWjTTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738206620; c=relaxed/simple;
	bh=jq/WuP0FzAKKslGEtfWEkcSJQ5q1vzVdSJ1/IMOitTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XGrSpu7dRYCYu5MDAI6zdcPi8EkPySR/VkdnarY1LgtSs+EOkWG2Zy29uqj590bENKigR8jaTLKKp0ZkdY6g2uiwWR2CPXCXTijlN3HcrbW1T4LGszX7RLhjwApRarhOja29LCSAaVGC7rNG7r57fecnEnrI6R6e9Obcj3HWX9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1ZBPADa/; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1ZBPADa/"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-215740b7fb8so73815ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 19:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738206618; x=1738811418; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iozZcyUUIkHDUlZTrg5vhL4fOr44L6T33XHkD2MasV4=;
        b=1ZBPADa/hl/9NCYyMdeQPgo1LANPTUdjtMLdCEWmcD20u7QTl13Bc+bCj28ZWqTTVa
         udgSsB0TZxPx/AVSRpa79McOvN3T3+Q1jCxMK5qEpZzlm1YyNa9/AzLuQx4CXWJP0VYi
         eeqKDmaznhptTOsGlNbEYTUPK0q4iLOuVsusUe2xjIr+ZEJFGf8XxD2gdpHij+Kp9t9j
         HejGJqVq+aughbwjXQ+2Y9xN0K+wZgFnx7b51KfM/IdaCbaoXDeCxJ+gF2QZHHl9FNJZ
         y1/VU9rLdn4KCvRBdNwVA1cUYNAohxVjzHh7NJi01rFc8nlSuapH/++r3OCDkd7m0LN8
         godQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738206618; x=1738811418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iozZcyUUIkHDUlZTrg5vhL4fOr44L6T33XHkD2MasV4=;
        b=ZGOFYyaKe4shf9cBv9Qyd8Q6hF0UB+M5j9ul7yTNPTZGBYjNunK6ki3QtLIDzNR/4g
         +PabWz6vGQR9wVt8SNRl8siukMwgGHLPbbwcL9Jbhfjby5mWz+YBfNQJ29HDFpoYMmZT
         f7cxE0i/GNif9TtUIQorm8odehYsy9oo0NaNHUo6YhH2mLWQ4Z+U+s3KJmrHkAvvldmh
         iFB2CRCKix8hVBJjSFvUxsqSIbsdJ3Zeyk80YjDhar/85EwvJoa/f987LqYlobF5hJat
         T11+04KctkbO/CVtjsFbGVuG81snXj0fcU0chT8ite6YkWLj2YIweOlPvzFv8I7w52w6
         KfSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRCc6wu+gjvXhLgPZuW1SqrJpP1Cv+Z5QsQXNtHfqwdShgdTUsfSpGonQoIPP4ICc55fIu3o5NjsFodyw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcYXBEskpl+IsLOnzMIxaLuMlrW0B/ZN5YPIO4F1X3IAps6UEu
	gLZhvyYA8+RPew5uOor10SE/kOjLKK4a8zpKp3in3exhZ7jAp9bd7N7IevCBcQ==
X-Gm-Gg: ASbGncs77iHA/dBD25CgHH1P2O7Fu7jV3rBtay4KguwJqkwTUwGth4YNHzw4nrJEkoP
	72n84VaMqQcwRERB2QpNc2agnIZtotxAer7GM146CUaJ+JGrLTCmxAO6rZk/JVwmKx/U2lHTKGl
	gDTZhA4M+Etxseq8gbgLIe0Xl32cvcd5mYktAIHbRIHntWU8LKNuAMaunVrYQutnMbkuwMmEcEV
	y/m6MJ8gYmFJgOeRGPhDyZloxjF/mkq45gOPtRZOpqzqKqe/Yb7LHfaZXkfQAbskN6nYMk/tpML
	XWAhfFjTkDWRigg/aN7s/TLi0PGIBKZrt/hJSJHEwQjqqKzrppM=
X-Google-Smtp-Source: AGHT+IEEKyHbZCP0iiK15ABPuaXmbOXW1jxN8hiCr6k8KYnVexFhjDvy8HwRqZberwcgcNwTXgzgng==
X-Received: by 2002:a17:902:aa09:b0:216:21cb:2e06 with SMTP id d9443c01a7336-21de36959b5mr855465ad.19.1738206617674;
        Wed, 29 Jan 2025 19:10:17 -0800 (PST)
Received: from google.com (55.131.16.34.bc.googleusercontent.com. [34.16.131.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ce51dsm263323b3a.134.2025.01.29.19.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 19:10:17 -0800 (PST)
Date: Thu, 30 Jan 2025 03:10:13 +0000
From: Peilin Ye <yepeilin@google.com>
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bpf@ietf.org,
	Xu Kuohai <xukuohai@huaweicloud.com>,
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
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Quentin Monnet <qmo@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>,
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>,
	Neel Natu <neelnatu@google.com>,
	Benjamin Segall <bsegall@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v1 3/8] bpf: Introduce load-acquire and
 store-release instructions
Message-ID: <Z5rtlTv2pz9H-smw@google.com>
References: <cover.1737763916.git.yepeilin@google.com>
 <e52e4ab7bea5b29475d70e164c4b07992afd6033.1737763916.git.yepeilin@google.com>
 <b7de0135f7dcca0485ce9dc853d6ca812c30244b.camel@gmail.com>
 <Z5qmBaGE4a7NtaFU@google.com>
 <da01f44bb1f3463515574796c3ac139bbbf7b4dc.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da01f44bb1f3463515574796c3ac139bbbf7b4dc.camel@gmail.com>

On Wed, Jan 29, 2025 at 02:42:41PM -0800, Eduard Zingerman wrote:
> On Wed, 2025-01-29 at 22:04 +0000, Peilin Ye wrote:
> > Thanks a lot for that; would you mind sharing a bit more on how you
> > reasoned about it (i.e., why is it OK to save_aux_ptr_type()
> > unconditionally) ?
> 
> Well, save_aux_ptr_type() does two things:
> - if there is no env->insn_aux_data[env->insn_idx].ptr_type associated
>   with the instruction it saves one;
> - if there is .ptr_type, it checks if a new one is compatible and
>   errors out if it's not.
> 
> The .ptr_type is used in convert_ctx_accesses() to rewrite access
> instruction (STX/LDX, atomic or not) in a way specific to pointer
> type.
> 
> So, doing save_aux_ptr_type() conditionally is already sketchy,
> as there is a risk to miss if some instruction is used in a context
> where pointer type requires different rewrites.
> 
> convert_ctx_accesses() rewrites instruction for pointer following
> types:
> - PTR_TO_CTX
> - PTR_TO_SOCKET
> - PTR_TO_SOCK_COMMON
> - PTR_TO_TCP_SOCK
> - PTR_TO_XDP_SOCK
> - PTR_TO_BTF_ID
> - PTR_TO_ARENA
> 
> atomic_ptr_type_ok() allows the following pointer types:
> - CONST_PTR_TO_MAP
> - PTR_TO_MAP_VALUE
> - PTR_TO_MAP_KEY
> - PTR_TO_STACK
> - PTR_TO_BTF_ID
> - PTR_TO_MEM
> - PTR_TO_ARENA
> - PTR_TO_BUF
> - PTR_TO_FUNC
> - CONST_PTR_TO_DYNPTR
> 
> One has to check rewrites applied by convert_ctx_accesses() to atomic
> instructions to reason about correctness of the conditional
> save_aux_ptr_type() call.
>
> If is_arena_reg() guard is removed from save_aux_ptr_type() we risk to
> reject programs that do atomic load/store where same instruction is
> used to modify a pointer that can be either of the above types.
> I speculate that this is not the problem, as do_check() processing for
> BPF_STX/BPF_LDX already calls save_aux_ptr_type() unconditionally.

I see, thanks for the explanation!

Peilin Ye

