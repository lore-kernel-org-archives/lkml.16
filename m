Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA1D24291C;
	Wed,  2 Jul 2025 21:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751493387; cv=none; b=HZiKOQaeO2jPE8dIyjfF0cyoM9YRcIV1VqNLDGb6FGh16PZFeRVCztuSJHQcdynb/ilRMEoyGhDFswNGrR+3eAOPPMaJTlfdMf2Tb7CmlO509C3R7i6cnAv9Iv3fKPOUsd6ZD5w/udJQs+IPgJYmpPfk9KGbW/1bgxhRAnZqsnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751493387; c=relaxed/simple;
	bh=4fU/Xqk7oxY2MogaKEZwQL5CtwrxPv8uOkGDktPbTs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZHEa6MxvCa2yxlzuVp3QwZLhGyub6fmSLRY4RUjCWwuHtzts6KfNfX8370OwV45SKBKo4lp5rrzwBqc5AAJLqThD8Fygy7bkcCMx37Z6gRjhtJTSS0yuQRcAJmFUWMl7tGgei94n9vyGaThsgtT8FivNvIPOnWHwOMcB4ADD6Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=JgN5qKZR; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="JgN5qKZR"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 8B62DA0057;
	Wed,  2 Jul 2025 23:56:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=3e8ZfmzVr8jG57PEK3YQ
	YM1MaAzpKV6K4dgRXSV1tKw=; b=JgN5qKZRW6ohwswImPvNTLkJthhXf6Ucwfck
	6Hzv9+aTvM784CoQcqC1aMM+cBU6qNquxGNIswE/Ys8PSL/1ocMGup9xEoC2yss+
	skPpRdOH2eiSVIx9w/0czjhmErMt/luUpHdHrL97bC4h9yXKF/gaYwWgDEKCRR1j
	5fiuKain4ROChqGHEirDYj5dU7az0ZVJ+u/6miTU/FC87/PdlFR3NFk+uINhI5Gy
	DqkEFc3d3HU6wfeit5WhBuv/+CsyOsWeHdBJBYop9yPpBQsoimWrj/xSgoonZVGN
	0UCH4/4ehmqMolDI4RYZ1EiB8N7lxjCcBSljqneNVzV1ub+JwwtbKdipbRYr//Ss
	EHGpcm2Yc8BSVTKribB+p9/UYwk7vGi3LyPQ+55MkvADL28VD9fpPIjTl2TbXZXS
	J/y92lMn4zrvgfzEzVBSa7BPsUMvjzembyaesCm6JqIhH3FUs3TRdXCiVZ/98PE7
	50/ohY0LNRfMYJq618ervFxHfLwCg+m8gkY0vLhtr5bh8rDpG/CVmFS9j6SjO7xq
	jokhffH5ArKTvAvHQG6LHn2ZsKi+vD2ceSmeIUfWr3gT2xoVIS0ImTmSa1M1D1zy
	dCUqeY72S0teCB5QIB/OisfU/I6B3JxR8gCSrYPf2o7T/Yusm+fCm5atZ7x1f18Z
	yU7HBac=
Message-ID: <2f628251-5b67-47e0-8038-6c1aeee1ef91@prolan.hu>
Date: Wed, 2 Jul 2025 23:56:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm: DT: imx6-sr-som: Replace license text comment with
 SPDX identifier
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	<devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250702-sr-som-dts-lic-v1-1-2e8584e6c837@prolan.hu>
 <aGWqIzNvSVw4olz5@shell.armlinux.org.uk>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <aGWqIzNvSVw4olz5@shell.armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155D6C7266

Hi,

On 2025. 07. 02. 23:52, Russell King (Oracle) wrote:
> On Wed, Jul 02, 2025 at 11:41:54PM +0200, Bence Csókás wrote:
>> Replace verbatim license text with a `SPDX-License-Identifier`.
>>
>> The comment heades mis-attributes this license to be "X11", but the
>> license text does not include the last line "Except as contained in this
>> notice, the name of the X Consortium shall not be used in advertising or
>> otherwise to promote the sale, use or other dealings in this Software
>> without prior written authorization from the X Consortium.". Therefore,
>> this license is actually equivalent to the SPDX "MIT" license (confirmed
>> by text diffing).
>>
>> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
> 
> As Florian has already mentioned, the preferred format for the summary
> for arch/arm is "ARM: ... " and by extension for arch/arm/boot/dts,
> it's "ARM: dts: ...", not "arm: DT: ..."

Ohh, I misread it, I thought it was just about `imx6: board:` -> 
`imx6-board:`... Ok, I will re-format it for v2.

Bence

