Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE711F03C7
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748382909; cv=none; b=q/sm7VvGqDC7AcSlijleaatQbdInoXAOSpNAiHilPvndgiOpdKFCwecnxrA9HJ1RDKdh6HTKfv1JXKXcDYO6oPHNbb+i2tpgb1Z6HjC2Qgk4Oo7HNbMmGtGfZAhk/F9EhrecDrzZ/Mr7+hdl2fYGr7+awb2kfW/rkMq+nXyXR90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748382909; c=relaxed/simple;
	bh=nXe1Icil4NeLuKAWL16jSsRo21UwSmmjNwPMHL3MN2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MdSMBsxtKXBW8GqXKPuDs940mUIvBogsPtTY1qPXMaZEdsL3uzCAUGnXopZ9p+PDM+BrnV5P1Ti71K0tM5RutEiECCLg1z8ZgC0hSWfE8OIzS5beq6ce8E0ShyNL1FODCKZKg5i4Pe7KVh63h1XBUodmgbCwPA7M9Nn4k2f+Cto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NiN1Q+zx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NiN1Q+zx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RHTYvi028888
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ne0gIQPeeXA6jgzWvpGK1bbR
	cxhFrzGXDtK9BlZZ+0M=; b=NiN1Q+zxSFX1HVMJWUPBbHM1fj+PQogE32B9s9rh
	fZGbO7tmuoSg1WWTh+X/wNeIxzv0byXz2o5MpeZ5EJEYngFXnJmyuxsj+pZaqL+x
	OwjeiHW4Osj5N2T807P3WR+ThjkQXlskCiqSrb6Ft4NU/hgNelJnFnDEVmh+YUUd
	XLdVQ2Dr/jbokc+ZoGPJquor1Dv2Utws+QGCAAmbn3qdrWrTXFxlM1fW0ffpjDCF
	KHS/QV+HAvQa74q+uDrL55uZmLw4WGB011gvLeLYAH6SG1XT9/k2a1nMdG9gbliK
	NPMXo7u3nSwd7VKo7XkLPp7n2FOhS9PFLPr3mPr6Okajhw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46whuf0nct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:55:06 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fab07aa5e1so43615626d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:55:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748382905; x=1748987705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ne0gIQPeeXA6jgzWvpGK1bbRcxhFrzGXDtK9BlZZ+0M=;
        b=Hz1xuqKlAI17yuooBXLtBvOvzeiZlI474XsXkxXcHbr6sx346c5rxeyYqRCEbzIcCw
         kLC8RYWiaNv2hc5t/ErmNvCr3WXCm7XRWEz2e5/F6fYmwISpHrQCgKqbQoKpWY8jDu48
         UZ7iYp5zhHVgpTGq/Cw5rstXdZwyzxpnuOxCFspplfhJ0WI9Fg2ZdWyF0uu6YebFlsjK
         a3V8CqcHblGS2VMT0JVKBt1I+mDkr7qIL75hgwnh2JIul7zNMP0rtoBRwcZROK0pid5G
         q2KWFSm09Lp3zQ9+U8zhphp2hELiaU1L9vmyMbumt4C+5HHNsmljKnAW6ud1vm5k5v5U
         /u1w==
X-Forwarded-Encrypted: i=1; AJvYcCUzid5+CiC4K1ZadC972favGyNdt5bEVplbKtY80shIq+Tm3XRUhtSGqRJ697ujftEPsP7W+4D8+VtHK48=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2yUY4bUsWpVWdz0pa9/cyGYAwFUDWZPHPWHFfq92gw5+LETHQ
	TKuPFChv9npxlYcvkWt+fTJsvl2DzF4JOi2nHuufXJp4IzG3gMqQoTPkZRWmtZCf10OChgFHyDW
	Q50g0cusZ/b6HXEyFw1IpjUiyVYJHy2kF2c9zz+QMfiJLIDVoKllmnNAmqz1yJt7AXg8=
