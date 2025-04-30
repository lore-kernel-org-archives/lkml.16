Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77BB1EB1AF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746008322; cv=none; b=LAK9JUtAu+YWO5Iqi4XefJ4jugIImpxC7UcQ3NAp1JsM9f5/6s4wQaYtiKrw93HAy3uOvzMhReI+GtYEuEpQQ3SzLgqpRM8XlPp69m+dlOlKTUKPxe566e+8n0R8PPH5N8//Zngl7uPpYQnaMsMN2o3tjohDfbpwLgqJVhUWOf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746008322; c=relaxed/simple;
	bh=okgaiHoCfNZIj1mJBgATqTIMGHfVHIGnTJ5M+2oeyF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VrDfC8b+IHNJEMhMoaB8K2Bm67d8tdHOLGVV2ckLitY95JyEV0bQoAavYeA7/pYfJODTVYTaS2VYUZEqtYxWLC8+Nmj7s/fMWJV6/NTkelbOMeFCZj5rW8z/Fnea+Ib35fqFgh4f1voo+CDl0SbQxP7tOu0DXlpkl2nxyVt0GcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F9OKSmWv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F9OKSmWv"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9VTrJ002823
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n8THpF6xzojubR0Ot/txkzNhNyCG9gBGkox8ywEikfM=; b=F9OKSmWvytaVM5P3
	Zygb5c4WZ+Jh4dct4CHC+ZEue5xJAP0uGwzENos7SMwxfjUKf4r/b5AecaPTFtc8
	/+jlbOEUzfUtkVxET0pgEJOffRF1gerj7S9vtNvoPrtu7SBBuq/jYejxJ3wjAVcZ
	EcMAin+PobUM+8UYHG7xkvpZdTNxi8VVPXPobqk/aP4ecVvTVD7B8eenVIOrMyXE
	J6eqRt52uPDVNC2sO6XDC8DCAjnoC4lbk2III5dG0FSJJhjAQHB1eRw56pFfM+A6
	DlxgNByguPhrZS/2JOWCfW8sUWjmPuPfU7nIL9nIATmjndqmtupD6DyF6QmpT4YB
	/pLgew==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u9sq5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:18:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-47ae9ed8511so13727271cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 03:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746008317; x=1746613117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n8THpF6xzojubR0Ot/txkzNhNyCG9gBGkox8ywEikfM=;
        b=I6HkTloP5ZZ1SfucPyy9b+ZE89RbF9eQ2qKxhxRYyFebotyqD3CDgtjUyp+YYddMXx
         m6d4KEMy0LmY9MGHBfNXWtZssbi2PWJ9HMsivc2TbTuimLQTkZMJWHxUn6oxVDnw91cj
         XqS/CkuRhg0YkkUkaLUw8jj0HhkR9vBgI1pPflpaZCL7kQ+9bvErKkUiunAhxoktGPB0
         PbOKuEH2mFCw/2Rg8GWwDbOG4+oJrWDcktEtDHq+/RSI3+creOCmOJ366nwAnV7ERwtv
         Dqk89Mt7VUHgKiMc+VidKmnKGiwuYVGSTZ7whyA1BpERzzFhv5CbSfLkQJibaS9NP5Sk
         mTeg==
X-Forwarded-Encrypted: i=1; AJvYcCUDKtjE7bZXw4/ypvO0jadj60LbZzfUL6AuuAXorh8WvoUijujACGvnTt4LPY/5Jr2C5H+HrmZZTo1H+kw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq6ZMPygGtnC27XQi6NFFmX5nVrkMTnm71BW/yFBKd0cbx6v0A
	TPLH7hfX18nvCT0h4Gv/LlMAM7QOFdh0ri5qNwtZ8K9TMvxlPbTv7w1yjE4+pC+e5NCQrrfTyVm
	oib9LuXweK+okpCyXJZpO8IrzmjGjGtZbyazpOm8OjBJMHBax778kLZH0jppwKNk=
