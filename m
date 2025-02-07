Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67292A1D8
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 17:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738948575; cv=none; b=S8R7agwI8S4pacnlacFu0CKzaLGa1z2ATBehsTm3BvJ+TFQVwEqJmUTwTa8NyNRMgPH7VBpfZ97V0YV7TTqlSqTROaRA3ZoSW1kR65+WW4WICwfZv+k8fwyRasu8rmob0Ca3tt1muP4W2lbyZ3NT/xRNsbxrjxUsvD5DT8iSkv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738948575; c=relaxed/simple;
	bh=vTY+lwuSHqD+h/l1dFSfkLwQEQu314mk0y0a6xYJ7K0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=avvjLANQKhqCPSAyGmhJNLFm2jUdHsXfyCKDpWxJ7gLcBKKDP1voTzSl2z4m6Mz8xxYiTWqqTJ8+SJL2BipKKtTRE7KdyAaQBHwkq34Qq+vgNJyU1t4XjfqAzUwJbc4jhC52Yd1/mdDJHbquZQ8HrthTErFlJONXr2TOT7vgP70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p0i1NofZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p0i1NofZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517CT9lS010620
	for <linux-kernel@vger.kernel.org>; Fri, 7 Feb 2025 17:16:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ESceAsTExudZ77XUfniEGvmGfJT6Utl2V5clq/2RCOg=; b=p0i1NofZ2EawwZ1S
	VuacnV3/e6o1ztoXUHmrkLOUe8Q5RwzXSH70Y58tNs3g2QC3k98exPi48vWlehzb
	Uwmc23+G49QrrTwRunXQvdnEel5zxTRYmWa6S0rMG68xwEYGYpJ21SX6Issr5Chw
	VjLS03hdIKulezQt2rhJ5ICzdYAQ8AB7UcF4vTWG5O8Kiz1y9+GpFhIWc3gBEDfJ
	Y9jsAYWZEDamEsLqXeO0vEmhCLlk8tG3B1t1cmSUxJ88pgjQK1hptxhjn9H1yGTQ
	thGNMSKcSwNQ0jLGNEDVt4zJ59YiI8NJFS0c7tpK5YTL1qF6U313Sad93WAJp5zd
	OW96ag==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nj6w8q97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 17:16:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2f81a0d0a18so4955459a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 09:16:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738948571; x=1739553371;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ESceAsTExudZ77XUfniEGvmGfJT6Utl2V5clq/2RCOg=;
        b=XZBKoLbjHyckKtQFgqkkFU532yPCszol8qrf7ufSD1Ik7rg6wMlcEk0JcVDu36gyNL
         eHVRrjzzszueGgnt4025yhfiDek3p1gz9f8qly3b4yoOIt1qv/v1i6RN2VD2xwiFJaWJ
         R1WzNvo4qJ2zUqig2WE2cNTsuH6dTEY4ZOjsOG4Bj0GLqDQvukiQwlRJ9qMgnZHvt/8G
         JHXL8QV+ATxrJucnhcRB2v4aHHR4zOcSyBp6rYcaFGRD/i0WhpOxF+v89n81nUoIT4FD
         4fewA58r1xoDDn5ajbgYHE0p9RZKAEBSpuTZ9RXngKbhDJYc3sgTNxYibX4Zas5CdCKN
         rXXw==
X-Forwarded-Encrypted: i=1; AJvYcCUAtKuZy3y5sIsuavLT3tGYEBMONrP0neTWAO3APBrS5N17haoJ/w1+AFVnKLugvu05/6Y6aQ26ler8vDw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbinpc7ecG1PXaM6z71dzhJALGXWZWxSbdP9zlgUmYCLIgpIFw
	IQ5YRh0cKwXbMGy+uwKLbHG29bAKGHw/IOGgmuE8MZwHckCyb1y+IzPFSL/M7j7nQHyT4WNDMhj
	Jd2k8/oBSfrXtvwsbLdwlS3iJGI9iZOhx/K2XnGvFL/+w0zQhfnVdGHKH7pJ3PIo=
X-Gm-Gg: ASbGncsM2jXm3XxCKWo1t3eriLQNX41rofMTQP0vmbgCPxXfqH2SI77+YxS4RfUjIwK
	J+CHoAk62z0JMC0lMtIgtapeHd/fJqsHfM8FmqSZPnNVZvtC7uFofgKCvMJNsymUyRcXkWa1Ygo
	lp91jRdmaMZAXxD/5Owwvbe72kUb22ysoTrfvxzDL6Kx6NRtpdXJaqwX5TOQ2LKCneYpX8j9rfg
	pAmgUTJGaqc2STgd5ZFrMN1BvP4IF22bUEj2Yy88kK0hCNQ/IcKvMY4h6fl6M9NoXwTPf3YK8N4
	HMJSW5gaVRdcNnmOPilYCmuxRDaSlZ7Q0LhQcIwg8p/qegmilF09WdLcB7t56gsQPlPuGbHcsQ=
	=
X-Received: by 2002:a17:90b:1e41:b0:2ee:a583:e616 with SMTP id 98e67ed59e1d1-2fa24064ed1mr6244359a91.9.1738948570915;
        Fri, 07 Feb 2025 09:16:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEC5gdVSnOo1ypRib+HlmiI4S2pQzXBdCb0LkjQhzhHuhLcbkgl0mCCCizqBBSy8508ItXkg==
X-Received: by 2002:a17:90b:1e41:b0:2ee:a583:e616 with SMTP id 98e67ed59e1d1-2fa24064ed1mr6244325a91.9.1738948570512;
        Fri, 07 Feb 2025 09:16:10 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa0942d30esm3622451a91.0.2025.02.07.09.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 09:16:10 -0800 (PST)
Message-ID: <5ffa4396-b6ff-4eea-9d44-fac5df2a47ac@oss.qualcomm.com>
Date: Fri, 7 Feb 2025 09:16:08 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] wifi: ath12k: handle change_vif_links() callback
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
References: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SFnN-o2xBXYPKhsKV43d1ESzXpH_YwU-
X-Proofpoint-GUID: SFnN-o2xBXYPKhsKV43d1ESzXpH_YwU-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_08,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 bulkscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 clxscore=1015 mlxlogscore=999 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502070129

On 2/4/2025 9:05 AM, Aditya Kumar Singh wrote:
> Currently, links in an interface are allocated during channel assignment
> via assign_vif_chanctx(). Conversely, links are deleted during channel
> unassignment via unassign_vif_chanctx(). However, deleting links during
> channel unassignment does not comply with mac80211 link handling.
> Therefore, this process should be managed within change_vif_links().
> 
> This series aims to add support to handle links in change_vif_links()
> callback.
> 
> Patches 1-2 are making debug infra to work without device info.
> 
> Patches 3-8 are the ones changing the code to handle as mentioned above.
> 
> NOTE:
> * A new ath12k-check warning comes which probably needs to be added to
> ignore list
> 
> drivers/net/wireless/ath/ath12k/debug.c:69: Prefer [subsystem eg: netdev]_dbg([subsystem]dev, ... then dev_dbg(dev, ... then pr_debug(...  to printk(KERN_DEBUG ...
> 
> This is because, since device info is not known can not use netdev_ or dev_
> dbg family. pr_debug() is an option but that will require DYNAMIC_DEBUG
> and then ath12k needs to be probed with dyndbg=+p which we don't want in
> ath. Hence, only option left is to use printk() directly.

A new version of ath12k-check has been pushed to
https://github.com/qca/qca-swiss-army-knife

Please update

