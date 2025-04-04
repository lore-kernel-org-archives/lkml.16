Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBACC1F1525
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 13:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743774959; cv=none; b=gqMcuomYCx563YcXVe3Bp8+Wf7UBKu+my2YojgrQRKm+Fhpx/RsrXIddVcCTom5lPwsQGiIbJ5mtK7WA9ccFzk/ZCnpCDb34O0s5tFhn5wGI1hdP6/fMiYm5i1sgRMQu11gMffETcHCA+CbVT03FB0POBQpQGJ40z/odMq4ksC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743774959; c=relaxed/simple;
	bh=YhW4RU+6vE/deG3LJUkjaUwFocjSZEvyK9WxNxRbfmg=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=nTCwa3IWdguSjAmONK51O7QqBmlCHMsLmmwMqiyyE4hi5FgyYz4vRvDDyUvONptTo9IWNJCbmyPW+e4AUr5vpOMTc40c1TpyIUMT95p7Pw14u79IPkK4GOnE8ozwseWdxW/+dVjS85EV7Pet4AXtdyjlk6Khb8Ea9eb5o9JC/30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=n2DUmX1j; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="n2DUmX1j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743774921; x=1744379721; i=markus.elfring@web.de;
	bh=smOHgZ1jrknZ2SI6I6l99hZdhE+VTOKSmGELBfZP5pQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=n2DUmX1j+4I67JMhxiAGpb9AlGQaFT0XDKzInmmSgHuYgOBOFvdq4Y1LrURKeNSk
	 kYfIDQ8wb0MRWUYS7ZCNV5w++GEXC3KOJcJuNEy1yg5VESwvZfVO7IEX2Qo7gpIop
	 dUO2B03I8phU7PvZbvTc8C+S15fKFEvTaoTZhxP3CFsDSxbADWI56Y5Mg6desoBrF
	 7TUo0p0gx9wu8aoLiF56QnujG0i/rMQZqfyO+A9f2NfRM8rSi8KKfdAcSPGCh5L2c
	 qn5dLKKI2giJrjs/bZrVO+pEbY3In8Q1OOD03D6lv7cBD5wBxK5TkQFK2mQ4Dx3/6
	 B6/ADA9E3krmyb0Fhg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.27]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MhFlm-1tVEaJ1uRm-00oidw; Fri, 04
 Apr 2025 15:55:21 +0200
Message-ID: <c5129cee-d15a-4e93-9bff-eff4f33041ac@web.de>
Date: Fri, 4 Apr 2025 15:55:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: vulab@iscas.ac.cn, linux-mtd@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20250403134731.2054-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] mtd: bcm47xxnflash: Add error handling for
 bcm47xxnflash_ops_bcm4706_ctl_cmd().
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250403134731.2054-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xNLrT97GepapjcRDk2MmyzZtlV0J1eidpCqLFuHxKV3/OL6hcJ3
 JOCWm+qBL9ZvGolY4rSwm47QCHatbdpz3SIzzFYOywaJbMgzPIIR5vcNrfpiB8uFR0KD+S5
 Fds5gpGlkQO1iRczqkNlL3qQbXuiqZg8NoZXlwLbNcGFA8P/qVzT+oa+vHzb1vomjoqEBkB
 N/CJSPCBp3tfqMz9biUnQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FYWytivLFOA=;gfmiZmrhN5wUp4f4FVhce6oxUE3
 aW1tzpm7csfJ2df5n0KYbbCIi+m5fpkZAzCQRJQucc+aqBqvbuD0qBXfz3jlfMSmNV2uIw9gG
 utPktisfm1Mbp6TZT9ZrWd4rvX/KV250Lvjd1If8BtrFjUoCNQ2GyWgZVCb7FD3A+mLOkN4QM
 xU9YmozSnDT372CzDY7XwLekhSYgwerwsTG3bDWhjYNdFU/QiFqqNKr3CITtnOHRIQ7rUzdIM
 esjdSxIXo1L+Kr+R6AsOh5wDJDqNQxBx8Pt/KmTpEjhgOLwFFBhyNkkFpBp4YpyeVUf/AHBH0
 MHAe/ZV3B9354tMc392WPPorcnEiCOQwX4lBjO0RkusnQEMkf5YMj/7KPxnIP2R0NYISJWRy0
 TeOr+AeDCF7wPj7a75bZfHsfPkvmAA8sULD+Y7VfQLDfYYmlvNJvjxUeoYXCNXuM7SeaHWb5Z
 +c0sJIP5Gd6frK9Ig1X8lZHKUPTsPr2Q5t7zSAcAbXiXhr/45wGNogFB3NhPqERQxL6eQvPyL
 2IClRpXS5cjfaIXeevysE7RTtsuRWKSaV57wVANBvWKR2WWjwHzu5jEP7jx0fTMHQna8rMdfC
 xZZN/rCfAlbKXHL8Z0ebtAWvV+Cf9pgMAF+qCa5PNzRlm+upnlbBP5AoELaQBKdLO6o4h94LT
 spanzlGS4v5bEIC94dUzqUzEGeGwiQ1lWoLplwkgXouCDJBqyU8MU12EUxyf5PTnxAb0sXxCK
 3hrzLCpqkHHys7emFn+ChSI71IltKcG3lESZjBRrhAk7y4TMbBUnCA0R3By+VBT4jRSoL78w4
 wC1F+jRo9GaPpAvq3pmmtCEAlqyDIk5SFO5LFCZP/4xyHKrC6iixOxLJB6MeG3IaGhGVcEXwK
 ap6MNxUjCfkuor0ZUB9ul7Xbjg5iQOrBDnke/qGKF54cCtAW8Nj41ZvALBVKceIDLUm6L3IfU
 j3Nd6HBJjAzEQ6uNkA5cKAGlembEbo27DwIV92rCoZnRIq2sG8QRTBSpg5ZgZOI97P2cS01y2
 ByU77tDDmKcH933cSJh08JX3XO9zqQffA018CApt545z4yjJGrI3yRLMyfO549uOAswGiyaBl
 iDobTRoZ76rO51LjjSzzfaPcZ03Fkeh/xjXDqB2slrLddyAzflcFmKB2AP7QwJq0pHfJ1sp6Y
 /nyFVzgF+L+KPBwtkP1daOxYkGvze+qDKGiz66YIDXpT+Y7e8nhmsCVGYIeASzG/gF0zZb1Rt
 dzhUHZU6KeiIN8hqNlFKxFtOagZqdUJyROkm+Si6hRD9XNE9iCDO1ufv4V2lfcMZAp4vMksSr
 Hg0dsQaS85y7Hf1RLie+E+hvf61lhcxUjvC72wZFq6JGl5g5rStgs1+OHkTd0fLofKcdmH/BL
 WiIZhfBiZaTTdP5kYBy89Y7kk85o3vkqOr4A7JzpAtdNz+ezcfC/uQr7a+6qUwtq0QsscLDeG
 RctMop0AU0/cf1umJ/+xNAPPcosbvn5AP/ao+2iOjOutvXavJzhBCo4bJ+zaHKMQoZhpi0g==

=E2=80=A6
> Add error log to the bcm47xxnflash_ops_bcm4706_ctl_cmd() to prevent
> selent failure.

  silent?


You may omit a dot at the end of summary phrases.
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/process/submitting-patches.rst?h=3Dv6.14#n665

Regards,
Markus
