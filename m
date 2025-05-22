Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B4928AB1E
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747917616; cv=none; b=BZKfLJSwfW8770KyZ2rOkYvrGBu5Ob7o7/sD3rxfaowpVMJYBN0Sy3rd9eYM5iTbU/JnzSoHbBHrlzY5PPvcH2624ANqTAVE8m3kQ7ym+Qoz67PuLIiL4nHfxwRgEQkGwtirn+fLyR2p8TZRkzPKmyahYg/fsAdhn71dW2zxod4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747917616; c=relaxed/simple;
	bh=comksqM040Dtg+dKOnenlhpQhBxf3j0t5doZzXqQIos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mzTCPUIHVMNLu/yySOCvpatktvfXCHXXlumriS9vXWxIVg5yXIHlbfRIpTGH2L4/vAnfZii5bY9R18UYtOoDNTgzIy8snrHGkSojHbSIfVpNaomZxxwSJ2OH5GcCyy/6lgJ0VpgbjvDP8DWclael7vwv6pEnqR7kVcjN9g0rU2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VgQalo+0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VgQalo+0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M81xOb029164
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+EqEHGQsGLV7fMWgFHiDCICo
	9owZC5//Pie9xhLsJeQ=; b=VgQalo+0oOyORAiuezYHZYJqlNe7dZ4MnpprEVb9
	vwU8lKz3Z6m6Rli/ceqcyMqHNWDZTKZrwrQDJwEjJB9n+fQ46sFrHMYJy6UkK2oK
	Ic1SkaBhS3pPYcbwBAFu0JcGLJPjaIdpZdtUMH6kbvPKNcsvLCTCQXf+lal7bZ3N
	cWPNJJAgtyuEFAx4YeQ4+APzW/Gx9udZfw2ceEMM1W+v4rd2pz2qDK5tDkjtbBDK
	OuNfLY0VCMBLzk27BTvpEZFCX+YMR6tg21W1/OTTQ0HHCxHl0ZuKyCoMyJnTfEl3
	x0M0JcYU9q+VzC+xAp4bwjtdW7eHUWWOoG3bGigQivs1zg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf46d13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:40:13 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-734df68e9f3so7185298a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747917611; x=1748522411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+EqEHGQsGLV7fMWgFHiDCICo9owZC5//Pie9xhLsJeQ=;
        b=oJBYZM2XP4mlWLf+rUTmkprB7Ir2wt+QsTidJgGJikzXQiyE86Z05usQMpRs72py1b
         ELoQ5dNHxjupG0IzCNtw45V/4iXqWtUsdD7rPPtbTipZ5bVo+AoIQINKejHpaa1xiPEj
         jyBt2nQoSMAX2PFjcJEHTIah+Q0EgwYOdHsqOQUFSaWwesjm4PN4xksy3XmlE/i99RTX
         6pqw1OpN2Z94YmS/1j9XnVmSaULimpMnoC9eJG2biL+0KC41+JsyGYXlPnHLFGTZruEx
         tAwMaTXUrIbw1A7so1RNay6jCSPNhuMbXGG/5o+7bHwcGvvpFgGzzCXwtFXr6bJBorVM
         jY4A==
X-Forwarded-Encrypted: i=1; AJvYcCXdPPQ9MTUg4E+QThdoTGpe4ZHuSFFFlEhoZv8V9a/ANGUsD9pJs+DGT0o2x+puJQEJOYcjIBPa5eLU4qU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjsNeT7xeYIROFGO/m9Ywy3GftSu2u4iwjFNYu5oIzT1k301ub
	SYc7aB1pc7YkRr7dq5VtpqyXk9MuhPvd7Fhhh+NXl+9v6o4twF+PoANmvNfECZF2e3bQWCH7TL2
	RXwp47LM16TFwzgRsrrFSZZiumbJIUO4IQ3bv3su/LTHOHYiNfg48/B+v3uZ4To1Dye2KB8+sqb
	Q=
X-Gm-Gg: ASbGncufVPfkNBobbOsWmipA9v6cBpdUpWqsd0bUpx8UFPRX4NOZ9e+EqN8sZlzS3A6
	Pi+/KaFQcB3hbyohF0OAK5vST7PT4H+5GZca3NZdRa7/hBA0Wtvw7ak9QOnmK7YBH0U0rXl7yRe
	caPXqGqNcXaP9tqRFc1QXBdDx1hB00ZqHFdTt8YyKxgQ7FP7FekB3krFA23a1TeUR+Zx0xsiLJn
	VTqUqspBdestMo63fNt1beefEIEVvnrBrc6bK0P+wi3D0EFehzKpVbkHqgOvfYNnHX1Uc5Xi1A1
	MyxJGINdscs9a3GrC+Ha5dpRV2fz/SU0YZ0WmSVwaszXsRS4KsPPE01hUeybyKgX7k0XQUsdt1w
	=
