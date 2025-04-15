Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94DD1F17E8;
	Tue, 15 Apr 2025 10:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744711214; cv=none; b=HR4q1Xva4pc+MTO0JWprNR/pg+BV2Cc5eHZIJNx7UKZ2koEHaC31fmasQLU6qE6n4BWhSHGpDNla6dI1GcNnB24S2zvtT+wWJgfX1dMTyrvXTNJ31rMsbwZ14GD3O9UEv7Ak6S49LSVRci9wB8vnDfTmhgPnDkarSiXzrAR7AuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744711214; c=relaxed/simple;
	bh=9yw0Qzz1F9KcriheuD2Lay5nFwu3/DTc+aJ7BlFLoTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PU/Yg4aNeogy6mdAyO986GqiEmeMwMc6jg2EBUClmhmb2KiX5MjRlrBXdf/mKH8c/uNcWbb0e4jW8rZVAC+BeHPYlDrvETpe2MgF40ZSPXK5IGsZMdpGA0DXaUUbzjkFagsBWROucVLg3LcTfC8gPAf3EUHB0NNsEE1Lo5kVl98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DwHUv9d1; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DwHUv9d1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744711210;
	bh=9yw0Qzz1F9KcriheuD2Lay5nFwu3/DTc+aJ7BlFLoTg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DwHUv9d1qTN+uPe8HwwTS+BIN8TB0IIPrqWppWKEa6OHF2/zGpdeH4DkkM0vnOxk5
	 1n3kY72+9K554uTmWtJxThiJFOYDc5/815u3xZE2/nFY0dPOMRJ/1mZrWiL4QvqoWh
	 V8xmlhAcLRoeBoT3g8wIzoVgot/pahpErOJH4iyXlPUeOPCqgliBAcZkoAa0xq8eBc
	 D0fvajYGv5N5b896UpLKVs7PwhcTiNr//tm8zPltooPJG2pr2HjQaBquBP+OyBEWP4
	 ZfX96iMBdrhAySsvZrSgDdy8IWjHnrjbQBbH4tCeus4czUZbE9Jre50OmW40KyINOt
	 ZdzKBlFhlQjaQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8BF1F17E0FA7;
	Tue, 15 Apr 2025 12:00:09 +0200 (CEST)
Message-ID: <385e75f7-9b45-46cf-9202-1951c7e0fe5e@collabora.com>
Date: Tue, 15 Apr 2025 12:00:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 23/23] drm/mediatek/hdmi: Use
 syscon_regmap_lookup_by_phandle_args
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "jie.qiu@mediatek.com" <jie.qiu@mediatek.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, =?UTF-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
 <jitao.shi@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 =?UTF-8?B?TGV3aXMgTGlhbyAo5buW5p+P6YieKQ==?= <Lewis.Liao@mediatek.com>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 =?UTF-8?B?VG9tbXlZTCBDaGVuICjpmbPlvaXoia8p?= <TommyYL.Chen@mediatek.com>,
 =?UTF-8?B?SXZlcyBDaGVuamggKOmZs+S/iuW8mCk=?= <Ives.Chenjh@mediatek.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "junzhi.zhao@mediatek.com" <junzhi.zhao@mediatek.com>
References: <20250409131318.108690-1-angelogioacchino.delregno@collabora.com>
 <20250409131318.108690-24-angelogioacchino.delregno@collabora.com>
 <a73ae86c406de1002c7fcff9f34c2eeaaa5f03dc.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <a73ae86c406de1002c7fcff9f34c2eeaaa5f03dc.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 15/04/25 10:14, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Wed, 2025-04-09 at 15:13 +0200, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
>> syscon_regmap_lookup_by_phandle() combined with getting the syscon
>> argument.  Except simpler code this annotates within one line that given
>> phandle has arguments, so grepping for code would be easier.
>>
>> There is also no real benefit in printing errors on missing syscon
>> argument, because this is done just too late: runtime check on
>> static/build-time data.  Dtschema and Devicetree bindings offer the
>> static/build-time check for this already.
> 
> Please rebase this patch to the first patch of this series.
> I would like to apply refinement patch first then apply hdmi v2 patches.
> 

Please use the original patch if it still applies, then:

20250112134708.46100-1-krzysztof.kozlowski@linaro.org

Cheers,
Angelo

> Regards,
> CK
> 
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> [Angelo: Rebased over HDMIv2/DDCv2 series cleanups]
>> Reviewed-by: CK Hu <ck.hu@mediatek.com>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 7 ++-----
>>   1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>> index 784bc05c9541..00a638a3caf4 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>> @@ -269,12 +269,9 @@ static int mtk_hdmi_get_cec_dev(struct mtk_hdmi *hdmi, struct device *dev, struc
>>           * MMSYS_CONFIG device and the register offset of the HDMI_SYS_CFG
>>           * registers it contains.
>>           */
>> -       hdmi->sys_regmap = syscon_regmap_lookup_by_phandle(np, "mediatek,syscon-hdmi");
>> +       hdmi->sys_regmap = syscon_regmap_lookup_by_phandle_args(np, "mediatek,syscon-hdmi",
>> +                                                               1, &hdmi->sys_offset);
>>          if (IS_ERR(hdmi->sys_regmap))
>> -               return PTR_ERR(hdmi->sys_regmap);
>> -
>> -       ret = of_property_read_u32_index(np, "mediatek,syscon-hdmi", 1, &hdmi->sys_offset);
>> -       if (ret)
>>                  return dev_err_probe(dev, ret,
>>                                       "Failed to get system configuration registers\n");
>>
>> --
>> 2.49.0
>>
> 


