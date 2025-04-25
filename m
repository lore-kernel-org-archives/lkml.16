Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE68113DDAA
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745575394; cv=none; b=tURdKQmm0combLNeHvUhhfRrgWfKZKrLcDX8T84AMqHRNEG+ESorWHOvq0BvT+hM3fe9QhefF43oGDvmfBeFP3/+fAbPM49xZk7l1XaoOnxYd786Zo3mkUIod5zQtm8il0t7jEw89pyngGihADHA1ibbo2t1tT8FgoK9ILKpMzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745575394; c=relaxed/simple;
	bh=hB+2f7cIMDCHKraGO8B6NafAbyaYw9oXEvgBcH3MmLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PnZAXWVhSmbigqEax5GubiLZrp3UiG63c4WDIIIXVGzdM9cik3BfyBn0MaQBXo/fWMSVhiwMHBRoZshLEFPwcGNMz6oi3CSOFbak91w2Gbvlsx4alH+Vv+20WfflxqKd+3Z9cNj4dH9uEoZuDxwBEGbseLZF4iNK1uN1mlFvAN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WHr6CR02; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WHr6CR02"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T6Ij022914
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I8QKagrcFhKv9KYvsAXHi4oyalQy8U3D+I/qLNKwZTE=; b=WHr6CR02/5TJ081u
	ikBTbROJtBYz3qiKeh/3BKqGKrhzLDKuyhWwSXhcxhVHbI+5tHttz4xAtFVYob2G
	5o7UyRySkqgLtEBC0v+Gjr5s/HwHfL1K3/6L96TMB7wzT/MIq5Eb3Xd7ZPPjeYMw
	NxgtMRx//TkB153VudTacJPaABRj4K6Tfbf61csNEKGkHzQ75h+VdFdQE4YIVky+
	lnArkawa2LTL9H6Y2IOwSdEk760Yv7HUW5IWsYWx1D+2IfUdsBjquXUdGNjvnF4p
	WV/Wq1mrBVl+6tZwYbUVelXjR9YhkwJETh2+6Ak9AJHtYfqg8pW9vWO8sPmCewOj
	LJBUUg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0gpa9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:03:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476695e930bso3007991cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 03:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745575391; x=1746180191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I8QKagrcFhKv9KYvsAXHi4oyalQy8U3D+I/qLNKwZTE=;
        b=NaoEZft6DCVECTS24LaSnUyqXzAIqm5ZuRvXN8kTjcwEXkxUU4+1ITpGoEfe+F0CSO
         sP5ivGJfc+b1rwKLE00O61Pmp07c1ifqXeQr+0LDpDp+LIvj79Byc3Pmz/+jZ+ZC10xz
         uocfgoRmbSnoD8ICB+vBsegIEhckuwxhnUQm/YIsRm6HtTEL4ppAZqc2U9TgC6Jo1LfW
         LmtyU2fqABS/HCaE0ctzjLXmh7+5zJz2OXFs1WqfxUOe0POkyG7c4QIhURKBQbZ7mpmC
         uxKsjDj12G5yxoh778YfAl9zR10mGdeJO+cVkgvMt5DQTGOgr1i1btn5VYn3HV/+z903
         Fpbw==
X-Forwarded-Encrypted: i=1; AJvYcCXLRwcTA0CWcXnhs9aNznV6EmZiHTRk6wbIOuYfwa5IsUCUjUy283Lv03wZ0Env2ranIaUhfXsGeZJ8Aow=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB0AMwM/QWjbjU20fL2VJzrGlSlySx4flk179xCJOHLheJz3s2
	Gg1IYQn8TqdejWgx079bNkU4MI8qO08A8Kjdb1qzreuVP5WU0XaCIwKx0MvR+L/krV3qUUAqqTf
	tbMEKysFxBjmM+X+lcH71t0ke1gOtgfzA8k8oyjJBckbYVzbA5fBuYPcWkmXHjSs=
X-Gm-Gg: ASbGnctoj2Li3+8GvARZmaumlTr4QLnNXKIIPPTnuaoDZuFK4+Wvgv+LfQ9dypqHWBy
	lynbX6XW5I8x7++xWzRyQ+X8OeNjcmqJmxg8yWEQkW3LkdqC+nFU/13ORCei6zFrV/qbWytBTkm
	0hxVRXnWbm2TxmQCs4qDvRHWriNg8XRto+DmcUEYSyVwFgyVakAFNv4pH5p0b9oQcpq2faCm5Pc
	G9+UoIHNnkhofNIxs6F/UHOfTHVTIu2U7IXFv9FVA1hZHIHxmmGDQRLHIXNpUyVjgp2OARfPFRq
	ZmVzq+rXtDTRAMnkY1TJLk9m71wzx9Ztq/6NNIrjFXv6OS6i+oSGVLBw+crr3K1F
