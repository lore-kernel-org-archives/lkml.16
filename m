Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EFB258CDC
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747332323; cv=none; b=SxfKUZzKNLGea5PGdrafphx8JiDW0t69zWMlGBBrppuU+A4BmLdAKGTyFfN5qijAQ3MW46YepfRsP94XqBkG+7APXYUs/HzvQF71r5kniY5aCRATD4XcxiVOO29qg6YkQqVG9WKVbBAjp6DMttC42DLjE0UdiDs+nUXpiZsjfi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747332323; c=relaxed/simple;
	bh=ROFLMNaRFR9x/wyzv/emjASjuPB47MFbP09DEuBS5HM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ks4pwqqHSor+iIKp2qrdfa/ECSHac27wvwJNPtkAh28yNnoECTUG0KOkzC7+sp+HzjD6do1L3u7BJ2W6s5s+v5veIsF5OAf6cWbwXRHS2WsBZSsyOMBLNjAuiEKrbeGtBl9czxO1Ts/iW8ZEduLiUQYkdpC+YuCNbiA5WzNZE7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jFC/KlBy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jFC/KlBy"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFUKl026261
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YGTbjpAygM2J0KwEeWYgPo4Eet0TyJJhore/XR7KdgQ=; b=jFC/KlByBPlkzI/O
	uZtXIqLuoFLxOn8kTxiAnIlkEUIWCyQN6RLfEk0+tVM/e5KqqIHeRiMZa8KcV9Wy
	6DFybNa1siSyQvLrDhEH30CvkLmUuqfwU6HK/iObosFt2JnQsj9C+aHobOLsq5pe
	AQ0zvQJ4RupCTnoeiaA7I34JeA4OC9gG6RTy1Zb/ym2oi8EC8sd1P+1ii27XmZmb
	UfvlGvNObzJAgz3hV+W76SoezAbLjL7HBu3174XlZYxXI+/P/ob0J0bSvcQoDBGq
	XkwpzgjPKHQM2NmU/zjSzqm1qS1JKqRkqf7uW+SXqnh4e3ljYSSOoPsbemM+Zw+V
	uiX+CQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcyqbr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:05:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-30e78145dc4so321299a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747332320; x=1747937120;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YGTbjpAygM2J0KwEeWYgPo4Eet0TyJJhore/XR7KdgQ=;
        b=XMDcVqzNRBxczO1Pl9srocQeybqMA4Dji48iEgizpk44XZI6Ls+BtROaSi5wFXAf+q
         H1NyU21tQ5Lc+yfJDkugAx69W+QJH+943C+KO3+tm/4AcnGOK0Z9oqNtW+4r1S5J3LLC
         IPOFYUtWzCT1WeqvuUpMtJRr9s2p3GMgWOSVvPoo13pH121neXW5BclTUMcqy6FuuV6I
         DuVgkka64pXzDCnWs5PrHkzcvIKnRAe9hP/OZb08kZy3uYQMuXT3L25bCTMZ1um63CbG
         bXyCJ5rDyXDRZ1lO+/b6lao0yUS3Z2Y41JZx7XUUOCWcawau0CbQ9Ep1twjquX78vq7Q
         5Ofg==
X-Forwarded-Encrypted: i=1; AJvYcCUS+4daQhK57qGhbCON5/4VakbG2nmupislfZ8mV1kxhhAKzUkB5X5tpeTfG3Xyp/EVMIwEkJv2MAvDgBM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQyNzCt9w+6le6d+jM0QQog8rBSWx2VMTzfPTaRBsQ1tg6sl9B
	xY1kJwQ/kfvoESyGcFoYWGW7brQoqFSXRx9UDrjzozZ+ljnJW1i6oBNG5rklKvNek+76DMGYZ3t
	34n0uiJW76R0+bDyaDkFDrJ+sciMEyo3zWN2QR8lMY6uR3nMeDQtfa1rmRlPgD6gsN6k=
X-Gm-Gg: ASbGncsUAoeUk9N31Sq5UQV7gVOSZcQ6/8YEvEa97ViRY8BArrW4J0Fi+IkhsthzSwq
	xZfwkD2X4wgHzJgqp16P1jpZU8bxzMPvLM89qVy9vvkMlfauis96D5+kiVIJ+BpBTKOVOUPvKyK
	9PLWFFEaFQyivR4X9MhLBYbZl/+j4EahJjUrBU7qKwrqw8xCSqqjWEDoF6UiNr/NxDczHM+lzrf
	H8H+JOG49KmPeTJeYqQA5UyfPBEWLTxTCskoXSg3Frvbyz7ahzCpZ/fwXJzkvhkYj6g/yBMNJYK
	BigiwkYJyBc7sFMlNCFBxb2n8qUhjAlLgJobv3/lMQs5qx3KUxg=
