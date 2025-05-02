Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDECDAD24
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 09:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746177066; cv=none; b=MdxWrWtZvZcaoPdpd2HtF3qkgQMWp6pD7BXHRe0utarddlyWxKTOpwLLXM62abqq1eqdOudadFVlSs2rQ8HOkxTpdXMhARkA12lGweZWRNS1q8c0GU1KF4SctrxCn5GfqBsAc5oXwI4a2FFwLsR69+Sa2yawhQZKhBK26hiaUPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746177066; c=relaxed/simple;
	bh=LGfrM3HATtsDDsLsLziC/Oby8CkTq5FMqeENk46KWZ8=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=oOBXbtZsVnQrFTNKKQpvHFZBzeNDKMmfFe5eHqWluXj9zyRQaUNuslcJSTFq0kqKQCZtbMBG9ZWazpgtJyPxWMJj4TEH29XSKT4iVHrXcCJDg+3M47/+WcTjTpW+Fss6/LguVJdmHvsRV1RFppQ2N/mvtesC6mvjY+HFTm3XtJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-philosophy.net; spf=pass smtp.mailfrom=bit-philosophy.net; dkim=pass (2048-bit key) header.d=bit-philosophy.net header.i=@bit-philosophy.net header.b=qXUR8Z6P; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-philosophy.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bit-philosophy.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bit-philosophy.net header.i=@bit-philosophy.net header.b="qXUR8Z6P"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=bit-philosophy.net; s=ds202411; h=Content-Transfer-Encoding:Content-Type:
	Subject:From:To:MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PJoB7EO6woyMPzcthyZR1FcQQ8rTw5ww4cKO9zbfVCw=; b=qXUR8Z6P/nyXuVcCyI7oTY9psk
	cFYlwKnVrhC8mFEruCbZCJAp5iTx4HAwUFHzkLMOQ+JtLcLDHeaMbnGsROolc6Lif9hr47PkvoNgk
	BAqgKt+FztReHxe52Qa2bFn0A+xLY/AHWDHbFB7sgDiTnfaTEQ0f2BD1iby8nl8/dtouNvVFRVhIP
	a9kKIhcblURtdYahtMqThD085YsDp9ElJUGAU9/NM8KoWaMkLgrZkmAuOdmeiQ4K1HeuP+EMVqUgs
	e0c9m5bWISRadZ/3P0SpJgIEkC7vnm2PB2f/OoyG6NxmUyjk/1Z+yJwZILx4kRcdwbtU+R1K2x1/6
	WJfzwcHQ==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1uAmQ1-009caz-SE
	for linux-kernel@vger.kernel.org;
	Fri, 02 May 2025 11:10:55 +0200
Message-ID: <a384bc4e-c045-4f6c-a54f-3853196db842@bit-philosophy.net>
Date: Fri, 2 May 2025 11:10:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-kernel@vger.kernel.org
From: =?UTF-8?Q?Ywe_C=C3=A6rlyn?= <bitullah@bit-philosophy.net>
Subject: Updated Email and some URL's (was low-jitter, fair pay philosophy)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Updated my email to bitullah@bit-philosophy.net

Updated soundcloud URL to https://soundcloud.com/bit_9x

Most of the 9x stuff is done. The Amiga++ culture is now a bottle 
recycling machine. Remember to give to charity on this one, if you want 
more of that.

Light,
Ywe Cærlyn
Abbed,
https://bit-philosophy.net/
