Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8FA1F91F6
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 10:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747220183; cv=none; b=hIx46oRxcSeAuTK7U3wUlJeUqo9PYynIL0Ep2OZyonD9x4CkJ6K9dO58fZeOybZMBWINL8v7RkKO4Yht1MQrk/YUqsO7p/qG87S+pFUU4j2ya2TrG84oFBtPmjJP9wPNgrcOFRFOIkhLRqKMnvxrUfo8Kwonvrd9wFd5bLVuEA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747220183; c=relaxed/simple;
	bh=rigjT51Bk+rEEhy0G1hWcnpbNDs6yIeqyF/rCzkkxWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VwPC3QW0/u0PNl2wdWhDOgsudvnrr7HXDhNY5Dw0zA6uy5ODMVVWgstjSAE8QORLUBoa6NvoPn68x7sczTJ0XcW+jRYY4E/kYyJi9sQu8ucWAPTGvUDGqazz5g2ClBFBxOY4Ucn14R8PxJgAA7Eu7PyfUKvHJx9n5uUyiibC+A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=FdMSqHkM; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="FdMSqHkM"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E7Vrlc025407;
	Wed, 14 May 2025 10:56:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=hptRBY
	daX7xMfWMddOiuBRCXkxv9o+2z/NgrtK8kdcE=; b=FdMSqHkMuSYmQFnelqmJ/f
	F583d8XakhnDwQCFfGPJL4dYM+LU0yGSBEg1N2zEmFqzhyd0/+c7yrqswdoVrzTW
	jrxkNkWevysOYLvWbO3Gg+E0tQAb1xQFtC41lD5GsGLCNKDGJ6ffpOxG8ywJoR50
	2lcJqY+SlLyPbufS+f3xnuw6Sb9JRuv68+diV7gNl5Db429xm14DszfsDJu4lk7X
	XtHXuvH1nzVKRgIYWnOLooz9ixC6art7a65nncltUyjtBBecUeqeHeZAm8azQpqW
	Cv0gUGzsG3nI7hVBPtvZ8w9DnYKRBGSOSXmGKAHmn0mrEyr70cZCxKSAXzLdNybQ
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46mbs6knam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 10:56:13 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54E9uMeJ015300;
	Wed, 14 May 2025 10:56:12 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 46mbfpurcm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 10:56:12 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54EAuCHn19989218
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 10:56:12 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E640A5804B;
	Wed, 14 May 2025 10:56:11 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C386658059;
	Wed, 14 May 2025 10:56:10 +0000 (GMT)
Received: from [9.111.92.18] (unknown [9.111.92.18])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 14 May 2025 10:56:10 +0000 (GMT)
Message-ID: <da57330c-46f3-4af6-aa49-a5cb26df37f7@linux.ibm.com>
Date: Wed, 14 May 2025 12:56:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] zram: rename ZCOMP_PARAM_NO_LEVEL
To: Sergey Senozhatsky <senozhatsky@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
References: <20250514024825.1745489-1-senozhatsky@chromium.org>
 <20250514024825.1745489-2-senozhatsky@chromium.org>
Content-Language: en-US
From: Zaslonko Mikhail <zaslonko@linux.ibm.com>
In-Reply-To: <20250514024825.1745489-2-senozhatsky@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA5MyBTYWx0ZWRfX9P0NcYKRIdjt sefySltLt/WMHyYiGT9HyjtggvKgsTUkAAn9ZYYjnTQ6zk4j1L2ZXmt2KcgzI0nVDeQxedntWkj b805sRqgFPC1huXYU4DTpMTlFCsD0grBjBVInqtpU3LArxqWYzM31I73ifx7Ys805AehlkyQ3bf
 GQ5jGHUCRFRnuzjJsabxj3stkZGF6QIPWb38nqnHNg1y3k/3Ns0InF3EY9K+LDT7Zv1UySAWMrE O+R+oJRtzKP7WQ965TpWrz7/p43ExamNChZiTuU7kIbwiTYBw7vPfhZXjmNtuc/xaQBURtSYE5j rUkPnAJXjuJdgKPwCmjRR5yVdPEbscmLk1uoA2XuxXNOjldQwUbe09kJhyJ2s9QvyM3xezQLZX7
 jDLj5uuKV86w9K1i7JYA8XY/2krmwSkTp6sCFeVACd2ry1N3kHv42yeJqgDfoW3Lcpjwvlc9
X-Proofpoint-ORIG-GUID: 9Y-WlQI47wVuVAG3LQPL0lDpJhjl0Dbg
X-Authority-Analysis: v=2.4 cv=d5f1yQjE c=1 sm=1 tr=0 ts=682476cd cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=cm27Pg_UAAAA:8 a=z_otd99ehmC5rH9K4kQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 9Y-WlQI47wVuVAG3LQPL0lDpJhjl0Dbg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_03,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 clxscore=1011 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 impostorscore=0 adultscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140093

Reviewed-by: Mikhail Zaslonko <zaslonko@linux.ibm.com>

