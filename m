Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50345215793
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 13:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739280028; cv=none; b=rph5CSSSn3EMCZCnR7gtmi4fvteJFKmQuKT/1mgkEX/bNnsSSn2ZmRWayaHRRjuO1Z2Syjf7khN4zRl3XncWAVz8hLclM5ZVEWFIlQSDzP5ekFxsv3db47is0Kv7Ukx6fWAh/TswrtfSYHS8VN9mDmVTh0BSpDy1L/vRkZWD0jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739280028; c=relaxed/simple;
	bh=UXOHdVC4qGOqpShpTnw73VcGk4nbY8q5R1jCQRbfdxE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=k4oF3CKeTtWkO/yBdSESR/3XUwqgyVFhtj3mRcpwW9FcupWxLYvDs048b65vVjv0lxfPj536kItU2JgqRrciuM3I+/hUOEWJi0I4vALmxKrBFgaoyoTrdxEnbcY4AwPYVEzEqjpTl0sYxdHcX6RMcpGO19GCLK8qOgekWNkaXbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UNmbddXD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UNmbddXD"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F4622B3;
	Tue, 11 Feb 2025 14:19:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739279948;
	bh=UXOHdVC4qGOqpShpTnw73VcGk4nbY8q5R1jCQRbfdxE=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=UNmbddXDUF0oSrsGEOSUFF7h5JYrpqRPM0a60oddX8RMBZ/Zc5ThwEQXlYSLXMSSD
	 pjVtQNoKLOGbDlw/HolEQ7gxSg6n29w0wx2JsLjTBMW3p12ibzg5kXOgSMzkuhtix4
	 rUVdHDM3UrZhMy0LBdy6XLN+F9LMn02Ez0CXPJfU=
Message-ID: <192889ed-237e-40b0-8444-7aad36a8bc7a@ideasonboard.com>
Date: Tue, 11 Feb 2025 15:20:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] drm: xlnx: zynqmp_dpsub: Add NULL check in
 zynqmp_audio_init
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Charles Han <hanchunchao@inspur.com>, laurent.pinchart@ideasonboard.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Markus.Elfring@web.de,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, michal.simek@amd.com,
 vishal.sagar@amd.com
References: <20250211102049.6468-1-hanchunchao@inspur.com>
 <b8c4dabc-c9a9-407a-94a1-4a59a67e0440@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <b8c4dabc-c9a9-407a-94a1-4a59a67e0440@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 11/02/2025 15:08, Tomi Valkeinen wrote:
> Hi,
> 
> On 11/02/2025 12:20, Charles Han wrote:
>> devm_kasprintf() calls can return null pointers on failure.
>> But some return values were not checked in zynqmp_audio_init().
>>
>> Add NULL check in zynqmp_audio_init(), avoid referencing null
>> pointers in the subsequent code.
>>
>> Signed-off-by: Charles Han <hanchunchao@inspur.com>
>> ---
>>   drivers/gpu/drm/xlnx/zynqmp_dp_audio.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c b/drivers/gpu/drm/ 
>> xlnx/zynqmp_dp_audio.c
>> index fa5f0ace6084..f07ff4eb3a6d 100644
>> --- a/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c
>> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c
>> @@ -323,12 +323,16 @@ int zynqmp_audio_init(struct zynqmp_dpsub *dpsub)
>>       audio->dai_name = devm_kasprintf(dev, GFP_KERNEL,
>>                        "%s-dai", dev_name(dev));
>> +    if (!audio->dai_name)
>> +        return -ENOMEM;
>>       for (unsigned int i = 0; i < ZYNQMP_NUM_PCMS; ++i) {
>>           audio->link_names[i] = devm_kasprintf(dev, GFP_KERNEL,
>>                                 "%s-dp-%u", dev_name(dev), i);
>>           audio->pcm_names[i] = devm_kasprintf(dev, GFP_KERNEL,
>>                                "%s-pcm-%u", dev_name(dev), i);
>> +        if (!audio->link_names[i] || !audio->pcm_names[i])
>> +            return -ENOMEM;
>>       }
>>       audio->base = devm_platform_ioremap_resource_byname(pdev, "aud");
> 
> Thanks, looks good to me. I'll apply with Laurent's RB, which he gave 
> for v1.

Actually, looks like you dropped the Fixes tag that you had in the v1 
and v2. I will add it back.

  Tomi

