Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E957280CC1
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 12:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744632862; cv=none; b=X0VzIMoMPioqa5AjXuQBx09Qyl22qjg5PYOli5/DPTUEwhwl1qvOLDwisF7Vzm5iPglun1dlDkPdq8SWjIJ9FXfP2Q2yBxa/6JGaJEZNn73VhoqCXu1N7Cm6pYsX5j37X5FDKUVMp0lQLZxQNqs+oPNkVL2VvCGNsJNNxTPoD84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744632862; c=relaxed/simple;
	bh=rzumaZ7iog0sCf444cKDLVPB1GndQIrZZhy1nlc+LS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CyEy9R4M+AIFYSdYp8lraA1NXF5nqLkhB/r462HVusa6BOrSlIn/B3QZD38zIfkYnge2GRBmHzPhMEaJZTFbpfogy6Zrq2rQfhr4YPk9wPqwxi0AX3zTBXDME263m/IXDWiIKVJYHvsSYg2c23aRXUbsdJ9CLZbixCEWLTm570M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZNnmEjje; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZNnmEjje"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99mAr028981
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 12:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bGrXNa6dHXvr4kroK+MTw5NQ
	iqX7zWwS0Ak/+A0yv10=; b=ZNnmEjjePUV+BrjhfwfZTyG1deE26VgjPzjuXCo2
	YWBhbuGcHoo2EGQ7wYQa84DJiFY6uKeFTtqeAq2pA4PidWV0R6BqXsNcSSbf8MBe
	YF0B3Y7ghr7H95bhvH9LgPrqCSdABJrEiOPd5UpukkduE75MokYhKwkrc6nQwGON
	1WPuc2Z2hQA1rfj82vrIGp/zNwzMH2ygBfWAFOtNX7k6ch8kF/5ijpbVTnYBZTwi
	njM6B/f7Ox90/VGAKNDEnn+Z7cORaoJQxSkMSPUzkunN++eE+slgLMUCYwFYX4RW
	gTjDEUB0NwlU3JemWDeeJiW8oyF+fZxUNvumTEkU/zMIuw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs14hcy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 12:14:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c793d573b2so786656085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 05:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744632858; x=1745237658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGrXNa6dHXvr4kroK+MTw5NQiqX7zWwS0Ak/+A0yv10=;
        b=ALXGd4/I5FA9RytMCf2VD8NjRDUfwRPZ5aQ0/vddE3HMHLUowFhe5BPkNO7At2Ldpb
         3mmm9fmQeK+DT2KEekjrHowyDFDW9B7tQB2Qh5VUreZKSqcWU6UdiEx6LWgfFOpDDbYC
         gIcMaqKEAkLcAmZGtCcaX9HR3/CZk7JEKaBvGeONvbtWNMYqVLUJSMBJy7Rpm+8Ff5I+
         Ff3JVh/3Wg4v5l/mE+Q/aX4ndJPjCrvDDVK7FKph52FUgV0eG1SV3bmbqebi4NXLG8Nx
         3H4+8sNxBpB+u1+ZM4GFSE1IZVgthcUcYXuyxqm0ccE7DP9ufs5Z6ZUuPSv0J6Zgwho8
         gjWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBNiLQ+PQ5GCZ9nOPDHQuMUEjCYJXw5VyIwDbqrhSq4YC9eHOiWbKyllTFBsbLUPFBlqWXHJnjhQ1OZME=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOFmEt+5TCJxQetv/QOKRwVO0MPytdPW9zvPHDwIgHAzuwamcB
	fvyQovS6EOM4jpEuWiUD93ygOqvHQSUnPVCxelavAfZQ9aV3CF4xvsM9uOUYBLs+dasMZhDbAa6
	0NutPx0OVirfimPJDkdx1ZK0pNXPFL9rAG0q40qpo3lB+8b8zAtxwJm6xRIZ84Y4=
