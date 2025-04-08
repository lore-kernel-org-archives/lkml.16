Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B637614F90
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 17:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744134372; cv=none; b=KUawy85QQ8yQ+pnLNya0PorJrIcr4c4DvfgajMS7826pcdUD0ObNpvitG6kiu55cPY3EX43oMvccxmbVEDJjmgGLa2B38ut0TFmyb6z0MKvAGI2FpFoCOil2GePmtv1TKTmEXa8ibFji4jDclp2fP2tCektJ3mnz6KqJlhxlrxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744134372; c=relaxed/simple;
	bh=oR6aUQl+nSafZvY0ZHb62+mRj2uN33CxwfAA/zVoYdE=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=n+0YGoYk+Ors6+7+aqJZ/kF8kZ4dCDxIBcGd9D+0FI+LjGsOnxdTJeFJlmdUJniHnCMIdNeYfKUuy2RarN2fCgIFCpqkxMHv5/jNbv6TYdadxAjqdJu3qVmoG8LA68VFcqgDX9/E/jTOG1W2ORBwYQlnciWjtukkg5fjajZOHnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pfKcb4GP; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pfKcb4GP"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744134368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8KkZ5puVFvHum4NZ3BR0xi8SXzKqPvyQcsjyZbJS6BA=;
	b=pfKcb4GPY//7CR7W8L12OHNSryo53vQrlh0Hdsd8HTl7yfM3xVC+DkWVIOQtMczMCbJ7yU
	ITwd4U0+ycDF/eaV1PKu3PgoPvDS0Ydnjp8us8uzy5ad04bXyW1xJNVum+aYdmVNJ7abry
	ho//FnpxHgOl1yicdDGePaYw03TKrDs=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.2\))
Subject: Re: [RESEND PATCH] clk: socfpga: clk-pll: Optimize local variables
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <d7df3b86-c3ff-48af-ad72-428e105976b9@kernel.org>
Date: Tue, 8 Apr 2025 19:45:55 +0200
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <0BD7D71D-6F6B-4864-BEA7-E13563908D62@linux.dev>
References: <20250219104224.1265-2-thorsten.blum@linux.dev>
 <d7df3b86-c3ff-48af-ad72-428e105976b9@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
X-Migadu-Flow: FLOW_OUT

Hi Dinh,

On 19. Feb 2025, at 13:42, Dinh Nguyen wrote:
> On 2/19/25 04:42, Thorsten Blum wrote:
>> Since readl() returns a u32, the local variables reg and bypass can =
also
>> have the data type u32. Furthermore, divf and divq are derived from =
reg
>> and can also be a u32.
>> Since do_div() casts the divisor to u32 anyway, changing the data =
type
>> of divq to u32 removes the following Coccinelle/coccicheck warning
>> reported by do_div.cocci:
>>  WARNING: do_div() does a 64-by-32 division, please consider using =
div64_ul instead
>> Compile-tested only.
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
>> ---
>> drivers/clk/socfpga/clk-pll.c | 4 ++--
>=20
> Applied!

Did this patch and [*] get lost somehow?

They aren't in -next and also didn't make it into the last merge window.

Thanks,
Thorsten

[*] =
https://lore.kernel.org/lkml/20250219104435.1525-2-thorsten.blum@linux.dev=
/

