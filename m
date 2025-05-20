Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4A91C8603;
	Tue, 20 May 2025 16:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747760042; cv=none; b=KjSKRVgPvXOuQgKH7BPBgaRii1wyx2R3z0P945W2DFzngCFZuPYnAMFdMqCE1HSBFc4qaoqbzN/EJscijSG2HSXjn9LzzSqZnE86DOjFMgGcO6OUEQwxZnegbwGCCOHvV4KhVyQvGRdaHQH/ePdCpf6F5tgmaFuXQ6XBX2tK438=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747760042; c=relaxed/simple;
	bh=VkByo1HPsP/hbipUyhngrImmGy9MW/0PJEmfdD9x+9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Khu5QbdXervSFlAHNiiQZWUHr2gMdqX2FNGAZzGM31b/vot47jxeDcOdjO62aWcGJNnx05Wh01mKSySclZNJyXHm25hl1zXzzbZ6knnGH562GVxGLKPs7vIrgK+ejWDy3Eu+cVEhizKUIl1v9Ti/IoJpQA+cW9Aph/Tkxst2MyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=rf3YKHrk; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rf3YKHrk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=d2HxAl8hZL6hszoEsQi3MPlumgb/D4h+6a194lkmrEc=; b=rf3YKHrkh6HogdpAQ8SyHjulZM
	MFPgLUxkrlcfcE+my5Y3YHZrvCwqnWLB4Z5cfsVlmTYdig64mGOY3gKdAhhkJV6oypdAen3A45dKH
	+MTGvLePh4g8mLOymPjOWbsp1UjX6e31WQsCt7PVk9NdUU3fjPdeMPwWX1zz7OdUeRjIbIsGPliIJ
	8Y2QhL0WXHuXDY0nXNE+CF/Wuhwx4Er10B6MSG5WUNplkVcsc7OmE2vYHVqjBCOl271GC0Rbh4fE7
	4mmbfNGuGnyEp9kN2ptBSYbxXEvxp+fvkg9OlJldCxy8oiCl+v1/h3ySvx+4V9/kbgC315jNuOTTn
	62NrXp8A==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uHQE0-00000000nQP-3hhP;
	Tue, 20 May 2025 16:53:57 +0000
Message-ID: <05c67fab-bf89-478f-9298-a7f827b0d5e9@infradead.org>
Date: Tue, 20 May 2025 09:53:54 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] docs: document linked lists
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250520-linked-list-docs-v1-0-db74f7449785@collabora.com>
 <20250520-linked-list-docs-v1-2-db74f7449785@collabora.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250520-linked-list-docs-v1-2-db74f7449785@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/20/25 8:57 AM, Nicolas Frattaroli wrote:
> The kernel contains various generic data structures that should ideally
> not be reinvented. However, it often fails to document the usage of
> these in the in-tree kernel documentation beyond just a listing of
> header symbols in the very lengthy kernel-api docs page. This is fine
> for things that have simple invocations, but occasionally things devolve
> into several layers of concatenating macros, which are subpar for humans
> to parse.
> 
> Begin making a small impact by adding some rudimentary example-driven
> documentation for the linked list type. It's far from exhaustive, as
> many list modification functions are currently not mentioned. However,
> it covers the basics and directs readers towards further documentation
> should they be interested in concurrency.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Nice. Thanks.


Tested-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>



> ---
>  Documentation/core-api/index.rst |   1 +
>  Documentation/core-api/list.rst  | 390 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 391 insertions(+)

-- 
~Randy
