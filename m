Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED921F2BAD
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750677808; cv=none; b=nI+ACMqOI5Q4UTZ4Z73AYub7kAoY5lPUKlNTyfSxdNbn/qnPlABubdok06+yNJML81ilfzlVkQwdabmS5JB1gcd8ZBhsofMO25iZjDiUUVnGVQ169PCpBPoJLuBVCzi8wS6YUeniGi8pAm4ONnmMO9DgKiKEbVQEPrmixEVpDUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750677808; c=relaxed/simple;
	bh=za3jzPzxjRKrGPWrbVkFmVAdacWDo5Ii0cqWZ2Fo6gI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QcGZwTr5fTKW1lcoW+O63b9klQkNGfIAx0rsx7Rvp0EapHhFsnairNiB6sqcEcOAajE/jxoqYBMjAQTXkR8wzUit913O8MkmgrMUG5TYRhQbdW1jB8NQW6+D4AWZ3uP77YTGplucgnc4LhpzS8t5/iMHxBMnKh5Tegbixql74qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ANNbLeOp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ANNbLeOp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N994lI025954
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UH9uuyUXsNQsiJs5r+UXcRRobA53OwqGqf+ZGt8Cb88=; b=ANNbLeOp/lN1DG7z
	ewPOV4RIwpwnh2qgJugpOWgn9hG7ZcnJhNqKxKk6yQQDZI5ATFASG47iX20M9yUW
	xJsOT5W2HKm2qVLCd0ChgDCarqGqraIxwtWX7UIVDprz1xH7HaXD7CFIdx/JWQw7
	oL9qVim5UxKaNub47x4Pm/tEuJ+fwN0wKEm5DliM+nsOeBW1CtzZm2OPjh0nsoJA
	tUxUKgeovmOKKPjT5qs4EpLXkQbM9fVb3WLFzJDQTxroDKye5JhTNXQxIBREx0kJ
	QtVERZfXTKSIeVEMbRlrjxyMEG9kIxaup9DpVAaA6XIxTwMFRFGkyXunjz7w/um8
	bsfqTQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmj28m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:23:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0979c176eso104069385a.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 04:23:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750677804; x=1751282604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UH9uuyUXsNQsiJs5r+UXcRRobA53OwqGqf+ZGt8Cb88=;
        b=q5N+VR8HD9q6WAWf+wUJAsXUa7C8fb0udyFiynaRhDvZETB37pYYCkWFXjIk5GJVcB
         fxnrNmkrIGwGFzAGTUeWzuV0eziQeajIZrXOu1/21uleeYVRyYFUUA7ZrBS9LFaKZa/u
         7G8IaSzRHMn2kJtL/iPzRSnESs9SVedY4GS8HNphEZIZYWPVyc2Ko7r8hxnZHSOhjKRA
         oA8pgsv0hrwDDQOJButnKe4yAhxWEIcJ0d4IbxkxTttmvoX+ZT5hpefTM/We05D/0JkL
         n7HIIViBly0GdzaAGJWhPY5cLJZJzCVFZdWBD1FWbnUwj0bodJmIeybcBYORYLizT3Np
         wW2A==
X-Forwarded-Encrypted: i=1; AJvYcCXHyxtW3eSORaYVGyxBUZ0zWqmc6u1XmIYK8nxv4k6fSAobgTcCB3ubq3kyhePXqhCgda0/izSWwK8iOzE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMWIXw3FEI1Mvww5PKc/eQTp1HDlu7UKgpvsW5dfWZS85jhhQh
	vJJ8CH9EKyvUG1YBliRALBsLVf0b8a0gKXxU3z8vritNZyVkz4/zkTL2FAHKgGp3KffoUuDrh2u
	UWw1gJK56dDnUYfWQXrK7Dzb4tUk+PjLvfHRIPFytnlpYPDpp1NxdXHH7PF3awJVIqNN5ppPYud
	c=
X-Gm-Gg: ASbGncvEBGmctgsy04/c0uyAMY/Cic3LJiTwOiiWO8KB6wt1DUS9Vqqy3lDhLmFDY9c
	0/3ALmD28tNYUKdYjAnstcH33UWXYVSwdA+ZYP1VJGSUzetulKEOilT6K+yqmk4Ylo5+j5pBYUn
	dufIiu0XqfabqslV3fzwY0roaiSKACYgHtUU491EJ6s5e8Vq36DcVaP2LS2EhIgnsokyealxJ3X
	XFdn39vyCK1phkGVbMzDmhczszzxOx0D9BLlxFXlajr7kXBtccdRUXPJi/cMng2eOm6jVYY6gtV
	WZOoOSv3RtybzDHm5pHMB5zkxC9V85OyepP5iFIzjx5Wb0pJy1aUCph8VQ1Byr+8AV5+lkstjlb
	HoLk=
