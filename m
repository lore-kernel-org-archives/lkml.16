Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D093A1CD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 00:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743466653; cv=none; b=uR7k5/7rnI/px39pzZH/UPToCzXe7iPHB2WS0rLk0gFs1D7fymIHgV9UCRFXakQK+d2WesfAd085uW6qVpBBbFpFucmAYFSJMma432C7O6oVpAOQLlcZ5eHZfKq3dnVskY6zX9/CyTVUgFxZ217qgsMy0Htuxs/MbSu7+K5ILkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743466653; c=relaxed/simple;
	bh=llBTAisqyOidyTYvFevjD97G6Jq350PBDVWT1qtGfe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=T3uXbi9D9XEsRrBZ2I19owsWe0xXv5fdE7L3uFbUftg2ebgYlBchX4aLO2t8rYdj1mITsJ50CT0cmM6Dmid1pgSveyG3He9TbY6mQSezn9uM4RR4t8N8TvYduKQwePPb19CbQzD725iIM6ZpNJPdNf2nD50rGYVVvR0s1ReB7mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=peSfyLyV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="peSfyLyV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VFCx7d007639;
	Tue, 1 Apr 2025 00:17:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pWf+aubKFbVlYI+VsLmquwJeB6ZKPlgud/1Pn+keFGM=; b=peSfyLyVdwqRqmov
	KGQOieE3z41dL+fBcGU37rjGC3q3t25BTyxD/2sF3ikRseeSxFu4kcQAvUwPGtNF
	xfN9sD8v+gc1HHlTBuPK1ww8GSRIj7y+5JbovAAL+KnPFyd1BGuA67sRKPiVIafD
	XH3bsL6kYHNMiABTmXFGr5zhEC6kzrMe+7Hm5Gd5MLplLOaDFRCm9mUyWNwCobii
	DNjX4NjcwT4guaWJp8hRO1OUGFrpOkM7yNl2pj+bK4W3cZzlD7/kbT7tOrUMUC66
	2ZselXOZN1fxcMlePEO4VH1qIkCUlObvST1cP/6sQtu69WaDh/oQ2u2DvblIeEKF
	AD9/og==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45pa1nwumu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 00:17:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5310HMoj011319
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Apr 2025 00:17:22 GMT
Received: from [10.111.180.55] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 31 Mar
 2025 17:17:21 -0700
Message-ID: <4f47df18-e98c-4f23-afde-3fa8e9fd0f86@quicinc.com>
Date: Mon, 31 Mar 2025 17:17:20 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [greybus-dev] Re: [PATCH] staging: greybus: Multiple cleanups and
 refactors
To: Ganesh Kumar Pittala <ganeshkpittala@gmail.com>,
        Alex Elder
	<elder@riscstar.com>
CC: <johan@kernel.org>, <elder@kernel.org>, <hvaibhav.linux@gmail.com>,
        <pure.logic@nexus-software.ie>, <greybus-dev@lists.linaro.org>,
        <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <20250331213337.6171-1-ganeshkpittala@gmail.com>
 <d683962c-e8b7-4adc-9902-483976197637@riscstar.com>
 <CALVXb-qDioGFAfmtJPu_jVR_5G7VfC2bDD_bvjicbrVZKkc=hA@mail.gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <CALVXb-qDioGFAfmtJPu_jVR_5G7VfC2bDD_bvjicbrVZKkc=hA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WAs377hhi2Z2IkrrkwWxXmTjQS2ZrgW3
X-Proofpoint-GUID: WAs377hhi2Z2IkrrkwWxXmTjQS2ZrgW3
X-Authority-Analysis: v=2.4 cv=MPlgmNZl c=1 sm=1 tr=0 ts=67eb3092 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=1O7B8se6RwbiryXEGoAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=D0TqAXdIGyEA:10 a=xa8LZTUigIcA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_11,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1011
 bulkscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010000

On 3/31/2025 5:03 PM, Ganesh Kumar Pittala wrote:
> Hi Alex,
> 
> Thank you for the detailed feedback and guidance. I appreciate your time
> reviewing the patch.
> 
> I’ll split the changes into separate patches as suggested and send a v2 shortly.
> 
> Best regards,
> Ganesh Pittala

Some more feedback:

Don't "top post"
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#use-trimmed-interleaved-replies-in-email-discussions

Also don't use HTML e-mail 
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#no-mime-no-links-no-compression-no-attachments-just-plain-text

Yes, there are a lot of hoops you have to jump through to get your code in the
kernel. It becomes easier over time.

/jeff

