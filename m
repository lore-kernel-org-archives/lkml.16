Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDC61FDA
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 15:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744386969; cv=none; b=LOMm/XA754T3pHnfWqjFrGsCMTLbkmHx91qrc/hBY9fY293u2EU82bbrr1hiiJHtQWbzKNENrNhKJPIZ2x9ls3w+alV6NdihQFBmbZnwHES7Sc4h6XOQo8b/GSO5curqIhwXDBgPm+zVAYzGQCc/XK2aKgXYmQ2XVuvuaDo8Mos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744386969; c=relaxed/simple;
	bh=GsT9rPD3N9zMwMshwrMuDSa0idXLLHsMuF+i8OR3cUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sHwy0B+fzR4EAmWw+2MU6KNhEU08kOm4jkMO5/u6eLWvtNBS3mSH5Z4GOj2ntIctwog+VnuS9CEW4Es2vsOo1YJ/Mlqw5pHCFuIWhPp70eiUgtwDWt5T6rGHVWFjlPO8PBRTSBhKbldS7wflmSIXAFlBoB/lkZtBEh5EHEFkxBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ax3oC57y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ax3oC57y"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BBk21f006879
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 15:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IvhKVowDhFsDOwnZ0J1pi+6ZtmcQtfP79gYnQ76SBSY=; b=Ax3oC57yIniGV62A
	GEfx8KJpxF7SpCnrY4LRJmCns+ympAjQXghr/5SHrZtz4pTqJ4MZ8f+hUUfyJYiJ
	BGDlBmcxwVnwC7I2UKU7wyQf4f9O4Lg7W8kWo7Ow8djqyS4gzu+TKt0ik4MPymet
	RBRG3we6uT7Q7JtfEGZIadeEbTcXWREFnFJGyPSgtf+w+GjgBMHlMNNbkW3hvUsa
	mxQn5HlxR5gWbEiGrI8wH+3i/pt40vfHPbX2jQJTt86q3l4Zd/lFsddYPXqidzDZ
	6hvfgVaig5MnQj5sUyHTsG0A4kNdUzJH9aVPiIF4+kQDWmyxkyrzV+3JHYkYNFvb
	fXXQBg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45xeh3kvy2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 15:56:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-227a8cdd272so19181795ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744386965; x=1744991765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IvhKVowDhFsDOwnZ0J1pi+6ZtmcQtfP79gYnQ76SBSY=;
        b=G749+bpFKxoD15Rs0WkbftHwEXh7LthEHaObntVTJWiKmasHPBZPAr3xjhXepbZTZ3
         7g0n9ngutpt3Sy6erTswCrNAWGhEqEsQ4UjLGwmyPY19M5w/6a3Zv0GF4fjiRZV4ZeZE
         HGvWbjUI1pNole0d2G6NoGeHZrkDQ2usB5OcQmkOjcVk0uKit4/ZMj1YTDGh2tdjtUh8
         pBB5ay3hE1YMxR25iaBY9FVOOW8oAHYw6JIJY5slW1ght0w+FKSv+oAa5ggUOUGE8oGm
         e3pyjrDiev0W+mtRJ8StD3+OITVfwLghk3xaSCJn1Jmu6Zdlow1K0U+0U/pCKLraL/tS
         K4OQ==
X-Gm-Message-State: AOJu0Yy7l/dJs9HwmT/MvkBhqdTLlls6ujqyzWt+BXV6BUNqFiBurTyx
	k3wbIdWVqWjVF5TTP03sfAGQAlB2aALMHIbnRVEljSoITOMRmio0YfTtZJ6QZZSaZrUfe04Rbfe
	A2TKL+SWc7iMdH51AYR8Y/6hlKi4SRO9CTbfCitxYO7UwK4cMRMB+A5INm7X+7B4=
X-Gm-Gg: ASbGnctymHkjlikJp9Z5rXhMH628Y81WRRDDdBGAhheX4cwqj9/gtawwoLr+zlS6YJ7
	yd2MFApDyblG6FI1bNWTNJlS13jd+OinMNVp9uBMbQKJ5mT+s5jhEESAww4GmaOhSmgh9koqnuc
	v4Iki4eorc9fBsOSTDQkQsc28VAh1lnXXhMilCcXmKX5SO4JGE2tiucI352vunZcv5J5lmpIO6W
	lBhSzFlIbWLcoFQPfxWQlxSwMlHxSLMOUso6IyHilEjfbf3Zw1vlA9FhctwUTb9wUK1JB0o3GEC
	WJTyNvD4m5RVeIQQq3XAKMLwrFtIqZijHsgroOjvvdoydEBW1oA4hNYtbOPC1w==
X-Received: by 2002:a17:902:ea0b:b0:223:64bb:f657 with SMTP id d9443c01a7336-22bea4fde71mr49467595ad.46.1744386965365;
        Fri, 11 Apr 2025 08:56:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHySzRO76XL/H38ow5Xz1Fbomei564/J+lCLgFhEA9M/x29ck+Cz5AOhsbIgCGup67gE23IhQ==
X-Received: by 2002:a17:902:ea0b:b0:223:64bb:f657 with SMTP id d9443c01a7336-22bea4fde71mr49467355ad.46.1744386965032;
        Fri, 11 Apr 2025 08:56:05 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b65105sm51370145ad.44.2025.04.11.08.56.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 08:56:04 -0700 (PDT)
Message-ID: <c954cb1b-7ba7-464a-a115-429c6085c8ce@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 09:56:03 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Fix incorrect size of ERT_START_NPU
 commands
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
        dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, min.ma@amd.com, max.zhen@amd.com,
        sonal.santan@amd.com, king.tam@amd.com
References: <20250409210013.10854-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250409210013.10854-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VbH3PEp9 c=1 sm=1 tr=0 ts=67f93b96 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=zd2uoN0lAAAA:8 a=EUspDBNiAAAA:8 a=MVSHWqWNM0uh__QEkt8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: aEh5cfnqtt_1KBEU_GAeWhEj0pqVhiYI
X-Proofpoint-ORIG-GUID: aEh5cfnqtt_1KBEU_GAeWhEj0pqVhiYI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 mlxlogscore=972 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110101

On 4/9/2025 3:00 PM, Lizhi Hou wrote:
> When multiple ERT_START_NPU commands are combined in one buffer, the
> buffer size calculation is incorrect. Also, the condition to make sure
> the buffer size is not beyond 4K is also fixed.
> 
> Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
