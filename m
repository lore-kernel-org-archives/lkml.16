Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AF01CCEE0;
	Fri,  9 May 2025 22:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746830736; cv=none; b=ugv7zVoGfzftNWjSzA5K03l81cyHyR+ddgqqQ9lM+iOGSeuNSq+kCVNKx2GzcJR+Enje12V0XCToy+IAsR/oG5YAG8sLGMrZU9lKeYqBCw0LjbZOXHWr4KaBQLA5W7u9YutydJtttT0A0WjS2eXQsR8mbpEP32oWJXuTVKwbpwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746830736; c=relaxed/simple;
	bh=TpPP2X6rtxP/+RyiQC70IXzdse7yR2XTv5mD6Q4SZ2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BtVZ7T0HOXlKgobii25xx14ZBy5SZaSolB9uw9ulXLmj8a0+2aVeraM/Qa5w/xnZzsktvg3I+KWYbA1moeIxwoPzvLqHGCrwURrx/YKRO0W1ndoVpHF7y/nkxc9esWMinOl5Exn2GkzsUnYS5MyhNmde6tVBMqQhQAs2KaPLQbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mfUZeCNh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mfUZeCNh"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549BDrEI030761;
	Fri, 9 May 2025 22:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fX1cA4peVNrlprKMvdXDSM2KxSSUO+7kGX4aKFoHpYI=; b=mfUZeCNhnP+8Scqx
	yXGQmaGOiri9uT5WwdHjtNowICAvMAfbq/BTHxrA+9Nn1aIOvOY81wqXZ0rMUoRK
	cT6rWXdAkIw53IDXhjufWrhcC02fs0GbGGB/oTkufJfty6TNSWjZO2h3KzqH/XfS
	wVlqq3f1LI1WFbPpdO0GbfgFbEZFcZjv8Lr55asWCx78A6COU9R0tjcXwxXJIsoD
	5yPe06E7aGxxkTevIjCACd75oGRkKRph4WUGcF0ZfPCO+6VbYnTknaATD+kfpy5L
	jRdFnHx0cK5edNEuOtDi4VsT+W50Lw6MrcHZqORZLHJHXDJ8AD4ytpn/rjPINF0X
	sqHqwg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpgnwd7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 22:45:18 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 549MjHqL024230
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 22:45:17 GMT
Received: from [10.134.71.99] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 9 May 2025
 15:45:16 -0700
Message-ID: <a5153830-ebd1-4bd7-8d16-63736ea83e8c@quicinc.com>
Date: Fri, 9 May 2025 15:45:16 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] drm/panel: visionox-rm69299: add plumbing to
 support panel variants
To: Neil Armstrong <neil.armstrong@linaro.org>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>
References: <20250509-topic-misc-shift6-panel-v2-0-c2c2d52abd51@linaro.org>
 <20250509-topic-misc-shift6-panel-v2-2-c2c2d52abd51@linaro.org>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250509-topic-misc-shift6-panel-v2-2-c2c2d52abd51@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Ao/u3P9P c=1 sm=1 tr=0 ts=681e857e cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=VvLeHfD4lORLXuUKFWwA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDIyOSBTYWx0ZWRfX9/AUkS0FgPto
 kWgi5/p3ym6Je+LITP8xiEmuHnO61r1T9OpZsUkOx5EazyVqLhs6hCxcdY+o7nuZTdgzmjcS6As
 NH45qWLix14NA7ysrX6b4g1C7Y44FXL/izBvBGS/3Fj3WVlw7PKI8eiIttBQjjnXzyXyVlo8Ftc
 J3Gh8+PbyWKYb3wrXjaERzvG4tPKUAV3wOZl2z+mby0wOnFgwuFXrB/g7nBhCcPkQwUVXAXHQ4r
 T/UpPYelp3J32iKJvYXeBfo+xX6dH+glbrhnAvAWhtUIRHX48YTidgE5jjBO58GEBpsGuKlKK8W
 YUOryj4lfBpFPQOeoaG+HxVy1sui+Lr+AMLDjrdNvWyx74yo1ISw+WcZ8rohM3Zw08iI90L6giW
 Oxvrf3/aobPHgMTUT6EzrxwwxTJsY3MXhHKBNcxe3kb4t0NC6Up7gnTsP8LFyRUvm9+LN8l/
X-Proofpoint-GUID: etcG3GkQICi8Czg72oXt2QsYsYBrCPDs
X-Proofpoint-ORIG-GUID: etcG3GkQICi8Czg72oXt2QsYsYBrCPDs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_09,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090229



