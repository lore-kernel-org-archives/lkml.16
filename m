Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFDE2E3360
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 00:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743466390; cv=none; b=d9/LbtrRy2Q8JAvTb3AHs5WIx2zCG3//7n+3TqhQdfM6M7AayRm267LyJHxK9nSGO8TyZzwiTVQosHKdmyculuR8mAMGjN3s8CLvOHqxX3kGWW/vpDJmgJW3hMPOJn5WjNkvhQCJQsa4HUsDyIWMm51uGiQVavLPlho0+qmX1go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743466390; c=relaxed/simple;
	bh=SsvoqDxf62eflQ7TZqg67WOK2f9rwJxjOAQSOXBPOPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sFATtqEZ+4gONV8T2Cbs2/fmnNhy6DZqBvRiTrBJlnuFcJWUDL7fbibTCSNI2cQiOOpBiB+exyhHLpC1BLdJLILl77kSSYrBSN+XilFL9H/dqyRloCVYMdM3onrEY85EHRni9v+MbrQ+gt4ArtiahR4Kve+cqo5RfOjxG3b5BJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LISj3Dtc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LISj3Dtc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VFCsUr025871;
	Tue, 1 Apr 2025 00:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I9CsQXCljYAEI4ooaI8R2MI2V5Ea03tYX+haiN1yBCk=; b=LISj3Dtc4ums0pyw
	3DXyxp2BqreXO7+UVrtZ7QDIebaYhk4xf8vzA+4HbvLUqi01Nn4K4XNlq6CHZfEp
	se3VXjeIOkLokIPwxo+vCNqoZj0GY34rd0WJnNZndCy74B+VIjrhhDUYfD0XD6Bd
	9CykS7kwfCcD7dV/iOov1NJgKRqc++aTbCHV+OK9GztAZF7BhnbKvq9QoTmVuOZJ
	DEoyvFwm95tHp8jbyCnHH0Xdn43JDTAhDh7NNN+e8k9nbh5Ob9zJJQPDh9qvGQ8F
	BhqT855nNIF0tWGf+FML0fmxV6xvfGuZIqcM9iZxv5y93zH5ed9GzjMEYWPbfDro
	p/FV+Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p6jhp51h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 00:12:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5310CrHC018670
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Apr 2025 00:12:53 GMT
Received: from [10.111.180.55] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 31 Mar
 2025 17:12:53 -0700
Message-ID: <5773d200-1d9d-4d6e-b01e-10d962ee9e8e@quicinc.com>
Date: Mon, 31 Mar 2025 17:12:52 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [greybus-dev] [PATCH] staging: greybus: Multiple cleanups and
 refactors
To: gpittala <ganeshkpittala@gmail.com>, <johan@kernel.org>,
        <elder@kernel.org>, <gregkh@linuxfoundation.org>
CC: <hvaibhav.linux@gmail.com>, <pure.logic@nexus-software.ie>,
        <greybus-dev@lists.linaro.org>, <linux-staging@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>
References: <20250331213337.6171-1-ganeshkpittala@gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250331213337.6171-1-ganeshkpittala@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NXDJnbNn600e-UQ6vM-iqUuIN2VIfpIo
X-Proofpoint-ORIG-GUID: NXDJnbNn600e-UQ6vM-iqUuIN2VIfpIo
X-Authority-Analysis: v=2.4 cv=bZZrUPPB c=1 sm=1 tr=0 ts=67eb2f86 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Jb6bjuR1jG5_EaSFLQYA:9
 a=QEXdDO2ut3YA:10 a=D0TqAXdIGyEA:10 a=xa8LZTUigIcA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_11,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1011 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503310165

On 3/31/2025 2:33 PM, gpittala wrote:
> This patch includes multiple meaningful cleanups for the Greybus staging driver:
> 
> 1. firmware.c: Replaced deprecated 'strncpy()' with 'strscpy()'
> 2. sysfs show functions: Replaced 'sprintf()' with 'sysfs_emit()'
> 3. loopback.c: Refactored a large function (gp_loopback_fn) to improve readability
> 4. audio_gb.c: Split logic in get_topology() into separate calls as per TODO
> 
> All changes are tested and pass checkpatch.pl
> 
> Signed-off-by: gpittala <ganeshkpittala@gmail.com>

Please refer to:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

So it is generally expected that "gpittala" be replaced with "a known
identity" which is normally your actual name.
