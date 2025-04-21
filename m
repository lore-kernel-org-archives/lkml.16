Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D283BA42
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745225571; cv=none; b=B0F9CenL8gv9PLSrCJV4lPwAuHUVnyHEGHXEp2HeWx2X6KDarXiMCB1zYrubCNEuK3vq8x6zTnrOvoymvK6ulkbpj81GOxCIhGBVgtE5nAkVqsJ+9ek6hZTqW5lqTiugrD6BiHqTW0BgMPnsYQ3OI1iuRs0eHijvJoOjLiS3LdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745225571; c=relaxed/simple;
	bh=+IM6/Mu0bNnZJGQZ8ZXVCd1P6UiYr6sZPlppHECHn5s=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=PnaojBjU6yxqafLvkyiic+F0gTJ1GTL2l7A2bBda29xdItTNKhBhvWSRL5Sn37XZRB8LZayavVuccurIjboakXAoGmvEik6t3JoBfkPkO3FdnqhImTI+ffqfmLSJ+Y870QPqfly2/5sOfrh59XW6S8AKslXmNF5ma7PQ1zn5UXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-philosophy.net; spf=pass smtp.mailfrom=bit-philosophy.net; dkim=pass (2048-bit key) header.d=bit-philosophy.net header.i=@bit-philosophy.net header.b=Y8Nz4IBE; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-philosophy.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bit-philosophy.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bit-philosophy.net header.i=@bit-philosophy.net header.b="Y8Nz4IBE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=bit-philosophy.net; s=ds202411; h=Content-Transfer-Encoding:Content-Type:
	Subject:From:To:MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+IM6/Mu0bNnZJGQZ8ZXVCd1P6UiYr6sZPlppHECHn5s=; b=Y8Nz4IBE0Q3L7aULfqA3n0Vybl
	Dx20n7s/9C1DQkzy7GmjzMJgOlbzUHVmyH5kVDiaX3efqVoE4Xqa8KI6RCUlrbWiauE7nSZOQ+sb8
	JBBrilt/qYm29gn2d9VsWxn7JsdjJBBvBVcMh5eBjmBF7VX2uPqWJKcQJ73uKi74yvZBFzaxvLSv7
	ini3gU4Of66oxeEvDVLKbZTnPlWOUFkljPQr+aylgZCAJhURUTcCdLyvK0Ea9nfq5g2UICoyWbOec
	RYLX/dDZ/sPkaAompHsEnox6b3L57GmcpoybKjiKeCGCkKP3VYuQEFjsBlNZCZ0WYH95wVW890hOG
	MiPBT6QQ==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1u6mtS-007afA-Kq
	for linux-kernel@vger.kernel.org;
	Mon, 21 Apr 2025 10:52:46 +0200
Message-ID: <f441cc67-6949-4c0a-bbec-5a325c250466@bit-philosophy.net>
Date: Mon, 21 Apr 2025 10:52:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-kernel@vger.kernel.org
From: =?UTF-8?Q?Ywe_C=C3=A6rlyn?= <ywe@bit-philosophy.net>
Subject: Bitstreams OS Reddit (Was Low-Jitter, Fair Pay)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I also invite interested to: https://www.reddit.com/r/Bitstreams_OS/

Light!
