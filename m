Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D81F1CDA2D
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 13:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745674774; cv=none; b=k61Hb4/teNZRhpNXyyekYsi2woWMO5OOhTWqzOCe7RSJ4lv6cUkJ5MgzoDljvXo4dWG1m+fGJYbQZ0F7d17NKibDRYqN1sSuOlOcG+zgq57KAuv4yzw0qpNL2MTDzIh8/U6t/MW4b1eYbm1gA+FC1S1D1B8WnOLqXSakWFIMKTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745674774; c=relaxed/simple;
	bh=ENv5rSKL45ARIJpXJ0IMEXD2sWXX89yP9DmfCGux/9U=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=kMCplaTX82R4Jh7RcqTluW0ilU+z8mDv+BUzk6Gmn3i73KdvkjeDPctQaa95voXLCsUn8XzMgyb+590uKSaAyPTbOeWelgwRW2t/TADNvGvNnnnVQdCtIDyI1Ww4hp9jy4FfREowL2UZ0uYvXyQFKQYsJgQ5gaZ5RKG/zapcp8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-philosophy.net; spf=pass smtp.mailfrom=bit-philosophy.net; dkim=pass (2048-bit key) header.d=bit-philosophy.net header.i=@bit-philosophy.net header.b=Y5/+sAWq; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-philosophy.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bit-philosophy.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bit-philosophy.net header.i=@bit-philosophy.net header.b="Y5/+sAWq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=bit-philosophy.net; s=ds202411; h=Content-Transfer-Encoding:Content-Type:
	Subject:From:To:MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=H3AOhQYMJFdt6ybvr2HQvNUIptmFX09WqyLFHTfNPJY=; b=Y5/+sAWqFlxTVrWm7WN+eK8fdS
	DRc9ITfA/Zq44E7ZTuneCLqlPgQrgZe6NNbC/mJZetoHx6xC0o7Y/qR8Zzn17TcTRHYqMMWwANclh
	gtGCAAEvxVJJBt+WwFMQt/P2eI9kQA2YbnkNuTo755Yu87tlY7RgK0er8vJon8W0vkmsnk6+5HdFZ
	wIbQM1dOm4IrjGC5pVCJSEISNUHN64XUX1j13YLWnYRdcGn6XACfMn7Pi5ChuAFOBBbvRr/dMlMj3
	NjWRiYaQ8QnPHZ22wFTbkZcP+TRwEeEcguUbZnEfkKQn05x87rA0iqIMol6H1UesEK7kBowVG/14w
	aL1qCrcw==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1u8fkf-008v9U-2T
	for linux-kernel@vger.kernel.org;
	Sat, 26 Apr 2025 15:39:29 +0200
Message-ID: <d4150047-e7f1-4011-b465-3d2d9452558d@bit-philosophy.net>
Date: Sat, 26 Apr 2025 15:39:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-kernel@vger.kernel.org
From: =?UTF-8?Q?Ywe_C=C3=A6rlyn?= <ywe@bit-philosophy.net>
Subject: Some Playlists (was Low-Jitter & Philosopy)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

https://www.youtube.com/@Calil_Bitstreams

Here are some playlists on my topics: Bitstreams OS, Jam DAW, De Ext 
Wavelet.

These and the philosophy on https://bit-philosophy.net/ are my 
contributions.

And have inspired many designs related, Debian logo, GIT, and much more.

My own icon design, the yellow and orange 0 1 Kawai Bit, says all about 
design of Bitstreams OS aswell. (as featured on channel.)

Light!
Ywe Cærlyn,
Abbed,
Bitstreams OS.