X-Gm-Gg: ASbGncv3Q36xvjZgHT0+Ky/ACAPm4wUw9jbA3HeLdZemqaw0kuLMy6e4WxXguSq8jLo
	B5QoOYxW9RNxEBAWH8n08SreG28AZmJxZi0J6CLIKzTSDhkJxjBij0L8HjWVfoDOopOU0L4HZZw
	07FnVgi1OuzofEQg4xxuxxsd/9OWu8A9+F8zAtXgNDyINPDBoCgqgCVqLtnHAn7kmJOQ9xH7Int
	lsQfJQLW5XpMsrQJLDZtD8wQA3Ml0cfpoxkKQzmNDlzs5qWUfFszX8ZlfnNRQDT5Fx9fjgq5i7U
	tdoiZ0CgQ1jasrGuT47IsQdqSyIAmjzz4w2aufDgT2MhnsOi1tFbxY+SoYQHASI8jNr06mgQA64
	=
X-Received: by 2002:a05:6214:5095:b0:6f2:d25e:8f60 with SMTP id 6a1803df08f44-6fa9d2aea48mr243069896d6.22.1748382905545;
        Tue, 27 May 2025 14:55:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcBAog/0QNelbBSobBObHpDOHFG6hBJ6xtUMTJD3tXlDyIcI+Swq6mULnQ7WDRT6XsVldWdA==
X-Received: by 2002:a05:6214:5095:b0:6f2:d25e:8f60 with SMTP id 6a1803df08f44-6fa9d2aea48mr243069596d6.22.1748382905125;
        Tue, 27 May 2025 14:55:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532edde019sm45678e87.49.2025.05.27.14.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 14:55:03 -0700 (PDT)
Date: Wed, 28 May 2025 00:55:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 5/6] phy: qcom: qmp-combo: register a typec mux to
 change the QMPPHY_MODE
Message-ID: <itmvwhcf37bmnpadcyc7kdt7wx3eljyjwyv64s24zwhbr2e45g@76uzcpjqzx22>
References: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
 <20250527-topic-4ln_dp_respin-v3-5-f9a0763ec289@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527-topic-4ln_dp_respin-v3-5-f9a0763ec289@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OslPyz/t c=1 sm=1 tr=0 ts=683634bb cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=RX03QJoVYHKw4zbBXYoA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: cn4L5kZ1UAWZYvCrDy_DUIVsINjwln2x
X-Proofpoint-GUID: cn4L5kZ1UAWZYvCrDy_DUIVsINjwln2x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE4NCBTYWx0ZWRfX+SZfhsRAL6JC
 /tyB8rsMVkYjQ2sLa7T1WjMP0k52sRNfqscboS/zUMhO/S5BJRTkqKJimbr8hOsE0+mmL24Rmum
 s9T8/2yYt+l2lgOEGO2r9ySBivbE7EKrFJD/dYCwZyT00Y+FS085l7mbiOfUumUDqLmBaRC8cw3
 i4BVWsaslqmOV3ASf252i82p7CmmVAZVHAVDqMusAmTggCIgLjVP/p9mDuHTk1vjsMrNnrQYkfm
 UPQBL8S7nw6ecrBPo0pmTKI1L0rNR5Jjq2p0McXQovXdrH8+z+5vd+8OxEcRl5R23X0D6jOHBh7
 bFz7hUDo0jQjKfMlioHgSZKvci6q49fVF8+s0BZty56FunRRDjsju5NovMX1jmH4CEI2bn6uuK8
 ycLBPg4ocm9WKf0AItdwNu267V4/yPJ1n97NE80bcwqRxJ5rqrQONid7CnS6QPquHJ3DkdHW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270184

