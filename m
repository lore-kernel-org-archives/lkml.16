Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D181C701C
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747063741; cv=none; b=KdOOkC0iiR1LSas0MlBj4IDxpSRCvpl4JHLogNHiFBDAiAL26wBeB3LnI82IHcT+dd8IN/G//88WyRmmyLbaeHfcfgppMWiEUiJbEDvZ5TR2HxJqjBhgNuxyIgmJpWd0laRDZEh3WVpFgY02fW0xMaeIcZeuVuPo0qDIt+QYOQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747063741; c=relaxed/simple;
	bh=L1jpEewkbGaRiVUcKVKIpxl0c8ZyhtK5V7dBUiGojG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HQ1aiYIFCxyzo2G7MSUrWelE/bCml8KIrXZ9NDA9QCODllX3V+jx0M9M9mt4R7aJq1e/W62PrwiRE5Wh6TNuHxjp5HrXw8CtsOhaZQfL7gjBYjMAos7EEA49oXW8WV3pJTLHJ4tYXrQOL7/5iGjNep80xBj1cOQ8+CsgSi994OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=h5ChcKGP; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="h5ChcKGP"
Message-ID: <f63c2be5-50e4-4c47-8a56-9a570977a6cf@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747063736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fmKh3ipd0vUSmnVYWXwIb2mfVvhu187W8+89kC9DAXw=;
	b=h5ChcKGPvwZT+b1kpFunRGFcD1RxyD2hEYG9wCT3bDahCL3/Hcnw9yv51tW1oSMN1/OGnJ
	EGF6My98TvTWYO8ImAJevYTIYrMKrLrPiCMj9raFdhlxZXlFk56nBF130ck1n2IL0okONY
	6SShFmTnaG18mFAHPHgYTZ6yjWkUUuY=
Date: Mon, 12 May 2025 11:28:36 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: cacheinfo: Report cache sets, ways, and line size
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, Radu Rendec <rrendec@redhat.com>,
 Will Deacon <will@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
References: <20250509233735.641419-1-sean.anderson@linux.dev>
 <20250510-fresh-magenta-owl-c36fb7@sudeepholla>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250510-fresh-magenta-owl-c36fb7@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/10/25 03:04, Sudeep Holla wrote:
> On Fri, May 09, 2025 at 07:37:35PM -0400, Sean Anderson wrote:
>> Cache geometry is exposed through the Cache Size ID register. There is
>> one register for each cache, and they are selected through the Cache
>> Size Selection register. If FEAT_CCIDX is implemented, the layout of
>> CCSIDR changes to allow a larger number of sets and ways.
>> 
> 
> Please refer
> Commit a8d4636f96ad ("arm64: cacheinfo: Remove CCSIDR-based cache information probing")
> 

| The CCSIDR_EL1.{NumSets,Associativity,LineSize} fields are only for use
| in conjunction with set/way cache maintenance and are not guaranteed to
| represent the actual microarchitectural features of a design.
| 
| The architecture explicitly states:
| 
| | You cannot make any inference about the actual sizes of caches based
| | on these parameters.

However, on many cores (A53, A72, and surely others that I haven't
checked) these *do* expose the actual microarchitectural features of the
design. Maybe a whitelist would be suitable.

| Furthermore, CCSIDR_EL1.{WT,WB,RA,WA} have been removed retrospectively
| from ARMv8 and are now considered to be UNKNOWN.
| 
| Since the kernel doesn't make use of set/way cache maintenance and it is
| not possible for userspace to execute these instructions, we have no
| need for the CCSIDR information in the kernel.

Actually, these parameters are directly visible (and useful) to
userspace in the form of the cache size. Rather than make userspace
perform benchmarks, we can expose this information in a standard way.
There is of course [id]cache-size, but these properties are absent more
often than not:

$ git grep arm,cortex- 'arch/arm64/**.dtsi' | wc -l
1248
$ git grep d-cache-size 'arch/arm64/**.dtsi' | wc -l
320

--Sean
