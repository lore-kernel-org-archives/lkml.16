Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9257D1A3177
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747938467; cv=none; b=SCD6AKQfQuTPobfskbND3h3nU2HRpO1OMC2RzYjAWytjhE25WllolKYqbkTlH61COganTDkTEtUVUGJlD+jV2HTrJxxQ6pT0Hf3iO2lqofWmKsSO9XsWNGPk3uUsHqJ7whcFR91DJdlIcCZxDTsC+TjWDvVLShDfl0oTWCPHZg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747938467; c=relaxed/simple;
	bh=90ncrHPq0WkQH+mcKwnVhATPI6o7eYzzwEzKBc1Sy+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=smjujS+LEK2ALjSJffC6Xl0sjRFfDcNmBo1AtPVDDeURc+r+j0xAwJtiEwxPDj6a5Jc/pNqu2pejC0/pkfF3L1bdiAHbu2hQVPn1wlK75b9KehvfXjwAyRV78LlLwbpwXh7KyQ/Ul/HuptPUiE+3AAMpcgavVFSgJBPJ+uP9ykc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pGB6YJYQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pGB6YJYQ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MGx5Qn016872
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hOrF9E8CNF5vlLwhBRViPzs4wkn4nhSUt6uMtZCC7vc=; b=pGB6YJYQJkP9fY2L
	zUY10/qSo0CVCT90WxzURcQt6+cOq9tOpl0/dsiXUNSQKKwCP3kT40Zj9SSvH61w
	BuWlQ5lAmIjEagvSt22BMM/qPIPLRrUlsiMI9GWaGbCiRDReWUSqA2KNgDpnoT9m
	bysdRs+r2L+E1bPIH3/P8TGoZk9Xg63rjwBqH+kOPVE6iqAcxMP03sccEaX+g62x
	r1lykroU2uxqIjDQlpK0y3ZxPMv5vfJm0mTxsp3xYHz6zc10G7XyqZRjrB2AhPUF
	6Da8dEZQ/iv/p+78ANCrhEJxV1ChrwAA1P7FCYGuyiWQEBaM5HUyTBleh7XB3ZDO
	M8cePg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9yb6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:27:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5560e0893so102927185a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747938463; x=1748543263;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hOrF9E8CNF5vlLwhBRViPzs4wkn4nhSUt6uMtZCC7vc=;
        b=dyH2rp10u6DKEHjMfIaAJsrf+tFzzZVJTk6hBxExvZ+dCX9jsUG9tyOMnn6wL1sDO8
         Ru0xGVE8czYpNNtS8/s8kQKtPpygvzxNJyMDBv914RYSUoV4W8MQLrQqiRv6Wm9CyQKr
         lJnEwFJ8Sw3xA6wG0KhA5Eu7YHJcvZmuJ67Z2FOWSIy72kF6Vz6FkQhZADm9FEEc/dOM
         5l5RF9Zgmxc9NKtjJLWgX2WJar0zcRD1YDRKVQ+LI99OaCLinQeyE6C1Ocv8uwg9Zpt+
         4IwJbRsULrkCEosVxhvy+8BEmgUNwL1cB1ZNU2JEr9TR6wp4VhroqrJt9EqdtfxH5Jka
         aocQ==
X-Forwarded-Encrypted: i=1; AJvYcCWL+rvFRIo3qvMvHTw1FQH5uLg23F9htXrQm2Oi0eOknd+vSIKZHlPEUa86OD5q2KvsIs6uDO+fjF8VZjc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+Kt2coM0NOAGFLyPNNepcl5slpxhBMkX9UMav1wnDmOMVAl38
	Z7sMMegV5VGg69zNsaAwyEyl0XvUdZUrFwCp6X3tjk110TO+SfStztDfJRK4UWjJpFgqTsziTxz
	eI+Jg3zyXEToT5OYc0iuDzDYFV/s8A+/b4n8bbviVnQ+q80hKoOMqA9O01z+NwIKYBiE=
X-Gm-Gg: ASbGncvStiRyd1VRv8rZ/iCDdW4KIlmxk+Z33dgkEqv/tbmqfP0SlrbLYY91HNwEqsn
	4Dgkg7edoCh1RrJIff/agl74i19PxwhO+g9snjTHgwss+RfFtBZeK4MZ+BJETRG92ja9utrdvBp
	Np3G8MeVk+PssFBTbgnVAPeqB57ncnUWXSNcFeZnrFeRKA3Jj8KNKdf/EK/FIdB5pMs3WkT4lug
	GuRXb9XSokviUMgBJfveC1v5yvP6ewMoZ7gGLkbufzVQkOH8ctK+AeKcdxzRnEcuzTXLvW3RExM
	lRxosXUWZcr+huFZYFrwbePO0N18iu+ART+YmOkzxWaNunJ0hP1pL+d4ElV8CTQHaw==
X-Received: by 2002:a05:620a:4895:b0:7cd:14b:554b with SMTP id af79cd13be357-7cd467c0835mr1615267585a.10.1747938463346;
        Thu, 22 May 2025 11:27:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTe8t5T5NSz6dLcr0sJ8GGMWZ97eW+iTjSb5vi0a3UVu8a9oM0pBbOIdvvH24V3l33eMPuXg==
