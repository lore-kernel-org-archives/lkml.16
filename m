Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E951F1936;
	Thu, 24 Apr 2025 07:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745479482; cv=none; b=PKfuep2jWcWogbRDVtlY/R8SumZjBoDRMinJFvBXNqgRoEVT+ZYL2Ja+B6DqxN6ojUWb9l1P9hDN2xBERZ9WPFHNq6oelGRBq4zyTyX4HQtISDg+VzgebI7Vc497Isi6ks790qWkA3r4+YOHrzppfRzT/hEZ0edyiE4p/0oTsEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745479482; c=relaxed/simple;
	bh=TrAcmBN6lYfQHtdSnYmDwJwiksUZsL1Y2yFtmp2AxNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IRv2ZSssGdb1KP1VcTi6Cd7hgVQNSzczgOPBBYkQoK8zaDwAU+I1KOlII5UQOy2czdxaG0Den3USF1v2BQQQ9vVIcR63OD4uxuXrW2updL0IOXhzPqYZvcd6vo1jf+pGVyY+vEbn4oig2yMz5K7GTtuRd6fVz/m2yH3GPkgpyDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=d4mBnTPC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="d4mBnTPC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745479479;
	bh=TrAcmBN6lYfQHtdSnYmDwJwiksUZsL1Y2yFtmp2AxNg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d4mBnTPCkhGkmkL6MG3tORhqckVQKeUum9QYt2CKbeafi2L/P/jEo/DTXD9opnqWM
	 AnB+FFRQWvSOZHILTx5opYylQi9sfFLBTlZzfeaSRoEbmgXJSFsZah/DPd/IONQFfz
	 q4c+bZom/5KruvlWgx6dXzvvHYogQ2SvZsQS+8IK9ZkurBhsaPgZ6wPUP6tw5c3DE4
	 Ub3524o9344Ifs3Y/gSH1lpxliW8KWn2XkmeQlpen2Bggc+7RpjGf4GnskWSMAi0O8
	 SNywYTdhxXNJciyr/JiFd/4IieZNALuoJjN2omWk4YnDpwlC4dggywnJUbO5ByLaJO
	 NzVT6ZbMKXoLg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 86B0C17E0808;
	Thu, 24 Apr 2025 09:24:38 +0200 (CEST)
Message-ID: <eb350c96-379a-46db-8a54-e1b9c71be431@collabora.com>
Date: Thu, 24 Apr 2025 09:24:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8390-genio-common: Force ssusb2
 dual role mode to host
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250331-mtk-genio-510-700-fix-bt-detection-v1-1-34ea2cf137f3@collabora.com>
 <2da6560b-8444-48ae-bb01-397756cecbc0@notapiano>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <2da6560b-8444-48ae-bb01-397756cecbc0@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 23/04/25 22:48, Nícolas F. R. A. Prado ha scritto:
> On Mon, Mar 31, 2025 at 11:25:52AM +0200, Louis-Alexis Eyraud wrote:
>> On the Mediatek Genio 510-EVK and 700-EVK boards, ssusb2 controller is
>> one but has two ports: one is routed to the M.2 slot, the other is on
>> the RPi header who does support full OTG.
>> Since Mediatek Genio 700-EVK USB support was added, dual role mode
>> property is set to otg for ssusb2. This config prevents the M.2
>> Wifi/Bluetooth module, present on those boards and exposing Bluetooth
>> as an USB device to be properly detected at startup, so configure for
>> the ssusb2 dr_mode property as host instead.
>>
>> Fixes: 1afaeca17238 ("arm64: dts: mediatek: mt8390-genio-700: Add USB, TypeC Controller, MUX")
>> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
>> ---
>> I've tested this patch on Mediatek Genio 510-EVK board with a kernel
>> based on linux-next (tag: next-20250331).
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
>> index 60139e6dffd8e0e326690d922f3360d829ed026b..3a9d429f0f14b501ae41551dfe7272f242345138 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
>> @@ -1199,7 +1199,13 @@ xhci_ss_ep: endpoint {
>>   };
>>   
>>   &ssusb2 {
>> -	dr_mode = "otg";
>> +	/*
>> +	 * the ssusb2 controller is one but we got two ports : one is routed
>> +	 * to the M.2 slot, the other is on the RPi header who does support
>> +	 * full OTG but we keep it disabled otherwise the BT on the M.2 slot
>> +	 * USB line goes obviously dead if switching to gadget mode.
>> +	 */
>> +	dr_mode = "host";
> 
> Hi,
> 
> while I agree with this change, now that this controller is fixed to host mode,
> the connector child node here which is supposed to probe with driver
> usb-conn-gpio, which would monitor the ID and VBUS lines and change the USB role
> as needed, will fail to probe with:
> 
>    platform 112a1000.usb:connector: deferred probe pending: usb-conn-gpio: failed to get role switch
> 
> as indeed there no longer is a role switch registered.
> 
> For that reason, I believe as part of this commit you should also disable the
> connector. Since role switching is no longer supported by this controller,
> there's no sense in even trying to probe this driver.
> 
> Thanks,
> Nícolas

Can we instead go for role-switch-default-mode = "host", with a big comment
in the devicetree saying that the controller is shared between BT and the other
port? :-)

Cheers,
Angelo
