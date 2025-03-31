Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4378726ACD
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 03:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743392873; cv=none; b=pIwNXakXZtWp3K5MPdhxDtUUDkyosHGRNy+D261bPQS/d5bWQsJuvgNvdVlra8AxlpGvjPqxl5AkNETgc7CrHGXmKpw4YhnYsL5+lUCvD8AOBV6gzyu8Lp36F+pWb6cbu0qVP3FCDvPLDvayOvLbT/zUxTTXm0/xra0EC7sNpwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743392873; c=relaxed/simple;
	bh=FMfOvDnt30Fad/t5QfefmzJEN9WgnTdM+M+qb4cCDM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O79P9VfHOxb/yEXvi2V1lD+wZ/NXVJ8E3mQlhT+ihUIH1ODGuMnkUXQOJtd49i45tYj+ivzcvibndXBnObmEN4PuO3plIuG7lluE7vBj8D9IE75F9He2xY7KQVnSgLSQi/9coul5miK2mstjhlK76DaI79fHidJ9AJT/Xy8ll+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Yl1A3Cnb; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Yl1A3Cnb"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ce4e47a85so3432095e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 20:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743392868; x=1743997668; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ox8RCPAc/PLiGZZEUysehX7JfG73ej3P9CWPn0N4YmE=;
        b=Yl1A3CnbEbUx7kcJoWmV5tR3TRUbvndHeUHT8Ud1c3X+/zz1B2DLzoOw1ZnA+dsItt
         f7qHapvr6CbA1GMunLJifgo8CSH9JicoN5JRHQVridB3C4eO4QvkAgXTsdfMl3UpKnpu
         JMa2hwbDZOhHBlC8vDQ90Vh76IgB/WG4oTzswe7OlsodJXHipjcTLawhK1e+ki3PxJCz
         WUp97fGuRPCCu7/DNSfar5Kzhhg4h8jMtCqrFb5BluBz3TF4lr4X3YwKNVD3Wouk5MJF
         yW9BA1Crcdi1IgEnCPQN0F3qLCJ3Nd2chnMvTtwkXgmt0ldhCmfeOWdRAGQgb2hl2Btv
         aSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743392868; x=1743997668;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ox8RCPAc/PLiGZZEUysehX7JfG73ej3P9CWPn0N4YmE=;
        b=mQre9CuQQuGxJtnkzWxxV23G8ovpAuAHfOtuYCESLi1wLpp5q8x842loNrld6gUOm8
         CaxxRx1vJbu5N/VSstJ8O/cBZRBkez78ibjeS8BibcKxQCxCH1b8wCoo4CTHuLlCEWmu
         Bc0sumlFANZ+x+atYCberZZQjvaSxen2eseJpgeG22wl7g3tRM6WWPYpEdG1zjCD24cx
         2zasCqvFFMZ9QDODkUso1qmyo+gtOwGEA9SwDiaJIh/CNpP7KqXPTCUlvVvAFNo+KkFc
         gg/qSrkvCoyfudgRE78G8rfDyBn4fpg67lykAzUl0RZTzLFbW479m0TkIYWgi+Ik7RRO
         F4Ng==
X-Forwarded-Encrypted: i=1; AJvYcCU2P0ADOVlmrC/OYkYwwS6Rr2LebfpPhTEOJ132spuAIg2c8NXBskRKObcc50CjklcLvJb9rNYiPC1Hvdc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMiO1xzF8UoAHmB/2dNh9UiOUs7lvDhXwvrrT17qhblsqw1Rbu
	juXugD9CFdBet2pDHFZeH2xGPwIAfTOw9uUstiihj7pxvbZZMtXtAmJaTPKUz2E=
X-Gm-Gg: ASbGnct1QSIw6v7LedRiry4f0NDSTsZy3vwVgwJ64rgv7OFCUxBTVaxN9ZJPDxrYXdN
	OeP+nywINGoXYQeygVpH19ly2imMz2gV9DmOruGOsXhSzSrupnEHumzIONe8UqnPQsc0oHDS7am
	4rqhsZqBB6HVvpXq22BAii6VK5xGRE1YZ31d6WGrKlpCB48obV88HWwFuLEq41kemGrC3eIQAMJ
	ohxRGHnHJL/mg23hddyLuMWzLXa4J3+EpOWHR2Op7hhVFWHretUxyPFEOtfsyBQwCJbPLQ0VVtM
	Lc3zql5HAHiW3pxa5zt9ZkT/GmXMQ06auELg/nxdnmZAQ0l1eapRb+BZVrtgvA==
X-Google-Smtp-Source: AGHT+IEBdAYoQt/GGX/pCYZQo0++T7o+xAWHc1C/mbNvwv2Jivr8uhePRe+gs/gnSqzXM4Nti1FIiw==
X-Received: by 2002:a05:600c:4e87:b0:43b:c962:ad29 with SMTP id 5b1f17b1804b1-43db61d8dc0mr18015015e9.1.1743392868489;
        Sun, 30 Mar 2025 20:47:48 -0700 (PDT)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e22449sm6033684b3a.49.2025.03.30.20.47.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 20:47:47 -0700 (PDT)
