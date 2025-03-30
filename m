Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED38B3C3C
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 19:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743363797; cv=none; b=kgHn8BrPLfP4Oo0kVdHFQjzIadFpdUaab2OYruFR0GT3b93JNQaDETUH1nlCVALuiTFmnLbCn8VYYLG4ZL6RkyXjAT061zgU+mQeZr0dqCtMhJG1eXIIsQ+Cv4prkWRB04SGNCAoEJ7ZcBoaxfy7Ij+hOlw+qQwlvkjg2L4LwYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743363797; c=relaxed/simple;
	bh=kwP+ghzhKyAya06n5goBI1rtkT6cA0v01HrhKPpvvdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jXM3ltvw52zw1qPfnWImQmrqUO60DNCyuUelErG/vYi9jvIrL7hfRmqarL6B7AUcBAEZDbmq72j+FsG2ng2qKssGuQjO/le46k2CIwZ0Zsbi+yzQa4YL6S0fD2yVOLmKUfRvRdUCNNpxRkyX4a/3wAzHo1RzvM9dWNOG0lKQNL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aRDDuhkd; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aRDDuhkd"
Message-ID: <bb3d749f-c82f-4ba8-b1d2-10a38efb6199@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743363787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NYYd4adHK3azDuhM9nsMRzd6xD1/9G3AVKj1UvKyQlo=;
	b=aRDDuhkdKrMWJd2t9s76jlU9y400QZ6Brdg5xfzQCKL8N1H08shOlYaKpE4c62cGHASfiq
	hYGedp3HSOxuPfUik3ePnDeOcq+FGdrhh48f2EknwRaRpcxRsKkflTU/yuz9BOPo/vZyg0
	ZSW3C4YrJOrcSpDinwRlr+IBdSOOS+o=
Date: Sun, 30 Mar 2025 21:43:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/7] mm/gup: fix wrongly calculated returned value in
 fault_in_safe_writeable()
To: Baoquan He <bhe@redhat.com>, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250330121718.175815-1-bhe@redhat.com>
 <20250330121718.175815-2-bhe@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zhu Yanjun <yanjun.zhu@linux.dev>
In-Reply-To: <20250330121718.175815-2-bhe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

在 2025/3/30 14:17, Baoquan He 写道:
> Not like fault_in_writeable() or fault_in_writeable(), in
                                    fault_in_readable()?

In the above, one of the 2 fault_in_writeable should be 
fault_in_readable() ?

Zhu Yanjun
> fault_in_safe_writeable() local variable 'start' is increased page
> by page to loop till the whole address range is handled. However,
> it mistakenly calcalates the size of handled range with 'uaddr - start'.
> 
> Fix it here.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>   mm/gup.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 855ab860f88b..73777b1de679 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2207,8 +2207,8 @@ size_t fault_in_safe_writeable(const char __user *uaddr, size_t size)
>   	} while (start != end);
>   	mmap_read_unlock(mm);
>   
> -	if (size > (unsigned long)uaddr - start)
> -		return size - ((unsigned long)uaddr - start);
> +	if (size > start - (unsigned long)uaddr)
> +		return size - (start - (unsigned long)uaddr);
>   	return 0;
>   }
>   EXPORT_SYMBOL(fault_in_safe_writeable);

