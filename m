Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A54274FDE
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652336; cv=none; b=adKU3UZoBc+eVHoyrz0MTzWJrxFWOdhwZ4lNaDv5WXg9lkGmPrkoFe834ulR2VsAuVpP7bd4GLJlmSYdWWKKPPeKvktfKPVvYNYpdhCEOJ/ZjUf+5lbLNQEjeI73cTSCj5P4KdMCInP3tqVPagsRoUG4WsiQZNoV2k+7vxqs5kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652336; c=relaxed/simple;
	bh=O68Yf4MVfSbvrTGnH2tyPtJDd/D9PTw/7oag6m4b3Hk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pHEdurMhrX+9gT7IbhX2RWTBGbpw/fxOHmGlBqlAvqJ7kv8EThmnagyOES7bJ2iPSUk6eqY3tcLGAuJmQTyCYkAgo/MD27uDYEw/bAGcq9PVIs6GCLpB7Ma+8t6Q+OsnAlc0TTDIfb34Eu19oY7JwfrqnJDbXxqd/6ZJKyi9QMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nXT8/90U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nXT8/90U"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J6Oelg006138
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VqRNS/AP2L0HYV/XzQMxzhswyBS2iB5hSp0sUNl5kjs=; b=nXT8/90UtPNYFOVl
	lO89wI7YQKOORwYNbXDwpUcHcHCYJEEnnNE/d2sZ5vcwuHD1lFP11G1pUGwuApvn
	crn7cvzPlakbrP9FtDv28Tme1qNFW5ZXiRzXro63fVro/1EzE9y+ORx6CdZU5kVi
	rEfcFJbXwaegQ5suYLTplGNyNMYqWGlfiH3DZS897k6cc/FtEa/We/gu8MTjqb9C
	ADDaqr8EiaX1n9jIdugSl6TqJSdZ0c1Ye0BZhms2r5FATXD1L/q5fPAZ8SoXha6p
	tBpVWX9dOeQB8usjOVYApGbmeeIfE4fEajD+zFGFF4Z0ZoRp0tLj8e/dMAwXwI6X
	kbx81w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qybkgu8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:58:52 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8d47383f3so20640726d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652329; x=1748257129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VqRNS/AP2L0HYV/XzQMxzhswyBS2iB5hSp0sUNl5kjs=;
        b=ZRW8liijV0sQXHMSsmjnPiXeEe2mekVkLA6gqAacyObJCflicIi+ZWrHOzk3WBu08m
         Z1rGJT+aTsXUlszUEWn68qSou3+++bLQn3kiUHQ3FUK29XLRR7tz7GdrxNGKGVIFrhrM
         y4VXSYLFc8o/IX/PVwPUDB9n7V27TphQsMaaJcd3JotwVEgWCXIVyPdwgBxyspyBMpRK
         sP3T70rJrzUTwoibdobP7IEDqzAqN7fNrxNBPVGKx/LPtqI6A3ACiUHeVn2sU49eammK
         g36IttbtLJLkykz8nL2YP7oL9GHZEIY4Hi3/RzLtFA7vDMZVnTLa1a2bi4HRcH0Tw5w0
         KJ5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVbzdLApFDkV/O1SrvJ53m6xzT3dbj8y6r8UL7RN0r5hSGMZCJWxElqOwWq5LqbD44iYimXlAxt76LkS5w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyexd1D5ljB8CJACSGnb23DtberiiwQ430I34+BvpaBXnkaZMuz
	WChH9+G6Yvvaf8WeaaUivn6hCqiq1ZsU86ia9Y+rpD0+y+njrUqTnPzNrlWMswXIdviVxVHyI9V
	aUOFRcv8HGlm6lSFm2EfAXLOh5zcLXfBh9wCKWUCXRwkfnUgo2l9D4NIzAktLn5wihGM=
