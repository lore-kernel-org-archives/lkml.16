Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD5D1CAA96
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 09:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746263379; cv=none; b=MGjv8he2fr7UhS6N4I1tA9hDe4St1aFlvMCUsQRuqiMt8nWOMNXd9zEwNt5bAZMHkdABhbrWLBP59vmZ+LZJ3q5pyg+8pEMdZ4YPWKgzJaAelGJWEEyVAkpJm1yeTU/J+HIr441E0JpNlXqJkGetm6SU5aW/+G1vc0c1lbl/1fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746263379; c=relaxed/simple;
	bh=YbEwlaReyot7biCcizo7GYJ5t5FqKE1DesEL4SbPXro=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=R5+phssd5ZsNjmPdHblaSmCVyhm4rP1Nueo+8xiOHRxlDKfrLJYVSq3/62LpRZZq+Mm7E5qWzJl0bVRmYn2qUVqR8KFC7vKV4jsmM3Nb+OUurxydIKZFhU0w0pLpnmT6gZ8MwOT6LXiVbB1k/xrhgeUhTza4tWXAMMa3E0ziAVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-philosophy.net; spf=pass smtp.mailfrom=bit-philosophy.net; dkim=pass (2048-bit key) header.d=bit-philosophy.net header.i=@bit-philosophy.net header.b=PuCu9P0E; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-philosophy.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bit-philosophy.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bit-philosophy.net header.i=@bit-philosophy.net header.b="PuCu9P0E"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=bit-philosophy.net; s=ds202411; h=Content-Transfer-Encoding:Content-Type:
	Subject:From:To:MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gEC3pPQP4avgN9s/eV6Lfc5jmQ1Pro6TAZhhjF7CcpI=; b=PuCu9P0EYNr2XnJRbD2/eSiz4E
	YtIAnM5wG3YB2qMyUOwWRxz70sxOAa9giU05zniME2dtSDlEHS1odLK77WwhsmKkwUXdxTIJH1pZI
	39W2/cL0Jr38FTM/IwPrnPwCWM2I2T8CWMlqvHy7cExXgopItDXxrP5j47G+FvX3/NnnrG8q/uXRi
	G8Fiip2rd1MRvmBRpy+ojJP6e7HffwCgfpGPwq+gLMHpmIAZwI9h/afQBDNyU3fYW6pIb+2QQgUzy
	KLAKK893U0k6uS0gR1WcLEPSalCNoi0+QI2wfCWUc6W7lg9aDJINLnvsiVtliFSj8cuMAR+1E03bs
	kbD3I6Wg==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1uB8sG-00GbeH-S8
	for linux-kernel@vger.kernel.org;
	Sat, 03 May 2025 11:09:33 +0200
Message-ID: <986c138a-85eb-470d-835b-42a999b6c1bd@bit-philosophy.net>
Date: Sat, 3 May 2025 11:09:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-kernel@vger.kernel.org
From: =?UTF-8?Q?Ywe_C=C3=A6rlyn?= <bitullah@bit-philosophy.net>
Subject: Bitstreams OS on Discord (was low-jitter, fair pay philosophy)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I have also setup Bitstreams OS on Discord.

I started this project a long time ago, and Discord seems perfect for 
it, being a branch of the planned development.

Check it out at: https://discord.gg/2UDVDytE

Light!
Ywe Cærlyn
Abbed,
https://bit-philosophy.net/


