Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7323F238C13
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744369720; cv=none; b=IZUiq8V9AjBW6Wug9/2KSw53VWWgMmLpGwtm0kvHtmHr1PSYk9rf8d2o4cfcfPuTdTFeJS7XUFEiSHr4yr/TvOFAYQqlIMPLpxtU2cS6ATTEXGBzM2ci9fDTIm2FEHzf5VTlEFIvd4GE9NxpU6xVq4CZ2CRJ58wS7jFVjeeEB0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744369720; c=relaxed/simple;
	bh=jUMLJ1eCvjknua9RRmRhB2m3mbtVGyEUSu411bXGwYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XS9bx1HDHwQANVSGxlPdSipYMMdN6sTPg/+HsZsSw3gvETll9GC77YvE4sMQdg0sz/mxk9dI6IDHziBEpuey8CxKD4226jzxq4orQRG5+Xhs/Kdc+wR0tHQ2bAoKIteZxr4wMCfNmZPYbf+p83oUc5KvtQzGFH3NhEKlIX3kAtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ci17F/Bw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ci17F/Bw"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5FobD014062
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:08:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o79Kq++JkZecfr1axtLkeLEVdcWYqekrcVToRZ72dP4=; b=Ci17F/BwT1aKdOvv
	wq6EajrQHGkgpJ7FvWMcLg8GakqxkYzGyw9715c3DXRH+TugoPLGcvpzEkHpesOG
	0Fw+7LeHbZend0HtcHLBmrXaYsVFcy+xwk+AW7+lGnWlOEaSR7DsybrgnHbL3rcl
	ftwYQGfkTm3n8+Q+V628a0XsiaZP2MmWCJt/tEn7VB4ky4eQ+R9U+F7VxsAxN0DU
	sMMkOK5XSYOpuGZb/guZlS9dRZ00DGpG4zvpnBORtQxBUNa7F0FGEMZOyXbmKCG2
	T8FAmkJu1IzIOUP62qpmlSm5wcfRAKTJAW0Z15ygsMyJtiBNV2tjF6yPUQWjffsS
	KQhXvQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbej7nn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:08:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54be4b03aso44204985a.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 04:08:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744369717; x=1744974517;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o79Kq++JkZecfr1axtLkeLEVdcWYqekrcVToRZ72dP4=;
        b=M7fBsDZAhUfM+35ym7H3PnESCW1+NTzqYnZJ1TY6MjBsxzyBKjtEAcmfwkgWWka5Ty
         nqrrcBLTcokNWQPkV/P5CIUpnRQpWfsvl095bAbEMRnbY/LrWTwA2IphLSFbwHX9JuMN
         UdU5Yke9sCZ11ZX41SBoq9GW4b2dkX7tYFsQbprmNXtFQULpcIpvdrEiawO/HSa/CeSF
         l3EV4KjkU57SNcFZc7O5eK2zx6nDfSNw+mMBpahYoSXwYUsYpEyLy0tlHysMyqvhFwFP
         o6hTPso1rI/ZI/0k5BtPc9Vz+0YdNnrVRkKrkjz8Pt+3YSqRxfBOwPPGadEbJyxoAmKY
         7CbA==
X-Forwarded-Encrypted: i=1; AJvYcCXjS142tKrd0LNb/YEkJePA7Eaw+uYcXuxluhdhFcWbLTVS9EGCNSLVsAvfAgvx+03rApm2JQqhMEc1My0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPFdgXes5ZLabJXPtFaHfkgKJPIG5JhZKYi0ab7Ji0rk27NGb8
	lvyt/CaP76fylVpfuJAYgghtMQ8hh8NlnFKeJ3RQ/ce46ZclHtK+rj9xp37TbBNT5XAER45BHfv
	D0F12N6cHzrBYq1xzc2TwRK823HD7X4vA5aSfSY90DDa+VwYrH9Nouht1WXzwon4=
X-Gm-Gg: ASbGncvbXHdb8uzKDyhsiVQjk6AR7v+t6nYsSMpCxVEhuUBpqpwXY+iankSkUuJBXja
	LBtCNGj0fXYQetIsbVEPtZSFRL3ixYj+cYdqwp/ss980nGTxqT31gpoHZnQOEEbrc7pWGo2XGsH
	nbtmNIQaBqlamnhjLuEEAZq7zfixm0e292A3r5qSnHLlC7W2T2f0mUtxdFkpQXWtntzb2Bv9IE0
	0aUiQU3Nzh+AbY4wq+ZrOSsMSlpkHkyjzUhnC0mv4YjjIt4MkKVnolJ11vYzcMTTScsxliz0CaK
	Ew3Y5MT16CupqBx5xWbEFIWFtT6zL5mqhJsLKY1uSz9IZ1YTIxEMvaAbnpJ4ZJhFqA==
X-Received: by 2002:a05:620a:270f:b0:7c7:9d87:9e2 with SMTP id af79cd13be357-7c7b1aea28emr58808685a.12.1744369717350;
        Fri, 11 Apr 2025 04:08:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjdXPyj+Dlz7MJrd4wV5Jmd512Lms/G0laHJzFzKIthM1oQjkGEBydvrhqVbYRgd7fDl+WIA==
X-Received: by 2002:a05:620a:270f:b0:7c7:9d87:9e2 with SMTP id af79cd13be357-7c7b1aea28emr58807385a.12.1744369716971;
        Fri, 11 Apr 2025 04:08:36 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36ee55388sm802149a12.3.2025.04.11.04.08.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 04:08:36 -0700 (PDT)
Message-ID: <608c57f8-4f28-4e68-9c14-07b280126d9f@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 13:08:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 2/4] arm64: dts: qcom: ipq9574: Add MHI to pcie nodes
To: Varadarajan Narayanan <quic_varada@quicinc.com>, bhelgaas@google.com,
        lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250317100029.881286-1-quic_varada@quicinc.com>
 <20250317100029.881286-3-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250317100029.881286-3-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ubJESeJ_pSzTuyM9J6sKB4Kmr0iF9ypL
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f8f836 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=87Z6qAKMJr3GWNWwxrsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ubJESeJ_pSzTuyM9J6sKB4Kmr0iF9ypL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=765 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110070

On 3/17/25 11:00 AM, Varadarajan Narayanan wrote:
> Append the MHI range to the pcie nodes. Append the MHI register range to
> IPQ9574. This is an optional range used by the dwc controller driver to
> print debug stats via the debugfs file 'link_transition_count'.
> 
> Convert reg-names to vertical list.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
