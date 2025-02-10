Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D691C5D7C;
	Mon, 10 Feb 2025 11:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739186589; cv=none; b=Xv/ZWkLB6had8c0aCtnxmQVbJUPmO87VHtpnEhqBUVGcnFn2I1ECkHqsMhXkC9WDf//pnDv8p56gtH4V13qhRR86QW8OB9xTJLun4nzvCzqZDB4fEiX3TbbZxYOf7r4WJaWJbLpHbQU9eaYz+VOIpY3Bx7G2tktoOV51JohzrSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739186589; c=relaxed/simple;
	bh=2TfBb8YkHBjUcd2qbTj06jtJqA74ipyI1dLzWmzyRp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CMBQVT+2GteCogxiM2tUQRZVt40T1WVPTeO67Vt9s99WRWxe+UWulBWC0SNR+ClbPiAMVK1mXBUjpOtggU+/BjL5eAYcFGbeh613Th6co0ci5mNcS3z6Eu01wnhbWK6YTcSj7ZRRCCu43Z5qVJr8KzAOo+VqC0DG7UhrKRWpD78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=eQ4nxJES; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="eQ4nxJES"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739186586;
	bh=2TfBb8YkHBjUcd2qbTj06jtJqA74ipyI1dLzWmzyRp4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eQ4nxJESKZB4J0JFkg5Nk8KYNqeTOzP+Sf8VljtKSgz/vbFYNKynyDTvsGRDBIe/K
	 NH0EcNQ8rHXCiiHdMgXvClbJABoqnKs+kaTOg2raVeJI/NbsXC7V/OHMk4LMWpTjdr
	 /IqGJgFtoXI5JyzztBVldciULs31BkopnpoJR0vT6klju0S1HxyasgIYuLIAusPwvm
	 tBIfg0GkaJQwf453X/lQxlHqGu2gqV4Y+ohZ6Ec23Vig626spJpLuLFLG6QyRrTnI6
	 o5BQJCZr/Jky0L5WT8E1vc5U0aRGGIPVGpZT9ZOhGQTLUiIP4IFUNOQ0C+CcwbOn1d
	 ZNfkne9lGJwnQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BF3F417E09F6;
	Mon, 10 Feb 2025 12:23:04 +0100 (CET)
Message-ID: <2fd97b1e-6546-4f43-bc60-15a812e66467@collabora.com>
Date: Mon, 10 Feb 2025 12:23:04 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 27/34] drm/mediatek: mtk_hdmi: Cleanup function
 mtk_hdmi_resume()
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
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
 <20250113145232.227674-28-angelogioacchino.delregno@collabora.com>
 <f25eaced46e18a54896f20ae1c42ed6894da5e18.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <f25eaced46e18a54896f20ae1c42ed6894da5e18.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 07/02/25 07:04, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Mon, 2025-01-13 at 15:52 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> Remove the error print in case of mtk_hdmi_clk_enable_audio()
>> failures: since the APIs will already print on their own, having
>> one in there is redundant.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_hdmi.c | 9 +--------
>>   1 file changed, 1 insertion(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> index 40eea5c125d2..c5431f160fe4 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> @@ -1703,15 +1703,8 @@ static __maybe_unused int mtk_hdmi_suspend(struct device *dev)
>>   static __maybe_unused int mtk_hdmi_resume(struct device *dev)
>>   {
>>          struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
>> -       int ret = 0;
>>
>> -       ret = mtk_hdmi_clk_enable_audio(hdmi);
> 
> I do not find where to print the error message, could you provide where would print the error message?
> 

It's handled in drivers/base/power/main.c - upon failure, a pm_dev_err() will be
executed, printing an error message stating that this (or any other) driver has
failed resuming.

Cheers,
Angelo

> Regards,
> CK
> 
>> -       if (ret) {
>> -               dev_err(dev, "hdmi resume failed!\n");
>> -               return ret;
>> -       }
>> -
>> -       return 0;
>> +       return mtk_hdmi_clk_enable_audio(hdmi);
>>   }
>>
>>   static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops, mtk_hdmi_suspend, mtk_hdmi_resume);
>> --
>> 2.47.0
>>
> 

