Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595B128F95F
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 15:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751298984; cv=none; b=QMaqcWvtLhs1qYpN1YYCpiQr/X+8xqFeRORqc4YjmKECOqWUNmHX3ya5G3VtSBTI+4yEYE/70Uk100h6PBLHfN64EetDBMrUzNLGd4bP0SSwuqrxk6DK6Om9uujVKbAQo59MHIZ0WDW82BHKbni4IOOWqLT5FrGhLbEzHenAWOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751298984; c=relaxed/simple;
	bh=zGLBBCS69S5bewAHvIuxxbqOURYmkIJvrgkWVT8V734=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T+DxcS6uNmjvlyvuZaWNx/FjDWHJC0FJ6VUwH2Va5/V02AlNNuURCmiO0Spr4TmQTQYL88B7w+Asr0U0Y/IYZJmQQrzwMadipHUp6yiA/qOEtTpYNefe+8cbYENRh73S+8tCL9ongQBoRsPxcXlhLRAuD4v/qs7rySHqPnq9l+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F2tLCm6O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F2tLCm6O"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UFgavN002217
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 15:56:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D0Fl5LewKcARD32i6DxdJAAOcn3ZiRpvJ9i+gosfreA=; b=F2tLCm6OVgJ5uM3o
	+7t/kkc3XyFSQA7vLg6R3KpOKbVMDK2sDZ3waa1SM22IyjoviFRGFE8XzamBmUjY
	PU2acpGUm+JVTTlD4DbAz3S2kKKuX/2bmgMViYatB+qa2B0pHlC7pELi0v3NxToO
	9mVK2iBNj9RjGVM8SfBmRUo3TnRBk+V42xUV+Ct+JToMQ6XgpyFx0e83x6w8ufNz
	TsETeG4+G+b626dPwfu/xheR9fUlvdpAgxfv0cBNKE8eLjpoE1VPNxhSY7JHeK+I
	3h+Vzsslh0KL/PsFIwBpfhtU8oLnqkczSgV4Ns5G7J7stufuHVwTI5Z5Pa6pStpI
	4Ah0IQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcn96u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 15:56:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3ba561898so41379985a.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751298980; x=1751903780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D0Fl5LewKcARD32i6DxdJAAOcn3ZiRpvJ9i+gosfreA=;
        b=gjysfzbfqEiAzfUPA/GN6JDT8wdJ4jUcPyiF2YPovevCpPYama7smm+gRfsIziDVq1
         ThMoSIgFuuKSQsfQFe7WrE6M6D4KWWiB5smcWXIXWfZ6kqp02iO6duErZOBip6Byo99f
         +DJMuSDj9qEexg7x1C/BnL1dLEYfkF1h7O7fxwXhc4nhmivtK+EHlgwIao+dmgYA/z+U
         zr7nJEHThs6X1GLLUDxKO12hrpOY2wMDkDnLT9eZJBRFlMF1L++2v7T2TYVEBEDSI84n
         +zuITznREzwJvvu9nrB91Pz70+cipd+MJBwdPdP+mO7zh8uoki+zZASYh6HRq5Q0IV+v
         v5SQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhYhCY+BF7LEAVW5Ss5elFGGO8tJc0spQiTcrGNVTJEf+QlVdf0dpWEQaqqZJnCcPGKO/aEa3WsyJmXzM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfPfL9VElrPMFaP7JpxGDxChX2P0rHz0IlaWoiBrV6rG+SUtlg
	7Hk2/ih+nDbOlEGEUFqhB8YRV0G4ZpO1Ca0lOXZMLXkqcZ8jlwtGNPacOp5alWcBDFjFhH6J4UG
	euJ50CZnVQEWt3XWKgjUVbfGnkqyFqhyN7MRQ3toDve/AzZpsnZwDKLFFugRQA6rioVDpDat3sc
	Q=
