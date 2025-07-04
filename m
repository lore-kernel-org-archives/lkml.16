Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9966827991C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751613318; cv=none; b=aSJurpNurjD5G6ScBgc73sqQw3CzWXk7enURyNg3KWwTaX1nI2re9PWp6pttl9tuV5E4cNuuMrNheHmc75DW/tC5Yad8wmr/5nKL/8KylZdbeKDhcKnFLr8i1E2uZFNpm4273CSiMnUHpZmBeROAaia8p1nXhB6b/cOpnYWTY8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751613318; c=relaxed/simple;
	bh=UkFOjG8CF+fndpaqLxiSmG0JF2JzrJF/ZDMEtVMpV9k=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=SwsKKsWu7OB4WKYyeZ++3nNgs1NrAgGlv/xvS86E91ptk2nkVgM/D5x0OxiYHyUZJkv0UHex9QZP9li2FkkLjDfy+OhUhPNO9RzMnuAFUtpddmBaMYLvl1jz/ActRXYswrXp1/UqbkWePj2ddPpZxBITZskRfEpbDAWPqOjTH/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitology.eu; spf=pass smtp.mailfrom=bitology.eu; dkim=pass (2048-bit key) header.d=bitology.eu header.i=@bitology.eu header.b=UMTtGbJR; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitology.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bitology.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bitology.eu header.i=@bitology.eu header.b="UMTtGbJR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitology.eu
	; s=ds202506; h=Content-Transfer-Encoding:Content-Type:Subject:From:To:
	MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:
	Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Lg+NnPrn5e6UxJTdMGzBxf8DUebhjbrUISMnM4ZVWAg=; b=UMTtGbJRuGTZgZJoIJ7nYUqWLZ
	A/I+Nuukomtx2DCAy7BeSzdva0+70hdcF5fLiNNdd/ion2GIk8WkWfKOGENG1IYoxLdxmjfhOoANt
	f2/LftEP3GsviGY1gU4aHgrykIjYKvKVrZA2qm4YIOvVE5Xx7B9qSBLoKyYeqgHDm9Ke6rXDeOQWj
	mOK3d1GDRH5kx9J8JHo22tpQ3gRhhBxFS9dQ92LiC5xBholYj3+gOmOpUpVsEuJPcFCH0wdmFaQzH
	lWPKaVZTCKfC7O7BzOYWB6bDdAxxGgQm+hpYHLTrOZOWoSQAvSjxetSDlt6NIfyylnDDiSE8clXbC
	E4t6K+zw==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1uXade-00F0I0-Io
	for linux-kernel@vger.kernel.org;
	Fri, 04 Jul 2025 09:15:14 +0200
Message-ID: <89626eed-e7fb-4e92-856d-62d5ba8599c8@bitology.eu>
Date: Fri, 4 Jul 2025 09:15:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-kernel@vger.kernel.org
From: =?UTF-8?Q?Ywe_C=C3=A6rlyn?= <bit-budi@bitology.eu>
Subject: JAVA CPU, Bus Bandwith Reduction to 1 Third
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Announcing support of JAVA CPU for Bus Bandwith Reduction to 1/3.

I think it is correct to support this, and correct branches of 
developments of things that have happened.

(Always really liked the JIT stuff aswell)

Paece, Love, Light!
Ywe Cærlyn,
Bit Budi.
https://bitology.eu/
