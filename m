Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADB018A95A
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 23:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738972081; cv=none; b=Sn/rQ8Y4gx2rirHGfHfXmwMAiqT/B1MMVxV1uEclt60Bf9rpgvzkG/k4tEwFjEhbtWIfHBYO4fdXUI3v1YkiwEdYUBGpX9AGxmBF3OwgvJZwj2NLP0N+VObcjdmpCLlQ/ke2K2SJ+oZCk8SCCiiU0IYb/AKKXvx9Wt3t3IluJ08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738972081; c=relaxed/simple;
	bh=shAKf8HDZQUbG9SwfPO2sGuIkzperBWdFL+n/R0QvFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RMXgdF6pdPDWTZzuQJIfcObbjBGolp2gJS940IBTmxTIpGmt55YQu+CZcoqkukxQkcz7XFDu7GDh7Ui5JDJtyTUVx/3H+ELB1NzFJyJcsv5tQj2RrDPVMaSYvKuJSlfsSde67icnDK0d1ROTpZePms0MimYSseQq4Eu5Nkjgg/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CyHZDhRi; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CyHZDhRi"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2163affd184so26435ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 15:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738972080; x=1739576880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1iwNqxyXX+1eY/JvvBpbWmyKCAKiA/P8z+kIxPWpe8U=;
        b=CyHZDhRinup5lvGELppEIw48YVM9eWSLSGiTAGsizDcqvRPRgHG/gipM1ZrHqA0WAD
         BEbJXKZ+DNyAEiRYyJDqEwoo62/5R7g+d6Xm6a0D4b1TYrT3tN81juSz7lgsg1u+t2+p
         KH51X6JBRRA2BccZs3zDax7aHSE7tvhEHxoYpuVnYI9lNLosWdN24/xxaJ3JULSbFY5A
         8zL6r8lB5kxewIkS83mIkGZi22/3/tQpbizg76WoDMCKWunga9HBo0KlPDDpArcJiRAV
         hzIyu7XtO0SDj+YlsTESsxiBTvW8EzVqHjcjRhTlTGzdCvFqbFxYZ7SdLJDRfw+YSj/E
         p7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738972080; x=1739576880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1iwNqxyXX+1eY/JvvBpbWmyKCAKiA/P8z+kIxPWpe8U=;
        b=l1P99mrtBJ7ZS5e1zakSbVIowESbT4PCW1spiX4X/Oxi2/mNGiYZI66WeElbcq1eJJ
         thyy0ix3CUYnlkTFtgth1BgHkQniM6hLbW9aWOW/n9JSFssmAY3hPtfpu+GSexTuPax/
         C3o9Pki/N4+TO/U5HNvf1uNrL/xSts3JK5WhF0NZt8YIXvnurdyRCL8NTxcoRgb0axuK
         euaSC7ATGTwjOCyPphoQNTvcoor5c8On2+0+ulwAGEm/Kr9VxRRHiEEuvxEQEV/o5py4
         AsNUDDgfnlXxvpbsTbJajTQpvSpdYmiMBtU/9Ab1vGw0Da8+/oYNKAwAs8I/fZnv7ZZM
         Q66w==
X-Forwarded-Encrypted: i=1; AJvYcCULT88VxHBdOmUkT7wyT9Odv2JczgIGbwmY93tuAI3wnei+9W0TkhRiiZIHWDTj15EdQ1UTIRrxNREemTg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwykGsTr2SulMjJWRSxm7HsyGrBAAOOLd4djsDEk1c9jsQjBwSz
	sGsBxzF1W8BitkCBNACcqXzdZS9LskvEZb3vqPXvoinuV8TZSRJ2hEgUr+so1A==
X-Gm-Gg: ASbGncuksRQGf6cUF9dohQtsLDET5UH3TuczSovO6lvP07G6ikJoxOuA62tjssIAaUP
	gRQcN9xB0GVkVBrIf7uU+i18vE0mKCgvJJQd/HQMdjT4Sd9VjhwmK0h51bt02m3ZvzVj2zM9nG+
	FMNNEP+dz5TVc8/1/QHFdzRjxx7Uzhvn4CDXkcrAaLhNuh0rifpwVyLcRQU6xSK87WBlM/75n0a
	oPx4WhBSxFvHRqpquIQn4vYLJxnb6d3393LmapvcfyXcUlwjYOSiY6BCh7wxFuE7ZCg9b9BiI9K
	d5nCN7lo+uJGYBslI3AU3DRqyFmoy/DQc/naWeDQeOT8J/VzQ7RRbg==
X-Google-Smtp-Source: AGHT+IGONo3dtPJJjK/HmC8+ldNbaKs09fGFZfiee4cJhRCwYYSr1ACZHZYbwAWDerUtnX53vOlO4Q==
X-Received: by 2002:a17:903:19e7:b0:21f:2828:dc82 with SMTP id d9443c01a7336-21f69defa27mr932095ad.2.1738972079145;
        Fri, 07 Feb 2025 15:47:59 -0800 (PST)
Received: from google.com (147.141.16.34.bc.googleusercontent.com. [34.16.141.147])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048c16180sm3560862b3a.129.2025.02.07.15.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 15:47:58 -0800 (PST)
Date: Fri, 7 Feb 2025 23:47:53 +0000
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
Subject: Re: [PATCH bpf-next v2 8/9] selftests/bpf: Add selftests for
 load-acquire and store-release instructions
Message-ID: <Z6abqWVQRAFHAUZm@google.com>
References: <cover.1738888641.git.yepeilin@google.com>
 <3ac854ac5cc62e78fadd2a7f1af9087ec3fc7a9c.1738888641.git.yepeilin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ac854ac5cc62e78fadd2a7f1af9087ec3fc7a9c.1738888641.git.yepeilin@google.com>

On Fri, Feb 07, 2025 at 02:06:29AM +0000, Peilin Ye wrote:
> --- /dev/null
> +++ b/tools/testing/selftests/bpf/progs/verifier_load_acquire.c
> @@ -0,0 +1,190 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/bpf.h>
> +#include <bpf/bpf_helpers.h>
> +#include "../../../include/linux/filter.h"
> +#include "bpf_misc.h"
> +
> +#if defined(ENABLE_ATOMICS_TESTS) && defined(__TARGET_ARCH_arm64)
> +
> +SEC("socket")
> +__description("load-acquire, 8-bit")
> +__success __success_unpriv __retval(0x12)
> +__naked void load_acquire_8(void)
> +{
> +	asm volatile (
> +	"*(u8 *)(r10 - 1) = 0x12;"
                            ~~~~
I realized that I am using STORE_imm<> instructions in load-acquire
tests, and llvm-17 -mcpu=v3 cannot build them.

Can be fixed by simply doing e.g. the following instead:

        "r1 = 0x12;"
	"*(u8 *)(r10 - 1) = r1;"

> +	".8byte %[load_acquire_insn];" // w0 = load_acquire((u8 *)(r10 - 1));
> +	"exit;"
> +	:
> +	: __imm_insn(load_acquire_insn,
> +		     BPF_ATOMIC_OP(BPF_B, BPF_LOAD_ACQ, BPF_REG_0, BPF_REG_10, -1))
> +	: __clobber_all);
> +}

Thanks,
Peilin Ye

