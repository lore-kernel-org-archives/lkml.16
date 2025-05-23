Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0319E29290A
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748021359; cv=none; b=ovNyIXM2T+cqHXpVkxxl4Y7tUhrLCkufXt0FE4FXZowCpBzXvbefguMwJmUW6yTO2VRB5V8TbV2XrMGe4v1vOsmN47tONZjDBfVY1peSSKfsPcB4nsLka56eZ6noBc1s+mvxr+oebhAsjXcffeFsOMP8jCib1slvKO+4dbmMrlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748021359; c=relaxed/simple;
	bh=M6PzNRY4HhHhr09n1kFz6xIZE4CK6zN6xFgodUr75ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QoGpXQUxFfajJhD8xOYT9HD2ncZGzbxI/m+a8c8M67cL3xtk4Bk0FIhQ9hgmlU4lydPw846hQsUGIIdAhqJkkCSi5MEWYYCPM19qvTppHEziorXKnC3HURBucHD6wwK2362R1IVu7R0uRy3x1kApoNY6PGce3I/pbsZlXoh+Ns4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OOkNurup; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OOkNurup"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NFLZoN020064
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qUS9IAn75k2YSaUHF1zbCK7k
	qs/z4rRzl1ZCJmNqiD0=; b=OOkNurupXdAEeKFs4pu3gB5gMht6Hw6FiOdiGfBf
	wVeixXgJPtg38dltZ9Id0PT1SDBY92gqgWNof+kXikabNzlDZPxQIQ7wrpsr81KK
	DDgqoHdual4cF93xPWp/byeARo0UtqB6iZAZtLplNUboXHL4PSUDX0Xw5QBzL76q
	mPrrSvE14o0JHLMQRiI+3+11CbEwIGRHMMeTjv3NlhtmPVaR0TSewbFv7UVDmueo
	/BZSoR3ZgRbTSfMI78oCR/2RbvBwYxLUzRCefZ0zgmeszAYeUKA2cVr+KLWd02Ap
	x293a66PqYOfqFehQZ2YyM5lpsx6rT7kxsI5d+TbifZi5A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9jkkw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:29:16 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f2b50a75d8so1140706d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:29:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748021356; x=1748626156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUS9IAn75k2YSaUHF1zbCK7kqs/z4rRzl1ZCJmNqiD0=;
        b=XHDKA2q9n7H86kLMC4Y4BxGojMvfW2i/pjU1zpZzq2xNxAOf0J1l+e6PR1mj0RIUmh
         nfuJeVbaZYxY7zHT7UZeUFJUW6U/7n5NwuzEbjcqpumrtOWh4zolTvF+SIhXUXm1sr++
         /Z0d14cDgRoZX2B8tUMEb+YAm9GCtgSTR1AaIoPyjGDi3wRvqc8QNYoP3gkdBlWC5WfG
         P3psEDMK+MFoTpzL70SWdC8XZkF+34ab++SXBTmjr8/HIzBVWOmiKm6RFJAfOzHf9ILF
         x2lMbhK3tle3r2Ir3pOrjQwxOGT5n1X4tFH1mRPSpFgU4CwJXB2G5CkwzbXWqDih8rDf
         wUUQ==
X-Forwarded-Encrypted: i=1; AJvYcCU15UEaQYGQQP2KUUnz857bFjQ+Jqv0vo21ODfCn+aebiJl0nClrVI07ZurQSZglpUc7kyzoqrPHnl87JY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yziu+xpoWjSe0Fk5jji7tCY2Mb0Z3/vLgWUn7i3wTwtU7ep1H2V
	df6T/ucwwoBXcOIRx1n41j/c/3WT7rtY2lUHfBQCh2E/LEys4Uh6HhL9gugIuGjw0R5afWLzpBC
	aJRH4EiJZQ+8YyxtSLbtQ8j42iG6+8iRP0lxIWoDXOPZPgKYnx4skwCxkdFeHY2+x08k=
