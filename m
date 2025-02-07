Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFFE199EB7
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 21:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738963408; cv=none; b=Mocz39pwuaUaPM42KEV5P8XZ+Y633dmuXyWI/MOlbc0+eYJg35UdOfcMvvlhCwqF3Cbcys9xNb6BkdOUGHIC892U9fTeV9iYeztQQ+6UL9PzOwGlzsshPipRpP2VkCORBZeyD6F21Okbx05N59AhM+MZXENWzuQDXIUIyQO4RRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738963408; c=relaxed/simple;
	bh=2fnqc0zpuTZ1osqRxouJu28UD5i3KWjrsuvBjj0eF4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YIkPeRLUR/gZMS1uT6V+wSd2N4FFdZjLVIlRJQtv6WZVRzQmyhrcBTkhJSFnjxsSKxaaIoR1bJh/cDXG9zBCqL5V84jmwhDhFX+Qu8ErZVq6isYcM8QfxUEB6I3zu/GoE06UCnIf0L19JRtIXw1sHTa+2pm1eq9UBlfYmZi0GQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Nzf6L4v0; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Nzf6L4v0"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21625b4f978so35785ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 13:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738963407; x=1739568207; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6XMDBGWHjm28kopyGkEygbqgRtjfyapFQf4AL4yI3g=;
        b=Nzf6L4v0lgcDAxKyiHJo7hX1cP+V4JmbomeTeFRfCVv7pPUGc/w2gXmpuwgta3izAF
         iG41HWpnvOna4yGSKJA9xj1SvTGL1MOYDa1+tqWGyuqKygzhulHgZIroFYW3LEBlqh9I
         zHFoVRVVQq/NeDA1W6IFQTrr4r4GFEC0SX2F/b0qMx0vCQ/z4YQ2hwMSXTA0m1yoU3pB
         pc3C9PnahVCZSj2t3UQb20YyGA7ic5vZH07Bqga5ByfkqfKj++kD24kRoISprBYWnqMd
         Fx3MLgWrNgNkEmrG5f88q6mZcryD+hPKBA7ovo7jb1L5QptYi6KPLJTlYgk0exvcgDlv
         hHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738963407; x=1739568207;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6XMDBGWHjm28kopyGkEygbqgRtjfyapFQf4AL4yI3g=;
        b=Mc9MljfnI3y6jIEp7CeqmZami7Kz3AhRRG9wHVn6gECSgucX5U3K8enET0A8XDAeen
         iwMzmUMKT0x++LzgZkFXLdGj7cQCPa7BcWZ8SUy3c0AUINv4ilOf8MMKV8/9ZgSGjO1D
         b0xqcuui1dDQaTXIblJttKHOmJginOijaWmnIfm9V83HB2Rm6Oi8x6QdQLsYUa24TQsP
         KfC5c3fV/Rbhvbr96s0uJNk7eOeVpTXIK0RHSVmu9aGQ9v9GyQlChR49hrR37ZRY5yFG
         M6Kz+s0DhRQTpMkRhfI5XIyWzdklLoydOgnD2PvwYw1Enorg7iGd4CzGMWeGEXd4jZF6
         cf3g==
X-Forwarded-Encrypted: i=1; AJvYcCXn9xYGNxAta7cDLsNZCLdIu0ctkRJ9Sx0L3yz99wsJwP32NIAaNlvLSH2o92/F76PTSivT695+/JmgCqU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywac1nGdMXYqujiVNPGgNiYetmpZLJlFwekCC2Mm5m/KcZk8M0j
	3eXzdMA9dfjLxF7WmRn+Y1SYKay9U8RIFiLV3FKDtlPgsRBuGcJVHNRqMOjJgw==
X-Gm-Gg: ASbGncuozNS0xDiRUYl6+UFGPg4wT/dxbp1u9b1BN82Jy5lnxMOdIiYbXX6CU6Ds0QB
	rgsvZ4elKvCHCEiUWsoRPitbQ5qEhBgQIEqysZbm6nMWgbcD0XBrTZ1DjKfT7RCGl43XpQ2RcfK
	77pA6t5fWhjd9F9fDtuoMQ/7hHd54EX36tL2SLIi9IcyjaIW64FLTQOai0yECaHGfOguEaRzlgW
	JEOJrNdeILT8gUGSIxJwYCvjWcdHABMzQ9U1sBubITxxcwy29BEB+Qa5n2/lJsIZqdFTmMkj3Om
	tELIOmb3mUR1m5fkcG6TKSf2Ag9QO/JL9VqAK9dQCSo28u37IdRBXg==
X-Google-Smtp-Source: AGHT+IHso8RJPb+vtNaFlFpohsHAMYbmR3QFQJHAAenGlRgMQKXQ54uhWmZuUpEKK6ELwZyS2450Bw==
X-Received: by 2002:a17:903:3348:b0:216:201e:1b63 with SMTP id d9443c01a7336-21f69f35c2dmr461955ad.11.1738963406326;
        Fri, 07 Feb 2025 13:23:26 -0800 (PST)
Received: from google.com (147.141.16.34.bc.googleusercontent.com. [34.16.141.147])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048bf1504sm3593423b3a.108.2025.02.07.13.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 13:23:25 -0800 (PST)
Date: Fri, 7 Feb 2025 21:23:20 +0000
From: Peilin Ye <yepeilin@google.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bpf@ietf.org,
	Xu Kuohai <xukuohai@huaweicloud.com>,
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
Subject: Re: [PATCH bpf-next v2 4/9] bpf: Introduce load-acquire and
 store-release instructions
Message-ID: <Z6Z5yLETaJ38TvqR@google.com>
References: <cover.1738888641.git.yepeilin@google.com>
 <d03d8c3305e311c6cb29924119b5eecae8370bbc.1738888641.git.yepeilin@google.com>
 <cff3dc9eaa592dbe634e336eb83f9bb47dd9705a.camel@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cff3dc9eaa592dbe634e336eb83f9bb47dd9705a.camel@linux.ibm.com>

Hi Ilya,

On Fri, Feb 07, 2025 at 12:28:43PM +0100, Ilya Leoshkevich wrote:
> Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>

Thanks!

> s390x has a strong memory model, and the regular load and store
> instructions are atomic as long as operand addresses are aligned.

I see.

> IIUC the verifier already enforces this unless BPF_F_ANY_ALIGNMENT
> is set, in which case whoever loaded the program is responsible for the
> consequences: memory accesses that happen to be unaligned would
> not trigger an exception, but they would not be atomic either.

The verifier rejects misaligned BPF_ATOMIC instructions since commit
ca36960211eb ("bpf: allow xadd only on aligned memory"), even if
BPF_F_ANY_ALIGNMENT is set - so this patch makes the verifier reject
misaligned load-acquires and store-releases, too, to keep the behaviour
consistent:

Specifically, check_atomic_load() calls check_load_mem() (and
check_atomic_store() calls check_store_reg()) with the
@strict_alignment_once argument equals true.  See also selftests
load_acquire_misaligned() and store_release_misaligned() in PATCH 8/9.

> So I can implement the new instructions as normal loads/stores after
> this series is merged.

That would be great!

Thanks,
Peilin Ye

