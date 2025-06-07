Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D422046B3
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 09:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749288993; cv=none; b=EESBarAPIaW/LaypZwSFuC9TW3flr+VCeKr/RI8UT9laKmE2/EPaXoOYGTI5MyFSI026b4QGe+PypGEHfnpxQZ94UwtlQwo3IYTrbTpgWPyepEDnkhVX8PSGaGpOKyrAzgjIo8MFaWWSXN+Iavz6aAHrFgoDAmKNzm0uk9NXGuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749288993; c=relaxed/simple;
	bh=tIQYr/Ordh7OK5YzdnX/mG43lQYgIZRGZaOsLsEmcy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OzDWeJAIgvpNjPSkEGUnR7fX16/h6mbzBKtlq2UGTZsVDqCi/HGNQ8fEKxfUGRptugsxO4/x2Qrgznir1hsbGmCwY2gvJI/eRhn46+vruJIB1oliXU5fpI7et8N6Fm04aQuDBBJo8AuOQOEEFaG4NNTI8/tB5zKkj34yiSAdYF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HvjGFQ8I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HvjGFQ8I"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5578tA75005000
	for <linux-kernel@vger.kernel.org>; Sat, 7 Jun 2025 09:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zuDm4+B4e3Dd8MAQolF7UDe8UurtkEq/T3uR5DRTEX4=; b=HvjGFQ8I98ZKsNV5
	W36QjSAKncaitr9eNDRj7mmTTplUaAr76BoYacACfs3jc0XqV69YXwTgj4QyVenr
	C+SvCGx0XyKMBaHnJEh9FZFvn4ngm+b6qEfFn0TqEU/8v+3bs3l+JSrZxpOBXrx4
	FYTzX5WDTkgKJ+c2IUPV5khZt5Lmsxi/7RcvZpL6O/uY8Dc740ziXlnBQjPM0FVp
	q/WXwU694M3+ufYsERl6PH5yESLDW1b5dRUYI9TU5cazihXgphRRmpAoQijQsR0M
	t2iy+DUDBZFUZUuM2lgsAzgCpdhgy3f3TSA1A70YcnP8/d811/rj/Gud7t5dDD/t
	KLZ7/A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxgcyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 09:36:23 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6facde431b2so5364706d6.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 02:36:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749288983; x=1749893783;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zuDm4+B4e3Dd8MAQolF7UDe8UurtkEq/T3uR5DRTEX4=;
        b=lEIn1pGS2/Kuj6+J0alICZq1ezNSnp3Gh+h7dNx9bCB1zioAghHlXuaeLx/GZXkaio
         q4fUrrPkbDtrgPnPlJO3SSwIss8M0e2ErgBX2ff0Y37gVA+QR1uzkW4nG4BMdPYzHCP6
         gW+zCChxXEU8bzshapMFbhIqcdTANsclvZezWLLtULmKXf2G8aDCLTxHzbwzZNUGXrHe
         AgyYjojODBbNE/pj5QRPU7BhA2a1EjNDVwbuo47ZhNGfQuoSvIXRaUtBfCiOIH2ig22T
         rw+OJJxltNnBN/Rh4tbu2UWfZLAe7drLgcxSJupPNxvoJ1W1MyV41dFG/GmdpmpS8UVz
         zIHw==
X-Forwarded-Encrypted: i=1; AJvYcCUazYz2OoApMF41CPjGkr/zwAkGwE7DgEMCrBvFYeKCMWzijOO+xigOuqn0Px6GxJvoodaxR6zUTju6qyM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKhjlCfcWB30eXXhwjVVIcGgkWuxgoGewGqjsMzYrzdTBxQ6Qd
	RCfmRTPO8ny5yMjhNh8njfVEXs6l8DL8/ZzoWHyjznOkvp4DuCeUnZVEDQjYbSMJpX3dwy7nh5O
	1aQNzaDoObwtSk7xJZx9YgHUb3oohW9pSl1OiHfinQ2ikgvPwxjQ7HEk30etKjY4Yr1w=
X-Gm-Gg: ASbGnctVAnaGrWhyuCpr3H1t5kZDsCJ7b80hnv/52WTN1E60Bs+am/SU1veusaPiU9C
	bpCCbo8kTbPqrCVaidmGHjGmL+344WZrw2aGdIzM86PkYAAE/7vSQd/sGJLIBtB989Kpigeyb4s
	Di4ykisH+niZlroJByQY2U1OxVs830ncXT6dV2lSuTPnHqc+RY3aSLPsg09ceSRs5mhMGKMR9DU
	vOYpgHibN7Q7ZMcgqNivtkEN6HifD5mWCaF0ESqBZOYrG2s4LNJ3b6odwQHiojMIHKs0cehiyHv
	x5IJR77L4RzN5fEbX+PRFkF1dHPn63072ACEQYrBQ5EagejGZHSm7G2Bpp9PGQkA5g==
