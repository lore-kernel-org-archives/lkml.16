Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1CE229B01
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 12:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747656601; cv=none; b=NLlzeZ5ba0Tg4GVt14QUDc/L22doynmTr0Qs+JCoPavypN6fBQrgS4Fq1QmcUNhuYXE9wy7ad3hSQ44U61Lk74Kn2wvQptfVH67zs2kgiLunUoc4k5QZVaVRaJR9/r6KOzR0Occylc90becSffC4ycxxRBK6hMVWALibWRo8ass=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747656601; c=relaxed/simple;
	bh=Pgut8ZjMyr0NTlfHoF6yXgMU028pGxS3AbHjXb1tR2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XO3J0lxZU2Xz8ppmhcNNioedZAR5D285pv309AR7q9oaSeo2WFmAIfzHiqZ8YCm4OKgp8olR3oM+bJCXD4aNM6vjyktfZMk4nlIgH3J6kN1vkXPfoN0JpudF/amQGdz7Gbee+QVY4FwOdFdNAxVFGOyD38MEzVNP5QoiW/xf5ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=WemaE+aV; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="WemaE+aV"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J8pPMh026423;
	Mon, 19 May 2025 12:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=6HjKwk
	bjH0v+VYGeLtWTVwCNk/Ab/ZykYHze5U4aX5o=; b=WemaE+aV9GRNK6oT2q1kXE
	/4t8LpUBZlOol9HfUg1jd4D66dmTTLTMCBSZ8rk/NeR92Mezc8BvL5mqMmD0NUWj
	44fCFuyjgqR9J/GIAgR5sroQLmc87Hb1BfkNdgwXjDC78k2Nq3ykWEc4t76Iw/Ey
	R7lxG0tELRiAD/nAZ+WatB7w8VWhqhZ1B9ujySuDHspAyP2Y2/LPxAlAN1G6J/BE
	czuMYaE1xVc1TY6CNwDJhO2M96BPR47wCj2fBkxci79aIdhhieHPWSbjXpuvFZyg
	L1jOkaldQr1CtLKW0V5227JHzIrQgJqbDPreL2ps9VUTCn7l3QvmgpeYun8kCkCA
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46r1ggrv8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 12:09:49 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54JAwOCs005303;
	Mon, 19 May 2025 12:09:47 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46q69m6ed4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 12:09:47 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54JC9kpA9175578
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 May 2025 12:09:46 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D55A58056;
	Mon, 19 May 2025 12:09:46 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 099BE58052;
	Mon, 19 May 2025 12:09:45 +0000 (GMT)
Received: from [9.111.91.185] (unknown [9.111.91.185])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 19 May 2025 12:09:44 +0000 (GMT)
Message-ID: <e3a3a1d3-cce6-4bee-b90b-f75faace14f8@linux.ibm.com>
Date: Mon, 19 May 2025 14:09:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] zram: support deflate-specific params
To: Herbert Xu <herbert@gondor.apana.org.au>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Heiko Carstens <hca@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>
References: <20250514024825.1745489-1-senozhatsky@chromium.org>
 <20250514024825.1745489-3-senozhatsky@chromium.org>
 <bec7391c-e40d-4633-a2d0-881eb6d18f19@linux.ibm.com>
 <ystv6cvrdllh64eqkislh47a3bnx5d2lk42ox4eiuuubioin6u@gmt5pwbkwiz3>
 <aCVcsB-M9cKdq8d4@gondor.apana.org.au>
 <2bnnkkwhqor73ls7dvsxlt57tp2u3xf2o27opkveuqwgh3xf2j@5kzgq4eej3cw>
 <aCVeeWCawIETqkfG@gondor.apana.org.au>
 <qddzdpkjsi6plu7jih5vau3xq5kjucnocoeoz7ewqbrzoiwgt6@zio43bbj5r2z>
 <aCVhr6fKFnZklcM1@gondor.apana.org.au>
Content-Language: en-US
From: Zaslonko Mikhail <zaslonko@linux.ibm.com>
In-Reply-To: <aCVhr6fKFnZklcM1@gondor.apana.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=V4t90fni c=1 sm=1 tr=0 ts=682b1f8d cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=OahkqCU6moCgZN9NbxAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDExNCBTYWx0ZWRfX6ZDEoSCmh9PN +LFoRWm4apVof7inuga94ywSxrrfumaR7fA9zXVhRzyW4IejolO0mXXeGf0sQhmoVTum0YhzfGz DqbM8PSGrYKA6jwWYP/MoOr4+pH1ceTslckxd0ifx2ir4hIwVuUDhqQ610Ntw+xQB2Z9nf6TOMd
 s6gOMTGQww8BGB1wpuzn1ZdUAxaSditA9GmkEG11n3f+DzZA51kBTpnI9PMsgoY0q5YHfJ+MoFS HOmgOfHrkCGZJc16Zc1Wmp0dURkKMp4omk8B0v60+FhARfLim5Ztb4P6p5oBtDBiyqbH39NObTj r6nMJUoeJj2dbowCZselE7bnpZIqOBHG+2JJvQL0/GnTDeXupuKholntLXX4MHBHLwxdbgw4Ved
 9iQ5Gtri6tuBURs3MJKC9ql7YRBvUweIftP89PVVVu9M6kU9kaCZUHlo/mV1H2zbHeN0FjWQ
X-Proofpoint-ORIG-GUID: TfYuc6H9XaGLkrHGpUh0P_lAAE12hx-f
X-Proofpoint-GUID: TfYuc6H9XaGLkrHGpUh0P_lAAE12hx-f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=921 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190114

Hello,

On 15.05.2025 05:38, Herbert Xu wrote:
> On Thu, May 15, 2025 at 12:32:39PM +0900, Sergey Senozhatsky wrote:
>>
>> This is not exported yet.
>>
>> I lean toward not filtering/limiting anything and just permit
>> what include/linux/zlib.h promises [1].  Would that be OK for
>> Crypto API?
> 
> I don't have a problem with that.
> 
> It just makes the hardware implementor's job a little bit harder,
> because the Crypto API requires every implementation of a given
> algorithm to be equivalent.  So if the software zlib supports
> a full level specification, then so must the s390 version of zlib.
> If it cannot support a parameter, then it must provide a software
> fallback.

That's exactly how s390 zlib hardware support works, including
fallback to software. 
My intention was to use specific zlib compression parameters
(window size and compression level), as default values for zram
delflate on s390 to benefit from hardware acceleration.

> 
> Cheers,

Thanks,
Mikhail