X-Received: by 2002:a05:620a:4895:b0:7cd:14b:554b with SMTP id af79cd13be357-7cd467c0835mr1615265485a.10.1747938462938;
        Thu, 22 May 2025 11:27:42 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005ac336d5sm10975351a12.54.2025.05.22.11.27.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 11:27:42 -0700 (PDT)
Message-ID: <76071cc9-b052-4628-9890-239b0acd260f@oss.qualcomm.com>
Date: Thu, 22 May 2025 20:27:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sc7280: Add memory region for
 audiopd
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ling Xu <quic_lxu5@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com
References: <20250516110029.1637270-1-quic_lxu5@quicinc.com>
 <20250516110029.1637270-2-quic_lxu5@quicinc.com>
 <uzyxagnmxz5tsjy32mfro2alwdpcq5kybwzcbsysul7u6adgdf@x7katw7eme6u>
 <b90ee18a-5e88-4c36-a623-ae9447c53a46@quicinc.com>
 <2mu3bncxoq57rxi22dyd6ys2wa5n3wmtadfvixozshxgenutai@dlkbqgplzrrd>
 <46caa88e-790b-4733-83bc-75ed6c7ca2d8@quicinc.com>
 <CAO9ioeVoqQhDhBW_fVU8kkt=3trV9YhEDUO0izdf8cuCDqU4Tw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAO9ioeVoqQhDhBW_fVU8kkt=3trV9YhEDUO0izdf8cuCDqU4Tw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682f6ca0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=Tk2dPFrPTpK508hYUygA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: AeevXxMEK4ljdfMoMXePmKYr8BSvBidk
X-Proofpoint-GUID: AeevXxMEK4ljdfMoMXePmKYr8BSvBidk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE4NiBTYWx0ZWRfXyzmcb184Dcib
 +XeqSYr0SN1hpAsCUklWcJa0E9Xvx7SLHXgb7qeB0nCX0npgAYjdORO3SKlYhtGps44/tAHxXw7
 yGTw5Z6hWFVGgvvzkCQ5qDewU5Z18PAvptocxNsWcZR+AZ7kia3ujem7CyvBq1854Wsk/bR3AeM
 ovxTSMC4Z1kPIu+O7F+7R92LSi/zyB8o3mVVRvGsbH5VXFPTWLBlTYaoxTsOhfDvbF4bdXoYb11
 en4AxwXXc6h3AqCOPSStrVsK0lUPC/YtSpTqdgPn6Mg8j+yG/9+IcGdDlmxtj9cL6YL69TevSPV
 cQxewuVw0yXgo9G9pJFgn4E8zxZNGlq4ZR23sel0kj1jvLJ5BiPj0xwOtTPaznodfNkKjluEvIx
 s3piXLtqB1g3z7sWqMhPzM6RXfZG8nwc0k7CUexALocmTf/Our6IEEa+sGV3K8ih0ucWpY+F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=934 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220186

On 5/22/25 2:16 PM, Dmitry Baryshkov wrote:
> On Thu, 22 May 2025 at 13:44, Ling Xu <quic_lxu5@quicinc.com> wrote:
>>
>> 在 5/20/2025 9:53 PM, Dmitry Baryshkov 写道:
>>> On Tue, May 20, 2025 at 02:41:22PM +0800, Ling Xu wrote:
>>>> 在 5/17/2025 5:47 AM, Dmitry Baryshkov 写道:
>>>>> On Fri, May 16, 2025 at 04:30:27PM +0530, Ling Xu wrote:
>>>>>> Add reserved memory region and VMIDs for audio PD dynamic loading and
>>>>>> remote heap memory requirements.
>>>>>
>>>>> Why? Was it not working without this heap?
>>>>
>>>> yes, it will not working without this heap.
>>>> Memory region is required for audio PD for dynamic loading and remote heap memory
>>>> requirements. For more info, please refer below patches, it has provided a more
>>>> detailed explanation.
>>>> https://lore.kernel.org/all/bb68da04-ef52-4172-8b6e-f4027bcc2786@oss.qualcomm.com/
>>>> https://lore.kernel.org/all/effea02f-6ffb-42e9-87df-081caafab728@oss.qualcomm.com/
>>>
>>> This triggers a bunch of questions:
>>>
>>> - What is audio PD?
>>>
>> Audio PD is a protection domain which is running on DSP for audio
>> specific processing.
>>> - Is it a required component?
>> yes. it is needed wherever there is some audio use cases where
>> DSP audio PD dynamic loading is needed.
> 
> Which use cases?
> 
>>> - For which platforms ?
>>>
>> For platforms that require dynamic loading of DSP audio PD.
> 
> Please be more specific, we are not playing a guessing game here.
> 
>>> - What happens if there is a memory region, but it is not used by the
>>>   driver (SM8650, SM8550).
>>>
>> It won't be used.
> 
> So, what happens? DSP crash? system reboot? blue smoke coming from the SoC?
> 
> I'm asking all those questions to understand:
> - whether this is applicable to previous SC7280 platforms or just RB3Gen2 / IDP
> - whether this needs to be backported or not
> - whether a similar fix should be applied to other platforms.

I wouldn't worry about FP5 too much (albeit it's apparently not easy
to test it out and even having spent some time trying to, I couldn't
figure out how these things connect), but the chromebooks may be
potentially problematic. That said, we can overwrite it in sc7280-chrome
if necessary

Konrad