X-Received: by 2002:a05:6830:3910:b0:727:3664:ca30 with SMTP id 46e09a7af769-734f98aa4ffmr15654995a34.16.1747917611172;
        Thu, 22 May 2025 05:40:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFve+8mofNSpVKLWwuMYBvia/xh0sTk8FAf6wyF/tDiY8jaMMruPUXYmConthQlvyqWvXyIXA==
X-Received: by 2002:ad4:5caa:0:b0:6f5:dd5:a594 with SMTP id 6a1803df08f44-6f8b2cb94cemr428744686d6.5.1747917599863;
        Thu, 22 May 2025 05:39:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7017e6esm3376695e87.136.2025.05.22.05.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 05:39:58 -0700 (PDT)
Date: Thu, 22 May 2025 15:39:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 1/5] drm/msm/hdmi: switch to generic PHY subsystem
Message-ID: <tm2ogebkaxu3g6xdmrjkx3u6veac45qd7mtiruan4rcevs75xn@apubmfvg74nt>
References: <20250520-fd-hdmi-phy-v4-0-fcbaa652ad75@oss.qualcomm.com>
 <20250520-fd-hdmi-phy-v4-1-fcbaa652ad75@oss.qualcomm.com>
 <a42b9cbb-2f85-40c4-8b40-6f84970aba86@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a42b9cbb-2f85-40c4-8b40-6f84970aba86@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEyOCBTYWx0ZWRfX/W3T8TEffWlK
 PIiDTnK0mb4ERd9oQaHCZTm5hGrlzkM4X3WRJy+GbNSK2IGcbMVVr3RqNYAoLvjIDUJbaMXyDpz
 QzuYTP+XlWcLAadaSBjIdEabm/oQwmutwLgp6Tsk2uSPSnWXnbotQiNCSMnmELk82Hb7xT0RVQu
 5WWjCOKdwX9wQxDDKGJ5QrEHkBskFXTlS8JeGQ9f0eAsgT+/nSHSQtOLza4lYAFz66shk+fsxz8
 l8CqVvJ1aI35TKfAG3Tvf1Lw5A+Nh2si9vm7BoqDBdYvyMmOsyMab/l92w86fb34MC7YIY7WdL7
 UmKCXTyQwn9BiJF05wqt/TdW51LK12XsGn8l+CfGR6LM4TF5lvo3F4Lx/5HzFHJBg4OdfoPU6BR
 4JLeG+LX7bbhMC2I3mUF91/iz3Kzk1tN9BpbOT71G9JpNd8u6YhMYbydZfP2kB/xyLI0tDX+
X-Proofpoint-GUID: crgMwX1tqFQKOTMu-7iWpOH6sY3XDgvq
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=682f1b2d cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=kkxXnT2X172yt9C4ahEA:9
 a=CjuIK1q_8ugA:10 a=EyFUmsFV_t8cxB2kMr4A:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: crgMwX1tqFQKOTMu-7iWpOH6sY3XDgvq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220128

