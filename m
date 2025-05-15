Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EF61B0F31
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 10:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747305103; cv=none; b=VE2uKouB1SjRyLGl19BdZicUngkigAWFjr8W9ZqNunJ0FF2OMUHohVwaeGyQgee+iMBJjMxvT36uznfd54VZ0SZTUzF9eawRy0xDzKS8rKA8n+xXwMRAjm+wN7iyXau+QIeolrHU3hHFMLAX696hZ0niSJrfiVOxCgMzcv7FAu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747305103; c=relaxed/simple;
	bh=MaJ7Y9DNLBJHqz2iwf8vuXiz2idHbIlV+STRZdJtal4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ldY+JsuWAa6BcZ6aTnLMAv4jdKSELCzVenlnd37Dn95Uj4ZSEJmU6MU2+flo+RxBI6kEfRtkh0dI3yR1ZPeTbcUKHYs1lHuRTGpImzmoZOyPyerxa1YHC4ROTOkjLD5EbVj0H8+55llrSLQY/eJEyig+CftNyyER0P0MLqU1g0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=dsfPGV30; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="dsfPGV30"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1747305099; x=1747909899; i=wahrenst@gmx.net;
	bh=MaJ7Y9DNLBJHqz2iwf8vuXiz2idHbIlV+STRZdJtal4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=dsfPGV30oSsdt8DZK9TzJiRcztkhYW0NQ1bytPSHXBgkAiVvH0cTvi59JITj7KQO
	 ROAW74BDcN23xycje2wA7O3B2Xgk92WOjIU2NlGJcLacBqXvIpNEuITth8vCicBRZ
	 iBMXK76jvSfKt/dEUpS+zoLw2D/vkY0wUOoK471trwOtFZ23ssgvXW5w3n08mubNC
	 cqL9LBdS9Ifr9IBf6YYi1Dkvk5GPJttC6usB3xc69wEjk8+tT8I/g9QScqK9cBb6z
	 cQTn+qWFAYmUkBtN8BizGHWv34eIUD+6tzNj3rjnv29TW5puEWwR2OXEjOGWnMpI7
	 YiMp9tts10WaftrqXA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.103] ([91.41.216.208]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1ML9yc-1uXaiu3SGA-00TL4t; Thu, 15
 May 2025 12:31:38 +0200
Message-ID: <cecda824-4f47-4e4c-bee9-1a59cd5d801c@gmx.net>
Date: Thu, 15 May 2025 12:31:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware/raspberrypi: raise timeout to 3s
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Etienne Buira <etienne.buira@free.fr>, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <aCIiEp3CXD2o9dTw@Z926fQmE5jqhFMgp6>
 <048fd6c5-9f09-4c06-9a23-e5821dc291d5@gmx.net>
 <aCWMrJcldfrsNTQq@Z926fQmE5jqhFMgp6>
 <ffeb860f-5522-4130-ae47-45a6068b17ea@gmx.net>
 <aCW3d7tc27Awj62K@Z926fQmE5jqhFMgp6>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <aCW3d7tc27Awj62K@Z926fQmE5jqhFMgp6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:/CmywX/7VEU2g4QZ6teXGi9GSuMycuTIstEUAYqzgsm6EqnZbFv
 8UF5g624CmN772vtHKV7lX7f9cHZLyxZyeHESGX5jNx6ybI4VrT4+lXx74hFg05tYXRubSc
 AItcDSmWUrZFcHz3qUKTPZHc7jeCU/UxjxvLeS/+UC7LANtXY2cSPt3XoW5gM5rlwfpIcku
 I0VyKOfWqG4sUoUpOUu+Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0Qn6iHL1DwM=;bKKb9f8xgBJ6Ei5eX7Nb7JAAiEr
 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
 AsaXGCWI0gOaw=

Am 15.05.25 um 11:44 schrieb Etienne Buira:
> Hi Stefan, and thank you for your interest.
>
> On Thu, May 15, 2025 at 09:42:43AM +0200, Stefan Wahren wrote:
>> Hi Etienne,
>>
>> Am 15.05.25 um 08:41 schrieb Etienne Buira:
>>> On Wed, May 14, 2025 at 06:20:32PM +0200, Stefan Wahren wrote:
>>>> Hi Etienne,
>>>>
>>>> Am 12.05.25 um 18:30 schrieb Etienne Buira:
>>> ../..
>>>> Out of curiosity and because i never saw this issue, could you please
>>>> provide more details?
>>>> There is nothing connected to HDMI 0 & 1 ?
>>>> Which firmware version are you running?
>> Please provide the dmesg output, so we can extract the firmware version.
> Firmware version is 2025-02-17T20:03:07, i also attach the full gzipped
> dmesg, as long as a patch of extra traces used.
> I did not specifically test other firmware versions for the timeout
> issue (but i did for video output).
Thanks, i'll try to reproduce.

Sorry, i forgot but is this reproducible with a recent stable 6.12.x kernel?
