Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEFA271442
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 20:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750539083; cv=none; b=Y5M4TG2qj/1P/THcYJ5D7xkTmGF+NUnryAqSWfXNRiWLA0EosBk5GhGOc7mwi8fvvTARWj3vX9wmpXeKEzLBpSaR6hr4/ADYPg07iaPjNiDXM9okr2ShJDxImF6kb5C5zCO7EaSK4aPIRFBxGpi5t5eyYXSTCSOlWE8zrv9Uj9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750539083; c=relaxed/simple;
	bh=v9SEfWHaLKLzZ51yBh3GMJkvnWnGKDt6pqWgxr1ZXrk=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=TWDLmZKd2rgPdGYnUtKA0S8tCvHZrOFYli2iK7WMpPE/t05dj+2UWqZLJe1Op8lzJpClaOZNfkLlmg9H6u1+TeJE1v+MXIGJjBsbsNAINqimA4h4hLT+BNFgoKuZYMiIJywtY3ag87r9OkOGPW7qNBQHR4pUHSEMA2XvBLK075E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitology.eu; spf=pass smtp.mailfrom=bitology.eu; dkim=pass (2048-bit key) header.d=bitology.eu header.i=@bitology.eu header.b=L3VmS15f; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitology.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bitology.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bitology.eu header.i=@bitology.eu header.b="L3VmS15f"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitology.eu
	; s=ds202506; h=Content-Transfer-Encoding:Content-Type:Subject:From:To:
	MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:
	Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GC5wteb01X8aWqz8GPS3uLooUpeEnYoTVV8sCOwJyWg=; b=L3VmS15fm8qNYpybnHgvJ62FYQ
	6RKW90wCcoSiGMF4JQj3WsUf2PbwOtjRaEeugJkC9UZS7jlJLnvybgL32SK5SYG/r9zcX9VDyopV0
	jdb5hbXtd5cvIH3G6RskChKTpH8u2MSRrTH7ztJRaTF+sKNNncTk35I8WYhhnuVg/Jg7DkEXqBSQ+
	TP8XBuGqkax9k9PYwdjEN0L/fDCJBSOzUtpwM8Tbw00m0uFEmg5QLB2tKRkKU9T0X3t6htTk5sDzM
	LeNtYWKE2MWheY6BBuVxfM6KuGUNstXYWIrytBEEJKMiJ+/SXu1LzU/ovnlkA5Cha5mPnsSj3wdqJ
	gk2zSrBg==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1uT5BB-005RP9-A9
	for linux-kernel@vger.kernel.org;
	Sat, 21 Jun 2025 22:51:13 +0200
Message-ID: <dc59820f-9856-4f56-b57f-c733b4c05a67@bitology.eu>
Date: Sat, 21 Jun 2025 22:50:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-kernel@vger.kernel.org
From: =?UTF-8?Q?Ywe_C=C3=A6rlyn?= <bit-budi@bitology.eu>
Subject: Some updates on Philosophy perspective (was low jitter, fair pay
 philosophy)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I have moved to using MIT licence. It seems GNU really tries to be this.

My own suggested developments is called Bit Wavelet, Bit DAW, Bit CPU.

Website is now Bitology.EU, and Euro from Brüsseels seems optimal, as 
digital IT currency. (not Ethereum "hacking" or mining crypto.)

As before: https://www.youtube.com/@Ram_Bitstreams_EU
w/ playlists aswell.

!-!

Light,
Ywe Cærlyn
Bit Budi
https://bitology.eu/


