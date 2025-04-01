Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C391C6FFB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 07:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743493081; cv=none; b=gSsuMAahp8ygvU4nJu3KLqEt+BKViShb2i7t8VCxWy+nfnOOTij6BQaBhBpK0pSUIf0+lQfrtE8/2+qMmB+BJhcU+B1Wo+XDVgWURFnVNr4d1ZfO/fyYpu3EZ0kHP4A4OcPZ9eU2UoO/XWypfxVHWyvY+F8pyAPoTTIqCMWila0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743493081; c=relaxed/simple;
	bh=lZ6ilgd+d6KfG9lOxFSFTm3CnNKt2h2pPE7ocZRUsd4=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=kDcC2PlFreUBso5tk2xloo9J0T1B2B628bPQvG3QPOpTYr/PyXs84Z+uYdD25Xdo5/7Mp86hz2pcsg73Td0Ni59Rt3QTweXMJeXWhsAWPbiphnx/rEnvLSAbOLsr2i2nhZvIw+dXVM2l//S4Uv26m6aks/HNV8bKi7porS1BPMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=TRURDuB8; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="TRURDuB8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743493072; x=1744097872; i=markus.elfring@web.de;
	bh=lZ6ilgd+d6KfG9lOxFSFTm3CnNKt2h2pPE7ocZRUsd4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=TRURDuB8XuAeNfRoBqN8GowqN/SD2xhR3YnrweZTGFOPOpQBfPb4s1bNtHI6pkN5
	 rAzjJOynuBfZpUC00AOPLQld2fYvvRUvwYZydXB4KYIh18NGriYVsREfLAIXOPMW2
	 NuQdNCzsHEedxS5Kfx/FsgN0mtKKIFuvib2UjYDBfowDxBD4OHGHoB2Gb4qohQA+C
	 P8z1lPc4GkTWxWkWxP+Q9JDaUPBnr+GYfOtbABZVCQu0Hun74SH5q0+OPKuZy+Ur6
	 yMa4rSd33NnJltam/MZLNmgevgI9RNn+T947G7wSgZI8GVSjafjyqCtB1zE7kSLyb
	 l3qi1mSqjkO7OKzcgw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.54]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N1uAv-1sxQ5p2UZ7-016DUR; Tue, 01
 Apr 2025 09:37:52 +0200
Message-ID: <0325e399-42e9-4744-837a-fcc7fb3f6787@web.de>
Date: Tue, 1 Apr 2025 09:37:51 +0200
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
 Bjorn Andersson <andersson@kernel.org>,
 Herve Codina <herve.codina@bootlin.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <20250401033935.17617-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH v4?] drivers/misc: Add NULL check in
 aspeed_lpc_enable_snoop
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250401033935.17617-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uBUtwrdW9UP/4MafolPA1rdm/y65edT5dtJ5kT+ZActg0X4du07
 IxCOyZmo6MSLsdXF379CVK7lNSjb5eXLgInBPlvgRTHSeXQ6U1GOnb47T7zdYzTWRdY0JqI
 gOi8MkOzsYvHetZtp4r1F1fTtasV8NobFFY8vSkIDlzhEIFWPWn1Q6XUwxVYygmziDJNHGN
 OdBdXJQrr6VurIKS3s5JA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0osCmIXyPyc=;c7+bBTwZNL5IQLeFLOuZMLvDygW
 EQg8bchrYLNMqmczPwg6eBhHE3KcMEobAkDC4yb51d6m/cFlqLC7RLudl9JuQb98f8A+Jf+tj
 rmP14N2XGC0pvXVxZxUL5m5bwQ2jnjNr83dSl9ga3/wk8phKDpDIs1KxkZvpLf4VeG3Qfg/ZB
 OQlhhguO4lDGNpznkrUzrL0nqfPUYXDfY4Q/zViS075S23ygWXBfz+eozbkyx0/ScVr8Vljyz
 npCWu2r6mf57ydJH9ni1gSou16EMhAOW/pquIsx47/x/vbuAjNBdqZekOKHBA7UYXNEaAyis1
 UT8ZInSkA5/kK7qKkuhdjjnq2QaNgELfirBeh7M5EItKt4UDWTmuxvxmU1ttPMe98l1DO0gW2
 sQnUE3ZbODLD4aqjYVRMPEQykXX95wgzCGqnmcgf2tS+T2eK0zSXDizFWsNbXq3PvNrxQRDoR
 dGac0Db8Uco/Cw+7sh6Ld8WYgPJY1LOvTuk9tAu3LEvkozcmOQA0yVWJEtHH+3srKAPyLKfAq
 xcNGslzzS4+Pj1yLX6DFefqct9UpsyLS+RQ4lPaBuW295cirN4ZyUhP4cfh0zE7wNL0yCGshR
 3DplK+W+D8IobWxvgieeB0KjMIk9eZDtPvCl4JfwqWAsifEjItAJXYHke5sZSRqf3obl+OK6q
 r4dSk72hAEoFahV4KpHgfkVVOBelS8vQJ9duiM/gG+jyDFGxZOSlnkEtkvy38J7yLZ7EjnS4s
 YLi6ons5cfQVCby1mgA+CXsy5Pt5lmmHRsmkzT/UPwDFh/CiNKU3gMQ4AuR2TBcTdXa+a4MwT
 F3lUR3bpQQR/Z1InzJ8UA2+wkUikbAQAYP88b2PmKrI8DY2rkfBzRqg5tbpZdYVzBf8RUaGoY
 wSoTS1Id31IF0UitT8x+8Mcen/mwniXSJWolm5urot0PxlrDo39LiNmRCfe63iERncJMq5zdt
 U3fPpXyxvkSXBYYrO0XE6PTLzPsE56OwBcLJiNkJwxEs7+XKHewVSfoqyrtW5GIJ/ozssVOuU
 YS3FpllobxkxsMIZiopxeQZTFMcirYMFT73cIlOpcEb4lO3OLY36eqHAQrzEMW13N1Gen0N4C
 mXZGqbpJ3lBOw13HenFMC574TkZZ5WhHCubL0fpcj7khJx4V5aOpEwrGeCnFwZJazFXtpZlGz
 yT++Sp6MuBebKowRmWZeFhcSg/ZmPQjKy8cxm8X5cVnKWc4E5y5RiJrqr1VQyyrAHO6BbsoVD
 KJa2+4oyDbMCLQuhFN9IFuz/FFQD6q+InoQoH5QaZpDYm6z1Q+vauZ4xp3BQ3p4ckhxEQWcFV
 b7OTCUrIDkQ+85AuKDcycDdjKXLDVQYQxFegCuLZT/9yF5NZUGWKPi2hTa4wvc2vo+HzNEs3k
 btB2aANdFvDZRKTKlQuWs+ESv4kOnYN+/uuFtE+YTkS6ASQq8X8Cp+pdc++ExcqDMzGJbKbxA
 /gfhQSrl7TNE5jEona35SDluZ+Wl0F91H+uY8mfFtuex3xWv2

=E2=80=A6
> ---
> V2 -> V3: Simplify =E2=80=A6

Is there a need to reconsider patch version numbers a bit more?

Regards,
Markus
