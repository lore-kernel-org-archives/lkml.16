Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30232737EE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370829; cv=none; b=eVF74hNh1l23zY7Z5k8g8EDnbH7VMEf/NJjbYTK+839YVYMu2ZG78cE/mhSt8bh1HYETwsQHKFhmy8zVO3KDC+3nEgvrehEeHNuEdMFJllEJ7xa3jvJoq1IB/SghNfWW+r+orLUyc/4uzb4poxeJrQovGNop/Tj9vzZDm+Gly+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370829; c=relaxed/simple;
	bh=lfplTRJV/q/OMm+q7mTMyZDq20FwbquibZUlr89u/Vw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jutqXydENcAN4Ac2HKadubSjaYPbgC4/up5RGApVQInQFjrJKG4ihblIFGfXTfoA3F9qAeQYwtpOH/2e81loo/+jYLAhRDJljQIXR35SFUo2np+Kr4jq0cbNvw3/CUYKgLhkIZ9j8/VdU9Brwdxk5YrS+cl/jh737t9dDiEbzE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MkpXT2gA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MkpXT2gA"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561A46Aq002484
	for <linux-kernel@vger.kernel.org>; Tue, 1 Jul 2025 11:53:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QpxwNhV8kmBkr08es5SALZ9+EdMkxt7tGYCT2PU2xfs=; b=MkpXT2gAJBzaclE+
	cMg/d8jiIfvjRAaHVctWYlfjKh+MGU3wDkIEooQWfm6OylembSZQCaMQQmQem8rc
	KcuwImmFMo+KciPu2OJwh7AM7PURxWt/y5DfklzwPAlkJp4J+Rv0bSrxUIdpQD/9
	AOfjVBhpXRrvF9/+FvfHoLV2LnvzndRbvXJnlzaWMBcmvjE3XCWA+dwjZR7Ck9Fd
	8JrxZ6McFi8Esqwi4080mE2WA2XGjRtY16DCbsyxAideclbyK6rU8lQzl9TDI2Uh
	q9DaT/q4tRhvh7W3vaghhYX59Fnq2nQjJIBpjVbw2aeH7PtSH9sUTzQ6XjfOKdCg
	Ca30zQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k8uqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 11:53:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a5aeebad31so9108561cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:53:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370825; x=1751975625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QpxwNhV8kmBkr08es5SALZ9+EdMkxt7tGYCT2PU2xfs=;
        b=TE5d2F0SyOAmdkmvC+ngbTAY/quDSfBA0mZfR/T+tgOv1hKIqR0Y9g4fYI0zBPfcc9
         OODtY0PnU3jr0Sr+iKst7oRjIfIwj0v1Kaaj+rU7nxgypLxe4wNWnzVBO85S1zkDVpg1
         QxnF4rnVMx2C32HFJJu5Sm1EZfVrYCGCAgygQcmD4jN8l8pBxB7LI4IRNtrPRi+udxCr
         EWdXTHhnZrxfvUMOg93OWS2SZ7jr5yZz+0Cy9T+pWesDW6dvG0cpi2Pk/Fnxujuf0hs9
         948//l39UQGjOB4FWtG1U0l89Vno4iVe/a/nqylP/domgA77FSfVSfEP8w0W7+zR2WEr
         MaNg==
X-Forwarded-Encrypted: i=1; AJvYcCUUo2Uj91Hp2VUsI1jcK/pvB945ZTJ9/xh8mHdD/E6NAyHDkWS8dN0rrY66WVQ8a+td6WBQMXp1heh2/p4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/XkUAfOVfj77VHUHvEzMt3CzqUNKxmJ6yUikztzhH9TfB5uck
	ETNldmA2UbBPfLyw1mCgrWsnlPkcvmrsiQNtm2dg5MGpqGVsMwyWbiKA+bc2ZV4eHt3SPJSUldB
	4mmUbr8wj18AGDzSYfTAStmCVJl/208nGRPIcRrkFN82dTdiBd7GHsVOgiN5exPOWseI=
