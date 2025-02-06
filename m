Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9234519DF48
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864410; cv=none; b=eMab05FTe4eNnna/J7H4QMoZJfAUtHW91w0SlJ0loMWYNtBv1I2ayDu3yN0hdFWWGHww/xtmxfLs2Sh4ZpQZZuAE1L+U2nvOqU5qMNyah/Bz0VWchKnzP5Z5tmsknt7J0d3SS6SHOnOOLww2HBS5bA/biASTleQK3zglH656zsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864410; c=relaxed/simple;
	bh=NvtN3JVClsHQrXR5UAESF1hg7tyjBuWalPd/ipa8LME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M0bJcYfQyupBf3/3OIe1P9jslya/w58CHhHrBLZk+zLNE08JvZOtGwCGD7D3nplolZyajbdB1tchGgX95qwauekrQVgGqRZS2XzhdTVlQu9SbSIuLB6CVoK+QppH8wEkKFZTXVpCUCS9wYBgz4+mnfczT2NlDjHOvaTToenazZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=nV+Ti2Pp; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="nV+Ti2Pp"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516F1Ri7027401;
	Thu, 6 Feb 2025 17:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=k7emDR
	OYCBidG6H5qnJKL2wt2H2IDbVGbUfIonQiklE=; b=nV+Ti2Ppy3+xlKwuJE33Qn
	pT2fkIbdNau9Z6KH1KSiqSqtbfdSmyOXqxfAyCQAuWj3MNonWJ6vrEXL7V+Q4Ky7
	CHQDniIQlI5Lux/3LSXnuc470BhfZnnIc1diL+YSBqXzoJ23rkUlQmr1jwBHaN04
	sHv5ylJEgTkWDvupUUkVlh5A6Fsl/DIIwueQRR6f+0yX42SYNRI02ozusnI+nexo
	+kUZh3Iculs5TcoDtCWl0VSZcTdy8h7A/Zxs0BugsjOnhL6pk/jd2bJCtV+hsTpS
	pbccMnPtnkYOEh6PIgNrRkNsIBZ9TCs/lHD/BakBiTu9/M1e+ruc/zdTjWfPM+iw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44myc00xxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 17:53:23 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 516HrMWM019623;
	Thu, 6 Feb 2025 17:53:22 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44myc00xxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 17:53:22 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 516EjJYA016280;
	Thu, 6 Feb 2025 17:53:21 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 44hwxsqr5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 17:53:21 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 516HrKRb21299828
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Feb 2025 17:53:21 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B60E15805C;
	Thu,  6 Feb 2025 17:53:20 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 48CC75805A;
	Thu,  6 Feb 2025 17:53:19 +0000 (GMT)
Received: from [9.179.19.40] (unknown [9.179.19.40])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  6 Feb 2025 17:53:19 +0000 (GMT)
Message-ID: <a80a05d3-beb5-4545-9a0d-c10efc9fe3a4@linux.ibm.com>
Date: Thu, 6 Feb 2025 18:53:17 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/zlib: drop EQUAL macro
To: Yury Norov <yury.norov@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-kernel@vger.kernel.org
Cc: Joe Perches <joe@perches.com>
References: <20250205212933.68695-1-yury.norov@gmail.com>
Content-Language: en-US
From: Zaslonko Mikhail <zaslonko@linux.ibm.com>
In-Reply-To: <20250205212933.68695-1-yury.norov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 40St2uT0Ei8ij2n68OGgt-5CBgOhrBBB
X-Proofpoint-ORIG-GUID: 8bywC7lHXSdyepWTT0hlZibFeOgVpImN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_05,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=844 mlxscore=0 impostorscore=0 clxscore=1011 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060141

Hi Yury,

I think the initial idea was to keep the code similar to the userspace zlib for serviceability.
But since it leads to extra warnings, it's worth fixing.

Reviewed-by: Mikhail Zaslonko <zaslonko@linux.ibm.com>

On 05.02.2025 22:29, Yury Norov wrote:
> The macro is pre-historic, and only exists to help those readers who
> don't know what memcmp() returns if memory areas differ. This is pretty
> well documented, so the macro looks excessive.
> 
> Now that the only user of the macro depends on DEBUG_ZLIB config, GCC
> warns about unused macro if the library is built with W=2 against
> defconfig. So drop it for good.
> 
> Signed-off-by: Yury Norov <yury.norov@gmail.com>
> ---
> scripts/get_maintainer.pl failed to attribute this patch, so adding
> Andrew and recent active developers, and Joe Perches for the script.
> 
> $ scripts/get_maintainer.pl 0001-zlib-drop-EQUAL-macro.patch
> Bad divisor in main::vcs_assign: 0
> "GitAuthor: Yury Norov" <yury.norov@gmail.com> (authored:1/1=100%,added_lines:1/1=100%,removed_lines:5/5=100%)
> linux-kernel@vger.kernel.org (open list)
> 
>  lib/zlib_deflate/deflate.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/lib/zlib_deflate/deflate.c b/lib/zlib_deflate/deflate.c
> index 3a1d8d34182e..8fb2a3e17c0e 100644
> --- a/lib/zlib_deflate/deflate.c
> +++ b/lib/zlib_deflate/deflate.c
> @@ -151,9 +151,6 @@ static const config configuration_table[10] = {
>   * meaning.
>   */
>  
> -#define EQUAL 0
> -/* result of memcmp for equal strings */
> -
>  /* ===========================================================================
>   * Update a hash value with the given input byte
>   * IN  assertion: all calls to UPDATE_HASH are made with consecutive
> @@ -713,8 +710,7 @@ static void check_match(
>  )
>  {
>      /* check that the match is indeed a match */
> -    if (memcmp((char *)s->window + match,
> -                (char *)s->window + start, length) != EQUAL) {
> +    if (memcmp((char *)s->window + match, (char *)s->window + start, length)) {
>          fprintf(stderr, " start %u, match %u, length %d\n",
>  		start, match, length);
>          do {

