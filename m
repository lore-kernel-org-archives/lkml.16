Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B704DC8EB
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 06:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743055787; cv=none; b=FrBhF8/uGAHGlEv1NLxSqoRfkA9Chn79xByyPgnDKA7JvTDVZZ1xFrMdtyYMWREU20ZrpaKeE8hf1n2cbQK75hndCC0hc5gNOvISFI+tXzPVy+fhaVQTyXOcOd8JP8IFOlMb/7ZH+oLYWJ3iRz6eh2jL9AVNf/yvi8XYRdPiYDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743055787; c=relaxed/simple;
	bh=uvkcYrknQHKPV0dudUcYVvBBCVyrTONRTWEpan0+x/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U8i+Gqo3hVhA6xqPv7b61ksL2n2406aztnGzVJEVtull+1U6I4Ou1w9cqNoSalYDS/jOxZLou2dV13HHMwo825+SE46VKcatqwbPXHcG4EcEbJoVBJL6qSzvfvWk1KASt/zZs1xDRCAZW+14cQhqgCn9gyA557aAOCj27WgUb5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PrnYv6br; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PrnYv6br"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3912622c9c0so70521f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 23:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743055783; x=1743660583; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HM7gFMQ5jRKrlxt7NfSaAhYPHmSzldvP/qg6bOXGtLE=;
        b=PrnYv6brjXtbPQDNVBaqbfhXX1ygJ4+kEtE8trSIfqwQGZMvi5CmZI7e9ZxlCDmgKf
         zi35pcuwwsvGp561Ihn1vo1HDBFY7BhEpEnvrRm4eFpMcCuWWTiHALyisrTg23dbTmEU
         T506nSul7IAqcM5ixB+PxEKW7GU0Ds094OHGnHv4bCBqLxBFSSbRsG09+xv/QoTEw6XS
         eb5kEvKf4uZh+blc/GkdwYNTRKv/AFqwfUd2AmKerkduAEgZHeyyK1QMwNBHA/iUcMMr
         nshj+iFFu4JSOYRDnHuJWYM/GU/spxgMoQqG/ay0YJB5ozY6ArvSEXPT2MqXQyDcguK0
         Lw2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743055783; x=1743660583;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HM7gFMQ5jRKrlxt7NfSaAhYPHmSzldvP/qg6bOXGtLE=;
        b=jIK+f/Y997Hp/jaJZFx6M7ByTwTxxyF3pSLNfnZigTEgTVimep1/y2LPnw7gaLkLCT
         sb07rLjYhsyXQAhDsbCdH6Z3XPU733W0HXq7aT35eOmAxwfan65mjiOh4vF2MbIKvPGt
         3DTJGAkCQoP+Tec4ap6rAdebQDz5y5No4E72Kx67sTyPXg6lSJTrLDW9V2lKLem6bMZ6
         sSjCvg7T+x+5A9AAPKdxpxOIoL+EjWzpdAlkYVroWmH+kRhu/84jGPz+3a+u1ZPCO7ot
         SdLOfwU521NdtS7MJG4FQl5HqnhJ2NQHzgBpIXFIs2g/uDQz6akt8XUOBbRF7FMeyFb3
         q/eQ==
X-Gm-Message-State: AOJu0Ywj+09UrSetNN6+yCFiNP8lLp7Q241P4EkCeNn8FETusRoPjt4P
	VXsWdVFkqncNNYwVSqpoAl4M51/+MnBZt4q+ps4RGRNQWF/f9Roe1iIAF7IK0Uw=
