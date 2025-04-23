Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573F424467E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745406573; cv=none; b=jjT2lFj2OD/ydg1AZGRMhriev7RT+UulIbGim/CC2++vWAk8t1iu7SoSXejo0d1Nc7Nh2SheNVRxhMIJSwXZXDFPS15uR5XTnztPshkCQjc/6v6apSucROph01uaHDeNYCrznk4y31KSLvTapvQbeAnORiuXs0snVuJqced5jKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745406573; c=relaxed/simple;
	bh=yYkyb+EUkaB7iruBXQArN8V5Gx5hk+6OjIcFf6LQfTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HiQ6gphFpBuB5sS1xDE8la/wz9ZTSW5Vampp6x0sgMMBPzLKLyiGK4FZzN+9TDHQttjLUcMS8gkqr4FgH6E0V7xHqMiEtzmsTUXqw06Y/6EzZanthYc8M9Vh61t1jwed6Wb2y5TVXfkhVUbpuxKTsB2a8EfqB2ZAWRuro6FTwKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gbgs5Pmb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gbgs5Pmb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NB5F41014200
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:09:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rd3YHcBC3TYtyVK0LNqsKsNH4Ca1SUDlk/VqAbaBYrI=; b=Gbgs5PmbS8Rwe2pl
	Dq6Am/mKNhrlPfQGhW8NJ20qN/u2MfsTbMt9JKfTsZsriPgCrD1ZJH6fyBdkpHSu
	jdoV1xiMyokzvwCwhb84EVPK+qC/ms8DuOjyZ2u4k5Ie//6MviheNXJIR5BE6Hlx
	XZznHFV/OYdCeG/heni3kCKt45iziHEyIsWRyKiFtmUxqlC6L7KT26gWzDXWwYyD
	SKbu5nLgMhry0zDGxU24KWICXm+VTEokewsAax3Pp0KBl8UwFiC/c6fvmx1zyq0u
	DAP9S1arRjzHfhq+Rhf64cyydOfzx1PvSvdLg514Bdlkkw8JkIxoax/0SwlUhYOP
	pH6qqw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh39vn8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:09:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c53d5f85c9so132684385a.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 04:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745406568; x=1746011368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rd3YHcBC3TYtyVK0LNqsKsNH4Ca1SUDlk/VqAbaBYrI=;
        b=Orc4Dmo6LD/fqkVXP79P8+RV4eUSOpkp+tjSv/tnAJYsIX3abLlOyXW/V25PZF1SY/
         avoL85PaaZ9snHH6fouC6PRdbFAzFXqgfLjXvTr7KQcW5sH0khVQt2Ai5SBtLEGGpNig
         Wb+YggXRKD5mTO/3iFin8Gu/JZ2q/kxodVyHIFwtF0Sh1uPDhZ+ApasDrR3cEGgHK0eb
         OhNo1OV12kdija2UP5ifOJ1GY4ubClEGB+Cg32IaUMXsnXWO2vpVblHDCDlSnD3HmmWs
         ConOOp7HPoLLs+LBI1w5avYrl/1wVQgT1Jjyo4ytRDW6+F04fk2jVzIs1RHRqX1iALB4
         uQ1g==
X-Forwarded-Encrypted: i=1; AJvYcCVXzku1bo7Ku2LkicjIxxi8leLdkkr6GYw9aaPwpJXArlcRV1TUaQJeI5AKrDoYWQGgv+tTKiIVukAcRdE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgdiLjyzZk1P3Mg0w/W0uYwE32MyBqHLPwHs5wfyCVTgfWEvhP
	/43uAM1twrOiHbk2Xy8nu8sUmjSZ74C/nhWQ6Z700Gk/8y547JuQxJ31cdk8AcKbtkO+4a/J/aF
	Xj2Y4kmlgKoz3dBiHRXXCs1xjlr5fbbGml131DXhU7GEoPhN0Ozltu7gHym/YAN8=
