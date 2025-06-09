Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4A778F4B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 04:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749443863; cv=none; b=e5uAioexj6UkmSxe7MCgZTNqhRVBAHA7CCH/jAKkx8sojtUgWKtQxaulljzTkvSgKKztF+IgASVaCBddrRv7HyMjoCjt5vPPQP/rhWmNfUXAwu2IrVWq7CgN4jjh3gtrTjvUqjms7eP3s8BvvnY/NK8kZ1YQpqd+M0+hPJp+EjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749443863; c=relaxed/simple;
	bh=pVO3Oq1YhlhCtYQ9jrLcoUV6dtbxO4lanpjNorX9/wo=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=MMqSVolkHBo+y61PY87K9zHGBEkdrrw5UYa6zCprRcOQ1Wt2jX/L1qqYW0r3wqSEcXqVTaUzqBHrVVus19gwfjpTa++SDRoND7fj0/8kuTyS5HN8MxHBHPil3NGHqaxfNMlWrsOJF+LhDlAp9guuct4RJaxgAfjLAadGsgjvNmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-philosophy.net; spf=pass smtp.mailfrom=bit-philosophy.net; dkim=pass (2048-bit key) header.d=bit-philosophy.net header.i=@bit-philosophy.net header.b=bdeUdx7Z; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-philosophy.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bit-philosophy.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bit-philosophy.net header.i=@bit-philosophy.net header.b="bdeUdx7Z"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=bit-philosophy.net; s=ds202411; h=Content-Transfer-Encoding:Content-Type:
	Subject:From:To:MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ovokb13fiIyMNCJFs303jJgi1SevBGlxAQLsS9fMGZk=; b=bdeUdx7ZdJL8DVgoAa+wghPnSw
	N2RKRCzjv+yr5hKanSSmWqtS3YRHSErk1RhJ4OaoJH+M10wcxsicYmPYcs1GAb+GgtMcN/zNQcj0J
	l/kCcYsme0zH91e/8Vk0Mb8uE2byb/tjLr0p2P15WMv0HCccVamccBR7FCXgsll1HHSHlBhGtn4wN
	2S5f1xrkckZeexgVsrLZ8eyCNk2+GDQJ/eifDugzOE8aKYxug1g3uetyTOHiM/Tl0akVkytHTSGnL
	xQGSB6uHLCA6i/6mBR+KvqOIOt8K+JkWZeF8J2yT+cy39hQ6+vg4g7W7W9hKmTD5tAEpfz1zH3S8H
	0MQflsFw==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1uOUGM-002k3j-9r
	for linux-kernel@vger.kernel.org;
	Mon, 09 Jun 2025 06:37:34 +0200
Message-ID: <f798d8b1-d27b-4f97-9c41-0043042e4b90@bit-philosophy.net>
Date: Mon, 9 Jun 2025 06:37:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-kernel@vger.kernel.org
From: =?UTF-8?Q?Ywe_C=C3=A6rlyn?= <budi@bit-philosophy.net>
Subject: Accounting for The Activity (re low jitter, fair pay)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I am now disassociating from things suboptimal at current time.

There should have been enough time for considering what I have said, and 
what is now Bitstream OS. The Low Jitter, Fair Pay Philosophy oriented OS.

It was once this that started opensource. Git/Benedict, Mandrake, 
Debian, and much more is based on this. Naming was still in 
consideration, since Bit was often associated with "Nerd". Now the term 
Bitstreams has become popular and the native concept can be used, 
without problems with "Nerd", and so one should.

Playlists: https://www.youtube.com/@Budi_Bitstreams_OS/playlists

I have finalized my research on https://bit-philosophy.net/ aswell.
With Ael being the Quranic Tei as perfect as can be. Please read more there.

Hail Ael, The Real, The Right.

LIGHT!
Ywe.
https://bit-philosophy.net/
