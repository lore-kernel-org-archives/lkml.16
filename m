Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC9021883E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607087; cv=none; b=HN583HogpKsQVUoMvxWiMcgN7H7pqtnCRJbTOgvTysfDx3gWvQr1NSpjaDJs3WXBcgFVpDEWIO1BlNs4hHE0SLMGEQBtjZmUaZWaNhQnf4TyF8aTpHwU9ePQSKMcZu7pdIIbBVElY/sGau2vhAMQ236NLkWhpDnAhvN/HnZT24Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607087; c=relaxed/simple;
	bh=O/aNKcRBRr9XPzfMd3kgEYnEuls3NYKPCxmPgvMgF1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RnNz0WAH1rtWl1IWlq+XJ3GC4vfCxOWpsg/HxPZiaP8HBbaltIJe459oNryygEOmEI5fpAG1GfgsmITmo4rDAcgYVnCDgAP2LoyCBxu6daqKCyEvqmKR3rgz+q3nL0TlWr9u6XWOyPsJUmH4m/OiCxFV1bgitdmdPuNP6kBDyy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kblvoohZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kblvoohZ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJrbg011039
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:51:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jbt8E/SpTOH9u/L3+Prpu4vZ
	2knpMVBoxf2CCgEByC0=; b=kblvoohZdJzoU+IYBH8rg7S2vgEWoxZAR0HyPbsO
	YoZqZiJevkFGXAPcsB7B5Z3MMmflPcaUz9p/KQ5obUA0/TKTe2e4X4iog3/+PCrY
	3Sovce8Bmd15TMdvaAHrz+N6Lnaa0D9upyVPk+W7E987JyKyPgYCDN8NyT4Ktvlt
	eTnkv0C1FgUpWbP9NAQRdSFDdxMeAz47p49UgCV5YpOwIHOdkghQVaGmMoooK3/o
	7RH5Zxyv7mwkZkN9mjGJiUgnGVid3TJjwbLiezJwVVC9GhgVWfbJYnh/pur8/LVk
	nDEchUHimMk11b9Yj6jYKiG53d+2Iq3Ehi1MX++wEDID1g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0j69w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:51:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476664bffbeso40975541cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:51:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745607084; x=1746211884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbt8E/SpTOH9u/L3+Prpu4vZ2knpMVBoxf2CCgEByC0=;
        b=qZTR0i7BROksimicMMIFrU8v3PQQt2amw2BRES+SXOyNyBPAv0HduwPgZ/h6T42mRT
         5AO1DBbpX9k2RIJmpfNnKQ2Ac//aAEIJa+2WDYNPdUT59C2/F+BBZYg/dcf9dqa7Fskv
         jNEs9gf0x9giNHyRE1qf862iU/49IEFQ0UatFduOS6xq1ZX7SQ2XQ650MzK5UH1L65ir
         e/WkOHAGOtQe2Zd1QKHVO3VZV4ELiBIqc9936tTJErhOAA2C+tW1PmonEFROwl7gycLT
         LOpT+lOw+m0DJPKf1/JRqoPXIetdOBh+3I2WC7/q8T/gWmY2eSk/5FX71F1s8Y+znzi9
         xmxA==
X-Forwarded-Encrypted: i=1; AJvYcCVgRg1B3XltmBQr0O54LHJTZ+3DEio6aLC+8J/FjHYZS71uhwB/LNaGFcM1na7gsRsK3/x4lTK/98Zy/SI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcJnvjST9ckeZ6HBZ3vZLuPkX8GRArEPiOkRqsdHfS7SjvDk1Z
	jcNOujm2mOxcIiF6G8onFdKB4P3iYYO8Vo7rNNMFYvGkbOk9PZtm+17Hn9+gVmfsL/zq56RC65P
	qrSPph/z/rPzoAx1BqxllVAwjrWH0lWEecPr2gCpnECXTGPDc4Vv3Rf7xHN3HtyA=
X-Gm-Gg: ASbGnct4/KeydYL3+6bU5tQdHY3qTmpnh3jZHvQ0ikeUefi/u+VeEO87eUmsRldbymu
	aioxQ4BZMyismv0me0z7L4gjxNfs2+9AAXXTD+96jEPj28vAsTHiMVNVVTJRecOkxbkTEWg8ga3
	Nr2jUqFbtlw0PslrWpdyF8HUNxd3jZV1PBEZTjFIr8Gk1f9e3ktM8XRyCGQIbZOmieeEU5uThCG
	EaFqUJvXgDcA6XvFgEINMLz1xOHyRVhLhSm6HtynsOGS+hNheKLSPYGWekQBu8fwCq2cKXsJSRc
	CnORecfhR6zgOD4Ho9Q4x7A91jQ29NqllVqnjYNvQO+2h3KE/9dSeOOmpjmBzNe22D/Kou48Iis
	=
X-Received: by 2002:a05:622a:18a4:b0:476:ae71:eabe with SMTP id d75a77b69052e-4801ebd2629mr64703281cf.50.1745607083702;
        Fri, 25 Apr 2025 11:51:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTNjkv1hYMJC5mDMwjON4XalMvkyCL+b202KJ9nUxbIt/FHV9dJQbgm6JqDooiTYZAgXjO8A==
X-Received: by 2002:a05:622a:18a4:b0:476:ae71:eabe with SMTP id d75a77b69052e-4801ebd2629mr64702951cf.50.1745607083362;
        Fri, 25 Apr 2025 11:51:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bf7dsm689196e87.100.2025.04.25.11.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 11:51:22 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:51:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/11] arm64: dts: qcom: sm8350: Use q6asm defines for reg
Message-ID: <xirxwzunynpy4geuhizaqldcsn6fzoct2bbghhwjoszcvwy3mf@ot2gp2i25xr3>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
 <20250425-q6asmdai-defines-v1-11-28308e2ce7d4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-q6asmdai-defines-v1-11-28308e2ce7d4@fairphone.com>
X-Proofpoint-GUID: sVnwOH4xGQ2wDjvZpjQcRFnGztzWzGXf
X-Proofpoint-ORIG-GUID: sVnwOH4xGQ2wDjvZpjQcRFnGztzWzGXf
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680bd9ad cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=0uHdMyS-I8ESt-gxu3MA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNCBTYWx0ZWRfX6AQsZx5FW4PU 0mAJ74oNp/Ef/hr9zvnJs696EVYtHhmmQo1HKv1VpNYGpI7SyY82BUA2x+7+XcjWJpfuCLs5P0c zTAleI8N6VVRiBhEkFqt2OnixqGQ97F1RL/ZEVpCvw/CAtpts0RRwdl+4MtpB+aqgUL5KexP6Er
 y7fB6SDweNDEziRGzrxUCcWWD9kGAELE9LnzMbJ1jE6Kahf1ah9dzyq9QBXAcI0y1id01IaaOTY ztygb9B5FZaoYUTBTb78tWjK7mKEhP6meERlQX7v5FzNxIAI4ueZZB1vphnCQv6ntux8R8FwGbk PD8Afs2o57XUrai4HopSFTOwh5luLn1RiFW6ZJ8aRHY36TWf6Il4T8BYX3HzguBAcXC+Ktrhbts
 EJZ2MvXX9HTX+ngTQ/eiIINyXtixPL+Q2ka4ikABEhMWZxuj0ZYqDCU4Uci7PgWRG50TXWT0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=624 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250134

On Fri, Apr 25, 2025 at 01:53:50PM +0200, Luca Weiss wrote:
> Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
> readable. No functional change intended.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
