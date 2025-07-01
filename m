Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7852026C3A3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 12:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751371777; cv=none; b=GKoNKgpw7cvfHMvUUT/NoUma6ZGpHdvyDio4NRoSG7JLG9m7Uy0mUhkemnH96KY7E3F2xcaNDD2EgUhJiWJG9BT/oisU7z6jcRjXCBEljGnsn5eJ/qUsR7zXG4FysJPZX1Gs1gGcAOBpJX8pTvbBr9eMtA2/WEMbhz6/dmwQvMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751371777; c=relaxed/simple;
	bh=WDRgfXWXGfe0UH9qUXWp4TgglhR2HVl6KIlxsZFWhTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pll4aS70/oL7iektV8DHcCkR8SlrTCP2KSK7hn+YY9/yaTWkVhLzkS37Y87v/cmyTTmofZxcXBk+03qUSEMOAkyNxbWCArE9vdcgtRytoYlVOfwdQpkwIdvOkvb6lXtIK0vNGtucN+qxyoopGvgs+MP0iTTTvMDeNxfqDPEeG9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZbUbHnCS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZbUbHnCS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619xivk002603
	for <linux-kernel@vger.kernel.org>; Tue, 1 Jul 2025 12:09:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lf8Jmyio+SLdCvkpCacq2i+KFuRD1jwhGH5OllRLLL8=; b=ZbUbHnCSdKJCie0w
	1MOcIYiXdG7Z2EFwtFGjxvH4/X3fhF3KgvqjZO96vEiG1r065QMVrFFuVfcyzzoJ
	GZvU3Q6WGb76ODHDziuBorpqg/rlvdHMZHyYzsXjKKCiGRswNK6hvuAsCcxC7tNO
	tKAIaRwo2hz8jekaTv6UaFdAG6WMGiroOhDdJfYhlFtPjSPqK8maCjs4MgH+OgEd
	z0gS8k6rGEi6xcKNjfd0fe5bYGnH82soTeo/AHWnOK/JoIocjfNm9KkogJZeg9Gt
	eVwesQZed3zZac6fAGZ/9TAsCZ5FYStunXL0qos+fZcFB/2+oC+xFBJtdqBrdjUY
	nyiRXw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcrpe5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 12:09:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a5aeebad31so9151691cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 05:09:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751371772; x=1751976572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lf8Jmyio+SLdCvkpCacq2i+KFuRD1jwhGH5OllRLLL8=;
        b=gdiWXPXP0YaqQKrN0JEaOXzrspfnjP9JqEGm41ByNLTSnb4lF60u0vQwnGRj0O4WwD
         iYoxyJCtp2rhAn8uenEnhOb8hUzp76sNut8Sv86A5G1ulI9VE3uI/wFyFG9Rz/qSGSU1
         PA4PXUazDRC+uQuUikdUfvCHQx7clzRmrI/I62r818XJ5UXebmNJa6uQKfqAmriUhFtM
         510n02YnZj7J81ZVhQBDb4OTYi5EOQmMj5lJS26rCAtPOqsFE6IFJM8fgiPq5M67QaA8
         IS8zwAQB5aR9Nk73CXCO1jI0Adivhwmfy9ZJcda0iWA9rPhLTBM1YncaAGLvxl1Zw5uF
         jMqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUERoPR5iZjZzfsW3RnPzcZxqba/n8H9STfvxN86TlzVnI6lR2OirNmXV1xpiMKlC2aofKH3MP/BnbKj9w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys9Gwg8Ob3oY9CpMNFMT5IQxQk7XtfzSxWBj55NBlws6Hq9O2V
	tgZeW9HAhJAbRFemjOeAfhyfV7rCr15TnP142nCJ9LQip/ULS9kpIZR07fAA3SUt8vibPbX84YQ
	BW22lxhaEmimeRLy1p6E5v5s/vZiglYsyy7Ehdza5RsAaxPi2gGjsSedOAFzADvROsP1nuyzzj2
	o=
