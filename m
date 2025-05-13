Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8CF244691
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747131439; cv=none; b=nqX+wc9f+6cB3mx5/FwpRzT6VJNUa5Ir1CpDH827U0hUveb63r7hmKMVDZkSFX0pAGrVz1PEom4QPO5HATuM1utl7GZ0XPLdw7fFOIDEHrkjaZkuaZPjeOUk9RNtrlTfh1u7P1rGxeyPVoVPyRUZeB5OWzcPli3j2RabG+VHoew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747131439; c=relaxed/simple;
	bh=YPtYVXRxNchYVtoNxYECCpShOcMZmmbhDoSB+1Yqhr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NE61SLsTXUwPFi1v8XVoJu2ULROfNQewLNe9Zz1+GdPJKtJv8FTCAEzqS+/vhkPu4gt5qnrPx8JSgffnLMZugisIdUxICfiw/+tgk9ibVHgo/2g3TRW6zy6Qbsz8V3FsOsqifIcvwhYUAsVw7rT5CKUz2kBeDHiB/IXB0R5PlY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MlZKfHp5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MlZKfHp5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D6B8Fr027584
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NpvCrOWgU5cpFOIl3kofLU9KI6eGSBahid+fNqQr2k8=; b=MlZKfHp50nLFcOr5
	ByhiEq1wu2BEnQk0TX+GXaj2syvGESu4faiOq+99mztJk58Z/oPltKBTzCAbmgxW
	kvKu67aLMUVR0iGzqaQq7F/R9bS8eXy4pfm8EasKEHGVlPZaPcWncVFvu3VE9QaF
	g6utatSvMwg9AhO/5PcdukuEDJZZSPBXhJj0Tmdx+LjvgxAkUe8eJJ8sJBuPSyNt
	EJKEJQTVK6hDN8KpkKe3vNCPaaoM6AwRruPuLdiRA5ii5vqmfBdSpF6XLLwph/Ti
	wN5EdOUfUYEaG2tZS283PP4gYE5pPv2TW1CzxyIoRS7EyGQqHZDLh6FQqejbwh24
	7YdB1g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hy15ycm4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:17:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-30abb33d1d2so8698170a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 03:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747131436; x=1747736236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NpvCrOWgU5cpFOIl3kofLU9KI6eGSBahid+fNqQr2k8=;
        b=fReGs6GmkNr7rB4+Okoss8nPHhkBlojiqpmxoYZgt5gevbs5NZ0VfBrR5iDbSz0+sZ
         m/fzFefqg75wIvOq0mVCHMn19GG3D6RlU+JkQD0FLChiAHbVvfXdkeQx3ZJiyQDlafOJ
         GPxawLH5HPxAeWycIpoymyFwJoInwrhUCqBaSRn8yQvslZSg3yAAiZxiDoe7MBLZjQY4
         RSHnnpg3q2rvVHAwNIayG+jCEYksD2TGtK+dhazEqHIvJ3a6EClyBpbLh+ZDE2R5Tz17
         NjjUVZToEOxxi+QuIg0vDzSWNr2DAxmNoRYc3UOIlHwhq0LhvX9fp4g02dsA0o2YbNI5
         +wYw==
X-Forwarded-Encrypted: i=1; AJvYcCVD9KLIBhTBBDwKf01NPvSu2g9zYwMEv040Y6Xcs/R+tdHXnRfXoOQ5LWpfMC8NiDBcSGvu0/B276cAjOo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV4Hw7yMlWy293tvvxilE3zhhUjhEwxG0dnbWNeydNO0699MYG
	/dmFLr5yE/8FkKAGcqWjUe2XjICkeEuaVQVFpyU7M5vInwVhGh5fHURou0wEMiv1wP+QbkBbCAF
	vya/THUZ0Ke8kD7ICAniUlvGfEJVYzsBaSkaggeGGZiXTt6WrSPK3lMwXyfTY5D0=
X-Gm-Gg: ASbGncvdBjPNfWijG2JHXMmZRK8PjU3G+lXy3xRUR4EbF6vbHdICEyp7O5Z2QQgKbvF
	se/rDPi64uQph5ygubBCOS4qg+oZjjiy5fcvDfviVYfKOFQADStWB5h68BoR/mYobmsLTTDVBZf
	cNsDfjBdo18oDr9vnpP6JLEJ4fbZL4233SHDmkKdYYpC0I7Hb+6MID+9cCYSJZlRe7do5vnVcO0
	pmuPMW/esBdpTbTUxuIuqa3/jCzld1OZTWYytvSPe7kbK+ABaXdh292dJ6tzsh95HU+AnbwO2fD
	OgfMCXivkzEp//16JWJrgdwAp0NcHTihZ+dpqS1UNk1UB0jTYg4=
