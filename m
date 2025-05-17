Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4C936124;
	Sat, 17 May 2025 14:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747491513; cv=none; b=kzy4k5/S2W0wcn1a34NJWHWwhuLxqDNdgnOxaxk54vsAwYDOB82JnmBid7BIb+br3qj1IDxXvtZhIdGx+9/UtLmmMCKp4WbUydj9re5M4IAjFOCgJcLfdYJoh7QT7ygYHsuPvNYRi24KTjy93ZQXXHPbxQJpHldeJ8Ee1hAyXBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747491513; c=relaxed/simple;
	bh=LxEYc2pAjQx8x8cwygYNqZYnBKrdf5NUsjqGkCTuDp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RxsNrzSYWbbgDyCPa9GgMYEe55WF62GQiDIWfpxqAMtPnXSmNjLYMHnpFaXBoLlbH+VGl+d3ZkDBGTfDtCqQ1FpwwucqZ3tGKQSmVcyIrq1YOu6tTUwUNAmhIbPUs3sFTRUA1mLKNEGZOKJ5zb178IdKgFgb81HqGqkwqPT5OH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNdysJ6q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNdysJ6q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DEB4C4CEE3;
	Sat, 17 May 2025 14:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747491513;
	bh=LxEYc2pAjQx8x8cwygYNqZYnBKrdf5NUsjqGkCTuDp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GNdysJ6qQ0FTwkov1iCMUY92ST9UXn64g1zrLpTmf2yFYduDURdDGbfBnMUuzxTX+
	 eYtdmg5ggiSlSbmKQoockgqmoJ33g5BmdQJy1jYQ3b6MUztC48/4CgfZaofxyDL45w
	 H5T5I7dxd5nDu6ncznXhEnMnFxJzhDnhkvDcKHV5mtO83lkYrkYX/k7k8qc6x5ewgv
	 XsDQKFfXZu1X1u4TfMOAoFja5cJl5Crp3U+FyTWTFtkd2hGAIT+6NlI0Hx0LO/SoCw
	 ikBVNXyass9H3K8ag7xpl2LhEJ2lOmIqipcWxj/MOFVlExqG1PtccQKmUW1xggAmdb
	 SQYLuzsOGCiKw==
Date: Sat, 17 May 2025 15:18:28 +0100
From: Simon Horman <horms@kernel.org>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH net-next] net: enetc: fix the error handling in
 enetc4_pf_netdev_create()
Message-ID: <20250517141828.GN3339421@horms.kernel.org>
References: <20250516052734.3624191-1-wei.fang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516052734.3624191-1-wei.fang@nxp.com>

On Fri, May 16, 2025 at 01:27:34PM +0800, Wei Fang wrote:
> Fix the handling of err_wq_init and err_reg_netdev paths in
> enetc4_pf_netdev_create() function.
> 
> Fixes: 6c5bafba347b ("net: enetc: add MAC filtering for i.MX95 ENETC PF")
> Signed-off-by: Wei Fang <wei.fang@nxp.com>

Reviewed-by: Simon Horman <horms@kernel.org>

I note that this is a fox for a commit is present in net-next but not net.
Thus a Fixes tag + target of net-next is appropriate.
