Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5108C261594
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 19:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739301001; cv=none; b=F+dVO5UN6fDKnke07t+UFNLgagavYlpT1gr0pNsmmps++lVLS9WEYyTVk4yWfzRbunhaNa9mHSpPqoysLKVGjWxwmItid2nDuqgcN5Kh3g0nGJ6Raifl4GYAFUbqWqV6T1eqEF3OoYyAx497nll/ZQ8F+CIql1h++RinA4cPmKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739301001; c=relaxed/simple;
	bh=erd1zJ+R61wo92ELNXvB28d/bNlj/qYeYQ+CjpxPXjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hHB7xC8zahD+23V3+A+8gBmbBGRoZPehwXazqdJMsp+GqjBFI3z3S3nmM905st+NGq7rv4W8VA3PBSsBtEtCG9fDVt2aOB8TbbQoquaTRLcow+DYNGiUhJLwIg8E8HwknhQhFVvCKlmSRdbPYfC1tBzZHCp4+MT3U+2hhR08F6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QT3kKEyh; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QT3kKEyh"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21f8c280472so17245ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739300998; x=1739905798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zsRY8DxU5oOqkirUpQpSEfLhJyGlqAVxdTEVQkM3WMs=;
        b=QT3kKEyhDou+T1BPQcCXL0UTuC0/xSUaFKjA7gaKXvEX9zYhY7jroy93AXMV5xcWMD
         MymXYsfePsBXd0xsDxKiMW5lvXzW4KbXvL5e3QvgRQNHFe6sd3qFN40TYcmFi2GU62J5
         aGT9X3GqHC0sVFFPFdyc36lIFvoLQ39TRjA9tP/35kYRHXpz/8FdgwI+WwplCUI9cl+q
         NZ0LkvlFOMe7uiv0j3KQRv3ScWpUq7tp4WsNhKxnceQZqc0IPqUds2zKz/X+Ef5s1rz0
         XF/64pRa+qULVUfEB5d2RGd4b+sFnxcnnL3Hd1pxX4tnDeHbgOZQInL+53J2jbVTiTGE
         U/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739300998; x=1739905798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsRY8DxU5oOqkirUpQpSEfLhJyGlqAVxdTEVQkM3WMs=;
        b=jfu6orPE0/2Eem2cgbjR1va5e1++sbYG7CICYeh7CljCCcb9NWox5KOaEzq6XRt5cG
         96U+NnvSQbhT8b32MhNBHasBt7NwHpZmPIrE7mlO4HBqitYZKv8mPmt/EleJqNQ5jz52
         76R52NwaidA51tMWV0UG9q7M5ecz5I3QCw3InJurowrG/OxCD0a6ENDUmn4OaG4khFjq
         Wqgvz6Fq4vc1nrMYMMw6lNXYtwGFyk2hKqcDVlTBdTNIdhCsB5MC2oEq4g2oOpbdN68N
         0emao1zPCPRDA8nsQZtxiKmSHIkq7o5TZb0vf/+d0Fgoxw5PEgdsAdx0gKJuPgSI2DKr
         HWUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYo94ZL54iv+ZlGWywH2nuNHzaG+x0oS1SiHdllO4Ebh5pHyLfFUBOy7F1fSRdFEFy7+p4RYdYAOXCs7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLVp+aSpkNFBPWucVv2tR38he6P1y4zOgE/n3QgWADXmF5MfIR
	FMFRzjmHC/9y9hpw09NRCFX+Ma/WvgU1ZCnqX8KflH/Q2aaecinCzCdFy9AkyA==
X-Gm-Gg: ASbGncu84Ys4a9gX0JTqwXzC8Ap+4u21Om0OkTzQY8I5EQsK3i0trX6NHdagmnw2aYM
	CZdlKjZxgAlqgWPksSnPdmdPgiOWdmtEmEFizUQPD9dZfcLjopHvd6di9mmi29avQxqccyvK8X8
	wdzoBbzQnXDGJRzyX9iPdPv3gXrsGXPc4tlv9zcmTLk9rfY0xISU8KCG5DoR/qmd0cxUacovQM0
	t5ly3OIppUeKmGOS+dusd6cOX5QcpJXInhZL731kiVZhxXCbSJe3gAfzXZ/Ip0LqgDvI3fweDYW
	PN6K8YxQ2Ue49Ncgf1hWV9MK0DfjB3IivZKi0Zw4n3j5Xnv/bxi0tw==
X-Google-Smtp-Source: AGHT+IHrWBPLYi6iTGNBgCMLpCFlEfO8bMl8chkgcZ2hAPZ3SiDkxvI4vmDKroixqqmvdANTGecJ4w==
X-Received: by 2002:a17:903:13ce:b0:215:9ab0:402 with SMTP id d9443c01a7336-220bca6d869mr92705ad.18.1739300998169;
        Tue, 11 Feb 2025 11:09:58 -0800 (PST)
Received: from google.com (147.141.16.34.bc.googleusercontent.com. [34.16.141.147])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad548cc25d0sm5126832a12.5.2025.02.11.11.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 11:09:57 -0800 (PST)
Date: Tue, 11 Feb 2025 19:09:52 +0000
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
Message-ID: <Z6ugQ1bd0opoGRYg@google.com>
References: <cover.1738888641.git.yepeilin@google.com>
 <3ac854ac5cc62e78fadd2a7f1af9087ec3fc7a9c.1738888641.git.yepeilin@google.com>
 <6976077bc2d417169a437bc582a72defd1dec3d4.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6976077bc2d417169a437bc582a72defd1dec3d4.camel@gmail.com>

On Mon, Feb 10, 2025 at 04:08:44PM -0800, Eduard Zingerman wrote:
> > +++ b/tools/testing/selftests/bpf/progs/verifier_load_acquire.c
> > @@ -0,0 +1,190 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/bpf.h>
> > +#include <bpf/bpf_helpers.h>
> > +#include "../../../include/linux/filter.h"
> > +#include "bpf_misc.h"
> > +
> > +#if defined(ENABLE_ATOMICS_TESTS) && defined(__TARGET_ARCH_arm64)
> 
> [...]
> 
> > +#else
> > +
> > +SEC("socket")
> > +__description("load-acquire is not supported by compiler or jit, use a dummy test")
> > +__success
> > +int dummy_test(void)
> > +{
> > +	return 0;
> > +}
> 
> Nit: why is dummy_test() necessary?

It's just to make it clear when these tests are (effectively) skipped.
Otherwise, e.g. -cpuv4 runner with LLVM-18 on x86-64 would give:

  #518     verifier_load_acquire:OK

With dummy_test(), we would see:

(FWIW, for v3 I'm planning to change __description() to the following,
since new tests no longer depend on __BPF_FEATURE_LOAD_ACQ_STORE_REL.)

  #518/1   verifier_load_acquire/Clang version < 18, or JIT does not support load-acquire; use a dummy test:OK
  #518     verifier_load_acquire:OK

Commit 147c8f4470ee ("selftests/bpf: Add unit tests for new
sign-extension load insns") did similar thing in verifier_ldsx.c.

> > +
> > +#endif
> > +
> > +char _license[] SEC("license") = "GPL";
> 
> [...]

Thanks,
Peilin Ye