X-Gm-Gg: ASbGnctangFpSa+ZxF5KH2H7pks6rHIwcsd7tkK8wJcAjeKibpVM7S3+uhrdbDbcR+L
	zsjE1nqdx32SvR23damyGfHyBsu/pwCs4kCV/g3p8Gv1T8fA8VGUoKydW/liqCi8EoNWhZAqdS7
	wKdBLwGmrh2a/djNkA2fMK1ko60PNTDzbBKP7IEVmKy1wVgm4gBmNMinq51fk0ra0jdPZY7dRU7
	eSJQqpCa4pxIdq4qBb6aAhwRXnmWVHwpUN4XtbVBvqECbQhesUm+v97jWGK4nwtyVerPWN+agjx
	9LXt1LTyJWwXNOklaCfxrcJftQcqJ3Pvk4BwTP/zZNihAz+yIRFqQC8JGbXBGtO1k9NcPRaMaU4
	=
X-Received: by 2002:a05:620a:40c7:b0:7c5:4001:3e9f with SMTP id af79cd13be357-7c7af0e0f5emr1701935185a.29.1744632857851;
        Mon, 14 Apr 2025 05:14:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxzp5iYZiEnUZWE3gvlgW+sXTiIEbnk35cNdFG+zRQtIEUe8+f5w9ReiZy8l+u4jZmVg+wwA==
X-Received: by 2002:a05:620a:40c7:b0:7c5:4001:3e9f with SMTP id af79cd13be357-7c7af0e0f5emr1701928685a.29.1744632857299;
        Mon, 14 Apr 2025 05:14:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d2386b6sm1128164e87.72.2025.04.14.05.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 05:14:16 -0700 (PDT)
Date: Mon, 14 Apr 2025 15:14:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
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
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 10/10] arm64: dts: qcom: sar2130p: add display nodes
Message-ID: <fd2dtxhbfvgpiwy7rc5z4hrrmuthet7bmp6iespdcvxgaz5uhe@ivg2gun7sb6q>
References: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
 <20250314-sar2130p-display-v2-10-31fa4502a850@oss.qualcomm.com>
 <c14dfd37-7d12-40c3-8281-fd0a7410813e@oss.qualcomm.com>
 <umhperyjdgiz4bo6grbxfhe44wiwoqb3w3qrzg62gf3ty66mjq@pddxfo3kkohv>
 <8fe8c0f8-71d5-4a85-96e5-17cb4773820d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fe8c0f8-71d5-4a85-96e5-17cb4773820d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=67fcfc1a cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=nRcdhEhJI-3p1s1dT_wA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 3rkHlodf0FuiHaJE7vfVFYhrRGDww110
X-Proofpoint-ORIG-GUID: 3rkHlodf0FuiHaJE7vfVFYhrRGDww110
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=633 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140089

On Mon, Apr 14, 2025 at 01:39:56PM +0200, Konrad Dybcio wrote:
> On 4/14/25 1:37 PM, Dmitry Baryshkov wrote:
> > On Mon, Apr 14, 2025 at 01:13:28PM +0200, Konrad Dybcio wrote:
> >> On 3/14/25 7:09 AM, Dmitry Baryshkov wrote:
> >>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>
> >>> Add display controller, two DSI hosts, two DSI PHYs and a single DP
> >>> controller. Link DP to the QMP Combo PHY.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>
> >> [...]
> >>
> >>> +			mdss_mdp: display-controller@ae01000 {
> >>> +				compatible = "qcom,sar2130p-dpu";
> >>> +				reg = <0x0 0x0ae01000 0x0 0x8f000>,
> >>> +				      <0x0 0x0aeb0000 0x0 0x2008>;
> >>
> >> size = 0x3000
> > 
> > Existing platforms (including SM8650) use 0x2008 here. Would you like to
> > change all the platforms and why?
> 
> The last register is base+0x2004 but the region is 0x3000-sized on 2130

As I wrote, this still applies to other existing platforms. I think up
to now we were using a mixture of 'last actual register' and 'documented
space size' with VBIF using the former one. Should we switch all
platforms to use the latter one for this region? In such a case I'll
update this one and all other platforms. Otherwise I'd prefer uniformity
and still use 0x2008 here like other platforms do.

-- 
With best wishes
Dmitry
