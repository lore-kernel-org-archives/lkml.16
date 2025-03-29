Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A54C29A5
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 06:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743228791; cv=none; b=eEhk1jLRDyhVzm/3hDxVuGzuYsFKXKov2zdvlyXtLqwvtldhLaJeunq5GiAlLk0Y0O06c8Twz9kUTSesiTNQfScgBQ2UuxNxArHwQmCR/UYqzOcdvGLXn8i9nYs7LG/Kwkbw6xXRJ3EaLu/0Pc7o5iI4101JXA3KnI9GEm+r7eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743228791; c=relaxed/simple;
	bh=EhdNLTLd3ZkHRpplWGGCgKzGBevtbKGh785eCLCkJIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DSlakLF5tsr9p759PcyXDsheQXc4h2NCbKzkoiT/kNCbAMViRJp60VXMNnrd9ymkl8R4fW5bB1edXFAL4AE3oS8MeOY++sSIojMsqIBFP3I+hoxMzvYA+O1j+megNnCAvtquDR7t3/awjxo4knHsQiBvaMlate5M1SUjtCXzJKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4ZPn4w0PzWz2TS3W;
	Sat, 29 Mar 2025 14:08:16 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
	by mail.maildlp.com (Postfix) with ESMTPS id 1445514013B;
	Sat, 29 Mar 2025 14:12:59 +0800 (CST)
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Sat, 29 Mar 2025 14:12:57 +0800
Message-ID: <808ab7db-b42d-4510-8b07-99ed96aef1f0@huawei.com>
Date: Sat, 29 Mar 2025 14:12:56 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 drm-dp 5/9] drm/hisilicon/hibmc: Getting connector info
 and EDID by using AUX channel
To: Maxime Ripard <mripard@kernel.org>, Jani Nikula
	<jani.nikula@linux.intel.com>
CC: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
	<maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
	<airlied@gmail.com>, <daniel@ffwll.ch>, <kong.kongxinwei@hisilicon.com>,
	<liangjian010@huawei.com>, <chenjianmin@huawei.com>,
	<lidongming5@huawei.com>, <libaihan@huawei.com>, <shenjian15@huawei.com>,
	<shaojijie@huawei.com>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <shiyongbang@huawei.com>
References: <20250319032435.1119469-6-shiyongbang@huawei.com>
 <87frj8c9ol.fsf@intel.com> <ff11c8ac-7eb4-42cb-86d3-ad9924c9374b@huawei.com>
 <87jz8ea6zq.fsf@intel.com> <8ee961ca-0d3c-487d-a672-82714ee56743@huawei.com>
 <875xjw87dm.fsf@intel.com> <a8599ca0-9a50-453e-8986-f8fae5aa9160@huawei.com>
 <87v7ru6bfk.fsf@intel.com> <51bae617-cfc7-43f9-968e-5f2a3ad9af40@huawei.com>
 <87pli14fgh.fsf@intel.com> <20250328-hopping-ibis-of-gaiety-f7cac3@houat>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <20250328-hopping-ibis-of-gaiety-f7cac3@houat>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd500013.china.huawei.com (7.221.188.12)

> On Fri, Mar 28, 2025 at 12:28:14PM +0200, Jani Nikula wrote:
>> On Fri, 28 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
>>>> On Thu, 27 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
>>>>> 在 2025/3/26 17:32, Jani Nikula 写道:
>>>>>> On Tue, 25 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
>>>>>>>> On Mon, 24 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
>>>>>>>>>> On Wed, 19 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
>>>>>>>>>>> From: Baihan Li <libaihan@huawei.com>
>>>>>>>>>>>
>>>>>>>>>>> Add registering drm_aux and use it to get connector edid with drm
>>>>>>>>>>> functions. Add ddc channel in connector initialization to put drm_aux
>>>>>>>>>>> in drm_connector.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>>>>>>>>>>> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
>>>>>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>>>>>> ---
>>>>>>>>>>> ChangeLog:
>>>>>>>>>>> v6 -> v7:
>>>>>>>>>>>        - add if statement about drm aux in hibmc_dp_connector_get_modes(), suggested by Jani Nikula
>>>>>>>>>> I don't understand this, and I did not suggest such a thing.
>>>>>>>>>>
>>>>>>>>>> BR,
>>>>>>>>>> Jani.
>>>>>>>>>>
>>>>>>>>> Hi Jani,
>>>>>>>>>
>>>>>>>>> Is the modification of v8 correct?
>>>>>>>> I never received that for whatever reason.
>>>>>>> Here's the link: https://lore.kernel.org/all/20250320101455.2538835-1-shiyongbang@huawei.com/
>>>>>> Thanks.
>>>>>>
>>>>>> The EDID handling looks fine.
>>>>>>
>>>>>> AFAICT you leak dp->aux.name though.
>>>>>>
>>>>>>
>>>>>> BR,
>>>>>> Jani.
>>>>> Thanks for for reminding me, actually the dp->aux.name was written because I misunderstood what you meant in V7,
>>>>> and I deleted it in V8.
>>>> This is in the link you posted:
>>>>
>>>> +	dp->aux.name = kasprintf(GFP_KERNEL, "HIBMC DRM dp aux");
>>>>
>>> Hi Jani,
>>>
>>> I got it. I think I can change it to devm_kasprintf() in next bug fix patch, is that ok?
>> Maybe. I don't have the time to look into hibmc details.
> I don't either, but it looks suspicious to me. devm_kasprintf will be
> freed when the device will be removed, but the DP Aux bus is probably
> staying for a bit longer?
>
> Maxime

Hi Ripard,

I will bind it to my hibmc device, and aux_unregister is in early_unregister callback of dp's connector_funcs,
which is before the hibmc_pci_remove(), so I think it work good.


