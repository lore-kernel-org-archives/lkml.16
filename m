Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6FF2222BB
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 11:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744974371; cv=none; b=ZjcOM71FbUJ/4KrFsWBKpZVha2u9UQQ5WbizhERVYTsjNaqqelYa6GR6qCiUozG6DVV2GDUOpzjvVRB++eKy0ZUQpBFGfDvsPhRKuV8vgA7/2lGrovMsyRM3ayxMIhg3hyIyOiT/QxOYv9UaWq3cJmMr+yRbLtt3wl9SEBnlvZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744974371; c=relaxed/simple;
	bh=xC7KkNN09rdJTafofxY3w7v2BYcAQc3Ap1715Ha0gRg=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=duVULQdrlQ32r05uEHQmoMxwjAMmwZeV4XRgyIVlCQZpbeqLCCfPN9fS36bfWJd12NwJmyrNyod/aapKj5o2UYopXvhGqOPqJ8tgcsHby1W+FFwZh1EDHnJtqqgvEixDHmMLRmk5QyijLMUXHZGrPiuTZR/lNZXHR5m7UrltFac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iLge4Wfw; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iLge4Wfw"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744974364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YALxZFeBfGgL+aBYJe09UesWL9Hu692Wgsun8CNUXyU=;
	b=iLge4WfwkrXbm7msowUQ8/y4/Dqh7Tcq8Wl9T2XrRb443/1fYehFvYEdjfZdegQjcjmE/H
	CfOFe10gOOewp9YXvVumf3um0QSjgHPbSpX3mYkxftr1D6duemaSi6SjrJvUaM/54q1gpA
	5pO6mkH+k1nUvaqfV8TrcKH/3a7fMhU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.2\))
Subject: Re: [PATCH v2] MIPS: Fix MAX_REG_OFFSET and remove zero-length struct
 member
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <alpine.DEB.2.21.2504181108170.18253@angie.orcam.me.uk>
Date: Fri, 18 Apr 2025 13:05:49 +0200
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Oleg Nesterov <oleg@redhat.com>,
 linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <EC98BAE8-8269-4169-B3A2-5F426E77C223@linux.dev>
References: <20250417174712.69292-2-thorsten.blum@linux.dev>
 <aAIF_kEFlOOVNDaE@alpha.franken.de>
 <DAD22E95-6D33-43D5-B5E5-3A7B45A63944@linux.dev>
 <alpine.DEB.2.21.2504181108170.18253@angie.orcam.me.uk>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
X-Migadu-Flow: FLOW_OUT

On 18. Apr 2025, at 12:36, Maciej W. Rozycki wrote:
> On Fri, 18 Apr 2025, Thorsten Blum wrote:
>>>> Remove the unnecessary zero-length struct member '__last' and fix
>>>> MAX_REG_OFFSET to point to the last register in 'pt_regs'.
>>>> 
>>>> Fixes: 40e084a506eba ("MIPS: Add uprobes support.")
>>> 
>>> what does it fix ?
>> 
>> The value of MAX_REG_OFFSET and thus how regs_get_register() behaves.
>> 
>> From my understanding, MAX_REG_OFFSET points to the marker '__last[0]'
>> instead of the actual last register in 'pt_regs', which could allow
>> regs_get_register() to return an invalid offset.
> 
> Or actually it permits an out-of-range access beyond the end of `struct 
> pt_regs': if you call `regs_get_register(pt_regs, MAX_REG_OFFSET)', it'll 
> read memory beyond `pt_regs' rather than returning 0 right away.  It may 
> not happen in reality (I haven't checked), but it's a QoI issue we should 
> address IMO.  Other platforms that I've checked (riscv, x86) get it right.
> 
> Though the fix is incorrect for CPU_CAVIUM_OCTEON, because it doesn't 
> allow one to access the second half of the last register, and I find it 
> exceedingly complex anyway.  Just:
> 
> #define MAX_REG_OFFSET \
> (offsetof(struct pt_regs, __last) - sizeof(unsigned long))
> 
> will do (as `regs_get_register' operates on `unsigned long' quantities).

Does regs_get_register() even work for CPU_CAVIUM_OCTEON when accessing
the last two registers because they're both ULL, not UL? (independent of
my patch)

Thorsten

