Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B5022A4F6
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 15:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744124953; cv=none; b=EfczJBSjQw2GTr8o1SAp9/bBp1ii+85yTn5bHiNGNpX6rka5j6CCIQczZ/5rWx9Q7xdCcBUe1i+klNvnwP9yhe3QaZDQbnAx7MJWtshJedQXIJUy1kpKzciLaBzwq1EMu4lQnW3mJb2B2crNCvlo7eTqRpYYCOkCtK8QepR9zdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744124953; c=relaxed/simple;
	bh=DPtNxNE+awhfgbfCzrEemVYPnMctjJbIu3cTdoxmhmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZK958p/VXWob8Y/jPm2T9UvMD6FS0v8g0FoNRCnP9mYE5oYqWfZxmXrxahk6k/DJb0czRhGLWvvaXk4uIVFq6Eb8tnTjD0aNr8oAXf6csbW0HI/Qe0Ka2lheLXicYrrvuo5cgrvlV0xDDzrJ3PGrYc7JKRUSI1dxIwG/kqhIUNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kcWlkfMA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kcWlkfMA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538Aj83H008077
	for <linux-kernel@vger.kernel.org>; Tue, 8 Apr 2025 15:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pctFuou7K6UODLPKxKTgI/jveEjfklrGVfRqNLl+hro=; b=kcWlkfMAIyTvGUK2
	O78nkAl7Eb6+80JcljLlCLB9xTnZRvYCnbpJcQ2jIYgUQ7miDpf5v0JUizGurTiO
	0+R7mVlR21PvylbpxztvklnLCxeTAG1MwWrcSs0J5SGqBSQSrYhq9GOcfurK28Kq
	VOPdo3WwtY1lc+ZxbYyJZqO7M/vnll9klrFQSkTuTIxLkD7u80EvHtsFl+1sxbqM
	We9/mPsmkgMomHtqo+BMVSC0HqYAVo0K//7oA5cf48jZFgFjTjaNh8gUDJopCbLb
	rCJXhG5ZgHD1SQsMFx9SJ7g4UIikkkIRi4hHwsRj2jZW32lZCR0hW6iMaiwZ+APK
	7uRy+w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtb08br-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:09:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2240c997059so72114135ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 08:09:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744124950; x=1744729750;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pctFuou7K6UODLPKxKTgI/jveEjfklrGVfRqNLl+hro=;
        b=gp5n8/ldqbVqqyR4Ch7M1FeDlZjEqW5v7ygBGFtoMaY61yPgI6qK8GVkvXD3efejzF
         piUAxK1MGkNdsGHcy6P3XZyORExtuRosfoxwY9RUL3h+9LVdhjjqFDLrRlobyAtBlllF
         uu0sWqa1XkoV66S9jn4qwAuai+TafqpO80xV3vdnDOxXLwjmQ6vI1cbBovaICa17RhGl
         9rXqFe666ktIqtSP3edmmhiZd9dGaH5hRKWSAcFkoK4QzUHoGrFhtV0TvzGjV/A+tPIV
         OQ1sTJYuW9L6mmVKAtn6++ywC1up9LvKtjHlpW8MyfXMgfjxN547DPpDJhR92xUsIskm
         5hHA==
X-Forwarded-Encrypted: i=1; AJvYcCVaDKga5gVsVJdl0R7WIlSgoiTdwl1LKrD0pmHOSslOviMMBdfs3F23a7gBMK6UJsIIrLNiaMgD13Da4WA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPkjIJcqrq7fGHsyHhXXMFLtD/XfvQaaaqgTZYrhCtmqctzI7U
	MJ6jYxFbcyhNNiEsLT5iTRIqdkMYq5hCMT6K/pXfggsHf6tws5Gx6hT5jc9azz5lvWEVhh6YQyF
	kZrMyAkU07LbO9ALdPJ5a+rBEPlqBquJPiJElChO6vBPkYWEYj94RMXHy5tC5sfs=
