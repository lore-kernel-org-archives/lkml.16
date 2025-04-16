Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EC3225390
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 19:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744833293; cv=none; b=rTdC6+Nz84GEFMrR88lR3h3V5EiDDVYEEhUnXm29Qs3pa/6U8hK0vIl7NBdAigamrajKXR/HbPpZM9uNophrIDHG2ONJgkpa8S0Fr31FdfuGYfeax5FTsx5JfOCs/29neOyS2lzOq62KBpETW4c8ERo1Fr0VTtn3HT9cFCbH1K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744833293; c=relaxed/simple;
	bh=UnjEKaAwKTEtDaCYnG44TvlHj2XPzZ1wrYhnoD26JF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RFrdx1skT/KJnGVHsLtvstSuMy7FCCea3an8c/ui2dFpF3BTMY3Mg1b9wLNRoZuv9BbbrBwuamziifOXDelvdlY6zxu+nXgqkaTQyQgkGXrazgVwIsH0YtnzjeHi6zLznn0SNk835XUDn+hGlgXdXw0Fv5xFwZdnsVFQGluiyfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n06wiRZH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n06wiRZH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mjGs007820;
	Wed, 16 Apr 2025 19:54:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UnjEKaAwKTEtDaCYnG44TvlHj2XPzZ1wrYhnoD26JF8=; b=n06wiRZHqtIm1oZd
	kjAc78dHq11YF7W6bgB6MJNabCAP7d3lj7owOAaq3ciiAH8V2mj9Hp3sX3aX8KoD
	vEHgWp5Qo4W0cmVJL6HPIaAJx9aly4VAggWFRt4/i8bS3i4357ogWqjTw9IOELwO
	txn2kSyzlNavmEbxeoTmQel/FIHtOltP+S+vUn/51YOYkVWm5biYQQyo7V8K2ldr
	cOAxvVZL9GVKx+LwQud5HCPIEzmBZX0O65ony7TqC99rO+dD7LnZVyte88e88XjU
	AZQgV8tWmoBPb1FWAvTW8wx8vtFkJYpHza2Hh12mxCqcdiji7XEqELflx51J+zJH
	jJPWLg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6mrr3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 19:54:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53GJsfdj027392
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 19:54:41 GMT
Received: from [10.111.181.123] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 16 Apr
 2025 12:54:40 -0700
Message-ID: <b25547ce-f16b-4594-baf3-afb0346c90f2@quicinc.com>
Date: Wed, 16 Apr 2025 12:54:39 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [greybus-dev] [PATCH v2 1/4] staging: greybus: replace deprecated
 strncpy with strscpy in firmware.c
To: Ganesh Kumar Pittala <ganeshkpittala@gmail.com>, <johan@kernel.org>,
        <elder@kernel.org>, <gregkh@linuxfoundation.org>
CC: <greybus-dev@lists.linaro.org>, <linux-staging@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <hvaibhav.linux@gmail.com>,
        <pure.logic@nexus-software.ie>
References: <20250413073220.15931-1-ganeshkpittala@gmail.com>
 <20250413073220.15931-2-ganeshkpittala@gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250413073220.15931-2-ganeshkpittala@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nR_WgbeSUnXWSUjpVrwTEIaNtdBRLRRC
X-Proofpoint-GUID: nR_WgbeSUnXWSUjpVrwTEIaNtdBRLRRC
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=68000b01 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=o4_jF1gwsiqNhuO3VYgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=D0TqAXdIGyEA:10 a=xa8LZTUigIcA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_07,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=582 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160162

On 4/13/2025 12:32 AM, Ganesh Kumar Pittala wrote:
> This patch replaces the use of the deprecated strncpy() function with
> strscpy() in drivers/staging/greybus/Documentation/firmware/firmware.c.

Review:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

Especially:
Describe your changes in imperative mood, e.g. “make xyzzy do frotz” instead
of “[This patch] makes xyzzy do frotz” or “[I] changed xyzzy to do frotz”, as
if you are giving orders to the codebase to change its behaviour.

