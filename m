Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89C9208AD
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747938004; cv=none; b=B7f5v31CgbNT2IQcE2KywC1rwKJcXNcRuWaXLfCVovcBfD6zhkTNcNVdFhF18iDscsUub3OZ5XB7dL7PnghRl4RLtrPpUz/IFSO772GA+nFnxiwRvjdLkXCtmI3ZWWziWBWyPvMBJne/zsMIvaG8V/GNVOitn/sZHfztEi1+7rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747938004; c=relaxed/simple;
	bh=1X1PfimKgGxSYNptMRYntUWCk2oprV8ZT6Liq06yiX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EKXQJ+BCpykOkZDUSmTLPmwhxhGX7YuSAfEGjyoYtIXrIw9tddrrBPZ+OXY02aLVFBbIECg86iCf6k1u0VhrRjC2slxLkGjPHd19wJZmtpNIaHAQjq0J0sPQcTThfnVN57NfVR0bIv+JRw0u9rFHqmLpajfJxjDd8rafINCQ860=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1MwTBHSm; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1MwTBHSm"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-52eff44a661so862341e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747938002; x=1748542802; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1X1PfimKgGxSYNptMRYntUWCk2oprV8ZT6Liq06yiX0=;
        b=1MwTBHSmIKT/HtCiz8l1tT03S5LkGkTlYbdLVX47ZodJMcNC0ime3oonsoXYjYKf8n
         zY4aZWfHtV3vsS5Fqhe9f9XwNDnSI82p1s9SdLkcTVpRV9hCck4ijQhUhl/35uZVbK9N
         oWmYDsKOzYUd0Yj3Q/M2ckNmrk0Y8rAAY3tMgoyHyvVae4/38NY2XbvNeyo99chdr7Ej
         E/jOmT+eGTCwF5tSIZaiZIcOq33/yMbQjJJtbWE8gI+b3dpwxrT+ADu4igc4M8RbpoBJ
         N+JRwLR8Cih44BUB0kHHJYHo+AQbf8uNMkX5HCymR/WmAzdbJ+f3n3r7AOUAHpuzgAxX
         G3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747938002; x=1748542802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1X1PfimKgGxSYNptMRYntUWCk2oprV8ZT6Liq06yiX0=;
        b=VRxY5UaC9+k9u2XOvvZmINDX5n+2IDDhQ8u7MGgn+3OFa8yX5Gm3BnOnAOc+a3o40E
         Uv7RUSCmWuDhjjC6GVvCXhLzuhtCO1EA/bYxYxjQ3iY8eHOpczBxJ9OywQ1X5nzkcyEW
         XN75HFDg+GVh0Pkm4cr97ZVWz4Ch9o2pijpnVFXB/f9716yvr1gHGwK6ClS4YPHGz/rQ
         f9wFtSCacV/snWWg2Zt/IRr0KTUyzgta+fhz93aysUeUuRiZNaZaQqHjsN682+xVrS1C
         R9LJ5r5T8+95IodspXyrQAzUE1aD//PwF5EZQevgQQTDdmKD1r/7GZAa91TSLbYzAlri
         1C0w==
X-Forwarded-Encrypted: i=1; AJvYcCVkeSzPWVaq5TcHh56p5th2SM5fsTk8LKqkVfEQ8ew+2y/FwtX2VAgwQzYidFCMP/U+SJguyQ+r2rysnt8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7eFusRSVcInCc1+s+T9zwx1IKZe0AyZRYD8Rh75003ccuV9AZ
	PfdjL7Qnt55wOFceQCcCj4zARfz8T7qOxDws3OV5D/0S4KGRzX/sW+VUyAq7Wuc06PR9dMu7sQP
	BGtb5NrlBC+fCa+1QWcO0r2O1TBve3fnq7qosctx+
X-Gm-Gg: ASbGnctSLqzfPujoWpLySU2qw1pROqHpqX095t9iXxlPDK4fjM5ObkvWeidC+vQ1Rde
	17nEh6Qx9kG/LjjzFMg5ORfhd03w5yz1KgcQpEN10cUoS1T4fPSRkYGbuuS/0PGMxD3jqWax9/V
	H0AbHnsUHTuySHK9tDgJwGP2n54CRuTsfMerGBrzlFPaNGLUpnoCdQcv7h1MymcrdROtqL8BHPB
	FFp
X-Google-Smtp-Source: AGHT+IEfN+I/C5Ybrmxr1qWevAFLAFonO1e5hjzbuNX4xDEjbOi3PdSdxPRofPaqo9kuaUkHrj/UIsRxp8SKA7jZji0=
X-Received: by 2002:a05:6122:d19:b0:529:2644:8c with SMTP id
 71dfb90a1353d-52dbcdfccb7mr20392929e0c.8.1747938001548; Thu, 22 May 2025
 11:20:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521222725.3895192-1-blakejones@google.com>
 <20250521222725.3895192-2-blakejones@google.com> <aC9iF4_eASPkPxXd@x1>
In-Reply-To: <aC9iF4_eASPkPxXd@x1>
From: Blake Jones <blakejones@google.com>
Date: Thu, 22 May 2025 14:19:49 -0400
X-Gm-Features: AX0GCFvCecoYWZVTumub_yv2z4rw1y06pQ1j8hvSuiCvYMyPM1bOhtN7H-YE9cM
Message-ID: <CAP_z_Cg_vH1+BAm87U4gYQ0hDRGtHkkYb2DHtTRSd_QNvg3ZLQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] perf: add support for printing BTF character arrays
 as strings
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Chun-Tse Shao <ctshao@google.com>, Zhongqiu Han <quic_zhonhan@quicinc.com>, 
	James Clark <james.clark@linaro.org>, Charlie Jenkins <charlie@rivosinc.com>, 
	Andi Kleen <ak@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, Leo Yan <leo.yan@arm.com>, 
	Yujie Liu <yujie.liu@intel.com>, Graham Woodward <graham.woodward@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Ben Gainey <ben.gainey@arm.com>, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnaldo,

On Thu, May 22, 2025 at 1:42=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
> I'll test this but unsure if this part should go thru the perf tool
> tree, perhaps should go, together with some test case, via the libbpf
> tree?

Thanks for taking a look at this. I'd appreciate your guidance here - I
sent it here because the other two patches in my patch set depend on this
one.

Blake
