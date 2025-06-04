Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AB63594B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 04:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749010824; cv=none; b=YDcmUHiziqE8Ri4rKevmXhi09ACNITbF71YkZTQot2u+R8D/vc+kpc70zpPeGU4itabIr2ZAYReg+lbF2lGmwKE5S/QOjkZYojYuYhENQXIv1afphmebM+z6Ddg0kJk3jHQ7Is2oub8nrekzHW78BXpa4rX3lkMNmuv8ASl53ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749010824; c=relaxed/simple;
	bh=iH9f4lkCPQHrlLs0MpK3hGyqrrwReYReCUD4qDK2Fj4=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=UuvB4r+yELfpP2hATCtzPBrSE0/ubCHIyWMIc6wkUWZV7ebnIv8I3Uyj7oTNrkqUp/yX/9qa7HAAh2YO3Cvh9fDo6TTuDWTcokWyZ3lB4HnxT9E4Krb6DLKhN3MlE0n5o++qqQAt/UAOR9V1+fZDr1Q2MyLS8SwuBptrSg82skI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4bBvTF6ksdz13Kfb;
	Wed,  4 Jun 2025 12:18:25 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 1124F180238;
	Wed,  4 Jun 2025 12:20:19 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 4 Jun 2025 12:20:18 +0800
Subject: Re: [PATCH v1] jffs2: fix comment typo and adjust formatting
To: Baolin Liu <liubaolin12138@163.com>, <dwmw2@infradead.org>,
	<richard@nod.at>
CC: <liubaolin@kylinos.cn>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20250604022056.111032-1-liubaolin12138@163.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <1d247663-9b37-1bff-d18c-7f6866e5f041@huawei.com>
Date: Wed, 4 Jun 2025 12:20:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250604022056.111032-1-liubaolin12138@163.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk500005.china.huawei.com (7.202.194.90)

ÔÚ 2025/6/4 10:20, Baolin Liu Ð´µÀ:
> From: Baolin Liu <liubaolin@kylinos.cn>
> 
> This commit makes two documentation improvements:
> 1. Fixes spelling of "coresponding" to "corresponding"
> 2. Adjusts comment formatting to meet kernel style guidelines by:
>     - Breaking long lines to fit 80-column limit
>     - Aligning asterisks in multi-line comments
>     - Improving readability while preserving original meaning
> 
> No functional changes.
> 
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
> ---
>   fs/jffs2/build.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
> diff --git a/fs/jffs2/build.c b/fs/jffs2/build.c
> index 6ae9d6fefb86..1e651d3dcef3 100644
> --- a/fs/jffs2/build.c
> +++ b/fs/jffs2/build.c
> @@ -185,8 +185,10 @@ static int jffs2_build_filesystem(struct jffs2_sb_info *c)
>   			 * one. */
>   			if (fd->type == DT_DIR) {
>   				if (!fd->ic) {
> -					/* We'll have complained about it and marked the coresponding
> -					   raw node obsolete already. Just skip it. */
> +					/* We'll have complained about it
> +					 * and marked the corresponding raw node obsolete already.
> +					 * Just skip it.
> +					 */
>   					continue;
>   				}
>   
> 

