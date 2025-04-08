Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE4639AD6
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 15:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744125818; cv=none; b=L8L/MbPZDWyTOUxrQhqtMFSQvl6Ywdzb9GaFWSlRwr8S+VcZypRSWrZjEnf09izKCjg3ELyVdnwYh0miF4Wsb9fx/9Zxt20D5kqMBls/vq3yPm9H5UHqK7wJ7lwh/JT/fiFH821m9yiAKZd5ocGpcsB+4fjB/5dJ7wAX2lXLm8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744125818; c=relaxed/simple;
	bh=aBGY5VnvleP+F8vMPlH07gsy/nK8dijdNvQCx5soGGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NsG60UY2wDe2wHrL1jWh1lzluDMJZQm3nHNhIvLmEmZBDIEYrat8uiqRPeLvpJKrXYhIRKj5OHKBgePXoP+4DzynoHdRdz1IVVqIuV21zRYkjOq5vjAhdiiOIi9GKrfgZddmHlw/YfexWcOBL8k/HHijIvA5rGuBo67+ntQ+XgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GV9cJy5/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GV9cJy5/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BGKeS015134
	for <linux-kernel@vger.kernel.org>; Tue, 8 Apr 2025 15:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NF2u+J3xRv/jYqarjPk3YREaPbF9uPD/ZqubOMJkE28=; b=GV9cJy5/gv6dXktH
	iTr4SZT3ZHPLPkuMcdGhP8TuBaGTFXPtOFpuO4Mhc8X7iIgaxHilf+ABS7c8Zuo4
	+vbZVjbk2UcHQ5QXNdfdRdB3AdIcCUWCZs4N2EBb+7aZn3A3OBGbG646ey8CC9yd
	lwUKwHJG49gWfRufKqA0iigzViGeh8AeoFuicgW27VDebTZQfMmQMS7pMF47f471
	zttAXcpSt8Y0MWYpreM7KYGS7r0CMPEOi4W4PA5yeu5lz97fwwsbtg0ac46DyOUj
	ZOErYeuyoXIrpb/Oo6iMH9LFdBPR0578l1h7xf+H0AyuOx1gnTxigdLdeyjzQ293
	P6IRfg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbug8u2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:23:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2240c997059so72269275ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 08:23:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744125815; x=1744730615;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NF2u+J3xRv/jYqarjPk3YREaPbF9uPD/ZqubOMJkE28=;
        b=ZNqaaepQaMl31DrfGOjuHALwIBGjMAHkIUNCgxkmcgHXmkmEd0y3kq2HvravPbdoYB
         ZAx2snoBg1yaBxwipqBAymJQ1Bf5a8OsU+2LgTffX7J43aschTPCb7kgTPwKO8fhre5L
         a+bq11Qv6+LooyE4F7JSyLMFf55kL9leZu6K5CGWU61TjWHyGsajSxUBCjn8Lt3IReK4
         99ML8vBVI8hTfF+7Y5zr2Sw17vjkQvob9OuIaPjT3iQP66A0Sme7iPEB8iJysoy+iaTT
         z2FEFnjxL3wkWHdetq6XeAU//Q2sBYDFIz8jc5TA33ZvaKy1XDrYTziqegzHMEdJiASc
         F0gg==
X-Forwarded-Encrypted: i=1; AJvYcCVZL4VA8MYs0xj0t3l9Z6RJllpmRigexlYIG4btaVkNY6618s1WaWvc+Qky7Z05V48/jF1qDnKG6qaB/Z0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/9FaPj0PS1ruA8x+T+DMHiv3DxAojp6mftCLG1QoYza2YmxS7
	8uNBvz/dDvTH2sDCnfWpEC9MsmzKS3mYdSj6RtuQORBdD5EhGGAIKtYru2u+Or0xtxamF5pgDtj
	Q9DbxIFLobfn2HQzzZxVJGvAbXMMTHU+Z1aU9WQMOoZD/my3KBqxFuCFsUZD/+ns=
