Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05453278E79
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 21:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751059798; cv=none; b=CNbwexV80hSZ3YdiFhGmSxfclXhU2xedZBaxlaFVTbofkoPJaNvBwmADu1ZnC9LLPaHEaMNS3wEl1mJv09Zl5Ub6lM3/ocIs5+rPNa822UKCI/1q+nWwlOk/1LtcryEhPSrumaKEPhtXc5e2SAQiyHgCEPZMUza9b997CmY69RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751059798; c=relaxed/simple;
	bh=DDrlIsBowQIoYj42JBQiuKWXbnIzuVcfTZ6WW+6h26k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GQL96lm2a8+6w//58axx/A7RQcAsg9dUW5lsD56b04HBPLS62eJ75pr+72JOE2ZPhmr3XZbjxD9c9fAnGfuE+AJ3q8ejNWSkdPDaJVEIR5zRj+HeTB9b1slo7czR6RGa83ecgbSjpKSDU2OI5gKwPiS/KCHw6aBQ+WPty39FMCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=koGqEnCi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="koGqEnCi"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBu3K4009871
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 21:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j+VclKGpJtOMeG2/CBYjO907O4spsZFF4G3PlFZVFvU=; b=koGqEnCim5hP7+EU
	LHS0XQuPw/A3zDmAwwWpmZcjPaA1rivwkrl4wCpl4zGemNcPKZ0up794iytwe8sv
	nMYE/6UBcZxT3HS1deXpSuawI/QwHWGCaqYypHhxEfzmxrQhiPWyyRAtWiZw2aF2
	X2OLqLQSCKYxR1CYo3X+xmwrcjA8smYtQuYPIPNd+0wl+bQMAtAnhggqUarWrESH
	pHSa7s5oOF1JKtI9WQ/E4B+Gftsq/J+AWMh39c5L2L6LEd+xyXyeSaksx1j1dxjZ
	Yq7VmeTYHnylnhlhiMIgLp0LsBBWceQKvMKCIwzKr/REMwPNRkTusclbPXXcovwH
	SrvWvQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fhrj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 21:29:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0976a24ceso69443785a.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:29:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751059794; x=1751664594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j+VclKGpJtOMeG2/CBYjO907O4spsZFF4G3PlFZVFvU=;
        b=LEgAZcYWT8czBGcb3k8J5uTQnSXib48algb9rm20DsMwYZCe+4B4rtNfeKO4YhWbxK
         oXWMENAOK3Bw38q4AFiX7QVeT98kLV3oIHuttZ5rjnV1iT+HyVtu0CppXY5G5kFf8E14
         c7dNK57w0hs1f+QZ0RAHn4e5Y768No1A3MAgh1ZpzMNbApxI07Ikkn4taP+j7cHLPrnL
         3ZEVzJCPY9DkbN/BAOiggL/F46lOo6ZDfcbDE3r32o+FX+v6O6QfNMHak8StzPIPxiZj
         vsJeatJYfNeVtJR+8h4kdtd5bSp4Iifz4hFaK42kvyFBjEXilIei0iAiDL+obvKQdCWq
         Qd2g==
X-Forwarded-Encrypted: i=1; AJvYcCWztv/m/MgfLs8vaeDZMsEJMB7tIkuaByQxyoRWwGpPUdgkWtP52fTVWih/pjOWFNWYmIk5RFDjRq3oYvE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+PNWswtT7VKqn57beE77TtXKzyN6aE6qBC1fAbaoEGJFCjEhp
	NhmvTQT6rLNSOLKT9/CC/1xBg0em7XPuNOsBOrs1Ca/AUE/jpGTmyDPqyBZFqvYYk2V6AEQBQpm
	e+HS2k2LjcvRPP2OWcLeudEt9r4vWCje2nrCaE7b8ww5LtRV91MxhSwjdGUV7j4QvWiY=
X-Gm-Gg: ASbGncsOZaBkUD/b7JSyg1lPqbKFNQPPn1DIyHbRUrBNHkXVig/8YoMF+WIHsF9pLXJ
	+tXBeVKMRwtgLAu9CVYrmXyPI/HgSiXQ6xoHOV3ND/MB03nvbGwccmPDsHypY9qyCyjhjwJHA2O
	PPw74/3FlGOkI+V5CyAG3uRf/77I9wUufOfPYdDvC7Z6uFQzhYP5mUErKj87METK/ZuCY/kQA6W
	0a9cGc+cEWFPjkO1rWm3khRDWFVy9nt18tDRLUwcy6cA5mcobbK8+Q0C8QJMdD+lLBCDsoG4Nlb
	ALWcJqJjdLUA01iHLPsAfyARdvdES4nL53izxEC49fWN6qmIHh4ulKZXCddjtEb0Q6DTT3z6yT5
	MlXA=
X-Received: by 2002:a05:620a:26a8:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7d44c27a0e5mr34981085a.11.1751059793932;
        Fri, 27 Jun 2025 14:29:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6O61YOi4A2FE/HAM5495f3Lx0kZsOuxdmkU5HT7ZQwhZfq27mgtK/+v+5AKGJA2+aDJAuWA==
X-Received: by 2002:a05:620a:26a8:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7d44c27a0e5mr34978485a.11.1751059793400;
        Fri, 27 Jun 2025 14:29:53 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35365a95esm195682966b.59.2025.06.27.14.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 14:29:52 -0700 (PDT)
Message-ID: <6e4854e7-1bb6-436e-958b-382e26beee04@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 23:29:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] clk: qcom: tcsrcc-sm8650: Add support for SM7635 SoC
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250625-sm7635-clocks-misc-v1-0-45fea645d39b@fairphone.com>
 <20250625-sm7635-clocks-misc-v1-4-45fea645d39b@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-sm7635-clocks-misc-v1-4-45fea645d39b@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDE3NCBTYWx0ZWRfX+j1Rj3HbZhug
 TbxdXclEhwbDkIN849JCbFcLZRlcyt92JrBDQZdbY/yd1oMOXBG62YfFXbWfQLd62ge4GcDWW3W
 IVz+q9ix/12TpqnNP71sompbZmMXTln/Gv/XBQmTWWLlXV5fn9RQypZOCMgXK4Ayd8hRnK1cglG
 FEW9X1XoAATgKdztPlz8OzoyQ5FoLWNWQMpE4EEZXHIknV6/y5K48YA6yFY0BPkexVpJUqwTnhE
 nrqa3MAzz4ICSi7d+UEKpIxIYfgGa7b2V2pMWHA2ksns774IJqIl/0TYGJF0R0q1tz2rL9mBLZn
 GUPsz2ILq8T3Lbh+pnVXUbVG/SQ6VMJjGsscONw1B1XCvaOlis013XxM53wgCd8MoagYo5yTYLk
 5WlcKkRaDgwp8AqDGXk0/PNLLOiSS9rFLdki7iaq6HVWeLomSWrPRvisVdcaCfcC+BZsX2mw
X-Proofpoint-ORIG-GUID: M5r367f4Wi_WHDqi-5e-aYuiZxDiLPvR
X-Proofpoint-GUID: M5r367f4Wi_WHDqi-5e-aYuiZxDiLPvR
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685f0d52 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=vTaQQWYYi_PMaXEYf6cA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=836
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270174

On 6/25/25 11:12 AM, Luca Weiss wrote:
> The SM7635 has a very similar tcsrcc block, only TCSR_UFS_CLKREF_EN uses
> different regs, and both TCSR_USB2_CLKREF_EN and TCSR_USB3_CLKREF_EN are
> not present.
> 
> Modify these resources at probe if we're probing for sm7635.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
