Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC4F1E5B62
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 16:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744302543; cv=none; b=rhIG30MsdUjp2rwvkNuIM2LEM+Vxh6wmzV/7kAaykVzn6LbFWB9JT4qjH0LQD7gpfUgIF6cl/xIfJety2E2lYkgR3bRD8NFZhYu/Zdz2b9uXILXCXurBwYCARhuja2ACmh7tZoOc0sc0vzsoOKH+CTPVrDCtOHArCoyuvPjmP+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744302543; c=relaxed/simple;
	bh=lDRubKTkkiKz7YzbmfGnTOC7qil+jLzt1lxHNAlUwSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xp08KpOS7+kEbExG/p+BwYJaarpeMGWsGD86yZIHVy8BGTrB51ctw7pn1zmI2lBBiXANPooJYHWhZ3NA3kuuifC+CBXXrhqU/X536PF5zgCMnFKHMgJ/KUZ4L95QNm/weidIDnBkWYcMmrE4fnOwz2uA7jcAr/0MmEl+/hF9Pro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I3oNWYh1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I3oNWYh1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFrP0t031979
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 16:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1LYRnKYALBxstxnY8N2VWmQJbh99uAes3RlQszC65LE=; b=I3oNWYh1pmIWvoPZ
	YNXyQcTQxr0qCuCP3bjsX+gmUikLAOUHnI6M4W+4Z4iCmhJ4jauoG7R79DGyQaLR
	YRg9knFf18wr6BTpxnRr7MDWGcXkpgDZ6L3jPmbmd+HiMfbN6yDQEicmhQrqIlUX
	6tKvOV9Uxt33c/nVKz/ytYL+Cfqev0ynqT33WnoH5sMTx/klmCsJH6nt16qnTTKk
	FbbNhDcICoxYKKsdCJB0uOG6LJESAY06eXDPKphKszieSBsl+wgoSWCG3sGXfwYr
	C1KFDE1eKkHJg396QkFwC0ipB7VU3cyb3KnFUyklTldtsojJLNB71CsKoR+exSMO
	BvPqKw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmfgaw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 16:28:56 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6ecf6a05e9dso175816d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:28:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744302535; x=1744907335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1LYRnKYALBxstxnY8N2VWmQJbh99uAes3RlQszC65LE=;
        b=iU2K/hEXr4h7xghYg4lPTAK4tH93XQqobimxOb1ojFc4Rm7BPRoVZSkVEJJrCTopmV
         hqd4WymxDVoj40F+B+r5ku3tU5VFQn8fxxTbt2DEuxNjqXCtdD0DF9mu6nxZVgZCvuMm
         KlaZjMo3aGRNYW6kmA1XtN5XcwDxGJesS/JwKA3Y3aWvX8td5Ma5h09HVxCi/V/rUseu
         PxNy/j+bjp5+cUp3PDEeHZ5Ml1mJciodxLQIdPvBybNRuwlliSxT81XupkCoa0k/Kvnt
         rJhGjZIktGIXWur+5CwQPhye4FFeYX04jEQcKRTfFNa+tRPUkk8uKPmMrj0asPowoxTZ
         eRuw==
X-Forwarded-Encrypted: i=1; AJvYcCVby1d6h2mzRDFao9EkkqRnC8DgABrJHlU1e128UfOLtctezZPy03wlK2gc+83ra7c5lwaVwhDjxJj2H0A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyqBdjJjRij52sw+WSaIEy7PNlNxDES3Z/G2gYXs306ef5JNNN
	3uYi9/KrcwHN7MvZSzSCs7bCfj7AzAVZhEHXni56SofTQHmNS0lJWomamJ5oEjwbdoFhjUqcuQ6
	MHgXNYq3Y3k9HstAQBB9DH3a3mUz2FGfR6IjwMuPUH99ed0RNyS31gnZRFEI562s=
X-Gm-Gg: ASbGncteQr8bIb5v2e4tj44PP5y5CBeOguAWyAH6COSH3VoG30lzUnpvl9DtOr/7RbL
	9a8jcN6xAlToxsJhnLhyfrlfXnTqUDEFY8OPqj4yEQH2Ls2hRc0t+m30dSjpl2Onw0sCeHCGbwe
	JGhnk0v1TZTUiizRU4PR4M/qdTg9TjToB9db7x6/g5vD12chUhrMvWBbz9fg3Tw/OHUe5KDV+2U
	mRZuaf8qFBIub08A6Q35vQ6yCp3SrbwVamd1CL2v64Jga3F90qQxP5aOiMW9goQ/wGvIpq+kxy5
	HCzKyvRIvfNGyjWTt7WNeptX5HXgJGqgd6HNrylCJDOtWcjXNpy1/Ngwfnd8J+YjyA==
X-Received: by 2002:ad4:596f:0:b0:6d8:ae2c:5053 with SMTP id 6a1803df08f44-6f0dbc9abbcmr37085966d6.9.1744302535329;
        Thu, 10 Apr 2025 09:28:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpQTzqEgSGnRGI9+a1gSJgk7i17w0vzyr4OAfVjD6W7x+6Le37QVc7oS6Fu1U4ISRaqoFqsw==
X-Received: by 2002:ad4:596f:0:b0:6d8:ae2c:5053 with SMTP id 6a1803df08f44-6f0dbc9abbcmr37085796d6.9.1744302534993;
        Thu, 10 Apr 2025 09:28:54 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb4300sm305662866b.94.2025.04.10.09.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 09:28:54 -0700 (PDT)
Message-ID: <5cf9c47f-089a-4748-b4b5-21637fb7368c@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 18:28:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sa8775p: Add interrupts to CTCU
 device
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
 <20250410013330.3609482-6-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250410013330.3609482-6-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gRuFAuGrfGdnsIVJo90tTtvm3Op85SNT
X-Proofpoint-ORIG-GUID: gRuFAuGrfGdnsIVJo90tTtvm3Op85SNT
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f7f1c8 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=jy6vGmKe9HVL-Nowcs4A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=728 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100120

On 4/10/25 3:33 AM, Jie Gan wrote:
> Add interrupts to enable byte-cntr function for TMC ETR devices.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