X-Gm-Gg: ASbGncvOB1jMh4XanVw/TRJ+yAsiMfrIi1rMUtmeeTqlABn5nKNWPvRYnRZG+SQ8Jbq
	ujvYJ2rdvdp+xTCGFYachdf7S4tg3C7X5b9XaelQpVb30TMvlPGDgteCOMBffIdF+cXLf4SeZl4
	E7jWGfBJXdqE+UNVEObHgIVyqbB1ULK0Z8Xl7524bd4jmRpSuEnt3Or0ceyTvf31nke9j1ATG7G
	fuVZeKWifdEe2cWsr30RrAiFGzNU3jiuguPCW+Ih2IwJ2YdNNp9JM3NhboGoZwqx8n9WR7wkPz/
	kJ9goPjTdU1+Bp6BJawRq53HPa/jxD1bhhNSpLdTJiIqXbgfQIOoTJbcSgeo8kzLd20=
X-Received: by 2002:a05:620a:d8b:b0:7c5:79e8:412a with SMTP id af79cd13be357-7c94d243c53mr169135685a.2.1745406568541;
        Wed, 23 Apr 2025 04:09:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiZEnn54IflaB3i4pqXC7ZrnER6o9bw/syciNUcOHoqO5HVrimc4sTg7qhgrFutnZVRtO8kA==
X-Received: by 2002:a05:620a:d8b:b0:7c5:79e8:412a with SMTP id af79cd13be357-7c94d243c53mr169134385a.2.1745406568049;
        Wed, 23 Apr 2025 04:09:28 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6efa5c5asm784078066b.166.2025.04.23.04.09.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 04:09:27 -0700 (PDT)
Message-ID: <b7027077-e9a3-462b-92a8-684a42d23604@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 13:09:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/9] phy: qcom-qmp-ufs: Refactor UFS PHY reset
To: Nitin Rawat <quic_nitirawa@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, bjorande@quicinc.com, neil.armstrong@linaro.org,
        quic_rdwivedi@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
References: <20250410090102.20781-1-quic_nitirawa@quicinc.com>
 <20250410090102.20781-5-quic_nitirawa@quicinc.com>
 <pur4y63xhfmqlyymg4pehk37ry4gg22h24zceoqjbsxp3hj4yf@4kptase3c4qp>
 <317faeaa-3130-4e28-8c5d-441a76aa79b4@quicinc.com>
 <CAO9ioeXnnbNzriVOYPUeBiWdrPfYUcMk+pVWYv0vZpJbFeByoQ@mail.gmail.com>
 <2820908b-4548-4e0a-94b2-6065cb5ff1f3@quicinc.com>
 <c2ec6b7c-421d-43c3-8c0a-de4f7bdd867c@oss.qualcomm.com>
 <a24ff510-2afd-4aa7-a026-199fb6d87287@quicinc.com>
 <CAO9ioeUDzYLMvqmsOQ-VfgLQLavHqn=QVYxyHzetjSfmhjKFjw@mail.gmail.com>
 <1a623099-40bb-4884-8d93-132138a4150b@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1a623099-40bb-4884-8d93-132138a4150b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA3NiBTYWx0ZWRfX1xOMb7W3dyUG ZzzomIwCv95nrxhRgq5MA68RfhOX20HSuacKOjSh11AaI4pvhO1flPptH2ZBNBz8RtvL2fF2gKI 1Uw0acoGUJ+EwFyYZCwrb/3tmu6FssuTn6v0ItwExiBZVfDmLW+L0FMIY7XwDm+2lOX3EGHbVuZ
 GB+MN0GLQ8vONuffDbRUerBpHnSyNF7fqDAFhugRTdPDM5nbU/3wkBlaQ4HadVyeX5hP2hgnX0R ipARScFXl+cUoqPU5zp4G9yi7iVBgPgooQIRiBasx/+433bJyKTj3QHo3LwdVWNX5CNxD6lnmG0 0qTNNAG+pU5MtG6vU3aSd4xYLr4odW/oIuRQsDZGHF9ScSErURcxfJfHRRtLy3b0eBRp1PDjYS2
 DoogFieMp5RwOu7OlVXKzJvhMNHJm6VxxvizlZhKFjpb6Zd58qcL04SypN35IKifWoXzzygE
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=6808ca69 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=iCsAco6G6QYzM88_SOEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: YeI9nbMU0ASuIl_z3NSSAEaeWgs5bT9e
X-Proofpoint-GUID: YeI9nbMU0ASuIl_z3NSSAEaeWgs5bT9e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_07,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230076

