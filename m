Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54251F03C0
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747153770; cv=none; b=j2C0CK/t9uWNsbizjzLM5xma3mz2+xDQGCxklX4SfJvMzYPpyVWfqdR1EPD+Zyx5MWJwKeUjNXVo6XiBl+jhcEdqwGaY4iimN0au2fuLyNbhh4BNPQTm1ClL6rDsc/f8fbvpyLAPjYuYNYYSv4clnO1lsC61ecSw1snAeoCgdfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747153770; c=relaxed/simple;
	bh=Wz5mmErVL8kyoqxU+DrKgiXyNoq+Tu8SSQwzSk4uhZw=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=a1+XdhhVJYnQIYNIkz+hFjpOg+TAiYp91CvVBxd3gjFRsy8W0JGvA1LU5SyZwDJUqERdt9N096Jt7QW+39oJ9GLraabvClxZaihX4y7NX75Y06mH3bn2/D4RgIiAyxbxMEwZz7V/nbVO6Oc/Iz3D+VF8FSYdyMQm7MfY0lROt3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-philosophy.net; spf=pass smtp.mailfrom=bit-philosophy.net; dkim=pass (2048-bit key) header.d=bit-philosophy.net header.i=@bit-philosophy.net header.b=d1jmPq1j; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-philosophy.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bit-philosophy.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bit-philosophy.net header.i=@bit-philosophy.net header.b="d1jmPq1j"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=bit-philosophy.net; s=ds202411; h=Content-Transfer-Encoding:Content-Type:
	Subject:From:To:MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cPzhfRlBKn6BmG9+KE7ahSkiVY3ipElHtSJR/r9wmlI=; b=d1jmPq1jF5uqeke9WVXRkCN9xW
	AZHh8ZWyAASQoh5XB5Rr2q8ZwbHdiIu4hnOsyZbYtrxxVj3pM1cKd4ssdA/eM5yTC+xgXmn+g9WPA
	SiUjyfoPnUS/kOAU4uIXA6V84gngpTzTZqBHkzWmMSgVFbXS8TzCi0O4HmvvM9NNNRYRKcXa9EDZ1
	QCse9q2wimK7iEwtrAmIhnENARSw90KmDZZHRQ2cISAcr0MXjFE0zej5/D7DeWPiwSf96kYqEhxCR
	E+xp8OzbT8EisiPPW0Iopff2RQeqGp+o4OpJhhlCnHv+zNUj4pmoHwOlVOyJb0r7uwk6HoHLTSZMg
	IzOzlbOg==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1uEsVL-008q9L-Kp
	for linux-kernel@vger.kernel.org;
	Tue, 13 May 2025 18:29:20 +0200
Message-ID: <85fd0eb4-ee37-477d-b5b6-58ba38f6d889@bit-philosophy.net>
Date: Tue, 13 May 2025 18:29:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-kernel@vger.kernel.org
From: =?UTF-8?Q?Ywe_C=C3=A6rlyn?= <bitulla@bit-philosophy.net>
Subject: Re: Bitstreams OS, Bit and Ram (was low jitter, fair pay philosophy)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I´ve talked about Bitstreams OS, a low jitter take on Open Source, based 
in fair pay philosophy.

A lot of Open Source is actually about this, since the concept, Bit 
inspired Linus Torvalds and others (Debian, Gentoo). And I have 
reconstructed the concept Ram, of his influence again. (for instance Red 
Hat).

Bit and Ram, both takes on an optimal O'S, with inner loop optimization, 
and userspace code compensation and API. (This is much according to how 
people are so I have always agreed with this).

BCPL really about Bit also, and a recipie for the original Unix 
programmers. They seemed to want a "christian" OS though, and separated 
from this, thinking it was work only, represented later in the much 
critisized Terry Davis Temple OS.

Adding Ram a a design concept also phases out this, if anyone wants that 
angle.

I also did look like "Bit" back in the day, and if you look like Ram, 
you also will be more in a role like Linus.

I hope you enjoy my information.

My research on fair pay philosophy can be read on: 
https://bit-philosophy.net/

Which I am very pleased with. After all this handles a lot of finances, 
computers being a number cruncher!

Light,
Ywe Cærlyn
Abbed
Bitstreams OS.



