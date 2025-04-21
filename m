Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DD81FC3
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 04:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745211229; cv=none; b=TsOLp0uIsgO4doKEDf8T/vaZcndfQ5yo2zBMVSY1ofGLdp41xtYST/FZfIPilBmdyTZIXRxZHlodXyyHzNTjEma3Y+yCYvSwB4Fq8Yv79PIzXyIkg2uWx0VsOhlJCFAc95U8JEFeyqV+Z4xslNatCf2ipYZHsZuUK3BIjaMVDX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745211229; c=relaxed/simple;
	bh=esGCyIkd4EUK7vM5j0R43Wd8DyNYG/z7J6VI2b3aoTI=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=K61uPlXj+pM5nJEJFVYC9W0kcMaNnfFEoR3WtoXqDpm4nUlIIcXoAAXvL1Uw1GTHXZAU9aOlWPETgzIQtlF7A3nmg7HJyGfNXqwvldJA1BDCawbA9m8ggsoWe7hf70atzagpzbpLOuCSBIkqtyIf/Y0bXmtwCPZFGmvwmEijmMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-philosophy.net; spf=pass smtp.mailfrom=bit-philosophy.net; dkim=pass (2048-bit key) header.d=bit-philosophy.net header.i=@bit-philosophy.net header.b=SFgihBy6; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-philosophy.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bit-philosophy.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bit-philosophy.net header.i=@bit-philosophy.net header.b="SFgihBy6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=bit-philosophy.net; s=ds202411; h=Content-Transfer-Encoding:Content-Type:
	Subject:From:To:MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NERvz32ItMjU1ZS5Cg4fBSBJTy1NRzvnErZ1/Wok3tk=; b=SFgihBy6Rs2qwnLwpnOudY1AEr
	424sN4uzCZg7JJlFedwy4gweWZYCMknjEJP2niqQNPFoDj+Jaeot6P5T8kbICnoz8WcXRSEwCM+tF
	+9W1hV7ePIJGnBvVYf19FWADy3nVbPjfjslIszVj3thKhfy8fWSbOGA2OL3VmgmOHKeZnVmkrO9JM
	ZaBPHRVxa/gP9iokenk4EruxgD4Hw5wJGIO2vKlMB6LbL2eCN25ZSxSSg4kRnY+Itiq85i9sBqdOM
	oHXOzkpnk62s7YnsYq9+O/iOXEFLlR59ujf6Wedl8oJ4RjDVqh7Xp/glD/vzqAJNpAYeu4EfeNKZp
	aX9zrqFg==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1u6iv8-006ife-UY
	for linux-kernel@vger.kernel.org;
	Mon, 21 Apr 2025 06:38:15 +0200
Message-ID: <1361664f-e819-4b36-8897-b60008ae1b82@bit-philosophy.net>
Date: Mon, 21 Apr 2025 06:38:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-kernel@vger.kernel.org
From: =?UTF-8?Q?Ywe_C=C3=A6rlyn?= <ywe@bit-philosophy.net>
Subject: We Are Taking Over (was: low-jitter, fair pay)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Being with the low-jitter concept Bit for OS design early, I did a 
mascot project for this, "Bit Star" as is the main goal of many in 
culture, and went on to solve the background philosophy for this.

This is now solved. My webpage is nearing final version, and Ail is the 
perfected translation of a'LLA. Meaning The Teo, as a'LLA (aL iLA) 
indeed also means.

So We are indeed Taking Over, with this.

SUPPORT!

Hail Ail, Master of All, The Real, The Right.

Light!
Ywe.
https://bit-philosophy.net/
