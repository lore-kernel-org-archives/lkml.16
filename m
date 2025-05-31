Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE285DDAB
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 13:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748696526; cv=none; b=dgPlA0F0YBFkV4UDmpiqgozempGYdYruyiODKOl7Zw++8WF7dM6SWh1COBrbRJXz5Dzvw04+Sh1RuySxZ8G/yM2IyphGLHwFQNR5Dqsg4USe/ICoStxogUlrGLtswsDwBW1H5oy3ZaFvcb44Ff73tgq0NikHPDmAst5NglAlceU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748696526; c=relaxed/simple;
	bh=oKChN1JBaeQ+gwAQa+b3HnjxeSRpjAUhNez89dkTwjw=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=OHgqsIuFUy5hsQeyy1hk797glesuRoUjBW2i96FMW3V50Er+Iwnv/9FdwAeX45BLRRmPumV1nNi+ug6a+aM9HHpNUAZHiV23xwxcxqrYiYUCVt97Ag4S2Q+rQJ3q3k5BGb3dz+O+NhDqKHOyzJd5dDhTwGeo2FJTYOeHhd9nBzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-philosophy.net; spf=pass smtp.mailfrom=bit-philosophy.net; dkim=pass (2048-bit key) header.d=bit-philosophy.net header.i=@bit-philosophy.net header.b=RMPSKxum; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-philosophy.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bit-philosophy.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bit-philosophy.net header.i=@bit-philosophy.net header.b="RMPSKxum"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=bit-philosophy.net; s=ds202411; h=Content-Transfer-Encoding:Content-Type:
	Subject:From:To:MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tjyw5wyD/Rz8LAtKIWWnEb0NtlUKOOzZD+jVWNTFIkE=; b=RMPSKxumYZjc0MOWK8e5KMgCwF
	UoWkPQtaMEQbtVMdqo+i8d/2c7dgsytAyDXDFcFd2/8Jm5eq0TG/A2hDbGZUnbCoZSN5BfXkMatAA
	LlAfvyPfeN1/788J2yFQp+5ONcKf+eZTphZS6QOxFb8elKrtPA8VHop1+BdVY32lqqr9M6gv7L67E
	56/CLxje50HAtMbsGcKQ/HcbmzdRcCiQpSUxPIrn0GZXyIiw3cBUbZyId+Cdn6z7+6UqxbUCryHCr
	muMyH1Ja5ocbTCYK5HD7KHaACa0DZqnx03Yi39u5CM2bo8XTgRjnsiyEi7TPqHXfmPnzpJrTCkFC3
	qYYZQqKw==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1uLLqW-0046F0-Fh
	for linux-kernel@vger.kernel.org;
	Sat, 31 May 2025 15:01:56 +0200
Message-ID: <2510ed40-b795-4772-98c2-bd9a6675c61e@bit-philosophy.net>
Date: Sat, 31 May 2025 15:01:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-kernel@vger.kernel.org
From: =?UTF-8?Q?Ywe_C=C3=A6rlyn?= <budi@bit-philosophy.net>
Subject: Sen Concepts (was Fair Pay Philosophy, Low Jitter)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Consolidated my CPU, Wavelet and DAW concepts in Sen.

Sen Wavelet, Sen CPU, and Sen DAW.

Sen Wavelet used for compression has relevance factor. Used as filter it 
has perfect Q-Normalization (a worlds first?)

Sen CPU reduces bus bandwith to 1/3, and avoids the need for 
compilation, using a C like instruction set, and follow up to Go.

Sen DAW, is a music app, that uses Sen Wavelet, for patent free operation.

All set to work with the fair pay philosophical background, discussed on 
my research page: https://bit-philosophy.net/ (now v0.99)

LIGHT!
Ywe Cærlyn
Budi, Bitstreams OS.