X-Gm-Gg: ASbGnctJaZB+FFxeDQA7OULGQV75yYKQQrLeIAKhmh59vDMQdffKOhnZRuQtTT+ZaHT
	Xrf7uOLGuTOKM6RuvAkRHFp1LQdjY8Wu3FlmRT9U+wd8xU0sDgEyQYBU1dcTwspRBE1l7WImfti
	QNM1s1GgRMl7Gc8fiYR4Z+gPz6JOFz+cMf1zp+NGS5qCPCuuMyd7+DntrnbnizSW+DAA5E0+nYs
	tb0fBK1yqy2imGKHPN0QQVsyurD+Jl/Tjo+ltuqVs4uxY09DoHFyl006ZrdW11zgvkNLF/anb5C
	95aej61SV0wwxmgMr/wwY4LcyQMso+kgQ4Vh9fj7KNTGs9dvvpH6VNb1Yibf0f65SNRNG7xRvtE
	CSNTS1Vlvj0vd4l6WrSCQRt++
X-Received: by 2002:ad4:4eee:0:b0:6f5:3b8b:9115 with SMTP id 6a1803df08f44-6f8b085299cmr198058216d6.33.1747652329554;
        Mon, 19 May 2025 03:58:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZ8hMq2kgsgTEUTk7YggTkRUuA47iDtbotHwLHe0Dgywfs65yOnHSbIBuW35N62G91KOkcXw==
X-Received: by 2002:ad4:4eee:0:b0:6f5:3b8b:9115 with SMTP id 6a1803df08f44-6f8b085299cmr198057586d6.33.1747652329096;
        Mon, 19 May 2025 03:58:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:58:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 00/10] drm/msm: add support for SAR2130P
Date: Mon, 19 May 2025 13:58:34 +0300
Message-ID: <174637445761.1385605.10286310480029078025.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
References: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: baLIkxAuGI3Xfgo4Xku13IFlbROMvQFv
X-Proofpoint-ORIG-GUID: baLIkxAuGI3Xfgo4Xku13IFlbROMvQFv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfX0f+6yWTt+Fbc
 wSe6rDdIpmUXaFDcfLbk3tddfCrYnqVsxdlp1i2HCxLLIWdxYagecJxBT4utnlMipnWiFz7ISFD
 esMwBt0AnJXu69xQehxXLcN0Hh13pymnyOH1cik4/I9apGDDfQHN/A4QcrwfjohCdKbTUw9Jq5L
 sy5a5RK7GAuDP5ngsu6eKwTMPkEAbX6hcpLTnLFgqNg6VL7vm/4N2I6p+sad1aA7ER4S4BHTWYp
 rHgT/o02jwY+E7bxCcbJ+J6HIKjdl4z8cg8aS/jF5pw+ozngpU+Ng6TDgh6zGyipkupwRdiIoNK
 eLJLqFw3YH4uRiBf8Yd+4/mtqo5GMgBSO+sto/disL9l/mX3u/BMZm4MKEmhTxNZU5tLocYLNY0
 G/wxz3OkupgrUZXl5eLbvIFkLKYFo02+sGVBcB3gkg+djjgGcx9VTVhwHjWQRFgTQNNTxibx
X-Authority-Analysis: v=2.4 cv=RZeQC0tv c=1 sm=1 tr=0 ts=682b0eec cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=iEGPaXCqe01J9_RIJz0A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 mlxlogscore=876 malwarescore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190104
Message-ID: <20250519105834.xjGxkXwkJmI-2_sh13CmR_TYHyb7aRBJYd3-rigd0-U@z>


On Fri, 18 Apr 2025 10:49:55 +0300, Dmitry Baryshkov wrote:
> Add support for the Mobile Display SubSystem (MDSS) device present on
> the Qualcomm SAR2130P platform. The MDSS device is similar to SM8550, it
> features two MIPI DSI controllers, two MIPI DSI PHYs and one DisplayPort
> controller.
> 
> Note, due to the technical limitations DP controller wasn't completely
> evaluated.
> 
> [...]

Applied, thanks!

[01/10] dt-bindings: display/msm: dp-controller: describe SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b341da1172fe
[02/10] dt-bindings: display/msm: dsi-controller-main: describe SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3c70c9d0a99d
[03/10] dt-bindings: display/msm: dsi-phy-7nm: describe SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/262650e71854
[04/10] dt-bindings: display/msm: qcom,sc7280-dpu: describe SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/759fe7181723
[05/10] dt-bindings: display/msm: Add Qualcomm SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3096209b7a62
[06/10] drm/msm/mdss: add SAR2130P device configuration
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1e7cbfea6624
[07/10] drm/msm/dsi/phy: add configuration for SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/8e63b2075e01
[08/10] drm/msm/dpu: add catalog entry for SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/178575173472

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
