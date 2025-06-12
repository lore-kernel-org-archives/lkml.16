Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5141F583D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 09:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749720781; cv=none; b=QsvQDjXUbh8ORosP0U5kfcjRzyFtxOR1Fh4uS3sQG0ELbLGlEYl5Fl890H+3pV0eXMgNJxTbWphZMED+DB335/O1ekGYgeEvvQPcu09fTa0h6/IdPOSqR9Dgy+TLHqtTcPcSXDl7K3Tvzr2qaho2XIgtibTYHFXvyIkpNtxO6HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749720781; c=relaxed/simple;
	bh=8OFSXBuTsZph9YN+58NxpHuks3+eLbATc8hv+sy8Q10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HYF5j4hvhXm1e1jQEwN9iTyTJZdECpsmFAmpHTjym15JpPNU//eSixj1c9GDifleR4kNBNchf/e8CHzQ/avMCQ468uVaF4gQa+iNe5kRa2/UOeVjo1v3TWACEkwx8bc+agj0/DpdV0AhXgdotbhTHLoPOrHz7jhS0oZA41zZTHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UTFB5yAN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UTFB5yAN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C84vgt010994
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 09:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8OFSXBuTsZph9YN+58NxpHuks3+eLbATc8hv+sy8Q10=; b=UTFB5yANkhxQnK/+
	u4XlrbwojEQZGU8O6bL/ADIUk/FfDawPzIH3KzJv9u49STGGvvOhqEs0NV9GOoSX
	1KtDD/EZf3NBXoCHtQF/TbGBr1OatXIW1jJ7cC0M5UZTmb67zfyP1Vm1EmMV9Dil
	LVSzbI+j3rjoMeVuQFFZPxy9qeB343jH9uYL+8Y99Ffh4d3tP68FdfG98js25dhz
	WfYBUbTKBS7e9WXAhiSq3D/Fl8FQPtJUycVHFf5RNXs5rWeNlGnVGAa3SE4nPY9O
	nNwBtX/Er7l53SY97NR+103zO65hfak7orbG3rLS5cyymUyzUIh0GT1Kxi3/fLEz
	V/neLA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpyp70-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 09:32:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235842baba4so6640125ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 02:32:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749720778; x=1750325578;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8OFSXBuTsZph9YN+58NxpHuks3+eLbATc8hv+sy8Q10=;
        b=DVud4BWq5jhhV3r/w3xDg0WeVhaez70eRrgoQNmFd3AZpUJ8jzZkNB5Nl2Sz0Otj9/
         mq9FZOoZruqtSDBunqEz9hubzYMuRtBL+t4NmO8XeJaaJPuJei6bf7REgv/O4IJIIVv5
         DeXU8xf4WDNHqTJxzxptmC2G0vM2aZLgkXNLP5V5O6KVDPL+fHJAuLUSzg4cRFZC6iaA
         qiZa7oU8Ez10yicL92jYF6MRoA+JbBnFwR8w8MHHUsA++cXPeZEO01Aofuu4mgfVA7au
         2Ki//eYotgdXuV9ykMz7DYh4meaQ9NCG+B6Q6c8J5hYPwM22Bt/pBlmPDJ37cIkBDK1y
         71eg==
X-Forwarded-Encrypted: i=1; AJvYcCVWp8S2cMK13a5Tl1XGCy8q570XeuACSoKqkg3Jqgb7ONzKLMSo6JJva1wLeeJJ7+O2HJfrLxXrG/XDqLU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh7sLScCzf0d2dCkKrX+iZ07rnmAobSAoLumxXUQK8MmoVVsb0
	fMML1gEXk47UCzdWvGwVtQCODgye4sde4zUC1BEwhNpcQOa8AlwvSsjOcjsLwTC1Jf+NvWjo8lj
	MXNwBw4w3eF3HeoEnFlQF1JCwxDEryqfo7gDnYdtMdY9JSYn3u8wjI3c8PsZY2OrlUFk=
X-Gm-Gg: ASbGncvRxPybZz0Zrkuk1BdTBkT0FxtFpVx8dAd5w5bd2hOZDtSvBne68R6CbLHvXZA
	rOrTd2aCky0KvgSmvGxYkMG0GNMT3roU7v8Y8YF46yo367zmooGRzYcRlOXqLyrYvmvaf87BMgL
	MIlbqKc7577/eLLPSDiB4NLMgRHQLtjZsB4ZuUHgz5/jDu7+8pJEt+pnDW+oRQfFMcWRVFixTBZ
	IDZSWDoXl3EZsU//UupOi/rxnuRP0x97DTi6iB9SS203keQ21GYrpe9/ySd7RiLVFPvA2sVa7IU
	JtsedENhTIs7oSWIkzPyvxZw1BGMvHCu9FBkD8PzeoYs9YsN
X-Received: by 2002:a17:902:d50e:b0:235:eb8d:7fff with SMTP id d9443c01a7336-23641b1aa64mr108573535ad.28.1749720777922;
        Thu, 12 Jun 2025 02:32:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3YB0/88oPhzctSwvZEmnLkEwQuSYwYdDcT17qqG5HyuttcfCBbQFmrpEr+WXA62Dq5W9B9g==
X-Received: by 2002:a17:902:d50e:b0:235:eb8d:7fff with SMTP id d9443c01a7336-23641b1aa64mr108573005ad.28.1749720777504;
        Thu, 12 Jun 2025 02:32:57 -0700 (PDT)
