Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5934220F070
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748380211; cv=none; b=jSdq8PyHg3Ay9mqFMwDsCrRx0Rp8+9bV5lzgFW7/qcxkTI4secDNwMzotdBeFyZcKUpv3NTdmPG4mj+DbWcnK8zonfT9C+4l+lDMhRDjAbvWGHEn7vZXz9krUz00eg6IrvU1/+J1Ghj8TldE2z5B/9ULu7Hp9V0+FDakEt+VHGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748380211; c=relaxed/simple;
	bh=bgfd2MyeO4l8nu/jbExs/RPpGS8mZ6SIMNV/QjcbpQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AORj6X5SfPj/tTPxrxs+rC7+KOyYOuiGkG57iT1uyaP1LYYrSxCRYG5JcE4mExVbhDCIXbroH2K+wQdEwrBzlZ9gs50DPbrmBKctSCulD+l4jFV52Z96osaExTb/a7SAPpG7fj0BA9jAOATW5IIkHel14UF4gV0oEsdVDcWVSZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n3ocTpMZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n3ocTpMZ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RIIPBX024456
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KTU6QlFT8LoXjBrmfp2AVZLy
	jUeZzltGjXBheEes3Qw=; b=n3ocTpMZxTkk9CXLjdp7+kJe+XGZa99d1W8OOOgQ
	3sxcsDutvZiIp4LpIawJS2OKqTf1WYXsc+Sqhlk0JPQqkSgPGhwMY3iD3yd8JOAC
	3uzo0UhDTL4+J8VHJxZLMix19ohtsGCIE4p3jF6/xk89aWU1k0vleTBkBMVv1uET
	1QmLqN/MtXfy4Spsjm6Ng1ilYW3SU9UmGIrwabiI1ptBAGAu+PehMSUNi/ID7nnE
	IpBwE6ghBHj0jN7TxxwS8znpKToZAjQVBlSgYorBOmDqdlxYgt0TWMJungjnVg8I
	LJ6w2IurZEUlGuhke+L2Njha5CqWHR4jcZ8OOg7dqSLt5Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u549g7tm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:10:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7cd06c31ad6so43735585a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:10:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748380207; x=1748985007;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTU6QlFT8LoXjBrmfp2AVZLyjUeZzltGjXBheEes3Qw=;
        b=dCiGDvN9b3j22eHC1Nl0RUnq1wcrH7XbSXgOr/M8Ps+AFGcOA39645exSbkxcvDQRH
         qvKGhuoupaCYWBhV5UxMdNwDYKwS+hI9IyUUHVyq9QlZItvXSPFVhvXWAhC9Uy05kO9q
         y7cbZrnqS9dsDQbaCpX2lMALUuBYSlwHhUGOFv9HXPLqSDVjtTc5YS+Jyz2P8xONqgJJ
         T8dJ8BAmWWqLU/hN3Ki8Hrit0Qt6+TSaXW1whEdMQv0dbELF+1py8C1fhPxdajVyiq1P
         VYjyHqNetp6qS1bRKxAAEdgKB2OkMACNct6xDKXAi08gVl8ba7n3B+cUgApHvTxASPiP
         3TQw==
X-Forwarded-Encrypted: i=1; AJvYcCWif1kql0Xeno6Cvj1XHZDSSFMip9LHipTx2qV11ucRwggoqEXYan4bbe4js2FjbWJVji+3Kd/yjGtgoqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbyU0+Uid1+kf4qqrDzXoDKJZsgSl/kKq/PjDptG0m3c2ynkmy
	rfwuRoPEA1dNl9ZH1EQAR/xMMCW6zOtZ5FGYPr4ne4tfLJsSffM+8Bwg/Ew1SunDMoZA6gxjslW
	8teUJNUn8C/VrFOU9MmX11zZPIrGf1Wp3gd4bOponfgG5o8dCqWwUyg/N+mEFpCDojEU=
X-Gm-Gg: ASbGncv5H0BJyuRttyBXbR1VP0xvOgfPU9SqLwzVDakQvIw3/JlmA4htfLO2DIk+Z2X
	5eoaKkV6KXSOQOYCCRpG9BL9tIrqFF7wwAVp959tW+XHKHzbmarrWSRTco9Ezx8AJDWUQWUzNcL
	rHT3aQ54cz0ZVdxiC5dOfzcpTh+y+eGGUB0lzAyY6P37T/GALuMGBUfkSgVcn8IAQuL1TZBHXnF
	EDFheWMCd58YhZ3xUTaUhI+mc1gIvXXfv4jT8xM/8slFD4A/IgF4oVUu85RQ+ElHOfZF+2kG0f+
	m4V4tzNUhXz2YiTf2dP/4gNhJ+a9Fq7eJ0vOxBjlL2+lacOUC6wOu0xlylTGlt14oRc9zj1pv8w
	=
X-Received: by 2002:a05:620a:414d:b0:7ce:e9d4:4fb1 with SMTP id af79cd13be357-7cf06d3aa98mr304096885a.8.1748380207186;
        Tue, 27 May 2025 14:10:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFC5Ad4ysV6+XlrFyXeReg/9nW+7rJ89ue2KKwQKeT9Y6m1nBBLy1fCB8SouNPS6nsn646Ekg==
X-Received: by 2002:a05:620a:414d:b0:7ce:e9d4:4fb1 with SMTP id af79cd13be357-7cf06d3aa98mr304091885a.8.1748380206726;
        Tue, 27 May 2025 14:10:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532eddcee4sm32257e87.27.2025.05.27.14.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 14:10:05 -0700 (PDT)
