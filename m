Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A855D28134D
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748431368; cv=none; b=jvknY+5tmm/lQMRg3xR8My/5DyCwGTFZNY2CWlFaoEoLqWfkSTXgLvyYZ6RFy8N+dxdRpQACBf8l1Zacups3GT4GX5hQqp53T9rIaUAz4pdLOMUg1tKd09rT9LVu/bPgZJ4cSd9zyMhWDLI/0bsaETC4GV1//sZp0bFjvM2VSd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748431368; c=relaxed/simple;
	bh=SQjZk2OifxeYB4JLy8Q5cjUg0zdPgl1qjVVFEnxXc0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hXYi5XoOSyuiMsSqk448hqqqeqcobn8QGhXPUmZsF5ysMmpt2Z5jSo286VF6skdb5ZcuxKj3jUL8drBwNWQDaog7JwLwtwfvQXFPpbfWVvadNWzFMzky51QylmlixEKnnzObRp4eNWlfHEjjrmL/+q/pulByY2h10PKS2QsuksU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ji1J4vDP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ji1J4vDP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SAI3sk021578
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:22:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PXrF3chhlKsYPqdRDHwS0A8uxmZl7PCZMAnk+l3O8cw=; b=ji1J4vDPrznP7Pqv
	1zdDmfOmUi/OK7mmMDtOliQ8DG1CDqh6JpJpI7y0dKCkKdBTh+6Dt5xRaB2LpzuE
	6W12J5C/vCuUxVRPh/oPeTZZjXcm+2zG7PpjH8gTObT5CIF5p5hEqLweVlbweGUC
	8o2W759pXLSm1/gpVO01S0fnlx29gM78ddfjxBgabICF7w1NLYtY+K3vC3m6uvLo
	vjaBqZxgRSWZqIcfTUhrKKX39+cLV5j8h3d/dGwLls4RvZZYPnOIdFJaNg+GyfAX
	NgeMTerok3qxMHyDdNPSX7cCYNPs2O2sf7Eez4TRQctN5EgC/g/7kpgE9bLBd2EZ
	R/zT7g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g9219e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:22:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7ceec331273so136343985a.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 04:22:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748431364; x=1749036164;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PXrF3chhlKsYPqdRDHwS0A8uxmZl7PCZMAnk+l3O8cw=;
        b=VTc0Sv/KDQIRSfHADrg57NNRbbujG75bJ9Hl/QNds4x3+TzV7Slhm7kA+M5dVyfDNx
         ogRZocIJxx3syZjvg1wXBdAyiqsaEG49Ripc9Clu6iHkQxKNk5FK7LXx+kYBgBJbqvsr
         5bAdc4yohF5I/Xh1CQbylcrS2gDoF2JGr68jpmlJEkcuG6kg87zO10cwlDNEflRgasrK
         oi13DOP5J8vjUoVujdOYIE3e3hYQCs0QxoAbIC9bxLhEvfDhjtBlLc5yVhmMD/dUYkz1
         gdjfwPsrWUZnnArsEviASeB43e5IzoLzRtzrUUGHoTkP7IXj2/5yKdIHkEyTbiyzcRid
         8llg==
X-Forwarded-Encrypted: i=1; AJvYcCV/TGVX73bvdBN76H5CMiU7GzTuJ2tqHkcFCuodePkt5PI4PyxXd6wr+bopoqINfTsn47FJwvVLiEv56d0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaQ+EGDo257R1DkhJEazrBJeNmtnte12mD/EUL4UDwoJV/ecKa
	wZLKI5k45QsDLXK313fGx83t0f0Z3ic/ZSlfCdsNP1SlFbyogaGoy7+jEMJtZvPXWky7gnZR8ou
	ZWUB777XtVrBhnBDAvefrft0eYBrtLXDu9j2HjBoshMQIRB94j6rw2zAXCI34inRr0bk=
X-Gm-Gg: ASbGnctgtfLBjdMXbFnpYooX9cA23ufuAimmn8IocwogTs/I51mRSs/B0zMwcGB8lHu
	OMoR4UW6kHU9cg99S80oumzxj19Kqvkq6f8fBFe80XefJUWbbi1Sx0de6LN7anfqc0N4R96D2Pe
	me6JUB4QCioWMO0MSMKwc7rP0SeK8Fn39yH2B00m4fR4SRPg/qOpCaOYCBLeAm8VQCgQYGtadRv
	9ndGvK7w4+eExpGhqcl1sBl/ubnCWSLTnA9WbsKcWGHjy736mzsdmHjW9n7jIJ9WjAA5gGUN8hT
	rqHLyIVch35UUqdTY+TMtw9bxX7iTU6KUEK9/2C3p9pROOigEOLH3bZ2r7qLWUNhug==
X-Received: by 2002:a05:620a:2710:b0:7ca:e392:2a1b with SMTP id af79cd13be357-7cf5374ae78mr110204185a.10.1748431364559;
        Wed, 28 May 2025 04:22:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoL3mKSALNU9U5rUvH7D3DgExdg+X+00mZ1LS8ZpHat+MX4uUZuY9EFAKe+em8TE91JP4dIQ==