On Tue, May 27, 2025 at 10:40:07PM +0200, Konrad Dybcio wrote:
> From: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Register a typec mux in order to change the PHY mode on the Type-C
> mux events depending on the mode and the svid when in Altmode setup.
> 
> The DisplayPort phy should be left enabled if is still powered on
> by the DRM DisplayPort controller, so bail out until the DisplayPort
> PHY is not powered off.
> 
> The Type-C Mode/SVID only changes on plug/unplug, and USB SAFE states
> will be set in between of USB-Only, Combo and DisplayPort Only so
> this will leave enough time to the DRM DisplayPort controller to
> turn of the DisplayPort PHY.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> [konrad: renaming, rewording, bug fixes]
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 121 ++++++++++++++++++++++++++++--
>  1 file changed, 116 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index b34ad92021a656b39562e2685a1e7a0a93660a35..4c9d92d6e0b8508191d052bd85dd135e4b8d7cc7 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -19,6 +19,7 @@
>  #include <linux/reset.h>
>  #include <linux/slab.h>
>  #include <linux/usb/typec.h>
> +#include <linux/usb/typec_dp.h>
>  #include <linux/usb/typec_mux.h>
>  
>  #include <drm/bridge/aux-bridge.h>
> @@ -1709,6 +1710,8 @@ struct qmp_combo {
>  
>  	struct typec_switch_dev *sw;
>  	enum typec_orientation orientation;
> +
> +	struct typec_mux_dev *mux;
>  };
>  
>  static void qmp_v3_dp_aux_init(struct qmp_combo *qmp);
> @@ -3582,17 +3585,112 @@ static int qmp_combo_typec_switch_set(struct typec_switch_dev *sw,
>  	return 0;
>  }
>  
> -static void qmp_combo_typec_unregister(void *data)
> +static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_state *state)
> +{
> +	struct qmp_combo *qmp = typec_mux_get_drvdata(mux);
> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> +	enum qmpphy_mode new_mode;
> +	unsigned int svid;
> +
> +	guard(mutex)(&qmp->phy_mutex);
> +
> +	if (state->alt)
> +		svid = state->alt->svid;
> +	else
> +		svid = 0;
> +
> +	if (svid == USB_TYPEC_DP_SID) {
> +		switch (state->mode) {
> +		/* DP Only */
> +		case TYPEC_DP_STATE_C:
> +		case TYPEC_DP_STATE_E:
> +			new_mode = QMPPHY_MODE_DP_ONLY;
> +			break;
> +
> +		/* DP + USB */
> +		case TYPEC_DP_STATE_D:
> +		case TYPEC_DP_STATE_F:
> +
> +		/* Safe fallback...*/
> +		default:
> +			new_mode = QMPPHY_MODE_USB3DP;
> +			break;
> +		}
> +	} else {
> +		/* Fall back to USB3+DP mode if we're not sure it's strictly USB3-only */

Why? if the SID is not DP, then there can't be a DP stream.

> +		if (state->mode == TYPEC_MODE_USB3 || state->mode == TYPEC_STATE_USB)
> +			new_mode = QMPPHY_MODE_USB3_ONLY;
> +		else
> +			new_mode = QMPPHY_MODE_USB3DP;
> +	}
> +
> +	if (new_mode == qmp->qmpphy_mode) {
> +		dev_dbg(qmp->dev, "typec_mux_set: same qmpphy mode, bail out\n");
> +		return 0;
> +	}
> +
> +	if (qmp->qmpphy_mode != QMPPHY_MODE_USB3_ONLY && qmp->dp_powered_on) {
> +		dev_dbg(qmp->dev, "typec_mux_set: DP PHY is still in use, delaying switch\n");
> +		return 0;
> +	}

Consider the following scenario: connect DP dongle, use modetest to
setup DP stream, disconnect dongle, connect USB3 device. What would be
the actual state of the PHY? Modetest is still running, so DP stream is
not going to be shut down from the driver.

I think we might need a generic notifier from the PHY to the user,
telling that the PHY is going away (or just that the PHY is changing the
state). Then it would be usable by both the DP and USB drivers to let
them know that they should toggle the state.

> +
> +	dev_dbg(qmp->dev, "typec_mux_set: switching from qmpphy mode %d to %d\n",
> +		qmp->qmpphy_mode, new_mode);
> +
> +	qmp->qmpphy_mode = new_mode;
> +
> +	if (qmp->init_count) {
> +		if (qmp->usb_init_count)
> +			qmp_combo_usb_power_off(qmp->usb_phy);
> +
> +		if (qmp->dp_init_count)
> +			writel(DP_PHY_PD_CTL_PSR_PWRDN, qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
> +
> +		qmp_combo_com_exit(qmp, true);
> +
> +		/* Now everything's powered down, power up the right PHYs */
> +		qmp_combo_com_init(qmp, true);
> +
> +		if (new_mode == QMPPHY_MODE_DP_ONLY) {
> +			if (qmp->usb_init_count)
> +				qmp->usb_init_count--;
> +		}
> +
> +		if (new_mode == QMPPHY_MODE_USB3DP || new_mode == QMPPHY_MODE_USB3_ONLY) {
> +			qmp_combo_usb_power_on(qmp->usb_phy);
> +			if (!qmp->usb_init_count)
> +				qmp->usb_init_count++;
> +		}
> +
> +		if (new_mode == QMPPHY_MODE_DP_ONLY || new_mode == QMPPHY_MODE_USB3DP) {
> +			if (qmp->dp_init_count)
> +				cfg->dp_aux_init(qmp);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void qmp_combo_typec_switch_unregister(void *data)
>  {
>  	struct qmp_combo *qmp = data;
>  
>  	typec_switch_unregister(qmp->sw);
>  }
>  
> -static int qmp_combo_typec_switch_register(struct qmp_combo *qmp)
> +static void qmp_combo_typec_mux_unregister(void *data)
> +{
> +	struct qmp_combo *qmp = data;
> +
> +	typec_mux_unregister(qmp->mux);
> +}
> +
> +static int qmp_combo_typec_register(struct qmp_combo *qmp)
>  {
>  	struct typec_switch_desc sw_desc = {};
> +	struct typec_mux_desc mux_desc = { };
>  	struct device *dev = qmp->dev;
> +	int ret;
>  
>  	sw_desc.drvdata = qmp;
>  	sw_desc.fwnode = dev->fwnode;
> @@ -3603,10 +3701,23 @@ static int qmp_combo_typec_switch_register(struct qmp_combo *qmp)
>  		return PTR_ERR(qmp->sw);
>  	}
>  
> -	return devm_add_action_or_reset(dev, qmp_combo_typec_unregister, qmp);
> +	ret = devm_add_action_or_reset(dev, qmp_combo_typec_switch_unregister, qmp);
> +	if (ret)
> +		return ret;
> +
> +	mux_desc.drvdata = qmp;
> +	mux_desc.fwnode = dev->fwnode;
> +	mux_desc.set = qmp_combo_typec_mux_set;
> +	qmp->mux = typec_mux_register(dev, &mux_desc);
> +	if (IS_ERR(qmp->mux)) {
> +		dev_err(dev, "Unable to register typec mux: %pe\n", qmp->mux);
> +		return PTR_ERR(qmp->mux);
> +	}
> +
> +	return devm_add_action_or_reset(dev, qmp_combo_typec_mux_unregister, qmp);
>  }
>  #else
> -static int qmp_combo_typec_switch_register(struct qmp_combo *qmp)
> +static int qmp_combo_typec_register(struct qmp_combo *qmp)
>  {
>  	return 0;
>  }
> @@ -3839,7 +3950,7 @@ static int qmp_combo_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_node_put;
>  
> -	ret = qmp_combo_typec_switch_register(qmp);
> +	ret = qmp_combo_typec_register(qmp);
>  	if (ret)
>  		goto err_node_put;
>  
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