X-Received: by 2002:a05:620a:26aa:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7d3f98e252fmr566909585a.6.1750677804657;
        Mon, 23 Jun 2025 04:23:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIeTIVZmLAQYrPGSdghytyNjTMxnVjrXHgHo2iWPUvYkxGCZEFn6pW3QQTQQmBw26psY+Vwg==
X-Received: by 2002:a05:620a:26aa:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7d3f98e252fmr566907985a.6.1750677804000;
        Mon, 23 Jun 2025 04:23:24 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18543642sm5902920a12.26.2025.06.23.04.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 04:23:23 -0700 (PDT)
Message-ID: <aabcf5d1-7380-40c8-896f-6ce37944e97d@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 13:23:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: Correct the min/max voltages
 for vreg_l6n_3p3
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250620-sm8550-correct-vreg_l6n_3p3-vol-v2-1-b397f3e91d7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250620-sm8550-correct-vreg_l6n_3p3-vol-v2-1-b397f3e91d7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: F5WsjP4Vk3IDLJEPTuwg07I19-3L5e6-
X-Proofpoint-ORIG-GUID: F5WsjP4Vk3IDLJEPTuwg07I19-3L5e6-
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=6859392e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=cfxGQl2wVvWQvt-4oC0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2OCBTYWx0ZWRfX9HYS6JZyRUWX
 35GdR7EbvLyGFY6aMn6vNFA2p7gcRSY+AKULMjHl8W5JZ1D7t9Czdf97VXdR5VRbgAcEkv74i0E
 9/uNC4zAPl4DO9XRUfTAV/13Evn5redSB8aVueR92a6J7tshDC9JsqOfcuFZxckzfawOrd7T8wa
 xczkvlM8+OQflLA5kUsWS8Vq0qxSZkAV0q/Iezarj/EsRlwqrc9y2NUDrbjK8tCTnlXdPBctzqk
 AXMi7RO9jjG8nkQHmpMH42be+KRObcYr6CCqi+03XCoCKZKjBobqMqNt03SAFlkLFw5dfIuz/gH
 ddMgEoG4KjS6tJGHS1XwvkyioP0D07KQaM7W/9vqgOkHzj2cHN9IxenPfcDA3PGw9mklEJLEYQd
 qgrl8C+vaYgR+ngIP/+NE+5zctNELNh5lqLwcyi6bqi36JfoCmTe8hYbUixD+mhK/niGZn+J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230068

On 6/20/25 5:29 PM, Kamal Wadhwa wrote:
> Voltage regulator 'vreg_l6n_3p3' max-microvolt prop is currently
> configured at 3304000uV in different sm8550 board files. However this
> is not a valid voltage value for 'pmic5_pldo502ln' type voltage
> regulators.
> 
> Check below the max value(3200mV) in the regulator summary for min/max
> used as 2800mV/3304mV in DT:-
> 
> logs:
> 
> [    0.294781] vreg_l6n_3p3: Setting 2800000-3304000uV
> 
> regulator summary:
> 
> regulator     use open bypass  opmode   voltage current  min     max
> ---------------------------------------------------------------------
> ..
> vreg_l6n_3p3   0    0    0     normal   2800mV   0mA  2800mV  3200mV
> ..
> 
> Correct the min/max value to 3200000uV, as that is the closest valid
> value to 3.3V and Hardware team has also confirmed that its good to
> support the consumers(camera sensors) of this regulator.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> ---

FWIW it seems like 3.312v (which is slightly above the previous
value) is also supported:

static const struct rpmh_vreg_hw_data pmic5_pldo502ln = {
        .regulator_type = VRM,
        .ops = &rpmh_regulator_vrm_ops,
        .voltage_ranges = (struct linear_range[]) {
                REGULATOR_LINEAR_RANGE(1800000, 0,  2,  200000),
                REGULATOR_LINEAR_RANGE(2608000, 3,  28, 16000),
                REGULATOR_LINEAR_RANGE(3104000, 29, 30, 96000),
                REGULATOR_LINEAR_RANGE(3312000, 31, 31, 0),
        },
        .n_linear_ranges = 4,
        .n_voltages = 32,
        .pmic_mode_map = pmic_mode_map_pmic5_ldo_hpm,
        .of_map_mode = rpmh_regulator_pmic4_ldo_of_map_mode,
};

but if the hw folks say we can do with the lower value, it's probably
even better

Konrad