X-Gm-Gg: ASbGnctLNP/BgpeiJxDnnXGP37kawcWO4JvNeoQ2xgEsiuRARgxlQ8KM2ZwpCiOZSpw
	FTgxJwN6CbETCArQqa1ftWd5m9qzw9fy7cgQk4jbEK1z3u6k2AXguCpvOIfTrp2BT/BI6Wceb9Q
	uvqZQ5ZFUt6uOmT08+TaPH1YbRFBbUMl5zt5ARwbRmIYlQfAgKIRqkCFdVLEi5M9I/BANnVT/CE
	8669zPH17/K0AFuY0hBQQqNlF4lVUU5LzzGfUjYtvKCN4yhB3RDKjUsbPS0v1IoA0Jc+U4aJxZ5
	rnYvDLlXEy+kjdZCFSPClIpL0MVM9cKoacF7fSGeGijK9xGNa1JiHeCy+LIrwl9mcFK0TNb7uqG
	4PGyEOYiU
X-Received: by 2002:ac8:7f12:0:b0:4a7:4eed:2582 with SMTP id d75a77b69052e-4a832be2468mr13903891cf.4.1751370824581;
        Tue, 01 Jul 2025 04:53:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWdgLxpAzuiN8smmXG1hbj+2clhnPsKozIAenNYDlGQFDJbhfROsW++8GbvMW+JJgD+uQTCQ==
X-Received: by 2002:ac8:7f12:0:b0:4a7:4eed:2582 with SMTP id d75a77b69052e-4a832be2468mr13903671cf.4.1751370824063;
        Tue, 01 Jul 2025 04:53:44 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8319b155sm7402498a12.52.2025.07.01.04.53.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 04:53:43 -0700 (PDT)
Message-ID: <9b6de81e-54d4-4448-87f0-5ca83086fc27@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 13:53:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: qcom,videocc: Add sc8180x
 compatible
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20250701-sc8180x-videocc-dt-v2-0-b05db66cc1f6@quicinc.com>
 <20250701-sc8180x-videocc-dt-v2-1-b05db66cc1f6@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250701-sc8180x-videocc-dt-v2-1-b05db66cc1f6@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=6863cc4a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=pJjouIxg0UYB63CLVSoA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA3MyBTYWx0ZWRfX9nBXVlofMq02
 TEQDkwztEy9nsLJyVdlxxCI4LwoxLGoYhuOybBeBA6qiFdH0NVrsllzth8+kI9fNmJXPv8tiqjQ
 zAoh6F+TH3RK7C20vlWn3cQbwOiysKT7lgLdDZgcWfvtlSMtfTjJE+Y0C0fpu4U76lr5lWJj7h3
 qI+mNeNrg72UihwpCLieEuBSSQpobzNn0mZ7fIDBnD+/v5lk1Cee2VZnY4XNoUdtdhEemzKkIrX
 /VUpomAGr6C0CszAc2EwkCXaNtcw4LJPCGKzApb5/BXI2Cm9k6T4+LDSnTUOzDLSVod1KzslEiy
 YxUuigIOkNpJz69y9dqyINUjkxyQujDQeW8t4F4R+CobGmYp5zywrqwKOUP2A/pvfPqmVN8RAhV
 BvQWgQXphgMzoUmZJGGl07iN/8RCe5VQ7VSCZLOrSvjGNv0GhIjS3AepYMRs07Df5oFSaHtL
X-Proofpoint-ORIG-GUID: HRFCAEtj3M32SQ7MPH7MIu-Cuf3MEZAz
X-Proofpoint-GUID: HRFCAEtj3M32SQ7MPH7MIu-Cuf3MEZAz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=720 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010073



On 01-Jul-25 13:40, Satya Priya Kakitapalli wrote:
> The sc8180x video clock controller block is identical to that
> of sm8150. Add a new compatible string for sc8180x videocc and
> use sm8150 as fallback.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---

The yaml checker throws a warning:

make ARCH=arm64 LLVM=1 -j$(nproc) dt_binding_check DT_SCHEMA_FILES="Documentation/devicetree/bindings/clock/qcom,videocc.yaml"

  CHKDT   ./Documentation/devicetree/bindings
  LINT    ./Documentation/devicetree/bindings
./Documentation/devicetree/bindings/clock/qcom,videocc.yaml:28:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/clock/qcom,videocc.yaml:35:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
  DTEX    Documentation/devicetree/bindings/clock/qcom,videocc.example.dts
  DTC [C] Documentation/devicetree/bindings/clock/qcom,videocc.example.dtb

Konrad
