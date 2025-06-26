Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C083520D4E3
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 11:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750936218; cv=none; b=hnIzR4u/fb75zuFOixjGOL+4nHv/STDxI8s5QlzpiF7i5hw4ICv78pTWcen7196l76L3kJLQyI+xtYShoNXWf8NXv6V+6zapgVZ46EeCsLjZzDvWgwP1iWZJ18N65L2uvze16ok0+SgS1GkzDkZx6ETGHFp5WRRZxJaUgsAHFQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750936218; c=relaxed/simple;
	bh=0Bp+qonHH5jylyHIXz9C6sgn6mP+n+r83KDRf7t/N5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nRcNjdRii/D8OQEXzitdGAnT6QpZHd7IRjXrtbrmR/WxU6tTorsJ4gRCoznePdBvN/7KJM6OvZ4iB1RsRYAe77lnb7DIgPB/PB1K95h4Bq1URGmo9klSYl7if4LcD/0KO+FPz+ToovScFgFvHFBeTBNWaYNsuYJyc92eI0lA7pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RO2pg7Mp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RO2pg7Mp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9Unda026632
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 11:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UE8txzOn/QAzC7EGqvtVxraZ
	th8YujXtysaU5pU06LE=; b=RO2pg7Mp20tMtr9g+z/d9ptLvnH/ztTZHViy7ixU
	shvntBNRiYLuvSW64h+jHPBbNRHbAe7ynwVIyUbAiCZr46/oj+rA0BQSaj6mRMdp
	mm93GYKHgi5MGjd1M3FxNyX74jZ4nGKhYyUPzdTUozFuTB5HI7xVuScDoUKJs6UT
	yiCFcuj8UsB/dq+JDd5CjE+Wm3Qz0A7nhuQ+WtA3QVFyPwX3WQR1T2Y9/BdmgBCX
	nsWwF3DgBNHa75SQ4t5LdsWF/Fmg+s9O0NZfkJh7BP9p/tqNCFBdsvSYSBEIGlzg
	sIUJHhkvMuRZ10QhD+r3wFJB5OxMnVZ7JFb+FwTctrtOaA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5v7eq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 11:10:15 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-40b23f07cefso337830b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 04:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750936198; x=1751540998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UE8txzOn/QAzC7EGqvtVxraZth8YujXtysaU5pU06LE=;
        b=iJmIVr57B0eOLF7UDkmaTjIeWELk3VZZVpvGuuuR6QE46F4w5aal8dyrnm47yV4crE
         guEvAixbinXf3ywEAnb23RiK6z7n3r/anwgG2kTwACd1fOhOZ609fKsE00/aO/rpOWmc
         aNERVYqBU9LaJ3wH9vDzI3VZro4iGk/0g/wg1cflCvuEMOBTJSs3/ZZgHsM+OiUn5mDw
         uD/aj9JEdVRRo4PJ7qVWmo9fEnIO5nCc95s3rEPbQwZtW23PcmDDH2/noelmLolzftFx
         kamnKysmlD3AnSRf0a3EavX2BxUmXOIN+67A3YqP48K2Tfz+zha389gpYlASltSd6zy8
         K2KQ==
X-Forwarded-Encrypted: i=1; AJvYcCX62cOeb5dvP5LW1fKyl3jjFw4hukYO5/O9mNw9UAuFq9q2AEkYCpzrXLcc5uH9JyFcaHUGmimRNFJ741I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvDVeV6THZxA8x8cnQkaZNll3AfOlRk9p8dLx/H5LNdZAbtA18
	zTdl0b7o9PMBHhb2ICtrqeBgzmZED1eaPrIyaGDeW7klPhBMFKFKiQIUJ+D485GDy4umyDT5qwP
	I9yuLG4j/32javwYptlM9FdN1w2j5eRZjUXNxu1ZIZh8Qbs8pPFi4vTAf/qlEki1ecWk=