X-Gm-Gg: ASbGncs8GvQxZDixrD0EUn3grQYv6TPLAwfgCmLg07eHB1Sl2bEvQTEAT0GZpOaEjdQ
	vnMPcsFxZxl1aerLXhK9Vtt1fPqPBx4jawAChZ91hYGJ9dN09nT2WK6wV8WonBp0lxM9P2co297
	vjIgARfLhUEhsX2udNvEFLQ+1xvgEAfDPEy1OCglcV6k+BnE42bN8LoAluux0zyNRzkLNN+hY/H
	UBh+O1y3SIHEiaMwktB0F/nfS6wHg3w6cSEs+zZW18enSk4CNruaEL4zL9ERTQDVjzhD278Uf0Z
	8P2+6gPbVqQ56/FUfJXgf4Omv8PtElf4YuT19uOJ7FNEq31Ij8voSo8Cg3r/UaqpABU=
X-Received: by 2002:a05:622a:550:b0:476:652f:4dbc with SMTP id d75a77b69052e-489e4d77485mr11338121cf.7.1746008316957;
        Wed, 30 Apr 2025 03:18:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO23cvXrGFB/iOngY/UOzNWgY0BSboZs1pXty1cvWHt/+wicp4JoHuzN5FLQhX8ailkyQqHA==
X-Received: by 2002:a05:622a:550:b0:476:652f:4dbc with SMTP id d75a77b69052e-489e4d77485mr11338021cf.7.1746008316689;
        Wed, 30 Apr 2025 03:18:36 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e595abfsm901834266b.86.2025.04.30.03.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 03:18:36 -0700 (PDT)
Message-ID: <d99deabd-878d-4600-93df-7b9c1cf75393@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 12:18:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs8300: add the pcie smmu node
To: Pratyush Brahma <quic_pbrahma@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250429-qcs8300-pcie-smmu-v2-1-445288af3ea7@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250429-qcs8300-pcie-smmu-v2-1-445288af3ea7@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ekrnRM-dZbn8sBhX3LTTdZlyVD7mdXMI
X-Proofpoint-ORIG-GUID: ekrnRM-dZbn8sBhX3LTTdZlyVD7mdXMI
X-Authority-Analysis: v=2.4 cv=UZZRSLSN c=1 sm=1 tr=0 ts=6811f8fd cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=PbmTXqVU7kiPfYgbbi8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA3MiBTYWx0ZWRfXx8fxxEczSEQE XkyLdsEA9gd9obU6y8cuiErlqGVvqQuPyG1DeNlMRtVY2zbZjp9bKf530XXmK86CMlvOUu/s4CO GaHpB7CwX5/wyeP4vovd6st/oTSpFSNM2IUtgQBxrhsBPkppUxZnaoIwU8222oVyjBOvX5IPXh2
 4B2lNO/JkcDkl3JCj+64r8O08qpBZO8lah46ha2GNKl4RHodUsxT8BRYjIL/5wN6DiNcURIjHZO rGCB2yjTbtUryTky8fUqGJIADl1ugzAzKW0O5UBlxZdp83InYOWoKVwEm0ru60CJx8jxCkRfnhE z0j94ZJs10GBIRAwET65y0x0+/HMzdNcW3md38GXEsshMn34+M05h7vHXjZBlDltqWUWIT1XxBw
 hwoIDW71T8/oCmHdG/Gs2/8wczwAR/1RyZ7xW9cJgIc9Qa7KrEjXbQu9j2oVzftlCTqKABPF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxlogscore=794 spamscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300072

On 4/29/25 12:09 PM, Pratyush Brahma wrote:
> Add the PCIe SMMU node to enable address translations
> for pcie.
> 
> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
> ---
> Changes in v2:
> - Updated the global-interrupts and interrupts based on Konrad's suggestions

There was another discussion on a similar ambiguous numbering issue
on the related sa8775p, and now I'm beyond confused. Please ask
someone internally to confirm these numbers.

Konrad
