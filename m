Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE15025F7A1
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747758259; cv=none; b=B+knRWIiuMpTi096c0Vu1I4Z/m6Lq1jprnGsuwaA395nyFK5ZfDdXATC1A37Q4LbHCTn7ZvJGBuxd6mZ7c6PmY9cFw1d3E1Iol5qFhwOK1oydMhKbWBkEHJ5wXKruNTrgeOWg4kOeqjsN3ZBqNFALUtdRuRcBcUvj9tSMLV8Z3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747758259; c=relaxed/simple;
	bh=78FknOum4lTKjAsvc0eg0s/POGfcidIyEMOYhOmAsbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ctE7kCZi0zlGWlyyZtrlxyTFK4GpqoXheSBrjxeS3MKI/FiBDBejfF8qWBg3C8cFIVTTuLi9NkT3PJ/KFR8/GiR9S8aHTQnIXdZWXaNqH5AqskvfX5wVOO+VWhFx0ZlyPu4fn1PuVbJYTkZ4uF4nS1dpYl5xb6vk650Gxw8llqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d+1/SusL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d+1/SusL"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KD60nN023174
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mc9lmRtD13pABVPVoQTWMKl9Pn96ta+l7ubkM6Q9ldc=; b=d+1/SusLrTES4XDg
	ye4QI0EKcPjS9Gz9gK3gLODyPkHYdHcXpAdKn+X5iCVm/jws3Zuro4jKHIYhZKsf
	I2xkOU0Dh8HOURBhX15WQCLHr0g6W2n+RgJA2ZXtX+nI8rcEc0N6APEAt7fxk1tq
	KSkPaN1mVEzbY5r7pFUGiq6gDLLApgII0ovhv+8unKJZzoEDSNBKAJjbQUn8aUuy
	WcosqCX1BQg+wUyiQxGWOhWLW+wgeGSRyR9slk5Q0tP6WcNEhhbXk+y+68uE/0Ye
	ILwNFBQq7ku6aY06hjlfcwCUq3a6oQLSujMUW+sAZO4FveWb/ICt8O81Dx2aEKd8
	UKbu/Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041vyrq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:24:16 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-740adfc7babso4797365b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 09:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747758256; x=1748363056;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mc9lmRtD13pABVPVoQTWMKl9Pn96ta+l7ubkM6Q9ldc=;
        b=PWq5fVKijW9QRjU8RaQmEjbAS+jsz/4sdvle+4iQrc7aXuJIddFbsVLsFyWwj+ORYr
         up01Y9XPR6nw7l6Jm7RxuoH6BxXpaxO7Xy71ujbXHV9ugRqMewrZQczGHZu4WrFuk4Ic
         pGsmxP18vQV9xXkkFtfxDplqzU9/qzpbyLyEhK/fVRvOQkfX9eR/sS6ufkALoFe1FLnV
         a2aKhINK1Yci+0fKHlSQYyPcTfFNTvQSPMHGE9qnJE7dhLmod/SGxBEA47S3U2Yk2IVS
         0I5b402zMmLXUMMFO37NAQn8HplR34BZai0Fh5CKFHCm3wtJyIB6KMJGxEVGWKCwhu7m
         6idQ==
X-Forwarded-Encrypted: i=1; AJvYcCUU4o3JIYeFVGKMR9h44htbd8VQNPCApRmGvEyxZe6PbfPtDgczp0cV9TKzlqXmZsQg73mCmZ+biHgOzcA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNvZqRKXeJwdiwxGggnDemzzYfT91ItvZdUFmCDtdeD0jvwPq9
	htd6Tu3lVs9NbfMldwRtUMiZHhBDhqnc1HJ2Rgn5ulNCK1xUdAZ9dSSgQyPSoMI6T8m0ZKmR+vt
	1PjMindHKY2AUcDhicv5Q6xQkCLs6wZvMRhrhLtUUOK7uozQHC+l4MJ+qlwGcPUZ0C7o=
X-Gm-Gg: ASbGnctDUwj+DqXot5DVfFiKCMGMOeGVXlw86qYmtGuzQWyUHvJVGjzjoiHuzS8cZhh
	/kXhip859ENoZ0s2GYYVAVRCLUg2rhiHZjuJ02SK/dwMCoyMwRszZxvTCR4WQGLiBsZBB1oHmNz
	ezKFYOIhREAfT9K66YFXC6nP7P4kZKl1+us01hghzHPhQBvfwDKP4/ErwP5sjY7/A+b/U09gwZ6
	3INcONEzZDgQh0V7zjGICAWYcZBgnGZJk5iNB/teJCJ/WBSXtxCEXGLtys38O7kd+/b3oTykzYL
	dhu+vnuUNxQRJVVRhleJnbCVIynJDpsCA2tZq+QUlEuw3Rzb2G6rtmuIpQ3UgD7a90Y=
