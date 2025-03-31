Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89AF26AF6
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 16:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743437756; cv=none; b=SGtzHdvLeUtP+2TApjNVBoY2zBu1YqtGaHZ1TLyw/ji5Cbz7OQIpFKXStBl6okba/OnuiERegHVMA2FfJMpbWIlrAti1TKcapHT80GBbYB7rZtfkIJi+mRm8BDSkqDz5IEh7fPZARhjwi3Uocn2ou7Nc8JyeNQeIq87RTnNetRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743437756; c=relaxed/simple;
	bh=rsNT2EyyVKP7W0jVQKPse/fkZO51TPccG1UPTt3TxbQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=OVQc+WBvCyGIKLqdNurTjhTJ5qDonUg2mZp+2R4e5ADSz7ndkN/b5H6hnqHRfTyjsePTJ2eUDHU3Wy5KIbFMFG7fQltf+cmCXMYgk8ZW3eYSXSck1pkSVs+N+aVg573F39PYgdyPo/J9Cw5M0GpQOSQoXcbLJnVmOIICYzrLQsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=H6mOFW8O; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="H6mOFW8O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743437749; x=1744042549; i=markus.elfring@web.de;
	bh=ongIBo++HFbn0NqFF6/15Jg95xn4PjVawgwlrGYSnys=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=H6mOFW8OD8FstaGCGFkhdJ03x8v7LkcTu/U4KUm4pCi3rt4guHvMf3V/BNf6h1uk
	 KPQCPxc3lH7S8VjLLn7tsmUs5rW7hoaqJOnShwOpwlaOiP6X1EIdLl6JWTO4dmdN1
	 h2NeeUxTpcvshsf170R4kT5E0Mu2MRhsKz9IgrCY663Tm9kFPHiWmmGUlWpTQUCpZ
	 AeaeWVBfyzu7w4emavadcQEAari8nIaIpweqHdhFlm2FIHwdzwCbZ1GptSN0oQo2K
	 IW0HZ6xO/wYQ7X14JrvKzAPCmlC0eaKu/UmlKZHHwydA86F4BtbPQOC3GiW/bIVYn
	 5OuYTr1/i8rEOnaBUw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.37]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MIL4Y-1tvvjk3V7U-00EZdU; Mon, 31
 Mar 2025 18:15:48 +0200