X-Gm-Gg: ASbGnct6FbuVILB/AU3CUVHZzquFx8ItX9xfgW0vb228H0EtXhkH2MZu4ji4iygTrNg
	DYmRU3DhRCCF2fYhD+Voy2wD9EC6y/GrMpXZ20fs1LlDT5dZ7ps1LU3pqIhAL8mtco1AqfJ25L5
	EfT1tLiNTcHsu7WMeyUaACASB7QL4hgOZ3BVeleFmqd/nj96i4wn01m7sVA/3ipF1QzphmbdRx5
	6Glbbw/RLKFUScrgqSdzBk/wYd1Cx3XgQ11rPC2l1b9y6pAvJoW8d/aMJHFgFD9r2X3j8u/FMri
	0S+utTP2E8mXue34hxRmLp0M0UuQ11SewakFTioVVy67l2ukyw7DB+h9/dKfYeZejA+RzNjeywg
	mHgotj0f/
X-Received: by 2002:a05:620a:690d:b0:7ce:e99e:bc87 with SMTP id af79cd13be357-7d44c21cdd8mr551567885a.6.1751298979917;
        Mon, 30 Jun 2025 08:56:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmRmTmwWyC/XAvDEJJwe50p+zxnhcywcSEGqHClp/yN/qqSKZwbpDjpuECX6rKycQCNqvXGA==
X-Received: by 2002:a05:620a:690d:b0:7ce:e99e:bc87 with SMTP id af79cd13be357-7d44c21cdd8mr551564485a.6.1751298979335;
        Mon, 30 Jun 2025 08:56:19 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae36ffe2981sm484430166b.120.2025.06.30.08.56.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 08:56:18 -0700 (PDT)
Message-ID: <aaaa42ed-989e-43ee-8d45-2908f52e8584@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 17:56:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ci: Remove sdm845/cheza jobs
To: rob.clark@oss.qualcomm.com, Doug Anderson <dianders@chromium.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20250629135843.30097-1-robin.clark@oss.qualcomm.com>
 <92314f06-e6a8-4882-a31c-914438d7761d@oss.qualcomm.com>
 <CACSVV01AUOp7vZ7kLt+gwxvfv4CYLtAQg6MhUccygbi1NpVJMg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACSVV01AUOp7vZ7kLt+gwxvfv4CYLtAQg6MhUccygbi1NpVJMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dEdvYND1rtT68m-nSTG7Xrb4ZF4o57V4
X-Proofpoint-ORIG-GUID: dEdvYND1rtT68m-nSTG7Xrb4ZF4o57V4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDEzMCBTYWx0ZWRfXzAKtE0yDhD64
 9MSP8YUaqOV2pp55I9ihWWN9te7Q7PsGJUUra1uqjU0Eoo/uC7pIVa4kbdNakukOEJxXyfsBU+P
 RU+H/DCAFvr4KDj91g3zIFimzTKZcxPrMJ6MXh+tUxGKqu1mTNJhwTUCv4l9K5OCVk/e685Pf9O
 cZmHVWHitVKuPBbnSXpCvEhoYNsivXBgN/8UZpMac7ryuUbs3TBesA7lrX6kk0qjXoqf4qBgNlH
 pyN6hayH9JwQ9Otmy9Gy/xRfF10T5jbxAzbEVFKY4y2hxTNXaUrd3k1ls4vCmsXC+zKMMrAeCXL
 /jkZvjj/kbNE4LipvkNTu4TqWRaW7aLqvM1dxQG/rWv2MDB7owwfa6w1p21txsgj7mRsy3T5jRu
 iahQ3w4UXQuc+xRDR8VilJhp5mc/79q9FATDS/COctlfJEMyx2xsdnaXSCxN6+NvY52gpltW
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=6862b3a5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=_ijeUKsmqluwEKimemEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=806 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300130



On 30-Jun-25 15:46, Rob Clark wrote:
> On Mon, Jun 30, 2025 at 3:34 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 29-Jun-25 15:58, Rob Clark wrote:
>>> These runners are no more.  So remove the jobs.
>>>
>>> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
>>> ---
>>
>> Do we have anyone using cheza at all anymore then?
> 
> Probably not

Adding +Doug +Akhil +Jessica, if we don't have any users, we may
get rid of it upstream, as it never made it to the outside-outside
world..

Konrad
