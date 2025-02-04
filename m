Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44360216384
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 17:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738689599; cv=none; b=qBEV8Zpvqj4LemrG95CrrTB19Xjr8Z6LeRJVZ5+uZ8/AlnvVjo8/LL2hroXhI6VPof2q7MetftQxVA6P+27Q4sBpG2ySTwEO9GjhszJ+GlfJ5u9JEjCTJhaosA6I3iRQJALrn9fu8i1QjntfjpOu2X7Y0YPOcbFA7xTIP1cqBU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738689599; c=relaxed/simple;
	bh=LYHa0ZqS+rDG48w6uCcln6I0sX+37b6giliOCCSaqx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aXJYr7JxKSR/mEI0V3gQ7j6O8Mm6YRlR1WjSBL+4qCPKywozQcWdFY85KCZm2xlGIr3+3pG3if2qWb+0K0uZx9Xn74k16E3Jf7XyPL4K9mf/c+KhOWzQu6j10nij4k+ZQqPIDKf3n2xoJTS2lAmH7X9+1oZR9vAE9Aroo4MN7cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QgLzQUSc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QgLzQUSc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5147Gewn011238
	for <linux-kernel@vger.kernel.org>; Tue, 4 Feb 2025 17:19:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2UqvzkOspButWcUaJ64/oBpdNehxKDeLYx4iVQVNtYY=; b=QgLzQUSc10dfprXn
	77rhDeDSF3fPecjTy7sFRFnzZ6mw3fWtdBcwalsk7sjH3A73/O9pL6AKRwIaAbSr
	MvBbx2ihk8naNZftpTN8sn5AEmQ8KEcmjVcc9D1l8esnX9MQhqWRAexLDfbakf6T
	yNfdCpxNm9PZjYPD+UCXzcGjMfTJoLR+SS68JjnK09IVxBSbevZSzWbTM4Wzuduo
	CVLtoQj4d8ayTIVo/apFuibwW0d9bDtoG3zCqF3s8erWvTOScCAN3PM7DoiTHmKz
	ffDteUWMUZDLBqLB1xWYkxn2g5vOR/ZLMPu/BFIl1MT9Ra43EwJ+1BWHvBnLrWoq
	ior4Zg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kec41d7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 17:19:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-216311faa51so28445ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 09:19:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738689596; x=1739294396;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2UqvzkOspButWcUaJ64/oBpdNehxKDeLYx4iVQVNtYY=;
        b=eM61yJv4pVHzEfbZ89y10vGA4kbjQJ6tqDePj6vGZ6doPVHzXptUlEXVJmMNElEcen
         CNv6yNQLmlIirDaPo9FyXFj3OVNV4PkWNOospwmmMjsaDnIVwpaIFWuPi0R3NiqSQWuM
         v6ch/fIlP5myxJffcKtJQhEsFd8i9a7GcEBNT9oLNT+KBNFeCsf3mC9pGscotVHWhu5T
         H3wtkRZzBHYudDMgI9NC81sMWd8T6Ab3HH5TVgySvtIMJXsspAFw0pw+DNgCBbqXxWGy
         DNlORn1+9Gb0WSA5lZ3KoXUsE64axGfabH+vJmiCL8ZO8xmSWelSuc2UpkB7Ae+YLX19
         eWvA==
X-Forwarded-Encrypted: i=1; AJvYcCU1MKYWEGFAfJti0h59WWu9ipHsPEoJ55c/oFqW7cjvIrL1+smfK/rLi7QZfeuCrODTMwJRMbt7yEkTEGw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEmyy+0Tcgg3MpbXPsLcJfnVOxlmtpLBNF3CgkrtvzDIWJmV+1
	Zx9zd97Clri5gPcDZxgUjzI2RxfVFTMyBVyLCgjOVMDbRnD3nvKjkqPc2+zOP51JYYZQQsB5jkT
	uikqvJ1DfRrXYpnn/voHvl3VXEAa56+RyBTPkW9TEYoGc91/aMUIBeCWNtPaaOUY=
X-Gm-Gg: ASbGncun4YGh073ZEmI4nUJO3C8p5YY95y/wu3y4tLPHzIAJODyJSmUJao18rfR6b6m
	em2uai/uhooPc6exUt2mn0fnvYXA+PLI83MQCUCZC2sUarWAJz90MxPTqzsmbGypKZabpD1niWl
	/mC2gCBLoAQDqUNXk12oQFZWNWqMKg7fkt8E06Lou8CNmwKxUX5gGKJLIWJCHmbRGnKvAUgFmYN
	IKUeQ8M/+XkwQjK0sG5X05/J0QFwPNSfzGq9K3i6udsRxg7MtOa3XZKDm94yk+Q6YHeS4yHHG1h
	owPr/56NblLJdOixbTJvkx3HOD6WcGqa8i5xpaXNfg==
X-Received: by 2002:a17:902:fc48:b0:215:58be:334e with SMTP id d9443c01a7336-21f01c4eb89mr55640525ad.10.1738689596251;
        Tue, 04 Feb 2025 09:19:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRaCeaMYXzsJO4HcrPp6hyYPtN3U/0bZWJ5AtJlfpWHpm9+wpQl9q/SqVGNSCZ/EY68GmdAA==
X-Received: by 2002:a17:902:fc48:b0:215:58be:334e with SMTP id d9443c01a7336-21f01c4eb89mr55640205ad.10.1738689595879;
        Tue, 04 Feb 2025 09:19:55 -0800 (PST)
Received: from [192.168.29.221] ([49.37.208.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f7020sm98411245ad.76.2025.02.04.09.19.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 09:19:55 -0800 (PST)
Message-ID: <c032881a-153e-496f-bea2-0eb8452ad495@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 22:49:52 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] wifi: ath12k: handle change_vif_links() callback
To: Nicolas Escande <nico.escande@gmail.com>, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
 <D7JKQ60C6EZA.24H639LLIG2U7@gmail.com>
 <076014d2-eaaa-44be-81fc-a8f1eb0c2ac9@oss.qualcomm.com>
 <D7JLLQ79FP2Z.2Z7VYLSC52A2U@gmail.com>
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <D7JLLQ79FP2Z.2Z7VYLSC52A2U@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8nSI9R1Cnn6QCrsgpiCismQaTjlrbqWf
X-Proofpoint-GUID: 8nSI9R1Cnn6QCrsgpiCismQaTjlrbqWf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=959 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502040133

On 2/4/25 16:14, Nicolas Escande wrote:
> On Tue Feb 4, 2025 at 11:23 AM CET, Aditya Kumar Singh wrote:
>> On 2/4/25 15:32, Nicolas Escande wrote:
>>> Hello,
>>>
>>> When applying this series I am no longer able to start an AP on a DFS channel.
>>> (I don't know specifically which patch though)
>>>
>>
>> Thanks for reporting this. I think non-DFS channel should be working
>> fine right?
> Right non DFS channels are ok, only DFS ones, and not from the get go but after
> the initial CAC, when they switch to operational mode.
>>
>> Anyways, I'm able to repro the issue locally. Let me investigate further
>> and come back.
> I'll happily test what you can throw at me.

:)

I have posted v2 [1] fixing the reported DFS issue as well. When you 
have time, could you test and confirm? Locally I'm able to see 
DFS/non-DFS working fine now.

[1]: 
https://lore.kernel.org/linux-wireless/20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com/

-- 
Aditya
