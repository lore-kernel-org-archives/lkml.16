Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC02C2A1D8
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 05:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746682041; cv=none; b=tNEywKWn8+TjsNNtschMb9ZElXI/oy+z1K3GprhhFK5Oimkct5jAEPHRGHpTZBh033KgXfmgpQ97evj//vKzSlM3sp/m1lzjaK5KJyWo5WXqy4fiTRHOYz07G95oQyUNl17gwMVj9WI9t9fpKolvhEVv+0bFRr+38HpD1QXMErY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746682041; c=relaxed/simple;
	bh=4eVHONngUeipKynYHcMZWrxwJWyW5f8MX0Jake1gWQM=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=WVGPqNuXoq2K6FKHQMR7dtvKx/amFR6N0tSDm2scLuu7wWnKYeSVna2rNuesQrDsfPuqui5d2YfMBbSUG9nqrC1pOz5cret4TbQN9J7eN9m1LqlbFew6Yx5Ugdr5rpS5KMsBUHHZ9OMQv9WAU3JSekiDvdo4zyftpFxLOtXjDbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-philosophy.net; spf=pass smtp.mailfrom=bit-philosophy.net; dkim=pass (2048-bit key) header.d=bit-philosophy.net header.i=@bit-philosophy.net header.b=yIm8zVhO; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-philosophy.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bit-philosophy.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bit-philosophy.net header.i=@bit-philosophy.net header.b="yIm8zVhO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=bit-philosophy.net; s=ds202411; h=Content-Transfer-Encoding:Content-Type:
	Subject:From:To:MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Xdd1gqiINkNUZ3bC1znyTd57Qf1MfMSQyx24/2C5B5s=; b=yIm8zVhOD9zJ+MULWReQ+jiBkM
	Dp6FXYne00CZpUR1YWE7RVJubH+ITfq3jXNfbLHXl5SuUW7CEUgJFlHLcEqGgIxffWeDtaAA7djQA
	67g5GDS8i4cNE6EmbVrVZOdT/SPuPG+pEZpTzHt02bFwQzd6rls9JtDiMjiMvNPu9rG+0sZKj6i9v
	2CbT+wojv7xj130KFZntmbRKXvmNKXUmKgBTyUJ3HKRFikqo6NwfrMg6nA0FytNicuDKN40hvA2bV
	dvMtLpCNn+I++y39rJDSogEE+nUGiO+X/+LopxrAZGGLa2lpbaj6dpnbUFOR+1HdAAU7+E42mD/1F
	aqatIsSw==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1uCtmn-002Suz-M2
	for linux-kernel@vger.kernel.org;
	Thu, 08 May 2025 07:27:10 +0200
Message-ID: <cea40831-31b9-4a8c-a742-bc119feaf50a@bit-philosophy.net>
Date: Thu, 8 May 2025 07:27:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-kernel@vger.kernel.org
From: =?UTF-8?Q?Ywe_C=C3=A6rlyn?= <bitulla@bit-philosophy.net>
Subject: Now supporting AKI Computers (was Low Jitter ,Fair Pay Philosophy)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Now supporting

https://www.google.com/search?q=AKI+Computers

AKI also means "friend", and the spirit here was early influenced by 
Amiga users.

Also replaces "hacker" for me, that has gotten ill reputation.

Light, Akis!
Ywe.
https://bit-philosophy.net/
