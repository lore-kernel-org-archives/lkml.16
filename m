Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899E822FAF4;
	Wed, 16 Apr 2025 08:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744792592; cv=none; b=ramriN8vqjzy9u5dtqvJk/ARdzamam39EwugtYWKkJYBkR7Jei9KR87V5Jup5Ek1ZcQ7q+sug/gMN46BlvTcxNoXP6DBZ7MnxJGEg0se5QqQZxL53g7uqUIk+Oo2Rw8vKN6QHqqraL8yHJ1yQplo9qEgkZpsAZD51N+JN7TmUBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744792592; c=relaxed/simple;
	bh=1d2N2Qn/JW5QWfjpDUYk7isFPV0A5T0sy4jRKhZximY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jwswb9mAnNrqqr7b3gJbS7Zz4QAATfsGEyuxNNiRDtb7SrwHeNUkdN59vk5yXwY39vkb5iMGnk3K88bSdnU6AkPjcbPJBNQ0Wv0FcOxMUk0/foyCY/cj6ObVIO9/jgS375z70OKJxYllaMKIv+dCdmUijIKnnZKr2uXR+mRRIeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=A1Svrby0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="A1Svrby0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744792588;
	bh=1d2N2Qn/JW5QWfjpDUYk7isFPV0A5T0sy4jRKhZximY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A1Svrby0uVBqHw5jN3tu1pxER4Q8GYXwnq/a2p/Aa0ic3o8l9+2cLEejsDTplQlUC
	 khUk2yP43g20pxuwiH2RSN6TwBfhBMKk80Cjo7Oti15szIGgPuH/y+BB6bbickqFDA
	 IQE4JZDFrklcWSFmEF8T5MT/4rUSjQxvkTJt9scFUmEUlwkv3131viA6d3dWbB2DUT
	 CmISE3zyQkgLfLa3MHvIH3/EIDo2ovLtG8HPuPcaUCqvmUA9JXMpqHW0JZ0DKymAIE
	 qcmrnF0gwPdQvllMcZiM26tm9cQWmsD0D2osWJNHLRsAet43omk40PSZvyX1Xk8qQu
	 8z1DXtLNrwwFg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4212117E1034;
	Wed, 16 Apr 2025 10:36:27 +0200 (CEST)
Message-ID: <7f4015b1-9151-4964-88bb-55a6448b96dc@collabora.com>
Date: Wed, 16 Apr 2025 10:36:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 17/23] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
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
References: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
 <20250415104321.51149-18-angelogioacchino.delregno@collabora.com>
 <bc094a07-2a4c-4048-8c15-b096db62f142@collabora.com>
 <01872a8318e2c87b124631822785d3ea494030f0.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <01872a8318e2c87b124631822785d3ea494030f0.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 16/04/25 08:44, CK Hu (胡俊光) ha scritto:
> On Tue, 2025-04-15 at 12:48 +0200, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> Il 15/04/25 12:43, AngeloGioacchino Del Regno ha scritto:
>>> In preparation for adding a new driver for the HDMI TX v2 IP,
>>> split out the functions that will be common between the already
>>> present mtk_hdmi (v1) driver and the new one.
>>>
>>> Since the probe flow for both drivers is 90% similar, add a common
>>> probe function that will be called from each driver's .probe()
>>> callback, avoiding lots of code duplication.
>>>
>>> Reviewed-by: CK Hu <ck.hu@mediatek.com>
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> ---
>>>    drivers/gpu/drm/mediatek/Kconfig           |   11 +-
>>>    drivers/gpu/drm/mediatek/Makefile          |    1 +
>>>    drivers/gpu/drm/mediatek/mtk_hdmi.c        |  538 +-----
>>>    drivers/gpu/drm/mediatek/mtk_hdmi.c.orig   | 1769 ++++++++++++++++++++
>>>    drivers/gpu/drm/mediatek/mtk_hdmi_common.c |  422 +++++
>>>    drivers/gpu/drm/mediatek/mtk_hdmi_common.h |  188 +++
>>>    6 files changed, 2398 insertions(+), 531 deletions(-)
>>>    create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi.c.orig
>>
>> CK, I just acknowledged that a .orig file slipped through and got sent out with
>> this patch....
>>
>> Truly sorry for that, can you please fix that up while applying without having me
>> send another patchbomb?
> 
> I would drop mtk_hdmi.c.orig when apply this patch.
> 

Very much appreciated!

Thanks again,
Angelo

> Regards,
> CK
> 
>>
>> Many thanks,
>> Angelo
>>
>>>    create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>>>    create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.h
>>>
> 


