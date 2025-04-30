Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA04C258CC0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 12:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746016791; cv=none; b=uufqntbbu5GVblUtti46MvLqzoLvg0D9Rob6KikdLm5QnRCyKeg4uwJ7X+Nk9WdVV42avIfcip6eXeCrRvCzWCkkyB/NzYKU3xdIyky+k9W/WJC2MMzP29zvhQ6to+q/sthlqiDZvMb1QVl6VqS3G3X+6d/Ok1Gw+NP7Ygu4kDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746016791; c=relaxed/simple;
	bh=EPNKpKk8JZWaARHFAYyvjGyRCL3qGuhrQzvghiPj5/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ia1s41a3ep6e8S2wuEg6L8bVkSgRk42DYlps5BXH4mA9VTzUYczVxi98viNa9xLyHzBXhkRawORZ35hUx1+da0ysRY+pIxjWyQOjavSF6Mn7K1hqbIdyfBfjnjFmKbe/S6zJsRTyYMnzcvMdtq2k9H0elFMm/cL46bgMYlu9DLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P0iMH8AR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P0iMH8AR"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9ME7Y018968
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 12:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LFs068+EJ0khJe1SOIZavrVMIyHZZWaL3/ptb8Omy90=; b=P0iMH8ARfBEGM2/N
	xQIsqOy1yqATbwMeMf8+4UsH6jqJOqYYmyiiO+qz/Fe7mpnv93aA6e+IgaRNuYtV
	9cAoOTlGL8eUqOpCGEfQ2dlf8+ObYzBSWfklyJZPLbSaCivSPnVIxKsoPsuvkqdC
	c83Py2UKCVzvnBAfoNLq1GKYFPB+FmlHMAw8S1hkP0KGXKjMMm8waqKZsrF6Mrqm
	ZpopmUFzazgswNPDrL7C+AQ22NIFNgROkwj/RH30AEypefJi8Kpd+Ng9bXhjXnbR
	x6e1iQJS61MKfcqkOgGHSGXTNR30d14JtT+PUPpEArMimXLsajQJLJLmIFPbhTAi
	DKO4mg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6uaa5au-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 12:39:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6ece59c3108so19106876d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 05:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746016787; x=1746621587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LFs068+EJ0khJe1SOIZavrVMIyHZZWaL3/ptb8Omy90=;
        b=xTfPaR4s6u59V+qmra7/3r8Hi/+keWOKA17xRX9+z7wd2eor3aLsVGPrhSYn33fUGj
         ShU/n7wPbR/f2bIZFrJbNWGELpFOK2hMHKQmlsq9RvbNyaI/zXlUrJ2TlYWpKCB0Pd7a
         BB58ICKFvWyN2C18oXckrfaw+2Xy4JDCOklEqkWgKeyh438i8oMNKulynB2iTlvp1oj6
         W1Q9ZdZUP6clxEb+jJ+TPlO7qwSxoxOhhTv1zCT302ZQZylregBzF+7i+KkvLRkGFBKu
         QoEdwZwiEBc2CaY4BS902YSb0m0WV27v6JysUgwOYMTfpr3nYvCbzwsLZQur98POnIoQ
         QJCw==
X-Forwarded-Encrypted: i=1; AJvYcCWCWFnlGt/ii4PelSHNiuIsHINg+uJWfQ6u0T/Fgw1lbWT46Lk6BtK+iO6cBnjGqqnnwRc/TQYoXfjuNCs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsWG5txhDWLjvIelZKReglvBj32r+bLkVA5FU2+q19M6/SJxau
	AWgpfoKcLh9RPtq2kU+iTW9mFx6f3i2nQZxtoxaDfpaAKUS5cL7fjluLVNPWGh6RL3eMCAFyjwo
	78J1k+vzskTboDXgv5cY2egeVsWc9xPCUNVKP/xRMCWkxl4P7DVhOrmJfnPDkk0Y=
