Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76BA1F7904
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 15:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749396109; cv=none; b=p4ue4HHNAKURjqFWzlUQSennx2J08SB5QDodVPd7MZYq1TtSRBg0FNcHdJms/inIHvEudyObnuNq+vFvz7/zOk+8gqwDYjcObDs0PLhQn580bGnVo0yO7woIqCXnH2RL+uRgZxXsy3StyZfrdVqB8seHHe/Y+UC8GEak9nQlE4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749396109; c=relaxed/simple;
	bh=kuT2meH+GoUYl5dDOMdL+3vbhIr/LYNnR/dcHdw7djg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pQcFSo9MKLALlGmt7OY6+xpeAqjVoOhi0Y6LQ0Getwt+y6i7bVfmkpGMVfgkUYen8K90Ab8xXnuFhxZ9Utp0O8tFP9nST7O8HGGDMREFlVQhIJ/YVv4yy1hyJ5P5PEsHJcRTsVx3utgEVXboIxU71+7sh92cGfUpc7lrpRh33GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pz6uu8ru; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pz6uu8ru"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5586tIgl015389
	for <linux-kernel@vger.kernel.org>; Sun, 8 Jun 2025 15:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=eBW87gG+bs7XTeUanjoqFUZo93HnKMO9MXlkJu+f3B4=; b=Pz
	6uu8ruZbbxQJBWUXgV7JoCc7DBOj9QCBE60RwlPOXfeA8Xxzc7Ffhwn92PGbcJaa
	DVAdP+4/zh0K33sE2OxLMn5Iwq8JuQS9jKtDCZDUe3KJXC5cObD13UyoKb70iBmo
	AAgLje+TV0Z9b/VYYs8oa9oa9KGoFrwxndeTr0Z6DfL3TXfeFVLQoE040kMgzbXR
	1njLB2t1KIfGbeBTXdyaktZuc4qggx61LgIJHhlST3b29aqKO7xvsJqvJkThSIJT
	uj6saz0zK4/2pPa8Nx3ARz2hCjM6+khqfnJt+yJPnm/0wrNwbUrJuUa8SaGTFdne
	tpfmjWkvzake6hBeU68Q==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474b4j36sf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 15:21:46 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-2e94cfbbbc1so1141294fac.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 08:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749396105; x=1750000905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eBW87gG+bs7XTeUanjoqFUZo93HnKMO9MXlkJu+f3B4=;
        b=hx3dNaFifjGVdlHkAyQ/G7pYto+xJkFdbLMk6AXpJhR2RaHTWqUptQJKsib3EI3y3V
         5vF+0weqwPnMRBO/WQ3sBMudUkONKzgEwhR4lBW5GHj11yexwDujGBOUSglvLmU4Sg9r
         tgcRVCGprGY1Q+G6XTSIbNloiswIQR15VTcZTluY/SYabd9sG7is3bFRO8IqwZq/140Y
         gYQfdzDJhquvbsNYEpubFex0lqbGcOHsMWAdKbqjZkJd04albrwKF2UzMrK9zQc/VcUv
         goK3EmeX0BiCueWv9qlC85FrAjn+TOHmdpjZb6nZ+O3GW+zqe+kGuoDteM1DdLXrAEPE
         mgvA==
X-Forwarded-Encrypted: i=1; AJvYcCXutiLvFNxAPBJD69neK/9BvxZ8QTQiJk31vbtsuVtRp92DOoGJ02zJB3PxpvwYxrP3M6OKFN0OWPZqLAs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjrt/k+XW56wgcNZX9IrQK91QWvAAuudwndYN8lIg+kZEB01WT
	J6arMBdmOg/OjQWassIh4AsRyxVJhlz/0O/5hYdTbd1BSPq8CZiYD7acej+nkgdUjiKaMk6vA5T
	FwdZSkmWh4hCv1p0ysFw2ZcJBAkU+cR45aeThFB3b6AK3C39ouXdTLPf3j6TRu2qD/VsVT3jzNn
	ecgGAbR7LB6Qy9rKDMmL8ZqfmLwkU3gg1QLmDe1tkGmw==
