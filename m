Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69087635
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 06:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738477835; cv=none; b=MSoy0CSjQJj+jE+G84gxyAKfho2VGoTM9BK/NRcUBWxt/ASsuA7LCSwChFljl0eUMce6RagnE+a+RSbJDilVzFqBxcn3bCFgLK6FUWJGBRbMBF8EhKws0pick7fmuElMZTHBxXkJaANgtq2Mqaqc4sp+8hH6njyVh2ILNkY1qf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738477835; c=relaxed/simple;
	bh=oekth3qHj2IVrfMTXSpIclysYBopowXSQznF1+sUK0A=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=KsIuZGJ45s+I4l4ZJpC361/P6pTloRZ/33aCazx7dJQUe4951/6trxCh2QYCYbi08YOYawj6LYXLjDauVWUHAUBFSicFmHxP30FsVMB+kiZhRqybwsrwVb+w+D0SaZGAi+21ziuuI4k675XxrjWE/J2cZgr6NuQaKsFBb8pte8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-philosophy.net; spf=pass smtp.mailfrom=bit-philosophy.net; dkim=pass (2048-bit key) header.d=bit-philosophy.net header.i=@bit-philosophy.net header.b=uldKmxLc; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-philosophy.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bit-philosophy.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bit-philosophy.net header.i=@bit-philosophy.net header.b="uldKmxLc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=bit-philosophy.net; s=ds202411; h=Content-Transfer-Encoding:Content-Type:
	Subject:From:To:MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZvtePqkHwaGeNSOb5HCBisMcbdG1K+76hDyqvN+q1j4=; b=uldKmxLcW1LXExwY+eZLagsFoX
	jpgJ65NL9wBSvZ0AnLRfJpEFdP5ELG7ERYztLxTq1BwfO+yVIlLIqoLNUqtbOpU6y4tsUMzGLHPev
	RwYhppv4IunW9W8FKr+J5G7+AnfVY5beFiNuYPPRblfFJ2CijPLkYwyMveT5SG2f6aDJYi8+hP7Ex
	l5Uc+WpmnP+PdiIyd1MqgE+Kw3lwwbHT0kBissC60k/O6tNRPlLX3sATunLU6Q/VDmRUObabsq5Ws
	DgGzLzGBDcm/H79+ZLZG9I8OfjLyRnWtLpwXaxooMy1YF0gydRyszH5asGN++X5cV8GzRzG/GGPBj
	clmf9EIQ==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1teTUu-001It2-IG
	for linux-kernel@vger.kernel.org;
	Sun, 02 Feb 2025 07:30:24 +0100
Message-ID: <012da5ed-80ba-4af3-8832-ecb3969d886e@bit-philosophy.net>
Date: Sun, 2 Feb 2025 07:30:23 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-kernel@vger.kernel.org
From: =?UTF-8?Q?Ywe_C=C3=A6rlyn?= <ywe@bit-philosophy.net>
Subject: Reentrancy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Travis Geiselbrecht now developer of Fuchsia (Google) once made a point 
that BeOS (that he was working on then) was more "reentrant" than Unix. 
This was based on the two known unix figures, where one represents 
non-regression, and the other regression. Being both, they should do 
what was possible.

The regression part is "less reentrant". And in these days is Windows. 
Really the pub catalog, than in regressions is the pub of Ale.

Ale itself a regression of a'LLA.

If one thinks an alcoholic drink referring The cORAN is absurd, then 
ofcourse one does not want the regressions.

I am fixing the philosophy these days, and is it now perfected, web is 
v0.98, https://bit-philosophy.net/

Many people may like to see more coffee in culture instead. I am one of 
them and often enjoy ice coffee.

Bit X will represent more coffee. And it will be without regression as 
much as possible. Maybe to the point of getting rid of "Ale" one day, 
and instead having Jal, a correct translated version of a'LLA.

Bit X in the whole world will indeed mask regressions.

And one can indeed be as much reentrant.

Light!









