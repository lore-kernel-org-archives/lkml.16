Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73851E9B3D;
	Wed,  2 Jul 2025 21:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751490879; cv=none; b=cKsHiVN+ccavdc+X/wxS39JfdrH2lbmcxP2oX9R2T8141CucRDg4KFY8eiJiWQt1B5uhpoJHgiwfDjJ2sZJDxF/MVzeZULqjW2pXHZKylaiZ0KtXu+ER/fWni6DxSgYMohybHEW8fGARg1HTpIVoODjY1ZiiBTvzat1J9z17nGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751490879; c=relaxed/simple;
	bh=IRreGz5DKr52FblTxRK/rFgWXfFqeBVNLQ73T/BEENc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=adLk5RP0pSWJh7XdQUXyAMImzrPQZdU18tkBBiQMkSYdeNBQkchA1UxsXHMDOMQHRGhY1oQ/Nlg6zyRHBDIzvsut6OaVEKSVq0XFKjM0vPLUU/2s27CHT2vUiKU0JpTCWMu1Okb7RshY2BHOtFI6YTNpc8bbG5fIUidQdu5qHjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BWXCyB/d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BWXCyB/d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1042C4CEE7;
	Wed,  2 Jul 2025 21:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751490879;
	bh=IRreGz5DKr52FblTxRK/rFgWXfFqeBVNLQ73T/BEENc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BWXCyB/dH4bnI6cFLqHIapEJ6FxIaN/X75SdNdNLbl4umCK+ViQH8MbQt9YPFDy8+
	 eAsu5lUy6Pvyg8On0qJgNJdKWnFFzBd04DaPhxRbxg3zWr2jZTyXjlobglpNRPTj6Q
	 Zm4xolPOkOAlR6svjVp8jgT+alkkoImMdKS7rh561cQP5s7PfiknYnSygIkuOOfGP/
	 nrHtCEVlw8xPOtKOwsv9eJomOgqY16d5eJ7GAuQoppG/nbzKwNJABEgou8Q/Arg2G8
	 dTQSmlpSAWRQp5sIL6wpXNPTnyh+ZoITkk8SJVvjRhdHI6VyIU8PVMKdw58xh0YsTY
	 o2P7IM8tYDQow==
Date: Wed, 2 Jul 2025 14:14:37 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: zhangjianrong <zhangjianrong5@huawei.com>
Cc: <michael.jamet@intel.com>, <mika.westerberg@linux.intel.com>,
 <YehezkelShB@gmail.com>, <andrew+netdev@lunn.ch>, <davem@davemloft.net>,
 <edumazet@google.com>, <pabeni@redhat.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <guhengsheng@hisilicon.com>,
 <caiyadong@huawei.com>, <xuetao09@huawei.com>, <lixinghang1@huawei.com>
Subject: Re: [PATCH v2] net: thunderbolt: Fix the parameter passing of
 tb_xdomain_enable_paths()/tb_xdomain_disable_paths()
Message-ID: <20250702141437.5d4cb9bd@kernel.org>
In-Reply-To: <20250628094920.656658-1-zhangjianrong5@huawei.com>
References: <20250628094920.656658-1-zhangjianrong5@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 28 Jun 2025 17:49:20 +0800 zhangjianrong wrote:
> According to the description of tb_xdomain_enable_paths(), the third
> parameter represents the transmit ring and the fifth parameter represents
> the receive ring. tb_xdomain_disable_paths() is the same case.
> 
> Fixes: ff7cd07f3064 ("net: thunderbolt: Enable DMA paths only after rings are enabled")
> Signed-off-by: zhangjianrong <zhangjianrong5@huawei.com>

I'll add Mika's review tag manually, in the future please add the tags
you received before reposting.
