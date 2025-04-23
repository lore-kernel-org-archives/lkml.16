Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CB726FA41
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745407543; cv=none; b=UCqZQjRNTPWYObE1fRZ61a5Mfotz+3yvpeuhoqz/ChAinRi0buTlixUZDFswhOq6xo8SmkbuHHT9NUjKKQvC3oFfWr0n7mPYf0/rAGqNp3kdSqvnMTGeuylqRpoGvnonTAot4E5cxW+DkRBqyqGxCgoZ4QdHkHk2TdIKVatkE4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745407543; c=relaxed/simple;
	bh=wKXWbzh2ht/X2vUMhpUIeXx1GFXHSCn0jvg1bKsrJvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mwh9IkDp4+ciaJv9r4EqGt1T3Jr782ZxFeQE7Vc0Kr6AGVEvbsekn4475ud78cmVcp6UxSDBqfRduUQWdYnIUWjDaNlMd2XgWc3wIKMw+tu5jtVK4X3Eh9ZhyfW6YLNMIItVOGTR6TwCwsx79yaC9dfdMrvfIdCk6/Hw+HaH6dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LIqiqGsF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LIqiqGsF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NApNj4016813
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+SJfWTk5aO0uHSIAPpOEUP1TaRsZh3xbLp7te7De5FI=; b=LIqiqGsFYbXbWF+X
	ZWDgw+eB8a3gdcqzTD0qr2Qtf2nRxBuKzDi+/SUTMaxy8q0TZQXLWOhsrUySx+fF
	3hc+qpuJys66S3Yv3wlo9lAKd4Mu4RfyIHYQHdcTNdGw03fP/ICzoLtkfJDtA9DQ
	aPQkEAeIfXbPuxHkyZbql9Ya0ByPh303SFsjlaDBB7vi51qpKPKMglA053f2/Aq0
	TDL3wUTs2P//7aRaR9gOsyPZ997GPPx+mEhZR5qRNt1RawovzsiYBihkaPSlYxMm
	kWgtWsRjqI/Q/3C7Y7QcTwX4R/+nOivD5sQ7oG5FfiahI+d+wYKQc/xqWr52QYQb
	9v/aKQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh09xvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:25:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c552802e9fso119928685a.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 04:25:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745407539; x=1746012339;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+SJfWTk5aO0uHSIAPpOEUP1TaRsZh3xbLp7te7De5FI=;
        b=jU6MX9OKdtm8BxHzRr5s1IHgmxiWglK4QUqUsgkLHwETnlCP753FIBQz8VoLkGdShy
         93KoEnSlnNfr/+7breeODQqR9hu6+qZEgnyMSMN4uoHm6hzz+adgbGKTT7jDsT9gh57y
         FEdULOz3Vy2G30pmMfi8wyieekJXyNM44sqOFm547ACsRa3/yTuX9U83f2MvDKkMPCne
         zpizjQuDxwOCQ/x+nF6pX5Z7Ohq7U+kfNdVKJkOyiHQRWx0yRmWqt7VMD1zOggwodUsy
         WeYgPfy1Xeu4yAoEeFrvQ9Iq1G7RWU1Mv+KJ5LSiMEfI724ZTMglt5E9UrxtYuV0I9sj
         Lhrw==
X-Gm-Message-State: AOJu0YwPmROOBehqfsYjYDVmkGF0eD6lxb/i3SfCIDT+3t3C6386KpKF
	0pu2p6x9OnCzYUlHs5oODyu/M+4JLJMKcKzWTnQv5b4Fn6jPRCHt9OpyhVKvkMKdICKoSNuW6Mb
	rqzaCwHCH9cm9LeGCmI/myNLAElA8PbGbKSczMAXKouf6jecMrmLoCSIDCh6blrw=
X-Gm-Gg: ASbGncst5ixxWYnXkTPBmHJWLYtNAufX8dAyyuIbNnGnXnkR169MC5ENRdaASYM7Vav
	+lHubhAaNNcv8UWH7UdtcpE8u+esDj+6gbq5sml8Fo+fQL3XZVRj8+A9qqwL6vxeFnk7kvwyqam
	DondQEAN5VM4QZltmReb5GqyXB3ca27rt+jFvMwDsfOBRoWWxjhQdgrGkPwPpvJNrc18wCqOYPj
	BYsKKfuV/Ok5vJmhcz/zT1OsMaBDJIBFb+hPjYtwsfzLHi18AYpBH0lb3rs8Oog6wpOVaJrgJW0
	87twlNdLv5nCQavUMTs/W9pdRk82v9//US6NWSq8w5+M9c2/Yh3jGvQszBHXoZHRjS0=
