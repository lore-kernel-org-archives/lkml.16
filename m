Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49201BE86E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744811434; cv=none; b=jVSxEXjLpopCIMf6HiWW0ruMNhBaD2hKOpmOejUKPm6ZJ9i0PJeou4nBRU38gx9qBWjzy9o3WLVzECSgL9ssXUjqLv6XQ4Q6JCBdyci2GyuY9DTGejC70vv31mESAd4CA2FEy2+ZRKcB9FmOXob38dWsecd6Nhrp7C5UXWNw2/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744811434; c=relaxed/simple;
	bh=M4EdOvQ86sQf9if51CzmVYk5pURUpe0O38CIDKL4KzM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zwekyo40VTCVoxvTkDkZCRPUnZQQXVBXYWSUOxAAlqYQW043vuwp56Q/qaU151VcC3QK+XpsNV/7YK/VWcLMp3WTdts+Ag3Av9VPyHuP2WYBdiQUgnTzKhY3Dx75QtEc2j3FASb/Xf3hBTnYN9B5fQ+Y/BxFjFOGhC2mqAN3kkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aEdtBed/; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aEdtBed/"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30eef9ce7feso68613161fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744811431; x=1745416231; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qz/kM7z+Cf6qmCgmVZXIwpgfudi7qnPo/gQOd9cA2Mo=;
        b=aEdtBed/MbcsVAevP57A8U4X8sxMrF/2yZvYReZqUH469r+uf74iABAsGjBhFCfBA6
         SR0aPanuVMzKGY4+aHKPojuuAefX1ysA2/z/8dQgvlt0lrWLu0OObk96mo1MJoPH/MD3
         BYValTW75zpmzwbhPRuSGuAg7fIeQDV588Ml4e5+88sCyD8IuTSVk7aoqhvdX9M74/QD
         CKn0vdeUChKFfd4uMcpFxP02oVT9nstuqZteehCpO0Ui2ZWWvBkxOEFda/uDLn7dT+1N
         mFdcnIZV/xNZcDmqSZhB5yiV92a+hajjxBnHEuDsOiG1FMDPeJ0e0VwTL7nGktJ3Omd0
         aO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744811431; x=1745416231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qz/kM7z+Cf6qmCgmVZXIwpgfudi7qnPo/gQOd9cA2Mo=;
        b=tRVPl2Ahz8CENaGVz4CoJhe7n74QRY9HRusq/tzDYe8cxb2KJAWoYCpliDYOVwR6ix
         ofgq+AKfzLAbvf23QcQ9JoX6eXODAHjW+ytTxqnr/SQhKuPSb4UkxVNbJ4NLQQ3Rk2xS
         vjjAlP7QchcCbt7hq3bM3h6TQYyhsAqI7FZz345xY4W3+D5zDWj+pHxfDLOmXxSgqK+c
         xDRUH+RlUyC00CO0Cn1QRvNd0GIPouH6YspB47CUHTtk1cTaBK0wopOmujFdxXfmZHUK
         3G6xM7RgV5K9PqyR6iA6MuAzgU8AEaL2ybo3PSGUqTyJq6OFQ5oO9XLqRG0/9Pj7lGIX
         tPdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpwVtSpiTlSKrLcnK+Rkc61OTvYlaseaBvjFWCr+N3EsQU045W/g0RWexkZqSTxv+05QYgs6g2Av4zrQE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOf1dvDTshKbXtqj1ex/j4iPtV081Ohy4Bg4cy39Qgxr21kDIV
	4h1PQSU1vJKtqQDJqDWozTTPltYVeexvivQPjbPsAg5sJV8n3R0EhFs6tWKe
X-Gm-Gg: ASbGncsSOT1+ofXg/aoSrbz4lSbrYVqkQ9cQBB3yxy4TDQT2MBetf94sBvyKDh/8Zv8
	m7foOLnfKQ9bj8XWVmurQrHfOWrPELLVQgXoXvY13hc3lYtnFFuDzW6qV0zhJHbAyQngrKBZ7Gv
	32sTajGqqEY56KRnd+n92PzI/txRH1c579Q+qOUKm1BzwFeyAPHzRRDA7M3QmjrAQytmf6s6PxM
	Z+hFly5mDQkdEnjBf10K0wX1HmGCJPSLF1gvDoyQrFKbfmVt80tMo4+PazpbMXtFds6Uenm3Z2V
	Juf6kcfkXwll5ZRNEyNoq7mrV7ICuzsVd66uEG/Bj2I4zyh7KaPDRcr7nuDS8bUiljg/
X-Google-Smtp-Source: AGHT+IG3SR/JrSxS7Hp9wDEWjryCRKGfud7qFC6YuLJcuuxb2V0WRAZnz0EpA3wF4xfmIvB4KIHF1w==
X-Received: by 2002:a05:651c:244:b0:30d:dad4:e06f with SMTP id 38308e7fff4ca-3107f694abbmr8064061fa.2.1744811430417;
        Wed, 16 Apr 2025 06:50:30 -0700 (PDT)
