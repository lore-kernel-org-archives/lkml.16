Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8663278E6D
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 17:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746726440; cv=none; b=VSXoBRmajWtjwrViSJlPgEf4At8Egw4jvgaRk4EYM/NemJG/qRBSIBBi9ebBHj5n4+Bt7V93FpvfUQkcXTCNb3J9eHXX4M9YtAjIniGjCmuFi0RGLxGRi/pHhHeZXS7Iu/kCGDKxH0J6BxD+9lPUZf2rirhacXK8T/LU8XMfWXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746726440; c=relaxed/simple;
	bh=CnTmOWW0avGJ6C/4/XZnLnyUkGJhjTDMBIMrJHJr3F4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tSFfFAZ0DKQJQG3M18xgQPPd/3ZoUVXjz1ZXy1tgF9VBMT8w3YGuvCxc7NXiSfyVZ8+tmo7B8xCUKDrIfDlrGx3AmLyW+sUEvCwgDBtGbXFOVWH4+i1mNnJZpRbxZkkANriKzlEcndiXMLjvR0azGBJehqwd7Gd4F/njt+Y0+ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mEL7x8tp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mEL7x8tp"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548Ck9VP025053
	for <linux-kernel@vger.kernel.org>; Thu, 8 May 2025 17:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8xaLf4GClFtgPLfJkjDTotRAbPu1o0/zG7o/KB9SvqY=; b=mEL7x8tpiT4BDFp5
	N9N68JESPqJMOYiqDg7gP8tWwBCprdxxpw4ot+Cx5FKLRweiB7p7OL+16REj4qEe
	Iv5EQebFGHM3PGpbPcjGOzC0RXbGGx5P6RJbTRKu6bMDRjL4KVf20T6Q9IzeXpod
	YEEK3J31wBhHXFyZvgMqqVHQYENlVyX/Ui3/l+GsZwVWBEfp40N2MxisviQoSO+G
	G932TR7gTGFkf/9iWTZAXGSGo9DA70hibQkY75wuQ08+F1DdPzSQJYRiutajAAbA
	I5GsqnIZaDzVqAM+GpZg2gGQgH8flWyXu4T5+U0avVvdcanb0xJThau7cmthufxo
	krV+gw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp12608-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 17:47:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-476786e50d9so3033281cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 10:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746726430; x=1747331230;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8xaLf4GClFtgPLfJkjDTotRAbPu1o0/zG7o/KB9SvqY=;
        b=pe259PbrMy4fifXXyAcEmjwJAOedVm0Q0yoVAUTSathYKcsxsretcTSTw6Fz5CxCtQ
         ANZUBainEIu5UEHBZiaqmgI9lIowWPaR6v6rj23MG0PXplkbp9Ki1Sds7xGW5jRxZ3OE
         8g1PsmUr4+gFAo90yTxM0M3hkuthaRFYkRXl1sW2wOftr44eU1jzP5pRvkEwRB+pAOJ+
         j9XgpYx5WUZFOTyHYIj6jQeM/9EjddL8efwgHHlyQGSLO2dXWr+4Fb0qwESq3gqLdPfv
         7r/gDUJZe5Y0Ke8sUAo1VoHDZvjizoT3ncu6kF4AWB8sbCeNnPwNeujUIBmbSZAUQ5Wq
         S4VA==
X-Forwarded-Encrypted: i=1; AJvYcCVHwUf+7SEW/mnOIal1IIN+iFogzr+Q4ufYvMWUn0edgziTUNP3vq0mKALX+VYp0HTp7TGMQmWtcrKPzng=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgNxYnfWXaRWhQtcQOmXAVJf123EBiGrCeCx+O96IWO5hWxar1
	QGT/QeOyqqjeyhI/JtMxv6wZygb+87mC48lRqxM6H192sUrp/0DAkOVun2F73AbdWxmSUZFzfk6
	97rKc/qOJmQqiBLUNB5GFgRUUgz3BPk8neYRNzdH3B8q8XRlaBrdBf8IVFmcz3jw=
X-Gm-Gg: ASbGnctUdGwMi4RG/Py2YcASDBgUZY6jz6vT0hJbrLAvykRO8Dp+8G0QtHdO7LOijkF
	EQxS/ixPByieU1xyq9rdBHlh78+EyDZhs82u9FlvgnxkX7Id3cxGccUQ3SJM+nSxEw1It77//x2
	FxjPmuyWF69EYSZlNjwPme5GB4vwcMOiKKS/o/LFGH7j35mmEUtz4cx5zwLyS/IckTEbzK6xzrg
	DFjZsI+vmORlidVIufdxFwnF0+UdZlTYIs/NCIAyAxSfNOvIciK+PZn/ZwixALK2r0GLxA82dGb
	qNXSRhErgc9yjzfh5tft0aBMoF7Ak6cg42zHZRWTRSXk+OGM4bY7Q1fEucxMaSmGkIs=