On 14.05.2025 04:47, Sergey Senozhatsky wrote:
> Use more generic name because this will be default "un-set"
> value for more params in the future.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  drivers/block/zram/backend_deflate.c | 2 +-
>  drivers/block/zram/backend_lz4.c     | 2 +-
>  drivers/block/zram/backend_lz4hc.c   | 2 +-
>  drivers/block/zram/backend_zstd.c    | 2 +-
>  drivers/block/zram/zcomp.h           | 2 +-
>  drivers/block/zram/zram_drv.c        | 4 ++--
>  6 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/block/zram/backend_deflate.c b/drivers/block/zram/backend_deflate.c
> index 0f7f252c12f4..4c00b5b6739f 100644
> --- a/drivers/block/zram/backend_deflate.c
> +++ b/drivers/block/zram/backend_deflate.c
> @@ -22,7 +22,7 @@ static void deflate_release_params(struct zcomp_params *params)
>  
>  static int deflate_setup_params(struct zcomp_params *params)
>  {
> -	if (params->level == ZCOMP_PARAM_NO_LEVEL)
> +	if (params->level == ZCOMP_PARAM_NOT_SET)
>  		params->level = Z_DEFAULT_COMPRESSION;
>  
>  	return 0;
> diff --git a/drivers/block/zram/backend_lz4.c b/drivers/block/zram/backend_lz4.c
> index 847f3334eb38..daccd60857eb 100644
> --- a/drivers/block/zram/backend_lz4.c
> +++ b/drivers/block/zram/backend_lz4.c
> @@ -18,7 +18,7 @@ static void lz4_release_params(struct zcomp_params *params)
>  
>  static int lz4_setup_params(struct zcomp_params *params)
>  {
> -	if (params->level == ZCOMP_PARAM_NO_LEVEL)
> +	if (params->level == ZCOMP_PARAM_NOT_SET)
>  		params->level = LZ4_ACCELERATION_DEFAULT;
>  
>  	return 0;
> diff --git a/drivers/block/zram/backend_lz4hc.c b/drivers/block/zram/backend_lz4hc.c
> index 5f37d5abcaeb..9e8a35dfa56d 100644
> --- a/drivers/block/zram/backend_lz4hc.c
> +++ b/drivers/block/zram/backend_lz4hc.c
> @@ -18,7 +18,7 @@ static void lz4hc_release_params(struct zcomp_params *params)
>  
>  static int lz4hc_setup_params(struct zcomp_params *params)
>  {
> -	if (params->level == ZCOMP_PARAM_NO_LEVEL)
> +	if (params->level == ZCOMP_PARAM_NOT_SET)
>  		params->level = LZ4HC_DEFAULT_CLEVEL;
>  
>  	return 0;
> diff --git a/drivers/block/zram/backend_zstd.c b/drivers/block/zram/backend_zstd.c
> index 22c8067536f3..81defb98ed09 100644
> --- a/drivers/block/zram/backend_zstd.c
> +++ b/drivers/block/zram/backend_zstd.c
> @@ -58,7 +58,7 @@ static int zstd_setup_params(struct zcomp_params *params)
>  		return -ENOMEM;
>  
>  	params->drv_data = zp;
> -	if (params->level == ZCOMP_PARAM_NO_LEVEL)
> +	if (params->level == ZCOMP_PARAM_NOT_SET)
>  		params->level = zstd_default_clevel();
>  
>  	zp->cprm = zstd_get_params(params->level, PAGE_SIZE);
> diff --git a/drivers/block/zram/zcomp.h b/drivers/block/zram/zcomp.h
> index 25339ed1e07e..cfacdfe9044c 100644
> --- a/drivers/block/zram/zcomp.h
> +++ b/drivers/block/zram/zcomp.h
> @@ -5,7 +5,7 @@
>  
>  #include <linux/mutex.h>
>  
> -#define ZCOMP_PARAM_NO_LEVEL	INT_MIN
> +#define ZCOMP_PARAM_NOT_SET	INT_MIN
>  
>  /*
>   * Immutable driver (backend) parameters. The driver may attach private
> diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
> index 94e6e9b80bf0..a11b7a6e35f4 100644
> --- a/drivers/block/zram/zram_drv.c
> +++ b/drivers/block/zram/zram_drv.c
> @@ -1276,7 +1276,7 @@ static void comp_params_reset(struct zram *zram, u32 prio)
>  	struct zcomp_params *params = &zram->params[prio];
>  
>  	vfree(params->dict);
> -	params->level = ZCOMP_PARAM_NO_LEVEL;
> +	params->level = ZCOMP_PARAM_NOT_SET;
>  	params->dict_sz = 0;
>  	params->dict = NULL;
>  }
> @@ -1308,7 +1308,7 @@ static ssize_t algorithm_params_store(struct device *dev,
>  				      const char *buf,
>  				      size_t len)
>  {
> -	s32 prio = ZRAM_PRIMARY_COMP, level = ZCOMP_PARAM_NO_LEVEL;
> +	s32 prio = ZRAM_PRIMARY_COMP, level = ZCOMP_PARAM_NOT_SET;
>  	char *args, *param, *val, *algo = NULL, *dict_path = NULL;
>  	struct zram *zram = dev_to_zram(dev);
>  	int ret;

