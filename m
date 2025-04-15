Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5A1288C84
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713687; cv=none; b=SSgtxC/cBpaZZ4ubfz6a3PID+wpKj21t/yyd/B8gxjOOYhc9yq+UmWcahe2pt81sILcf+WOYxpR47eRJRaC9O6WvBfaSy9nwwPJJdo9rkvHRjbR82lofiIE9vMWDazwHJIOpRIsMZfsRNZ1jrK5tCa2sNBNZtBgPh/YGWmbs1KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713687; c=relaxed/simple;
	bh=PqtFIuf2PaqgdiInwLbpBw6+hS8F+gVD8HwKtn8pZqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CKMQRcQOzp8Rf/N0vZqysm8eA/IherNqHNEMlZoW2ZIgWFxoDUD/gBBPVEA4CLIjLSZ7UKjnT2JMsf4hwx87egAE4oSPHgKfkHVbL4GySVy64WqMV3ywP1pj69CwCPROFjH+0L6Evk2so88l3UNmwWMsybvXqbUG5jgDIgD9yfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J4/FSqK7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J4/FSqK7"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tMTN013244
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=; b=J4/FSqK7Q66nyXT+
	XyPwrbjGtFsAhLXsGJif+dz6X3ZRxiR01DhmA5hOLFvLS78sd8U5wuDPqNh/AKLI
	xWkwPJk8yHVJItxY/WNEI0ymV/vtlWUBILVSh24JF+hnHf1tTqRJQaGiMlAus2Of
	xMmUMm36PpBH+MbCeZAMsOdhrBBa97LfmRzrPCDw713cABnTWCwf5IecUM0ra451
	Syx+s6M/xepgmUNq9XK4dH1/CnyxaNfZZ7ht0xlYk1OLfn0XY3NfJDi2EcuF81SJ
	+h0K8QRdX5YksHOER0I6CSI+LmZVcBji0PieKDwLxfP5UfMF3zo1ItTphGmqnZz/
	n8Eoag==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6fpys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:41:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e906c7cd2bso11725966d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 03:41:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713684; x=1745318484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=;
        b=QqmqSgLWXb4PIyGJ6oEnJzTVU2s8GmIdXz8z5fIJuSNenwnsvx6O/i4VY5Qz2RSCw+
         WEze6i7EeAieJ1gtQOdT4qV4SNiuPpX3Yi93bIyDPsmq2RGmFo3LEXBd2jZLOt6d5NF5
         RHERbLwlVCDmlHXIfXG1hBAukaF8FJLo/cYJRTbBCdbzZp7oiYDqROg/z6L0HiuwJBLC
         hkUkypCMZ7g+Ite4qUY3TbJmdmGctMkDcmmvJwdB/NvwR224XMi9Z6NxdvtCojwS4ylM
         VHruMBmCjUEJpwTDQujWAoJtThALcsqerAUHjvweAjQxu3HUci3GKbX8fO/XIRd/6d2f
         onsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKhrl/8cZDbMDuWJ4+RnHiPI2BNA4eWGh63EEAFarsI4feNyNTJnO0FhXmvq4mTbQmn1qSijt8Y+Y4gSU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuIJ/3gBmDpATtJIcmK+vwybRrrSJagwyv3PCSucJUjavsb/Zc
	4QveLSvMd8DMfCzmqGX7quYmAFwEbEDQjIf7+dbYlnMjS0oYyxtoEmfzhKpqQCbg4bOwUthqpkd
	+nWqUip3teTLR9OeZk0FV1wbRSBmVSy+tqueZ66OpQDFthpC7LR0FWyXLXY8qE54=
X-Gm-Gg: ASbGncsm4IXjHyVy6s/yBgx3TmzJj5nRyreYhDEd+jDGkzGS5SnCW9cvXy83RRSmeH0
	q0dQJq5Dw7wXxfihztzNY/mhLDm/iRewnZ8Tv5EGohY+Yt2J835qOMRiURQwXGfU0Y6MQjJm/es
	XKthf063MsnnFpgYh3Uxb87L8kY0mMQ8BW5JcAHHUNoe0dbfuQBSz3KTkXexubXNBck+0Hj/odg
	VHLrD+doSLIf/lxZUdCU7T5ZFyd0gGC2CbFReBsk8tLtovNCcqwM7k8L7vDstEhuw9er2K9Gxws
	nM9WMDvoUzoWb7J7uMPSib1a2pmPv3sUBxi+bq2txSlE4a2SoAxIGcV8939pR7wLMUE=
X-Received: by 2002:a05:6214:e4a:b0:6ed:2289:6623 with SMTP id 6a1803df08f44-6f23f191ce8mr95478056d6.10.1744713683836;
        Tue, 15 Apr 2025 03:41:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1tPAainIF3cRDQQRrIeVRg/M/xThr3zwMMsYVBqA+QZn27ts9nKnwLdK6uEovJGnWc4aQow==
X-Received: by 2002:a05:6214:e4a:b0:6ed:2289:6623 with SMTP id 6a1803df08f44-6f23f191ce8mr95477936d6.10.1744713683552;
        Tue, 15 Apr 2025 03:41:23 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f84e5sm20180971fa.105.2025.04.15.03.41.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 03:41:23 -0700 (PDT)
Message-ID: <78f4e00f-8842-4821-a012-c6ac59320dd0@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:41:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/20] arm64: dts: qcom: sa8775p: use correct size for
 VBIF regions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
 <20250415-drm-msm-dts-fixes-v1-5-90cd91bdd138@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-5-90cd91bdd138@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sQ51zgrOYkNzK60yizcMav4aRkaerMM9
X-Proofpoint-GUID: sQ51zgrOYkNzK60yizcMav4aRkaerMM9
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67fe37d5 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=da4WsfccAxvekxWPt1gA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=633 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150075

On 4/15/25 12:26 PM, Dmitry Baryshkov wrote:
> Use allocated region size for VBIF regions as defined by the docs
> (0x3000) instead of just using the last register address.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
