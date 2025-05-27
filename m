Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF8226F449
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748353056; cv=none; b=KqddcX0E5S7mGMxbk3FLuRlf/Vpas/xM+WV3kzAE54TsOgpDjI5eB+kYLdFfnbBV/KhWZgRGlw9F9xdGjK5rw5hGClqa0ij864lvKQmtapEe96qrtZPpTC1KBPLmWPPZSmnmiXFu9eT6LI/HN3/CNhb79889MupOqsUbLHaGqHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748353056; c=relaxed/simple;
	bh=KhRlIO71gEXyEYjy1ByXE+VmuW6Go3ztEoZDkTXkyxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qzEWc0XVKSNosmpWOoXBX3dHxy/0M0rcT39+2xhejT3ha5meeUft2NUyCsGg9w6xuE/zyljkUc07/hxArrbkYabhEfyG+YiSG8dUdwolMH8IUIjf+kdtxybD/+CZuoDAW0XGCuoZ1UkkdZObvdSRONsOfcc8rH/hR5Fmg+YEqtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hzab7NX/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hzab7NX/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R9cDD4011088
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:37:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xLEufRgtL9qKIG4lX4CSfuKvPSGQ804jDCPgn0wAin4=; b=Hzab7NX/6BOzvYdV
	yhL7RHU3rpqw3lHO/14gTSrivQQeBRJ/vWOBd6sKeuAGCJ6p4j9fn0XNJDYz7F4j
	9SUbprGcye8/6Re9rpChZ0FdwPctvFAnbtGVcqekBAe85YyIVo0lUi3mzOqCXB4X
	pWf7SevqlglQoHZtYiH4reDWnqFg0gP67c5w6VZjRoaCWLlv1r05sSNVF93980vF
	tS8K25WlJQ6mL1Bmvic6BgJY9SatdEmPr4RY2k+RULKlpQN3dldq2Zz6l8fbQkq/
	0q5+gGUaSUgoGa/Zow+uDKH3LnRCL96MPgITd5PnsGHeWNLMFQpu3qlNcF/VatIp
	TDD0FA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6b5q4vv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:37:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5ad42d6bcso122262785a.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 06:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748353052; x=1748957852;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xLEufRgtL9qKIG4lX4CSfuKvPSGQ804jDCPgn0wAin4=;
        b=nYX8J67f4Id3dhJb/2KbzMpOTCs2RsYU4QGT3F04+AoCwC6RaYfsi8JcHPgV05eCXy
         hw0ElxKiMFMBt8UVqh2HFdr6BHzCGH0Z0H2xW/cZqLtU29NPjnT2XaOXJmPgX0gDd0kF
         PXfqfbYh2hDfxO+jTzik+TEYNPjYUMjahJv87Cd5OFi/MyIMyAMSs7HBnwwGILXRWUyO
         8OhFv9BPpn+D6CyVSXGXH2u71gP0kWzTE1UPBUEmYTYRM1i7XE3Ffg0M/+mvvgmSfo5Q
         FTIT8yDGJRwySvhavSp1SIv/auSswZNtZ5r0Hu2+wM9wU07mUlXxbvwjn/Si88NUBOZT
         OmVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVecG65R/rNEy4N8/KwrFCSTj4VZAqOBP3gcPZGAz+eMgaEKQEobSzPYmSNFkNbQVVoW+Q30iUEDx32tNA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3QY9J8bjYnrSKXWbYK6LTB0Od917SocxV9XfIOvFeBUsFAtOq
	3UEtl8S21Chj9Ps1K5qOtHjOebTHzT0EEao34ETHO0tn1NthRkecrqxH27dE/S95N8d75W2byPD
	v1k2yhIaJEP1cLSUkVexl8nS6B/DaL2FG3ClREu+ji64JhjiHYW17GhhCWp82COmEShE=
