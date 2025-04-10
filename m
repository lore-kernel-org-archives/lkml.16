Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7382A47
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 04:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744259174; cv=none; b=fAGgA39jzWR1tRs2jVFj/dyavbanjWnnqHN94u25qAjGR7412jJ+bLE+dYhff0P2lJuQq9hZuEylwSKFCqqHEZP5P9T5m4w9EE/H5dSTMYtnERZ8b0fSeGOP894wFWTVBh3SbYsMzL4dpoxD1W/ibcXVWPqpfSziJkUq68aoEmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744259174; c=relaxed/simple;
	bh=YKkP8+I2mLaJSe85LeC/ocsoyvTwsfg7HiWRYmjS7iA=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=t8yGCiGSuWryFLZ2gxLPIlir+FcT3C7VAZmVxcfc5vbqjtFTulUyOT39ELC3Tat+TexP6D37raoIgmsIiLY7l65tggU+BlFcjm3W04Iyn5DY81xlh6+pHo1IFtgaB0IYhFQuHUYQMb4NNM2tcMM9wa4PdbvEtjicboU9kVpSOSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-philosophy.net; spf=pass smtp.mailfrom=bit-philosophy.net; dkim=pass (2048-bit key) header.d=bit-philosophy.net header.i=@bit-philosophy.net header.b=F0L8Sza8; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-philosophy.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bit-philosophy.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bit-philosophy.net header.i=@bit-philosophy.net header.b="F0L8Sza8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=bit-philosophy.net; s=ds202411; h=Content-Transfer-Encoding:Content-Type:
	Subject:From:To:MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Xb7yQwX5cd0KkdaIcjvaLL8D9LTDqz4TYT+msiWYcfo=; b=F0L8Sza8+RbDtRQWRoRewZl8Ok
	DB1zG0ZMUm9lZEUicI9ILR6CDY11k4seCkuLqgjizS8sr3iVJJqoGWi+XJmUAoMi+1hECoxfW3U3Q
	FrLpCHWEF5k5uSAY4Oh6zeDRbZneRXeTHC5+0liyAVLBK39d2iIzU1an5A8aYH2gUGs3ZFeIBSBtU
	P4pSrIpkQFIgdzIaFL0PN1vNOMZM6rEGBahmaxe/Rr+8AcVkt6dvfqktrDUfmf6WKfG+D2zpVH9By
	BR0cYP7bNLiAmfLqzeLLAu6fYitYrVwyH129/yBSuu8fWOdySAbye2768AmWtvwolJuKHi+FHeDq/
	SmCvEFOA==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1u2ipM-00G7lu-NQ
	for linux-kernel@vger.kernel.org;
	Thu, 10 Apr 2025 05:43:44 +0200
Message-ID: <a217814c-d1b6-4d54-83c2-67483d4a8cfb@bit-philosophy.net>
Date: Thu, 10 Apr 2025 05:43:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-kernel@vger.kernel.org
From: =?UTF-8?Q?Ywe_C=C3=A6rlyn?= <ywe@bit-philosophy.net>
Subject: Bitstreams (OS) (previously low-jitter fair pay philosophy)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

My webpage and conceptology is coming to perfection.

The words in translation of philosophy now is optimal in linguistics.

The OS is Bistreams simply, the pop version of the computer bit concept 
that is at the root of unix derivaties and BCPL programming language.

I was part of developing and popularizing the bitstream concept myself.

Sense indicates to use bitstream centric instead of files if it works 
better!

https://www.youtube.com/playlist?list=PLVLVrw5JZ0BhvjUMhiU7BIXcTotvU5mfr

Light,
Ywe.
https://bit-philosophy.net/
