Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE3B156669
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 04:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738815859; cv=none; b=dhyAEje/XEde9E4Ro4OCTVoWN0PsEkWD0+Np1AMl62qaQ3WPYJiC07Qya4xodzWNfjOpIpmuLucFjhWICluEDUJFrKb82opoWjsI89n/+QvqA90Pp3a3Ej01CPW7wbuXMRLgwja9MI9T0qdBzgNApGl3bdrMrkQ8vDRqZTyocUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738815859; c=relaxed/simple;
	bh=x3RoQDABbP3pMXuxhTOvr017iXEkAiYBJfNFjunIDd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l9eo8eKwX2XADH6B5LGx5ISUqysLA8gOLyBwhIJwtG27aQ/0MNJkH1o8Lcwf2FZNF8sQzh0ulNaPiZ1VxAbkoXRwjIzI/js2dhEJ/0WUH7olhH/r/soe68pp3ixiPSuKs66OnaPgI4HDGD3jeF+gsaXTSw0i6KkuceEP44CpUSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c8nkR86c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c8nkR86c"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515GqtkR029645
	for <linux-kernel@vger.kernel.org>; Thu, 6 Feb 2025 04:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UzZDnfGZLX8HvjMJIk88Bhmcd/aj0bIaFc3nWEIhLaE=; b=c8nkR86c6BC5hEkn
	06WRCLGJhjYiKrGQITC3YOwKgG2fU73gFNkFFVrEH+dTurP/GEgsT+p38xGymqX7
	9U5g4bPctb0MTuKHlzqdsGNicCkLYjxPdOmWpnCydGMxy2P+3EsfVXhsRcC7+35b
	hQjwNkV6nEVPvaxwKHomkaohsUGAJNGmzliFXjv1nQzDe4aUXd9T8DKwim7i703f
	67yKf6btiWDYi37YPQWUkzn2E3B4hKuWrrdPAa6VjhpZ05wANiZHBfm+oGHHGNb8
	1jOmWVq1W/N0uqb1SpwM+nrffrQRuTpvmc0lxCwVSdoF8FuCVTTDWWogpSB421Py
	RrcSAA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mbw49bc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 04:24:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-21f078fc592so15553545ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 20:24:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738815855; x=1739420655;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UzZDnfGZLX8HvjMJIk88Bhmcd/aj0bIaFc3nWEIhLaE=;
        b=tWIlaQNZED3m14pcEclpMavyXelESelOdEQNx/SB6AdCZbdI58gYtFNqI6/mVLpSWs
         4CshxWuMvSWs9Q4BxM4oJcahejdEh4Crp2FSUFDlpQhs4n1SVKFXLZrnDhQpPWV6VrTF
         dJhVGkueGM7p22WrdqWHfX3jmPsBwrpAPbZ5YExWskKFzCQh3496xqfiyKpzyZySl23e
         TbzhjxIJnJ9hxoGZIXtURq6PrGtFX5A2BHIYIZMXjXe9gqkJa09j7UNtZ3/p74JCHQMG
         SQjCdqBhDdij24AVSo3pTKvGtf39hRe2998GxOxOtM33i/cZMnP8okq23xGWB5PyDs7q
         Ze+A==
X-Forwarded-Encrypted: i=1; AJvYcCUxmaxJqZvZNscgyuZvLAH4NbxdqOj5aHZLlmUHoFpyA+saqXgxeOvgRkrZeD4H6fqDGhW4J3Uvh0cJTm4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY6vhBYd/ppNpgj6JRgRRbLIdep+H2oTvTDzs7CFLDTqCvUxmL
	2dHUzbNNbi5H3R7zwdX5tk3P3tTqt5hpb0XR5KADsoMSaNizJQRjmRL/IEC1dyjKDrgXBoRjbCb
	8eiqqaK1RuCFi1qznejN68AcoOVUBJtIblX/J13DbQWd9IQs0YK7xVnItoT0Hh8s=
X-Gm-Gg: ASbGncsifjS3tKMHeRlsM/XUpkJ98e15XoZswFjql7DDaDuEng8uZ5xZ2P0cDMqOIPs
	5RsxooiZz+qWl5+1Z++ivfUqbtP6yzd1fxFpCA1lopVs8lfkiWHPsyuLA1BLE5ZVMRgAjEWp4Um
	PbBq1KNaG8jSfHz2ZnIkAewT4cZMdRgy2PPclPFEBfncBrITaCj5oagAIdVEp/1k4929i10JB18
	SbQduYPbJohPLGbAfiLbJ9S/6+OoXh3PKgt4x7u0+F6Bpm17j9lCn8Bt+9qqIOSkd9CTGbk/Q7K
	m7ZL02jy77kuBwcEc37mTBtoP2Wfkg==