X-Gm-Gg: ASbGncvS74Lpf/UtjhbC4CSkWsDf0xkEbEDIpHnN69IjmbfNX8H/2b9O8MbWkfldHCb
	I6GAaBFCveOAz+bJpECAiajpd8AKa2bP1TFDl3qGF15GyBruX2kBLBAIOutUt9XcBlOq2OdVFAp
	22Y3blnubGi+rfRXpqdRg0lPOfxMXPuVJlDfnqhkXEDmQbKLDJKhegdEVX9EPt5+uD7npG0Zh++
	drYrecLQrRimX0fQvAhV2xOUilr9X5lNWzbqGjA/L286kftrhg/lUPGWp9P5R/SzizUNW5IPI+p
	iVfVT+EyaDG8nlfk4RzAIfPNFbblZSOTHP1KwSAqIuwSFlI7IUkHEKJaZh8H3jmRaAjxXrjWE68
	=
X-Received: by 2002:a05:6214:4115:b0:6f4:ca4f:43f8 with SMTP id 6a1803df08f44-6fa9d134843mr4398246d6.6.1748021356222;
        Fri, 23 May 2025 10:29:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUOtcTRZIJcjyLZJZkrKYyKY/eSEuHo98vUITz7sITbtq5VD0SVJC3uqWi6AJ9eJreJqU/jA==
X-Received: by 2002:a05:6214:4115:b0:6f4:ca4f:43f8 with SMTP id 6a1803df08f44-6fa9d134843mr4397936d6.6.1748021355828;
        Fri, 23 May 2025 10:29:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085cf8ccsm37783601fa.99.2025.05.23.10.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 10:29:14 -0700 (PDT)
Date: Fri, 23 May 2025 20:29:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 05/10] arm64: dts: qcom: sc7280: Explicitly describe the
 IPA IMEM slice
Message-ID: <xixb6ixro5il7idlq7nqp6h4vz3qcvd5tlwbmxsvm6lkcwwhb5@shn5by4zj3ad>
References: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
 <20250523-topic-ipa_mem_dts-v1-5-f7aa94fac1ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-topic-ipa_mem_dts-v1-5-f7aa94fac1ab@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: s-DOfyORwjt5SA58f304QA1oRqUNvjdZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE1OSBTYWx0ZWRfX9SlxF4n8bjfb
 uFEwrNIbPn1rCvG4al540ykA7e7SYe9v1SFiDxZ/ClNnjIJRUx0mfOlOT4qrr1uAhe54chdch9q
 IF7j2b4d0l3yz7UCW85EZGDtv5DMgRcwB1O4dPOVZjJu9d4q0pTxGhjzaPhbUpNYxAXTciF90At
 hzVA4OkD7CdZep9SPVOLs27jx6IBm7gLtpSkfqIa/QIbMyUXZYSGaW94WWcWMNbmvtGZNYXbElG
 SRWJsr3QzNAPbfIcuEs+HZYMuWDsaHIGrvGktOJ8UfqvQuLdJiYQKj5kRtrFSayHYet26a2tR0J
 m/1sjQqUmEIu3E0dMjOI5IBzNEbEY7oumdAqiYudypfhTyQJRDbhGt7U7dAILllgVITCeVUWWEB
 pHGTJ6ei3iu6sf4ZBHf43TVmQ1C9B/b/7NtLUGJCn7SSz65tp8NnbDqr0lmsdeCR8yJPwqJT
X-Authority-Analysis: v=2.4 cv=GawXnRXL c=1 sm=1 tr=0 ts=6830b06d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=bJ3CpmIcVIv4Nmd2ic4A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: s-DOfyORwjt5SA58f304QA1oRqUNvjdZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=705 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230159

On Fri, May 23, 2025 at 01:18:20AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> As part of stepping away from crazy hardcoding in the driver, move
> define the slice explicitly and pass it to the IPA node.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