X-Gm-Gg: ASbGnctYja112lUDCXUzoc+67SCoYYjfdos37vrMRgPpIriI/cizTSfTVe/ONi3AqPM
	dIejPIorCUEZ1j/dq9NJE2lYLITUEDsuGgOEb78esIuNrbkAgTSKqu57POcsWTKeW7SNhEr6Hya
	TlwyVjjwzbRD7/idCp/7PPtd0+HSy7dvNcYLvylc1MyIz6uoBMXp3J0ql3LoaNNBxXy5C98lgiI
	vtO9OPkkJdsAoWgrJo40a+OA6CgfjhTNCEcyV2ccz0N8m/xu3hITTlkm6bppVfWYYAfFBx784za
	cHzAimD+tRfXdwcyM4Z6NaNwujyH3bIjdzJwcwO9Kbp/8NXCzqwioPEOjn8ASNdi5so=
X-Received: by 2002:a05:620a:2544:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7cac87ed1c4mr109530085a.10.1746016786826;
        Wed, 30 Apr 2025 05:39:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzy9QmlF3UAfzA9JatwWwapnmKlyl6GIQvIPJ3qNu0J5MVk7h7Gpa4KEY9LvySiGhpANkstg==
X-Received: by 2002:a05:620a:2544:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7cac87ed1c4mr109528085a.10.1746016786250;
        Wed, 30 Apr 2025 05:39:46 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4f8814sm935494466b.69.2025.04.30.05.39.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 05:39:45 -0700 (PDT)
Message-ID: <5086f0d3-d097-4668-b195-5ee00e84aad5@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 14:39:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] arm64: dts: qcom: qcs8300: add video node
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250430-qcs8300_iris-v6-0-a2fa43688722@quicinc.com>
 <20250430-qcs8300_iris-v6-4-a2fa43688722@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250430-qcs8300_iris-v6-4-a2fa43688722@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BNizrEQG c=1 sm=1 tr=0 ts=68121a14 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=aRA5hjehiSxC-sjywyUA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA5MCBTYWx0ZWRfX0qdja/7McLK2 McuAFnaa40V4Yd5cZL3857kNDEslzGlub74IcpJs4HE+aYPXxHTknfI+Syra/UrK2h2R3c59twX rLXFutjzhdgSRrQvCTXbnfJuS5Lv7tXbYWDEHTgZsWQ6yQODY4rlRxx4lYrGhp6BqdBV63WSsBR
 9rDSFsV2bYfp4GN0wYh1NqVa0cqbzs5B5nUlKYhGP2A/ICHkqC25pD7EnXImA5NO0muLcXbsDR8 vpbzII0zklRpZFPR7LG3MGnPj+cCCRzJ2j06dxajefQ91AinSr8rp0SXOOwFcWxBf16obVkprxb 2VlaqlcFWMlqud2pVneDgHOhG/YvOl189cRiBhsSBw+SPCa1xCeo6pE55E7qm/hQ5m0cqMqZbzM
 0DcKKEWXRRQLBJxYCDH10tbggaQlDMkqJZh1+VqruwogFROqY2yx+W/eQIOlHLvgeIUsIS5Q
X-Proofpoint-GUID: AF1k-A-lxv1Iun7utsbbU3s04L7O2VsC
X-Proofpoint-ORIG-GUID: AF1k-A-lxv1Iun7utsbbU3s04L7O2VsC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=825 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300090

On 4/30/25 2:17 PM, Vikash Garodia wrote:
> Add the IRIS video-codec node on QCS8300 platform to support video
> functionality.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---

[...]

> +			iris_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-366000000 {
> +					opp-hz = /bits/ 64 <366000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-444000000 {
> +					opp-hz = /bits/ 64 <444000000>;
> +					required-opps = <&rpmhpd_opp_nom>,
> +							<&rpmhpd_opp_nom>;
> +				};
> +
> +				opp-533333334 {

533.00 for this one, 533+1/3 for CVP, it seems

Konrad
