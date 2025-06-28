Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B9E253941
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 14:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751122258; cv=none; b=aTXDTn4K3e7v7O74Zg0XCRrdUKlLxCrRpi582Jg7DNtXTx5R09DaWXugqI1fzvqJOwlvIDWWhaMu6uvD1o8UJAZLynDmDu2pLstqvmtGrw7weMK1hKhcDvZl89lZz18JTwhpRmK2gN9HNefhkWIcGfjIVhgj56QRwsLpQt+90VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751122258; c=relaxed/simple;
	bh=Xos9O20zb2Et6svoO+8sqQIklPD/u4XqcxNOP5O6gGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Du6LrxG0rFfpC5nZYPKV+eTIA2tyoh/QRwQT9c2i/xKMhvhnBkW/Qh3bSghOaTahQdf1D7lw9c2buFtaGDVzWuacUajuim1BpoUa9tNMX4Am9+NOS/9iyjFSpH6uVQG/fNs0irlSN20OsD8kzpZRvdyZfIKlbteNqMnGc3sN6X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lJLHSA01; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lJLHSA01"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55SDcI30012344
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 14:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4ZHuVoDQqcSiKZpcYlkHvG4d
	z+Aqe3P5LxxO2P06acI=; b=lJLHSA01cAR49QjeCee0z0kJL1m3UPZmQMsyveL6
	Nkgo/Mkmn8HAd3g2BZQazP/q4moY8TkltYKwgLRhGiSI/VdsxfPkfkSFGqyQqSy0
	57No2BbyVDFuqQCI4N7dIdJaGzd/BJql/2I4Dj3OqqPEMkbjOdKCNzmNNwrl7vlJ
	Ufjv5pTYV2Y1HrvNBdblobEkuWazQ0tXSUnQVuhjYIRZ/oztQrdI0zPOC+r6QOac
	WjpEgnFXOxArY+fbxyNqe8PKMxy0RoCfOJqdiBjlJYPKywGyDEI68b5Lm1FlUjed
	+T3PPQx1sG+A1nLCH2uYdCWy3Eae7I6lZrIBCCBG9ihvIw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8m60s0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 14:50:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d38c5c3130so133660785a.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 07:50:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751122254; x=1751727054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZHuVoDQqcSiKZpcYlkHvG4dz+Aqe3P5LxxO2P06acI=;
        b=DJEDFEId0Qnj80z75arr1IFz4JYj739SstnR8kbwpFMhc50VzIbN4Kv1MGTE/r25E6
         L49byKvG6K3plGG/ktctWIXOew17slcklInTo0aMGOejNAVaKImN33uFAUbuFPA966JY
         IZY+eQvgwAZnw3gPbKNrcRFScqzHsRKeJPF5Gm0sQQ4BBZ2xSfYJGk0O/T6M9ttQDCjB
         wAlqVJpCA9/QPvAjtU2k9kjsaw0of/CA0fIZtxigLsXjOBKpjJ9ViMhAIHuFhFPPgnyq
         Qot0Vg0lCtA64EcFZ4eNqL4H9+/KTmyXHQoPoHrqJ63ACkhhBFnXz6s26S9DhBNYBAUl
         TuQw==
X-Forwarded-Encrypted: i=1; AJvYcCXChqtOtXRbFRChsZOF9pquAEH1/eP8JaCia7LTS1r0WNEM9ZU5XfRYUsRu1/95JWIDCwO/LmpLep36jjk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyydhWWDKr32Zwqytc0Q2Gb797kCJdJTIw07ziEJPDZax42Ku+g
	UjbslfuW6jQlagqR40Zaowp5DEL/fHMfC8hbcTZb9tPyChSsmsaKGQs/OZJwz1mVLCoccfNIdxV
	XPHEBE7D7nNWsUlX0/fAq7NgyWoDk4CagMZtAzQDM9f/wOHkCn8Q0Ftp/TSEIOwfKo8Y=
X-Gm-Gg: ASbGncvdhVuDYB0/55ijw9PygyOsNQFFq3mws6GyKLiPVPhqTmX+fOXPfKQCGg0Q8tD
	Hb3CwyfS3ageucxIn1qqZu0ov+dy3L0v6/CL1pMLml8U+2qCVIb8g87SLwRiy266Mpkh6z+Vi6k
	59n83JcDfuCWU80mrybpUpf+F/gR2Sc5jjslnYxihzLxieY/oB6DEqFjJ4vzfJSNJxfGJPES9Bx
	PuaOXNxDRS6rrDimTD3PsmzXpO7EbsZG/UGHWEYtH3B/TQCZ6KzZAl/U+jYImOS09o6kMYhYatL
	hs6qWJlvJowrQKm4knxeR2eo3tMVe5w1B5MgMkMDCVcOCony1e8EPD5a0UdIdtfrE53NCPutVNb
	Q9+Bhw9i8XKgRT0GpOgvkHlo+Hd7viSo2FtY=