X-Gm-Gg: ASbGncu5A0o4h2stXOqpB+U6mIb+ayW2g+qMroxJ4WGzgGT05NZbxm9aIshGXMBKcZf
	6aUVcbk/dvHeL8yDcesWXz3YxwFm/GyhkudXj6BJsO/KKHowtlLXQOOYs3dFa/y0jG5UPwy6wII
	ivUkvOITQZhG7FBXvttGVm5NG06RK8YynaSjO/4ZIo4v8tIevnw3inNrusuM1sZpOX8FHlFnicB
	n+T8+6tctmvh5rD7kslh+fW0/56my7RQ0r1IDU8fKkybZY/TJAi3IWHsIJWbmH72NW/W0LGPYSA
	fDcIEp4uIkw986linbetHU3RhHqmsJ8uwdPCv7fm/byP2flqIwapUiQme6vMq1A+fz9tVh0=
X-Received: by 2002:a17:903:19c4:b0:216:3d72:1712 with SMTP id d9443c01a7336-22a95587be7mr216673425ad.48.1744124949796;
        Tue, 08 Apr 2025 08:09:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNrtrSw2E1SAGUq7CqH0A6kBJG37r/+rnOESKXQy0U2GuSemu5naPzR5orh59B/fwt9z1wGQ==
X-Received: by 2002:a17:903:19c4:b0:216:3d72:1712 with SMTP id d9443c01a7336-22a95587be7mr216672525ad.48.1744124949072;
        Tue, 08 Apr 2025 08:09:09 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866eca9sm101503035ad.170.2025.04.08.08.09.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 08:09:08 -0700 (PDT)
Message-ID: <26cafcbb-6a94-40ab-aabf-3c9943cfb925@oss.qualcomm.com>
Date: Tue, 8 Apr 2025 08:09:05 -0700
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
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250408113747.3a10275a@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oKgwpZCdk6tPgI3qAt2FTX4uYXpMTBQA
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f53c16 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=3WJfbomfAAAA:8 a=rOUgymgbAAAA:8 a=4uOVVYVnsCJchGKozvwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=1cNuO-ABBywtgFSQhe9S:22 a=MP9ZtiD8KjrkvI0BhSjB:22 a=IwZ_ZZASwsaSaAdrsfNp:22
X-Proofpoint-ORIG-GUID: oKgwpZCdk6tPgI3qAt2FTX4uYXpMTBQA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_06,2025-04-08_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=903 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080105

On 4/7/2025 6:37 PM, Stephen Rothwell wrote:
> Hi Dave,
> 
> On Tue, 8 Apr 2025 01:06:28 +0000 "Dr. David Alan Gilbert" <linux@treblig.org> wrote:
>>
>> * Stephen Rothwell (sfr@canb.auug.org.au) wrote:
>>>
>>> After merging the ath-next tree, today's linux-next build (x86_64
>>> allmodconfig) failed like this:
>>>
>>> drivers/net/wireless/ath/ath12k/ahb.c: In function 'ath12k_ahb_stop':
>>> drivers/net/wireless/ath/ath12k/ahb.c:337:9: error: implicit declaration of function 'del_timer_sync'; did you mean 'dev_mc_sync'? [-Wimplicit-function-declaration]
>>>   337 |         del_timer_sync(&ab->rx_replenish_retry);
>>>       |         ^~~~~~~~~~~~~~
>>>       |         dev_mc_sync
>>>
>>> Caused by commit
>>>
>>>   6cee30f0da75 ("wifi: ath12k: add AHB driver support for IPQ5332")
>>>
>>> I have used the ath-next tree from next-20250407 for today.  
>>
>> I guess a clash with the recent:
>> Fixes: 8fa7292fee5c ("treewide: Switch/rename to timer_delete[_sync]()")
> 
> I will try that out tomorrow.

Yes, looks like you'll need to carry a patch:
s/del_timer_sync/timer_delete_sync/

Until that renaming patch makes it down to my tree and we rename.



