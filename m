Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEED1A935
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 17:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738345030; cv=none; b=JodnQs+/sp2MAGJvI8DH/zA1PFaG343+hmEMYWW0ugE3SOyGBRoFqGSPWcx+THlJM0A/JXY8bPy2ApxSL2C5ho4HcMf06cHklS6muhxy8hfFd9xQvrB7CVkqazqkidp/Iqol1vE6EGTe+Bn348n03EABU+ZhYKYyDPNHWALGdEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738345030; c=relaxed/simple;
	bh=tUhgj3Op4C3zJnMtoncgJVby1UBvFnDWGNfCuzPqMwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UsQxj14Y3sYm2X0GZN3q2Y0Q5jSjfZaDU+fWNVWHwA4U/lZrcXTQ3XgVZv8t7Z7Hwj8vcoQSKUe0YsBAziNH6sUtVc845y/QwWksD2lLIpkY0/t16QjpmYxS7131YcH1UoyUIfLSDDfmNi7mliy6gJFEJgcEOlu5kc/anHmh2dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Aj9dtgNx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Aj9dtgNx"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VC5ArE009058;
	Fri, 31 Jan 2025 17:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JlyWWoaqManYp4NBBs29vxmHB0IAjl7medhoT6jikzs=; b=Aj9dtgNxBsDrJdhN
	7yGm2xQXHYnxPLoQIl3Mm4Mn3VMRBJSUPIfiSh0jF/BgqrCKLB9QfMCrbljNRFf+
	m/vXoZlqCXFwRgHjp4JD+WNBKWfffOmWhDB1pjJus805em4xef5micJjjZ6yfZBL
	PGrIDDaxEGTbNiwHWfE4ot+qCPmAXQ9A/6MRF2SDKhD1MLXgO3IJNwzEgojM1fhT
	GvQjzG3RDJbGZF9U2hEwMRNnn+fNlFOysKuufrz25AzYzpR2svQ6aLxEwENTqEW+
	JokjniR/rUDpy6rtQIxUhYpDluk+tmZ4uXVWGoIATIZB/xUZICAq4G0rfYMg8isP
	M3qICw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gx76rpg4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 17:37:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50VHb3FG031532
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 17:37:03 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 Jan
 2025 09:37:02 -0800
Message-ID: <f89025f7-8db9-19d1-53dc-4eb5899db5ce@quicinc.com>
Date: Fri, 31 Jan 2025 10:37:02 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel/amdxdna: Refactor hardware context destroy routine
Content-Language: en-US
To: Lizhi Hou <lizhi.hou@amd.com>, <ogabbay@kernel.org>,
        <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
        <sonal.santan@amd.com>, <king.tam@amd.com>,
        <mario.limonciello@amd.com>
References: <20250124173536.148676-1-lizhi.hou@amd.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20250124173536.148676-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lGddXgvG4y70PVNS3zF22cjoVk2JaDlP
X-Proofpoint-ORIG-GUID: lGddXgvG4y70PVNS3zF22cjoVk2JaDlP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 adultscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2501310134

On 1/24/2025 10:35 AM, Lizhi Hou wrote:
> It is required by firmware to wait up to 2 seconds for pending commands
> before sending the destroy hardware context command. After 2 seconds
> wait, if there are still pending commands, driver needs to cancel them.
> 
> So the context destroy steps need to be:
>    1. Stop drm scheduler. (drm_sched_entity_destroy)
>    2. Wait up to 2 seconds for pending commands.
>    3. Destroy hardware context and cancel the rest pending requests.
>    4. Wait all jobs associated with the hwctx are freed.
>    5. Free job resources.
> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
