Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0602D78F2E;
	Sat, 28 Jun 2025 19:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751137221; cv=none; b=KBq4PMdXP2MkvG/x6Jir7LOMzXd+DC9ceoWzrGw1Vy7eQMWdeAWE+szGFDxlotnCNSUf6lcgKqcXfWJrNK+KamMMZ62HvIOUuL7eQfNOQqyEVbElX3KaKRSIGDT7p5HbwPUgKpgTjqEVgB9GcHSxPccIjYHO10menU9Cg/cMgEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751137221; c=relaxed/simple;
	bh=P/dy6KpDNrmeeSK77sboSsHuKu3yl7KORSdeFF3VZJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SY7SCVIEC5MGfRWBuC1NLq1fXr28sJ1p5cVy248AdIMtGSokd7ns/VY7H+YRUHDFJ/m/v6VIGp1wTu/En2zYk7JIlit/S3gHbCEILJsSYwWBc3oaSU8o+1fkjb4XyKSt/OaXEtiQU8J30J82e196Wpgqkwq35pyz1XXLNL5wfSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MFtL5p/V; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MFtL5p/V"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=/wsm0WMBHfTVvC+lyHbNl2ZkewM8q9E14a8ndv6TdvU=; b=MFtL5p/VF0SpyScstjg2FHOJWO
	T+EuvmCJvOOsRAurr9/vjE8rtrmZCPWyO45K4qUGuPw5pOS8gJFE7W5/S+cAgriOCuju2U7HI7zbw
	NilyMLR4fOGaQw08TXXDFyMAfFowM/fy66TzSzLTCqOXTGy0cpx4bulPTvq95lHMAVu2+yhUy/cPB
	umhnFsjECQvjamduAGLjro+/vt6bF1IzXUcof9uD6lgGXf1sxtCnCadHyofOmzzsPU48qL8bxlmaf
	pD/CsNT2g69eonCUzXV2c5acnoOFb9PyyKtis/Qn/tWOGxV+E952Uj9HP8fygwZwkQXxGE7K60Uyd
	NWfe0kwQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVamc-0000000H84G-343D;
	Sat, 28 Jun 2025 19:00:14 +0000
Message-ID: <c4872c12-109a-4df8-b2bb-73a942bca202@infradead.org>
Date: Sat, 28 Jun 2025 12:00:11 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] docs: dma-api: clean up documentation of
 dma_map_sg()
To: Petr Tesarik <ptesarik@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Robin Murphy <robin.murphy@arm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Keith Busch
 <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>
References: <20250627101015.1600042-1-ptesarik@suse.com>
 <20250627101015.1600042-9-ptesarik@suse.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250627101015.1600042-9-ptesarik@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/27/25 3:10 AM, Petr Tesarik wrote:
> Describe in one sentence what the function does.
> 
> Do not repeat example situations when the returned number is lower than
> the number of segments on input.
> 
> Signed-off-by: Petr Tesarik <ptesarik@suse.com>
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/core-api/dma-api.rst | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)

-- 
~Randy
