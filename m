Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0B728DEF0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713467; cv=none; b=Ju2d18gr0sdbHSBBkVlHvIRa8/27RKeqnaqn7D0zgvU5kEb7Tpn6aCAihhh4e7znbzkfUKs1mgy1TQNCWwTtUtpBTsrjQhTPPdE0GBmkyAmYWgkapByDF8LoqL1f34se4OQiUdxuhvyg7TfST24rbm3FpBF+i56HNSQ7PYu50HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713467; c=relaxed/simple;
	bh=PqtFIuf2PaqgdiInwLbpBw6+hS8F+gVD8HwKtn8pZqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZVZefiKdc/2ResVjJ0uW22NDznekiqF8UUTY47rsFw/icNkHQsrM+HoY1INYpBO6WenceJha9O8rjFtjWpVlntW1MrUYFiSNOu7+U2XUoLFNSNweRAsUsi4HcOftT3pu4jouwP+67SW1Pb2AEBayEfiLSwp3bqW3B+8LJ3tuk04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j3Wt/W3w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j3Wt/W3w"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tJAg023347
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=; b=j3Wt/W3wYzYkHRh5
	nrDhqE0OWTMgtBaJz0WWwgDqyRRPCMyAZeHrzwjakd7bx1x7uU0t4sLEpZMdixHH
	KYxqjPubcThpSD0g9ut5DoFHCObpn8gHFmgoqa+BARO93MwlioFZDOwOF0qM3Sld
	sd77khtpwbO7FZciN5bEuuNE3Q0Xl2fa56mrfql9ttpUL+OizPq9eGcFTqOnbA+h
	wpIalOM9pFvfGoxNa32l7zF7Y3yXpjXpi58/aVsWMHfalMjiRFqkGEkmDEk4J2hJ
	gJ/XdSMyo8PmQlzi+xOXU+P6mkef1ShJtIjZ2Sa/2RkLQX2WDQ31133bdKYQJm04
	hgt1Fg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj97pgv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:37:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6eeb8a269a7so16717836d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 03:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713464; x=1745318264;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=;
        b=v9MhYdKKIKCRLsGjCrou3JiTyPg6/KC/0lQq+IIjg+Zblz8kSpPVovWPT9xyJe0G/n
         dFJi4Q7hjPorkfyYEG7shYmWwVGVOGXtWHL1xeyKYN5u3X+Lu20sm7X47ne7LUbmCpgT
         NRjp24031X/ahF1T4EPxaSIEfK9XtSHnCZDm65G6eE3Y1tErs5q6WXIoIWXdfTsD5vgz
         QBfcvVM24rhAg3AhJC5mMAI8xX0Sy9HFbqqpZBNmTzrrzyb4dmBmjsRG+yMdzmTItbxJ
         XdeYbygAGOo7eka4foEMa7lA4iU95tAM1jszMnXwBG2ULaG/VeLhw/Z29bi0/bCg9x+p
         BSaA==
X-Forwarded-Encrypted: i=1; AJvYcCXafpOfS5xFIhn5bqqUBlvZUrQrN5LvSMaVxjj9sqfNujy+ujqr1sos8DTWyHNJdJUJGucA7COFEgByUFg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT+S9oi4Rbe6qeCyZclXQMiofmTcATP97/NBy99dPCY1lhQuZJ
	iRCkTYXW4T4M7W2qCLnAGibvikmEauq+wwmPH7dElNZDzWmutOUZhm4JLBsxw/li2KpbazMcG/G
	DBKQpZeBXk0q6WE86UKGhvONPePt+qgS5qqsu76mF1ncMlr9iWAe3lYmni6/chcz3WtALvhQ=
X-Gm-Gg: ASbGncv4R0YVN3wiADuHAi6nxPrwCZE4rSAeuGeY6X1pFuUFvBbxXnjioqw2ttO3E4I
	DQpggeKQw4dd9hN4J9+Sy2UMDYz5jdsN90QVz6Nvk0Mf0woycuBXQvrwUVmcAnah+Vc/P/KrDbH
	NYkLrHLnqbs7s3VV4BN4Oo4Ie3V/Ks5IjvvC2kIjqrAyReYJwEsOgruqGXvjfC6wa59S2eq2iEQ
	PPDpp94BsQo2QPbmvD0hT/mzCzc5Rfpmce/VXB7N09CGhp5p/wA+76Zq1tfs9YHALp+jCjG3rop
	Q7BGXYVfd6yGaHzXz+aj0VkxSW4KSR4ayddzvx1sR8G+Scyq11QkU2MIuqqdd9Du2oc=
X-Received: by 2002:a05:620a:240c:b0:7c7:a574:c0ac with SMTP id af79cd13be357-7c7af0ed2d7mr888669685a.3.1744713464051;
        Tue, 15 Apr 2025 03:37:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETb1FvwwiGOUs5q7VNpieaFxunkNcu1BA3secMuMUQsb/6SQ1PsqQAyfinlGBFUVWPIDzjTQ==
X-Received: by 2002:a05:620a:240c:b0:7c7:a574:c0ac with SMTP id af79cd13be357-7c7af0ed2d7mr888667385a.3.1744713463705;
        Tue, 15 Apr 2025 03:37:43 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bb312bsm1080609066b.15.2025.04.15.03.37.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 03:37:43 -0700 (PDT)
Message-ID: <ed47fc23-621e-4ffe-baad-7c57da1c305c@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:37:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/20] arm64: dts: qcom: msm8998: use correct size for
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
 <20250415-drm-msm-dts-fixes-v1-3-90cd91bdd138@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-3-90cd91bdd138@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: P8e5aajzbN8A_IOj9M7rokVfw7RWc1L7
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67fe36f9 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=da4WsfccAxvekxWPt1gA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: P8e5aajzbN8A_IOj9M7rokVfw7RWc1L7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=633
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150074

On 4/15/25 12:26 PM, Dmitry Baryshkov wrote:
> Use allocated region size for VBIF regions as defined by the docs
> (0x3000) instead of just using the last register address.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
