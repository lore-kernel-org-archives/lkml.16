Received: from out-176.mta0.migadu.com (out-176.mta0.migadu.com [91.218.175.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131C21BD9C7
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 18:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738433530; cv=none; b=qNL0Ev//ixxXWE0bDlw787mJ+uYflVL1pDtkRZzpOEPc63QAlkI5tVCKOlbYtHwQwhfgeFe+fs9VBqlyd96x+Ff1VbEdYPsgux08wW3dYnAU2aHMInQ7knevChw5PIH8xgu9gDgyGXE+7T7Rg/DFSCgt9vl8c4qEgnHRfmnEchY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738433530; c=relaxed/simple;
	bh=ylqTndbw25jst/aS8kQCVWfhdSaLl90V6zx+IzRHeUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WsRVcKcVtVZKmtovQli3GqsStDT1h+rylVcay6L9UjjYzVfSN635fjeEq+ElM3HG8hGy3ToRoa++3NGbUv572r/0yq+t4QkKyoPPD5goum/fXA6a2jQAKPWIkNEk9b1gI3sVHGsT6w7pMV/dZRVQDbe0La7xjp7tPmW/4C18/sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JIaL3Jb6; arc=none smtp.client-ip=91.218.175.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JIaL3Jb6"
Date: Sat, 1 Feb 2025 13:11:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738433520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=371ne/J4qS9JYHOniy+YfT78E4/+g2hn88puecYgas4=;
	b=JIaL3Jb6BZ4JuOj/wsMWk7ZveVCGwqY/a4OIH38TxVoGBUSuqOZVBK/NdI5gqipglsvQFc
	vc2Pkv+D9m9PYnHjOuG9m8cBhno7PlrP+FH/8JX4Py1IPHGd/1qWbtoLpha4haMmQtpFKt
	dcP0QDgJ5zWmJdn1d2QAfmQb22AGJ3w=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Jeongjun Park <aha310510@gmail.com>
Cc: linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bcachefs: fix incorrect pointer check in
 __bch2_subvolume_delete()
Message-ID: <klnddztvbokwdp2wfdl4rgwn6vl5evihm4dmracio54jgarxib@bp4rkii6kiqq>
References: <20250131162031.190424-1-aha310510@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131162031.190424-1-aha310510@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Sat, Feb 01, 2025 at 01:20:31AM +0900, Jeongjun Park wrote:
> For some unknown reason, checks on struct bkey_s_c_snapshot and struct
> bkey_s_c_snapshot_tree pointers are missing.
> 
> Therefore, I think it would be appropriate to fix the incorrect pointer checking
> through this patch.
> 
> Fixes: 4bd06f07bcb5 ("bcachefs: Fixes for snapshot_tree.master_subvol")
> Signed-off-by: Jeongjun Park <aha310510@gmail.com>

Thanks! Applied
> ---
>  fs/bcachefs/subvolume.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/bcachefs/subvolume.c b/fs/bcachefs/subvolume.c
> index e3d0475232e5..b7b96283c316 100644
> --- a/fs/bcachefs/subvolume.c
> +++ b/fs/bcachefs/subvolume.c
> @@ -428,7 +428,7 @@ static int __bch2_subvolume_delete(struct btree_trans *trans, u32 subvolid)
>  		bch2_bkey_get_iter_typed(trans, &snapshot_iter,
>  				BTREE_ID_snapshots, POS(0, snapid),
>  				0, snapshot);
> -	ret = bkey_err(subvol);
> +	ret = bkey_err(snapshot);
>  	bch2_fs_inconsistent_on(bch2_err_matches(ret, ENOENT), trans->c,
>  				"missing snapshot %u", snapid);
>  	if (ret)
> @@ -440,6 +440,11 @@ static int __bch2_subvolume_delete(struct btree_trans *trans, u32 subvolid)
>  		bch2_bkey_get_iter_typed(trans, &snapshot_tree_iter,
>  				BTREE_ID_snapshot_trees, POS(0, treeid),
>  				0, snapshot_tree);
> +	ret = bkey_err(snapshot_tree);
> +	bch2_fs_inconsistent_on(bch2_err_matches(ret, ENOENT), trans->c,
> +				"missing snapshot tree %u", treeid);
> +	if (ret)
> +		goto err;
>  
>  	if (le32_to_cpu(snapshot_tree.v->master_subvol) == subvolid) {
>  		struct bkey_i_snapshot_tree *snapshot_tree_mut =
> --