X-Received: by 2002:ac8:59cf:0:b0:472:1d00:1fc3 with SMTP id d75a77b69052e-4a669071b67mr34528301cf.8.1749288982924;
        Sat, 07 Jun 2025 02:36:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYvbjyQGYgwZ56zsisRNOil/dKyTDCJmJe5RoUiP1hR4vrYDOMOtfIuvUy4SKey0WEsD0+kA==
X-Received: by 2002:ac8:59cf:0:b0:472:1d00:1fc3 with SMTP id d75a77b69052e-4a669071b67mr34528211cf.8.1749288982538;
        Sat, 07 Jun 2025 02:36:22 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d754235sm248538366b.5.2025.06.07.02.36.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 02:36:21 -0700 (PDT)
Message-ID: <c98ebb32-7207-40b4-90d1-8bac62d54c8f@oss.qualcomm.com>
Date: Sat, 7 Jun 2025 11:36:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: Fix MSM8998 frequency table
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Arnaud Vrac
 <rawoul@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Hans Verkuil
 <hverkuil@xs4all.nl>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250531-topic-venus_98_tbl-v1-1-68e5523a39dc@oss.qualcomm.com>
 <btmzhyullmggev43b3syp3anxlm6o5mpz2mthaskuyl7kfx5gw@w5gesyaaytkh>
 <CAN5H-g7WLsowjW6CMee5T=W4Lmia9mLWGgX17-mOMjtBo2SwvQ@mail.gmail.com>
 <b9b456bc-beb8-769d-5f9f-e13b8860e659@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b9b456bc-beb8-769d-5f9f-e13b8860e659@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rhIswjDiNVCDxlsTMubb3rJx1vUrLUkp
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=68440817 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=7X0xE_O9oehTbdelYikA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: rhIswjDiNVCDxlsTMubb3rJx1vUrLUkp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA2OCBTYWx0ZWRfXx+ODVZLKoizi
 Hr+rpdF1oaP+tKIVbfLXm5L++LFQYR/AqXQ6tEiQCt/o4lnZNeVM7VryF7k9lfwr7SQ7wDXukvq
 tHeQ1s5aBY4klZ0O9k/bAui6cBCQpL71z+R8wLBKtzWREuSZm3JVioi+o6wmA99WDoC95zNHS3I
 tJh78M9YuQuPhq83SOlOmFxp8DVO6bl9fnDm+5mA1ZI7SYiJnTZood/UP1Y+5SXiijee8IoHyLh
 DSwu0lVd4AWRP2DGiIycyzxW7GazbOA8U/7TBuWfFlmnTlNcQasMz9BJZhWLSlZPNCYvXXpVRfm
 wdKrx8XF91TMTp+7DLAoQ4o17AexSOTSP7sxIgLd9TUBV8SLlktkwua8XcVnG9HLUaV6gTiZqr8
 n1JOyJgqpzU7R19neSCg73gjl8IrfU1YtKbMdJ75Ol+MNkgQSJsHFLT0A6vbJTv8YhEpvMxV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506070068

On 6/6/25 2:14 PM, Vikash Garodia wrote:
> Hi,
> 
> On 6/6/2025 5:29 PM, Arnaud Vrac wrote:
>> Le dim. 1 juin 2025 à 09:46, Dmitry Baryshkov
>> <dmitry.baryshkov@oss.qualcomm.com> a écrit :
>>>
>>> On Sat, May 31, 2025 at 02:22:00PM +0200, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> Fill in the correct data for the production SKU.
>>>>
>>>> Fixes: 193b3dac29a4 ("media: venus: add msm8998 support")
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> ---
>>>>  drivers/media/platform/qcom/venus/core.c | 10 +++++-----
>>>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>>>
>>>
>>> Verified against msm-4.4
>>
>> Hello,
>>
>> The current values are based on
>> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-vidc.dtsi
>> which we've been using in production for many years.
> 
> I see -v2 updates these to 533/444/.. MHz [1]. If the value changes based on
> board variants, these need to be picked from board DT instead of driver then.

I believe they don't (although there exist some SoCs where fuses determine
maximum frequency for a given target). We really want to move off of in-driver
freq tables but that is still in progress.

> 
> [1]
> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-v2.dtsi#L1140

Arnaud, as Vikash mentioned, dvfs tables and some other magic values may
get overriden in socname-v2/-v2.1/v3 etc. I'm not a fan that downstream
leaves irrelevant information for old revisions in place, instead of
simply replacing them, but what can I do..

Unless you somehow came into posession of v1 SoCs (which I believe were
totally internal), your hw has not been stretching its legs fully for
all this time.

Konrad
