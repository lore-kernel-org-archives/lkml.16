Received: from so254-54.mailgun.net (so254-54.mailgun.net [198.61.254.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD9178F40
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 21:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.61.254.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746826852; cv=none; b=Bz1QZljxuQiTiygnLhOyuEsHy3Uyp1B2WGuaE69wdekE1AW5fffGuPzNmymqHju8mUUwEgBaYLT/ZCbnscYi9rsUdyQjfMl1VYa8d0YofYYTUB9vOglb4MsjWTxKNJPpdoBTxyzlwFZa7KrkqdevfcGznhFDK/XEHCx9HIl+UPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746826852; c=relaxed/simple;
	bh=k5myEa1ADK5GWemaehwJSNJabbqTadbWxBF7NDRtz+8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cK9RLuq9trEsvl7QaOdlCvzHIwbpWUfVe6vFmZU+c7kcjv4XEBuKL7eWU0abfXD1qLq161WbNLCZR15AD5lkrK7foyNM7QgAbrru64tvtf+9vJV/XUNkEn6DQUl0JWjc0LvhQLqEMKtartl64Cd9T7M8Yz/j8ZNbfjzij69YlmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rarity.fan; spf=pass smtp.mailfrom=mail.rarity.fan; dkim=pass (2048-bit key) header.d=mail.rarity.fan header.i=@mail.rarity.fan header.b=Ms7nytIo; arc=none smtp.client-ip=198.61.254.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rarity.fan
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.rarity.fan
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.rarity.fan header.i=@mail.rarity.fan header.b="Ms7nytIo"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mail.rarity.fan; q=dns/txt; s=pic; t=1746826849; x=1746834049;
 h=Content-Type: MIME-Version: References: Message-ID: In-Reply-To: Subject: Subject: cc: To: To: From: From: Date: Sender: Sender;
 bh=k5myEa1ADK5GWemaehwJSNJabbqTadbWxBF7NDRtz+8=;
 b=Ms7nytIom7DfoaQX5bWcwwCdlsMGhGsErymAyb420coI1ygUdzyLYd7SycWonqGBUlvnpyeFfSIYA/lKZNEqT4IQZEgCDGQsoi2SQltQz6JgtO99iYDRAscugiHSedD+MslPrbHUxIOdKWJTxbw+XWZ6U0eCKg4xUHzfRQ3c0BNRCOPxbToY2QYoQr23HNN3JJ2E1Zs8JW2pP2UakqqVzcQ8Ci+FitIgPR+HajosrnvBuGKIcaXSR1/j9NGvNIOhL7Od5EjV9SwlIB4WqDIRgnHOss8WgLO5En2ABI0Q55pJI8ZjfNBv3M6hVT847W4AJhNbi+e01kJaRt7U62BDMw==
X-Mailgun-Sending-Ip: 198.61.254.54
X-Mailgun-Sending-Ip-Pool-Name: 
X-Mailgun-Sending-Ip-Pool: 
X-Mailgun-Sid: WyI4MmIyMCIsImxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmciLCI4NmFiY2IiXQ==
Received: from 95-37-246-49.dynamic.mts-nn.ru (95-37-246-49.dynamic.mts-nn.ru
 [95.37.246.49]) by 4fb5f6173a4f with SMTP id 681e7661f526e7728ef879e1
 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256); Fri, 09 May 2025 21:40:49
 GMT
Sender: me=rarity.fan@mail.rarity.fan
Date: Sat, 10 May 2025 00:41:47 +0300
From: gldrk <me@rarity.fan>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
cc: Linux ACPI <linux-acpi@vger.kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, Bob Moore <robert.moore@intel.com>, 
    Saket Dumbre <saket.dumbre@intel.com>
Subject: Re: [PATCH v1 03/19] ACPICA: utilities: Fix overflow check in
 vsnprintf()
In-Reply-To: <4994935.GXAFRqVoOG@rjwysocki.net>
Message-ID: <28f7e0-e373-8f25-e691-a1988852d8b@rarity.fan>
References: <12671029.O9o76ZdvQC@rjwysocki.net> <4994935.GXAFRqVoOG@rjwysocki.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII

Signed-off-by: gldrk <me@rarity.fan>

