Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C6122D4FA
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 17:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748541105; cv=none; b=BucVGiKfmDqFI7VAX8eFobpYBDLUyD/v4SfFhlU/z2JOqV3q0OMVsJs6fkw/MroLTdWA7vUFJJNu5YtxTBImtuPtr1iqjQ1NfihbFoSGKcc7iFMlB6yrsmG8jHuYVLdk8K1xdzmgfCWE4UC5AyMNGchO/CdHjZ6JZu3BrD+5v1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748541105; c=relaxed/simple;
	bh=izuLx6FzHgHfIZb3KvaAmO4qRt5qTAlg3QWhMMKAbM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GmovapykB25PIhtT03dVEYtFvCXLEp0S5GI4tlh6ALVD0zxEJFTv1qNs1seyuS4inHuSC0o9hjtg5LkewF4galTyWxx1PYA+Jm5IbjJeKfqZKRu56XZHftRGNS+W+BJOzycAUkZ7DRcUM8/GXXT/sqnBjkfOKn2VInWREUf/DNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cHS/Mlb9; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cHS/Mlb9"
Message-ID: <ffd23260-f214-482c-aef0-3fb49dbfa1d0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748541101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IMtmh8j2rskPP+tsvVa7KatJcF2eyuj0Y+85ZRD8nUU=;
	b=cHS/Mlb9RQ0qsnTujwHVp43bOTG4RBEudfL/SkRtZrYq1IPnm2BIkwDv9gFVQqJWoOMHTG
	Wt4ZfXt40Tzj3A1UuqgiD/q9f9U7Mf91kd38BoYdlFBcZOQVCpXkOzakiqJnV7Mxeg4Ipi
	CoibJVDNCXB2UZlVw06iunVxm6Rp/O8=
Date: Fri, 30 May 2025 01:50:48 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next 3/3] bpftool: Display cookie for raw_tp link
 probe
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Quentin Monnet <qmo@kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, bpf <bpf@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <20250529165759.2536245-1-chen.dylane@linux.dev>
 <20250529165759.2536245-3-chen.dylane@linux.dev>
 <CAADnVQJVFffjzgZ0o_gAGJHwHHXn+UjawhAwknaTfgdQpjY3xA@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Tao Chen <chen.dylane@linux.dev>
In-Reply-To: <CAADnVQJVFffjzgZ0o_gAGJHwHHXn+UjawhAwknaTfgdQpjY3xA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

在 2025/5/30 01:11, Alexei Starovoitov 写道:
> On Thu, May 29, 2025 at 10:01 AM Tao Chen <chen.dylane@linux.dev> wrote:
>>
>> Display cookie for raw_tp link probe, in plain mode:
>>
>>   #bpftool link
>>
>> 22: raw_tracepoint  prog 14
>>          tp 'sys_enter'  cookie 23925373020405760
>>          pids test_progs(176)
> 
> Curious number.
> What 0x55000000000000 was used for ?

Yes, no practical in fact, i just ran the selftest case in bpf_cookie.c.
raw_tp_opts.cookie = cookie = 0x55000000000000L;

-- 
Best Regards
Tao Chen