Received: from [10.204.65.175] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1bdc89esm1132256a91.19.2025.06.12.02.32.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 02:32:57 -0700 (PDT)
Message-ID: <7505f0e8-222d-4052-8614-c12109d14bce@oss.qualcomm.com>
Date: Thu, 12 Jun 2025 15:02:52 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] misc: fastrpc: Add missing unmapping
 user-requested remote heap
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-6-ekansh.gupta@oss.qualcomm.com>
 <22uccyp5m2szry7bpitqcav5nlvwch5eqh4mdacfedidgrnyhx@vsjobngwdkmb>
 <dc67df54-2a19-4318-acd4-b96b8549b64d@oss.qualcomm.com>
 <7ogkoxsowpd2x5qmjog4qx5eu4eiinvtnyjz5hfufgna2hz7na@oxzmowlnelxb>
 <61dd2c3f-20ac-484e-8a45-f42fd5f42b86@oss.qualcomm.com>
 <CAO9ioeX1uE3ty5oSezYOLJKqf8G5dLYAS5nRiNvryWTk0RPdEQ@mail.gmail.com>
 <f3d376cc-6e2d-4ac3-88f6-3104eec67acf@oss.qualcomm.com>
 <qw64xqfnyy76f6oawtaecvraejcwyml5k7oxdy67adj2rh46lq@nupxbuy3vwu4>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <qw64xqfnyy76f6oawtaecvraejcwyml5k7oxdy67adj2rh46lq@nupxbuy3vwu4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=684a9eca cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=QnOT__A0hv9WPcCiwtcA:9 a=7Od4JLvlTNRbCQXB:21 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA3MyBTYWx0ZWRfX/TRqP/vkMfxI
 TfgMKY2BbGCo3AizgzkXZzcOOVCrt2da49z4f6UHuzfIfXt8s8Q/eTB3zvD1IvUXEg1Z8Qx2+JU
 99B7H/0ZsVsjD7Ziwsuy2MMmEa12A6awMihMsrrAM+5SFMvt5+BDRXumKVhqdcCSaCfTQx689kd
 FDyIG8oKpA6Tzc2CSwge89pWsCAHNK6a/aQzIFklLiBdjlIafb2D6UsnIv4hyThb+7yCSZwe9tb
 58HD3K4cufqucwMi+joYcVNYvkAraiyYjNEQKznWsakpxfDpn7nvyb942FtGbI7vwvz/k7BNkyX
 FN8toxd1PH768i5L79Mnk6DiwB0cHs8QlTPYtDC4dEeOsT/8Wgw7684e2yjssRdyaiUROij+EoN
 GBIVOQNmJ/7iD4ZINnCfeLISSPzGKiWOFNmQXJu2cz5um9W+EBLlWWm+91//SpIjEfdL13aZ
X-Proofpoint-GUID: GYnOkXmadNGfG1zdewhjbyXEkOcEGi0A
X-Proofpoint-ORIG-GUID: GYnOkXmadNGfG1zdewhjbyXEkOcEGi0A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120073



On 6/12/2025 1:35 PM, Dmitry Baryshkov wrote:
> On Thu, Jun 12, 2025 at 10:50:10AM +0530, Ekansh Gupta wrote:
>>
>> On 5/22/2025 5:43 PM, Dmitry Baryshkov wrote:
>>> On Thu, 22 May 2025 at 08:01, Ekansh Gupta
>>> <ekansh.gupta@oss.qualcomm.com> wrote:
>>>>
>>>> On 5/19/2025 7:04 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, May 19, 2025 at 04:28:34PM +0530, Ekansh Gupta wrote:
>>>>>> On 5/19/2025 4:22 PM, Dmitry Baryshkov wrote:
>>>>>>> On Tue, May 13, 2025 at 09:58:25AM +0530, Ekansh Gupta wrote:
>>>>>>>> User request for remote heap allocation is supported using ioctl
>>>>>>>> interface but support for unmap is missing. This could result in
>>>>>>>> memory leak issues. Add unmap user request support for remote heap.
>>>>>>> Can this memory be in use by the remote proc?
>>>>>> Remote heap allocation request is only intended for audioPD. Other PDs
>>>>>> running on DSP are not intended to use this request.
>>>>> 'Intended'. That's fine. I asked a different question: _can_ it be in
>>>>> use? What happens if userspace by mistake tries to unmap memory too
>>>>> early? Or if it happens intentionally, at some specific time during
>>>>> work.
>>>> If the unmap is restricted to audio daemon, then the unmap will only
>>>> happen if the remoteproc is no longer using this memory.
>>>>
>>>> But without this restriction, yes it possible that some userspace process
>>>> calls unmap which tries to move the ownership back to HLOS which the
>>>> remoteproc is still using the memory. This might lead to memory access
>>>> problems.
>>> This needs to be fixed in the driver. We need to track which memory is
>>> being used by the remoteproc and unmap it once remoteproc stops using
>>> it, without additional userspace intervention.
>> If it's the audio daemon which is requesting for unmap then it basically means that
>> the remoteproc is no longer using the memory. Audio PD can request for both grow
>> and shrink operations for it's dedicated heap. The case of grow is already supported
>> from fastrpc_req_mmap but the case of shrink(when remoteproc is no longer using the
>> memory) is not yet available. This memory is more specific to audio PD rather than
>> complete remoteproc.
>>
>> If we have to control this completely from driver then I see a problem in freeing/unmapping
>> the memory when the PD is no longer using the memory.
> What happens if userspace requests to free the memory that is still in
> use by the PD
I understand your point, for this I was thinking to limit the unmap functionality to the process
that is already attached to audio PD on DSP, no other process will be able to map/unmap this
memory from userspace.

>
> How does PD signal the memory is no longer in use?
PD makes a reverse fastrpc request[1] to unmap the memory when it is no longer used.

[1] https://github.com/quic/fastrpc/blob/development/src/apps_mem_imp.c#L231
>

