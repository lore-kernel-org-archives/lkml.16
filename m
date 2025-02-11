Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DCE2505B3;
	Tue, 11 Feb 2025 15:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739288200; cv=none; b=noe+arzyCX3oyzpngKm2DKdHGRm7WnF3oA+w5sr28SJqCZA59nzuZK/zWBYilz2+UU3CAa+eZ3PP2lQ3zBsev2v0pT/scWyRU3zx36wxVXzNO9KkyoBi+BSaO13Ez3UsP+k2XH3Utu3fPe9xDKvJnElgm3u27SF9xhi3MQbpnio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739288200; c=relaxed/simple;
	bh=cdS+RQxChcNBaUozaYiF6PS0cFF3cqIzDB7HHD32L34=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=T5MTS0qM1sBItQBBqA/dD6vdJnQ5SVGa+29uR4tYFj93BKSmrvIUjaRZoAxKschQLXw/3ElSVV6rS5LE0wYwfYZomVkuG6n0bMTCVMv/EioQ1MZAzAX49zHXs5ano1OIUNw/eIq7yvGLsQSu7PNyx7STIP3kdHErwPQs81qrbLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NXwELLWW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NXwELLWW"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B9su75023961;
	Tue, 11 Feb 2025 15:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	geASupeKeQGhVuQ+0D/XwXT7FpJw/7mdwC9f2X/fIHg=; b=NXwELLWW6USbfcIj
	3MWQ5yNjQM8mhTgbnqlxhNVnlD6BdgtWcyWIzpaH8URALzgwFz+mP+tjt18dC5RV
	7gBEZm8MAhivN9EIdwHJOESFbghkqOtCOQlQOC72MFDSEIr450ERmTgJMkKZz/NF
	sLjUkxVrSETUph/YN8kH33lLEV6Ktrwqj+Tooii35vRRJFgw8nClARbbJS8ECrrJ
	V5dlK5MfKjybgsd9+bO7425B2lLj/vkylEcC0RIR8r+c8nCX9sdxpHYo0pBeSlnL
	NkL3z+LiJb4UF9RHbXeeRIzCwcpfqDxeJUvjfW7wp8q2U7vvzcLymxzBRvvSC96Q
	E/qL+w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44r4b5s105-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 15:36:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51BFaSPF023065
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 15:36:28 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Feb
 2025 07:36:27 -0800
Message-ID: <60700ca3-8d9a-d284-d2d8-343d770ca384@quicinc.com>
Date: Tue, 11 Feb 2025 08:36:26 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2] accel/amdxdna: Add missing include linux/slab.h
Content-Language: en-US
To: Su Hui <suhui@nfschina.com>, <jacek.lawrynowicz@linux.intel.com>,
        <min.ma@amd.com>, <lizhi.hou@amd.com>, <ogabbay@kernel.org>
CC: <George.Yang@amd.com>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
References: <20250211015354.3388171-1-suhui@nfschina.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20250211015354.3388171-1-suhui@nfschina.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: N42MYBqoEO8bAG9DJgkixlcC7HJREoO4
X-Proofpoint-GUID: N42MYBqoEO8bAG9DJgkixlcC7HJREoO4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_07,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=988 lowpriorityscore=0
 malwarescore=0 impostorscore=0 clxscore=1011 mlxscore=0 bulkscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110104

On 2/10/2025 6:53 PM, Su Hui wrote:
> When compiling without CONFIG_IA32_EMULATION, there can be some errors:
> 
> drivers/accel/amdxdna/amdxdna_mailbox.c: In function ‘mailbox_release_msg’:
> drivers/accel/amdxdna/amdxdna_mailbox.c:197:2: error: implicit declaration
> of function ‘kfree’.
>    197 |  kfree(mb_msg);
>        |  ^~~~~
> drivers/accel/amdxdna/amdxdna_mailbox.c: In function ‘xdna_mailbox_send_msg’:
> drivers/accel/amdxdna/amdxdna_mailbox.c:418:11: error:implicit declaration
> of function ‘kzalloc’.
>    418 |  mb_msg = kzalloc(sizeof(*mb_msg) + pkg_size, GFP_KERNEL);
>        |           ^~~~~~~
> 
> Add the missing include.
> 
> Fixes: b87f920b9344 ("accel/amdxdna: Support hardware mailbox")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
