Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7091621B9C8
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 11:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749726994; cv=none; b=DazcRfR3i0VGtl/KeL3HMjxg99ayg0uElGbORGIn8IWv6K1uvX/A2AwwX6n6p573VKLCRQXH9zkVEDL4ZwqE+YlE0i2bqnBkX+SGhKvO0SnfQb+A4LljMYt96lp/+THA66kdrnGI8Pys8hPmhesXeD6gvRDGf/IcII07H3mYQx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749726994; c=relaxed/simple;
	bh=xqZxgl2OAyvQcplDI+Q3mDj5cWFNafK3ReG88eVTAKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G+a4FnCbukuDwEiBcQAKPeZyzquT7r4QbOVwkJ1SXp5RlluEbk/NGyEd691+BNxx5ukHhOWwOxHq7m2qm9phuLwKpp/7A7K2f2oPv0R4e85DTucXlQ1kZtR4g1yuPTd2DjaYgzdB0ox3EPBvuDFUdBQeouNsIdjyyvsNcgCk5vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kGRlwwLt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kGRlwwLt"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C7fRVl029304
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 11:16:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vpfX2NMeoo7UDS517K3UcKESErQZe/+g/3vF2bOfmOQ=; b=kGRlwwLtyi3yroLp
	vPcTrdIh6peGLvQwI3oLukBUag1AnQQzJTzFv5o+A6t9WdNSRrJjsNI5at3wiOjd
	uLxRB7QPEOVmypLuI0zx3FbFSzHqFtEg8ita12yT3ivdVNiKNPajb1W8LC5YNvdq
	3F1Ts3TxQWS4nIc6u7brkDlyp0Sod5YwZxmv4vUJXOTuveiDeLbd2bngNPQGfORP
	Uey8wAkryAzw5UvIoPaVZPan6wZWAt0W6ut0Rmp/9SWDfFuE114auelY8QVe8uc0
	Q4J/0hz2/12L36B1NXCTfg1K6Of3gkxtlLldIpRQ3j7Jnd9eqROIy6vhhWQu5hGP
	HWu5UA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn6g98s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 11:16:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7caee990721so207228185a.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 04:16:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749726990; x=1750331790;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vpfX2NMeoo7UDS517K3UcKESErQZe/+g/3vF2bOfmOQ=;
        b=kFvgLqLg33BS1ynvmFZ0tJVzv3os1ec/oswf1IUEEmvU9g/i9h9T34bRoAa7jcakda
         pmjRuXfeVsfLw09ch24GJhwmje0xEovmRMlUh8EQQsHh74DEc1PGGpf2JMLrGLk1bivl
         vp1tG4h0Sslc7SRDQLMMGqsJNkqo7SJ9A02ZP34HGpTlGDgG431iemCuiZ9r27MNnm9N
         dxDnBETjZ4FZj56IuZoMjSw7ikrHMrV+s+h/f3SyJF70l720wWyK5Hr+ZrRh39NRu4A0
         ifG/k0oMDFobHQszpCsIv8LznLdYdbXqymMiqmsgyBdLJxd3r6SblVRO3CNhvKaxBzuq
         CpAg==
X-Forwarded-Encrypted: i=1; AJvYcCWs/35WptlPkkJyzeY8rjyTfeNCaOpZDDNkkx13BAyg2MSCiOG/l8kdz8d0xwXglrjtBUao43dwznfV8c0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIyqeKzX9kOALCuw6/k33JQh5Bu99s32R7nluV1gxwy3k2sbN0
	s3oopvk4kYDt0+vT5nf23DG2XrlEzY338kAfkrrFmht0FlcI4ezkPjWwo887DSDcSYLLP0DO81k
	OKPAlScis619YOJsOWerAM4TURD6T4qOQUeOVay73tWUWQ+U2Hjwi90PoBueau56kAOI=
