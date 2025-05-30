Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0675221578
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748602562; cv=none; b=S52UfiDThHVH7SeE/YaNG5lDDfQJU4gWyerqxVjRQEiBFh96jVbn7PK6Q/asZLeXUvjDcqulbZxT9oXtfZDLwV+rsEHiA+01mcEAYkZFy94z5XxzXNU5L2r5kc4PApQfT4wfkXJ2MTpl/NP4twMcJRye6LruSsAsfsprf3gKKbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748602562; c=relaxed/simple;
	bh=whNY3yVCRWOs1BSgLRWZD1ZKuBKGEyxBXuEhTV4AVDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GuLES9aIJm1lHrGee8aehbnvqM17t645iV3kwhtFeF++Ov7C3c/VLDH55KHLQpujkSw17NABeYHmyRcqizhQGqHZFS/+Yb2L4VQ1G/LZbu7dWeMkMRxcONtNIo2r6vm8JGJz8m+j5AKz4Yk2SaNvxysP4+PDL3S0Ez+z6ksQyoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BL1kigCT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BL1kigCT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAF1Pu026428
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1z1t2Z30GL9L8T6xsR59OpWGVjJYpG/IvxPuy7JAA8E=; b=BL1kigCT4uvS+RBL
	+PEnw942ziW+AAXU6nO5vrxC807BjyquQkycSlo9BE/5/e8tvA8h3d76lyUq8HUf
	NMyXRRL6rmkP5txdGQbazF2c1QWPFKnjif+d0Is41uCLSzcEWuagQG8+vZ59AERD
	Gk9W65rhTHqU+YOjVMp7VawEw6D/F8Sq3/rKYFre5Zx14GBxeLZex5xVD/PhU1oV
	+cohbpobIbSxtjanSUx2EKiBL/ZBSEBLcN1krFVACDJzKhMI/Qead2ORaS3pxRWL
	t/R7s2YV4h5wUTjv43YnU52qi27VkdjUDUNPBLiglqtpqUkbvqreGUot+F9rcfNv
	IrXQiQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46yarh02wd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:55:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7ceec331273so40467885a.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 03:55:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748602559; x=1749207359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1z1t2Z30GL9L8T6xsR59OpWGVjJYpG/IvxPuy7JAA8E=;
        b=b2d74r9HjlgOyw6BapiaYVfY+zFoRuUHs0Wl61FK7iCSUPVeh2KSD45xtGz4W6gKig
         9aOy+FCVaMJrV95pZ0XbBbiAktu3Ob8j4fGl+Jdgr5apiIxdaK7pZgNg6n5USTjZtxaY
         5U+1t3aNGWh/XZ5Ud5UP72pavjiNbgKwU10gyl65J/OzZDBCWVI2fR5kV1f/SzGbTXCC
         QWKIGela1bqktNV9WRe+Va53femnmH/hp2eLYXDlepjW7kHx7x69FNqEmvW2DdFGUROz
         ddJ7SSE6FVqEG7nWaUKk9GwTF32tZAxIXKqhTiSCcDzgt01YCurZBtQEE/QlPScbL9Ab
         2J0w==
X-Forwarded-Encrypted: i=1; AJvYcCXgAGuPxhBUskqztK/l9lNFfRnpsx3N8z+eH8SKDGb61jKkiJMYjOSMfQZJan1CgqCZnE30H7YOSmdugUo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6cTGY8a/pef86EbQ81KyX4UNUCOk5kjJ84Fbks4TDpAoCb/Db
	2/adhltY2qtKyaJgQjBKynlnEO5cc5W2yTStrnhWD+3uVMiGFWgZkDU7rQJtF1M9s13aFXG1QdZ
	Aa7ps13Lelg9vQz6MDoNz17svBhWAmderyGZVQX1d4WWMREgBfiiVynOdEl2hTwLZ6uo=