Received: from pc636 (host-90-233-217-52.mobileonline.telia.com. [90.233.217.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465d5ca7sm23418681fa.66.2025.04.16.06.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 06:50:29 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 16 Apr 2025 15:50:27 +0200
To: Baoquan He <bhe@redhat.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, urezki@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] mm/vmalloc.c: optimize code in decay_va_pool_node()
 a little bit
Message-ID: <Z_-1ozajrbaVLq6m@pc636>
References: <20250415023952.27850-1-bhe@redhat.com>
 <20250415023952.27850-4-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415023952.27850-4-bhe@redhat.com>

On Tue, Apr 15, 2025 at 10:39:50AM +0800, Baoquan He wrote:
> When purge lazily freed vmap areas, VA stored in vn->pool[] will also be
> taken away into free vmap tree partially or completely accordingly, that
> is done in decay_va_pool_node(). When doing that, for each pool of node,
> the whole list is detached from the pool for handling. At this time,
> that pool is empty. It's not necessary to update the pool size each time
> when one VA is removed and addded into free vmap tree.
> 
> Here change code to update the pool size when attaching the pool back.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>  mm/vmalloc.c | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 488d69b56765..bf735c890878 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -2150,7 +2150,7 @@ decay_va_pool_node(struct vmap_node *vn, bool full_decay)
>  	LIST_HEAD(decay_list);
>  	struct rb_root decay_root = RB_ROOT;
>  	struct vmap_area *va, *nva;
> -	unsigned long n_decay;
> +	unsigned long n_decay, len;
>  	int i;
>  
>  	for (i = 0; i < MAX_VA_SIZE_PAGES; i++) {
> @@ -2164,22 +2164,20 @@ decay_va_pool_node(struct vmap_node *vn, bool full_decay)
>  		list_replace_init(&vn->pool[i].head, &tmp_list);
>  		spin_unlock(&vn->pool_lock);
>  
> -		if (full_decay)
> -			WRITE_ONCE(vn->pool[i].len, 0);
> +		len = n_decay = vn->pool[i].len;
> +		WRITE_ONCE(vn->pool[i].len, 0);
>  
>  		/* Decay a pool by ~25% out of left objects. */
> -		n_decay = vn->pool[i].len >> 2;
> +		if (!full_decay)
> +			n_decay >>= 2;
> +		len -= n_decay;
>  
>  		list_for_each_entry_safe(va, nva, &tmp_list, list) {
> +			if (!n_decay)
> +				break;
>  			list_del_init(&va->list);
>  			merge_or_add_vmap_area(va, &decay_root, &decay_list);
> -
> -			if (!full_decay) {
> -				WRITE_ONCE(vn->pool[i].len, vn->pool[i].len - 1);
> -
> -				if (!--n_decay)
> -					break;
> -			}
> +			n_decay--;
>  		}
>  
>  		/*
> @@ -2188,9 +2186,10 @@ decay_va_pool_node(struct vmap_node *vn, bool full_decay)
>  		 * can populate the pool therefore a simple list replace
>  		 * operation takes place here.
>  		 */
> -		if (!full_decay && !list_empty(&tmp_list)) {
> +		if (!list_empty(&tmp_list)) {
>  			spin_lock(&vn->pool_lock);
>  			list_replace_init(&tmp_list, &vn->pool[i].head);
> +			vn->pool[i].len = len;
>  			spin_unlock(&vn->pool_lock);
>  		}
>  	}
> -- 
> 2.41.0
> 
Which Linux version this patch is based on? I can not apply it.

Small nits:

<snip>
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index c909b8fea6eb..0ae53c997219 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2150,7 +2150,7 @@ decay_va_pool_node(struct vmap_node *vn, bool full_decay)
 	LIST_HEAD(decay_list);
 	struct rb_root decay_root = RB_ROOT;
 	struct vmap_area *va, *nva;
-	unsigned long n_decay, len;
+	unsigned long n_decay, pool_len;
 	int i;
 
 	for (i = 0; i < MAX_VA_SIZE_PAGES; i++) {
@@ -2164,21 +2164,20 @@ decay_va_pool_node(struct vmap_node *vn, bool full_decay)
 		list_replace_init(&vn->pool[i].head, &tmp_list);
 		spin_unlock(&vn->pool_lock);
 
-		len = n_decay = vn->pool[i].len;
+		pool_len = n_decay = vn->pool[i].len;
 		WRITE_ONCE(vn->pool[i].len, 0);
 
 		/* Decay a pool by ~25% out of left objects. */
 		if (!full_decay)
 			n_decay >>= 2;
-		len -= n_decay;
+		pool_len -= n_decay;
 
 		list_for_each_entry_safe(va, nva, &tmp_list, list) {
-			if (!n_decay)
+			if (!n_decay--)
 				break;
 
 			list_del_init(&va->list);
 			merge_or_add_vmap_area(va, &decay_root, &decay_list);
-			n_decay--;
 		}
 
 		/*
@@ -2190,7 +2189,7 @@ decay_va_pool_node(struct vmap_node *vn, bool full_decay)
 		if (!list_empty(&tmp_list)) {
 			spin_lock(&vn->pool_lock);
 			list_replace_init(&tmp_list, &vn->pool[i].head);
-			vn->pool[i].len = len;
+			vn->pool[i].len = pool_len;
 			spin_unlock(&vn->pool_lock);
 		}
 	}
<snip>

on top of this?

a) decay in "if" statement, no need extra line;
b) rename len to something obvious - pool_len.

--
Uladzislau Rezki