X-Received: by 2002:a05:620a:2710:b0:7ca:e392:2a1b with SMTP id af79cd13be357-7cf5374ae78mr110201785a.10.1748431363985;
        Wed, 28 May 2025 04:22:43 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8a1b47a16sm91600666b.144.2025.05.28.04.22.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 04:22:43 -0700 (PDT)
Message-ID: <07aa740a-72f1-4d7a-aefc-437d52b8dac8@oss.qualcomm.com>
Date: Wed, 28 May 2025 13:22:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] phy: qcom: qmp-combo: register a typec mux to
 change the QMPPHY_MODE
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
 <20250527-topic-4ln_dp_respin-v3-5-f9a0763ec289@oss.qualcomm.com>
 <itmvwhcf37bmnpadcyc7kdt7wx3eljyjwyv64s24zwhbr2e45g@76uzcpjqzx22>
 <7f464eb7-469c-4350-a43a-3b99394ad689@oss.qualcomm.com>
 <7icpna4l7z63gs52oa5lqf35puib66wxxmqqul6ezdkhuziaqi@mvkf73zz2iyj>
 <8692f79f-142c-43e6-9e09-7ed4ce590b87@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8692f79f-142c-43e6-9e09-7ed4ce590b87@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=6836f205 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=WE4J2M1y9a7QUu_BFKwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 8jGn4CA02HeVe2ms0HKEe_3sXY8Jxj-i
X-Proofpoint-GUID: 8jGn4CA02HeVe2ms0HKEe_3sXY8Jxj-i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA5OSBTYWx0ZWRfX4ulOSZSNKM7w
 pRgRKmnK+cVl+eebJKG6RgfTc2qfGOqumVQI68Z9nT5Ns/x2xE0ESP2DL8fxgmJjcb9hsRGl+g5
 /Q73Ow1NcmvwN84Z95xh+T9j+IRScaRJsYebk/SS6aMFZaNf3Ua5wimLIMS/7K56556ykDgrJFW
 Wc2VIdev6zaLCqzcLrd2ZoukwARVzi08PBdX2iF4YIbEf4qowqilG88Bkj9P7HTzLEvEwBCwVW1
 pj0nC8Nr4NNJbAGs1KaUOiI+hi6uYXJSV57l0LoWbtjSd2H6gu3/0nozaRNHe0xSCus6fsHrtYH
 m7kBumFubw1GPMrtj65zza2A+hIRCs3LvN7oH/44vvIoRp2DBRLATfsZ+L57qTzXo2Uww46YvAP
 ysBg5+1nsHN99u0kwLSBxbu2CbSSHIO3CmZt0l2hjOYWdJYnZFkqgsIBBSiL1AbArFXPmGWC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=881
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280099

On 5/28/25 1:21 PM, Konrad Dybcio wrote:
> On 5/28/25 10:58 AM, Dmitry Baryshkov wrote:
>> On Wed, May 28, 2025 at 12:22:01AM +0200, Konrad Dybcio wrote:
>>> On 5/27/25 11:55 PM, Dmitry Baryshkov wrote:
>>>> On Tue, May 27, 2025 at 10:40:07PM +0200, Konrad Dybcio wrote:
>>>>> From: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>
>>>>> Register a typec mux in order to change the PHY mode on the Type-C
>>>>> mux events depending on the mode and the svid when in Altmode setup.
>>>>>
>>>>> The DisplayPort phy should be left enabled if is still powered on
>>>>> by the DRM DisplayPort controller, so bail out until the DisplayPort
>>>>> PHY is not powered off.
>>>>>
>>>>> The Type-C Mode/SVID only changes on plug/unplug, and USB SAFE states
>>>>> will be set in between of USB-Only, Combo and DisplayPort Only so
>>>>> this will leave enough time to the DRM DisplayPort controller to
>>>>> turn of the DisplayPort PHY.
>>>>>
>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>> [konrad: renaming, rewording, bug fixes]
>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>> ---
>>>
>>> [...]
>>>
>>>>> +	} else {
>>>>> +		/* Fall back to USB3+DP mode if we're not sure it's strictly USB3-only */
>>>>
>>>> Why? if the SID is not DP, then there can't be a DP stream.
>>>>
>>>>> +		if (state->mode == TYPEC_MODE_USB3 || state->mode == TYPEC_STATE_USB)
>>>>> +			new_mode = QMPPHY_MODE_USB3_ONLY;
>>>>> +		else
>>>>> +			new_mode = QMPPHY_MODE_USB3DP;
>>>
>>> To be honest I don't really know.. Neil chose to do that, but I don't
>>> think there's a strict requirement.. Should we default to 4ln-USB3?
>>
>> Yes, QMPPHY_MODE_USB3_ONLY. Nit: there is no 4ln-USB3 (it is a special
>> mode). We handle 2ln-USB3 only.
> 
> Right, I double checked and we support SS

I clicked ctrl-z one too many times - I meant SS+ 10Gbps

Konrad
