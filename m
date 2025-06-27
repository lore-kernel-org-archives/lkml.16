Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC09298241
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751027619; cv=none; b=XrcTmg1GBVh8ZaVkwl06PYiuenTxGb+/50rXEMRH9G8pxyNPA4GXYmLFijliv1p82jZ707jYbIOvGcVCvyuvarIP5UqGJg5/L4G0TejR+FU2DymFbh2kMdFhpbmQRVflivHBVoMhT8m0Qs+dL+kln/w2O1H9C+rHI2UXm6Jgplo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751027619; c=relaxed/simple;
	bh=/z8OZm8i5By5aSp6kmEY29YnNMR2FD3gRy9aasC6SLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dNkgyF0Ba6mq1Soryt2gt99RSPcWUiXi+9CdOCcIEfQ4zTdpObiwx7owoEEC1nmGIixBUBdKdOgdNhTQW9PkAlE76d9Q59qwqX7t8fceQmeXKkruntC7oG2KzAoau4fys9pBqmbhKl/kRxdqEssEkPdEyrKAC7dIwMNi32cSOvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YmzTnhGA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YmzTnhGA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RC6bVc018804
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BXdS20jwqob7hyB8EL/DVXzC/VS+NAh0WftNCte1qv4=; b=YmzTnhGA9Nd6hsbv
	hly+kxubIDbOxUvViHunRMXDvLjmB3EXJSUpv51ZycWMcm6xYsn8ZIWCm2qfN3ZH
	Y74gbEMi/vhf1ioOThPOK5Vszo0fOLxvWsoQd4lujICSMtiXhZ9ml+azKH9gu9Oy
	82hkNumCxEM0G1QjiU9YGDZvX756dUrLp824mzBs70LCSmQFkO+GCiX8vPCRCdQe
	UqzHOVFDLOiZr1NAebERl+vdFsG9JjbPXquanIaWlax1iYnXj1flnA4OLqqF5MAv
	BZDDx4Vpp7Muxvajyg+mOPiO0i95h0BVmKPmmtQ24U5UCfUoXGABpjj5X91PQa9F
	6RxW1Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfx552e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:33:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5cd0f8961so365468985a.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 05:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751027616; x=1751632416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BXdS20jwqob7hyB8EL/DVXzC/VS+NAh0WftNCte1qv4=;
        b=mOG5Ju3vSkXYsYk7SQRxqnSDc12Vs6/GAbIgFUqG7yf2nY5kcyaPi87mWgpviGEJIp
         RLOJHQgsMYTEI/Dl3KWfD28filsOdW9syJc1jq7RvWBi7B75ek0cdGyh34hnSU0b2krU
         vAvVL6tJujkSyj+yatVH4pj2HeQdM2zvTBRYmRZDvdjyLhRWjPRGa+FC54dgTeVKJcK+
         eexNcl1D6F1NwoLDHa0fP8+tixsFwXeosiBtvu+YEW11yJQ3u+e22uGOquNxcRWQR96Q
         /RZ290drjjt3zPt6Am0fYRc1vanNNhid3KYRnqDDaUHiLNhzGwgUAv+z67hsVdctAY3K
         XLNg==
X-Forwarded-Encrypted: i=1; AJvYcCVH+AJE/S2rKE/wkxK4D40O0ZMybqVOVD4dTxg1tWH/pm6APzQOFJ4hvd+sk6KaDsfN9aDnEXKr9GVt54M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR5FulL6sxiTtMKz9TeHY+5c5HQj37XfjD7SFvILPaEdPSrPgd
	0Nuw61qE+v8YhyFOqYWapYkbMTaVr5mZXhaoPiKddH5g/egE/b84qliXGgrxT19WF17Av6X+kur
	AqUAdZzKlwbsO6pGJ5fed0DmIKPNd8Zk4LV2hPhR43X12nPu50w3szh8B5RhFJnOBPBg=
X-Gm-Gg: ASbGncuQiXovE9p6/cfSmKQUWGNVa+VUqEHh/1hbn4ny46Aj2Ns7+eJTE15XHqRPWpi
	Z9NtvRyJDdSHkANm464otYGlaUvgia8GQ7IZt4bieu+WceNB8YBRGSv8GDp8UDs1MLAKv3HvBe/
	QHb4u+FKejndLX//s16chQqCJgzHmHC6JcoX8HXqKk+pLB2RcrbA8a2WLfPUPaZDAwuFOIW3Bt7
	IwA6ko2M/IYAUmGC/mMJFu9yHB/8zxnkpj5EZSbJLFLkbgecxMefiLmw/bI2aWlkwCMVhj7hIMo
	87qQMEquQGvuWBw0ogH7lK0O6Tetuyp9L0+6sdW7TVBjNWmDpsR6l7Nso7elAnAh0ECJ6Ayj
X-Received: by 2002:a05:620a:4891:b0:7d2:3db:a4c0 with SMTP id af79cd13be357-7d443973399mr407200385a.41.1751027615464;
        Fri, 27 Jun 2025 05:33:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFs16+j4Gol7ebRhR8zdcRYF6YNDJ3HXtdtuy6BCc73JijHBdyCsj4BxBxJzpUck0KcZdd8+A==
X-Received: by 2002:a05:620a:4891:b0:7d2:3db:a4c0 with SMTP id af79cd13be357-7d443973399mr407196785a.41.1751027614925;
        Fri, 27 Jun 2025 05:33:34 -0700 (PDT)
