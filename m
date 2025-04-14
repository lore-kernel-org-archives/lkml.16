Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739FF1EB5F1
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744626001; cv=none; b=RHBsAZ77jFGdh4XAYhoA+WvezHQ8vHiwSMLlXei7nnIPOmgpi25FcdOL6JdHIZjI7AQm/hvrafebxbiLTZ6Mfb/nQPeZuFAlj29zkzpaCx7snl+ZlhGZfgCmGJOlKb7nLzKHeHwAZRBcpNdV1GMh1ubFY/Rpf6KFeyHH9U6mwUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744626001; c=relaxed/simple;
	bh=6LdMwrsc0vig5nRzjKOOFed8q87TxEDlzdFs0pRtqVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GOI8KtorWz912drbXKVVW0u/TDr7K5wEDEBL7oTI1zb8abQaddnoPgRR0HGTn3nKA5Xz2eSFs6i+bovgB5QHB1eZ+ongl0yENKffPbAm0D3rQOTlh981IBBCNtxVkAX1ZYj7RBONf9h1Wai3Rtqblpy1LUKVYUJlnoUpGbdVc6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aeUMbZlQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aeUMbZlQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99qQW016547
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:19:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DLAhpetcd11dpwWTT9KAow1P
	FzBjgslBEESFhVk8JwA=; b=aeUMbZlQouwDEG+T28DbeQ9Th4P97Djhacs9CMnX
	NnzlDGF6mEDd5sVPiOcQeMxtQnEe9bCLWfOh5YNzS4xZ8g9hlMtRWQWWyRqAoXmo
	rDNbZxFNTDfGpdFHG8zHWf+XrrAeMdSEgU77E3N7YG9P2PpREjcfLVw0RAW9kjhc
	NKJNIbgq9TZuikih9pfxyyh9yJVYnn8MIy8cen5uz/xR8zamwa1b2kYD/c9KapIl
	Ho8xHCimOBvX2igIl+vK+q3XGzpqAmSsstxOin34Wz5qXIcIT5sgiD4xoiJzfxf3
	9i8BfkscW8fOTj4u6Zo7D3vDcFEiqyUXu9Fe50+UKao4fg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf69m86g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:19:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5d9d8890fso915791785a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 03:19:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744625997; x=1745230797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DLAhpetcd11dpwWTT9KAow1PFzBjgslBEESFhVk8JwA=;
        b=FhXc+k2fwkpfbqcim+znncD9pSuuRXvXTnYkjSj/giezhvYzsoUbmh+zbr/72DqnHn
         xsTip2jKF5g/tCIpsuCZZjXuDrIn6qkSSLkNhvwmVVetHfRYp5tI6HZisOneRN+UECfB
         CJpFh8+zoXNOfihlkKr/IzVUhs5wZoojbYiIPeS3N3chp43eO33Jc7l1NuyM9w11A3ud
         BwNi4uj0q4XFZhAK11oKsFZjOvUhGzaAWmo/Ny6imdXl6/+MplbbNjEudDzGzt7AR2QT
         83ETnHWPHidBem/d3MWH1bisq7GkPQi4r5XK0UVZs06Qb3AtSUg8MwqqKH2RKxhpapJg
         3P3g==
X-Forwarded-Encrypted: i=1; AJvYcCUaAx0KinJD9BahzCxMHdPSrEMKftze3Jie6YbMLvkTGarWgRmpc7k8EqVrr0bwBTeJ/xlue6kkyLhNlMI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB7Gh8OsMuwnk1KrKEgoLqKV+b31rnVrdgY82KFA2BJEQI5MdS
	1ObUVOCrWra/Vwy9BmtSxU73XRDS/DUxgSyv6+UfEPmbyZseoSSyXd05rbCwjcB+11ShTXsjeUA
	k7ZuCU6mrne+yHaNYyoSHEkHCFZu8uS48eGYXX2ym+HbjdA6CMrjAzJ8Rbrmy+KQ=
