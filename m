Received: from mail-m155116.qiye.163.com (mail-m155116.qiye.163.com [101.71.155.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7298468
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 02:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744596089; cv=none; b=RNAbfHX3G02437dlNF5r7lDOraxxlI+u97f9vRRHWaht7HCJQkueTMbJbCH+z/PoEuB6tYG3W1OOgjmAX8ev3whqD11tbLdTYyi8Fsp+LtqMuL0XMZ8HgsuYYq34hF51PWSKYAartTKibDf5hZTwSbmKg5Km2C3Ak7/ZFto+L8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744596089; c=relaxed/simple;
	bh=/E/HgHCXu3ul/vRPec2Ml+NiFGn0IvYroichMiFTqhI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=rcHO0xnJoee89iUrd6+5g2wA3ws2vM4jGHUK/Ua4vh6+gqqu1rHDGP8BJEDC9AhELZTlEnXImhEEEPkEN3gqpsKACttvzaAwUd0s+Gj9eJ3yTLSifI4huDx0rwS0pYpq6jGT6HhnSwecUthLATJtc3Cr8UQfe6YCt2QuBgPelCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=c/Xu4uLX; arc=none smtp.client-ip=101.71.155.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="c/Xu4uLX"
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 11bb6fb66;
	Mon, 14 Apr 2025 10:01:16 +0800 (GMT+08:00)
Message-ID: <d0641e38-0d89-49ea-84c6-66707021406b@rock-chips.com>
Date: Mon, 14 Apr 2025 10:01:16 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm/bridge: analogix_dp: drop extra calls to
 analogix_dp_prepare_panel()
From: Damon Ding <damon.ding@rock-chips.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, rfoss@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de
References: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
 <20250401-panel-return-void-v1-1-93e1be33dc8d@oss.qualcomm.com>
 <6b662c34-7a1d-4e07-aaa7-752bc0c7575f@rock-chips.com>
Content-Language: en-US
In-Reply-To: <6b662c34-7a1d-4e07-aaa7-752bc0c7575f@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk5MHVYfSxlNSxpCS0NDSB9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a963207885203a3kunm11bb6fb66
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NDI6Fxw6TTJPKC5LQj4fMiwu
	ITMKCgtVSlVKTE9PTkJNS0xDSk1NVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFPTk1DNwY+
DKIM-Signature:a=rsa-sha256;
	b=c/Xu4uLXLBJUJNlnNN5UJhUZMjA82gFdfKy6Fd3XMRmOTTC+kfB1NoJee2R7SROwXG1ag94grIt2kqdDr+0d2OUJlb3rumJJXLo+oD1dvJ80rkgwrFNKtwW1mnuSsfXGdikZWbI7+Y8wqVKkXXGT6zfh3AURHId9R/MFF1eS11U=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=S8Dtge/RP6NJBdGaWra/8A5/z9Ga2Syj02VicKODVGw=;
	h=date:mime-version:subject:message-id:from;

On 2025/4/14 9:20, Damon Ding wrote:
> Hi Dmitry,
> 
> On 2025/4/1 13:11, Dmitry Baryshkov wrote:
>> The analogix_dp_prepare_panel() returns immediately if there is no
>> attached panel. Drop several calls to this function which are performed
>> when dp->plat_data->panel is NULL.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 22 
>> +---------------------
>>   1 file changed, 1 insertion(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/ 
>> drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> index 
>> 042154e2d8ccd74ac2dc27fe527e810a50e08a09..ab1cfc340aa95bbf13fe021bd33227b565a5458d 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> @@ -1005,17 +1005,11 @@ static int analogix_dp_get_modes(struct 
>> drm_connector *connector)
>>   {
>>       struct analogix_dp_device *dp = to_dp(connector);
>>       const struct drm_edid *drm_edid;
>> -    int ret, num_modes = 0;
>> +    int num_modes = 0;
>>       if (dp->plat_data->panel) {
>>           num_modes += drm_panel_get_modes(dp->plat_data->panel, 
>> connector);
>>       } else {
>> -        ret = analogix_dp_prepare_panel(dp, true, false);
>> -        if (ret) {
>> -            DRM_ERROR("Failed to prepare panel (%d)\n", ret);
>> -            return 0;
>> -        }
>> -
>>           drm_edid = drm_edid_read_ddc(connector, &dp->aux.ddc);
>>           drm_edid_connector_update(&dp->connector, drm_edid);
>> @@ -1024,10 +1018,6 @@ static int analogix_dp_get_modes(struct 
>> drm_connector *connector)
>>               num_modes += drm_edid_connector_add_modes(&dp->connector);
>>               drm_edid_free(drm_edid);
>>           }
>> -
>> -        ret = analogix_dp_prepare_panel(dp, false, false);
>> -        if (ret)
>> -            DRM_ERROR("Failed to unprepare panel (%d)\n", ret);
>>       }
>>       if (dp->plat_data->get_modes)
>> @@ -1087,19 +1077,9 @@ analogix_dp_detect(struct drm_connector 
>> *connector, bool force)
>>       if (dp->plat_data->panel)
>>           return connector_status_connected;
>> -    ret = analogix_dp_prepare_panel(dp, true, false);
>> -    if (ret) {
>> -        DRM_ERROR("Failed to prepare panel (%d)\n", ret);
>> -        return connector_status_disconnected;
>> -    }
>> -
>>       if (!analogix_dp_detect_hpd(dp))
>>           status = connector_status_connected;
>> -    ret = analogix_dp_prepare_panel(dp, false, false);
>> -    if (ret)
>> -        DRM_ERROR("Failed to unprepare panel (%d)\n", ret);
>> -
>>       return status;
>>   }
>>
> 
> With the patch series:
> https://patchwork.kernel.org/project/linux-rockchip/list/?series=942183
> 
> When I verify this patch, there will be a small warning:
> drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1075:6: warning: 
> unused variable 'ret' [-Wunused-variable]
>          int ret;
>              ^
> 
> It should be better to remove the unused 'ret'.
> 
> Best regards,
> Damon
> 
> 
> 

Tested-by: Damon Ding <damon.ding@rock-chips.com>

