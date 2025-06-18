Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36261288C1C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240918; cv=none; b=VPB37KOkDrP+E0M4ktfIhGJ8d8oYCGeChFLJP5XcrUdYzmvyL3+hm/jT/gNj8W5k/Fn7eCymm6u7yfldxnFtf06waEkDiYMFgEWvHuOeMZiXLHjZU6W7GS8Z+R8GF20Uaex4+TzDST4Eh2qMNSABxT2UetEMNPNj8AMM1OxHqjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240918; c=relaxed/simple;
	bh=HYF9U4mX4rjSXBpcCj5F8LZ+aIPlNCb/z9U2ngAQ3KM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=Wlm4dxW01AKNUFR+x+h1dR9fx5wk7fGpDf71TzwzaObsvCg5nQ0o+jecWZMgXodwJE7hCuX6+Hp+UhvJwFhU5/XJ28q9g8EvXl2aLrvaXqZRfLKTlWUS3xi49d2rAQUG77Qn0/z93iUrFjd7whmFZb1ozamzV6bywiD1lPdFJJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=SW7fWbZ3; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="SW7fWbZ3"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250618100152euoutp017189ae1ab89e159619e0600e5a295764~KGtYmY-bh2867728677euoutp01A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:01:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250618100152euoutp017189ae1ab89e159619e0600e5a295764~KGtYmY-bh2867728677euoutp01A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750240912;
	bh=FO1vRw1NoJYFjt5XwHKAtkWRN0EKjbnZJ4kGu05b5yw=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=SW7fWbZ3VpJ6I4kqF1BDyOk8ksmY9YmkimfmCeTRnmzx6ikWjYZPd8fLL9jJSyqKs
	 esrErCsnRZmYKyaauWqx/ynBD2UkCcgStfCsusNcgDlpHdcOmIc7JeZFZVPPS8vEgo
	 aI5Jt/8ljKf/sXknzkGe8zmpHepwEWqxutMnUG0A=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250618100151eucas1p2949eb1056a74e44e6177654c19ace91f~KGtYHVQi13161931619eucas1p23;
	Wed, 18 Jun 2025 10:01:51 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250618100149eusmtip24aca3551aa06ab0852f7115750196547~KGtWUZ4np1937019370eusmtip2I;
	Wed, 18 Jun 2025 10:01:49 +0000 (GMT)
Message-ID: <3c5d43a2-fdbe-4cbe-bf45-09bfcb18dcb3@samsung.com>
Date: Wed, 18 Jun 2025 12:01:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/4] drm/atomic-helper: Re-order bridge chain
 pre-enable and post-disable
To: Maxime Ripard <mripard@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Aradhya Bhatia
	<aradhya.bhatia@linux.dev>, DRI Development List
	<dri-devel@lists.freedesktop.org>, Linux Kernel List
	<linux-kernel@vger.kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh
	Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>, Jayesh
	Choudhary <j-choudhary@ti.com>, Alexander Sverdlin
	<alexander.sverdlin@siemens.com>, Dmitry Baryshkov <lumag@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
	Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
	<tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250618-silent-oriole-of-fertility-3cbbd6@houat>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250618100151eucas1p2949eb1056a74e44e6177654c19ace91f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250611104512eucas1p22450fccf3bb7521760bd2d9a2a56ba19
X-EPHeader: CA
X-CMS-RootMailID: 20250611104512eucas1p22450fccf3bb7521760bd2d9a2a56ba19
References: <20250605171524.27222-1-aradhya.bhatia@linux.dev>
	<20250605171524.27222-4-aradhya.bhatia@linux.dev>
	<CGME20250611104512eucas1p22450fccf3bb7521760bd2d9a2a56ba19@eucas1p2.samsung.com>
	<2c51cf39-13cb-413f-8dd5-53bc1c11467a@samsung.com>
	<306f142f-f9c9-44ab-a5b9-c71db76b2b80@ideasonboard.com>
	<b4d8c5b2-3ad7-4327-9985-d097d095ccb5@samsung.com>
	<3adb1d12-7cd5-4beb-9978-c3cae702f338@ideasonboard.com>
	<d005ad5c-aded-4dea-b6eb-a9ce78c04728@samsung.com>
	<20250618-silent-oriole-of-fertility-3cbbd6@houat>

