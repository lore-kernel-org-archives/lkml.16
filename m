Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C0D1FC7F1;
	Tue, 15 Apr 2025 14:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744726380; cv=none; b=eFvokx/NwEkQhfXi2w5SM4q+cX6aR3ipz3BEyuXEM9QlNoY7jJozK/rj2ocuXOyGElwkBl9X+8OBUdbvoiia3u6xbGvlhtDIyvqgtHBIhoKg+aveuun9d0K5iszs3HI/HU8JGWkNymLCKWv32iHTMPiXNYwcvBCGaV9CKDD0oLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744726380; c=relaxed/simple;
	bh=xK2LkYSeBxb14Vlfe6VfU2/wPR+W/1fTwZEbUWZJGgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iiaFxDbktfoIEQ5DSw84/R2KjfG/VxCpIfXmeBE6sgo/SmtUmB2V1zb7yRJAqQt1+9HIJFKGqCnSLEFtpq6WqvIllew0ZFNhvmOqD8vIW3F2FqxK0vkzcAGK+ifF29XCrUuoe06+zPOr1Y96TG8cK8dMA2SErww5zrla951uwQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=p/RHqChc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="p/RHqChc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744726376;
	bh=xK2LkYSeBxb14Vlfe6VfU2/wPR+W/1fTwZEbUWZJGgQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=p/RHqChcX4FNsKxL65WMJUOImMkYAxDiG2sjW2jRGBIQnljNhwumM9hPGIAvUSQsl
	 ZpjWDbWXvHF77gwRXMojrW/SLXsXL9HUy56HwnIhFUM2xgHTu6UKm0Ka6ujtvvlar7
	 6vCxYVBVQ2WCnHth+gaxfU8jWdOkI65nQ61+oI+3nsdhmN6lQE9eUiw+/EsGJ8ElC6
	 b9sWs9DiWIiLKLDOUv0k3f34cLIeVlVd19Ctz72DDQQw78V1R1CTz0uHaJ2z8ILlsc
	 /Rb7aIetv28NRvFcni0JE2kUipCZGZT7MVElmEljSBp5AJK31XS6dJqEV3apQeUhbK
	 3hzpS0Kzx5OdQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2948A17E017D;
	Tue, 15 Apr 2025 16:12:55 +0200 (CEST)
Message-ID: <95b965c2-1f03-423b-86a1-cd22784b480d@collabora.com>
Date: Tue, 15 Apr 2025 16:12:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 3/5] dt-bindings: power: Add binding for MediaTek MT7988
 topmisc power controller
To: frank-w@public-files.de, Frank Wunderlich <linux@fw-web.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Daniel Golle <daniel@makrotopia.org>, Sam Shih <sam.shih@mediatek.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250413085806.8544-1-linux@fw-web.de>
 <20250413085806.8544-4-linux@fw-web.de>
 <700af1ab-f43e-4583-8f0e-27e5d4424338@collabora.com>
 <2EA2BDB0-E1C9-49BC-98FC-5048905AA036@public-files.de>
 <bbb81e79-95da-4cf9-9eef-7cbaea191ebb@collabora.com>
 <AC7CF61A-A8A0-40B7-B5B5-51C56A1D3E81@public-files.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <AC7CF61A-A8A0-40B7-B5B5-51C56A1D3E81@public-files.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 15/04/25 16:03, Frank Wunderlich ha scritto:
> Am 15. April 2025 11:59:06 MESZ schrieb AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>:
>> Il 15/04/25 11:52, Frank Wunderlich ha scritto:
>>> Hi Angelo,
>>>
>>> Am 14. April 2025 12:25:23 MESZ schrieb AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>:
>>>> Il 13/04/25 10:58, Frank Wunderlich ha scritto:
>>>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>>>
>>>>> Topmisc is a systemcontroller used for xs-phy and ethernet on  mt7988.
>>>>> Add binding for it.
>>>>
>>>> That's the wrong binding... check mfd/syscon.yaml :-)
>>>>
>>>> P.S.: Is there any reset controller in topmisc? Any clock?
>>>>        If yes, syscon.yaml is also wrong, and you need a driver for that.
>>>>        Remember: If it turns out *later* that this has clk/resets and the
>>>>        bindings are already set for just a syscon, it's gonna be way harder!
>>>>
>>>> Cheers,
>>>> Angelo
>>>
>>> Ok based on the power-domain-cells property i guessed powercontroller is the right place.
>>
>> power-domain-cells, but without any power domain assignment, so that was wrong :)))
>>
>>>
>>> But based on your suggestion i tried moving compatible to syscon binding and made dtbs_check here.
>>>
>>> I can confirm dropping the unexpected properties reported by syscon binding (power-domain-cells,clock-cells,adress-cells and size-cells) are not needed for function (xsphy and ethernet).
>>>
>>> For verifying that there are really no clocks/resets in topmisc (have not found it in public available register documents) i asked mtk (waiting for answer).
>>>
>>> Also got it working without the syscon compatible by changing ethernet driver too (after this change xsphy was also working).
>>
>> Perfect, a bit of a cleanup and you're done, then!
>>
>> Cheers!
>>
>>>
>>> Eth:
>>> https://github.com/frank-w/BPI-Router-Linux/commit/d866e648717800b6f6395ad36c38f9effcf0498d
>>> Xsphy:
>>> <https://github.com/frank-w/BPI-Router-Linux/commit/0121a94df99700487704ca056b210b13db07e90c>
>>>
>>> regards Frank
>>
>>
>>
> 
> Got response from MTK and basicly topmisc contains a powercontroller (for cpu and internal 2g5) but currently not needed because ATF already switch this on. The second part is the pcs/phy muxing and 3rd some unneeded switches (where i have no detailed information). But no clocks or resets as these are handled in the connected platform driver (xsphy/ethernet).
> 
> So my original binding imho made more sense.
> 
> The syscon binding seems to need syscon fallback and shows error about unexpected "compatible" property. The binding itself does not contain any properties but references syscon-common where iiuc compatible property must have at least 2 items and requires the "syscon" fallback.
> 
> Mtk suggests splitting topmisc into the 2 blocks by only using the mux part as syscon with splitting the reg. If powerdomain really is needed then a second topmisc node could be added and bound to a new driver.
> 

I agree with MediaTek's suggestion. Split it, that just makes more sense.

Besides, if the first part (the power controller in topmisc) is managed by ATF it's
a good idea to avoid touching anything in there from the kernel :-)


> But this would need a bit more of testing.
> regards Frank


