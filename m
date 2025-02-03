Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697AD20550D
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738590222; cv=none; b=ArzYI7jYHqyBMcGtvwhNrbc3uXSYI/dIUQcqRjgMaATfuwH0iWLkNZGjLvTvT5JDV2uknei/Yb2TgHBkpkXVuv7uS2J5v4ploU/tBfByg/6dBzdf3+ZI7czOCznEo1CP/gNjwsgWHIRQaoiJDm4qGjQYq2iir2DeOJkyugFU/qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738590222; c=relaxed/simple;
	bh=8i3q6T18h+V0jXJztN3xrYKixRjlzGe0Iti+1JurmOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QqxjwWA+ddjv/3YxzaMYkvPao228gHXriPWveYrVlfe+LnjtRBOJzFeLb4i/rbaLRct9ZuHEDYKAysGO7IUHHB7Boe3M4VzBcyt3EohYJWKp8DFfYTKulZfh6YeFVI1VTeUnNBBg5sJ2JWFxreoTyaKjeeP1BiPN/SpC9p3Ki70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BICG5pGZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BICG5pGZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513BEmZd002591
	for <linux-kernel@vger.kernel.org>; Mon, 3 Feb 2025 13:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V2l6eXMWFs+Hsqn7k3FNi/+Jn6QrNV3T7693vimG88s=; b=BICG5pGZiAaiDdL+
	DO8Ph0gwRoPZuwdDXmsym0fMPFErRQdcbspC7lXhed9B3GzARMOKnKgOZ/eBGBTr
	HZy2MRfMZ4BQeQRV6Q5RHBpCJJMgIO9ip1uSiHENesOCD582jWyLYsXFVqY5a23G
	BaBiX+CdanlL0AY2yXlxbvlvwiKu3VOOKkg/EvNiUwU9hS1gOOJlvsBRTREtCjLN
	qoSgVWjHpoCLyMNvy2bHBCl0e90J773MfAXiGKwsNuASzPsRTeFs7GXdN5OsLBfd
	mbSuzA3PJY9k/qk3/k67L9lULz0laVzMvfMzJGq06WAc9iuU+Nmgnpr+uNmKyip+
	S46cBg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jvrkgg6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 13:43:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7be6f20f0a4so23903185a.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 05:43:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738590218; x=1739195018;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V2l6eXMWFs+Hsqn7k3FNi/+Jn6QrNV3T7693vimG88s=;
        b=NUFjU9Xb2jh1IJyP/l10pPa6O6Uw4Qy7xvZiZ6/EeXo5s98QrF/S21WN/pYuGf+iia
         VTVzaltk9ZNVGPri94HVjzOjkixbDcJ1g7DsrAskcF4dVc2WwNq550kdFb9BdCuzlRBd
         +PsFh1JginZKwIADkvUjS1tveLZ1YtGkhsvLzXzDoetxZtusOBrNAGLOh8WJ4xSzNtrG
         71xeXXlj52kgkDMk7jlQB/M7eANMATdAojBlQ1YyHRqrAg+N5/Iko+k2CgbRMDw4pzMD
         JSt2R3R7BZT+sWvXdgl694a8x/mgfD4BkkGJCzN78VWITIu6oNLj3gs81PIQRY7YaXPw
         Pwwg==
X-Forwarded-Encrypted: i=1; AJvYcCUG5Qvb7822yJJ628zVzZ+oSBkDZS2ytROrf6p/NLbd4ySHstCqKgOZO1Y2sjCbc3q38/OTO7qbbKOAvXI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcEktS6/0jkwjIzbu/hhwC0FmACtvG7/JKoFrWrKVnxP56ZyV5
	h9irdnlwgIakecOroi2vSkYU5DOdgss8udUvn8DPSat/8geY27gEQNfgSaYVF8wnT+jWcxMNZcT
	DR3giDg0lb/a+NwO8niCMs/C/fhp4DbSwEetWcskbDOzBK7rpNqakqqH1Yw6q3xHwVbONrIA=
X-Gm-Gg: ASbGncv2YqKE96vg0ZskSTbP2TJ9oN3xT6nfZHaQ83ZQzqU+nfMseV3HAbBSbK7QoQ6
	zlxSlfLjkLdamIi+d7EjGcDdY77tzkcChWf85jLS+YpKpCGM7bhHEMuoay4bHxkjXtbf1g2+x9t
	XbrKrQRGQGDargdcTglvz/tr1H1Pab9ct5G9Ypy+9KgwCvqnV8NXx5U6KkpaDizaRwqpSPQPU16
	+HcGIGwi36PA1QGrC4MVqUGUEboN7Eoe+tLSDifEOR1agaZweFKiNRYzGMrhCypiisWh916FLvS
	APT2uQ3HF4kWoNqZKCZ/tj+oa1XrTmcSK4wLM/gdFOVrXoVjK3SOirY/dq8=
X-Received: by 2002:a05:620a:f06:b0:7b6:c6f8:1d28 with SMTP id af79cd13be357-7c00982326cmr938632285a.0.1738590218066;
        Mon, 03 Feb 2025 05:43:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGET6XktZXKiPlCUHTPdv/fi548A0ODFJnb0FsGPdB69ZYd6e7Ne1QAh6OTPInD+Wckda+Bog==
X-Received: by 2002:a05:620a:f06:b0:7b6:c6f8:1d28 with SMTP id af79cd13be357-7c00982326cmr938630685a.0.1738590217652;
        Mon, 03 Feb 2025 05:43:37 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724c9da7sm7741943a12.79.2025.02.03.05.43.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 05:43:37 -0800 (PST)
Message-ID: <e66dd1b2-3257-448d-9c41-9be643652962@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 14:43:35 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: qcs8300: add display dt nodes
 for MDSS, DPU, DisplayPort and eDP PHY
To: Yongxing Mou <quic_yongmou@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250114-dts_qcs8300-v3-0-d114cc5e4af9@quicinc.com>
 <20250114-dts_qcs8300-v3-1-d114cc5e4af9@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250114-dts_qcs8300-v3-1-d114cc5e4af9@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gr3FiB2ttao9xZYd78LiiPZn1SZgPZ3A
X-Proofpoint-GUID: gr3FiB2ttao9xZYd78LiiPZn1SZgPZ3A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015 mlxscore=0
 adultscore=0 impostorscore=0 suspectscore=0 mlxlogscore=872
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502030101

On 14.01.2025 7:59 AM, Yongxing Mou wrote:
> Add devicetree changes to enable MDSS display-subsystem,
> display-controller(DPU), DisplayPort controller and eDP PHY for
> Qualcomm QCS8300 platform.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