On 5/9/2025 1:59 AM, Neil Armstrong wrote:
> In order to support a panel variant, add plumbing code to pass
> init sequence and mode as compatible data.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/panel/panel-visionox-rm69299.c | 58 ++++++++++++++------------
>   1 file changed, 32 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> index be3a9797fbced5222b313cf83f8078b919e2c219..156bca0197481b470fa85b2eab7c979b76e489b6 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> @@ -5,6 +5,7 @@
>   
>   #include <linux/delay.h>
>   #include <linux/module.h>
> +#include <linux/property.h>
>   #include <linux/mod_devicetable.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/regulator/consumer.h>
> @@ -15,11 +16,22 @@
>   #include <drm/drm_modes.h>
>   #include <drm/drm_panel.h>
>   
> +struct visionox_rm69299_panel_desc {
> +	const struct drm_display_mode *mode;
> +	const u8 *init_seq;
> +	unsigned int init_seq_len;
> +};
> +
>   struct visionox_rm69299 {
>   	struct drm_panel panel;
>   	struct regulator_bulk_data supplies[2];
>   	struct gpio_desc *reset_gpio;
>   	struct mipi_dsi_device *dsi;
> +	const struct visionox_rm69299_panel_desc *desc;
> +};
> +
> +static const u8 visionox_rm69299_1080x2248_60hz_init_seq[][2] = {
> +	{ 0xfe, 0x00 }, { 0xc2, 0x08 }, { 0x35, 0x00 }, { 0x51, 0xff },
>   };
>   
>   static inline struct visionox_rm69299 *panel_to_ctx(struct drm_panel *panel)
> @@ -84,7 +96,7 @@ static int visionox_rm69299_unprepare(struct drm_panel *panel)
>   static int visionox_rm69299_prepare(struct drm_panel *panel)
>   {
>   	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
> -	int ret;
> +	int ret, i;
>   
>   	ret = visionox_rm69299_power_on(ctx);
>   	if (ret < 0)
> @@ -92,28 +104,12 @@ static int visionox_rm69299_prepare(struct drm_panel *panel)
>   
>   	ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
>   
> -	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]) { 0xfe, 0x00 }, 2);
> -	if (ret < 0) {
> -		dev_err(ctx->panel.dev, "cmd set tx 0 failed, ret = %d\n", ret);
> -		goto power_off;
> -	}
> -
> -	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]) { 0xc2, 0x08 }, 2);
> -	if (ret < 0) {
> -		dev_err(ctx->panel.dev, "cmd set tx 1 failed, ret = %d\n", ret);
> -		goto power_off;
> -	}
> -
> -	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]) { 0x35, 0x00 }, 2);
> -	if (ret < 0) {
> -		dev_err(ctx->panel.dev, "cmd set tx 2 failed, ret = %d\n", ret);
> -		goto power_off;
> -	}
> -
> -	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]) { 0x51, 0xff }, 2);
> -	if (ret < 0) {
> -		dev_err(ctx->panel.dev, "cmd set tx 3 failed, ret = %d\n", ret);
> -		goto power_off;
> +	for (i = 0; i < ctx->desc->init_seq_len; i++) {
> +		ret = mipi_dsi_dcs_write_buffer(ctx->dsi, &ctx->desc->init_seq[i * 2], 2);
> +		if (ret < 0) {
> +			dev_err(ctx->panel.dev,	"cmd tx failed, ret = %d\n", ret);
> +			return ret;
> +		}
>   	}
>   
>   	ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_EXIT_SLEEP_MODE, NULL, 0);
> @@ -160,8 +156,7 @@ static int visionox_rm69299_get_modes(struct drm_panel *panel,
>   	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
>   	struct drm_display_mode *mode;
>   
> -	mode = drm_mode_duplicate(connector->dev,
> -				  &visionox_rm69299_1080x2248_60hz);
> +	mode = drm_mode_duplicate(connector->dev, ctx->desc->mode);
>   	if (!mode) {
>   		dev_err(ctx->panel.dev, "failed to create a new display mode\n");
>   		return 0;
> @@ -191,6 +186,10 @@ static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
>   	if (!ctx)
>   		return -ENOMEM;
>   
> +	ctx->desc = device_get_match_data(dev);
> +	if (!ctx->desc)
> +		return -EINVAL;
> +
>   	mipi_dsi_set_drvdata(dsi, ctx);
>   
>   	ctx->dsi = dsi;
> @@ -239,8 +238,15 @@ static void visionox_rm69299_remove(struct mipi_dsi_device *dsi)
>   	drm_panel_remove(&ctx->panel);
>   }
>   
> +const struct visionox_rm69299_panel_desc visionox_rm69299_1080p_display_desc = {
> +	.mode = &visionox_rm69299_1080x2248_60hz,
> +	.init_seq = (const u8 *)visionox_rm69299_1080x2248_60hz_init_seq,
> +	.init_seq_len = ARRAY_SIZE(visionox_rm69299_1080x2248_60hz_init_seq),
> +};
> +
>   static const struct of_device_id visionox_rm69299_of_match[] = {
> -	{ .compatible = "visionox,rm69299-1080p-display", },
> +	{ .compatible = "visionox,rm69299-1080p-display",
> +	  .data = &visionox_rm69299_1080p_display_desc },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, visionox_rm69299_of_match);
> 

