Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EF6278E53
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 10:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747220337; cv=none; b=hDp2gz81933FYUmussO+7yWFLgwnnDJfl9MD1J/BoqFE8ywIkfvMUhRYIdFx670Tx4d3XEi8FFPI7XYKKL7CpckiobqgbBYq+YXziekf9QaFKVod8xRhkocYHvVy4PhixcYhSoRkNmdPzmT7ltSpuUDpxoKKja+nNT7mwdx9rjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747220337; c=relaxed/simple;
	bh=UICIsAOuY4v+Bsy4Q/NjNK0aCOcLZXPpVUJOEItgdJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lJ1ESCewe4KNfxo6O7+ecVUHIaZhwcff+ArE3QSEZTLWIRczD9+EopmJIskfZXOz8A/VVE2pHvaX4Rl9X6TkMOyygS79pWd2KSBhlRUah29iOsAs1vkjW+9X/RBVIhP+CgVjNvWtCI+sSLq9yov8uSBVStDECyNEKNPom/wtDXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ni8Xan43; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ni8Xan43"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E6IOpn026361;
	Wed, 14 May 2025 10:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=BetRiI
	ZTQ7bdSxfWgGALXL5bpIbRUZUx65iTjrbnDlM=; b=ni8Xan43Ox8RyB5clmk2bA
	u9uqxqODZltxKqtiQvuuOHjIRqV/RkTpFRXu0wO6GEZdcxnoDRQLwc3e+q2OhJtS
	Z9Ggc20/8r/h1BWxAs03kf/7CWMY6+CaqtcWMQO5vzlA3Ef7yv0c6Un58RJ/Ctff
	KURlWmkQ2RWq/hjxLCqXPZ9lZOpyri4mapfewgvf10VJJe/vPgZgYNMKWLEd9Q0G
	YaSq9P36l6yTaARhKMbwzMf2i9PNVv67xb5WP+N369BhvcNlzGYo9JKADDxo61Ph
	7vGwHJ5kU8ynF8DPIVzFF1RAPZxvjMfISsngoN8V4ot0JSd91oEVMRSl0TqXkwzQ
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46mnst18gg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 10:58:48 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54EA5JVB015329;
	Wed, 14 May 2025 10:58:47 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 46mbfpurn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 10:58:47 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54EAwkjh28836458
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 10:58:46 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B24F5804B;
	Wed, 14 May 2025 10:58:46 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E3B1658055;
	Wed, 14 May 2025 10:58:44 +0000 (GMT)
Received: from [9.111.92.18] (unknown [9.111.92.18])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 14 May 2025 10:58:44 +0000 (GMT)
Message-ID: <bec7391c-e40d-4633-a2d0-881eb6d18f19@linux.ibm.com>
Date: Wed, 14 May 2025 12:58:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] zram: support deflate-specific params
To: Sergey Senozhatsky <senozhatsky@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Heiko Carstens <hca@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>
References: <20250514024825.1745489-1-senozhatsky@chromium.org>
 <20250514024825.1745489-3-senozhatsky@chromium.org>
Content-Language: en-US
From: Zaslonko Mikhail <zaslonko@linux.ibm.com>
In-Reply-To: <20250514024825.1745489-3-senozhatsky@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: L_ETc4ufNI1v3IPanPc7xG0qTfvH269h
X-Authority-Analysis: v=2.4 cv=V+590fni c=1 sm=1 tr=0 ts=68247768 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=cm27Pg_UAAAA:8 a=mYzGZE5f00aBUjGx16gA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: L_ETc4ufNI1v3IPanPc7xG0qTfvH269h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA5MyBTYWx0ZWRfXyfTQETzYEIYv 3U66ROmOY7GI+ddWKXybCol7oktWJslIPJcwQWxHbmX8VqoqkKX6FaokbhuU8j8SlmHrSdjWCK6 kgL70r3JpnLCybnxW08c7G8ulehamSC4yraVz1M5TN/GqWKVahVRhLRUjjdVWqFxgNLEHHj5VwC
 I/qeLwNUunFPRN34oZGu13L5RTilM4uWJqwEXzYL9+FH1p7EX19XiPJW1yoJiILVtu58ij6bnLk V8d3ftxqKCG2UzN3iGrZGR/AV/HE3SEaHNXV3r2KClHRaCZJAFCxalP+9QQGVatNTvkIGGKkqGv Wvhl612g9OQoAFJcun+nDhKJgS45XnIeZJDWurXs/1+Uch/Gz3AlbULmyeJ6F/px1iyU8uleDbv
 ZuWhwmj83/8ycdWJL2MM/FOyEMoX9ccykV/Ne+5wDyHGJaIgCU/ww3gYssruT9DhaDGDqW/b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_03,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0 clxscore=1011
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140093

