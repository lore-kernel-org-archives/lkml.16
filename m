Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD37228B4E3
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713803; cv=none; b=d3eedqpicXPj41wCCHu3QzCff7Wc1gaj7NF3HLGuJYOiDp01PtYAMULmUeBThGR6PHyET2ztA73ritKYnmW9HkMWpMK4AXb24zZg/b+2DXPIzU+dHUPf4JFSR1yxAwq+Gfl7EIR+QIGGZ8k6O0DGcpCEPc+SO4Q8JVOIdCnKK+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713803; c=relaxed/simple;
	bh=PqtFIuf2PaqgdiInwLbpBw6+hS8F+gVD8HwKtn8pZqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kZxGo13S/FllgQNSSK9C2HhB1RxUANYH4syBUzvZMaSxiss5DXD+fT/nAhkIZ/7pedBZBQQIt1bz1X/Wewfekjc3j/4Wh8P06IIsR9RxLf7SLAX+CcfBW0mDPvlpwDmjBoTVWe+lhJ5p82Olelx5pFGWiEUMx4jZ4eGlsCVNtqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ai1mYMO6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ai1mYMO6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tH1i012587
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=; b=Ai1mYMO6lfpCeK3K
	4QNGSLLviuJdPDhCqZadVYkkuwmv5fBYJJbG1AaJKPPeB17UrzIr0cWUkwhhS2Ti
	PtvuiX1FmE7cwdrCnNwxDoCFRj9SEo/rK3bNF/Ru7JWSltEVtgAlgaJnBhbbdZfv
	n6kFn9KSqGNmhRR4QyX29RRtWksihwIhtS7ShEYZkH41YmMDydkE9MzbQlAcscUy
	W52c4+C6o/AihjKDwE3jxOS33wcM24KNzaOwgZxxmkWFmBlxd0qXU4YcGxMHjZUo
	F5l4CFVIyN7Y6coO/p7CYkLUYXatL39ReN3jfNcENofz6Q4bSeReOhmW9v+EBHmA
	McUgww==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhq7y4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:43:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5841ae28eso123617485a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 03:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713800; x=1745318600;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=;
        b=KPHEyp7v373QEF95zh/2kD4+HqJhps9ZRu7KliWwGc0AiBr86ZJ6DC6yzwZvNFdibN
         +4smTvJy0XD7/R0QWXZG+vfoEz4zTb3RVOAd7pmMVnAOHbi+NFdi7POB5rhCk65HXzkT
         H9L6CcMPHH9h1zQxZT6efb3C5RFfdL+/W2qlLKEer7xNAm/cEhqyl5QjOKYSSK3x87Rd
         osq/W/7f3QtDB5r/T9rkmJ3omoidt9Oj0vcaWVJIy2sTb5+YCcl5q4JabwvGrAQEKN+Y
         m4jVapNP8Y3EL/HWYIP5WGJndYyQh+NHISEyYn0w0O//TRWKVMiCO4sA/ChWhWzhAi+4
         ed0A==
X-Forwarded-Encrypted: i=1; AJvYcCXatWlLyfbLZ2kGM40g1vpKAXy1Bh8F2U552jOSs3UIGnUzIOANrM9il2qstd+RiUdUBMM7bXzZ38Q4+TM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwdrQvryr5rnPbOnYGI4gkW0/SHhjeM3gl0A6V2oUMzJhxo+2W
	3XTTBUzdRmm0N2iECM60CoS9y5aM5dXrmOIPPAl8YdEz4nz8QW7t8GRh65/ht6e5F8IIKG+1RpI
	UwaE7nD6NDipwo1IQ4ymGVV8Ycb/tX5u0GMMikLi4YbPfvqRtl+9vZg5IuYgwlww=
X-Gm-Gg: ASbGnctzXGld83AC8eysxTSrPp97ACkg1yySfoijdYKyPCKB5o+hQ9dUXpzjR06KtTU
	AiH/+laKiigSbvY7MxjV/8Y7mWG/nI/oAyW8wuU3uJ/E9VHHL2t3yV66ERJ6zD9EQ/EOXhFtI0f
	oSs8XvWuFVSkiliPE1g936O3LUxRbBXqn6RNSiCN6syF/fKoM5ytzBaAc0AAPygIPTc/+K/aIBO
	inHrXd3HiMDqoCgacvnFRYHykEcpR2TMh05JeEp2VOBnAOdcP7CDdjdwHSKPF9Q92O8AUyYp/2O
	G2PZLeDMi6/gwjPvaoHK9ToBB2xgivLWHEx6fWDvoQef0QoliODdyeD89WtV+iWgOxc=
X-Received: by 2002:a05:620a:4091:b0:7c3:c340:70bf with SMTP id af79cd13be357-7c7e5b6fee9mr172447585a.14.1744713799930;
        Tue, 15 Apr 2025 03:43:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFo3z+W2e8RJIfNcxZyqjqhP2ExIKuOsn+xf7ywPuKxxwN7d0bufad0MSbmw9YNuFyssf4uPA==
X-Received: by 2002:a05:620a:4091:b0:7c3:c340:70bf with SMTP id af79cd13be357-7c7e5b6fee9mr172446685a.14.1744713799676;
        Tue, 15 Apr 2025 03:43:19 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ce7fd1sm1059762466b.168.2025.04.15.03.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 03:43:19 -0700 (PDT)
Message-ID: <ae06a328-f830-4583-a314-b50331c7f56c@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:43:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/20] arm64: dts: qcom: sc8280xp: use correct size for
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
 <20250415-drm-msm-dts-fixes-v1-9-90cd91bdd138@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-9-90cd91bdd138@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5YldMuCH_GeHkbhz3VyLdIcqbhLL-0cT
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=67fe3848 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=da4WsfccAxvekxWPt1gA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 5YldMuCH_GeHkbhz3VyLdIcqbhLL-0cT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=633
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
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