On 4/16/25 2:26 PM, Nitin Rawat wrote:
> 
> 
> On 4/16/2025 5:43 PM, Dmitry Baryshkov wrote:
>> On Wed, 16 Apr 2025 at 12:08, Nitin Rawat <quic_nitirawa@quicinc.com> wrote:
>>>
>>>
>>>
>>> On 4/15/2025 2:59 PM, Dmitry Baryshkov wrote:
>>>> On 14/04/2025 23:34, Nitin Rawat wrote:
>>>>>
>>>>>
>>>>> On 4/11/2025 4:38 PM, Dmitry Baryshkov wrote:
>>>>>> On Fri, 11 Apr 2025 at 13:50, Nitin Rawat <quic_nitirawa@quicinc.com>
>>>>>> wrote:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> On 4/11/2025 1:38 AM, Dmitry Baryshkov wrote:
>>>>>>>> On Thu, Apr 10, 2025 at 02:30:57PM +0530, Nitin Rawat wrote:
>>>>>>>>> Refactor the UFS PHY reset handling to parse the reset logic only
>>>>>>>>> once
>>>>>>>>> during probe, instead of every resume.
>>>>>>>>>
>>>>>>>>> Move the UFS PHY reset parsing logic from qmp_phy_power_on to
>>>>>>>>> qmp_ufs_probe to avoid unnecessary parsing during resume.
>>>>>>>>
>>>>>>>> How did you solve the circular dependency issue being noted below?
>>>>>>>
>>>>>>> Hi Dmitry,
>>>>>>> As part of my patch, I moved the parsing logic from qmp_phy_power_on to
>>>>>>> qmp_ufs_probe to avoid unnecessary parsing during resume. I'm uncertain
>>>>>>> about the circular dependency issue and whether if it still exists.
>>>>>>
>>>>>> It surely does. The reset controller is registered in the beginning of
>>>>>> ufs_qcom_init() and the PHY is acquired only a few lines below. It
>>>>>> creates a very small window for PHY driver to probe.
>>>>>> Which means, NAK, this patch doesn't look acceptable.
>>>>>
>>>>> Hi Dmitry,
>>>>>
>>>>> Thanks for pointing this out. I agree that it leaves very little time
>>>>> for the PHY to probe, which may cause issues with targets where
>>>>> no_pcs_sw_reset is set to true.
>>>>>
>>>>> As an experiment, I kept no_pcs_sw_reset set to true for the SM8750,
>>>>> and it caused bootup probe issues in some of the iterations I ran.
>>>>>
>>>>> To address this, I propose updating the patch to move the
>>>>> qmp_ufs_get_phy_reset call to phy_calibrate, just before the
>>>>> reset_control_assert call.
>>>>
>>>> Will it cause an issue if we move it to phy_init() instead of
>>>> phy_calibrate()?
>>>
>>> Hi Dmitry,
>>>
>>> Thanks for suggestion.
>>> Phy_init is invoked before phy_set_mode_ext and ufs_qcom_phy_power_on,
>>> whereas calibrate is called after ufs_qcom_phy_power_on. Keeping the UFS
>>> PHY reset in phy_calibrate introduces relatively more delay, providing
>>> more buffer time for the PHY driver probe, ensuring the UFS PHY reset is
>>> handled correctly the first time.
>>
>> We are requesting the PHY anyway, so the PHY driver should have probed
>> well before phy_init() call. I don't get this comment.
>>
>>>
>>> Moving the calibration to phy_init shouldn't cause any issues. However,
>>> since we currently don't have an initialization operations registered
>>> for init, we would need to add a new PHY initialization ops if we decide
>>> to move it to phy_init.
>>
>> Yes. I don't see it as a problem. Is there any kind of an issue there?
> 
> No issues. In my next patchset, I would add a new init ops registered for qcom phy and move get ufs phy reset handler to it.

I don't really like this circular dependency.

So I took a peek at the docs and IIUC, they say that the reset coming
from the UFS controller effectively does the same thing as QPHY_SW_RESET.

Moreover, the docs mention the controller-side reset should not be used
anymore (as of at least X1E & SM8550). Docs for MSM8996 (one of the
oldest platforms that this driver supports) also don't really mention a
hard dependency on it.

So we can get rid of this mess entirely, without affecting backwards
compatibility even, as this is all contained within the PHYs register
space and driver.

Konrad