X-Gm-Gg: ASbGncua4yBX0RaF4L0+URQlN/wKFNxknkz8VrBXJ5ESmmozhWDyXwXgzLHM3CxU/GM
	LvU54I1pQipyUtd2Pe2bOX4oID+9trkOxUPshuDHs/+qRywgV/aeHyQEw4Nfjq7pb+KWApsVItD
	JZ2ACuCEtsNz6W9Vr33ux2PEQJlT3CYh3EsyUN08Y6ijRCni8Vncz2NqF4D1LjuxOQHr5dJoc2E
	DIsUkOKthm7y+6D2iXrmCx8ruerx+vduCdTxUS+ZwzhkM1+bCrgW51sViTuVpSsS4WAob+/Cmud
	DiOLfa8niNr223kq8zHjqk3ufVLnl/UJFKtpbPuWYEb7rXLoXoG2GEixqxhy9zZ2jQ==
X-Received: by 2002:a05:620a:1917:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7d0a1fbbf12mr144603485a.4.1748602558449;
        Fri, 30 May 2025 03:55:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJbVbPBnzxBc1ipfoPAXrfEh5Qfo2HTeThK9slvahJ8kJvoNGDfCAapCiPVTOYKSDB2waJKA==
X-Received: by 2002:a05:620a:1917:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7d0a1fbbf12mr144601985a.4.1748602558042;
        Fri, 30 May 2025 03:55:58 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6056716beeesm1435854a12.80.2025.05.30.03.55.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 03:55:57 -0700 (PDT)
Message-ID: <2503abb0-8ea4-4d9e-8569-3ee295dce37c@oss.qualcomm.com>
Date: Fri, 30 May 2025 12:55:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/4] arm64: dts: qcom: Add support for qcs9075
 IQ-9075-EVK
To: Wasim Nazir <quic_wasimn@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        kernel@oss.qualcomm.com, Rakesh Kota <quic_kotarake@quicinc.com>,
        Sayali Lokhande <quic_sayalil@quicinc.com>
References: <20250530092850.631831-1-quic_wasimn@quicinc.com>
 <20250530092850.631831-5-quic_wasimn@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250530092850.631831-5-quic_wasimn@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDA5NCBTYWx0ZWRfX+UYJ+CVXs6du
 2WhvQemstswmboyCNjxbDVpHzdi7TpYqfg1bmvl5ROVlaRXKA9BSBMbUIHw6EdwLNKoNnjfhAGO
 xVUGEvRx1/jBQhC/12eIMbvG/yZsXv7jhbKUYhgCRFakweWuaSUHhuhyhS8omZuVT5duLRWss+A
 /03zh4lD4vfg1oEBYWgOt8S3ZVX2f2Ga9WlcC4jtUBU4ebUMAwoII3x9w/MDlnsNNUXpgbiQsPU
 Zu4lYhQAB8UiU6ELGEA1p8l8Ni5MD5kWF3vkb7VnaHXjriLP1Vx3Fls9EoCyEAUNTA/YCFuJd9k
 VbIjuI+BjiRSshxv9KnU2mJfSpXl+psT5Vae38h9iSkVuxJ7zGGlF39d+9VfLKTeaeHzHbONN/Q
 z7A3u0C7FY6W/RRtIIO7vIlFI9pGm0CvggU/tuu/axWdsFdHS23CMMNYu/I6KpfkVM4axRJL
X-Authority-Analysis: v=2.4 cv=EfHIQOmC c=1 sm=1 tr=0 ts=68398ebf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=zgs5Lv6q46mbt4vC44UA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: wRpNJoGVP6N3llnGdJGxqVjmEzwzDihj
X-Proofpoint-ORIG-GUID: wRpNJoGVP6N3llnGdJGxqVjmEzwzDihj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 mlxlogscore=720 mlxscore=0
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505300094

On 5/30/25 11:28 AM, Wasim Nazir wrote:
> Add initial device tree support for IQ-9075-EVK board,
> based on Qualcomm's QCS9075 SOC.
> 
> Implement basic features like uart/ufs to enable boot to shell.
> 
> Co-developed-by: Rakesh Kota <quic_kotarake@quicinc.com>
> Signed-off-by: Rakesh Kota <quic_kotarake@quicinc.com>
> Co-developed-by: Sayali Lokhande <quic_sayalil@quicinc.com>
> Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