X-Gm-Gg: ASbGncuwvGtNIedjz9Zx8Vx9iX60XqX/N0FBKPNBQNck48I8/F5LbNlQB/UdSuKkbCa
	tqFJi1p/IAAWiyhy6wLsggvaDdZYtFhdsOH9cMq7ehZkgR2taR16Lu/d2exZXJT6UgxSgZh0VmD
	DlA2Mm8T5WZiBgpECTACCU81Y4
X-Received: by 2002:a05:6871:7b0c:b0:2c2:b9cc:afb8 with SMTP id 586e51a60fabf-2ea007a9e74mr5430092fac.7.1749396105519;
        Sun, 08 Jun 2025 08:21:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeiwEJ5iaDlOgKPAjvzclsMxV+Ve51cmb4U8YPN6w25l7BtGOQgh5AvGBbsmLKSAPaB7+VQf5sDKWINoqBQY8=
X-Received: by 2002:a05:6871:7b0c:b0:2c2:b9cc:afb8 with SMTP id
 586e51a60fabf-2ea007a9e74mr5430084fac.7.1749396105225; Sun, 08 Jun 2025
 08:21:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
In-Reply-To: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sun, 8 Jun 2025 08:21:33 -0700
X-Gm-Features: AX0GCFulliz7op4BWmvcmnZlyStVB3chNWH7TufZIrZInNo_JnqWpgSQFphHTQk
Message-ID: <CACSVV01A8aqyoM4KYuUYVXTHnM1egn5-4UxqPrQVVjuvxxbC6g@mail.gmail.com>
Subject: Re: [PATCH 0/3] Support for Adreno X1-45 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDEyMiBTYWx0ZWRfX8ilvpSoyYVPL
 31XYeYj9CDU8RySdVvLjeduadNJlggtym3j0X54LX/Ki2Fj+KgARxXX76basxn2oRN8B9P32H8q
 w4ixta1iJp0KWxCxhw8STQMqiKy4egMLCXccRYpejwghm4qjDvu5LjCqDkmxjiVsGxkRLftMXy7
 KAXdVQvzsWo0SvoqYLAIFBDle7nntvpo0H9DqZzxbX5ZCBKL+NThvsJ9jEELZ4yf/HPtbp8VhY3
 vYT+/9M8vDlMmMn5/d/K61myQxZL0Z9klSKFziUHRkcQJ99+Fmy7nghKWLwIVGpzycf2YFo4q5+
 08p9ysOa0SbVDw+t6g76cWwkLnF8iZ1kS07ooqreOs7cRSjNbd2bNCYSiJO8dgI7b1jF3fL3s3O
 VBgKKGwUJPO7uAGwx5Y/LvL8iYY9vduCUxpuZ+CLHSsR9JtTcbFrNR4EJGMFadrcmEK/i9Rv
X-Proofpoint-GUID: dEtjhqJOaJNU6iEzdLHcyFLx90zba0oZ
X-Authority-Analysis: v=2.4 cv=Te6WtQQh c=1 sm=1 tr=0 ts=6845aa8a cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=MXl9TKsJXw4pWBb3H3sA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: dEtjhqJOaJNU6iEzdLHcyFLx90zba0oZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=661 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506080122

On Sat, Jun 7, 2025 at 7:15=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcomm=
.com> wrote:
>
> Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
> version). X1-45 is a smaller version of X1-85 with lower core count and
> smaller memories. From UMD perspective, this is similar to "FD735"
> present in Mesa.
>
> Tested Glmark & Vkmark on Debian Gnome desktop.
>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

fyi, mesa part: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/3=
5404

BR,
-R

> ---
> Akhil P Oommen (3):
>       arm64: defconfig: Enable X1P42100_GPUCC driver
>       drm/msm/adreno: Add Adreno X1-45 support
>       arm64: dts: qcom: Add GPU support to X1P42100 SoC
>
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi    |   7 ++
>  arch/arm64/boot/dts/qcom/x1p42100-crd.dts |   4 +
>  arch/arm64/boot/dts/qcom/x1p42100.dtsi    | 121 ++++++++++++++++++++++++=
+++++-
>  arch/arm64/configs/defconfig              |   1 +
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  38 ++++++++++
>  5 files changed, 170 insertions(+), 1 deletion(-)
> ---
> base-commit: b3bded85d838336326ce78e394e7818445e11f20
> change-id: 20250603-x1p-adreno-219da2fd4ca4
>
> Best regards,
> --
> Akhil P Oommen <akhilpo@oss.qualcomm.com>
>