On 18.06.2025 10:27, Maxime Ripard wrote:
> On Wed, Jun 18, 2025 at 08:30:39AM +0200, Marek Szyprowski wrote:
>> On 16.06.2025 17:40, Tomi Valkeinen wrote:
>>> On 12/06/2025 09:31, Marek Szyprowski wrote:
>>>> On 12.06.2025 07:49, Tomi Valkeinen wrote:
>>>>> On 11/06/2025 13:45, Marek Szyprowski wrote:
>>>>>> On 05.06.2025 19:15, Aradhya Bhatia wrote:
>>>>>>> From: Aradhya Bhatia <a-bhatia1@ti.com>
>>>>>>>
>>>>>>> Move the bridge pre_enable call before crtc enable, and the bridge
>>>>>>> post_disable call after the crtc disable.
>>>>>>>
>>>>>>> The sequence of enable after this patch will look like:
>>>>>>>
>>>>>>> 	bridge[n]_pre_enable
>>>>>>> 	...
>>>>>>> 	bridge[1]_pre_enable
>>>>>>>
>>>>>>> 	crtc_enable
>>>>>>> 	encoder_enable
>>>>>>>
>>>>>>> 	bridge[1]_enable
>>>>>>> 	...
>>>>>>> 	bridge[n]_enable
>>>>>>>
>>>>>>> And, the disable sequence for the display pipeline will look like:
>>>>>>>
>>>>>>> 	bridge[n]_disable
>>>>>>> 	...
>>>>>>> 	bridge[1]_disable
>>>>>>>
>>>>>>> 	encoder_disable
>>>>>>> 	crtc_disable
>>>>>>>
>>>>>>> 	bridge[1]_post_disable
>>>>>>> 	...
>>>>>>> 	bridge[n]_post_disable
>>>>>>>
>>>>>>> The definition of bridge pre_enable hook says that,
>>>>>>> "The display pipe (i.e. clocks and timing signals) feeding this bridge
>>>>>>> will not yet be running when this callback is called".
>>>>>>>
>>>>>>> Since CRTC is also a source feeding the bridge, it should not be enabled
>>>>>>> before the bridges in the pipeline are pre_enabled. Fix that by
>>>>>>> re-ordering the sequence of bridge pre_enable and bridge post_disable.
>>>>>>>
>>>>>>> While at it, update the drm bridge API documentation as well.
>>>>>>>
>>>>>>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>>>>>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>>> Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>>>>>> Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>>>>>>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>>>>>>> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
>>>>>> This patch landed in today's linux-next as commit c9b1150a68d9
>>>>>> ("drm/atomic-helper: Re-order bridge chain pre-enable and
>>>>>> post-disable"). In my tests I found that it breaks booting of Samsung
>>>>>> Exynos 5420/5800 based Chromebooks (Peach-Pit and Peach-Pi). Both of
>>>>>> them use Exynos DRM with Exynos_DP sub-driver (Analogix DP) and EDP
>>>>>> panel. Booting stops at '[drm] Initialized exynos 1.1.0 for exynos-drm
>>>>>> on minor 0' message. On the other hand, the Samsung Exynos5250 based
>>>>>> Snow Chromebook boots fine, but it uses dp-lvds nxp,ptn3460 bridge and
>>>>>> lvds panel instead of edp panels. This looks like some sort of deadlock,
>>>>>> because if I disable FBDEV emulation, those boards boots fine and I'm
>>>>>> able to run modetest and enable the display. Also the DRM kernel logger
>>>>>> seems to be working fine, although I didn't check the screen output yet,
>>>>>> as I only have a remote access to those boards. I will investigate it
>>>>>> further and let You know.
>>>>> Thanks for the report. I was trying to understand the pipeline, but I'm
>>>>> a bit confused. Above you say Peach-Pit uses DP and EDP panel, but if I
>>>>> look at arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts, it connects
>>>>> a dp->lvds bridge (parade,ps8625). Peach-Pi seems to connect to an eDP
>>>>> panel.
>>>>>
>>>>> Is the above correct? Do both Peach-Pi and Peach-Pit fail?
>>>> Yes, sorry, my fault. I much have checked the same (peach-pi) dts 2
>>>> times. Both Peach-Pi and Peach-Pit fails, while Snow works fine. All
>>>> three use the same Exynos DP (based on analogix dp) driver. I will try
>>>> to play a bit more with those boards in the afternoon, hopefully getting
>>>> some more hints where the issue is.
>>> Did you get a chance to test this more? Any hints what happens will help =)
>> I've spent some time debugging this issue, but so far I only got
>> something I don't really understand. This issue is somehow related with
>> the DP clock enabling and disabling, what is being done from
>> exynos_dp_poweron() and exynos_dp_poweroff() functions, which are called
>> from analogix_dp_resume() and analogix_dp_suspend(). The lockup happens
>> somewhere while registering the fbdev console, with console lock held,
>> what makes debugging much harder.
> You can skip the locking part with the fb.lockless_register_fb=1 kernel
> parameter. It's of course not meant for anything but debugging, but it's
> useful :)

I've finally found where is the problem! It turned out that the issue is 
in the exynos_drm_fimd driver, in the code for enabling the display port 
clock (fimd_dp_clock_enable()
  function). It touches FIMD regs, but it was not guarded with FIMD's 
runtime pm calls and after the $subject change it happened that 
exynos_dp/analogix_dp code called the clock enable/disable when FIMD 
driver (which implements the CRTC object) was not runtime resumed. 
Previously all dp clock handling was done when CRTC was enabled, thus 
the FIMD device was in the resumed runtime pm state.

I will send a patch fixing this soon.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

