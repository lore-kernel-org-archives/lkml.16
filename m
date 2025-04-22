Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43503201270;
	Tue, 22 Apr 2025 12:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745326130; cv=none; b=UgbwBVZzMz/VAQgO+jiJh9PWCVA5w7/QFIYIzqnjXl+/ukwdkevh1YazJpgKYTdUPwqUPUM8ZYE12oYeDe3f1GYyc+s7G4TPoPruIMovIhodK8flNRyN6anar/tigo5HFlX9P6jc58baTj7FK8DB9v6zeFTHYTqS3Sa0qKr3+XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745326130; c=relaxed/simple;
	bh=nSsbTeQ11E29J9U1O4ryQDc9jrH21JK1FMat4xVrpwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qLvDDeKbZvIZuO4WmWeonudb6Cjq8hwDGzcJmb6WaPZsDDylcCWxX1BT/4KNNNMHgWiiqtDGHU+7hUDERpSK7C9wOrmbXygr9/TuZV7BDOi8qxeoWFNGGyTfd61M9yDVzOb6J7eEHgLPCbOy7YewVswszIyvhOZzlht242s20xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hR0AFZ7X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hR0AFZ7X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F6EC4CEE9;
	Tue, 22 Apr 2025 12:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745326129;
	bh=nSsbTeQ11E29J9U1O4ryQDc9jrH21JK1FMat4xVrpwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hR0AFZ7XFiAEF1HIYzWylncFkRsshrqdEcOBA5rOyyLyISww13uG+7YTJS6xIrlCw
	 aDnTqbhsZFQus2olgrPAe4JQaYHTskpTtyYPM61dcH+wIQ6hIaEo0m5UB0278apAKE
	 SOdqM8R5+Wngow9aSLKkDNjbtok1hw9+yupJQMaydjn3ks/G9rxCSHr/5L8XH/zeya
	 1f+Uv/EEuDPNAbMnjDQrDO4stYNZ84HMwBcpqw17Av+aJ77A7qVtuUpeeNTV1hVqRX
	 dL9+TFAkZC+jKiZmUTIFm9Oay3BEnGd30I5HPWcPU98hzCj3DYboHCHxAGEeX/GejN
	 kRV3qrBl+W58Q==
Date: Tue, 22 Apr 2025 07:48:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liya Huang <1425075683@qq.com>
Cc: linux-kernel@vger.kernel.org, Saravana Kannan <saravanak@google.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] of: Build warn for missing fn() in _OF_DECLARE
Message-ID: <174532612584.951202.6817146163427433712.robh@kernel.org>
References: <tencent_BA80A2305727877DEE7BE20655D9CA825B09@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_BA80A2305727877DEE7BE20655D9CA825B09@qq.com>


On Thu, 17 Apr 2025 21:23:38 +0800, Liya Huang wrote:
> The function pointer fn() in _OF_DECLARE macro might be NULL. For example,
> in __reserved_mem_init_node(), only non-NULL cases are handled, and NULL
> function pointers are ignored.
> 
> This patch introduces a check to handle cases where fn() is NULL. If fn()
> is found to be NULL, a warning is issued during compilation to notify
> developers about the missing function pointer.
> 
> ---
> The function pointer fn() in _OF_DECLARE macro might be NULL. For example,
> in __reserved_mem_init_node(), only non-NULL cases are handled, and NULL
> function pointers are ignored.
> 
> This patch introduces a check to handle cases where fn() is NULL. If fn()
> is found to be NULL, a warning is issued during compilation to notify
> developers about the missing function pointer.
> 
> Link: https://lore.kernel.org/all/CAL_JsqK733Q9bbxC0Wz5uxyZ9m7bs+bci5kUJF9GJMv73-dO4w@mail.gmail.com/
> 
> Signed-off-by: Liya Huang <1425075683@qq.com>
> ---
>  include/linux/of.h | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!