Looks good to me.

Just a minor comment. If we intend to use raw deflate only, like we do now (no zlib header or
trailer for the compressed data), we should probably change deflate.winbits to unsigned and
pass '-deflate.winbits' to zlib_deflateInit2().


Also, here is another patch suggestion from my side on top of this one. 
Let me know what you think.

---8<---

zram: Utilize s390 hardware deflate acceleration for zram

Utilize s390 hardware deflate acceleration for zram deflate compression
by default when the facility is available.

Signed-off-by: Mikhail Zaslonko <zaslonko@linux.ibm.com>

diff --git a/drivers/block/zram/backend_deflate.c b/drivers/block/zram/backend_deflate.c
index b75016e0e654..5bfc57522e3a 100644
--- a/drivers/block/zram/backend_deflate.c
+++ b/drivers/block/zram/backend_deflate.c
@@ -22,10 +22,23 @@ static void deflate_release_params(struct zcomp_params *params)

 static int deflate_setup_params(struct zcomp_params *params)
 {
-       if (params->level == ZCOMP_PARAM_NOT_SET)
-               params->level = Z_DEFAULT_COMPRESSION;
-       if (params->deflate.winbits == ZCOMP_PARAM_NOT_SET)
-               params->deflate.winbits = DEFLATE_DEF_WINBITS;
+       /*
+        * In case of s390 zlib hardware support available,
+        * use maximum window size and level one as default compression
+        * parameters in order to utilize hardware deflate acceleration.
+        */
+       if (params->level == ZCOMP_PARAM_NOT_SET) {
+               if (zlib_deflate_dfltcc_enabled())
+                       params->level = Z_BEST_SPEED;
+               else
+                       params->level = Z_DEFAULT_COMPRESSION;
+       }
+       if (params->deflate.winbits == ZCOMP_PARAM_NOT_SET) {
+               if (zlib_deflate_dfltcc_enabled())
+                       params->deflate.winbits = -MAX_WBITS;
+               else
+                       params->deflate.winbits = DEFLATE_DEF_WINBITS;
+       }

        return 0;
 }



