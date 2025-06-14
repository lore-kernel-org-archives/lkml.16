Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F7B145355
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 04:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749875336; cv=none; b=rvKQ6gG+/EX4ESKak8n7j0O8CRvWtH7u1Ocm9mcLfKThU2HWtW+8jmd/KvIgz/oaW8OKmwd+HJPKM/rxg5132Bnd1onebm4FGEkqn961gjJYxfyIaYUS0KRIc2tL7BjJ3DA2kdnkVWgIA+7UdtgLC6OmaWPUqY/5W6dC5SpUmAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749875336; c=relaxed/simple;
	bh=mtrT1VPgmn6CqYYvUEepa4hYuKagZ1P1LX7pde0Mho0=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=Fl2rf9mDSB9nsm1Lkm7YoSyodkcPtrGWZBKHi5NjETxk9yVn3qfRV0KzboSJ8fHljJDPHk/OfANDsAbZWadjgohy3NA0okpryS5+6c27T+X0OqjZz0WVYjCoE5b0TODAIvOv6uglg7QqNEu+X4Q29VI90XE/iMmwrwJQ43uOCyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-philosophy.net; spf=pass smtp.mailfrom=bit-philosophy.net; dkim=pass (2048-bit key) header.d=bit-philosophy.net header.i=@bit-philosophy.net header.b=Ae1WBIb4; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-philosophy.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bit-philosophy.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bit-philosophy.net header.i=@bit-philosophy.net header.b="Ae1WBIb4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=bit-philosophy.net; s=ds202411; h=Content-Transfer-Encoding:Content-Type:
	Subject:From:To:MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=889kgIx+fvgYYJHtnU8B0jwoilI0+SgVOAvcmQTcHdM=; b=Ae1WBIb4aid+8i2Cn2l1UP99f8
	GuKp036QfmHcFlDlYig+5/Z7Ri6Fp24OSeycMpDpX3RnumToPDy7D0NYJWO/DonFW9hb0eBND4uey
	4L5GfoN71hc1W0XP0Oo3xoYcL9TjPBucbL8r34CwUoLxzICAf77O4HpVPDoQYbQEPj7dE1zxsEUUz
	0F3jjxcNCDT++9IGA3e4nrAQ32DaxRRbR94f1e5qRsUbCIijA8VuNajnsDCAWNjPCm2ElggFND3he
	DrgGxB+v9qgwgIn9i/kAHo9HAEpPPRkcRbfJyRv80qxsREldF3v+30Z0tyLYw3u29nn0gLEiT7aEo
	7EyApoKQ==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1uQIVZ-000aIf-0B
	for linux-kernel@vger.kernel.org;
	Sat, 14 Jun 2025 06:28:45 +0200
Message-ID: <a8c0d083-e15c-4402-9f7c-f25a552b377a@bit-philosophy.net>
Date: Sat, 14 Jun 2025 06:27:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-kernel@vger.kernel.org
From: =?UTF-8?Q?Ywe_C=C3=A6rlyn?= <bit-budi@bit-philosophy.net>
Subject: Like NATIVE philosophy (was low-jitter, fair pay philosophy)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

My translation of philosophy is now like NATIVE!

With Eln, meaning The Tei, using a suffix instead to indicate this.
So it is perfect. This concept is referred much in related culture. 
Intel being an obvious one, and many more.

The related philosophy is discussed on my webpage: 
https://bit-philosophy.net/

I also have some media on 
https://www.youtube.com/@Ram_Bitstreams_EU/playlists

Some of my own (old) stuff is also there, coupled to some humorous 
videos, to laugh off c64 and Amiga outdatedness mostly. (I have never 
been about these or mini versions, but Open Source.)

Light!

Ywe Cærlyn.
Bit Budi.