X-Gm-Gg: ASbGnct45fed7HMenBn5SzkBlPRVURBFQdvTPdBzi620RwV3XuqwyPlnvBvetSuG+ZN
	QURy/oFb9hvP2+YeXnzWPO9dELqkMbNpUZ6rWRRLYFRVeN3JRp2rYMISMmmvtAcGFU5xqOtUQPX
	9cyZvvsvJ3E8ceHmCOjO++ldM4yFyTc1k6raZS4nQpG5iDrsd7mgop77uo0uuhmmxwcIlgdAcSk
	gcam3fZgWpPdAN+OooJZRL01AtHeoeN/LqPnb+Q7AWbMnQ9RjXWOPCMEwKGH2BzYZbPre5+pHRD
	7ReUvYKevGcQwNwl4Y7qcRe/AkhCmI0lETlyaQGO2hjEW4xL0IRw6i0WVG5BKgmevJVzRDw=
X-Received: by 2002:a17:903:3ba7:b0:215:9642:4d7a with SMTP id d9443c01a7336-22a95428babmr189625055ad.0.1744125814598;
        Tue, 08 Apr 2025 08:23:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrdN25OA1XG8KyNqW7/XlHJMumnbDPU5Qnl4hGT38grG496JV/Pr0d9saQWHGnZ0hfOM5Gfg==
X-Received: by 2002:a17:903:3ba7:b0:215:9642:4d7a with SMTP id d9443c01a7336-22a95428babmr189624405ad.0.1744125813874;
        Tue, 08 Apr 2025 08:23:33 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785ad8f8sm101872065ad.42.2025.04.08.08.23.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 08:23:33 -0700 (PDT)
Message-ID: <ee51a503-6580-4f46-aa38-77f1b9ba6535@oss.qualcomm.com>
Date: Tue, 8 Apr 2025 08:23:31 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the ath-next tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
        "Dr. David Alan Gilbert" <linux@treblig.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Balamurugan S <quic_bselvara@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Ath10k List <ath10k@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250408105146.459dfcf5@canb.auug.org.au>
 <Z_R2lEVjqn2Y3_sP@gallifrey> <20250408113747.3a10275a@canb.auug.org.au>
 <26cafcbb-6a94-40ab-aabf-3c9943cfb925@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <26cafcbb-6a94-40ab-aabf-3c9943cfb925@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JtEyYsnUs2hoeGFa6lMuc5uGSVeDhyaj
X-Proofpoint-ORIG-GUID: JtEyYsnUs2hoeGFa6lMuc5uGSVeDhyaj
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f53f78 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=3WJfbomfAAAA:8 a=rOUgymgbAAAA:8 a=HC-cJF9i_tize61FGOsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=1cNuO-ABBywtgFSQhe9S:22 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_06,2025-04-08_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=977 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504080107

On 4/8/2025 8:09 AM, Jeff Johnson wrote:
> On 4/7/2025 6:37 PM, Stephen Rothwell wrote:
>> Hi Dave,
>>
>> On Tue, 8 Apr 2025 01:06:28 +0000 "Dr. David Alan Gilbert" <linux@treblig.org> wrote:
>>>
>>> * Stephen Rothwell (sfr@canb.auug.org.au) wrote:
>>>>
>>>> After merging the ath-next tree, today's linux-next build (x86_64
>>>> allmodconfig) failed like this:
>>>>
>>>> drivers/net/wireless/ath/ath12k/ahb.c: In function 'ath12k_ahb_stop':
>>>> drivers/net/wireless/ath/ath12k/ahb.c:337:9: error: implicit declaration of function 'del_timer_sync'; did you mean 'dev_mc_sync'? [-Wimplicit-function-declaration]
>>>>   337 |         del_timer_sync(&ab->rx_replenish_retry);
>>>>       |         ^~~~~~~~~~~~~~
>>>>       |         dev_mc_sync
>>>>
>>>> Caused by commit
>>>>
>>>>   6cee30f0da75 ("wifi: ath12k: add AHB driver support for IPQ5332")
>>>>
>>>> I have used the ath-next tree from next-20250407 for today.  
>>>
>>> I guess a clash with the recent:
>>> Fixes: 8fa7292fee5c ("treewide: Switch/rename to timer_delete[_sync]()")
>>
>> I will try that out tomorrow.
> 
> Yes, looks like you'll need to carry a patch:
> s/del_timer_sync/timer_delete_sync/
> 
> Until that renaming patch makes it down to my tree and we rename.

NM. Since the timer_delete_sync() API is already in my tree I can make a
one-off patch for this.

/jeff
