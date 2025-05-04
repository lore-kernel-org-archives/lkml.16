Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D5522A4F1;
	Sun,  4 May 2025 17:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746381237; cv=none; b=ndHHOjuPDcqKOs6iaGcnw1WcQV5A25boQdlPUxXS0LXCUVWSpb+fPccUq8D4ii9paY5KyrBuwBNbkSeVdRVzIjxR0Bm9b1qJx0HQ7p+mql3LnRf5oxbK5CKHgaW1J5XPd05Lw4+Ldi3p5NVeuyZGzG5O/b+CKqnTkFZfiTRwLLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746381237; c=relaxed/simple;
	bh=sAJdvzybvDQeWe/vbWsKDfvMHoi6pn2rQd77iaylkZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=duu+/q23FNUuM2RJji9lzzQ5QU5h2OpVTGTpF+aAVgxcVC1uocA+2Yzs+j4Y4n+96mokQpl4CIhDpPW5v4Lv8Xhl+X98DA2VvGTWSAN+vnJapqnQboScRxFjAs+m/sIgEa7aASqzNRRS+0hb5YOUMXp4i57UKOsCd4Yt5ytdiT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CEDRA32w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CEDRA32w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72FF6C4CEE7;
	Sun,  4 May 2025 17:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746381237;
	bh=sAJdvzybvDQeWe/vbWsKDfvMHoi6pn2rQd77iaylkZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CEDRA32w3VT5+A2QFdS5HNWIA1E7msrbeLSjmxRAccLwCtDkjsABj0K2d2eUF2NiD
	 zu3Wm+cFSZQgx87sTTxBnPDw7H+O7Z3EktLK6+HetdGpdgceZfTuMfv1AlUC/y9STm
	 Ci/mWS1XbORpTL9zVKntVU+9/P7KRN6LRJQGz9Ttp6zbw/T8lqJGxW8Ji7NUgJQ6f4
	 dH8gUrqtXMRnzIZCcjIhToXs0unTjQ1eFmNYB76NJ15HYFzHEeMn9zgbOz7u30lXKz
	 GdfPCl/0ycXKps4BXjkYT4bHb2bOFdRYTXyve+JUlNM5SdSllr3SwURGpRO86H9CZm
	 7nz9VhREkxIWA==
Date: Sun, 4 May 2025 19:53:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: John Clark <inindev@gmail.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, nicolas.frattaroli@collabora.com, detlev.casanova@collabora.com, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add luckfox prefix
Message-ID: <20250504-merry-unicorn-of-endeavor-ab9f10@kuoka>
References: <20250502205533.51744-1-inindev@gmail.com>
 <20250504102447.153551-1-inindev@gmail.com>
 <20250504102447.153551-2-inindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250504102447.153551-2-inindev@gmail.com>

On Sun, May 04, 2025 at 06:24:45AM GMT, John Clark wrote:
> Add vendor prefix for Shenzhen Luckfox Technology Co., Ltd., which
> produces development boards like the Luckfox Omni3576.
> 
> Signed-off-by: John Clark <inindev@gmail.com>
> ---

Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets.

>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

<form letter>
This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
</form letter>


Best regards,
Krzysztof