X-Received: by 2002:a05:6a21:8cc2:b0:1e1:b12e:edb8 with SMTP id adf61e73a8af0-1ede88b2334mr12379137637.30.1738815855152;
        Wed, 05 Feb 2025 20:24:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4bOrr5uUDRlCbMOWSGKN7WtxiRHglYPcsXxM0kkvRTF76K3q2h/bgcDp9ITqdP4O/UH8rzg==
X-Received: by 2002:a05:6a21:8cc2:b0:1e1:b12e:edb8 with SMTP id adf61e73a8af0-1ede88b2334mr12379098637.30.1738815854768;
        Wed, 05 Feb 2025 20:24:14 -0800 (PST)
Received: from [10.218.35.239] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51af780ccsm190657a12.71.2025.02.05.20.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 20:24:14 -0800 (PST)
Message-ID: <33a19657-a890-4d59-b7ea-5798cf8f7d9b@oss.qualcomm.com>
Date: Thu, 6 Feb 2025 09:54:09 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOetlOWkjTogW1BBVENIIHYzXSB1c2I6IGdhZGdldDogdV9zZXJp?=
 =?UTF-8?Q?al=3A_Disable_ep_before_setting_port_to_null_to_fix_the_crash_cau?=
 =?UTF-8?Q?sed_by_port_being_null?=
To: Pelle Windestam <pelle@windestam.se>,
        =?UTF-8?B?6IOh6L+e5Yuk?=
 <hulianqin@vivo.com>,
        "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>
Cc: "mwalle@kernel.org" <mwalle@kernel.org>,
        "quic_jjohnson@quicinc.com" <quic_jjohnson@quicinc.com>,
        David Brownell <dbrownell@users.sourceforge.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "opensource.kernel" <opensource.kernel@vivo.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Brad Griffis <bgriffis@nvidia.com>,
        Harshit Mogalapalli <harshit.m.mogalapalli@gmail.com>
References: <TYUPR06MB621733B5AC690DBDF80A0DCCD2042@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <1037c1ad-9230-4181-b9c3-167dbaa47644@nvidia.com>
 <2025011633-cavity-earthworm-2b5e@gregkh>
 <3d9db530-a0b7-4f18-9ad4-233356dfe68c@nvidia.com>
 <e3a457d6-092b-4b7a-9032-50daddab6f1f@nvidia.com>
 <0fa6c6db-fd75-4a09-b4fa-d6a98bb8afac@stanley.mountain>
 <TYUPR06MB621712E6A082791B397088BFD2F72@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <f264888e-6100-4812-9661-ffad174f45af@windestam.se>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <f264888e-6100-4812-9661-ffad174f45af@windestam.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: RgPrqKCFXhKWz1T3b5fCVUYuAjONb5D2
X-Proofpoint-ORIG-GUID: RgPrqKCFXhKWz1T3b5fCVUYuAjONb5D2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_01,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=561 malwarescore=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502060032



On 06-02-25 12:59 am, Pelle Windestam wrote:
>>>>>> Odd, you have a usb-serial gadget device in this system that is
>>>>>> disconnecting somehow?  That oops doesn't point to anything in the
>>>>>> usb gadget codebase, "all" we have done is move the call to
>>>>>> shutdown the endpoints to earlier in the disconnect function.
>>>>>
>>>>> Yes the board starts usb-serial and usb-ethernet gadget and on
>>>>> reboot when tearing it down I am seeing the above. As soon as it
>>>>> disables the tegra-xudc endpoints (as seen above) the board appears to
>>> stall.
>>>>>
>>>>>> I'm glad to revert this, but it feels really odd that this is
>>>>>> causing you an rcu stall issue.
>>>>>
>>>>> Thanks. I can't say I understand it either, but I am certain it is
>>>>> caused by this change.
>>>>>
> 
> I do not have much to add in terms of solutions but want to chime in
> that the same issue happened to me the other day when I upgraded my
> kernel. It manifests itself with the rcu stall whenever I try to reboot
> my device with the USB-cable connected (it is a usb-serial gadget
> device). Moving the usb_ep_disable() calls to outside the lock (where
> they were before the patch) solves it.

Are you also using tegra-xudc ? ep_disable routine may be called in an
atomic (interrupt) context.

Regards,
Prashanth K
