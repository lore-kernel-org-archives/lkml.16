Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9B51C84B2
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750862941; cv=none; b=ugPHPYBanFFDVc2t6wFZiPdHLR+0ZnM4ykNyAv0CTINXLQuSq1lTtao16Tr7fPTjQOctxxNvcIg5kubnNJqRCebxPKIBMY6O1aSn2pu9mGDs88yXOTJU1L6H7JmZ+Lk0ccEFw3U+LgHszrNGSlXQ3xEGIlpUvDFJeCmpB7duHZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750862941; c=relaxed/simple;
	bh=BWPoKXwqfeDMulZOutw5Fsd5LPnsifJw/UB3yiZ9u3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eDdTZclcOax5El9KpXphuWscaVZxi5vv2WpKDUdhXiUi+1qvG8Ljxj5Z6rPJv5Eb/oz8E11rQExQGmseYVvSvDv8R7WgZSOgb9+Zkq7dQ4pb5gDxU12fuodsHGjz4/u0UWiddNBTtPE2mVuGobvH3nNnhdrBrem6g2Weye9CAew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YDMPZmUS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YDMPZmUS"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P9eLKO008956
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IqGGFhx6AVCTLXfpWHpti1jyp5AazE3wQBZfo+NlLJg=; b=YDMPZmUSCEGdHORf
	VKxpYOmQXtgilnrbYwx3ONk1guyObWr6p5Z2iWrVitTkdtaHr2elr2sP97BlTOWB
	Av4816s0UV4DXyLJMKu6fzlZQoqSFWQwpmHYc998VHerijgYr1H+/zCJrR2WQgSK
	qGzDSjXY5BJzv0uaqxoaPKVrNbZ8LvLU1ZO3qHTIdFP3qXaSFmRdnniaLjFpcgOy
	UXSEW6CNNwC/p1DomXr1IRzyEIAJmjLrOdWz3PLMmbb1u32VrGhTdXco9w9ULIop
	OJg6DZc65BuA0trhL8fK2hjgF2yxhB/wjF4CcbyGFBjo78BvyzigiYFCAewrGGXM
	BMaNkQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmswfw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:48:58 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-74928291bc3so9611b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:48:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750862937; x=1751467737;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IqGGFhx6AVCTLXfpWHpti1jyp5AazE3wQBZfo+NlLJg=;
        b=JHK3OONqqblwLl2yJJuMt9ubKC73BHQAZ087+Mbc3nwCfILwQqXmNWq91eoMOZmnNQ
         ulCZvJOnf14Cjtp2DL65uH4MbTNU5jp9zTXenYF2IYBRoJoK36lQ81GVNLeqGbzu3OMb
         +66vZjRWYdWK1QFQLGDIrVJFzNXk0/q5eixSacEIwxAXgH6jCyGKcmJa/yToZA75jlqV
         oHf+t/wp1VPWweq+IHd4qOEh6DnEE3BGcFSToA70ai4+QSTZ0nP0qTm6O07QRNzgC/S7
         reM9TWAspG+7SQAXgvFOIM5SUy4sQa0XSrJNWRKCA6pLsu6fDuXBpPenRDDlP+sa5qc7
         j07g==
X-Forwarded-Encrypted: i=1; AJvYcCV16oYGcDaHySahM3uJO6UvlxJaD7OzrgEnTgME1MaphJCFLzuKidNO0ADd9GxUPO9PQR2+e4a60z+6ulE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGpqpNV9/L82iqD0YaSMagQPOCMG3Eaqf26nmNULFLSsbpTPaZ
	me0pnaMBCNLPsfwyxY7RlepNUAIswh3K+U29h/mdKQK5Js7Ck25OLKfkmL2Elptk8/BmH+xPdku
	yJhPcT9SNvf+GKTBs5VC1kJI0SiKabd6DDchEHp75p8KuWAaUJ6sAsS9XXSZCCmSGUUFGgogQL3
	I=
X-Gm-Gg: ASbGncsXvo0tViaki4neCJCRUV8NkXXpRTk6sONJIcfMz6AZEvxjivqAXR1PiPYyFHk
	NAiPRzHr27NSQu0v9fBOtuCtMrZkxmEgR9tiiTpbFYpMKaDLb0G/2p/lXRak3Uz8aV4i0GcCUr5
	uZ6BRf9svOfJlO+jYwZOD0P+nZh9P8gyPXPzdaYaCsfxSzmkqt4a9fn2CLwZvylEspzIER9t9Jo
	apNuovaI3LgQHUtb3PkpSPn/OHatXMbC4O1nJXMsDOI3FmmfSTJ8CNKCFWQsVEdfi6E7hVVYu3q
	4exrlQ4JG9KArJ051YCPliL6KD+qRI4RwoyEu/qNKHhbSr55edambrXBusoRCepi2XLYRZ8g7+M
	r2Q==
