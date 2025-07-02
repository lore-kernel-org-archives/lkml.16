Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDE325486A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 23:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751497847; cv=none; b=OtnU6YKgz3KVUUvudUr1Urz6RWwWQQbCBqQCRbgYp4KVzo6AOP/YU/ySVHtRvoZTGCghAxa50X5JlnUG3d6nErZ1pK/a+TcYoqjxt5ItBOLh0H5yiIxmWK3GMQnP2tQQIPFLKBFmr0XsD0sybsmMRAte/LcZHsxIYjpMgVYOlBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751497847; c=relaxed/simple;
	bh=ES6R/dc09ENGTbzh9aT7c4A7hNPzFe3ijPzR6uwDoWs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=o2Zhmu3MZBP/vGXSi5EXEWCTW/FxTV1Gdai+vHBv8sRosslhOBFfn6948raOLNw4/TSuh9DmTZi062CrjVOG9Hd0a/l/Ef4f8bHE9At5M9yA0Xjw5FWFqYa6QucLtcWyG3vSYvkfuULI3dW+j73/nrM2pxyywrdafvI04eGIxX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=pnwV2zni; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="pnwV2zni"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5E862406FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751497845; bh=ZSNY2Ai/WC/OiXjZSwBAqbYGoY4FqQQ8vMsXVptJa4k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pnwV2zniILlzzgWS3FxrHaFenDzx6D7VYwLtb2yIyfQ2iR9hGXYYHMh5PVV8E1Gi4
	 wbXtQrYbofP5I4ttSZVbyfDFG/hIeNwzzoVKl2PuP6l9R3MEFXfBnUv+jyX+zZcz8x
	 qFd70QKUzCmqF0cNLcT3SvivbQ3q1pR7yRCIYFir3LxHre18JbaHfnDl3TEshxRBwt
	 4hf2EuBcDqak4zl89YA78Basp96DmQg+0Ye/XX50WfQJQ4VIwXz7UIKiE7UotoJ6KS
	 GQvfPtckQCqzbJxvBUskN43uLh3IIw1H8wAuEsdEPefUpc1oJSkR2XTQ4TMXkSo+X3
	 vrmJoSkEiXxcQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5E862406FC;
	Wed,  2 Jul 2025 23:10:45 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: WangYuli <wangyuli@uniontech.com>, masahiroy@kernel.org,
 ojeda@kernel.org, nathan@kernel.org, alan.maguire@oracle.com,
 laurent.pinchart@ideasonboard.com, kris.van.hees@oracle.com,
 linux@weissschuh.net, tamird@gmail.com, vegard.nossum@oracle.com,
 ardb@kernel.org, mchehab+huawei@kernel.org, lizhijian@fujitsu.com
Cc: linux-kernel@vger.kernel.org, zhanjun@uniontech.com,
 niecheng1@uniontech.com, guanwentao@uniontech.com, WangYuli
 <wangyuli@uniontech.com>
Subject: Re: [PATCH] gitignore: allow .pylintrc to be tracked
In-Reply-To: <1A357750FF71847E+20250623071933.311947-1-wangyuli@uniontech.com>
References: <1A357750FF71847E+20250623071933.311947-1-wangyuli@uniontech.com>
Date: Wed, 02 Jul 2025 17:10:44 -0600
Message-ID: <87pleimbnv.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

WangYuli <wangyuli@uniontech.com> writes:

> The .pylintrc file was introduced by commit 02df8e3b333c ("docs: add a
> .pylintrc file with sys path for docs scripts") to provide Python path
> configuration for documentation scripts. However, the generic ".*" rule
> in .gitignore causes this tracked file to be ignored, leading to warnings
> during kernel builds.
>
> Add !.pylintrc to the exception list to explicitly allow this
> configuration file to be tracked by git, consistent with other
> development tool configuration files like .clang-format and .rustfmt.toml.
>
> This resolves the build warning:
>   .pylintrc: warning: ignored by one of the .gitignore files
>
> Fixes: 02df8e3b333c ("docs: add a .pylintrc file with sys path for docs scripts")
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>  .gitignore | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

jon
