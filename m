Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C021B3725
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 10:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748947922; cv=none; b=opMnWaTWmkAvzjexAyobzq3kPHuE1WcSa0LXXcsJfchZntPSrQb7RVkM0lK+lgRX4WLrfqMFiadokivCrOfZDtNih45XGIyzZVZGsVSOtawFVX6WRwGuslMLx3R8nyWn9ya2Z5gvkabJgkh3jsjaKKzX3v/MDqagBxbvUnCWf9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748947922; c=relaxed/simple;
	bh=xksPMyRBHmUawJmvrqG72dG1bQL/nqL7/zl7hnCq6mE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O09oUh0YYzgBdkFjuHBDwVIRMbYB9iajy7CZL8cAK0ub7KBOFee4N7I3clKH4d7wG4XcEU8A1nM9t7Y24qiwlI8OHA/paZwhCXu7dXA9sQqnnDqC3uBbxlJlmaW2wR70jsQl8ApJ3UiFq/AYh2v/xBzTaSzBms5Rd8wdnFJ1hug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WaB5EMNC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WaB5EMNC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5539JJHh000560
	for <linux-kernel@vger.kernel.org>; Tue, 3 Jun 2025 10:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gG6LcmYQ46WfznvSwyEBH55u
	Vk21hBJH1RbGwGrUNAc=; b=WaB5EMNC6oRdUMCoP7WZm2YeOQ/AFgfgY5GTWEiU
	1HEBNjw2exJ7dmFwO3Jna7RhzSVVK39cWNeSw5RT09LTIapclaN+Lz/dKfWdJPMR
	HG4ODwFfCb42HbLbx9T0n2BuyveEq5PXhNAkO3pip5m0a96tfEouC8oaZt/+MnbE
	ZWo872rV2Pnw7IDciBzN81TDR2Pd4MRAIjSafSz524LaOF8KyZZ8IsEQBHmjPFWV
	wDMSt5ZS5DJfhtcNOcRF5GkVpLgsoUc31UQq5tP4gWODTV1bmkJMINsvs4dBXSyv
	WIJaUvFVjnabVsTbvPR030PIh3mQm4H/mazl9ItsAlt3yw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8taam5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 10:52:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d09f7052bcso783482885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 03:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748947919; x=1749552719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gG6LcmYQ46WfznvSwyEBH55uVk21hBJH1RbGwGrUNAc=;
        b=fYHEpTB/+3PalcSp+wAaH4Ix9sapArZCjkmD39XFt7VI0DHjt7SI6nrHMtOeL37EzR
         LBMDXC8lLHuISuniuPBFweiqEvJtv8lAz3kT7seo+k+gWnPd2lRlD0g0D3aVPnDpWfky
         8hI7Rm7VCBPpTAfeAFgwLFlBzAd5CDjBzfLdlGh+h4kUjmhnsgNeyjN1tJWCm3vt9x6w
         yEokarKneDrGK1zWwGoP7sQAqknP4ZZIQm5bZP3NbqQ9DmKnT8iuvcFpqFPTO84j10zy
         qxr8N2qWExwg5UkTGiJMxKtN1oySHmLtkobo0tNBfhU6sDC9iol0Vn7TZcPm0/ujRlX7
         ozAw==
X-Forwarded-Encrypted: i=1; AJvYcCXHI+G1/fsUTaMxHlnpEgezOYrVKAkMjc69QkRQCiYebpi/aeQ/ygampv1g7ILGsJesScc/eZZ9dEAWaOg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMfa+Yb251rozmjkNXJkoM+8nwIExt/ZWPAw66CiWQx+21r3sI
	1+WrBdPF8TdFyVUeoFb0+vS5Hz8J67S9/4tqqRX9tvVZ208ez0kBsOHW6lZ+FN2eRYP8ssUyY5Q
	A8ilrhKdQ0ltbMWZJnWkD4dbWkmNNv1UzeTnzfz61Uhu2B+gjAMtehfPYpATQ596ywPw=
