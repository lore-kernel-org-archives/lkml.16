Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016B2645
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 17:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747157611; cv=none; b=Sq7vyZy/NKtSHWRyyVLRIUwqsHSrMEoUK0jr13npEANE9olv8c9VOapX0jk535PvLpCKmVVArTaRz1mlmJpLn47rlUM+YA+d84JT84ac3v2RBbLTs8LL8ZGCFK3q/1BhQLq/hYo/CBJBfutJnZ7mBZOUQsPthLWoLnGva42Fcvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747157611; c=relaxed/simple;
	bh=8/kxUx03Cd56tPDMq34yg6hEdXcccZ6H0bfwJAdVMbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dzi/xx8xdmG94hwUx1Z1Su5ohR5ZZbqtDPUy6CWw6iZwv2dWIjvTk070m1+v0tf+0qsx0E1Ockg6H/RqWuJ1tzH+3v64h+1XJV9XSaCcH0zZNvfA44MRpBHGVS+rtHze9XXZ+6m8rPZ/LJT4Zi+9snxyhb93a5A012Xc3ikBlLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uIpAOfcT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uIpAOfcT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55FB4C4CEE4;
	Tue, 13 May 2025 17:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747157610;
	bh=8/kxUx03Cd56tPDMq34yg6hEdXcccZ6H0bfwJAdVMbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uIpAOfcTg84I8u7cgzS++51FL1oynmVddsgOKaLO4Vs4eG/oFAFbNsKWL0m3GC4je
	 cfu6UIGP8NxXOLu+/ox6yNyYX9IwH1zgMfAYfqrs6NNVd9oQvK997uHjHGAvoL03YJ
	 A5pjOKrZNdhHQXew6f/1Tg/k3EnE0MKADxm0g9+zkN9l5lT2bPnWhljP7uhg6A5syW
	 0SDrHWZ3+XWZUUgVsz2Uc/wZ6cV8Pxd4fTTGvYnSckSyLEMIDnHdoV6739TmuGcDVg
	 1sB7S6C1r8x5Qq0sxpuJ8hDPsIA+hBcLM5sYqcQ3fIJdKlkdjGZV7GcIX4GyE8Jf0a
	 1KNvw6DX8nOsw==
Date: Tue, 13 May 2025 17:33:28 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] f2fs: add f2fs_bug_on() in f2fs_quota_read()
Message-ID: <aCOCaDyFm-etmFiF@google.com>
References: <20250513031907.2876275-1-chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513031907.2876275-1-chao@kernel.org>

On 05/13, Chao Yu wrote:
> mapping_read_folio_gfp() will return a folio, it should always be
> uptodate, let's check folio uptodate status to detect any potenial
> bug.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - just add f2fs_bug_on(), get rid of error handling.
>  fs/f2fs/super.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 0ee783224953..8c77a625427c 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2973,6 +2973,12 @@ static ssize_t f2fs_quota_read(struct super_block *sb, int type, char *data,
>  			goto repeat;
>  		}
>  
> +		/*
> +		 * should never happen, just leave f2fs_bug_on() here to catch
> +		 * any potential bug.
> +		 */
> +		f2fs_bug_on(sbi, !folio_test_uptodate(folio));

Applied with		    F2FS_SB(sb)

> +
>  		memcpy_from_folio(data, folio, offset, tocopy);
>  		f2fs_folio_put(folio, true);
>  
> -- 
> 2.49.0
