Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8194015199B;
	Thu,  6 Feb 2025 05:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738818629; cv=none; b=LLZplug9wkoxvEE693un3tzVS5FWBYmSnWH/OlFvtOdeYH9nOpBZj+QIzoNLXEyLX61YRYF3ljM5gjglt6gyTZVYsQtQ/t9hQchQfVe9gprWEgzMjxlc0oDIAT0OIYkvDjEfQ3+8P5xWkJLYCa2lIrtjKQAUMpDotXklZJrJews=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738818629; c=relaxed/simple;
	bh=l2fRbC/KyDGRVWRfklYmQ9B54PElxVsWGK7Y7BlAfmU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=HgFZoSI8QNzIaFqinA3JsZDMavUl63JWCQOYyi/6V3aMAtjKZSzw9NrO67pJGKXVpwT7mjxrQV6vevVwEGlPnFle8GfXNCnetLa2AmC4/qEtX3klKhEHGxIpqGtYYX4ONTwh8NdpBJ9GmLisQzimnWIc+T3P0wKuIV87MpgcSdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=gC27h4W+; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="gC27h4W+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1738818624; x=1739423424; i=w_armin@gmx.de;
	bh=QXxQs2r+/obX6urWVSa+feM5gKDWPYKwhY4TuX5EafM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=gC27h4W+RpZtomkNGiDUE15D4eA9hPiZ65/w8zy22c7B64XAZc/fBL+a+kLKvoJu
	 tIvpU/m0D2CUYWBJZDj4wTFs/0uKiNWg0Bhcmrgu/oVtH80H3IDS/4KnGr0H1AwEq
	 Z9neFjC4CFYQaFryUhi777JULg36pa8pZqe23oKcTfmN/skJES0uZ9SkAgxjLYvTL
	 BGH651WTO205w0uh9tWL0utJX0WB6e1tUkqMuO+lzsXlPa0J8g/xqPbPnaAMC7lIC
	 193VY9QFmNefwyEiiJoOpoL9MqRHByMFXerws9NMnrZTEWUsSIF75G7VFQGmCbSzf
	 WLu6HXCodJ2hx/MUdQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([91.14.238.232]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBUm7-1tZ4Xf1FOh-008gUz; Thu, 06
 Feb 2025 06:10:24 +0100
Message-ID: <b88e683e-9c9b-4c0f-9aab-0d3020064a53@gmx.de>
Date: Thu, 6 Feb 2025 06:10:22 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: fenghua.yu@intel.com
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
From: Armin Wolf <W_Armin@gmx.de>
Subject: Wrong CPU core numbers with the coremtemp driver
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:vVNH7tYnWc+jTuZ3lPaVMMta+gPZ0MNMiLHYjpSshOJcphEAi8T
 63jhcK6evTRItH86d1Jhj2WA+oSQ5UpywfBMdj7ag83G2dFOZrOf1fH9yG1a+TZRet4PaLW
 nS5v0xjf2pm3ycSFFNk8yGZKhNProFlNYjcnWO/unFSHeqTehnIUNdHwIxAdt50276i10iu
 NgZNkgxg2apNSSvaYGx1w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7V6b1GaOuvw=;VoJILjbrJSvQG8FUUOqpUbHfLCb
 gcrJxD4fPWTGtUwO36M/UwguJHenNc/Q938ATZ9W0TKEgfXY52HevgVNyORSuSdyaMXNVD6nb
 aCNxNmZLIF98aLwCz3FQhIrchAU4Th7P31mkBxsKl6MqCWdoa8/DgJonaQBQIm2+IssIyLBRf
 HutEdZKlvZMnx3IFLAY+AxGlw9YQ+uBgUkFMU5P/y1DynSc6PAATh6AFVU9wxaOk2yG5gSBv6
 f5m/VhU+SYUP4+iO0uooKUJ/3Kx+5VeR6xiUwxln6r2V1POxpMlOol0ENBZd6n4uw/H0v+Y0L
 SP0u/54mDIdyU6RB17vXCRFEZk2fhvZmCHhZXlbqomY4evLYCUZtwEpDKp7aIKNEd8ABULX8r
 67FGKblAt3qYmjzVPbKMQTVPRKbPFKBpto7QlTmXvy4geiLIhoDHo1lYmIyiDJzmy+nX87VN2
 iRVOq/u9uJnJwk/Q2tPZoLIMqU7/USXuZitFvxCYakWmrmcuThDtl1gSt9Lwyes0n7MU85aB0
 MIzlIzg+xJ/JiU3sjXPtIFAlzvl5BN2PNoMEQRyL2qHaSN8m/TJTHEfpcTLehlZDHd8wEX+0w
 IybZS7CGsVl3b23IopBvKlK6k96QS5etvqtMM6FgTTLpRVav//2bOWF/kE2rSbYMwQCgffftJ
 p/U6VgzaHdhvCNwMmuh+cq0YKSJBLmRq/nmHvgPpOqtAzzJoszDRZmyAbIyPihdx31NUGy3rk
 dheKgonhuE0AEw5qDyLxxH3A+W8Y0RalkLiaIpa7rl5xKjHgHfcu12IItT3nCABQ09rOS9PeA
 Sgl44b1usQ2aAS0aXqfyt88UMsGCEzgCe55Ar3LhsOp5ahPMDAQcL4dGxL51nP7S6aJgzfYvG
 RX0gu9b3HT4q1QI/Ap8YtHk9Ox55N1uX3e0WuWpg59M9KdH+WHjZKJehATanhCYryAsSEpK9Q
 ryohbraMm5g3WVOlbG6QWGdftXIXfx3j64jc3/UYM7lnukY6KAOPMFGP2vCyLjVxjsCj1tW4S
 uEkBDtWmkPS0YnXRsGDOkcZJOVfusutQjChjxJjBNjNbZ99ZZwG4A1VoaJjuViXKyDKL0x8ku
 vwvutd36Qts5wTaXLw/nPhOzaYsdwWVnexmMkflqFa5tFwIHkE35KJqpcKEqsPJzV6g4CGsp8
 fAqcSOcNYdCoRpKbaC2xreU9E0kfLdrEnYVXgiqZB0nAMCH45h7mN3biXEHTl16CNrqJj4Ojs
 lyeVabGbr6TFsVvGmxYQdnI6KHYbTNr/TzqxBMe4iLTu4rQ5Rwf6ONqLMEqmMsxtK+R+pgcb9
 z10c95kbbXwhgHvzRnil40msEcWnhNvKCYvvhto/j+mDixoCO5j5B4i98DewqxetJrpdc6LhB
 1uBlP6XeKxjOU+A9PvTvQsED+3ERd7ZfWqh2KT1uDdrcBK2fQ1O4fpBRCV4VM+0SmBAhCMBBq
 g+QVSEt619GSwRjKV1x3ClGOLoK8=

Hi,

a number of users complained that the coretemp driver displays wrong CPU core numbers on some systems:

	https://github.com/lm-sensors/lm-sensors/issues/486

Any ideas on how to solve this?

Thanks,
Armin Wolf