X-Received: by 2002:a17:90b:3d8c:b0:2ee:b2e6:4276 with SMTP id 98e67ed59e1d1-30c3d62e5d6mr25261869a91.27.1747131436099;
        Tue, 13 May 2025 03:17:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIQSglw62YPtOpiT2/xmAHW933FddDkbyK+ln1dlw68QmpU+bhwWTsjnzGBvaYIN3j8T0eJw==
X-Received: by 2002:a17:90b:3d8c:b0:2ee:b2e6:4276 with SMTP id 98e67ed59e1d1-30c3d62e5d6mr25261822a91.27.1747131435590;
        Tue, 13 May 2025 03:17:15 -0700 (PDT)
Received: from [10.152.194.206] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4ffbc88sm10327508a91.49.2025.05.13.03.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 03:17:15 -0700 (PDT)
Message-ID: <26a9e68d-bce6-4bba-871d-13e2aeee3fed@oss.qualcomm.com>
Date: Tue, 13 May 2025 15:47:12 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next 1/2] wifi: mac80211: validate SCAN_FLAG_AP
 in scan request during MLO
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250513-bug_fix_mlo_scan-v1-0-94235bb42fbe@oss.qualcomm.com>
 <20250513-bug_fix_mlo_scan-v1-1-94235bb42fbe@oss.qualcomm.com>
 <16499ad8e4b060ee04c8a8b3615fe8952aa7b07b.camel@sipsolutions.net>
Content-Language: en-US
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <16499ad8e4b060ee04c8a8b3615fe8952aa7b07b.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -psTVn_ZFehFOQVW782V9pYUOqDMYQQQ
X-Proofpoint-ORIG-GUID: -psTVn_ZFehFOQVW782V9pYUOqDMYQQQ
X-Authority-Analysis: v=2.4 cv=P9U6hjAu c=1 sm=1 tr=0 ts=68231c2c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=C9-73DTKG-V4ExX9xGAA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDA5OCBTYWx0ZWRfX0MjiP1CJLjx0
 PjTrVUyuxZE8i2QUMgf2udnWr/MlwtHP4qBAL5jjWjhNED/1V2c0o5+L1TdkS2hVVLLcKXBq5Tx
 lXqBEtAsX4V3Xjh+WyOuqRKNBHcmWH6LPw6+ZTNw0pU7GPhlYJA0LREv5tzvL36elPOf96zZTXC
 S7ze7R0q/yE81jsXsSH+wgiXI3pzF/gox/NcbZQ57m0dEx6z3k3jFhnww6PrL21lxGGjyCxSQOB
 iY0pGfQEBtx++LonlexzAyCNLhZ7UEBIBUuOVpxCLkhZQz2c1BIm4cTj1ngKvFt3ia6Y09RsOAX
 SmBYKLgi7Fx/5C/YuZ1mugJhQBCUnow4csDUhObbI9Em7vbpig42+9egKz0R5+IluaeZ4pootCd
 UbPtN9Lt9kQK6GzaEN7oOW8YbeR7HdzSTD07ImeliNWHhaTWWPzGpLvq2zxz8Qdqxc5xvI55
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 adultscore=0 mlxlogscore=885 malwarescore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505130098

On 5/13/2025 12:47 PM, Johannes Berg wrote:
> On Tue, 2025-05-13 at 09:26 +0530, Aditya Kumar Singh wrote:
>>
>> -		if (sdata->deflink.u.ap.beacon &&
>> +		if ((sdata->deflink.u.ap.beacon ||
>> +		     ieee80211_num_beaconing_links(sdata)) &&
>>
> 
> Do we even still need the deflink check? Seems like
> num_beaconing_links() _should_ return 1 anyway even though it currently
> doesn't, and we need to fix that?

If the ieee80211_num_beaconing_links() is modified then deflink check is 
not required. Do you want to me to send a clean up for that function 
first or would take this and later the clean up part?

> 
> Also seems the VLAN carrier handling is broken.
With this patch? Or in general you are saying? HWSIM test cases seems to 
be working fine for me with this series applied. May be there is no test 
case to make it evident?

-- 
Aditya