X-Gm-Gg: ASbGncuYuFY8ZyqswcK3g6OJx29G+dXJjjmkn0As7HmjGRiwVuk3vqPrnr4Oms0+oHC
	DBwCRHOKhCzSNwJmMSoWhBtBjn9uCbTHaVPnPhAex4eWt4YBQCAiKGWetcKvg1Q2fJc0LVvUTLg
	jVjWJjYaBE5gp2VebHmugTYsQx83Apj/L2oaLsEdSeESmxYE76TdTx3XmwmUhsLc3QHYFkIMUVK
	U8WzmZly3ntYloE+9BtPWAMglt7nGjqB6PxMZv6lI3X4Z8OF/biWyjCWgBGTcAtPNOA8gKijZmP
	x7yktgmSYdhiKy61sGri4D+4OqIBZ2b4j+QWCb9Z4VpxBj4BBSdR5bBkbA5dqfSjCYnYcQpsW4l
	A/YS5xXGc
X-Received: by 2002:a05:622a:5cd:b0:474:e213:7482 with SMTP id d75a77b69052e-4a832d99b26mr13892171cf.11.1751371771275;
        Tue, 01 Jul 2025 05:09:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQVXZRZhEnxAxzvyWJKIWKbRY1rodAvUMKMkXoSRbY/JskzbHVFmzlfJJjTVfgKYRM4buiQg==
X-Received: by 2002:a05:622a:5cd:b0:474:e213:7482 with SMTP id d75a77b69052e-4a832d99b26mr13892041cf.11.1751371770787;
        Tue, 01 Jul 2025 05:09:30 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b24fsm857473866b.34.2025.07.01.05.09.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 05:09:30 -0700 (PDT)
Message-ID: <9db5d1d4-1965-4334-9540-fbb66498d7d5@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 14:09:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] mmc: sdhci-msm: Ensure SD card power isn't ON when
 card removed
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sarthak Garg <quic_sartgarg@quicinc.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
References: <20250701100659.3310386-1-quic_sartgarg@quicinc.com>
 <c7lpaij5f5monr7zfeqitncwnau22iollid2gs7okyorlegtmg@jlq65x7ipp25>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c7lpaij5f5monr7zfeqitncwnau22iollid2gs7okyorlegtmg@jlq65x7ipp25>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5J7VoDdeOQjeqx_SqVdomwWjzXvvmXr4
X-Proofpoint-ORIG-GUID: 5J7VoDdeOQjeqx_SqVdomwWjzXvvmXr4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA3NSBTYWx0ZWRfX+drRkWS8JwhU
 S6WwEhSJp9gzwwHrgJgS8KtAyAqOjwA1WzdjxF+a4Tdfr9F5Toc/MuRffPCYC1/eEKSYc0HP575
 LB2of4xiwAsby/LJ49d0vV1e1YBC/jI3W5m5IhYIloKiPTrqra6vJWYkt5VUq1yJ1P3UOV+AD2e
 +uExIcMmv1CjQaJPs5JRNvHNra9Arnv2Fmn8EMy2IM7vMx2kPMgNGZF9USO1pDiOu/SjA5tWaAb
 pJQ4ozL4FrqVEr6Qox7ZY8t4HJfUkjIwrXfKYNsG704anEJtdCcDd82FptT0yS64Jxx3FmtOdMw
 S/aUyJYpqNwVvDGDeNVK6WwEb//6wjk0PlXKb6pHGV11uk+Lu8P7/Ugp1NgkmfqFjCl6P8LuzY2
 TCQ3wcZ9lmaOLm8CUIBBJu8iE3Rgr5pLxIc91QfQjuHsBFOGGP5bw0b7/huqV6wvFwcKky2z
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=6863cffd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=QyXUC8HyAAAA:8
 a=NKAVfNCoMK6aC5uGs1EA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=630 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010075



On 01-Jul-25 12:27, Dmitry Baryshkov wrote:
> On Tue, Jul 01, 2025 at 03:36:59PM +0530, Sarthak Garg wrote:
>> Many mobile phones feature multi-card tray designs, where the same
>> tray is used for both SD and SIM cards. If the SD card is placed
>> at the outermost location in the tray, the SIM card may come in
>> contact with SD card power-supply while removing the tray, possibly
>> resulting in SIM damage.
>>
>> To prevent that, make sure the SD card is really inserted by reading
>> the Card Detect pin state. If it's not, turn off the power in
>> sdhci_msm_check_power_status() and also set the BUS_FAIL power state
>> on the controller as part of pwr_irq handling for BUS_ON request.
>>
>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> 
> Should this be handled by the MMC core instead?

If possible, yes, but if it only works because our hw-specific
sdhci_msm_check_power_status() behaves a certain way, it's good
to go as is. I have no clue if that's the case.

Konrad