X-Gm-Gg: ASbGncv84jT+MRcshfVIDVVjGvkTujuwbOdTVAs9ho5XlnCBTAu/okeq26xKmQqcUt5
	oZoixqfoBUXewnpnxAkevvDl7WXZgffnT1qgx4mQjmabiGdv0eoMK9IBa5PQbjXQl6gjuHK+eVK
	dVC8XV1GO7QOcJHmi9Boas3G0PvCuEUzT+KvA+3zLUNl3kVaRTVRtshx0bohidrnp95HgMByX3B
	rI9Nyl+Y52LgtIH+7QvyAeGGVtfwS/1/Nc+5RgJIHSJtd4kfeLI3Ag9cvTG/KWZ0BHsskFs1kQ+
	WG3I4UAA1dAdCDCJ76M99+qxJvKbWVx3SlLsY+IsA2i7vZoslq++Kep9vo37qJnoNvmj2Z6QLRE
	0GLfYhyK+nuPBhA6ursqO+vdE
X-Received: by 2002:a05:6214:cc1:b0:6fa:cd9e:7fe1 with SMTP id 6a1803df08f44-6fb3464a613mr35975686d6.24.1749726989972;
        Thu, 12 Jun 2025 04:16:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHetYtA3HieDljs7UJWghv1brQVUM/Q0GTlBER+BwKf79FavNV1DFHrP4isixdHDMlhem16WQ==
X-Received: by 2002:a05:6214:cc1:b0:6fa:cd9e:7fe1 with SMTP id 6a1803df08f44-6fb3464a613mr35975096d6.24.1749726989420;
        Thu, 12 Jun 2025 04:16:29 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1aa036sm77231e87.128.2025.06.12.04.16.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 04:16:27 -0700 (PDT)
Message-ID: <aaae04d2-8f1a-4aa2-8f02-9b46d5a35207@oss.qualcomm.com>
Date: Thu, 12 Jun 2025 14:16:26 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] misc: fastrpc: Move all remote heap allocations to
 a new list
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org,
        Alexey Klimov <alexey.klimov@linaro.org>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-3-ekansh.gupta@oss.qualcomm.com>
 <sgfcaujjpbvirwx7cwebgj46uwlcvgr4cgcnav5fmwmjsf4uku@iytanuqqiwxo>
 <71eb4b35-51a3-411c-838d-4af19631325a@oss.qualcomm.com>
 <tdae3jb7zbkbzvk546j5jnxnfkeux2bwrbz3i5gsehecj65n7v@2hseuptlk2a2>
 <999d2ca0-b3d3-4fa2-b131-092bef4951c8@oss.qualcomm.com>
 <CAO9ioeUW=v_CBUchJEt3PArbzBbUgznFO8TK-j=2yUkv8S1Baw@mail.gmail.com>
 <bddf894f-1d79-40b4-9f80-355746c122da@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <bddf894f-1d79-40b4-9f80-355746c122da@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA4NiBTYWx0ZWRfXw1MZkF64Ab3B
 0+E+9obqpURzZn1R/RNlhrA+JtOA0LPXAbSwq3/zR3+I7665FuQM+FbaFEkO2t4cb42/5XpEvnU
 vZ6bC169KHWgPxilnhsLXGj9R06+qUg0xuNthbU1rQOV9evJNKTvU567Pt5QJvXof6DhhbyrGTV
 4hQMc18TjN43CiSOtTPQiAaCZ8ii3Wt4eVp3KGS6IWR16YhtD+IUIyLPohLXyP921FtpnlUKPPB
 OHC2SRntmJtlPCjo3rijvHdooUkjW9pXExjuqAKg80HO7uoN7aDdymRqdEuWHZxeZAB7dKcOK/v
 1UM0jGBfPH/g4bC3Wha5+zsDRwrlqt9L7pJ0velC7AxH7Rx155BCJnMNWq1iGmzM4hBMwi0nnP/
 eA7oAsbIYRhxcp8qXikh+9W6/XL7qcU22ky8ErPN/e3I/R6wNkXKkUF7NZ5gWUSdDEKm//8A
X-Proofpoint-GUID: gdiG_JbycKR4fPzJG6PvouOuGbElaCQE
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=684ab70f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=D513OUjRMiX1TR4FSfYA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: gdiG_JbycKR4fPzJG6PvouOuGbElaCQE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120086

