Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB8A80B;
	Mon, 14 Apr 2025 11:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744630290; cv=none; b=jhqSgsozYGtxn6zX0cK4CdIWusmsO6KV93pNJ3ILjiBNtXD7FXYWNEa0IkIY8/fXcdVvNb/p714dSZ9LGWrhKf/+5HsVm4pjAkaAEA0hTKheo4gGD51jJB+cTvsKqpgX4XP0D18GeKzz+IaoIOXhLtPmCyv35Wnkb/0eGbt/Q/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744630290; c=relaxed/simple;
	bh=WV9Lg9KdigyCbT3yAnkKOwQml4wZ2a5JUT55rNq+EBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c1sYMt6+IlenOXeS7RIIaoe/hear//ZhLk82z8Y1cCPRZ19gO5w1DzH1/hYb2UOkGRK+BuF+zRfL1Wb3tNS+v0gLSbWOlKj/CENel+17vHNuYOAWUUm06rZr8lZZK2TOqn2oMPBQJ/ewXukTCnkUEh8J9oMyRuli7px+RrDHQZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=fpv/HNql; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="fpv/HNql"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1744630285; x=1745235085; i=wahrenst@gmx.net;
	bh=WV9Lg9KdigyCbT3yAnkKOwQml4wZ2a5JUT55rNq+EBw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=fpv/HNqlhCOIIV+L6g2rYC3hBhJ4RrFqYJ6ssDcWFyGYhyty/yXXEOiLoHSaGlRa
	 WIriDO6v+6xT+NCCMdo9KggawMofuKJHZWjdS/ACzyMYJ6P/CT43OLZBqOWuZ04To
	 Q5tcdkQqUatn0pJJNwY0AowZ2f27l+cr7Nm35DgxA/6G8Ek9Cc1CUU9O+3wb/c/ND
	 FR5J6Gz2bB+ZtkHaH2fwThxwSu1CN4Lv/0oQlwxX5Zye7dVs5zEOJMbdR09/FNU1n
	 sc3bFdr2/EahHNOnnURNd49KhkIKX8sXesuvYZ+9LHNIGpS0/apiEMVEhhCq7mFG9
	 x17/ShgI/CPn3D7iyg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.107] ([37.4.251.153]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTzfG-1teKw31g38-00TEdY; Mon, 14
 Apr 2025 13:31:25 +0200
Message-ID: <f49d9b14-cba9-4ded-a10d-ec6372ec66f8@gmx.net>
Date: Mon, 14 Apr 2025 13:31:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/13] arm64: dts: freescale: imx93-phyboard-segin: Drop
 eMMC no-1-8-v flag
