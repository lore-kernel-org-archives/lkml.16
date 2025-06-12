Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB0518DB26
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749715564; cv=none; b=f/vEMe5GvrH8LKJRd73rmZZQNo0tRtv6PHQOCSL/O1M4x+O9/r5J9kYGVU1ZyBSFVa5KJ2hGaVW7EKSL/4FvD06HiSihZ+IIhsAzT1wXtfNK0huF2XE0aqMYC9jP2qyrfP7/3hvC6ePDGVuv56W6IZ2av3jGf2wVrbK+rrNLU/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749715564; c=relaxed/simple;
	bh=GEFxzDSmIx7mSLc9grOdHwi4rsiBtOIV3MQN45BvOzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sRLUdVNSIS4rD9XK8xPqJR/mIympA5m+YzKpJOr7uH3CaxytkQSbLBuW1s5oI3Ul+x0COvcRSP7/VW9lUYBaEXwNmQANRdYI+uZ69OIUPEat7jz3WDZ58rVjPg4+Hz0g+TX+5rKIaxDhLE/bW7XjwMu7SwnDjvMiM3nQn6GUwwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hWchK8px; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hWchK8px"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BJPZad019607
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gYLKSuEg9yfr55w0b30ljKxa
	Qtj5FKzqcidTfQG7b1s=; b=hWchK8pxGoMT2/EG1HZjedxu+PirePqVOZPXDA3W
	5N7W/ppp/7y8/AbzqgzDPXSdNpwsHrSHQJGKBLRbxnwUnH8oNqH64hMyR3QPlwAK
	qVnvLLcpuGey6Zu4mq0Vbg1QAeuAaXh5FFrnQxjs8sCHgYLepdSYHIic8NOMK/Zy
	XnU+CxuLkgojBgZrHS20tYzvntbOBCRHwvdhl2JUCOzIZhmEwR6hj25m8quPsmSA
	XfH15gFX9TXVHQNqsz+E9AySOg43qGEIbklGh745jjzoHPcuwaUBSXJoRH+jU9b7
	4Uqi7kCPVUW/4LXVPSae4TCl/RctH7klKLoaM8HJCgj9BQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcqqmc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:06:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5750ca8b2so107471185a.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 01:06:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749715561; x=1750320361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYLKSuEg9yfr55w0b30ljKxaQtj5FKzqcidTfQG7b1s=;
        b=fY2AZ+P0/+N8EOn318Q9Ub7xH9H5lQAY15AV+7PZGINVd+T1M53+IdxD8vNQfxjBxr
         gT7NiEA91/eFwBicYBhcXtkCFiPlGL/zOiEhzU5ZggZTURQpWsvlEcVbnLxtAHiT4Oio
         0L8BvNVT4PHyKTpwdlPV0zAmPGhgIJG61EBUH015eZFKeYdmG3RM19S0Dk/Yx8F1xihK
         dLjWttPiNyyQRjzeZRio9T/s8cS6EmyjhxtUkKkA+005l9HT4CG9TrTbAC9KHghCDFjA
         fYzO5FX5OYVHOpLojGgVFEGvotAadvRz8nZPEWhtgXVylXI9rs8Qx405+0wRCMv20CHG
         6PqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOk0hz8glAIRqgDOR/e54NQuqTjR+GrkTJ2ogKDP8b+bW+TAqhq1GxZZ4yObT5WJRC+NL1MrNfbYpe3sY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSvTid/mo5JZJJ+HCOTUWdXYAxagg50hIkyrD3vr0fQ5FI1wcq
	WZNQ319L6txHvwttZ7zAOg1DhJ7uiOu383y+h2+XJgHm2eT8IwUv/uLwKCPWjVOtZS0tY+lg4eU
	2zQ3gj6OdFI8Wrba2uhqqWbpGw12EDbgoo6aoIGUBJBW/oz/i4VlwQPUbQNZYh9E44m4=
X-Gm-Gg: ASbGncs2Owgds69LpmfkYQbzIzqxpUjkKYuz69FP487lSD1m80WdieIXDCu0DDdVnnh
	AR7nL8FBgP0PdEkvvwHJ6zoKxeHJ/VJHPwcxLRbA8NLZaCOc2627034l4JLuERe72kDx/symZRE
	I6/B5wN9DJD6qe0qJjOXNzRhY2mVsWLjHT0vH+p11boln6ucuDlWg0ssEPvqgef6jrIG6NkqVna
	rNjIBEMvkS0ZYQUzisMNzgs8xmZPSKht272PDP1orP6ez3Z/4SHL9R+QMBj/mZxbsekAaKwED8m
	xWAHvXC0Hao7dVKV3PM9uc13gwtssobRNHGaGT+qVcmEf8cZ31kcqzhwRxm7xK76XKI1rV6srmk
	D4sM/NxFnS/NoQRjMsLoPKJceFCk4QC7wS3A=
X-Received: by 2002:a05:620a:2d8a:b0:7d3:a6bd:93fc with SMTP id af79cd13be357-7d3a88e236emr679315285a.28.1749715560599;
        Thu, 12 Jun 2025 01:06:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtEx7/LfcxXUMv7FkqbwpLWknBCvl7pRsgiOfE3tIOvpsdV/K8xXm+GR9qDQXkbL/OA9rOLw==
