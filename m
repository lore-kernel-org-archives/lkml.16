Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4C22459E0
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747132379; cv=none; b=AbfAElw8yJA8akU6qQkzHyJWK4QacPQYev04lcGBbfcFqYhjhEiYC4u+3e1mmvp7mnkgv1SCxnQFU+alAZwe8A4CZZQUXfntfZw5F3uYk9mFriUDSGOJg85Fsy5sjq6dLUyqAMvI2g3au3uQ83o2gLNbqm/CzFZTBdqwosFFvkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747132379; c=relaxed/simple;
	bh=fIknUjS1XtgaI3FZc6s+eW+eel0rIdNdOXW6UlL7dvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uDfP3IWcyXTPSV8LQ6HuLKpqZ+qQ1SzIV3kKAkumHzxrvK3RL9PBadzE1IreWcd702E4ty+V+VZG+Uvl/TKMa2OwOO9KsPacOgIteANDh5ZVxGWgeGhzunj9J3gXouXbfCX6ZFRLbkJM3Qk0sEJCRtP60Mdcd70quMJcDQAyeaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WmBxnHpt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WmBxnHpt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DA97Dj023403
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:32:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	80K8zTIHjvxTDtMVey7EZJVuLn/HDFfHo4duh3kKXh0=; b=WmBxnHptmujpeUke
	2ePNcF5gd15OziElRoBAPeq7se4WGaNvW1UKvNGgeEKTEM/OtLIlvm9B8+OjJXKy
	T12KiH3vAiiDY2WaGLQ12g65ELP6N/al7EvRdiguhzrOvLD9NUQY92XAoLirORGK
	ijuWOUIdGSGujWjjvQ4+HpRdMjaqfmKFBvnPZZd5KMO4y2TuiIf7z2zSi8BT7H+l
	PxfdrVTcWRyJilcwbqO06sc3YAdH1BMnxWjzDIQCuJiOFSw1Vl517SDiEXUnrnTl
	srSMwylMr4vN7NkCzGl7JEUPnJRjJGk0xPvF7oVBB37m5vd/oUkayPvP6yzaW5jZ
	qmJPJA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46kcfekwgh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:32:56 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-740b646ff9eso4047409b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 03:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747132362; x=1747737162;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=80K8zTIHjvxTDtMVey7EZJVuLn/HDFfHo4duh3kKXh0=;
        b=qnPGsJs6T9Gy//f/xQHILHt/7ap11pFJNEml25PCpUiGy9ATkEff5mcbBrTDZNhljU
         19lEqB5UmsqpRhl9wPEyEwM4gJK6TybEcLXnaqGgXTXjnZUmPbJp5CS7RL+deWbNw70R
         AwH0NwCDpPCHdY7gA3X/iJmM/mqBjjdB6DuTxAZrJuNhnUUVRcOeBU+x3cR/SnPk4kNf
         SMe55Hdcu4YZGXF7zo0guNcvmLbdlteKB+2tBQl1JeenoJTyl6TgBD1nhy6ppn/8Nr1n
         HUDl4HzH6SK0e1/Op85Tf6DaqoMW/7rTsXBP7FXBsEyFyPEZaEFa7bo3+HZkzMSG9uBS
         q7Rw==
X-Forwarded-Encrypted: i=1; AJvYcCV6+fJYsOn4hEV2zGz8993J96NbowbUtWU9ISlUPu3X1BJnFJ0cLhzG1e530O44ogRIqirg1wQcajRLMcs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNOSIN06a62jODgFs9XTS4RvcETxO4aOOK4Pb6L+dxA58twEql
	afPAAgDFNxCP4n2C6Y7wprV2z988r2FRjAdOyat47DGN1KywVXmnyxKb0oGl2yVxXhCUMtoC/N9
	RCCdeoB0cZatxTqhQXjmYk89fkdIL8aZ9l9WBFRh5UTzXtncoIDj5ygh0aR/yNEg=
X-Gm-Gg: ASbGncve9Sqnu6LEUmvfGf3L6e35TjF7DRz/v+M1D63tXC4VIrG8rUAmsqYdexMYIjx
	HUqVAb7AoR7zwxddy4jxYXHkVwVCBfkRqmG5KJ9L78UNtGO7OZqD0KVEkffzoRYhCKIBdHv50LV
	RZyncje3vF89MPH317XudEP4alHXK+uUIKKFrFTVKmtIAsyn7NUCFuaXlynGKQX7ZxQu0vVe2BU
	0lJoiKUGbG8/cklNDDZH1fRSYonERdsvTo4+jI6Is/uwIJCCwbS24eL0CAcVhRXDv7gD6x/nHC/
	a1xoOaOUeXXp10FvEheWunl2tnp30gjfZiKZvZ3nadarycMjEr8=
X-Received: by 2002:a05:6a00:3d13:b0:730:95a6:375f with SMTP id d2e1a72fcca58-7423ba80629mr25483059b3a.3.1747132361862;
        Tue, 13 May 2025 03:32:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVv5+BmuvzpUk6EEcXm3Jh57l9QOl/5KvtwXrYrZ/pE2KoGIXo6ZSBiWel7SIYlvXUC0O9mw==