Date: Wed, 28 May 2025 00:10:03 +0300
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
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 0/6] arm64: qcom: allow up to 4 lanes for the Type-C
 DisplayPort Altmode
Message-ID: <styd5gjksbsqt7efylpfn6bgwgyvt6zexxiooihjsnmp25yigp@unq7dor6gso2>
References: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
X-Proofpoint-GUID: tOyGoOYHbDWlvt65iTk8WepgSe0jN628
X-Authority-Analysis: v=2.4 cv=E9nNpbdl c=1 sm=1 tr=0 ts=68362a30 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=gwmzPixrIpoEWUPfHWUA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3OCBTYWx0ZWRfXwJkaD12+oMoA
 o4xE4kO4Lsg/8SLL3Z/M8Ev4KotE4XDuMXSi0dE7mR8i9k3vQiLfhWAL/PynOpJvwRzkqyYYGkt
 ziJk/uVd4H6Azoj6T6C8em33o5SmEGtf+WeZ7/vSS9VJ8FkOTDtB9KRSBUYQAioNh3jzTiRxcCa
 hQXzvvV1cet18dj9gsJIa31rdJzp0IhfMurtcy4XT4qrZfiYgENXLrmrwgeQ0QKBWI/Wilbtq42
 thAs0sX5gl4viyR9LBln30DdHjwnBOdSZ1U3uMpiGDqGldzWKPDJvZlQQ86STdwjd2PwWqPbT3i
 QUZsznP/6GUg4XAU354eMWZgwgr38MdRzxofeXEdtjLzs57o/uecPr4LrSNXggQYg9cX1NFZBKT
 KL8qw7riW3HGv3r5quj74LhmQ5qGnpHDtZm6ctYVAv1QNd0BITaW2g7GhiKvggqHAqiWVLWE
X-Proofpoint-ORIG-GUID: tOyGoOYHbDWlvt65iTk8WepgSe0jN628
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270178

On Tue, May 27, 2025 at 10:40:02PM +0200, Konrad Dybcio wrote:
> Register a typec mux in order to change the PHY mode on the Type-C
> mux events depending on the mode and the svid when in Altmode setup.
> 
> The DisplayPort phy should be left enabled if is still powered on
> by the DRM DisplayPort controller, so bail out until the DisplayPort
> PHY is not powered off.

This series doesn't seem to solve the USB side of a problem. When the
PHY is being switch to the 4-lane mode, USB controller looses PIPE
clock, so it needs to be switched to the USB-2 mode.

> 
> The Type-C Mode/SVID only changes on plug/unplug, and USB SAFE states
> will be set in between of USB-Only, Combo and DisplayPort Only so
> this will leave enough time to the DRM DisplayPort controller to
> turn of the DisplayPort PHY.
> 
> The patchset also includes bindings changes and DT changes.
> 
> This has been successfully tested on an SM8550 board, but the
> Thinkpad X13s deserved testing between non-PD USB, non-PD DisplayPort,
> PD USB Hubs and PD Altmode Dongles to make sure the switch works
> as expected.
> 
> The DisplayPort 4 lanes setup can be check with:
> $ cat /sys/kernel/debug/dri/ae01000.display-controller/DP-1/dp_debug
> 	name = msm_dp
> 	drm_dp_link
> 		rate = 540000
> 		num_lanes = 4
> ...
> 
> This patchset depends on [1] to allow broadcasting the type-c mode
> to the PHY, otherwise the PHY will keep the combo state while the
> retimer would setup the 4 lanes in DP mode.
> 
> [1] https://lore.kernel.org/all/20240527-topic-sm8x50-upstream-retimer-broadcast-mode-v1-0-79ec91381aba@linaro.org/
> Changes in v3:
> - Take the series from Neil
> - Rebase
> - Rename many variables
> - Test on X1E & X13s
> - Apply a number of small cosmetic/codestyle changes
> - Remove some unused variables
> - Some smaller bugfixes
> - Link to v2: https://lore.kernel.org/lkml/20240527-topic-sm8x50-upstream-phy-combo-typec-mux-v2-0-a03e68d7b8fc@linaro.org/
> Changes in v2:
> - Reference usb-switch.yaml in bindings patch
> - Fix switch/case indenting
> - Check svid for USB_TYPEC_DP_SID
> - Fix X13s patch subject
> - Update SM8650 patch to enable 4 lanes on HDK aswell
> - Link to v1: https://lore.kernel.org/r/20240229-topic-sm8x50-upstream-phy-combo-typec-mux-v1-0-07e24a231840@linaro.org
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Konrad Dybcio (1):
>       phy: qcom: qmp-combo: Rename 'mode' to 'phy_mode'
> 
> Neil Armstrong (5):
>       dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Reference usb-switch.yaml to allow mode-switch
>       phy: qcom: qmp-combo: store DP phy power state
>       phy: qcom: qmp-combo: introduce QMPPHY_MODE
>       phy: qcom: qmp-combo: register a typec mux to change the QMPPHY_MODE
>       arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13: Set up 4-lane DP
> 
>  .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |   7 +-
>  .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   6 +-
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 182 +++++++++++++++++++--
>  3 files changed, 173 insertions(+), 22 deletions(-)
> ---
> base-commit: 460178e842c7a1e48a06df684c66eb5fd630bcf7
> change-id: 20250527-topic-4ln_dp_respin-c6924a8825ce
> 
> Best regards,
> -- 
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
