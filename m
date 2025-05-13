Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4004828689C
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747133808; cv=none; b=ZBhFe2DvmXVtpymTwisJu0krAKgXaTaYbBr9aVte3HvNqiy2BOrDyonyw7a7y66RKQHUwO731k/s5xfH9efdDYlLIxYm7+arh/igIE2wAwQP9nJdMpZTBR+3of7aqGhtk4fyWhllWKBlU2ZfJuVzLSt58BTYlLDjAX6yumn39eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747133808; c=relaxed/simple;
	bh=L0oZNBNb5KDSBD1YnNTVQFxqf67QjDSZupvPJk8sUXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BbN3xuqr9m0+0bZbjKRQS9ua5FilB/wqlrohbV5CjDzsSZJq6cSgjc0n6NvseRe1CIAqBwBsX+ptqpsdSwodDLDcQ0e1cnj8nnpT8Qru+PbB+me4lbgEYHhS5mVxZ18hZHkqhuMMpdeFV69kCwR1/4/VlDP0N6ossc+Mf1/Np4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SIM/Tavf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SIM/Tavf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D6B0Vp026907
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:56:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FJBRR62o3uX80SBDIqqnKU3aMyKpPYvJPwwRrE8Tb+U=; b=SIM/TavfqUtrS4Os
	xK0Wqdv+B/IFHjJnB8P+MJ11WLhBO1ScJcAZ0QXSwtNwzaRKC9Brh+3EeaP5asdf
	FvKo7Tcwwd//7eP9ONY8jGtieuRMnnHZQrhdYVT6Bta1/GIFXHZ2cOrXbQ36UeiT
	RLIkKETEHzTRkM7J+b9TRGDFayAOr5T2JLwSjRJchJGGvzeoiTmg2zM50meU95u/
	uDQ3liyCR2FlwWeoykTv396vN47fiTxtnIWTiZjyL4AuVg51UHRkTqZ/zlUTxOdd
	eiPNcfl/B4/2e/TWBAnbDie/q3/CQ1WijjZA56TC72keJDtgYa1geDWtpkp5lS2E
	eQ2ikg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hv5qfrsx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:56:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2318043effaso8435395ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 03:56:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747133804; x=1747738604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FJBRR62o3uX80SBDIqqnKU3aMyKpPYvJPwwRrE8Tb+U=;
        b=u2gWqCbcFflN8popWRjMN86OiwQmllfFJkemX78JM77ckThU0q43mmIdamilqfovhL
         0rKdHemwALcIhkOe3kN4IMx0b7lE4XSicqqkWwFWNWxsqR3+/jLyaYkDP3yNv7anDReu
         po9ch/a6MF5PDiRHwUewOCZ5HLMR/sUacv8pijUlKBOGcTDYglSoT0m3+7Spc22g6+6V
         pKAg0jNN7n4dktaHEDZ97V6yNpELZdEjnPX3LjJkLjGGcdMA2vG01NBbzA3g14wcopxc
         wVdiW46oTezUjJ58lPI6NXxhkUspgcjK6kOfADi0C7vPk1pJinE+2AaSJljjJCttacDv
         DVKQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9+l2256eQpgP9gSPQ9ZZBdMibkTUp4PtvH3+ESoTCyS2K3AtC87lXhsqiP6y4aHnWUOE2BEJCkv0Xi3A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgwc6f6Bacobh6vkfbhEvPGxOzIZpfSDMZMAVsY3PmwHxSy0RG
	w1EClJupbbXe9r5MpQOn0xkMY3EB3OX2hj7z7CLlrTOx5gn0mLZrBB+p63i1ApkdJz8wxLv+UXY
	pT4BbPESEnk65bw0Vm8iZF3PvrzFkqtasCxiGxKFQ3AN2WCsWUJtmlnKPdvAHXfg=