X-Received: by 2002:a05:620a:1a10:b0:7d4:4c7b:9701 with SMTP id af79cd13be357-7d44c7b971amr476431685a.35.1751122253867;
        Sat, 28 Jun 2025 07:50:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVzNKJ3G+C5nuBNakv+tEHELya1wSjC0Lp4djr17ccnTEiCjJcAEFkK1IFL24QOiOW61XH2w==
X-Received: by 2002:a05:620a:1a10:b0:7d4:4c7b:9701 with SMTP id af79cd13be357-7d44c7b971amr476426085a.35.1751122253252;
        Sat, 28 Jun 2025 07:50:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2b93adsm828837e87.98.2025.06.28.07.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 07:50:52 -0700 (PDT)
Date: Sat, 28 Jun 2025 17:50:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Steev Klimaszewski <steev@kali.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-efi@vger.kernel.org
Subject: Re: [PATCH v4 5/8] firmware; qcom: scm: enable QSEECOM on SC8280XP
 CRD
Message-ID: <hf66fa3pvm5jrw3qv57xoofmkoz74ds4g3nwzsdz7pip6e7nej@w3h7qn7qu457>
References: <20250625-more-qseecom-v4-0-aacca9306cee@oss.qualcomm.com>
 <20250625-more-qseecom-v4-5-aacca9306cee@oss.qualcomm.com>
 <e5e3e8f1-4328-4929-825a-3d8e836cf072@oss.qualcomm.com>
 <95c46d39-5b4a-46dd-aa73-1b3b9bf81019@oss.qualcomm.com>
 <aF6NUeNLPrR5vqEf@hovoldconsulting.com>
 <f55a057d-2cdd-411e-97b9-5ede1300a4e9@oss.qualcomm.com>
 <aF6Tkh75LRym8MQY@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF6Tkh75LRym8MQY@hovoldconsulting.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDEyNCBTYWx0ZWRfX7k2fYRg1mK83
 kYicw9IaF8My6/t+nGiRayYAJnf0TOk9bXL8bMTiIERV5QvxLqFXGOkemGjxW5Z7RZkKhG6gKcM
 LVEOv6177agrWN5XTkgeaMigQn7erLRkuwcEnZQond+oeleNBJmjweDZRLG9jg97PBYu2dELoQS
 HDMG/hqaCYtY13u8r9gWWlbvv7lmG3PNXlciRo1lw/Q3VhPhyuI0X4VIQvm9ZLnzvUxlZf5LjP0
 bSADEC0v0g4fCkgB3M/fVqSB1JiP4Nb0g4thaW1hb4hgbZnXI6RwIP9paq8EjuoBCeGD40+6jeR
 2+iyKbFcK3Co3GHEYLEKp5sque7hzWBT9t3zve0f86vXr8AS4TCQbo+d7k3oiAjBi10w505WOAx
 0ldu7r18+ZJCQP2xx6GJB3blpwvgn8u6CzlGyRVV3fUp/4EhtHSt2Efl/dFVW5R5XnEGPETw
X-Authority-Analysis: v=2.4 cv=Fq0F/3rq c=1 sm=1 tr=0 ts=6860014f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=38JWWdoTCtlzABMLL24A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: rR_pg0D--E4S8_DIgpL7XJXSr8MX8xPA
X-Proofpoint-ORIG-GUID: rR_pg0D--E4S8_DIgpL7XJXSr8MX8xPA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 suspectscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280124

On Fri, Jun 27, 2025 at 02:50:26PM +0200, Johan Hovold wrote:
> On Fri, Jun 27, 2025 at 02:26:41PM +0200, Konrad Dybcio wrote:
> > On 6/27/25 2:23 PM, Johan Hovold wrote:
> > > On Fri, Jun 27, 2025 at 01:54:37AM +0200, Konrad Dybcio wrote:
> > >> On 6/27/25 1:34 AM, Konrad Dybcio wrote:
> > >>> On 6/25/25 12:53 AM, Dmitry Baryshkov wrote:
> 
> > >>>> As reported by Johan, this platform also doesn't currently support
> > >>>> updating of the UEFI variables. In preparation to reworking match list
> > >>>> for QSEECOM mark this platform as supporting QSEECOM with R/O UEFI
> > >>>> variables.
> 
> > >>>> +	{ .compatible = "qcom,sc8280xp-crd", .data = &qcom_qseecom_ro_uefi, },
> > >>>
> > >>> R/W works for me (tm).. the META version may be (inconclusive) 2605
> > >>
> > >> Looked at the wrong SoC META table.. the build date is 05/25/2023
> > > 
> > > Could be that my machine was not provisioned properly. Do you boot from
> > > UFS or NVMe?
> > > 
> > > My fw is also older: 01/10/2022.
> > 
> > The machine has UFS, NVME and SPINOR, however the boot log definitely says:
> > 
> > S - Boot Interface: SPI
> 
> Mine says:
> 
> S - Boot Interface: UFS

Is this META even supported? I think it's recommended to update
firmware to the latest releases.

-- 
With best wishes
Dmitry