X-Received: by 2002:a05:6a21:38a:b0:21a:de8e:44b1 with SMTP id adf61e73a8af0-2208c610eeemr176604637.34.1750862937310;
        Wed, 25 Jun 2025 07:48:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+XHscp/yEzgIUgr5HvkN796Je8M5rUAoryyGJvsCBmHFT8xX3ENlpIX1qc5J+I50JLhQlLw==
X-Received: by 2002:a05:6a21:38a:b0:21a:de8e:44b1 with SMTP id adf61e73a8af0-2208c610eeemr176572637.34.1750862936922;
        Wed, 25 Jun 2025 07:48:56 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f124249bsm11161411a12.38.2025.06.25.07.48.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 07:48:56 -0700 (PDT)
Message-ID: <e23d7674-31cd-4499-9711-6e5695b149c6@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 07:48:54 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: install pairwise key first
To: stable@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Gregoire <gregoire.s93@live.fr>, Sebastian Reichel <sre@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Johan Hovold <johan@kernel.org>
References: <20250523-ath12k-unicast-key-first-v1-0-f53c3880e6d8@quicinc.com>
 <aFvGnJwMTqDbYsHF@hovoldconsulting.com>
 <2d688040-e547-4e18-905e-ea31ea9d627b@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2d688040-e547-4e18-905e-ea31ea9d627b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mMEHzrH22BSrVbCL0UMMITk-pd2Vl9Hr
X-Proofpoint-ORIG-GUID: mMEHzrH22BSrVbCL0UMMITk-pd2Vl9Hr
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685c0c5a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8
 a=bC-a23v3AAAA:8 a=COk6AnOGAAAA:8 a=dh4-YsZgxDmbEjmCT7kA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEwNyBTYWx0ZWRfX/V6XT6FRC/51
 AssI6COi6s7EXg51TgkIIAyIHQkqxQQfBI86k+v1RgCYEvz6nPxHJBQSWoc5+rew71eLiAquHij
 EBAtUznIWHR+IQFS6jw2q6rFJB1LOjI8hkZSSq682vwDCrxGBbnpfPEWL9SvrM849ZORIUa5I06
 M4ZePGnW8dn4UlReDdoxFpkzLQQadRcXNPMBl0+x5jly8k87LkuRxQRH0cKO5OW+Y0pWJGLXi5Y
 WhDJwKLUIP+GnoeWL2v0It5jDlsKK8cV5rwq0fQ69ygW3yL2kMeJ68n7Xldl6D/tQc2kxZYc+Ax
 dd0DlXPN0oCZuW+SFfI/jfwrhfwSIdWtBvkuofbRIIj3BPwqB4RMmtLe7M/rlyDRiQ/2XLugo3V
 RjxrBVd8LNdIkHTUf250/tlVd1nHefwreKGOMzNq4U2Fnv1Te42/0hNC7TRiQfzrSqE+RbnV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250107

On 6/25/2025 3:15 AM, Baochen Qiang wrote:
> 
> 
> On 6/25/2025 5:51 PM, Johan Hovold wrote:
>> [ +CC: Gregoire ]
>>
>> On Fri, May 23, 2025 at 11:49:00AM +0800, Baochen Qiang wrote:
>>> We got report that WCN7850 is not working with IWD [1][2]. Debug
>>> shows the reason is that IWD installs group key before pairwise
>>> key, which goes against WCN7850's firmware.
>>>
>>> Reorder key install to workaround this.
>>>
>>> [1] https://bugzilla.kernel.org/show_bug.cgi?id=218733
>>> [2] https://lore.kernel.org/all/AS8P190MB12051DDBD84CD88E71C40AD7873F2@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
>>>
>>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
>>> ---
>>> ---
>>> Baochen Qiang (2):
>>>       wifi: ath12k: avoid bit operation on key flags
>>>       wifi: ath12k: install pairwise key first
>>
>> Thanks for fixing this, Baochen.
>>
>> I noticed the patches weren't clearly marked as fixes. Do you think we
>> should ask the stable team to backport these once they are in mainline
>> (e.g. after 6.17-rc1 is out)? Or do you think they are too intrusive and
>> risky to backport or similar?
> 
> Yeah, I think they should be backported.
> 
>>
>> [ Also please try to remember to CC any (public) reporters. I only found
>>   out today that this had been addressed in linux-next. ]
> 
> Thanks, will keep in mind.

+Stable team,
Per the above discussion please backport the series:
https://msgid.link/20250523-ath12k-unicast-key-first-v1-0-f53c3880e6d8@quicinc.com

This is a 0-day issue so ideally this should be backported from 6.6+

/jeff
