Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17706B66E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 00:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745454715; cv=none; b=QpMlQwHuQIQyO4U6n+rJeAaRvSXFkyKYukNasZbwWwEXSbx83bXXOpQsc42ylAivAnaXyg5B8EQ7/jre1CTZhvvXf0OeIz94i36BygP41CnvPRfteHaP3JkNlPUVSUZ9YWcbd9tWUzA1Qn1jzMtvzB3leIJRD3XKAZ7fZWhADEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745454715; c=relaxed/simple;
	bh=VLW7rBF7OlF7e/px/+IecU1Xk9kQQNky3ILVr24wr4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CPZDeNl4lfL0a0avoYMGkILuOSymxBYOHotswiMICcrUbV+VSUMeYcbnSn0+J7Lr6qjlvEG9vxsKYwTPaNKa6Hzjt48vSwn9pLtpo4K5vnpS0R36DMMwo648j0uu09bM6j0xl+BYNkaEMON9Hbi9IHWojRrS3rNhHPoBsrR1cqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=F87wFOOL; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="F87wFOOL"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1745454704; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=c8ZCQX8M22/L+jhRyOZyyKQ/yi6W0hwrq83O3s9SBSE=;
	b=F87wFOOLeJaVqSJx5rG4X36jq+snQTgDUxxSDehLC3CvoFZqb1nKE6RVvmODcMBpv1/zDLrnAOo+l7lKDEymylmru/GbR60Qmu4CksSAH41UdOhcQZd/9urIiOxbVQA0N94XRDnrqG28ynPZKm9j6sYdVO+UD3jqOjW+RXaJWbs=
Received: from 30.134.100.0(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WXw4zKR_1745454703 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 24 Apr 2025 08:31:43 +0800
Message-ID: <94c702b9-cad5-4727-a7f1-16de1827841e@linux.alibaba.com>
Date: Thu, 24 Apr 2025 08:31:42 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] erofs: lazily initialize per-CPU workers and CPU
 hotplug hooks
To: Sandeep Dhavale <dhavale@google.com>, linux-erofs@lists.ozlabs.org,
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
 Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org
References: <20250423061023.131354-1-dhavale@google.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20250423061023.131354-1-dhavale@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/4/23 14:10, Sandeep Dhavale wrote:
> Currently, when EROFS is built with per-CPU workers, the workers are
> started and CPU hotplug hooks are registered during module initialization.
> This leads to unnecessary worker start/stop cycles during CPU hotplug
> events, particularly on Android devices that frequently suspend and resume.
> 
> This change defers the initialization of per-CPU workers and the
> registration of CPU hotplug hooks until the first EROFS mount. This
> ensures that these resources are only allocated and managed when EROFS is
> actually in use.
> 
> The tear down of per-CPU workers and unregistration of CPU hotplug hooks
> still occurs during z_erofs_exit_subsystem(), but only if they were
> initialized.
> 
> Signed-off-by: Sandeep Dhavale <dhavale@google.com>

Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>

> ---

...

>   int z_erofs_init_super(struct super_block *sb)
>   {
> -	struct inode *const inode = new_inode(sb);
> +	struct inode *inode;
> +	int err;
>   
> +	err = z_erofs_init_pcpu_workers();
> +	if (err)
> +		return err;
> +
> +	inode = new_inode(sb);
>   	if (!inode)
>   		return -ENOMEM;
> +

I think the new blank line is redundant, the setup part
should be next to new_inode().

I could fix up this part manually if you don't have strong
opinion on this.

Thanks,
Gao Xiang