X-Received: by 2002:a17:90b:2d4c:b0:301:1c11:aa74 with SMTP id 98e67ed59e1d1-30e7d5a84a3mr435244a91.28.1747332319770;
        Thu, 15 May 2025 11:05:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGh4TYq3jsoeNL50CmSxPGpRbpni09FC9zVNSR1KqfJ/OUNHnXz0I9U6uNc4wtsY+Glw2D+AA==
X-Received: by 2002:a17:90b:2d4c:b0:301:1c11:aa74 with SMTP id 98e67ed59e1d1-30e7d5a84a3mr435185a91.28.1747332319210;
        Thu, 15 May 2025 11:05:19 -0700 (PDT)
Received: from [192.168.29.88] ([49.37.212.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e7b4dda42sm198205a91.35.2025.05.15.11.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 11:05:18 -0700 (PDT)
Message-ID: <535df7b7-def9-4aac-8118-04e2fd0239d9@oss.qualcomm.com>
Date: Thu, 15 May 2025 23:35:15 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next 1/2] wifi: mac80211: validate SCAN_FLAG_AP
 in scan request during MLO
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250513-bug_fix_mlo_scan-v1-0-94235bb42fbe@oss.qualcomm.com>
 <20250513-bug_fix_mlo_scan-v1-1-94235bb42fbe@oss.qualcomm.com>
 <16499ad8e4b060ee04c8a8b3615fe8952aa7b07b.camel@sipsolutions.net>
 <26a9e68d-bce6-4bba-871d-13e2aeee3fed@oss.qualcomm.com>
 <296b9aa887022258f8ec8e4f352822c24b41ab82.camel@sipsolutions.net>
 <77fe950d-c5af-4c28-8b0b-bd1aa08d885a@oss.qualcomm.com>
 <d211e634532031322a77053ff912394714b5ff35.camel@sipsolutions.net>
 <772514cb-298a-40b0-9a33-a7dfcf037bd1@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <772514cb-298a-40b0-9a33-a7dfcf037bd1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FUz4RpOQUw6xMkAjORlqC-M7m387YQtI
X-Proofpoint-ORIG-GUID: FUz4RpOQUw6xMkAjORlqC-M7m387YQtI
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=68262ce0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=XZDIsMRYGlSp8tquX/g+9Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=YmykfdemIhMYyei05fwA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE3OCBTYWx0ZWRfX3ze4HHJnMiMd
 w1vJzirMCAg95FgFF7dBt+3/2sCXMiBVrOf5G1atBG5ypZvio0DlRxTp2J+7QcPyjTg17qi/lV6
 GY8lRi5O3nv166bhUviro8Puz9aJ+xiIjaMcBmoHGYzqQwldmr4d3OfRVUqYvITh5fxINGehJtz
 L00hxkNTuJ6hgYgnupk5CpW8HnIG+bhZMmwkb0FqT9JpflTVgCUHZtJyb4PmKYHRO1kUe593E6E
 lwQC5zkDuN1HBXh5asmUYQlIjxoO0kNP8bUbB9zU0YJj/wgp9pvPny+dkTzLX4Ib963T+PB3hNC
 78OhNxmnwgsz94O29GjSLzwunDkJytv2bPrR+3QdfoMWtjBZCrUsWzzpenk/A78ecfHLlaxZImb
 AuI1MbyeFY1OTSyQ8jF3pSKiBKM4Mi+4aQA/Jwc88ikRipSzv268HT6qKlILwof4Z1Ax9DlH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_08,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=751 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150178

On 5/13/2025 4:26 PM, Aditya Kumar Singh wrote:
> On 5/13/2025 4:18 PM, Johannes Berg wrote:
>> On Tue, 2025-05-13 at 16:02 +0530, Aditya Kumar Singh wrote:
>>>
>>> Okay sure let me first send a clean up. So,
>>> ieee80211_num_beaconing_links() should return 1 for non-MLO as well?
>>>
>>
>> That would seem logical to me? For this and many other things non-MLO is
>> mostly equivalent to just having a single link (apart from the address
>> translation.)
> 
> Yeah in a way true only.
> 
>>
>>> And callers should test for == 1 instead of <= 1.
>>
>> Not even sure that matters enough to need to change?
> yeah can be left as it is. Sure then I will change the function alone to 
> return 1 for non-MLO case as well.
> 
> Thanks for the inputs :)
> 

Done. Here is the clean up patch for review -
Link: 
https://lore.kernel.org/all/20250515-fix_num_beaconing_links-v1-1-4a39e2704314@oss.qualcomm.com/

-- 
Aditya