X-Gm-Gg: ASbGncs4xSd5Q9m/6L+dawhJvTp99ZoW3Qc2OOhoS0ed1o556d8PDvLUIK/mak3QjkR
	obXLdQXtK+YqPVOf8M72MD9iYeY531NgfZ3hEpZ59blCqBQOxbKBS9kdxmi3o+MZaj4841NqVPV
	8fpAMyFnkhUK3MXsuREIJrdPmsKES1y5g/85FDACBv8s+rahHxvEjbRMMd+p9aMWfFZjqMRN4hh
	jwSQQZns0k9j22E4zHQJwrHwiPW2oL/16cP5z7RY7maKsxJAX6rOW+E5N9QNDh0Dzl+WrDEEmA0
	98ZBaDyqlogCYgYy8VuLcdf1G+GGcHMpYafCGcbOXIqru0RcSkV+6t+hr91tRQ==
X-Google-Smtp-Source: AGHT+IFBpl13uznEPbpL0leSZsm5pJwcTCvF5mI/ucN0wAkZbTaUXop/xETfBhOfiRHhHsmgfUqsMA==
X-Received: by 2002:a5d:64a4:0:b0:391:2b54:5f9e with SMTP id ffacd0b85a97d-39ad2ae2851mr353949f8f.6.1743055782988;
        Wed, 26 Mar 2025 23:09:42 -0700 (PDT)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f3b3f2sm120411865ad.29.2025.03.26.23.09.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 23:09:42 -0700 (PDT)
Message-ID: <199205d8-20fb-463d-9065-8021b3cf7cb8@suse.com>
Date: Thu, 27 Mar 2025 14:09:38 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/1] ocfs2: fix write IO performance improvement for
 high fragmentation
To: Gautham Ananthakrishna <gautham.ananthakrishna@oracle.com>,
 joseph.qi@linux.alibaba.com
Cc: linux-kernel@vger.kernel.org, ocfs2-devel@lists.linux.dev,
 rajesh.sivaramasubramaniom@oracle.com, junxiao.bi@oracle.com,
 akpm@linux-foundation.org
References: <20250324054851.2509325-1-gautham.ananthakrishna@oracle.com>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <20250324054851.2509325-1-gautham.ananthakrishna@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Gautham,

Thanks for locating the issue and submitting a patch.
Is it possible to share your test case for this bug?

The key of this bug is ocfs2_cluster_group_search() comparing with wrong
bits size. I have another fix for this bug and will send it to this mailing
list later.

Thanks,
Heming

On 3/24/25 13:48, Gautham Ananthakrishna wrote:
> The commit 4eb7b93e03101fd3f35e69affe566e4b1e3e3dca caused a regression
> in our test suite in discontig extent tests. Upon troubleshooting I found
> The following issues.
> 
> 1. The function ocfs2_cluster_group_search() was called for discontig allocations
> as well. But it checks only the contiguous bits 'bg_contig_free_bits'.
> It hit the ENOSPC in the following case in one of the tests.
> 
> ocfs2_mkdir()
>   ocfs2_reserve_new_inode()
>    ocfs2_reserve_suballoc_bits()
>     ocfs2_block_group_alloc()
>      ocfs2_block_group_alloc_discontig()
>       __ocfs2_claim_clusters()
>        ocfs2_claim_suballoc_bits()
>         ocfs2_search_chain()
>          ocfs2_cluster_group_search()
> 
> Looked like the commit did not consider discontig searches. To fix this,
> I have split ocfs2_cluster_group_search() into *_common(), *_contig() and
> *_discontig()
> 
> 2. That commit enforced ocfs2_cluster_group_search() to search only the
> 'bits_wanted' number of bits whereas ocfs2_block_group_find_clear_bits()
> fills the best available size and the function ocfs2_cluster_group_search()
> itself is supposed to search 'min_bits' at the minimum and need not be
> 'bits_wanted' always.
> 
> Fixed the above issues in this patch.
> This patch fixes 4eb7b93e03101fd3f35e69affe566e4b1e3e3dca
> 
> Signed-off-by: Gautham Ananthakrishna <gautham.ananthakrishna@oracle.com>
> ---
>   fs/ocfs2/suballoc.c | 146 ++++++++++++++++++++++++++++----------------
>   1 file changed, 95 insertions(+), 51 deletions(-)
> 