X-Gm-Gg: ASbGncuEDnJ8xBYCYsTZdm4lxQNpTtJdsKt9/l/sXMykbKAq4Pxp84GSxQG5dmQd9v3
	RelU78gkiSokzOEyLH5E+sVN7bQS0lHZeqoBzX8ucyGF5r5pqvLdp8uewp2AN3Yl7K+deFPCjth
	fVeKEn7tMSDBsvuqmEJ9D6wxBDtD+Bi+mByit91jM1ZOnGTLKrULhjWdOHVi5dO1Bd6W/r9Y6rV
	MU3tUcudhYdXA1Hv6+PwsMZZ0T6HgqMcikfr8hW8DSbDqYzHivFv5o+YRdsAFpEnQA0q8V4O4zB
	qM7mwTp8g/Bf/b71jTUV4nL7P7x8Q0evsr5ZB3tznAsGJifh1Zk=
X-Received: by 2002:a17:902:f70a:b0:227:e709:f71 with SMTP id d9443c01a7336-22fc8c8ccf0mr254953135ad.29.1747133804455;
        Tue, 13 May 2025 03:56:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsf5tREbUMFBBtD0Hz+Z0kckWcjsKPrOZzQurZEc/5IkxxH/Fa6v15+tlLj3WYvlCqbZehBg==
X-Received: by 2002:a17:902:f70a:b0:227:e709:f71 with SMTP id d9443c01a7336-22fc8c8ccf0mr254952835ad.29.1747133804060;
        Tue, 13 May 2025 03:56:44 -0700 (PDT)
Received: from [10.152.194.206] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7540056sm79235615ad.23.2025.05.13.03.56.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 03:56:43 -0700 (PDT)
Message-ID: <772514cb-298a-40b0-9a33-a7dfcf037bd1@oss.qualcomm.com>
Date: Tue, 13 May 2025 16:26:41 +0530
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
 <26a9e68d-bce6-4bba-871d-13e2aeee3fed@oss.qualcomm.com>
 <296b9aa887022258f8ec8e4f352822c24b41ab82.camel@sipsolutions.net>
 <77fe950d-c5af-4c28-8b0b-bd1aa08d885a@oss.qualcomm.com>
 <d211e634532031322a77053ff912394714b5ff35.camel@sipsolutions.net>
Content-Language: en-US
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <d211e634532031322a77053ff912394714b5ff35.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DqtW+H/+ c=1 sm=1 tr=0 ts=6823256d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=yWWtvJtKPxVNrAc7q94A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: TQl6lqG_CuVQ7p-9rfje9WV1Tb5Q8jDd
X-Proofpoint-GUID: TQl6lqG_CuVQ7p-9rfje9WV1Tb5Q8jDd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDEwNCBTYWx0ZWRfXySJzLHvxEBWv
 yPgqvV2/QD+dL1hnoEgGIfsqLSqH/feyUyI2jGJtKGXjKwxGfXCIehLq9Q38CQEQrQKnJf7+kxP
 CbnEDoFNHjjF8jy5q0GquzLlrFsP2o2QeWtj9ARPiYvgcvQy7CBzzb9f1Wnrb9VYENlrq4WXxWS
 pU9av0rdPfzovwNpSFF4Nu1HrOPHlNi/O5jmmYXXEPiZ7z0CNC3moG1+vSswGf/+/+4t8AwcRek
 q43kDblB2p81WtPvG3BF5LZdRoKZTtP8QhueK8RLoxpX6ABN7iifcEU1vCCSFX4xjAUwFaKRRX+
 qJvGVuEdU5oLvJELjBgQdPri6PlX8XP3bvajVhKl4dPcBESgS41YYKhGiuXXTGeFYque2ARr6U2
 YbwdUyjoXxySEDwQROzywUSpEO++B/RBwzbKBWfcIem5+Pq9xgd3hSFmarv6uF6Ge8HVe9B5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=757 malwarescore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505130104

On 5/13/2025 4:18 PM, Johannes Berg wrote:
> On Tue, 2025-05-13 at 16:02 +0530, Aditya Kumar Singh wrote:
>>
>> Okay sure let me first send a clean up. So,
>> ieee80211_num_beaconing_links() should return 1 for non-MLO as well?
>>
> 
> That would seem logical to me? For this and many other things non-MLO is
> mostly equivalent to just having a single link (apart from the address
> translation.)

Yeah in a way true only.

> 
>> And callers should test for == 1 instead of <= 1.
> 
> Not even sure that matters enough to need to change?
yeah can be left as it is. Sure then I will change the function alone to 
return 1 for non-MLO case as well.

Thanks for the inputs :)

-- 
Aditya
