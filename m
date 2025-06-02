Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAC5219A9B;
	Mon,  2 Jun 2025 17:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748884631; cv=none; b=UEM8dmNqIRDeKeMOPeHCqGfxSyi+4zMeTgDwAZaQA2OuWx9tvyyVkC1DkoHHGzVf8td7+ahyvm/4/KbL7oULDEtKB1UAWzBPatuuhZHnAs/VrV2igi3Dpe1InCyYnO73hldtWIm8LADgkIix1jSbvQKNwk4KlP3Z9vs4ILUc288=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748884631; c=relaxed/simple;
	bh=h550fCfTltjqsv0qBuski4X0DvmlcPysXPBy1Wek500=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Evj94/Y4kxp6s3AZ+IXxGzo4yev6hSJUgTLG/LwGgbbAWTEZSAgEFmRCB+Ho7s9wXbBP+Qk6yq8QRMLPkLlmnf2vDJLSQpDuCZnaQi0rk0rNmQrn8dL4iyfF2n45JpW3g/Ybl5TC3fUi684mz5WU//x4RtFsGZ19in4+eeMrhE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=kpuUOO4j; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=kpuUOO4j; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="kpuUOO4j";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="kpuUOO4j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1748884628; bh=h550fCfTltjqsv0qBuski4X0DvmlcPysXPBy1Wek500=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kpuUOO4jbcDLwgUM9LkrM00QElHiFJBp4l0Lr5Cw83PZGQUCTEMvFHKRuDmnsafCk
	 xfbza4qUib1JqFbJ85M47DKIFRVFgbH9/FEaHby8Mq7gwIzveBqCs4m3+YB1RFmuOw
	 5uPJW7AvyZHpFdZZU9O6PYYLILE/VuRcLgYhU0ac9RdohE9Hur5VRJl9KDjW938KQr
	 NTRaz7zZs4Mw1uI1mBNMqXfnhIX1KalF5WNHdGuEGSr5TTfkzobqySPS3tN4ERF3c9
	 +yYsEJ75iWIjdBfs4rKeKNn0fhD5A728wRdMHXWeqrlks16WDxiofAPTK4HndVEAR2
	 EJUizIRA8F5pQ==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 171053BE084;
	Mon,  2 Jun 2025 17:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1748884628; bh=h550fCfTltjqsv0qBuski4X0DvmlcPysXPBy1Wek500=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kpuUOO4jbcDLwgUM9LkrM00QElHiFJBp4l0Lr5Cw83PZGQUCTEMvFHKRuDmnsafCk
	 xfbza4qUib1JqFbJ85M47DKIFRVFgbH9/FEaHby8Mq7gwIzveBqCs4m3+YB1RFmuOw
	 5uPJW7AvyZHpFdZZU9O6PYYLILE/VuRcLgYhU0ac9RdohE9Hur5VRJl9KDjW938KQr
	 NTRaz7zZs4Mw1uI1mBNMqXfnhIX1KalF5WNHdGuEGSr5TTfkzobqySPS3tN4ERF3c9
	 +yYsEJ75iWIjdBfs4rKeKNn0fhD5A728wRdMHXWeqrlks16WDxiofAPTK4HndVEAR2
	 EJUizIRA8F5pQ==
Message-ID: <09089071-57fc-4495-b6ee-159c59d59650@mleia.com>
Date: Mon, 2 Jun 2025 20:17:06 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] dt-bindings: arm: lpc: add missed lpc43xx board
Content-Language: ru-RU
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Michael Walle <mwalle@kernel.org>, Fabio Estevam <festevam@denx.de>,
 Markus Niebel <Markus.Niebel@tq-group.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Max Merchel <Max.Merchel@ew.tq-group.com>, Tim Harvey
 <tharvey@gateworks.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 imx@lists.linux.dev
References: <20250602140613.940785-1-Frank.Li@nxp.com>
 <618490ca-cde1-4e13-8638-f5cb65606c6d@mleia.com>
 <aD3Lg+LRUThzm2ce@lizhi-Precision-Tower-5810>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <aD3Lg+LRUThzm2ce@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250602_171708_116346_A318CD15 
X-CRM114-Status: GOOD (  10.94  )

On 6/2/25 19:04, Frank Li wrote:
> On Mon, Jun 02, 2025 at 06:34:14PM +0300, Vladimir Zapolskiy wrote:
>> On 6/2/25 17:06, Frank Li wrote:
>>> Add missed legancy lpc43xx board compatible string to fix below CHECK_DTB
>>> warnings:
>>> arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /: failed to match any schema with compatible: ['ciaa,lpc4337', 'nxp,lpc4337', 'nxp,lpc4350']
>>>
>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>> ---
>>>    .../devicetree/bindings/arm/fsl.yaml          | 23 +++++++++++++++++++
>>>    1 file changed, 23 insertions(+)
>>
>> I prefer to see NXP SoC powered boards under Documentation/devicetree/bindings/arm/nxp/
>>
>> LPC18XX/LPC43XX SoCs are not Freescale.
> 
> Generally, we don't distingiush that, new s32g chip also in this files.
> All nxp/fsl was maintained by one person and everyone know these are one
> company now.

Well, my concern is actually not about the companies, but these two SoC
families are totally different, the peripherals or core controllers are
all different, it makes little sense to mix them up.

I won't raise any questions or insist on the correctness of i.MX placement
under arm/nxp or arm/freescale, but NXP LPC32xx and NXP LPC18xx/LPC43xx dt
bindings shall be put under arm/nxp for certain.

--
Best wishes,
Vladimir
