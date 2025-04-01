Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0F73FBB3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 13:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743513412; cv=none; b=fbgoLFMhRkp5Z/QM5iDsqZUBFSreE6/1yhLHC7p+3ZUK8Ae0ydjjpxxjsKKe9j4Y12lXI9QEuP82aHLWbQUrjFvhpTEppBUvXYReNRKwcQxPXO3BSPf0yDvZE4sQeNUQSBGuJiTauUYDiE1ocpqZ6HIs8Uu150/HNdL4q5obShc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743513412; c=relaxed/simple;
	bh=bR6eGSj48GGt691R3aW9/Bp/2vQMUzQVg58j3Up0k+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j3dButo4scAEHzk8Qw9/pLG19s59ZbiGHhr27hoJTgk74H4tYReaPOyo7REJgZBYtsqFpNxgcDuSbXZWtW+mDnAXjNRjvoDkBSwdu7mnEKxPGvPi0UKkwM6YDM0FpnznkhJA5yhnpFZ+vbVUPxqEq6Zpbz3/UN75gCCnnaFGneo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SVFXMcvE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SVFXMcvE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531CwJ47015653
	for <linux-kernel@vger.kernel.org>; Tue, 1 Apr 2025 13:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fuzrmKqRaLkRRC/h1dpp5sXVSR1oAWYfmSNhpfK/XSU=; b=SVFXMcvEbMAYFAu2
	USAXHx9sVTLiVs7WUgGRgFkpQLTq/KLv7zOJGtdg/B5DzcYjSla76gRVIsazPFAS
	sxxM/my+Bhx36IPv3TdVrThiRaXwDnyDLXbBuvDuy5w1LTSE7VIm0ohr01XKLFj4
	ixsdKy0si34iW5Ni6vvEeYRJp32vvlAiumA+BSTbILeVKYY1StFKu2zqlXn2Bv0c
	S9Sc7MdLrmbO2tS2KAceWfbSUOD84ndry2gaimkne62OARUEGs4IFrES4dp4QPEZ
	/Bnd0Z4cb95HbiqtGzrf09lhVc3gITC+9yADE/0+nymgW+1X5gqhpT1+yMs0N2Tl
	wLbpdw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p7tvg4eb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 13:16:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c548e16909so516952085a.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 06:16:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743513409; x=1744118209;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fuzrmKqRaLkRRC/h1dpp5sXVSR1oAWYfmSNhpfK/XSU=;
        b=H1gTPWZontEuB+hz8nm0XwgfaM+Vhf1TDQcyFjOsjcFp90YhGYRzlxAQG04ODFdiho
         3zX7lv1vIwsPXJdqeGgx+3z+fpYobgd8cLQA5ZjK3fcjScPkIo2ja+SCPzVPtehHqzNp
         8rGZa52MkE6B9KwiWMGihKTbgkhZ4y0CTtZWn1ZeoKC9ow6MtBcy0VSnus0m8VDC+Z04
         Wz6mbwsXkqqaYEi8eM1RIaJi3L1KsKlO5putvAmIugsJ8f2AjLYAbseBRe4o9iNLv4UU
         dOEgN3kpLGUprRh7XdbU2GRg9QBwKZNP+du0S4B49rOhoSYwn6bDfg+K22UKPD0BVAtE
         Durw==
X-Forwarded-Encrypted: i=1; AJvYcCUvbWfgH2btJztmRa1+vUosCQBGVKPgs11R9v+chELbaVkkTDnJrMQHQhfsA+8Ql5uO6BMUd7AEOVSBhUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUqMECL/usblMs9ILcQZswGERQplzZb/Bn9o2BIJi8GUtfCgFt
	E5J5iTPATujSW5l93n/8x9ZzKGxKCPZKvLYxqp1bKCDbw+kzk/UTd/St7ZLbjSag3xvIXL4F7PH
	fzrXRSUHYFBfYCnRyRhgTabvDm11afuIBTbDb8nWPHG7ptP8TvsUMp40a0QRHSVE=