X-Received: by 2002:a05:622a:14c:b0:475:1c59:1748 with SMTP id d75a77b69052e-4801e4ef65bmr9252701cf.11.1745575390714;
        Fri, 25 Apr 2025 03:03:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGym4C8wwZXnGdD0USz55aLh0SXbKBJJtzFo8Orhuhz+NevN4tmg5LbGw7KIIl83OOjojsuOQ==
X-Received: by 2002:a05:622a:14c:b0:475:1c59:1748 with SMTP id d75a77b69052e-4801e4ef65bmr9252401cf.11.1745575390337;
        Fri, 25 Apr 2025 03:03:10 -0700 (PDT)
Received: from [192.168.65.5] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e69efsm111315166b.46.2025.04.25.03.03.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 03:03:09 -0700 (PDT)
Message-ID: <e82eda3b-b27f-4584-ad23-562ca4b22847@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 12:03:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1e80100-qcp: Add qref supply
 for PCIe PHYs
To: Johan Hovold <johan@kernel.org>, Wenbin Yao <quic_wenbyao@quicinc.com>
Cc: catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com, quic_qianyu@quicinc.com
References: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
 <20250425092955.4099677-5-quic_wenbyao@quicinc.com>
 <aAtbFQIQMJO-BYe_@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aAtbFQIQMJO-BYe_@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kP_vJgHOcNoSWfq8M49HrewQE49V5dIf
X-Proofpoint-ORIG-GUID: kP_vJgHOcNoSWfq8M49HrewQE49V5dIf
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680b5de0 cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=YoAw9hKFp1W1AvAWU5AA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3MyBTYWx0ZWRfX3MEU3IeSxRNt rkiHxenxZBbUD5f9B8tSk9fVb0QLhJyf6OIRfr5sPb99E/bWmX3P+3yhSH02GqvQvaOXzp5uQIs FN3C/MftCkTp1RTODVuVfa84KJqcOg+D2wuoaXwbZhUFdd/O5D9mUitCMNNmskwbONoq8HIWMWR
 h3e2qK5Z0lqlh7By9L9GZKfCKVeCKq80zpliT+Vs/ZtxohivdN0uKP/lp6Jy3UClt9xVR0DI+Pc M14pp9fkafDqi7DA0WJFamNFbKPNeTT1z/AM+ZCjdiOLPAMdch/SqdX1jnEnJmEi+pAnALQsrDw XdeBDvyKc4pAb9FhBoL3YJvSS1BDdAPDx2XssfEB/OMzZYt0omGxH0cBgh2Hweip9W5ag89oaBN
 imkr6ABuVTgqdJy0fReEdUo2TMDUMMlGMq1XBgaCa3bAbEV9DK+sFGOyp0wuaI5r9Vyii/Yr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250073

On 4/25/25 11:51 AM, Johan Hovold wrote:
> On Fri, Apr 25, 2025 at 05:29:55PM +0800, Wenbin Yao wrote:
>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>
>> All PCIe PHYs on X1E80100 require vdda-qref power supplies, but this is
>> missing in the current PHY device tree node. The PCIe port can still
>> function because the regulator L3J, which vdda-qref consumes, is voted by
>> other components.
>>
>> Since the device tree should accurately describe the hardware, add the
>> vdda-qref power supply explicitly in all PCIe PHY device nodes.
> 
> AFAIU the PHYs do not use this qref supply directly so it does not
> belong in the PHY node (but possibly in the tcsr node that provides the
> refclk).
> 
> Since commit 031b46b4729b ("phy: qcom: qmp-pcie: drop bogus x1e80100
> qref supplies") it also won't have any effect for pcie4 and pcie6.

QREF is a separate hw block distributing the reference clocks across
certain on-SoC peripherals

If its power goes out, I don't think much of the platform would be
functional anyway, so it's redundant here..

It doesn't have its own single register region and it's frankly
one-shot-configured way before Linux starts up, so there should be
no need of describing it at all.

Konrad