Message-ID: <8cd011a2-67af-47bd-a05a-905eb333180b@web.de>
Date: Mon, 31 Mar 2025 18:15:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Henry Martin <bsdhenrymartin@gmail.com>, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Arnd Bergmann <arnd@arndb.de>,
 Gabriel Somlo <gsomlo@gmail.com>, Herve Codina <herve.codina@bootlin.com>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <20250331154002.14128-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH v3] drivers/misc: Add NULL check in
 aspeed_lpc_enable_snoop
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250331154002.14128-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lYijUOEiHoRB9NGC01Dedke5GNycctJPJmpQkQahVipGe7YJ0+q
 hbLKpicLEn97cVSUWr0mcHqONoddhsJevKtRBS6wwWTEQIZMoXZRTIwnpZznhy5YxKFSrEv
 aG9bVbuwCq/xPV0uR6lt4OYA97ipJpTT1gVPcS4dIG+YE7qiWNAJvPXqVqhFIsN9s6flPOq
 5xA9OFtw/KJ/8Ka+HXLcQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5oG7VCXH8og=;P15nKdTwkUBxynx5MUowVvpmB3b
 FRjy02zxityj2sJk+NqUkCD4kdFgK3chCFghCvQprY841gpT4B1iPmDbt3CBKDFSj4sr6d5+Z
 L7FyuCAtsq1nNIOMo0GGlPZG7fGXQNytTbd5sPL+p7CXjizlWE0ZlYgnFe/vzPiGcqzZUXpSa
 YsmwuMOQ1pVncNaiRa0TtJhm8lmsLY1DVRBRvmohb7BBUv2EX7PlFcBPgP79+BYGPm0YzuZH9
 OrP+xxPZxKfSIspxJ3qxZZp6D8tzTJqs3KiYAqXrUbmiLOnOTzkxYJ3Mr+BBhfa3XjeVaXO5e
 vO4O2uUAF4eNfojJjLbF6MxzirBw+02KGeoLTYLW7C3S1bbHuRTylCgAFy3Yd1M9z2cExFhdH
 9/4kU7N2WZDehcjvwdTexXxJr9Fq4jcFwII1/DWCfiZwgc0K9LV4xKE5NaDg0CWxy/skROK1D
 EhhLGyrlCeKgVQiKYuyw4KnoA6kdlCba3pQOoLS9ly+E8LpdOReQUyVMDixuEVIRd7XP5Eouf
 xNXqqIxKw7HTaJwygubijjNtlNiRPaVCoZfoc1yRbYEsZUthHMw+g4dJrBhBHC2SApZp1RqGE
 QimUsR4AvtCblSmqevdKPCXK972Y1vJ3wZ0Q841z/jwsVuguu0cixPncQs5oihwwTdJEuXQhQ
 NMYLwItlrJ18oen9Qbonl2GZlmjxM9New8qoJp1LyHtm1urZkgdd9AMhPeZCsWJI/uAL7Uv/F
 XGQc5PT4GoWC/uZ20U21bmKtAsQB8BxlgJxjC2UAluLBzUqQpfohb3z+ar4YHWANqIJ8xp5gd
 gScUWf6CIIToIa2c99R8VsimZz1n7o3k9UqoNNcmQbx8n580qf4/rZFJ+bpF6PRcOIiwJO37j
 Almw5Grpb5yItYtBnN3PxAjGGVrMqYec6jLWiIqFVR8ZV97E3niesur+uCcYO3qkGbv137lAB
 0HosRDEQZMtboFp8lLsGfCkMQZ/HCy0WQeDyOpYo/RHwRK3jfiXCbN89NPBqzXLkESRNp1tWY
 Iv3Y0h7bb/+iTZy2JXXc87NWmFuWx/5e9k9kaFVmCazZZBpimTca3GUGG5Tn8zgEv+0HB+OIR
 Q5SMRcoveP/bX8nJmLI1nXqUOBBLI8hizrEtaNf+ffHdd2BvCqePHmYY/wpXaU2nQLdkLiZ3w
 6U/TFqgleP9oBJlM7bq4qsXatAnI+Egk00g4X9fdh6kBCRQ4RbWXLKxqQ4duosaDLT/JDID3D
 mYHBtoXnLlVuwA+Zio8vdN5GtK9FC5iN+qAc5mMyZnzfV/WM0+tjlElLMhARCaoijDVORjxyO
 A3HM+ZLgbHYfkdIlcRNnwxszJeFLlkIbreBB0HSwQRaAT2qaYTKkm2qv1q/WmjS/Klo5JzAjJ
 RRhIrUt4aONDCFI50yCm8QhCwnaVEPf9JvCKSIn6FFTP7DjSxzVomsM9QeWjZhTE4fpEm9G36
 AqVxRT5xIT3bnintaqAKFdbmweB742Qe0fdv9h/35V+VO9kkDpEF8Nbx2ENv/O2Ckjjy8mw==

> devm_kasprintf() returns NULL if memory allocation fails. Currently,
=E2=80=A6
                 call?                               failed?


> The corrected code adds error checking and optimizes resource release lo=
gic
=E2=80=A6

See also once more:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/process/submitting-patches.rst?h=3Dv6.14#n94


An other subsystem specification might be more desirable.
https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/lo=
g/drivers/soc/aspeed/aspeed-lpc-snoop.c?h=3Dnext-20250331


* May the array access be simplified another bit here?
* How do you think about to store a pointer to a corresponding data struct=
ure member
  in an additional local variable?


Regards,
Markus