X-Received: by 2002:a05:622a:650:b0:48a:4c52:bd5e with SMTP id d75a77b69052e-4945275b3f9mr1708591cf.7.1746726430454;
        Thu, 08 May 2025 10:47:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvhGykg3X8x9Q0Y2p1gf5EMP1KF+odq0oA0O4J05qY7nf0M9TJMJFEshlbuvl4ZscKtgIAKQ==
X-Received: by 2002:a05:622a:650:b0:48a:4c52:bd5e with SMTP id d75a77b69052e-4945275b3f9mr1708421cf.7.1746726430099;
        Thu, 08 May 2025 10:47:10 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197bd219sm17804466b.141.2025.05.08.10.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 10:47:09 -0700 (PDT)
Message-ID: <703fc6bf-5816-4d11-96c3-487f9921f346@oss.qualcomm.com>
Date: Thu, 8 May 2025 19:47:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] arm64: dts: qcom: sc7280: Add WSA SoundWire and
 LPASS support
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
 <20250429092430.21477-3-quic_pkumpatl@quicinc.com>
 <7bd9fd43-7159-48a2-bf0a-712de9cb2bc0@oss.qualcomm.com>
 <4d922876-d78c-47f0-a467-a01d9754fb2d@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4d922876-d78c-47f0-a467-a01d9754fb2d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDE1NyBTYWx0ZWRfX+OyC/eQfMhBF
 TzdlUcWk/gNHn43nxbRgkYe5Emtx90bVpcrGiLoUfIbyIJ+qbITM1QXX3iHBIysW4LvFAeAE0Vu
 yvmhiLaSQFwfmqzNtvZPR12/3RBAwgr+O+h+jySYzC57c2dXOp/lqujv4ckLc9zdZShh2RXcL2K
 k0F4NKtEvHwJVFoZ2kbOuy72R3nDguJcKSK0kpaYSgib62Fm1ttg9of1ZUsa2lt2RMRJF0qIRxO
 oa2KNX+85+gKea88Gfdw68fZEsdvEQZh8vO6gTZyDljlI5qhcC+0iv3g78RCd1Yf4to1JVj+4JC
 zyf5w8Zz+bVwOu+XGRa4rHS3UWZuYg16LSTkQ93yk+vzxy4dJOKSfXPx/nQigm6STB8R058uJw9
 kTsWNNbjdMd7SjTgXip/VEKpjZgSzSBFpRJCwlO7cPc/KMb4FJS1IcT+eu4aoZXNTRo5B5IS
X-Proofpoint-GUID: O2mcEyZALJ6SKQcG9d9XiNSCx2JA3EHO
X-Proofpoint-ORIG-GUID: O2mcEyZALJ6SKQcG9d9XiNSCx2JA3EHO
X-Authority-Analysis: v=2.4 cv=W4o4VQWk c=1 sm=1 tr=0 ts=681cee1f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=geHZUW-4pJ_eHiBijMgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-08_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080157

On 5/8/25 6:31 PM, Prasad Kumpatla wrote:
> 
> 
> On 4/29/2025 4:21 PM, Konrad Dybcio wrote:
>> On 4/29/25 11:24 AM, Prasad Kumpatla wrote:
>>> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>>
>>> Add WSA LPASS macro Codec along with SoundWire controller.
>>>
>>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>>> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>>> ---

[...]

>>> +        swr2: soundwire@3250000 {
>>> +            compatible = "qcom,soundwire-v1.6.0";
>>> +            reg = <0x0 0x03250000 0x0 0x2000>;
>>> +
>>> +            interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
>>> +            clocks = <&lpass_wsa_macro>;
>>> +            clock-names = "iface";
>>> +
>>> +            resets = <&lpass_audiocc LPASS_AUDIO_SWR_WSA_CGCR>;
>>> +            reset-names = "swr_audio_cgcr";
>>> +
>>> +            qcom,din-ports = <2>;
>>
>> The computer tells me it should be 3
> For swr2 - soundwire version-V1.6.0 contains din-ports as 2 only. Please refer below link
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/arch/arm64/boot/dts/qcom/sc8280xp.dtsi#n2931

I'm referring to what I've seen in the internal data as parameters,
please doublecheck

Konrad
