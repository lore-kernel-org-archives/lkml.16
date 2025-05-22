Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A2C17BB6
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747912278; cv=none; b=mvIUkZTvYyOsESYCuMJJv+XgaZ22l3EgGtbTSTb8olCDEehmMM6LZGPRm6eXe0v0kiXrxLMPQgq71u2pvsRNHppHvNKP8lVNbpnwR3b8eKwEYPnPKUCV0+88k2t/xbk7zSI3JYBhuqnBfHDI4kBY8Z8gRb3EAJtiVA00fUl+vqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747912278; c=relaxed/simple;
	bh=aHgtBI7v+S81AM2CaYELSl4mkDoqDdn1xSKhIL81RAo=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gcMruWPLDP8nLfPb0m5Ws158DoZvIctq5LEfhNybfR5iW+LAsuMivAP+3KBiivtJjEsPxwhsdJjbxNp8RejF29RZ+nW1MDzihROl5Wr2A6w0WpskRNRtb+jZ/HNP6zx9GZpSjuCkBnOAEr87pt38Uqpg/sLxPOJrMKhhaH+tgdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jVvRRaVa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jVvRRaVa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13A4FC4CEE4;
	Thu, 22 May 2025 11:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747912277;
	bh=aHgtBI7v+S81AM2CaYELSl4mkDoqDdn1xSKhIL81RAo=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=jVvRRaVar+06zB2qK/iHi4yi0IU1sMlKvzmJRawmtVtiTsa1hhEEDTIPe48NJdHYW
	 tvg8Ih33kas/6QxuYdmxVrkbKB6E9d/mEnu6AysBNRDNBQNaNERVlZXYR+1h6nPJCD
	 vUTv4BAq2tuhMLW+06Zoz+su+1Rp+puTpDWnVMhLezdlxbANmZ4p/uU3hEgDUX+NPR
	 T4BWvo4lOoIsjckr7KeNSlF7uZAcN7feyYQFxiYXF/alEBV02Z1+Ou1DRzcLP1nlZr
	 lDW6CvLRd6p8pWDoanjvOCkWUr0LbuyYbe5Q130vAUWPQ8vCUt2M7uDNAYU6JgTMTv
	 /lk52c3qmGc8A==
Message-ID: <e73ac805-b51e-4457-9f7d-7d3feaff32d8@kernel.org>
Date: Thu, 22 May 2025 19:11:14 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] f2fs: fix missing small discard in fstrim
To: Chunhai Guo <guochunhai@vivo.com>, jaegeuk@kernel.org
References: <20250102101310.580277-1-guochunhai@vivo.com>
 <20250102101310.580277-2-guochunhai@vivo.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250102101310.580277-2-guochunhai@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/2/25 18:13, Chunhai Guo wrote:
> If userspace issues an fstrim with a range that does not include all
> segments with small discards, these segments will be reused without being
> discarded. This patch fixes this issue.
> This patch is somewhat similar to commit 650d3c4e56e1 ("f2fs: fix a missing
> discard prefree segments").

I guess it's better to update commit message as we discussed?

> 
> Fixes: d7bc2484b8d4 ("f2fs: fix small discards not to issue redundantly")
> Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
> ---
>  fs/f2fs/segment.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 8fe9f794b581..af9a62591c49 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -4552,6 +4552,8 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>  	struct list_head *head = &SM_I(sbi)->sit_entry_set;
>  	bool to_journal = !is_sbi_flag_set(sbi, SBI_IS_RESIZEFS);
>  	struct seg_entry *se;
> +	bool force = (cpc->reason & CP_DISCARD);
> +	__u64 trim_start = cpc->trim_start;
>  
>  	down_write(&sit_i->sentry_lock);
>  
> @@ -4609,7 +4611,9 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>  #endif
>  
>  			/* add discard candidates */
> -			if (!(cpc->reason & CP_DISCARD)) {
> +			if (!force || (force &&

if (!force || (f2fs_realtime_discard_enable() &&
		(segno < trim_start || segno > trim_end)))

Thanks,

> +					(segno < trim_start ||
> +					 segno > cpc->trim_end))) {
>  				cpc->trim_start = segno;
>  				add_discard_addrs(sbi, cpc, false, false);
>  			}
> @@ -4649,8 +4653,8 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>  	f2fs_bug_on(sbi, !list_empty(head));
>  	f2fs_bug_on(sbi, sit_i->dirty_sentries);
>  out:
> -	if (cpc->reason & CP_DISCARD) {
> -		__u64 trim_start = cpc->trim_start;
> +	if (force) {
> +		cpc->trim_start = trim_start;
>  
>  		for (; cpc->trim_start <= cpc->trim_end; cpc->trim_start++)
>  			add_discard_addrs(sbi, cpc, true, false);