X-Received: by 2002:a05:6a00:3d13:b0:730:95a6:375f with SMTP id d2e1a72fcca58-7423ba80629mr25483022b3a.3.1747132361418;
        Tue, 13 May 2025 03:32:41 -0700 (PDT)
Received: from [10.152.194.206] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742377046e8sm7785038b3a.11.2025.05.13.03.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 03:32:41 -0700 (PDT)
Message-ID: <77fe950d-c5af-4c28-8b0b-bd1aa08d885a@oss.qualcomm.com>
Date: Tue, 13 May 2025 16:02:38 +0530
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
Content-Language: en-US
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <296b9aa887022258f8ec8e4f352822c24b41ab82.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDEwMCBTYWx0ZWRfXzErT6WfF9liD
 qMbCpyJX7Hk/ytI7CuvBSqPQqbJvSIo8Hwfzbpq3BHYc64Mmwinpp0DYTlMJHGoIG2qxnzArD6A
 ZddDTiLEZuVTWKoc+LXhfQyl6X4eHGn9FzxPrvRWH8JHI28/FYlXnxu1YzqpxP21rV69o/BapV6
 3haHy0kxxlIEWOdU7z/f+ucE67csG9mjkgz8ty9rBcdEiRUK5f4WfJ9AtJ0G7o5XcWLvTs+W9mw
 E3h8ZnqCWunlOzGli4cn1IeEatKgEEjXkCglxkfNGNuR3oF/0++OIVSYwy5NTg6VAUTF2jLbiuq
 WlP5JPSnLVIC28BxAZ/B9H6iLazB0xWSDzYmn/re6y2z32UaJWkEygsnnaKjNugjPjQq6y+247L
 FIrlo2WMiMf9fTOsc7uRrM1UjV6mj0JPl2asuM/TAdSP/j2IP2oVI1lcllluuXAbAN2o0fH4
X-Proofpoint-ORIG-GUID: gacl1C2-5GuyQi3vSMrUIO6xN99uUVVo
X-Authority-Analysis: v=2.4 cv=asuyCTZV c=1 sm=1 tr=0 ts=68231fd8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=vm-PoD7xXqttJQO6OBoA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: gacl1C2-5GuyQi3vSMrUIO6xN99uUVVo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505130100

On 5/13/2025 3:51 PM, Johannes Berg wrote:
> On Tue, 2025-05-13 at 15:47 +0530, Aditya Kumar Singh wrote:
>> On 5/13/2025 12:47 PM, Johannes Berg wrote:
>>> On Tue, 2025-05-13 at 09:26 +0530, Aditya Kumar Singh wrote:
>>>>
>>>> -		if (sdata->deflink.u.ap.beacon &&
>>>> +		if ((sdata->deflink.u.ap.beacon ||
>>>> +		     ieee80211_num_beaconing_links(sdata)) &&
>>>>
>>>
>>> Do we even still need the deflink check? Seems like
>>> num_beaconing_links() _should_ return 1 anyway even though it currently
>>> doesn't, and we need to fix that?
>>
>> If the ieee80211_num_beaconing_links() is modified then deflink check is
>> not required. Do you want to me to send a clean up for that function
>> first or would take this and later the clean up part?
> 
> Given that you're targeting wireless-next for all, I guess I'd prefer
> you clean up ieee80211_num_beaconing_links() first? But no strong
> preferences.

Okay sure let me first send a clean up. So, 
ieee80211_num_beaconing_links() should return 1 for non-MLO as well? And 
callers should test for == 1 instead of <= 1.

> 
>>> Also seems the VLAN carrier handling is broken.
>> With this patch? Or in general you are saying? HWSIM test cases seems to
>> be working fine for me with this series applied. May be there is no test
>> case to make it evident?
> 
> Oh, I meant in general.
> 
> So here I looked at callers of ieee80211_num_beaconing_links(), and many
> of them seemed wrong because it doesn't handle non-MLO? But now that I
> look again, I'm actually wrong, it simply always returns 0 for non-MLO,
> but the comparisons are for <=1 which makes that ... OK but unexpected I
> guess.
> 
> 
> But still - also unrelated to this patch - the VLAN handling here seems
> wrong?
> 
Yes VLAN handling with MLO is not handled with the change which brought 
this beaconing links API.

>          if (ieee80211_num_beaconing_links(sdata) <= 1)
>                  netif_carrier_on(dev);
> 
>          list_for_each_entry(vlan, &sdata->u.ap.vlans, u.vlan.list)
>                  netif_carrier_on(vlan->dev);
> 
> Shouldn't that loop be inside the ieee80211_num_beaconing_links() if?
> Also on the netif_carrier_off() side? At least someone was fixing VLAN
> vs. MLO recently, so maybe that needs fixes too.
> 

Yes. MLO VLAN changes should handle this part. Since at this moment, 
code does not claim to support MLO VLAN fully. So change introducing the 
support should ideally handle it.

-- 
Aditya
