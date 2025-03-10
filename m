Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A041DE2AD
	for <linux-kernel@vger.kernel.org>; Mon, 10 Mar 2025 20:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741637542; cv=none; b=X7D840VaoSL7xF3xnAGgJJv1uOG3HlvabP+y8Zwu7brNcOo7A5/8Mv38cLTD9WEaeOx2lRHws86MxkAC4u/VbWLJoUzloI3EYmiL02nLifajGATRDm7PHIFj1u7yqmeQyrCJP/IckWuZJq44sEoEIykhn05GJcDqOw28pBPQGXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741637542; c=relaxed/simple;
	bh=wR8SPqhsmSNOVZUWlxT7wNJ39fRP7kFdMF+NO05Y8SA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C95CVWT1ESp+OZ4VpZae/n6lXQCqOCaOXKhil8frTzWzkfxB4V+PEjpd6oXi6lauRZqhOxP2zpjJfnWTy8uZW+mRTe4qwttXLUukb/ErKBJnFGBppwX+gT41CsB7eQg/ckX+5FHIXnQRfHYDwFqmPKDrMIifF/V3HAiJDIf7Cv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=q9IvGUo+; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="q9IvGUo+"
Date: Mon, 10 Mar 2025 16:12:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741637527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qp0f29NCVdpVlEUgIWjKinIfJ4eChsq5fWyGlN5hbjc=;
	b=q9IvGUo+YAlF/+hspPBj0hm5Vn0feaVD/Yal3Y/cjkKUz5/AVIhkprA65qccIjETDk3CWT
	HOZZ1Qbcu+jDWLXZtr43D4tC+gcQp+BZip3Fg503MH4x0UDG4kV6p1KtbK1i5q8ozfW4dA
	17oLqBB4q6qhMocoSSTW6N0m8wdWerk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bcachefs: Fix error type in bch2_alloc_v3_validate()
Message-ID: <vmzrwmv5o5pnajw6yhklf6ouixo5raw3ophxmzocva3qag4xpy@u6l67hs6rhov>
References: <20250310192028.442751-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310192028.442751-2-thorsten.blum@linux.dev>
X-Migadu-Flow: FLOW_OUT

On Mon, Mar 10, 2025 at 08:20:29PM +0100, Thorsten Blum wrote:
> Use error type alloc_v3_unpack_error in bch2_alloc_v3_validate().
> 
> Fixes: b65db750e2bb ("bcachefs: Enumerate fsck errors")
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Thanks, applied

> ---
>  fs/bcachefs/alloc_background.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/bcachefs/alloc_background.c b/fs/bcachefs/alloc_background.c
> index ecad4a78c3f7..4dfcf3e6fffd 100644
> --- a/fs/bcachefs/alloc_background.c
> +++ b/fs/bcachefs/alloc_background.c
> @@ -232,7 +232,7 @@ int bch2_alloc_v3_validate(struct bch_fs *c, struct bkey_s_c k,
>  	int ret = 0;
>  
>  	bkey_fsck_err_on(bch2_alloc_unpack_v3(&u, k),
> -			 c, alloc_v2_unpack_error,
> +			 c, alloc_v3_unpack_error,
>  			 "unpack error");
>  fsck_err:
>  	return ret;
> -- 
> 2.48.1
> 
