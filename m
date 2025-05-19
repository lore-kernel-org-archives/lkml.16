Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA45B1A0B08;
	Mon, 19 May 2025 06:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747636687; cv=none; b=R78SsbXa+dpZs1Jq5QiUm+P4o/ZmLT75qO+OAcumFBzvj6Ms6874uqh0owJjhmcIqYhiQFtnLRcQf43xjVLfdBh2A0uHbpKr7caWqNLeJsjp1Szx2vbpPahRE+ZwFGtCUO3J1y1W538k78YYfBNcIjJvHdlJhM3azEhJEmmUm18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747636687; c=relaxed/simple;
	bh=/ZOxywsZ4v3YNF6ORc9uoDOFdtXzuxUv/2ZKjedS+Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hEYKQ4ry6jk2RgR9YJbBqIEm+5JR2XL1ThWeEtEZwcczsyUC3thTH6iAwE+j4iOSjU5fGkwhCrFadQc3mRiF5YtqtI3vAkXL8FvLiDjfjAo1Gs72oM5oyzNw7+YyEutylAinbqVk8AZcTwtQs8SoLhQarQre4UvwyVWjEsw9qoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WfArLU7z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WfArLU7z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC5B5C4CEE4;
	Mon, 19 May 2025 06:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747636686;
	bh=/ZOxywsZ4v3YNF6ORc9uoDOFdtXzuxUv/2ZKjedS+Q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WfArLU7zxx1J3isWA/Gktwk32k8He3ZrW20TsuoNsmL4KBcGRJUo0X2qWqnRikFTh
	 LiffrLuF3T96ypmtcVa1sB56OlPVlHUX5AiF+p7viT3mlD2aMyFZCM/Y2Rh45msu6g
	 GXU1bmOv0/K7+c8hRzUiNhazQVhIFELeeSM/BqunvRstAdmel6eTle2kKtQlQeIZqO
	 NtfTpr7Xc/vNEwDuz0z1i7GT6TS0ou3bgSPPWXz4X+p5fej5LboFUd2CemOc9G2RVW
	 PiycXInOO03bXG1qUijYYVbQG/05Vz12yB7eBnZJIVN8V1UWYEm1O2cxb9ez1OR3qW
	 8cJuKwl3cHVsw==
Date: Mon, 19 May 2025 08:38:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chiang Brian <chiang.brian@inventec.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: trivial: Add tps53685 support
Message-ID: <20250519-orthodox-ermine-of-support-bc945d@kuoka>
References: <20250515081449.1433772-1-chiang.brian@inventec.com>
 <20250515081449.1433772-2-chiang.brian@inventec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250515081449.1433772-2-chiang.brian@inventec.com>

On Thu, May 15, 2025 at 04:14:38PM GMT, Chiang Brian wrote:
> Add device type support for tps53685
> 
> Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
> ---
> 
> v2 -> v3:
> 	1. Fix the order of patches
> 	- Link to v2: https://lore.kernel.org/all/20250424132538.2004510-3-chiang.brian@inventec.corp-partner.google.com/

And the rest of my comment?

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

It's the last try from me:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