X-Gm-Gg: ASbGncu3cOhvRxHl0S5gB2k73P/4hADGJuDu9NDUluY9GMDrdNc1H6Ax+mWEAp2LpbC
	XQCfQhd/M/8S00/i6XejaI04FEJI80LLBaHzq/dHzNX4PpstDD7PWxOLf7qMikb6BZ+PfbzE0Dd
	sfHnFn0cNm/npslgu3vKu23TsWG63jUE79InIrE20jNc4sm8MQ6yTS2oK01R+AyKbtDG+fUzztu
	Z3kN+TFiSoJBe1OqDzgRLisiUQGDe2QbG5fc44DyueUplUdZ4KTe1vk4GVFE8jxSLR2LDIz02tx
	CMF4xuoP/43O+5S3UhcoeQDwzF/iA9Jhz37OHlnnJvuREvrgmYl1YWQQS0Q6yW3CEOWL/FVkw+s
	=
X-Received: by 2002:a05:620a:190c:b0:7c7:9a85:d395 with SMTP id af79cd13be357-7d0a201cae3mr2458425185a.44.1748947919254;
        Tue, 03 Jun 2025 03:51:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2GiN9U2uANhBh2sl7jgw3VrcRzOZN+8sBe5jX67so9Kh/4ZlV1XnhUls63lXZyPIojeacfg==
X-Received: by 2002:a05:620a:190c:b0:7c7:9a85:d395 with SMTP id af79cd13be357-7d0a201cae3mr2458422285a.44.1748947918924;
        Tue, 03 Jun 2025 03:51:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85b35cb6sm17578341fa.43.2025.06.03.03.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 03:51:57 -0700 (PDT)
Date: Tue, 3 Jun 2025 13:51:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        david.collins@oss.qualcomm.com, srinivas.kandagatla@linaro.org,
        stefan.schmidt@linaro.org, quic_tsoni@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/5] thermal: qcom-spmi-temp-alarm: add support for
 LITE PMIC peripherals
Message-ID: <wsvdkte56d2avhhnte2r4udxpdaluz2jegwajhlik72ajk3nw3@l7daoy2lqvd2>
References: <20250528235026.4171109-1-anjelique.melendez@oss.qualcomm.com>
 <20250528235026.4171109-6-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528235026.4171109-6-anjelique.melendez@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA5NSBTYWx0ZWRfX7nazeMfWbcTR
 rL1YHJdvk+G0617EiUaxmKRdkgLSpnBMRm2xqnBng61QS9khBbnhrRJnR5PAtXiJkQrR0V/Phtr
 18H28LYs5TxPWNVTeyuxVON3nGAZqh2mZwfV4cBvPON5vRf0ZqekTsr++9rmCZh6FNWeuLPxAwy
 tWwMSRr6/n79XcqlLBiobOusWGKH754njEevhwC+PuG5W+U/einZUSEzqyfyb6wtsNkZsQxC3XA
 SmUBHTdUxDPdpYrA7te2WYltSCWXOILsPfg9uF655dg5lpMKRQAGGhlfUWdRH/lwsN/1/1nyUx+
 OZ5By14qai75LBURb8G5czfN7jflSXrNrpuoZiXQ+s9NNLQbOb8ecOVes3yw2rtHF2Xuv0L851H
 0QuMU/f+RlijQ7OxWTi3ENVsN7g2JsFmUFrobvtGZiQp0T0pT1TONJ9zowUkd4FwAZaOengg
X-Proofpoint-ORIG-GUID: Uz4vcdxzYHhP-3mErJGs9o2UMGI6nzft
X-Authority-Analysis: v=2.4 cv=OuxPyz/t c=1 sm=1 tr=0 ts=683ed3d0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=C_YEPuUXS4kB9x-TF1IA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Uz4vcdxzYHhP-3mErJGs9o2UMGI6nzft
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506030095

On Wed, May 28, 2025 at 04:50:26PM -0700, Anjelique Melendez wrote:
> Add support for TEMP_ALARM LITE PMIC peripherals. This subtype
> utilizes a pair of registers to configure a warning interrupt
> threshold temperature and an automatic hardware shutdown
> threshold temperature.
> 
> Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 208 +++++++++++++++++++-
>  1 file changed, 207 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