X-Gm-Gg: ASbGncv6Apo5FuPIgvZcJmZeYojTjr0npknnaiLZkx6iIOKHNauCxlhcnH1f0qIG2xk
	5opBskOpT1yLKo/b4M5Vr68jDYJ+nJQz/6xK9CW7oWS4z07Bl5RyFB1o7TULZHahzcoO8m4ZjGP
	k2fmFQv7f+98XWWvR7NXC9Yc4WzoCS19LzVa+WZJYUOlA3gTKyWWEN9IuPtev3QqcAjWraMlLsF
	lA3LHzH9XWWq+rT3yASYCPZjb3/feI2kplEq/3gAdhUpekYwxLpLOiPMFfOtObIx27hMEnE2HRJ
	elVqb/+VGgLB27rOakwrBOWBbOb0Rr09c9vd+HJSe2F5iPSNiQ4TwiP20rW5RBZ2aEobY5XWKJU
	=
X-Received: by 2002:a05:620a:248c:b0:7c3:ca29:c87e with SMTP id af79cd13be357-7c7a76b97aamr2245096185a.21.1744625996844;
        Mon, 14 Apr 2025 03:19:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFz2lvRi5xYBSv5aHzaBCPJf25Htmry2/RAX+OhA7qGrMdkO/NDzUDOvpcFZ+lr31+ZTFkX+g==
X-Received: by 2002:a05:620a:248c:b0:7c3:ca29:c87e with SMTP id af79cd13be357-7c7a76b97aamr2245092985a.21.1744625996372;
        Mon, 14 Apr 2025 03:19:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d238b1esm1064763e87.91.2025.04.14.03.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 03:19:54 -0700 (PDT)
Date: Mon, 14 Apr 2025 13:19:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <quic_gkohli@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, amitk@kernel.org,
        rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_manafm@quicinc.com
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: Enable TSENS support for QCS615
 SoC
Message-ID: <wkvfxmwta6xvia2drxsit67w4fwihuds55i6lhqoa3wykdih6d@23us2i6olk3c>
References: <cover.1744292503.git.quic_gkohli@quicinc.com>
 <76e0ce0e312f691abae7ce0fd422f73306166926.1744292503.git.quic_gkohli@quicinc.com>
 <7f893243-572b-4e23-8f2b-ae364d154107@oss.qualcomm.com>
 <46cd600e-b388-4225-a839-a6af76524efe@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46cd600e-b388-4225-a839-a6af76524efe@quicinc.com>
X-Proofpoint-GUID: T2yweJGevgIZnxZsc35xdn_ZxTblhl7O
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=67fce14d cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=5yKBnrlMSY8RUHeF2GIA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: T2yweJGevgIZnxZsc35xdn_ZxTblhl7O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=722 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140074

On Mon, Apr 14, 2025 at 01:58:12PM +0530, Gaurav Kohli wrote:
> thanks for review!
> 
> On 4/12/2025 5:13 AM, Konrad Dybcio wrote:
> > On 4/10/25 4:00 PM, Gaurav Kohli wrote:
> > > Add TSENS and thermal devicetree node for QCS615 SoC.
> > > 
> > > Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
> > > ---
> > 
> > > +		cpuss-0-thermal {
> > > +			thermal-sensors = <&tsens0 1>;
> > > +
> > > +			trips {
> > > +
> > > +				trip-point0 {
> > > +					temperature = <115000>;
> > > +					hysteresis = <5000>;
> > > +					type = "passive";
> > > +				};
> > > +
> > > +				trip-point1 {
> > > +					temperature = <118000>;
> > > +					hysteresis = <5000>;
> > > +					type = "passive";
> > > +				};
> > 
> > Please drop the passive trip point for the *CPU* tzones, see
> > 
> 
> we are using trip-point 0 for cpu idle injection mitigation which i will add
> in subsequent patches, if you are fine i will add cpu idle injection cooling
> map in this series only ?

I'd second Konrad here. Please drop them now and add them in the patch
adding CPUidle injection cooling. Otherwise they are a perfect target
for anybody to clean them away.

> > commit 06eadce936971dd11279e53b6dfb151804137836
> > ("arm64: dts: qcom: x1e80100: Drop unused passive thermal trip points for CPU")
> > 
> > and add a single critical point instead, see
> > 
> As critical shutdown is already supported by hardware, so we are not
> defining here.

What about letting Linux to know about it and perform a slightly
graceful shutdown?

> > commit 03f2b8eed73418269a158ccebad5d8d8f2f6daa1
> > ("arm64: dts: qcom: x1e80100: Apply consistent critical thermal shutdown")
> > 
> > Konrad
> 

-- 
With best wishes
Dmitry