X-Received: by 2002:a05:6a00:c8d:b0:740:6f69:f52a with SMTP id d2e1a72fcca58-742a9616b19mr25038851b3a.0.1747758255957;
        Tue, 20 May 2025 09:24:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEM+P6tPnRzwoG1LUunHMikooT1SPgxABIhGAL5dyz7d1cGea/fg3o8MHyjvxeUEbIWNs5Feg==
X-Received: by 2002:a05:6a00:c8d:b0:740:6f69:f52a with SMTP id d2e1a72fcca58-742a9616b19mr25038813b3a.0.1747758255475;
        Tue, 20 May 2025 09:24:15 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970d5c4sm8362171b3a.65.2025.05.20.09.24.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 09:24:15 -0700 (PDT)
Message-ID: <54f50afa-3267-4829-8be6-1542c3fef606@oss.qualcomm.com>
Date: Tue, 20 May 2025 09:24:14 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: carl9170: micro-optimize carl9170_tx_shift_bm()
To: Yury Norov <yury.norov@gmail.com>,
        Christian Lamparter <chunkeey@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250326155200.39895-1-yury.norov@gmail.com>
 <CAAd0S9BDCqw9XZSe=r5fcJuncUagJoJJ0jOe3fB2=UkyXgjozQ@mail.gmail.com>
 <aA5McagnQw49MElr@yury>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aA5McagnQw49MElr@yury>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEzNSBTYWx0ZWRfXxgsQGyJB9tGX
 OUQ8pLDI9y/ecHg+C4IItWc4p3cIbcSps56qqk1UVbIiU0cNso2kHWzzzQuBLkBix5YoAxOULKH
 gwbYI506K2CaNUtHLUGnqSxu+cWyYotaB+E/a8PGbYEMjobBk2rI5zQ76G+JcqFO5zK/r7j/7iz
 8UkgFf8msvKgAYBDRB+yegpkZl3u+qRrAxnltxOxAHbhjQw/G2LxCfjsY9Sf+OTJZwT70p4j3nS
 1ly+g+N5ZyOVVnQ9mGGLWMMNEtzHxknxocJSKrpAfkuX/O+0p1gDo2W3oKGSUWTPyV1DESpend0
 B64pJu7SOVxOkvL2vZXz+rC2XrR77DY5tTILm33rRNhrTJa+tCQtK6bxKhJ+VMNbqvERjWdIHij
 txQ0I7AXZUMq596PTViPM8FX69WccmI+TeJ53xxrZtXbeLustaVXWTKJFGaW1TqpwzZ+y4Rj
X-Proofpoint-ORIG-GUID: 3w1QLjBvKncLl7Yo7LNqmldF8Ju-fp46
X-Proofpoint-GUID: 3w1QLjBvKncLl7Yo7LNqmldF8Ju-fp46
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682cacb0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=BVo14XG3ICVPsTfBwrYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=642 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200135

On 4/27/2025 8:25 AM, Yury Norov wrote:
> On Wed, Mar 26, 2025 at 09:00:33PM +0100, Christian Lamparter wrote:
>> Hi,
>>
>> On Wed, Mar 26, 2025 at 4:52 PM Yury Norov <yury.norov@gmail.com> wrote:
>>>
>>> The function calls bitmap_empty() just before find_first_bit(). Both
>>> functions are O(N). Because find_first_bit() returns >= nbits in case of
>>> empty bitmap, the bitmap_empty() test may be avoided.
>>>
>>
>> I looked up bitmap_empty():
>> <https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/bitmap.h#n423>
>>
>> apart from the small_const_nbits stuff (which carl9170 likely does not qualify
>> for since from what I remember it's a 128bits bitmap) the function just does:
>>
>> |   return find_first_bit(src, nbits) == nbits;
>>
>> so yes, find_first_bit runs twice with same parameters... Unless the
>> compiler is smart
>> enough to detect this and (re-)use the intermediate result later. But
>> I haven't check
>> if this is the case with any current, old or future compilers. Has anyone?
>>
>> Anyway, Sure.
>>
>>> Signed-off-by: Yury Norov <yury.norov@gmail.com>
>>
>> Acked-by: Christian Lamparter <chunkeey@gmail.com>
> 
> Thanks, Chrustian. So, how is that supposed to be merged?
> I can move it with bitmap-for-next, unless there's no better
> branch.
> 
> Thanks,
> Yury
> 

Yury, did you take this?
If not, I'll take it through the ath tree.