X-Gm-Gg: ASbGncvDeIyb+2Y5ddtTznoTE5hKjUqhoLCWSiiKFfyelu5yTix4Z/cbyYMU3aJ/tMB
	kwqBWw0auk+kfZww/kgL3UOPnV1PFfzkGMyh/8OPH9LhaHAG2WK09ug2qC6Z9sljDrnMOIi1B8K
	2b9FtnloNf9ptdTcC+/lWr8YyuqJKi3i9xfiRd7ZMgcWn/JINPgCz4G7xr8E08Czruf6kpcHQkM
	DAYvD+/qj/BBcWGxFZhxUL3EZ/kUpXYqzoiwfwpnBCLRRI7QFYaBpvHJhHidLOzIUURsDvY8pFL
	AzptOONCBo6zC6MmahFZy91nhFyK0udX2JHOLoQFSpM0ykJDl3HbiFYpAk+Er/RiaztMXfR4O8x
	rUYl9HvliWQ1GgqWIrb/UyQxYhbouaYCT6U0=
X-Received: by 2002:a05:620a:4708:b0:7d3:a611:b72f with SMTP id af79cd13be357-7d42968282fmr882465685a.2.1750935754125;
        Thu, 26 Jun 2025 04:02:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCNqTQMhKRAgDVgIkPVE6+Lum8rJ6kECVPTi0eyeggPAIZDp/ebpXhKUViiZfcfoDb+hbfMg==
X-Received: by 2002:a05:620a:4708:b0:7d3:a611:b72f with SMTP id af79cd13be357-7d42968282fmr882457885a.2.1750935753495;
        Thu, 26 Jun 2025 04:02:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41442eesm2524970e87.14.2025.06.26.04.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 04:02:32 -0700 (PDT)
Date: Thu, 26 Jun 2025 14:02:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
Subject: Re: [PATCH 1/1] arm64: dts: qcom: qcs615: add missing dt property in
 QUP SEs
Message-ID: <x3cmdir4lotf3yekbu3tsmts6idsvwygrp35opszmgabhpvdda@nlwrs5qojcml>
References: <20250626102826.3422984-1-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626102826.3422984-1-viken.dadhaniya@oss.qualcomm.com>
X-Proofpoint-GUID: Hw4lB2rK9ntqFONiMaKVGySFN6R0-TNL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA5NCBTYWx0ZWRfX3qoCmFfRCNPQ
 6C6W0joY1oWqgijOjE1CPViaGa5bIqUhMG3quqQmPfLzCk0FAPzmqBZ8m5I8tKFlnC8LTSYok21
 hDu6kv2e+QHI2tI/hzyPnnnjO57PvdpEyK4wCteleFFQ5uwBOv41YpWiu5l/aQ22+xbsduDrl77
 KSV7vDewutpJXah3XDW6P9PgbGwPX8B4yWoGKg8tsg/b7xQKK3JtDAX/l6t6QQjB9oFSLl7qQSl
 +AreN9Gsj7U8dXLYxWdEVo/JTQGaN6iAlCJtj4R4pNjQC5kWpTGAMZtjzime59gix1qR8lgtq+o
 mqWofOCQCHrsUbgF5LSljqRr+4wEg49fUBbEu/uh960zZgFuJAe19QFTp2KPmEUDk2OauKIZmb5
 KVU5CzCdW8pIc3eyiRoqv/q/k/MVXa4ka//JA+2ChW3tNZlN9HKR8hWgqlOWgKJ/Jv62GMeX
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685d2a97 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=5yXfonLdrd0yReSgdogA:9 a=CjuIK1q_8ugA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-ORIG-GUID: Hw4lB2rK9ntqFONiMaKVGySFN6R0-TNL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_05,2025-06-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=731 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260094

On Thu, Jun 26, 2025 at 03:58:26PM +0530, Viken Dadhaniya wrote:
> Add the missing required-opps and operating-points-v2 properties to
> several I2C, SPI, and UART nodes in the QUP SEs.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
Missing Fixes tag(s)

-- 
With best wishes
Dmitry
