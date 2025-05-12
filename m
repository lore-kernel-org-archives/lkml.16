Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569861E503C
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747063630; cv=none; b=FyzMsjrzZPGr+yYuZNPOJXFlkDBz/aJ4g9Mb29MpD6ht13Um0Qp0xzjs35sJS/9/G0gINrCRAxLYwBZBGbRD466F2Dqtaqb0a2OVbuJLKWaDsT2PUrQKlsZnk8zZW87Wgi9HK5Ri2CB8NR/IvpEyeTzJtR9l1BnK9D1Fb1mxUjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747063630; c=relaxed/simple;
	bh=R1srgJZKiVKfqoiHkN2fnKJzVCfbE1bdF6q6xYCtsyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eHGABBPt6WR1D04vlfgFwz5VQ1dYEMuUeYg8P4qALWS6VIndA8HACkc7VzN1RzALnKc/phV16is4u9OR3CybPz1UdvTfV32x+Pzz0GIgJlHMM27rVUdEPzhcjxSzvvXEI3QFamRSUoWfmXlsvc8TLHmCaCi8vFPi64nQpKV7k28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KMZVXZ4a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KMZVXZ4a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC177C4CEE7;
	Mon, 12 May 2025 15:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747063629;
	bh=R1srgJZKiVKfqoiHkN2fnKJzVCfbE1bdF6q6xYCtsyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KMZVXZ4aQIytHkvaKeT0brW0iZxzznXFdO7CHRHBWHzAA2FEsosRJRcZki7B+NVH2
	 cwIjylxq4F6Xrk3QDR2e8aOdiANknoWCR1LbbIP9EPCh3RxofKRSUTCHgmPwP/2P4m
	 LDX1xQrN1UGqilYJJ/6KmD4GqVhvTfV2AtHn+gb4ce0SCrl47ga9bTukIuek7+/Xt6
	 bUgFdTFa521ICv3GfbYys5hmjhl6EJx9134nB0DkYBvA3GanUFEoxKX/f6fIv4BNJk
	 man5047KgW+3eDNuVXJAnMoSp7YRrjNB9OpKcMP4wnlMVICfruegexChJTAVXRA2eZ
	 GlUJto5X+mMFg==
Date: Mon, 12 May 2025 15:27:08 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] f2fs: add f2fs_bug_on() in f2fs_quota_read()
Message-ID: <aCITTEkOYqZdYTy1@google.com>
References: <20250512115442.2640895-1-chao@kernel.org>
 <20250512115442.2640895-2-chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512115442.2640895-2-chao@kernel.org>

On 05/12, Chao Yu wrote:
> mapping_read_folio_gfp() will return a folio, it should always be
> uptodate, let's check folio uptodate status to detect any potenial
> bug.

If it's supposed to be uptodate, can you add f2fs_bug_on() only?

> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/super.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 0ee783224953..ea207a9edc10 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2973,6 +2973,17 @@ static ssize_t f2fs_quota_read(struct super_block *sb, int type, char *data,
>  			goto repeat;
>  		}
>  
> +		/*
> +		 * should never happen, just leave f2fs_bug_on() here to catch
> +		 * any potential bug.
> +		 */
> +		if (unlikely(!folio_test_uptodate(folio))) {
> +			f2fs_folio_put(folio, true);
> +			set_sbi_flag(F2FS_SB(sb), SBI_QUOTA_NEED_REPAIR);
> +			f2fs_bug_on(F2FS_SB(sb), 1);
> +			return -EIO;
> +		}
> +
>  		memcpy_from_folio(data, folio, offset, tocopy);
>  		f2fs_folio_put(folio, true);
>  
> -- 
> 2.49.0