Received: from [10.185.26.70] (37-33-181-83.bb.dnainternet.fi. [37.33.181.83])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b24d283sm441299e87.64.2025.06.27.05.33.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 05:33:32 -0700 (PDT)
Message-ID: <ab706b24-1dab-4fc0-9e37-fa1ecbd97fda@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 15:33:36 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sc7280: Add memory region for
 audiopd
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ling Xu <quic_lxu5@quicinc.com>, cros-qcom-dts-watchers@chromium.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com
References: <20250516110029.1637270-1-quic_lxu5@quicinc.com>
 <20250516110029.1637270-2-quic_lxu5@quicinc.com>
 <uzyxagnmxz5tsjy32mfro2alwdpcq5kybwzcbsysul7u6adgdf@x7katw7eme6u>
 <b90ee18a-5e88-4c36-a623-ae9447c53a46@quicinc.com>
 <2mu3bncxoq57rxi22dyd6ys2wa5n3wmtadfvixozshxgenutai@dlkbqgplzrrd>
 <46caa88e-790b-4733-83bc-75ed6c7ca2d8@quicinc.com>
 <CAO9ioeVoqQhDhBW_fVU8kkt=3trV9YhEDUO0izdf8cuCDqU4Tw@mail.gmail.com>
 <76071cc9-b052-4628-9890-239b0acd260f@oss.qualcomm.com>
 <fd2vic3g5jjk22y7yv24mtwr27ies2my5lih3zfj6yw4zd2obo@artndh3vepbb>
 <c609cafa-5970-4694-9b6e-b5536df72eb7@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <c609cafa-5970-4694-9b6e-b5536df72eb7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -HLIbqHCcQRL1USPt_FxRvZ8Fo9Yv07M
X-Proofpoint-ORIG-GUID: -HLIbqHCcQRL1USPt_FxRvZ8Fo9Yv07M
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685e8fa0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=a09MB1VsJqAZHPW3esczKA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=R2xQUvtixtji6bILba0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwNCBTYWx0ZWRfXwWsvnkh/OHgH
 j4O+dTFD1axu5AwqfQojD59NRZJLTGAqaqdcDD6GhZMoZnE/AkI/yJm02i3fuUSOiq6aenVIQkM
 2O4+cHYZq1z2fXl2tkRnQiI9YPZ8RWqlZGqQFDU27gaVpL3zmc5oxhc6cjbiOcL9y3+MqifuOVk
 aUWlkhXmN/jBCc++AMHDMnZ0ef4PE2PYiPvS6UxacBdPEwrzYV8WfDrnbY9IK0H/6Q14GxUQgsP
 AdClZJv9oqSo/dMGKLgMJs1o4A6oO3xPJdz/AXmclRxdAuSPDYedL0L3+/dGI1bVUiPUxF6jxZ6
 CsP5inar1fNgVAdnIAljnzB+eeEbv40/AnQQriuYpGAkLmXN4DKQqorelpIBQy1omTGapsZa9eT
 srmBUjuex0wFAAU/dBmP0pFiIPXDYVK0K5X+jUVK/4C9Z3oFslPKZJ4UfX6PkPDJul4rkD0n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=661 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270104

On 27/06/2025 15:16, Srinivas Kandagatla wrote:
> On 5/22/25 7:51 PM, Dmitry Baryshkov wrote:
>> On Thu, May 22, 2025 at 08:27:40PM +0200, Konrad Dybcio wrote:
>>> On 5/22/25 2:16 PM, Dmitry Baryshkov wrote:
>>>> On Thu, 22 May 2025 at 13:44, Ling Xu <quic_lxu5@quicinc.com> wrote:
>>>>>
>>>>> 在 5/20/2025 9:53 PM, Dmitry Baryshkov 写道:
>>>>>> On Tue, May 20, 2025 at 02:41:22PM +0800, Ling Xu wrote:
>>>>>>> 在 5/17/2025 5:47 AM, Dmitry Baryshkov 写道:
>>>>>>>> On Fri, May 16, 2025 at 04:30:27PM +0530, Ling Xu wrote:
>>>>>>>>> Add reserved memory region and VMIDs for audio PD dynamic loading and
>>>>>>>>> remote heap memory requirements.
>>>>>>>>
>>>>>>>> Why? Was it not working without this heap?
>>>>>>>
>>>>>>> yes, it will not working without this heap.
>>>>>>> Memory region is required for audio PD for dynamic loading and remote heap memory
>>>>>>> requirements. For more info, please refer below patches, it has provided a more
>>>>>>> detailed explanation.
>>>>>>> https://lore.kernel.org/all/bb68da04-ef52-4172-8b6e-f4027bcc2786@oss.qualcomm.com/
>>>>>>> https://lore.kernel.org/all/effea02f-6ffb-42e9-87df-081caafab728@oss.qualcomm.com/
>>>>>>
>>>>>> This triggers a bunch of questions:
>>>>>>
>>>>>> - What is audio PD?
>>>>>>
>>>>> Audio PD is a protection domain which is running on DSP for audio
>>>>> specific processing.
>>>>>> - Is it a required component?
>>>>> yes. it is needed wherever there is some audio use cases where
>>>>> DSP audio PD dynamic loading is needed.
>>>>
>>>> Which use cases?
>>>>
> 
> Usecase is for audio compress offload, ex: when we play mp3 or any other
> compress format, we need audio pd support.

This needs to be in the commit message.


-- 
With best wishes
Dmitry
