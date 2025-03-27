Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE4D148857
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743087985; cv=none; b=dimFZJWOZDuXyCSiTk16sq8bBlSh+y+baGjsmEHWiW+AOLyrTXUoUM7U9VUOHgmqwoKtq3GPvqKK+SVpfh4nu4FeBK/FZ8lztoaO9hYBtCdo/2zuwvCqzPPAZNyN+E1JiZi0BJmsSmheLKd0x/ZBNTMkJ8wndAQsAonwDo0Wek8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743087985; c=relaxed/simple;
	bh=oL7hddb8pSaL/X5YLvbgpsuKPSqXlv5kikYSpG3nZB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AxC2H47lntgjDDBv8cs1Eyn729STNviKNAdDwr4BbltKOhny2kqWDeuU6XOMDQldPijajI6nooHrWtS9FW5zDP/qcMIVimGLgT5CixEez1Kjjonj4t4/GWQJXuJbAw11zbdmo87eZEPTlehwAmTUXfM6tIYuqg0591MifwL6Xyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PjBW2NkD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PjBW2NkD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52RF5Lpo002244
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:06:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RKFntSHCTGPKcQhIqy1arMAJ
	cgI7btxBYC/rwfIx7Vg=; b=PjBW2NkDyXAwzk32YYPee/g+NfnL3lhxpNyU00TQ
	zsa38pBFNK7Q2lTp27z/CQZbNWUi+syhvS1hC59mgfH2QMPc6WElPh7/Rtj9rCdP
	7EpV/AuwgrNFeRKFNabTzHuGxdUapLQBAsgF6/y3uZgiuuYnkI4DQO1aUScj3fi3
	HRYFsRITcz9u8V5ONlgka1Ypy9f0+U8rxBJb9B/hDPgV8j8t+N7xKE1cNUW1jVbM
	R94k4zrLbzlisAAmzCqh+A1y1NyXA9dxKNhg39hbO+vjQwVgmIiHvUzWeph93cuP
	8hYdebfv7gS/EYbV608WazLXNta71iB1c78G78VdgP3BHQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m0xdxkdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:06:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54767e507so183616685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:06:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743087982; x=1743692782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKFntSHCTGPKcQhIqy1arMAJcgI7btxBYC/rwfIx7Vg=;
        b=sKEgsumPfuQCVIrrEC8BN4pBNekKki7Idz0jrJwe+khvPYYelXGijXhuKbBo+59HP+
         9Q3MMnHLQr3//G9Bf7jgaMUg9kvWpOtfCFL1gKXRyrQWefKsHeH5pBucpZqAgoeMl6mI
         udejhcaAsGqsk3gpDsDaSODVsFvkgaGY9kW761l7y/EITPzlqg2swJrxh/D2GZHyljJQ
         99aYMbitaVU2/xrdnosVm94roF7itLTHhb0SbIEisKnzkoHY8dU/X1OVPB3wJ6wJoCk4
         rNK3gP3bJ6kMumuRc3pTVJMYY7l0XD9sRRg1jIC7RnP3sA6mjCxsrP+2OqbCSnzyrE7k
         qP2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXv0VpcuSNy9L1CrmUtFb47odyt38s23wDjY3MdoaCreUvo1oKDBycH8sIsTL/AWuOH/OoE2lW11piS+ec=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFug+n+3L0f/ueRl/HGa73cwgxISxqLo76BY4QQ6Ft0/oGcnw7
	oBKggFaSOP8xIljdlrARKMIdsyMfyw0yw+JsLCxP0rtHrXnbOX+uLzwiGiSmFKwAeLSDQO02+Gz
	uL21/6QRl6rCDyb1R+dAyjLLQCU0s4JkRlZeonjJJEhgGBzmRuhvQpRoYeH9BVt8=
X-Gm-Gg: ASbGncsx1zizrMmqf5qMNOsIU872VA4J3FEAsvGaMHUUsK2ImMnAZYzpUGoB83Cw7EG
	X+0XcBZKrjIf9znUTeNruE7pm97rVnHJzQ4aF34/ROeiR27xnuVO7un3m2vgkFiyn7xTXNANhJq
	n2NltblQiEA+hEkAP02QIIAXNkx0SGn52VKCsjnE0Gu9shMscV9aPmPqxI9L1ly46ZiQC6S7x2i
	kQY5KWoGPyYADJNSdZ9HFQzlUWZgxaPFu5kjwMgDTQP5A6V0ok/sW8C0EdzTaAfi41kOPC74ifx
	b9RfkHqjxcsmvNdPiWpOE3QPzR3fhbGcY9EkJlPk0CnSBKm893XA1U3iDSqF6bUG36EoKeZZBfP
	33eI=
X-Received: by 2002:a05:620a:2492:b0:7c5:ad3c:8478 with SMTP id af79cd13be357-7c5ed9f4f9cmr517569885a.16.1743087981677;
        Thu, 27 Mar 2025 08:06:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhuNSAPU6HEIo9bahrZTEHK4yVoTqrYVjH2/T9oNoAmTxgLhnWKjqSSISPHOseE28eYCJQuw==
X-Received: by 2002:a05:620a:2492:b0:7c5:ad3c:8478 with SMTP id af79cd13be357-7c5ed9f4f9cmr517565685a.16.1743087981179;
        Thu, 27 Mar 2025 08:06:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad64fbe00sm2106702e87.146.2025.03.27.08.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 08:06:20 -0700 (PDT)
Date: Thu, 27 Mar 2025 17:06:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 10/18] clk: qcom: camcc-sm8550: Move PLL & clk
 configuration to really probe
Message-ID: <ycplfyrtunsp6k2cuszsynljihk5obhzl3bau6lt7geouabuwh@ssbbduiaz5nm>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-10-895fafd62627@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327-videocc-pll-multi-pd-voting-v3-10-895fafd62627@quicinc.com>
X-Proofpoint-ORIG-GUID: 4xRUa4kscsG5vAuvqTSI1pZQaG43pUCz
X-Proofpoint-GUID: 4xRUa4kscsG5vAuvqTSI1pZQaG43pUCz
X-Authority-Analysis: v=2.4 cv=Q43S452a c=1 sm=1 tr=0 ts=67e5696e cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=OU1JASuMovj745rkUKUA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270103

On Thu, Mar 27, 2025 at 03:22:30PM +0530, Jagadeesh Kona wrote:
> Camera PLLs on SM8550 require both MMCX and MXC rails to be kept ON to
> configure the PLLs properly. Hence move runtime power management, PLL
> configuration and enabling critical clocks to qcom_cc_really_probe() which
> ensures all required power domains are in enabled state before configuring
> the PLLs or enabling the clocks.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  drivers/clk/qcom/camcc-sm8550.c | 81 ++++++++++++++++++++---------------------
>  1 file changed, 40 insertions(+), 41 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
