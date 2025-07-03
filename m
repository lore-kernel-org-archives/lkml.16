Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D981F94A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 02:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751508461; cv=none; b=aRSGb7aR6/ioia3dAklBAhAoiZsxzRywYDsb27zwmk9Ry/wUS0MJvXi84UlUE6jmGFe/T2H0UcLU5s5X+0xDxWTnCY9U7b6N0yA2dMzpCUS6BN21ySZynl451hktrdB5REZHH04UfVIRxIrTfJ6fuOvlzr18mPAly5LMDbfbVzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751508461; c=relaxed/simple;
	bh=c2CmoXDvE21WTyGgTl5E1T4oamryaJdlgHA/gaSA2m8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G+vJ1cFzE2TurjjWlfZxT1O29v81NgGkRC4CDtZozfF2Qu4xfBzfpCdhTyoqj9wQy2u+ok2b8rU3VTjuNKeKlINsRZ/IFq+Vl8YL/9PDwCXM2OKYvyucB+TbNwsByySoWtD9rkCbQfJDonN2SgIc5mWAJDjW3Mt1/S5eMmeU93Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BuSJAtPF; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BuSJAtPF"
Message-ID: <5fe7c587-bd82-4f87-aa2c-0bf7a4cdf9e8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751508455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GJsm75n2qt6vXStmPb4i4o2aGA8okooHB2sY2UXHM04=;
	b=BuSJAtPFJUJCix8FoXv6Yzufz8svEf1omaHYwM+twmBjmtp+/iT47bQYfviuLF4wULC2sK
	UGOo0dTo7h77gBD/xXJN8+xzkWdXnr/rO9ZT1uwHns1gdY/fE7oRiacZuguBjkr+WiQXGb
	3V7qUTjgHIHnBpxj++AatItFlVlMz4o=
Date: Thu, 3 Jul 2025 10:07:29 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 00/12] [PATCH 00/11] Thrash up the parser/output interface
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>
References: <20250702223524.231794-1-corbet@lwn.net>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250702223524.231794-1-corbet@lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 7/3/25 6:35 AM, Jonathan Corbet 写道:
> [I'll slow down soon, honest - real work is piling up...]
>
> The kerneldoc parsing phase gathers all of the information about the
> declarations of interest, then passes it through to the output phase as a
> dict that is an unstructured blob of information; this organization has its
> origins in the Perl version of the program.  It results in an interface
> that is difficult to reason about, dozen-parameter function calls, and
> other ills.
>
> Introduce a new class (KdocItem) to carry this information between the
> parser and the output modules, and, step by step, modify the system to use
> this class in a more structured way.  This could be taken further by
> creating a subclass of KdocItem for each declaration type (function,
> struct, ...), but that is probably more structure than we need.
>
> As a final step, add some structure for the accumulation of the output
> text.
>
> The result is (I hope) clearer code, the removal of a bunch of boilerplate,
> and no changes to the generated output.
>
> Jonathan Corbet (12):
>    docs: kdoc; Add a rudimentary class to represent output items
>    docs: kdoc: simplify the output-item passing
>    docs: kdoc: drop "sectionlist"
>    docs: kdoc: Centralize handling of the item section list
>    docs: kdoc: remove the "struct_actual" machinery
>    docs: kdoc: use self.entry.parameterlist directly in check_sections()
>    docs: kdoc: Coalesce parameter-list handling
>    docs: kdoc: Regularize the use of the declaration name
>    docs: kdoc: straighten up dump_declaration()
>    docs: kdoc: directly access the always-there KdocItem fields
>    docs: kdoc: clean up check_sections()
>    docs: kdoc: Improve the output text accumulation

Reviewed-by: Yanteng Si <siyanteng@cqsoftware.com.cn>


Thanks,

Yanteng