X-Gm-Gg: ASbGncuIB+gRY7wpyiHC3kudDonydExY/BO/QS7jFDyzDrpV4WW0LnYt1sO73QmDQB6
	2noume0aQByXGK1dKOZ35fzIOAIHg2Rtk/jYvxxSv2JfkijE/5hM714fx/1YZfbaBX8yerMeS5L
	Zdwtxd2dEJIVVWbFkQ5XDiJN9ittP2P9RKEZ9wDS5djGNGXgrxv7/1SVKksZGEqFDIDgR7qlXtD
	KiQkoHB5aASEiqPo9yQu6jTfeaxBjRiDBrkTtIJ5inEPrJKQDt78PMpaF6hCTJSfmoIbJfw0Ql4
	NRhxk3IckthVq7XYjwn0tv2EaZXSmzNVjUJY5ArpcOw1sTA93Avu2EqWXBHluERc5A==
X-Received: by 2002:a05:620a:1a85:b0:7c5:ac06:af8 with SMTP id af79cd13be357-7ceecb968afmr708580785a.9.1748353052444;
        Tue, 27 May 2025 06:37:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6syR9I/XBh/MSLFb7D6Zw6VTBNOOLOjBK/d+fsxGEpEZQnhC1Aw9iZuvqUpC6mxmNYxr87w==
X-Received: by 2002:a05:620a:1a85:b0:7c5:ac06:af8 with SMTP id af79cd13be357-7ceecb968afmr708578585a.9.1748353051873;
        Tue, 27 May 2025 06:37:31 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad88bcd476csm126238066b.162.2025.05.27.06.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 06:37:31 -0700 (PDT)
Message-ID: <e1222269-6660-47f4-85e1-3782adb685ef@oss.qualcomm.com>
Date: Tue, 27 May 2025 15:37:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] arm64: dts: qcom: qcs615: enable pcie
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>, lpieralisi@kernel.org,
        kwilczynski@kernel.org, manivannan.sadhasivam@linaro.org,
        robh@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org,
        neil.armstrong@linaro.org, abel.vesa@linaro.org, kw@linux.com,
        conor+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_qianyu@quicinc.com,
        quic_krichai@quicinc.com, quic_vbadigan@quicinc.com
References: <20250527072036.3599076-1-quic_ziyuzhan@quicinc.com>
 <20250527072036.3599076-4-quic_ziyuzhan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250527072036.3599076-4-quic_ziyuzhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZcodNtVA c=1 sm=1 tr=0 ts=6835c01d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=u-Wjf5nI4b4gXCDVDnUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDExMCBTYWx0ZWRfXxCPxKmwGkX84
 WwTygTL5b7xOlejqBRkp44GHcBYSWBg40G4t93+ks2zd2zK3HgxYHfVLI1vEmbn6fD/BWIKfzbw
 Q/JXTLuGbo38HKA2GY3fEfeacuCrK6DSfFvcEpG/7tSv9X4Tkg1mRbdu+8yGJU+xfgbBZ97VOy8
 k8x9CoxXziJHKRF7Gymk6iR5TzY6iCdq3+WULDn7qOpQxNUj8ELJanGYkFcgtWM3AkEaJYWcLHW
 zle0fXEZ1CihaDJgFweRARUbl+y9St2N2v/TjibIHj9RuJtRuJMr1amqPBwIt5ey0XUlSMfnQiX
 u2Khoz+iyHS1kcml1GzEjZW4qhFeFkeV8LRHRBQ2F3Ur+n9WI6uRDx3ZB393giiiJ/TWAYlg8xB
 xquwyKWh0bxWVa6cOzTywDR3kYHRwYPOHfaoqmF0eSykJTo+mEOGluyCDcrSdY5VkQGXuM6l
X-Proofpoint-GUID: 9neawDk-GarsoMhTnQ4VCU1Mx3Vo7x4C
X-Proofpoint-ORIG-GUID: 9neawDk-GarsoMhTnQ4VCU1Mx3Vo7x4C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 mlxlogscore=602 bulkscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270110

On 5/27/25 9:20 AM, Ziyue Zhang wrote:
> From: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> 
> Add configurations in devicetree for PCIe0, including registers, clocks,
> interrupts and phy setting sequence.
> 
> Add PCIe lane equalization preset properties for 8 GT/s.
> 
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