To: Primoz Fiser <primoz.fiser@norik.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 upstream@lists.phytec.de
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
 <20250410090251.1103979-7-primoz.fiser@norik.com>
 <254efe04-09c6-4225-a869-126026642091@gmx.net>
 <ff6320e5-1c83-4cab-9cfe-4df6877952b8@norik.com>
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
In-Reply-To: <ff6320e5-1c83-4cab-9cfe-4df6877952b8@norik.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RJMvt0XB27uGQoIAY1JcgwIawKHcjRmeMhIV+Ei3Y6S4Smqy6+W
 PuL35heCPSiLeXcFF+iwlZuwZ+o/6gegVV/4osLZb3EqRt2fgZfGevz1TfAlr0GLrhf4f6G
 law7+oeSYNDNsE6Z7Ng/hPJgn4rYT6CXk4gxZkHrhAzKjSlJf/ycU2rcKw3+XDCMK2hjOBS
 cK9NiLg52nqnUBangI/lg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Sq9ECAB1CuA=;EL/Qh00jqFz4J9tOdnZbIe21BBD
 BZlD0MAxetKSkBjremEzYHqESgva3XCyd07jM6AX4ULN0WoDXcc0yOE+00cVpptMjg0xrsGky
 WfkHGPwL+plNkkF/MmLVarzfHsnk7c6+zNkeT5LB+p0ir9zrBLUn/gKYAm5U71PoF/Mc0OKci
 QtGQbP7na+3f+7+ybQwDeYE9AR6Ivr9R+JVdzby+ior8LzZ0COtYBZvJi4eLwoH/kDVRu6zYJ
 kbBTcgQfQA2gkZJbwNqBk3LjFo5HTGw176ExBgZ4oYYBYBtK91f5KPfSC1GlUdafjyi3Av0Fb
 OVMezs3t078EnREeha0Igp8wgeJk0OKVIngnYdd1YtTdzh/hRrhDWlpcfLTM3jQDtjue72bI3
 xsP3ICHq+VBa7/2fRwLMJc4YHFvd22qrQCHMigYUbLlrvmIDk1YwDuR95b08tXXff2eBNQJna
 9Mt6AOPiSaCKadqGWdUP9IrKi7an/S9/tN66AtYecPH2s0wSmj+sbsE5doIvNsGOUmnX9xYOp
 sEKfDX0u/gPcl6WcvDYe/WnkZVTEhLsGgreInywB8xFcThXJm5LHNm+injQZrSPFi99T73YFA
 Vi1jNEGfomT6+iAIUnUJS0jlEGmr45cy1iGDeju4+X5qQfZHdMPMk9tHzfWHoESlGf8n08jhc
 rBmq7ejA4B64G2TfYCvUUXkVYKK3ZRuwH5WnS/wpXGv4KWnuPBFCoBMf4qBDI9VVHAFQGDROe
 dldCQJi0ooV5wKa35/CkIUnDHDkZjZ/Fbrui773iK+wLCqdniOoFhe05vbhSBZ/g2VEcP7vTa
 OioivQMUmh+pL+KUQqMklwjiJpLj5xVSfmasAsLRPxVDnZgyAlkSWNiBubdyKvjxKmfdRBX5b
 yn8xEXJCBQsq1JrIIszTZLKS8v+P2nhfR2Tb0wnmKcyivPIO8Nfb9y0/QtgUXMclWdtQqwA3P
 jf+ueU9WUwAKJ2ltou5oUKDm+vjlZCEECwcLfzRPSN48e9e6UB/coT4Vw+XbQYZzCSWPqzXkk
 mYpuS2limVWmT8Hr0lOXGvdBBDWtDrh+oX3JMRnGUOlXWzcYiXH3ezxxQZ+Oh+LGZsz0+4o0L
 GeBCVEWtHOcMiwNKctrD0DcHSPGkKIH9w/Tggp/C1Kmj3y2MnqkUFGFvgeX69/aYDBCkZAN6S
 O+zalLEe05ZCY33xMsw3wFVdpirbqnM+L/QECrFsjUeVOS2IHHO+EWyQvH2XpTCtM/ibdvrFX
 QQie39H+ZljKQhZifrkE/DFhFStxKiKERdoqzoPLUieBP/aoc9Q1qqN1UBA1MQVFqwusgrmxN
 rPEKCgqQAg4q+zhCckSB4NKTT/B1EjBbf7VaQ9pyXUxO0ZZmtS1IwsZJgvaVxVeCIIYqMbHrB
 OyA605Zdrt7wsQ62AqoLZ38eUBKOxecQVPNMlYKWBwY40ggQ6hDAsJoDE+sG7R5CJnvkfRIRY
 44USwfcMyssmNErD89XvfaAXhf5Q=

Hi Primoz,

Am 14.04.25 um 12:39 schrieb Primoz Fiser:
> Hi Stefan,
>
> On 12. 04. 25 18:23, Stefan Wahren wrote:
>> Hi Primoz,
>>
>> Am 10.04.25 um 11:02 schrieb Primoz Fiser:
>>> Drop redundant 'no-1-8-v' flag from usdhc1 (eMMC) node. Flag is now se=
t
>>> by default in the SOM include file (imx93-phycore-som.dtsi).
>>>
>>> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
>> i think, Patch 5 and this one should be squashed together.
> I intentionally split these series into SoM and board related patches.
>
> I see no benefit in squashing #5 and #6.
 From my understanding both changes belong together, because you=20
actually moved the property from board to SoM level. Otherwise in case=20
there is something wrong later, both patches need to be reverted.
> Also, I already got Frank's Reviewed-by tag on this patch.
This wouldn't invalidate Frank's review.

Just my two cents