X-Received: by 2002:a05:620a:2d8a:b0:7d3:a6bd:93fc with SMTP id af79cd13be357-7d3a88e236emr679311185a.28.1749715560158;
        Thu, 12 Jun 2025 01:06:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b3307ae32sm1370641fa.39.2025.06.12.01.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 01:05:59 -0700 (PDT)
Date: Thu, 12 Jun 2025 11:05:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v1 5/5] misc: fastrpc: Add missing unmapping
 user-requested remote heap
Message-ID: <qw64xqfnyy76f6oawtaecvraejcwyml5k7oxdy67adj2rh46lq@nupxbuy3vwu4>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-6-ekansh.gupta@oss.qualcomm.com>
 <22uccyp5m2szry7bpitqcav5nlvwch5eqh4mdacfedidgrnyhx@vsjobngwdkmb>
 <dc67df54-2a19-4318-acd4-b96b8549b64d@oss.qualcomm.com>
 <7ogkoxsowpd2x5qmjog4qx5eu4eiinvtnyjz5hfufgna2hz7na@oxzmowlnelxb>
 <61dd2c3f-20ac-484e-8a45-f42fd5f42b86@oss.qualcomm.com>
 <CAO9ioeX1uE3ty5oSezYOLJKqf8G5dLYAS5nRiNvryWTk0RPdEQ@mail.gmail.com>
 <f3d376cc-6e2d-4ac3-88f6-3104eec67acf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3d376cc-6e2d-4ac3-88f6-3104eec67acf@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA2MSBTYWx0ZWRfX7cQ86C1ESaNU
 07FfGdUOWhLl0l+XcqOnUsgRa3BsZhZ4Ow3sw4/a40dnz8fZ9FoJblM9pG1TDT9QmI3Lt8pr0u0
 RM0qmzMkBapgfwTmalHhZSadlhycQfIreN84776e1Zz947ZoLRe3j4PGGnih66Em2cjmB7eVYvM
 ntDAya9ZWsPHCbrTDoTHuaoN5hgbDaGr1D2P3rEK/eNLc/kKwTGi78s6pkkL8WhtvH/7BvQQzeW
 bAPv4OZJORKec5hleAq8plERnxc569EThrr/DkTqva+46cW9GhbNr+PzVCbtGOr4X2qv+tyiYas
 yO6kDYb6X3iowFB1YHHPUnc0+rtZK47YNBVOjIgK2mFRFdzDYS7HMtRvTRTZSvGWTl9740l96Rb
 EOeS2KKCov9OclO+nA/zUCjXFEI5Ez/iExXTv18Di+iyIkuYdU15WWpon7CoPHUUEZieQni4
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=684a8a6a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=QxY6PIr9u2238qDpXlUA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: iVftieHY-47-_CkPx-bwY1PCoPerVd0O
X-Proofpoint-ORIG-GUID: iVftieHY-47-_CkPx-bwY1PCoPerVd0O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120061

On Thu, Jun 12, 2025 at 10:50:10AM +0530, Ekansh Gupta wrote:
> 
> 
> On 5/22/2025 5:43 PM, Dmitry Baryshkov wrote:
> > On Thu, 22 May 2025 at 08:01, Ekansh Gupta
> > <ekansh.gupta@oss.qualcomm.com> wrote:
> >>
> >>
> >> On 5/19/2025 7:04 PM, Dmitry Baryshkov wrote:
> >>> On Mon, May 19, 2025 at 04:28:34PM +0530, Ekansh Gupta wrote:
> >>>> On 5/19/2025 4:22 PM, Dmitry Baryshkov wrote:
> >>>>> On Tue, May 13, 2025 at 09:58:25AM +0530, Ekansh Gupta wrote:
> >>>>>> User request for remote heap allocation is supported using ioctl
> >>>>>> interface but support for unmap is missing. This could result in
> >>>>>> memory leak issues. Add unmap user request support for remote heap.
> >>>>> Can this memory be in use by the remote proc?
> >>>> Remote heap allocation request is only intended for audioPD. Other PDs
> >>>> running on DSP are not intended to use this request.
> >>> 'Intended'. That's fine. I asked a different question: _can_ it be in
> >>> use? What happens if userspace by mistake tries to unmap memory too
> >>> early? Or if it happens intentionally, at some specific time during
> >>> work.
> >> If the unmap is restricted to audio daemon, then the unmap will only
> >> happen if the remoteproc is no longer using this memory.
> >>
> >> But without this restriction, yes it possible that some userspace process
> >> calls unmap which tries to move the ownership back to HLOS which the
> >> remoteproc is still using the memory. This might lead to memory access
> >> problems.
> > This needs to be fixed in the driver. We need to track which memory is
> > being used by the remoteproc and unmap it once remoteproc stops using
> > it, without additional userspace intervention.
> If it's the audio daemon which is requesting for unmap then it basically means that
> the remoteproc is no longer using the memory. Audio PD can request for both grow
> and shrink operations for it's dedicated heap. The case of grow is already supported
> from fastrpc_req_mmap but the case of shrink(when remoteproc is no longer using the
> memory) is not yet available. This memory is more specific to audio PD rather than
> complete remoteproc.
> 
> If we have to control this completely from driver then I see a problem in freeing/unmapping
> the memory when the PD is no longer using the memory.

What happens if userspace requests to free the memory that is still in
use by the PD

How does PD signal the memory is no longer in use?

> >
> 

-- 
With best wishes
Dmitry