On 14.05.2025 04:47, Sergey Senozhatsky wrote:
> Introduce support of algorithm specific parameters in
> algorithm_params device attribute.  The expected format
> is algorithm.param=value.
> 
> For starters, add support for deflate.winbits parameter.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  drivers/block/zram/backend_deflate.c | 10 ++++++----
>  drivers/block/zram/zcomp.h           |  7 +++++++
>  drivers/block/zram/zram_drv.c        | 17 +++++++++++++++--
>  3 files changed, 28 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/block/zram/backend_deflate.c b/drivers/block/zram/backend_deflate.c
> index 4c00b5b6739f..b75016e0e654 100644
> --- a/drivers/block/zram/backend_deflate.c
> +++ b/drivers/block/zram/backend_deflate.c
> @@ -8,7 +8,7 @@
>  #include "backend_deflate.h"
>  
>  /* Use the same value as crypto API */
> -#define DEFLATE_DEF_WINBITS		11
> +#define DEFLATE_DEF_WINBITS		(-11)
>  #define DEFLATE_DEF_MEMLEVEL		MAX_MEM_LEVEL
>  
>  struct deflate_ctx {
> @@ -24,6 +24,8 @@ static int deflate_setup_params(struct zcomp_params *params)
>  {
>  	if (params->level == ZCOMP_PARAM_NOT_SET)
>  		params->level = Z_DEFAULT_COMPRESSION;
> +	if (params->deflate.winbits == ZCOMP_PARAM_NOT_SET)
> +		params->deflate.winbits = DEFLATE_DEF_WINBITS;
>  
>  	return 0;
>  }
> @@ -57,13 +59,13 @@ static int deflate_create(struct zcomp_params *params, struct zcomp_ctx *ctx)
>  		return -ENOMEM;
>  
>  	ctx->context = zctx;
> -	sz = zlib_deflate_workspacesize(-DEFLATE_DEF_WINBITS, MAX_MEM_LEVEL);
> +	sz = zlib_deflate_workspacesize(params->deflate.winbits, MAX_MEM_LEVEL);
>  	zctx->cctx.workspace = vzalloc(sz);
>  	if (!zctx->cctx.workspace)
>  		goto error;
>  
>  	ret = zlib_deflateInit2(&zctx->cctx, params->level, Z_DEFLATED,
> -				-DEFLATE_DEF_WINBITS, DEFLATE_DEF_MEMLEVEL,
> +				params->deflate.winbits, DEFLATE_DEF_MEMLEVEL,
>  				Z_DEFAULT_STRATEGY);
>  	if (ret != Z_OK)
>  		goto error;
> @@ -73,7 +75,7 @@ static int deflate_create(struct zcomp_params *params, struct zcomp_ctx *ctx)
>  	if (!zctx->dctx.workspace)
>  		goto error;
>  
> -	ret = zlib_inflateInit2(&zctx->dctx, -DEFLATE_DEF_WINBITS);
> +	ret = zlib_inflateInit2(&zctx->dctx, params->deflate.winbits);
>  	if (ret != Z_OK)
>  		goto error;
>  
> diff --git a/drivers/block/zram/zcomp.h b/drivers/block/zram/zcomp.h
> index cfacdfe9044c..4acffe671a5e 100644
> --- a/drivers/block/zram/zcomp.h
> +++ b/drivers/block/zram/zcomp.h
> @@ -7,6 +7,10 @@
>  
>  #define ZCOMP_PARAM_NOT_SET	INT_MIN
>  
> +struct deflate_params {
> +	s32 winbits;
> +};
> +
>  /*
>   * Immutable driver (backend) parameters. The driver may attach private
>   * data to it (e.g. driver representation of the dictionary, etc.).
> @@ -17,6 +21,9 @@ struct zcomp_params {
>  	void *dict;
>  	size_t dict_sz;
>  	s32 level;
> +	union {
> +		struct deflate_params deflate;
> +	};
>  
>  	void *drv_data;
>  };
> diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
> index a11b7a6e35f4..54c57103715f 100644
> --- a/drivers/block/zram/zram_drv.c
> +++ b/drivers/block/zram/zram_drv.c
> @@ -1277,12 +1277,14 @@ static void comp_params_reset(struct zram *zram, u32 prio)
>  
>  	vfree(params->dict);
>  	params->level = ZCOMP_PARAM_NOT_SET;
> +	params->deflate.winbits = ZCOMP_PARAM_NOT_SET;
>  	params->dict_sz = 0;
>  	params->dict = NULL;
>  }
>  
>  static int comp_params_store(struct zram *zram, u32 prio, s32 level,
> -			     const char *dict_path)
> +			     const char *dict_path,
> +			     struct deflate_params *deflate_params)
>  {
>  	ssize_t sz = 0;
>  
> @@ -1300,6 +1302,7 @@ static int comp_params_store(struct zram *zram, u32 prio, s32 level,
>  
>  	zram->params[prio].dict_sz = sz;
>  	zram->params[prio].level = level;
> +	zram->params[prio].deflate.winbits = deflate_params->winbits;
>  	return 0;
>  }
>  
> @@ -1310,9 +1313,12 @@ static ssize_t algorithm_params_store(struct device *dev,
>  {
>  	s32 prio = ZRAM_PRIMARY_COMP, level = ZCOMP_PARAM_NOT_SET;
>  	char *args, *param, *val, *algo = NULL, *dict_path = NULL;
> +	struct deflate_params deflate_params;
>  	struct zram *zram = dev_to_zram(dev);
>  	int ret;
>  
> +	deflate_params.winbits = ZCOMP_PARAM_NOT_SET;
> +
>  	args = skip_spaces(buf);
>  	while (*args) {
>  		args = next_arg(args, &param, &val);
> @@ -1343,6 +1349,13 @@ static ssize_t algorithm_params_store(struct device *dev,
>  			dict_path = val;
>  			continue;
>  		}
> +
> +		if (!strcmp(param, "deflate.winbits")) {
> +			ret = kstrtoint(val, 10, &deflate_params.winbits);
> +			if (ret)
> +				return ret;
> +			continue;
> +		}
>  	}
>  
>  	/* Lookup priority by algorithm name */
> @@ -1364,7 +1377,7 @@ static ssize_t algorithm_params_store(struct device *dev,
>  	if (prio < ZRAM_PRIMARY_COMP || prio >= ZRAM_MAX_COMPS)
>  		return -EINVAL;
>  
> -	ret = comp_params_store(zram, prio, level, dict_path);
> +	ret = comp_params_store(zram, prio, level, dict_path, &deflate_params);
>  	return ret ? ret : len;
>  }
>  

