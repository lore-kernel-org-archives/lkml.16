Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F49425F974
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543255; cv=none; b=VxzLRZI24lqIlH8oZ28yQj/dhaxcp6vFslRZby5hqS6+zIeZEZ+C68yJAxg2fhHgihF6glHebmbrqdOtMeOg97l+hNLUs3gCSc1gbEIRe3GqXXnsoR4Xb39eQZS8P57PKPpFIdSFrhNTGO+u7UGtFLVzlEPMW8tzvEBpaRKH+Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543255; c=relaxed/simple;
	bh=ymzu2QjDQrUOwObTG11pHLpVg3bsmIT384PWHd2YFwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qu00PsUCWPKqYpcdqHV4vkGf6QCv6vY/N3MIERKM/1japeG+ou0ByfpXKkHJYF0tloq/s/KtMcZ1pfOtqo7iR8onQM9UtyzT4hE3bycDhJpOFqNgj70JCwK5JPitX+tVexUU2UBc9fsSo+TrDgsB5XN/yDQb7D0hWdVTSxuvrfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=IhC33tLx; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="IhC33tLx"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A09sUg032702;
	Tue, 10 Jun 2025 08:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=r8hdw9
	Rw+PQqw6yzY+29b7k2yuPuh90hDJNW2Q1IHMo=; b=IhC33tLxO+dooNeWGK/vf6
	pOvEyJxqxsMe3+21baki9WNUXyq8r3EtqBf26whr/FwCN4d8jGkryXwbNk/wEfwD
	RoeCUm+xdTpLnQ55/G9nIxrwYos4aQLEInnoraqfAv/Mxh1LdyepaXDJ0RiYPNm5
	NBjEUDOujFbaIX8WQkTEzO8OOpM9eiRBSQQ6KF7szTeSTNwF3Bz1k6DEE5Ul4qvn
	TQt655Hdob8wEReDTp5dtJcVKyU949RnYcAaJeeoVMC31fDBGty1j4LwyczWNFjD
	IANEY3sh+tnSo3YLraNPzbEcLATwfcqTpXFE6C9yUy11FtSmRXf7BFyjSprvzGsg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4769wyhpfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 08:14:06 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55A8E66m015831;
	Tue, 10 Jun 2025 08:14:06 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4769wyhpff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 08:14:06 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55A61l4E003463;
	Tue, 10 Jun 2025 08:14:05 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4751ykh97w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 08:14:05 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55A8E4SI31261336
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 08:14:04 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C3F9C58045;
	Tue, 10 Jun 2025 08:14:04 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DF79D58054;
	Tue, 10 Jun 2025 08:14:02 +0000 (GMT)
Received: from [9.109.245.113] (unknown [9.109.245.113])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Jun 2025 08:14:02 +0000 (GMT)
Message-ID: <0b9e1e55-f4c9-4e30-abe6-3b9765ba9ebf@linux.ibm.com>
Date: Tue, 10 Jun 2025 13:44:01 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/memory-tier: Fix abstract distance calculation
 overflow
To: Li Zhijian <lizhijian@fujitsu.com>, linux-mm@kvack.org
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
        Ying Huang <huang.ying.caritas@gmail.com>
References: <20250610062751.2365436-1-lizhijian@fujitsu.com>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <20250610062751.2365436-1-lizhijian@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xmceErOpFt8yCePtbSQsA-WmXVmkl-pq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA1OCBTYWx0ZWRfX1TK7gdleShsC ZlZL227d1dnBeXmMwCzS2BZrqqKeM+XQP9A/2KYiK6yJeQHfb6f9h3Qd2L29Smg1FG3oO/sLUi7 XdZgarrGFWP0CO7BZ0mLnVsmjYHH1VuXd0KsecD4KPoY4pBM6PtJNUq8LsiGopra3ZvWZme0SAA
 pg/X4UE6gFIRhawMLExLl5XyHPnxmNFrEiLh+dXZGwHcMFwgkgVyi1Cb9J8GAp4YkThLoV1DzqD /XljKsKhI+MifNstt2oQmV/LpcwpbpUvQG/LfJuSS2TGK1lyuwULWxvb3KQcFy8UKRir0xtkZkY 6SiWRB1xJntae2+7d6HMjGzXitp356xZWfEovwh7U9uk7gVxXAqkSu62o1aUZCppeV8DIdFWhGS
 6emig6fwRqAMbtLKq1hGCp/dKzyHOvbw3xjnrROQ+AR7rusllOd6uvJoxSpCMfZI13vzFZ3k
X-Authority-Analysis: v=2.4 cv=YKGfyQGx c=1 sm=1 tr=0 ts=6847e94e cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=omOdbC7AAAAA:8 a=VnNF1IyMAAAA:8 a=MjiR9eHTnMDsPQ3Rr7EA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: hLWlauVIk4vxWRo7QYfEL2eAP_IZVkSd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_02,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100058


On 6/10/25 11:57 AM, Li Zhijian wrote:
> In mt_perf_to_adistance(), the calculation of abstract distance (adist)
> involves multiplying several int values including MEMTIER_ADISTANCE_DRAM.
> ```
> *adist = MEMTIER_ADISTANCE_DRAM *
> 		(perf->read_latency + perf->write_latency) /
> 		(default_dram_perf.read_latency + default_dram_perf.write_latency) *
> 		(default_dram_perf.read_bandwidth + default_dram_perf.write_bandwidth) /
> 		(perf->read_bandwidth + perf->write_bandwidth);
> ```
> Since these values can be large, the multiplication may exceed the maximum
> value of an int (INT_MAX) and overflow (Our platform did), leading to an
> incorrect adist.
>
> Change MEMTIER_ADISTANCE_DRAM to be a long constant by writing it with the
> 'L' suffix. This prevents the overflow because the multiplication will then
> be done in the long type which has a larger range.
>
> Fixes: 3718c02dbd4c ("acpi, hmat: calculate abstract distance with HMAT")
> Cc: Ying Huang <huang.ying.caritas@gmail.com>
> Signed-off-by: Li Zhijian <lizhijian@fujitsu.com>
> ---
>   include/linux/memory-tiers.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/memory-tiers.h b/include/linux/memory-tiers.h
> index 0dc0cf2863e2..7a805796fcfd 100644
> --- a/include/linux/memory-tiers.h
> +++ b/include/linux/memory-tiers.h
> @@ -18,7 +18,7 @@
>    * adistance value (slightly faster) than default DRAM adistance to be part of
>    * the same memory tier.
>    */
> -#define MEMTIER_ADISTANCE_DRAM	((4 * MEMTIER_CHUNK_SIZE) + (MEMTIER_CHUNK_SIZE >> 1))
> +#define MEMTIER_ADISTANCE_DRAM	((4L * MEMTIER_CHUNK_SIZE) + (MEMTIER_CHUNK_SIZE >> 1))

Hi Li Zhijian

This looks good to me. Feel free to add

Reviewed-byDonet Tom <donettom@linux.ibm.com>

>   
>   struct memory_tier;
>   struct memory_dev_type {