On 12/06/2025 08:13, Ekansh Gupta wrote:
> 
> 
> On 5/22/2025 5:39 PM, Dmitry Baryshkov wrote:
>> On Thu, 22 May 2025 at 07:54, Ekansh Gupta
>> <ekansh.gupta@oss.qualcomm.com> wrote:
>>>
>>>
>>> On 5/19/2025 6:59 PM, Dmitry Baryshkov wrote:
>>>> On Mon, May 19, 2025 at 04:36:13PM +0530, Ekansh Gupta wrote:
>>>>> On 5/19/2025 3:46 PM, Dmitry Baryshkov wrote:
>>>>>> On Tue, May 13, 2025 at 09:58:22AM +0530, Ekansh Gupta wrote:
>>>>>>> Remote heap allocations are not organized in a maintainable manner,
>>>>>>> leading to potential issues with memory management. As the remote
>>>>>> Which issues? I think I have been asking this question previously.
>>>>>> Please expand the commit message here.
>>>>> This is mostly related to the memory clean-up and the other patch where
>>>>> unmap request was added, I'll try to pull more details about the issue
>>>>> scenario.
>>>> Thanks.
>>>>
>>>>>>> heap allocations are maintained in fl mmaps list, the allocations
>>>>>>> will go away if the audio daemon process is killed but there are
>>>>>> What is audio daemon process?
>>>>> As audio PD on DSP is static, there is HLOS process(audio daemon) required to
>>>>> attach to audio PD to fulfill it's memory and file operation requirements.
>>>>>
>>>>> This daemon can be thought of to be somewhat similar to rootPD(adsprpcd) or
>>>>> sensorsPD(sscrpcd) daemons. Although, there is a slight difference in case of audio
>>>>> daemon as it is required to take additional information and resources to audio PD
>>>>> while attaching.
>>>> I find it a little bit strange to see 'required' here, while we have
>>>> working audio setup on all up platforms up to and including SM8750
>>>> without any additional daemons. This is the primary reason for my
>>>> question: what is it, why is it necessary, when is it necessary, etc.
>>> This daemon is critical to facilitate dynamic loading and memory
>>> requirement for audio PD(running on DSP for audio processing). Even
>>> for audio testing on SM8750, I believe Alexey was enabling this daemon.
>> Could you please point out the daemon sources?
>>
>> As far as I remember, we didn't need it on any of the platforms up to
>> and including SM8650, that's why I'm asking.
> This source was used for testing audio use case on SM8750:
> https://github.com/quic/fastrpc/blob/development/src/adsprpcd.c
> 
> The use case tried by Alexey as per my knowledge is audio playback where dynamic
> loading was needed but he can give more details on the use case.

Okay.
You need to be more specific in the commit messages.

- It is a normal adsprpcd.
- It is only required for compressed audio playback.

> 
> He was observing failures and panic which got resolved after picking this patch series.

Which failures? Panic in which driver?

>>
>>> What is it?
>>> - HLOS process to attached to audio PD to fulfill the requirements that
>>> cannot be met by DSP alone(like file operations, memory etc.)
>>>
>>> Why is it necessary?
>>> - There are limitation on DSP for which the PD requirements needs to be
>>> taken to HLOS. For example, DSP does not have it's own file system, so
>>> any file operation request it PD(say for dynamic loading) needs to be
>>> taken to HLOS(using listener/reverse calls) and is fulfilled there.
>>> Similarly memory requirement is another example.
>>>
>>> When is it necessary?
>>> - When audio PD needs to perform any task that requires HLOS relying
>>> operations like dynamic loading etc.
>> This doesn't exactly answer the question. I can play and capture audio
>> on most of the platforms that I tested without using extra daemon. So,
>> when is it necessary?
> For use case details, I'll let Alexey comment here.
> 
> The daemons major requirement is to facilitate any dynamic loading or memory
> requirements from DSP audio PD. The daemons are already supported for
> different types of static PDs to facilitate these requirements(fops and memory).

So... compressed audio only or a normal playback / capture too?

> 
>>
> 


-- 
With best wishes
Dmitry
