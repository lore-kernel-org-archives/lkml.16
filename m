Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E5215A86B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743612091; cv=none; b=rIM7td446ih1ZPTrcRktHT25ADEy2jQvjCWMen0voDl6PnOpO5r/YORrc7z4ap0mU3YPXHGWWoA+zy4brKJSsgTmLWrgUUeC3Bdh7QSuRarbPlhwGz9/6Q6W4nnhrLwWHRGGoZIe6tOwt2UBJ3G6GcUfTy7r3sETsKDs1ccR4Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743612091; c=relaxed/simple;
	bh=nmsaXvfnIFl6NmwVoYD46lxTCuO515WxPZdTX66Qo3Q=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=YXNbGSNliifZDr6lG5rXjLJ0jBCo6U79Z2VzP4oVSSLgtA3UHJNX2o7QypCBlC9GGKobZ8wqvInfH7dnCMVDkmpaZeRDIlwUgQmm0u8uNOxG6ODxlPQh8kQA0CfWFDcG8EAYMXrPeNrHAruXOQXALVeDqjV9gsBhqAvRYnJ0g6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-philosophy.net; spf=pass smtp.mailfrom=bit-philosophy.net; dkim=pass (2048-bit key) header.d=bit-philosophy.net header.i=@bit-philosophy.net header.b=L/viaXhn; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-philosophy.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bit-philosophy.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bit-philosophy.net header.i=@bit-philosophy.net header.b="L/viaXhn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=bit-philosophy.net; s=ds202411; h=Content-Transfer-Encoding:Content-Type:
	Subject:From:To:MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+A+81ucsh8zPhiyFojiWYCgzq0MGXiREO35Wvym6X50=; b=L/viaXhnz57XdEjH6QZHbDsyOZ
	G3xa8PS0HkXltx0UQxnXJ/RSqZI7lEDdgu1mfn5GfGFvgPumvQOuY3MHTgSiX37vT6/GK5MninqYH
	CgCbZ8JAet0M5F7JtpCRK3Mg29b4C/cn2RZq2Md98UCS2iG0VtUfPO09ud7xGHgZoHdVJi0uEJIWg
	1uZO3EbnADp4hiSj9Sm6Xs5fx1a8DLBJn+WsA+QR3Th54imseWQOXyp8DpsjMfTxs7C6XUdA64kXN
	8edlI9oLCxDh5ghh27+Qa2pAT5N4FfU277IHDWibKQ/gR/xaaSVXn2v0fIuSoCWeMLCdG6Eokia+c
	s3NjuadA==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1u019V-000Up2-Er
	for linux-kernel@vger.kernel.org;
	Wed, 02 Apr 2025 18:41:21 +0200
Message-ID: <28b2454d-61fe-430b-846e-d3727552f257@bit-philosophy.net>
Date: Wed, 2 Apr 2025 18:41:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-kernel@vger.kernel.org
From: =?UTF-8?Q?Ywe_C=C3=A6rlyn?= <ywe@bit-philosophy.net>
Subject: Seinfeld Satan
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Some may have noticed how some people laugh when mentioning Satan. 
Seinfeld actually used the effect for his comedy show.

On c64 a "coding genious" knew how to use the interrupt for rasterline 
effects, such as "border scroll". (Changing screenmode on bottom, doing 
scroll via sprites.

On Amiga the 7chan playroutine known through Chris Huelsbeck and the 
Turrican game, was even more genious.

However this 7 chan fed sample-by-sample to the processor without use of 
hardware looping in the soundchip.

But this is forbidden for Satan.

If appropriate resouces was used it could have been much better.

Hans Reiser axed his wife, due to Satanic belief. He, in confusion 
thought it was good for the cause.

It also means to Satan, do not use cache appropriately.

"Hahaha" ?

I do not really think so.

Light,
Ywe.
https://bit-philosophy.net/
