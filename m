Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1150F28BA8D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713424; cv=none; b=TAh9sNzo71QrZpI/dVeAdeugqNqKxhYGH/TElX/tDlyi2B3qtFwNEGTrdoeGD+HbRT1m6xA4Mu3mU8L/YhZ72NYdDjQ52xudiVxTSVhzxMD5V/nFeBBhI0iWG4fWs/DDq66SUivH3WZiCdwoTjeN/+42ldfZLlPn/zChHyxs8wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713424; c=relaxed/simple;
	bh=cQwcXftl576U3tWrMEUfsCJM2UPbQ3gsMoIHXZJwvy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S3kZpIySMWvrSNPQlwkkeDNlI9j80xmFmnC6rxasWYFfbJbbY71tMLlENRXcfMwVsgcJzu8ebbE0RNA61olgJCsNMaXAhZTymN20UkJBIJSXh88a4zltbnzLq9dc5ZOrJemvw3xcD+5AgGaH2In+hPROsvrO6W/J6AbN1Cu7LB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dhDAC+iN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dhDAC+iN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tT4u032083
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7BfkcRCNci+bCQBNjVXlG/q2/sUT/p1vowXWuYhhnjE=; b=dhDAC+iN4dDN1pPs
	ySFjbBTF/Q5yi5TmCxL+w92f4LkVxjzyTvYkDsCjfVsIzr2DUwG4VWtiteW9xp8n
	jaFUEsOykFiGZ87UcR0pa5bAiDj+qj2odDdOIbZ6Pt2yzbVjD7i46V6Q/lTIBboX
	pM5xdq5meYc7AxhWTC5oIrB5Yr0jHmTgMmLWUKZDn1e3RkB+MJ04uo3ks2gNvQap
	27r/SBfT1xSab73h/pdfYASlFTokSLATa9C3w5cexQiEOc6nZj27ea6WpXdjoRKL
	yIAtLsOh5eqNpF0HcfJ+2bjA4/Abvd07rkoVkRZC1LICHtuz92QrRfkXkPaYSkGU
	xz30dA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs17qrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:37:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4768b27fef3so8820461cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 03:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713421; x=1745318221;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7BfkcRCNci+bCQBNjVXlG/q2/sUT/p1vowXWuYhhnjE=;
        b=hAYwhNL7NpIcq6dmN+gvt5m6W4vqDx8euJg5Yn6/ec+nrYskzF6sebvUkxlkf9fZ7E
         J404CJWD0/2AhaJSY6+VsCYRn43BXV4ujJQ9SisEeAXyYBGycrzsx7HBNdPP1mi18grR
         /Qf5zCpA+gwT06reK7KkTy+Inw25suyHf2ya7VKGgfpGtm7QGqlw4gqCnI6cRLGiulAR
         0Ea4NW8CvGkkxxh+PhaW4XMpp8BW32+Hho9GZ6y2okWmKnThr6NS8/NUjI07btOH64DK
         Ew2okQW8s4aVe20jBorn1JC82+nm1uqQj6Qm2zQLTOSCTPjASCK3GK5fOFGuuoAtMZdv
         6rnw==
X-Forwarded-Encrypted: i=1; AJvYcCVCIP9lLUOdT7xdatF+AWq2GXmdqbPpHH7npa3pNTGZqsDINkpmA2C6OiHvpMRS55DsjcLm0ntazhx2cPI=@vger.kernel.org
X-Gm-Message-State: AOJu0YygthaTWWpYeTjEQ++c9vHYEW3ie8aPOnDEDb0WGQhMFgUQHlUy
	8wjZwop5rRA073rV8TNmdGzDphUDzSKYpMLR79C+apHW3t/VHWy4t7oG+BtHTN43vbc5Iec18dg
	964Fj+FWHwBlttSYCqXjtMzDQBTCwuORjUvJQyPPI1avGDKh7S1vG9xVVoWyiA4U=
X-Gm-Gg: ASbGncvmDAua3ECD31yDJ1n4Zbp9BDzwsA9B9yHxcOyyaUF+qyxM4DP7ICuTvr2B8ic
	GnBTpEhYY5tK5whbGgD8yLiR0E9xaYrb+L16UtwBCrHtq2h9nNWRJ7aVPVCPvrtytjr7Fky6mlO
	SYXiUrp5verKxBdW5kHmiiWW4s73f/8pNiSDVpY6ct5IuKsqyt490hBT93LFn8jynDkDdhAct9c
	iJDGDmaU+WESfwIVHtvtAkB0bKhVfGPMosApbnZGCoavxxzQ1oBH3nKml3RLvYHIZSrShfXyGQY
	Z/JQMXq4yWQdEIfJeygx1b+OYwCzYVWX6xECVzbDtQmkf8yNAH8FNdxw/gao2DOG52M=
X-Received: by 2002:a05:622a:15ce:b0:472:1de1:bc59 with SMTP id d75a77b69052e-4797753959emr72955211cf.6.1744713420993;
        Tue, 15 Apr 2025 03:37:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKwxupMVfqIVUO5Z4iuLkNhaFfvE6SNotTJNqNxY1p9H5z+PlsLYFGYCWleXD/sZ0GRI8U8g==
X-Received: by 2002:a05:622a:15ce:b0:472:1de1:bc59 with SMTP id d75a77b69052e-4797753959emr72955081cf.6.1744713420688;
        Tue, 15 Apr 2025 03:37:00 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36ee5500dsm6343674a12.4.2025.04.15.03.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 03:37:00 -0700 (PDT)
Message-ID: <ac64dcbc-64a0-4ac0-8e25-14c9706c6d00@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:36:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/20] arm64: dts: qcom: sc7280: Use the header with DSI
 phy clock IDs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
 <20250415-drm-msm-dts-fixes-v1-1-90cd91bdd138@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-1-90cd91bdd138@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=67fe36cd cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=udklyl2LCIZAaJMMIwIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: tbjuSx89h0fbtYjaQwUqDf0VsrnVWqBT
X-Proofpoint-ORIG-GUID: tbjuSx89h0fbtYjaQwUqDf0VsrnVWqBT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=603 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150074

On 4/15/25 12:25 PM, Dmitry Baryshkov wrote:
> Use the header with DSI phy clock IDs to make code more readable.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
