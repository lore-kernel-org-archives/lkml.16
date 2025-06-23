Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825222459F1;
	Mon, 23 Jun 2025 12:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750681949; cv=none; b=NIZ36Hl3TIMts5cnFf16GuaprRYuh1x6U9HNvVQEKWNn0jxIlhhdv+FfPvJweFg9Gay7yIKK856C4ndTpGHMyBIMyaw8cq7StuaQAuxZF9OQPhihz5zvTK1c+5TKHdVz7zH/YkyAnIWO/rj4tbrfaPnoXsmuGoiwOpRXk30ZaIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750681949; c=relaxed/simple;
	bh=Hi9Eh4Q8Idz+PcP0DJGiXpcq9TCKuca5A6YCe8h1Q6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PNwPrVsb4F1fcnOPOEC/fGnuJaGqy3yvGGDHdiwPIGUKM/jl0/fM3nFEDf4a4w1Dj8+B0R1Dckwx+S9rhbfkWASfuY4opXC9mqxHKbKzvXeu659pqXRHc4Ivdn1a/VpkizrCe36fiC/SrGVR0Dm8LQrBdfzvB5YtkP/VVlbZKxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fRzoI1dl; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fRzoI1dl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750681945;
	bh=Hi9Eh4Q8Idz+PcP0DJGiXpcq9TCKuca5A6YCe8h1Q6U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fRzoI1dlS3MhNk3kaIep6i4WWNWcAedful78drVRlvm/4Xh1SkS3K+ztOxFgSXAoH
	 2vbxKawbsztUnl09cPgSt+uFvVJ1tHS6KKrdllwE7bz4z7Nx8fjloQ81iDlj4Xj79Q
	 /D5ypsq0jDLDquYdSE6sGH6Vs3QoA6d6ufaxnnBWl5rl/oV0zaA/r9/MsmuncGTLQ/
	 zChQ5ri/Q5UxqkUf8s5FwHisxQIwpUKH8BYjPGN4ASCoS3jQkHgPzClBohAjnAg3zh
	 ePgONva+hO8UErkrt4zINF+7jcMmK0nTWjXo4ELEAsJk5/M9CCDUjpnlURnSI/Wd6Q
	 usJOc2BEtxn3w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 13E9717E05BD;
	Mon, 23 Jun 2025 14:32:25 +0200 (CEST)
Message-ID: <9e8d0dfc-7dc4-461d-afd9-bd381219422f@collabora.com>
Date: Mon, 23 Jun 2025 14:32:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] firmware: Add MediaTek TinySYS SCMI Protocol
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, sudeep.holla@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, arm-scmi@vger.kernel.org,
 kernel@collabora.com
References: <20250623120136.109311-1-angelogioacchino.delregno@collabora.com>
 <aFlFw-AjqxXcIuBO@pluto>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <aFlFw-AjqxXcIuBO@pluto>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 23/06/25 14:17, Cristian Marussi ha scritto:
> On Mon, Jun 23, 2025 at 02:01:34PM +0200, AngeloGioacchino Del Regno wrote:
>> This series adds basic support for the MediaTek TinySYS SCMI Protocol,
>> found on the MediaTek Dimensity 9200, 9300 and 9400, other than on the
>> MT8196 Chromebook SoC.
>>
>> This is used to communicate with the CM_MGR and other MCUs for power
>> management purposes.
> 
> Hi Angelo,
> 
> thanks for this.
> 
> I will do a proper review in the coming days of this series anyway, but
> upfront for future V2:
> 
> - you should provide some sort of documentation for this new
>    vendor protocol and its messages, as an example from IMX:
> 
> 	drivers/firmware/arm_scmi/vendors/imx/imx95.rst

Noted.

> 
> - where is the SCMI driver that will call all the new vendor ops
>    defined in: scmi_mtk_protocol.h ?

This was tested with code that is not clean at all (hence I can't push it upstream)
and well... I didn't think about the fact that, effectively, without an user, this
code ends up being unused.

I can't promise to send a clean user in this cycle, but I would really appreciate
if you could still check the protocol code, so that if there's anything that you
can spot I can fix it while the rest gets done :-)

Thank you,
Angelo

> 
> Thanks,
> Cristian


