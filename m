Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F951D7E35
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 22:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744323419; cv=none; b=Tb6JguYazp3U2Fc3er40zyCdG2O2OVY5lgTB8ptqLBNE7MqXXWUvgu0DYuTYYkzKpuiKKtNiw0+5PcrNaqCEWhlLTQ6vBANYjgndss7485zjacD9Puh0WYq7I8ns6rnZoR2f/b4rTcYwwe4WUrBw1P9s4gnfpPHDPnhAqucUnxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744323419; c=relaxed/simple;
	bh=HFP9qPj8dyOE3lqE3Pe0T3S7rWACXve/V2CTd1pqhCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rwxuyZ2IeaHzSLadcYbh5V9Q7Pz1VPb1nd01pQ7ojvV2DmQB9MU+B9IxOBPWYN230Ws3OjSbHpMWMRQkvZ8oV4w5TC9GIv25eog3ftGCMAOgNudj0jwOD05d2tK6u7/RSCzRKRzejsMH9MmQfcXNPLlvNZiqeERQ4nI+4uDA36k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fsCz9ImP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fsCz9ImP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AD2jA1006870
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 22:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SlD2Zoqck4pcF7VZMBOHU/52fauKubtGQptlE1KvI3Y=; b=fsCz9ImP98FsJt01
	ASFcaidgTI8xN0WzSjLgQk2ozYggU+2fa2BXmRSCgo3b9J67QXlm03nEChTMn6mK
	Bo3cpQIsU4gwA+Ls23trtcC0TGgdrDoQ0r1fC18gAqpfHejLjXu5l9LI0kpKX/di
	lxWxmnHK6r7PZrYLv5Ro6WZTZ7Pp1VddGk3CVqqG8w7L0380ZxgcJfclQlaadTRx
	guB/S+VXx5JlGHgUB8gjSjlPqPz7BKcgTAS/9rznOWIQMk+fFwKXXFN3moMrYKLd
	jyoJcrY3hHioBBLdDczXT8iPgMW2iFfM/qxB46DYQWU2yoXmPdZHt1MTe6LcnkeB
	sM5JnA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45xeh3hg1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 22:16:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff52e1c56fso1540582a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 15:16:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744323415; x=1744928215;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SlD2Zoqck4pcF7VZMBOHU/52fauKubtGQptlE1KvI3Y=;
        b=dItko2g/nnBMpaLZIbUQeWbHYjEOp7NkpY3LfBdi2bq30EP5P/uR+XpaCCTIZeOO5H
         Ig+0mynXXK6SplLpOGwn/Tanv/BA7q23WDoPB8KMMX23wEEONOYIkJT2/o4ikTlj1ka0
         rD3DAC/y4MGEvY4EG2ZE1StxuhksBmwvdAUPNrRayORKaYsudsZWIqxEBCKbOUgRM9K8
         8AljKIJpFMol9tu66TGt+aIX4a/Qcwi+0YK3L8UyvtI6fLHKwls9gUyHrptyMpACkhXI
         5RWsEvrOUVlSnxdD2i1LRVAlY9e57Ntk9WQCCTW/RoaS0Vs8oXqgllAR1AJ+T4Cx/pQl
         OE2w==
X-Forwarded-Encrypted: i=1; AJvYcCWW4j1jsoLODcckM6UzQrT8e2KyNqchf039/lWh3XiF3k2+CAh/qREYquHucOa7lNYIEF6cb8QCm5JrHK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQKwzMZeDRbW0UAd7jSVuj9CzyjRNfcwFdeBSrf8pbwyvI8Omd
	ZKWZcAPTICpF9jFQruwX4SGrK9wQ6pHS7d1mtimGDcKaDm403zPjmIt72bLIGfVFMi/5cqTq1gV
	NWtVsmTob2mJHY8OAvbjicwQJvZlSOfEQeFFLkVVBOhdyAYlI7gLH/PTgLV/63nc=
X-Gm-Gg: ASbGncsQOGKibmdpX1R2UuZlOVhxLBSx6vak/awqRAcyFhq/YYFv8FWpw/dA/qsiPIj
	Sy/EEKMXJNr1dxfISe7k3n30MfH3MD5hjG3+Jeg1LjQj+kGuemfMQ2HaWSinoqjZ71teAHItbe1
	+nPQNbY8F6Y8l479lWqwwXzXOkiH6nfksTUQ1eCMTbDb4a10/UoLtFlM8x8d/BtL9nv8JV4BcCZ
	f1HXYPo5THrOebfN8gqtJSL9mUcZguA+koJxdC/dk18tNfKQv1AFmWRyp+3lbCYK4ZRJyZZH0cV
	YGSfLt50lQ6MRpKPzuVOfsRYYCrs35SrKrJ/BJLBDPHwac/HuWwfiMYRYLVPZ9fYVLMv1Gnq874
	7Ch2f
X-Received: by 2002:a17:90b:2743:b0:2fe:b174:31fe with SMTP id 98e67ed59e1d1-30823624700mr846385a91.2.1744323415422;
        Thu, 10 Apr 2025 15:16:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3q3badw0zIeHRu251yR5zxmnm+DYdPJGS2wgnmZo8bCO06H0BLiRjTFsUKI1g39u/REbl2w==
X-Received: by 2002:a17:90b:2743:b0:2fe:b174:31fe with SMTP id 98e67ed59e1d1-30823624700mr846343a91.2.1744323414953;
        Thu, 10 Apr 2025 15:16:54 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd1859e9sm4265767a91.43.2025.04.10.15.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 15:16:54 -0700 (PDT)
Message-ID: <23e31f9f-4465-45c1-8919-c5d43034d33e@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 15:16:53 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Fix buffer overflow in debugfs
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Dinesh Karthikeyan <quic_dinek@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <35daefbd-d493-41d9-b192-96177d521b40@stanley.mountain>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <35daefbd-d493-41d9-b192-96177d521b40@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VbH3PEp9 c=1 sm=1 tr=0 ts=67f84358 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=eavArjg6gjGuu_xFX0IA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: dA1Bb6OJ6yjniGDEj4IgsnrtdPE7pz75
X-Proofpoint-ORIG-GUID: dA1Bb6OJ6yjniGDEj4IgsnrtdPE7pz75
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 mlxlogscore=762 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100162

On 4/9/2025 4:01 AM, Dan Carpenter wrote:
> If the user tries to write more than 32 bytes then it results in memory
> corruption.  Fortunately, this is debugfs so it's limitted to root users.

I've fixed this in the 'pending' branch:
WARNING:TYPO_SPELLING: 'limitted' may be misspelled - perhaps 'limited'?

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=b49ee0380e07efa34bdc4b012df22842b7fe2825

/jeff
