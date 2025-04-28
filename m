Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC002798E6
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745857614; cv=none; b=lCDFBh/WyL1EJedisJwiLUxICKuwaIHa9Y87o1KrT2QS6iKenS5adkbJccKRLz2Pvj40UsrRhH+9XYLg6AsKu7iv4PLtttXfck8s0IEYjepS71Kx28w1OMCraulpiyjEFWtcTGBh8mzLvjyqIVah/Io2o7U5Zy9+WFAyMckGU7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745857614; c=relaxed/simple;
	bh=ksyN95EDrkFmESMn4lf8CQ57O/whr7MyPb9Nw0LymDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRlNY2G/tRFNoQ0mVtpdF000nLec4dwAoApY8bb69BgYCg4Yoe/cYFEyJLtOykedHzICTnTcwuZnc3FvXiWF8UgnZxwSqUfqXLT7/9biWBcTfEdAEcHLal5tawJhqwTUClMon+HorDe49gUXQOIicBRjB+o9u1VWgh9tMrMuXNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IxSnUi5n; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IxSnUi5n"
Date: Mon, 28 Apr 2025 12:26:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745857609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yQDgjov9WWgtirD8LS89j6ZcnxopnAXeXg5EGpMoC54=;
	b=IxSnUi5nGK+sj2Q9B95WLoAA83XUsp1IWLCu+sDZ/bCykMWs7CGBscftp9XPokd2VAokIt
	/2nUWwwx+KwyZkV9ItFNjiCH8o3U3kkTm+F7VChNl/vlagbyqIMGKAOxs1UQXyEsrrm+LL
	EVQkOnWMLjMLkhrk1VHBQOUs0xZgMWE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Arnaud Lecomte <contact@arnaud-lcm.com>
Cc: syzbot+843981bb836d699c07d1@syzkaller.appspotmail.com, 
	linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: syztest
Message-ID: <7ifxn2xgtn2ptlaxow4447vfo2p4chhz4d52svaccgl4u5wag3@hvgf5yslldzs>
References: <67f76c11.050a0220.258fea.0029.GAE@google.com>
 <20250428160903.20110-1-contact@arnaud-lcm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428160903.20110-1-contact@arnaud-lcm.com>
X-Migadu-Flow: FLOW_OUT

On Mon, Apr 28, 2025 at 06:09:03PM +0200, Arnaud Lecomte wrote:
> #syz test

Don't rely on syzbot for testing, you really need to be running the
tests yourself and looking at all the output.

It's not enough to know that we're not crashing anymore, we want the
filesystem to repair and mount successfully.

> --- a/fs/bcachefs/fsck.c
> +++ b/fs/bcachefs/fsck.c
> @@ -976,7 +976,24 @@ int bch2_fsck_update_backpointers(struct btree_trans *trans,
>  	int ret = 0;
>  
>  	if (d->v.d_type == DT_SUBVOL) {
> -		BUG();
> +		struct bch_subvolume subvol;
> +
> +		ret = bch2_subvolume_get(trans, le32_to_cpu(d->v.d_child_subvol),
> +					     false, &subvol);
> +		if (ret && !bch2_err_matches(ret, ENOENT))
> +			goto err;
> +
> +		ret = get_visible_inodes(trans, &target, s, le64_to_cpu(subvol.inode));
> +		if (ret)
> +			goto err;
> +
> +		if (target.inodes.nr) {
> +			target.inodes.data[0].inode.bi_dir_offset = d->k.p.offset;
> +			ret = __bch2_fsck_write_inode(trans, &target.inodes.data[0].inode);
> +			if (ret)
> +				goto err;
> +		}
> +
>  	} else {
>  		ret = get_visible_inodes(trans, &target, s, le64_to_cpu(d->v.d_inum));
>  		if (ret)
> -- 
> 2.43.0
