Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5531401C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 21:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749505810; cv=none; b=YAQAn/yDndcXkaZHka0xj30pNMbuUx3ujnVo8pJySc9JXol7pgR7ftqZYvKWUAQuNF/3VSC2gChwwxRB38NomDQ/qcgmhVc/z+lLDXoun4F8JJAb/kpWMVau7h+Jq0f9/ooX/5bTq0oBII5il6VkQKSZanZGiQWXQzpV+Jep5rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749505810; c=relaxed/simple;
	bh=IUTwAphWgJacqZzXuUcXpIQzKEy/zEhPJ1GKx2EbSas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RxvDb3KR69Vannsybu4eJ1czVdbII/Bv/IZfIQzPkH7RdG25/be7ddl5DBLkobyi2Th8QDvmxNZP1hms8fwmx3PPetiKVj+ov5BsBmNaKkEbtf7bJz+6hfUSvd5CIW60efb1BAkisSKNZT9azkZOaD5tcvWhwgqxkvqSzs35q0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DAhiRgCe; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DAhiRgCe"
Message-ID: <27e23bda-eaf9-4fb2-991c-71dbb3ee9f4c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749505804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gf07GSMj+WxyCGAFqt8qw1Fl21dEj2hZCLfaOZpV9+0=;
	b=DAhiRgCeabofWEy2yg3Wo3UFkN2Jg/rSYJJCoSHNSlgMsXnw61w8DeQN0rRI4uweOhhmXu
	Y+jd8SqXPB1E+DxtgC+470/gYEEmRkct9hIzRUh46gvRQDI3T9Phg061syixaoiIu8yVWp
	oAy0HLQIt+BZXis+RyunJ0R4jnZ1C0c=
Date: Mon, 9 Jun 2025 14:49:58 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: BPF CI update: veristat-scx job
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: bpf <bpf@vger.kernel.org>, linux-kernel@vger.kernel.org,
 Kernel Team <kernel-team@meta.com>, kernel-ci@meta.com,
 Alexei Starovoitov <ast@kernel.org>, tj@kernel.org, mkutsevol@meta.com,
 scottbpc@meta.com, jakehillion@meta.com, mykolal@meta.com
References: <c17b2e6c-3626-4d69-8784-01b13a9e2851@linux.dev>
 <CAEf4BzbWZrg1Aq1p0c2h-s2Ro=Fm2Dk1uE7frFynOd3CwZqFZA@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <CAEf4BzbWZrg1Aq1p0c2h-s2Ro=Fm2Dk1uE7frFynOd3CwZqFZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 6/9/25 2:43 PM, Andrii Nakryiko wrote:
> On Mon, Jun 9, 2025 at 2:30 PM Ihor Solodrai <ihor.solodrai@linux.dev> wrote:
>>
>> [...]
>>
>> See an example of successful job run here:
>> https://github.com/kernel-patches/bpf/actions/runs/15543439297/job/43761685117
> 
> Unsuccessful veristat runs are actually more interesting :) Do you
> have a link to some examples with veristat failures?

Here is a recent one (although it's not that interesting either):
https://github.com/kernel-patches/bpf/actions/runs/15496531493/job/43634843627

> 
>>
>> [1] https://github.com/sched-ext/scx
>> [2] https://github.com/libbpf/veristat
>>

