Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8188221C19B
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748595981; cv=none; b=lpkVnH/vFQoygixp6RsLQC1LXxe0h86wSSLnXLK1K1xvyn+k7rQC0ISjibZOBYWwKSruK2gNNQGOrUBfYVomlYyBQXsMAm0ERrPWGKt0j9OK7SQI07htqePVERRPv8wTXVcX7FbYGyIJG6F89lyOWGbenGbhi6pgTV5IwlYfTWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748595981; c=relaxed/simple;
	bh=bxQMzxNhia+6ZXQDuN6obyd0azK05G5bLOSYlyomuSo=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=WJfpEFxuCPx+c4q8ktkbM8eNQ8xRxHozFcpXkUseew+L0cvs438Nri/gQ37J6kJkt2nbYoV1bkk81px7WZunnaNDfJvVVIOYMv8ivoAJTQ6wJDT4BLeqJ4cKDuLP6SBKmgPH7VbV7lv6YOZEeS1lyEthb4zEuVQ6YFlLTTtc+iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-philosophy.net; spf=pass smtp.mailfrom=bit-philosophy.net; dkim=pass (2048-bit key) header.d=bit-philosophy.net header.i=@bit-philosophy.net header.b=pN5urq9Y; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-philosophy.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bit-philosophy.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bit-philosophy.net header.i=@bit-philosophy.net header.b="pN5urq9Y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=bit-philosophy.net; s=ds202411; h=Content-Transfer-Encoding:Content-Type:
	Subject:From:To:MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=e5XPgjVWWMJIYR8N9QzQ5DcnNAdQRMECJP8Vjil3Mm4=; b=pN5urq9YXjiR7iDjM4cCgcNAVx
	mFwkCS/qbCjhCn3Y/QVjrF2aZG2AFOb0ULm+AfLJz93kMJuygliQk9dMYrrpjPO10QzWJM+a61JmH
	lr0UJQGCpESTETU37nD5PDEzW0YjFqb/aZZN4OCrcXX2KQHywmt2rT0XgnMwP2lSHwho9QOL14QBe
	rQsBWVfEsWpBzyNALpsBbS9Gg3rTcLGT55jDwMumPSt+xc9hDH41npVVAg7uleWVaSG7SIPZLp4zR
	E5CZGpftAiJOUlls2MgoVWygZGNk9wAbXpmfDg0HNiif2e8hIB41aX65qqxRWeZrSuhMIzSLIImwL
	opKUygEw==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1uKuH2-00Elno-Sz
	for linux-kernel@vger.kernel.org;
	Fri, 30 May 2025 09:35:28 +0200
Message-ID: <1b80772e-6308-4bb7-9112-4be6a43d9b3f@bit-philosophy.net>
Date: Fri, 30 May 2025 09:35:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-kernel@vger.kernel.org
From: =?UTF-8?Q?Ywe_C=C3=A6rlyn?= <budi@bit-philosophy.net>
Subject: A Note On Wayland (was Fair Pay Philosophy, Low Jitter)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

A note on Wayland. It seems to be X, through "Satan".

That seems to be a bit of a problem, that some think a thing like that 
is needed.

I rather prefer a 1:1 reality naming. The background philosophy I do, 
supports that.

X is actually that, symbolcorrect.

"Ya" also changes naming, for instance Bitstream OS, would be "Mandrake 
OS", there.

Here one needs to take a philosophical standpoint.

My research is at: https://bit-philosophy.net/

(with full support for Obes and all relevant science, instead of Lamb 
Churches.)

Light!,
Ywe Cærlyn,
Budi (iMAM)
Bitstream OS.