On Thu, May 22, 2025 at 09:38:34AM +0200, neil.armstrong@linaro.org wrote:
> On 20/05/2025 22:44, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Change the MSM HDMI driver to use generic PHY subsystem. Moving PHY
> > drivers allows better code sharing with the rest of the PHY system.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/gpu/drm/msm/Makefile                     |   7 -
> >   drivers/gpu/drm/msm/hdmi/hdmi.c                  |  58 +-
> >   drivers/gpu/drm/msm/hdmi/hdmi.h                  |  80 +--
> >   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c           |  32 +-
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy.c              | 225 -------
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c         |  51 --
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c         | 765 ----------------------
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c         | 769 -----------------------
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c         | 141 -----
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c         |  44 --
> >   drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c         | 458 --------------
> >   drivers/phy/qualcomm/Kconfig                     |  21 +
> >   drivers/phy/qualcomm/Makefile                    |  14 +
> >   drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c       |  71 +++
> >   drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c       | 441 +++++++++++++
> >   drivers/phy/qualcomm/phy-qcom-hdmi-45nm.c        | 186 ++++++
> >   drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.c      | 212 +++++++
> >   drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.h      |  81 +++
> >   drivers/phy/qualcomm/phy-qcom-qmp-hdmi-base.c    | 185 ++++++
> >   drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8996.c | 442 +++++++++++++
> >   drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8998.c | 495 +++++++++++++++
> >   drivers/phy/qualcomm/phy-qcom-qmp-hdmi.h         |  77 +++
> >   22 files changed, 2259 insertions(+), 2596 deletions(-)
> > 
> 
> <snip>
> 
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > index 53a7ce8cc7bc7b6278eae2cbc42c3fda8d697f6d..1a00c26c1b40fc81623c9fb22ba25f448c27bffb 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > @@ -5,6 +5,7 @@
> >    */
> >   #include <linux/delay.h>
> > +#include <linux/phy/phy.h>
> >   #include <drm/drm_bridge_connector.h>
> >   #include <drm/drm_edid.h>
> >   #include <drm/display/drm_hdmi_helper.h>
> > @@ -286,11 +287,12 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> >   {
> >   	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> >   	struct hdmi *hdmi = hdmi_bridge->hdmi;
> > -	struct hdmi_phy *phy = hdmi->phy;
> >   	struct drm_encoder *encoder = bridge->encoder;
> >   	struct drm_connector *connector;
> >   	struct drm_connector_state *conn_state;
> >   	struct drm_crtc_state *crtc_state;
> > +	union phy_configure_opts phy_opts;
> > +	int ret;
> >   	DBG("power up");
> > @@ -304,7 +306,7 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> >   	mutex_lock(&hdmi->state_mutex);
> >   	if (!hdmi->power_on) {
> > -		msm_hdmi_phy_resource_enable(phy);
> > +		phy_init(hdmi->phy);
> >   		msm_hdmi_power_on(bridge);
> >   		hdmi->power_on = true;
> >   	}
> > @@ -315,7 +317,23 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> >   	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
> > -	msm_hdmi_phy_powerup(phy, hdmi->pixclock);
> > +	phy_opts.hdmi.tmds_char_rate = conn_state->hdmi.tmds_char_rate;
> > +	phy_opts.hdmi.bpc = 8;
> > +	phy_configure(hdmi->phy, &phy_opts);
> > +
> > +	ret = phy_power_on(hdmi->phy);
> > +	if (WARN_ON(ret))
> > +		return;
> > +
> > +	if (hdmi->extp_clk) {
> > +		ret = clk_set_rate(hdmi->extp_clk, hdmi->pixclock);
> > +		if (ret)
> > +			DRM_DEV_ERROR(bridge->dev->dev, "failed to set extp clk rate: %d\n", ret);
> > +
> > +		ret = clk_prepare_enable(hdmi->extp_clk);
> > +		if (ret)
> > +			DRM_DEV_ERROR(bridge->dev->dev, "failed to enable extp clk: %d\n", ret);
> > +	}
> 
> Why do you again set the extp_clk since it's already set & enabled in msm_hdmi_power_on() ?
> 
> Perhaps I missed a change but it's like that on next-20250521

Yes. And it was a part of the series beforehand. I will check, why it
was required or I will drop it.

> 
> >   	msm_hdmi_set_mode(hdmi, true);
> > @@ -328,7 +346,6 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> >   {
> >   	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> >   	struct hdmi *hdmi = hdmi_bridge->hdmi;
> > -	struct hdmi_phy *phy = hdmi->phy;
> >   	if (hdmi->hdcp_ctrl)
> >   		msm_hdmi_hdcp_off(hdmi->hdcp_ctrl);
> > @@ -339,14 +356,17 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> >   	mutex_lock(&hdmi->state_mutex);
> >   	msm_hdmi_set_mode(hdmi, hdmi->hpd_enabled);
> > -	msm_hdmi_phy_powerdown(phy);
> > +	if (hdmi->extp_clk)
> > +		clk_disable_unprepare(hdmi->extp_clk);
> > +
> > +	phy_power_off(hdmi->phy);
> >   	if (hdmi->power_on) {
> >   		power_off(bridge);
> >   		hdmi->power_on = false;
> >   		if (hdmi->connector->display_info.is_hdmi)
> >   			msm_hdmi_audio_update(hdmi);
> > -		msm_hdmi_phy_resource_disable(phy);
> > +		phy_exit(hdmi->phy);
> >   	}
> >   	mutex_unlock(&hdmi->state_mutex);
> >   }
> <snip>
> 
> Otherwise it looks fine even there's a lot to digest and hard to figure out
> the exact changes done to the PHY drivers.

Yes. I have been trying to find other ways to handle such move, but I
couldn't find any.

-- 
With best wishes
Dmitry