Message-ID: <9390ba6d-8fc9-4cc0-b000-9d5ef0ec3393@suse.com>
Date: Mon, 31 Mar 2025 11:47:44 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] ocfs2: Validate chain list bits per cluster to
 prevent div-by-zero
To: Qasim Ijaz <qasdev00@gmail.com>, mark@fasheh.com, jlbec@evilplan.org,
 joseph.qi@linux.alibaba.com
Cc: ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
 syzbot <syzbot+e41e83af7a07a4df8051@syzkaller.appspotmail.com>,
 stable@vger.kernel.org
References: <20250329111654.5764-1-qasdev00@gmail.com>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <20250329111654.5764-1-qasdev00@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 3/29/25 19:16, Qasim Ijaz wrote:
> The call trace shows that the div error occurs on the following line where the code sets
> the e_cpos member of the extent record while dividing bg_bits by the bits per
> cluster value from the chain list:
> 
> 		rec->e_cpos = cpu_to_le32(le16_to_cpu(bg->bg_bits) /
> 				  le16_to_cpu(cl->cl_bpc));
> 				
> Looking at the code disassembly we see the problem occurred during the divw instruction
> which performs a 16-bit unsigned divide operation. The main ways a divide error can occur is
> if:
> 
> 1) the divisor is 0
> 2) if the quotient is too large for the designated register (overflow).
> 
> Normally the divisor being 0 is the most common cause for a division error to occur.
> 
> Focusing on the bits per cluster cl->cl_bpc (since it is the divisor) we see that cl is created in
> ocfs2_block_group_alloc(), cl is derived from ocfs2_dinode->id2.i_chain. To fix this issue we should

The cl (chain list) is created by ocfs2-tools during the execution of mkfs.ocfs2.
ocfs2_block_group_alloc(), as its name, which creates block groups, not chain lists.

> verify the cl_bpc member in the chain list to ensure it is valid and non-zero.
> 
> Looking through the rest of the OCFS2 code it seems like there are other places which could benefit
> from improved checks of the cl_bpc members of chain lists like the following:

Syzbot performs fuzz testing, in real-world it's very difficult to clear
the cl_bpc value. For this issue, checking only the divisor value is sufficient.

> 
> In ocfs2_group_extend():
> 
> 	cl_bpc = le16_to_cpu(fe->id2.i_chain.cl_bpc);
> 	if (le16_to_cpu(group->bg_bits) / cl_bpc + new_clusters >
> 		le16_to_cpu(fe->id2.i_chain.cl_cpg)) {
> 		ret = -EINVAL;
> 		goto out_unlock;
> 	}
> 
> Reported-by: syzbot <syzbot+e41e83af7a07a4df8051@syzkaller.appspotmail.com>
> Closes: https://syzkaller.appspot.com/bug?extid=e41e83af7a07a4df8051
> Cc: stable@vger.kernel.org
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> ---
>   fs/ocfs2/resize.c   | 4 ++--
>   fs/ocfs2/suballoc.c | 5 +++++
>   2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ocfs2/resize.c b/fs/ocfs2/resize.c
> index b0733c08ed13..22352c027ecd 100644
> --- a/fs/ocfs2/resize.c
> +++ b/fs/ocfs2/resize.c
> @@ -329,8 +329,8 @@ int ocfs2_group_extend(struct inode * inode, int new_clusters)
>   	group = (struct ocfs2_group_desc *)group_bh->b_data;
>   
>   	cl_bpc = le16_to_cpu(fe->id2.i_chain.cl_bpc);
> -	if (le16_to_cpu(group->bg_bits) / cl_bpc + new_clusters >
> -		le16_to_cpu(fe->id2.i_chain.cl_cpg)) {
> +	if (!cl_bpc || le16_to_cpu(group->bg_bits) / cl_bpc + new_clusters >
> +		       le16_to_cpu(fe->id2.i_chain.cl_cpg)) {

checking cl_bpc makes sense.

>   		ret = -EINVAL;
>   		goto out_unlock;
>   	}
> diff --git a/fs/ocfs2/suballoc.c b/fs/ocfs2/suballoc.c
> index f7b483f0de2a..844cb36bd7ab 100644
> --- a/fs/ocfs2/suballoc.c
> +++ b/fs/ocfs2/suballoc.c
> @@ -671,6 +671,11 @@ static int ocfs2_block_group_alloc(struct ocfs2_super *osb,
>   	BUG_ON(ocfs2_is_cluster_bitmap(alloc_inode));
>   
>   	cl = &fe->id2.i_chain;
> +	if (!le16_to_cpu(cl->cl_bpc)) {
> +		status = -EINVAL;
> +		goto bail;
> +	}
> +

See my previous comment, this part code is useless, please remove it.

Thanks,
Heming

>   	status = ocfs2_reserve_clusters_with_limit(osb,
>   						   le16_to_cpu(cl->cl_cpg),
>   						   max_block, flags, &ac);

