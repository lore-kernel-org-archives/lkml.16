Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD742D63E8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 15:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751642781; cv=none; b=l/qRUBWvdnDUrpXmXg5Y9V2uLAhNxkbpNMucfWrCGLBljPz+AVwYessSfvHxF1BfcAz+gX3PFAuplAjgPpA5xyoLfHM8tf5G4ieizVS6odeJR/YzcNbFqBDfyvlZusKb/p7+8Kyozd5+vUi9cqIv6SB01/UgIhNBwOMHMdQL+ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751642781; c=relaxed/simple;
	bh=ohRy4gcoGuEcRKZpJdSU1G0sKmqubXx68E7KSC1A01I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZaV7GQQiEkeNQseZFFb4HBi4Zt81RedhGa8p65Xzkw+FSzaZrMuZJCQGbCUa8JKgYpEhALJiYScgqQ/v2e7y9pcNFFO1VWYMCmbDD2asa5TqD7+zbcAPHVrNFC2bvo/3QY+UybNK5QhAOJHmf2w4N4BXUDvBB3PVQoW65NW330s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IQpuTJ46; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IQpuTJ46"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751642770;
	bh=ohRy4gcoGuEcRKZpJdSU1G0sKmqubXx68E7KSC1A01I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IQpuTJ46xB7t9TZsLEqdQUqcaUBAf7UcGR9KeXm5AbW+VdHtVw9PDpxe3+Zx8pk1A
	 2tofxiaQsxOsBqI1Xoko5rRmH1K5bu7qQfSPpuDh9FHDevntD6KW1HNq8gawLU7HWj
	 QN/lN+G1R0r+Nw79biJPjRdmz1WYurJMekV6zpmEDl6scwasEp6xsbqmNTSljPz6J6
	 pDCt8GB71tdiXMdZ++n5SpjvzRnxX7/0eOzOnA9yMMhfpHs04vvBc2wV18ZLD0P/6T
	 hvRxPGgcRDfX0NNfaE6a/UgspTX3s/2td2/OaNlIvJoPeuPYsoHL9B+Vb1799nm2kj
	 uNYYV5pFL+w3w==
Received: from [192.168.1.90] (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EDC8517E07C9;
	Fri,  4 Jul 2025 17:26:09 +0200 (CEST)
Message-ID: <c08e55bb-fb93-44d6-bcb2-f1a1b78a5fb7@collabora.com>
Date: Fri, 4 Jul 2025 18:26:09 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/rockchip: dw_hdmi_qp: Provide ref clock rate in
 dw_hdmi_qp_plat_data
To: Maxime Ripard <mripard@kernel.org>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250704-rk3588-hdmi-cec-v1-0-2bd8de8700cd@collabora.com>
 <20250704-rk3588-hdmi-cec-v1-3-2bd8de8700cd@collabora.com>
 <20250704-granite-piculet-of-elevation-f01e08@houat>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20250704-granite-piculet-of-elevation-f01e08@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Maxime,

On 7/4/25 6:07 PM, Maxime Ripard wrote:
> On Fri, Jul 04, 2025 at 05:23:24PM +0300, Cristian Ciocaltea wrote:
>> In order to support correct initialization of the timer base in the HDMI
>> QP IP block, extend the platform data to provide the necessary reference
>> clock rate.
>>
>> While at it, ensure plat_data is zero-initialized in
>> dw_hdmi_qp_rockchip_bind().
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 13 ++++++++++++-
>>  include/drm/bridge/dw_hdmi_qp.h                |  1 +
>>  2 files changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
>> index 126e556025961e8645f3567b4d7a1c73cc2f2e7f..8c1185490009c5f1bc658998a868f8b18dc479a3 100644
>> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
>> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
>> @@ -431,8 +431,8 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>>  				    void *data)
>>  {
>>  	struct platform_device *pdev = to_platform_device(dev);
>> +	struct dw_hdmi_qp_plat_data plat_data = {};
>>  	const struct rockchip_hdmi_qp_cfg *cfg;
>> -	struct dw_hdmi_qp_plat_data plat_data;
>>  	struct drm_device *drm = data;
>>  	struct drm_connector *connector;
>>  	struct drm_encoder *encoder;
>> @@ -515,6 +515,17 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>>  		return ret;
>>  	}
>>  
>> +	for (i = 0; i < ret; i++) {
>> +		if (!strcmp(clks[i].id, "ref")) {
>> +			plat_data.ref_clk_rate = clk_get_rate(clks[i].clk);
>> +			break;
>> +		}
>> +	}
>> +	if (!plat_data.ref_clk_rate) {
>> +		dev_err(hdmi->dev, "Missing ref clock\n");
>> +		return -EINVAL;
>> +	}
>> +
> 
> You'd be better off not using clk_bulk, or calling an additional clk_get
> for the ref clock only.

I'd keep clk_bulk as there are 5 more clocks in the list.  But replacing the
loop with just an extra clk_get would be a simpler approach, indeed, so
thanks for the hint!

Regards,
Cristian