X-Received: by 2002:a05:620a:19a7:b0:7c7:ae26:9bb3 with SMTP id af79cd13be357-7c94d25a6b0mr185332285a.5.1745407539438;
        Wed, 23 Apr 2025 04:25:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAKueAMYdW8vImOAi5a60M+gwJ663bWKU2mlGWA17qqnLufSL3bclAp8Ot3R4t4SQ07ODnkw==
X-Received: by 2002:a05:620a:19a7:b0:7c7:ae26:9bb3 with SMTP id af79cd13be357-7c94d25a6b0mr185330285a.5.1745407538941;
        Wed, 23 Apr 2025 04:25:38 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec0b6fbsm806483166b.19.2025.04.23.04.25.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 04:25:38 -0700 (PDT)
Message-ID: <a9a5680f-de4c-49ac-8ae6-d2e0452d8258@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 13:25:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] phy: qcom: qmp-pcie: Update PHY settings for SA8775P
To: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_nayiluri@quicinc.com, quic_ramkri@quicinc.com,
        quic_nitegupt@quicinc.com
References: <20250423-update_phy-v1-0-30eb51703bb8@oss.qualcomm.com>
 <20250423-update_phy-v1-1-30eb51703bb8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250423-update_phy-v1-1-30eb51703bb8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: k-4JVoJL8jIPYMjrpG95-Ugz9EGlGZzI
X-Proofpoint-ORIG-GUID: k-4JVoJL8jIPYMjrpG95-Ugz9EGlGZzI
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=6808ce34 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=4ZBdfkmogR933_44ZQYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA3OSBTYWx0ZWRfX1u/TCse/Pv/m EWIhy7prXXjF11huZLaS0QTi1qePiZoC3neKsBQhjOv/0QZE1WOGBGcSUga0tOeWmgA11FJG3tz P3Fx/WDEu7WeuWO5KY38a5nyKpOKuQXYKKK1QmBrqCgm/BVST8/wbUBXLWU32Trk2BpicqtWRMe
 bXRccvwqrH9gc09u2yRq7pT1r3iSw035iO2V2/U80rbKnbsnz/RzLBF/fvB0wXdG5Hi52eQS4fF laqOGcGCU6HJdO4QN107n5tA81zmk1i5dij2rK4Y2Gb8CeZSuFD4Db0wMcNRlTbtkzHHWgBDeh6 2Hm/Ba9+hDl2fLYS1PlnikIAPcD93xssRT3Ys0eqwavigZfoLumkNn6WHwCg+D0hai8PzS83e9s
 cYI+her0kDilMwswRAi3MVEdlUyNISK7Vm/g+JzYexwRbTuoP1GK6Dbw9/ZKwNUGMhhRKXOJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_07,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230079

On 4/23/25 1:15 PM, Mrinmay Sarkar wrote:
> This change updates the PHY settings to align with the latest
> PCIe PHY Hardware Programming Guide for both PCIe controllers
> on the SA8775P platform.
> 
> Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
> ---

Please also mention that these updates happen to solve the stability
issues seen with Gen4 speeds

[...]

>  static const struct qmp_pcie_offsets qmp_pcie_offsets_v5_30 = {
> @@ -3398,8 +3402,8 @@ static const struct qmp_phy_cfg qcs8300_qmp_gen4x2_pciephy_cfg = {
>  		.tx_num		= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_tx_tbl),
>  		.rx		= qcs8300_qmp_gen4x2_pcie_rx_alt_tbl,
>  		.rx_num		= ARRAY_SIZE(qcs8300_qmp_gen4x2_pcie_rx_alt_tbl),
> -		.pcs		= sa8775p_qmp_gen4x2_pcie_pcs_alt_tbl,
> -		.pcs_num		= ARRAY_SIZE(sa8775p_qmp_gen4x2_pcie_pcs_alt_tbl),
> +		.pcs		= sa8775p_qmp_gen4_pcie_pcs_alt_tbl,
> +		.pcs_num	= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_pcs_alt_tbl),
>  		.pcs_misc		= sa8775p_qmp_gen4_pcie_pcs_misc_tbl,
>  		.pcs_misc_num	= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_pcs_misc_tbl),
>  	},

So QCS8300 and SA8775 are closely related - since you're making updates
for both, please also mention this in the commit message and describe
the impact it has (e.g. that it fixes electrical settings for both platforms
that largely re-use an IP block)

Konrad