X-Gm-Gg: ASbGnctEPdC3Cwq6WyA5e0StEvqU7bdnTGi3yOqsViMJpYN1IyRcI7f4W5VeO9BfBwA
	6hZ3LYorOwRraJ3a/kNG0B3Dqg61d+NAQPGKkiLnCwjL1YoedPRpg+eLnQS0IXp9QExZW9rClig
	jFvSq0XE/YIDFbIXa7sGvNM6bmvbedlM1s40qa43tebnEOZTFBEv6tzp69ukPmiqPGixIFEGZeQ
	MNuURmI6Rf+sLeKzVa1MaZZ/IpKtsi6sdQSEeaSnEFc5Q27+1Ilqc7ZkZNYY/2y5EM8Mv1YRgSg
	MOZie6JHcrBrWtP4Yro5akrw6KI6XXLb5aFcF1jrtg+fW3zuliDDGSG6NYB0P02IHLg4
X-Received: by 2002:a05:620a:1a03:b0:7c5:4738:8a11 with SMTP id af79cd13be357-7c69072e5dbmr1611151885a.27.1743513409188;
        Tue, 01 Apr 2025 06:16:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfs84UuVjPU56+3GGH4wwuZJwdAARKybIpYQNrPciwdKqQV0psmYSnmSCQba15CwNLS9OaPw==
X-Received: by 2002:a05:620a:1a03:b0:7c5:4738:8a11 with SMTP id af79cd13be357-7c69072e5dbmr1611149185a.27.1743513408865;
        Tue, 01 Apr 2025 06:16:48 -0700 (PDT)
Received: from [10.116.217.42] (146-207-246-94.sta.estpak.ee. [94.246.207.146])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094bb344sm1364786e87.37.2025.04.01.06.16.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 06:16:47 -0700 (PDT)
Message-ID: <9efea174-80db-4e5c-b0a9-4c5fbc7e166a@oss.qualcomm.com>
Date: Tue, 1 Apr 2025 16:16:36 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/2] dt-bindings: mailbox: Document qcom,ipq5424-tmel
To: Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        manivannan.sadhasivam@linaro.org, dmitry.baryshkov@linaro.org
References: <20250327181750.3733881-1-quic_srichara@quicinc.com>
 <20250327181750.3733881-2-quic_srichara@quicinc.com>
 <ru37oebencfqbepop6ka5i2fc64ifk4nnwqmb4o52nwccpplkp@b7xxxpp5snip>
 <479b9613-8244-4a29-9735-cec47e473946@quicinc.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <479b9613-8244-4a29-9735-cec47e473946@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OIon3TaB c=1 sm=1 tr=0 ts=67ebe742 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=aVIEJrXLnI925Kw8RqJ2Kw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=0xp6LphHLZRkLrDefq0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: sTuHlpzDuuwTsej8FmytUe4xzyrmdlRm
X-Proofpoint-GUID: sTuHlpzDuuwTsej8FmytUe4xzyrmdlRm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=793 lowpriorityscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010082

On 01/04/2025 14:26, Sricharan Ramabadhran wrote:
> 
> [Resending, since my previous response had some wrapping issue]
> 
>>> TMEL(Trust Management Engine Lite) subsystem provides different kinds of
>>
>> Trust whatever SubSystem (TMEL SS) ...
>>
>> different to what?
> 
> 
> To the ARM TrustZone firmware(TZ). So these services (secureboot,
> authentication etc) were provided by the TZ in some SOCs. Here,
> TMEL provides those. Can add those details here.

Yes, please (and all other answers too).

> 
>>
>>> services like secureboot, remote image authentication, key management,
>>> crypto, OEM provisioning etc.
>>>
>>> The QMP mailbox is the primary means of communication between TMEL SS 
>>> and
>>
>> What is QMP?
> Qualcomm Messaging Protocol
> 
>>
>>> other subsystem on the SoC. A dedicated pair of inbound and outbound
>>> mailboxes is implemented for each subsystem/external execution 
>>> environment
>>
>> Is it implemented in the driver? Is it provided by the hardware? By the
>> firmware?
>>
> TMEL firmware provides and processes the inbound requests and responds
> back on the outbound channel. Can mention this explicitly in the above.
> 
> Regards,
>   Sricharan


-- 
With best wishes
Dmitry
