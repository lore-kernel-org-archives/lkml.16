Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF921202960
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745324545; cv=none; b=tu0C8oJBJgzIjLp+uAajwC3r7TPQr9x12XYuZLNCP+1Q7GsBoO6S7v1dT5niYdKbTkkLPj52KBK4b7r4u6CJOf4JMYc0zpEgtNDYgVguD4WZBfdzbv2qdOanYB/28TDwtXf2+cCk/ZsRmt00vLVMM9qsO3zZnTALZGb0USw69y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745324545; c=relaxed/simple;
	bh=L52X8TU4OtWh1NIiSvcGvGuWtZUgiPAz2gzkuelHE4k=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=W/Se3AMhVtQV2+lMRyA22xrRgscBN6MLlOhzRjJ/PUU0ncY1L+sps+9lU+zK5/a+MxkHXmwPhkvuq/TcQ9QzQzllRGayl+xJwrd72/Mjzmuwgn1Ihq23aAO2S9AKz8FQb4fbQzPHKYvxQCiAFX47+FB79/komvWBC046fpNLN7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pXWhJHDs; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pXWhJHDs"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745324539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L52X8TU4OtWh1NIiSvcGvGuWtZUgiPAz2gzkuelHE4k=;
	b=pXWhJHDs3Ve2K7Gt5litUJAQrXur2iVHIHayRKXCxmbsxA+68sWgbWY2jNSLz4iRonIH+9
	CpOu6jJjA8RQhjXQtZ6ucP/hzTYRusWyR/pHRNK/wRmOjGQh+/ci10w9ksrEWbYPkxjhiI
	DIlrmvW85lTrZ9enzm+w9VnKSCAHqAc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.2\))
Subject: Re: [RESEND PATCH] clk: socfpga: clk-pll: Optimize local variables
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <0BD7D71D-6F6B-4864-BEA7-E13563908D62@linux.dev>
Date: Tue, 22 Apr 2025 14:22:04 +0200
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <FC8B34B6-642F-4228-90FB-D8B3148C03D3@linux.dev>
References: <20250219104224.1265-2-thorsten.blum@linux.dev>
 <d7df3b86-c3ff-48af-ad72-428e105976b9@kernel.org>
 <0BD7D71D-6F6B-4864-BEA7-E13563908D62@linux.dev>
To: Dinh Nguyen <dinguyen@kernel.org>
X-Migadu-Flow: FLOW_OUT

On 8. Apr 2025, at 19:45, Thorsten Blum wrote:
> On 19. Feb 2025, at 13:42, Dinh Nguyen wrote:
>> On 2/19/25 04:42, Thorsten Blum wrote:
>>> Since readl() returns a u32, the local variables reg and bypass can =
also
>>> have the data type u32. Furthermore, divf and divq are derived from =
reg
>>> and can also be a u32.
>>> Since do_div() casts the divisor to u32 anyway, changing the data =
type
>>> of divq to u32 removes the following Coccinelle/coccicheck warning
>>> reported by do_div.cocci:
>>> WARNING: do_div() does a 64-by-32 division, please consider using =
div64_ul instead
>>> Compile-tested only.
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
>>> ---
>>> drivers/clk/socfpga/clk-pll.c | 4 ++--
>>=20
>> Applied!
>=20
> Did this patch and [*] get lost somehow?
>=20
> They aren't in -next and also didn't make it into the last merge =
window.

Does anybody else know what happened or where I could find them?

Thanks,
Thorsten

> [*] =
https://lore.kernel.org/lkml/20250219104435.1525-2-thorsten.blum@linux.dev=
/

