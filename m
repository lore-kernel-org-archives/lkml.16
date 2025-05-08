Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81B521B9FF;
	Thu,  8 May 2025 06:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746687078; cv=none; b=kSiuuPUGkTEIWOXCJLgTaL6dvnsTkmofUIYUiL3IMDzX/YckQzYB+i1NKwP+uzEmGidNK6C3+BbWCLUUAxJJ7HrtT5DLOwvgBIifdFENqOpSODIL79ZGevOFGCIDSOssShycneCucSMCpeM0Sqe8w+HHxiteTUkmKagBtYUfVcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746687078; c=relaxed/simple;
	bh=6fnJ9jGwlkD8+oSN+9SAHKBF+vAgVZ3vIthZt+o0e9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l6BL8wEEVHD3kl19R+/9xeYDoJVY2IwVeOeA5U42eapTDl/bgzPf9NiS6Vu3mQKvQAHRBsYJITke281uXcM58BrG4/9vljvd+BetvVvkEvsenHEm7oSrMOEdMpgP1MhOvSEXgTZHk4nBJwFzxLerBNiuqLj9PbfIbREZ9rIumGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SaIZcmSg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SaIZcmSg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9794CC4CEEB;
	Thu,  8 May 2025 06:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746687078;
	bh=6fnJ9jGwlkD8+oSN+9SAHKBF+vAgVZ3vIthZt+o0e9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SaIZcmSgUv2/V++rgg4TvDOa2n+fWexIMQaOqzTaj5YRRI2WNI3T+W5T85q9E/TZF
	 dq+pHz/VAieDDGbh/iW9QtBdJfL0X9CQ6NKpRi4VpC0oiRUfYsSCALbH0ZQHN/pdEo
	 /N+bBMNVDplf/U44JgXUPqVvHkTANPTLmUNwHOryimqLWCOhVhx/ZHsxvP8LlQWecT
	 glPWIhjZX96UnCAVIQDp4Fzk7tvUW5r8pGH7HHTrHbv6TNFttBwLptuPAJUD3Mjpou
	 oNSUdaKe8fKlRjuxiDqAlCYZ9MyM10H6qyaAPjmTO7LMiA9Q9VZbQzcebfrsKjfzR+
	 m0N7N9RNhYz4A==
Date: Thu, 8 May 2025 08:51:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan Brattlof <bb@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: arm: ti: Add binding for AM62L SoCs
Message-ID: <20250508-splendid-rapid-sawfish-f1ee18@kuoka>
References: <20250507-am62lx-v5-0-4b57ea878e62@ti.com>
 <20250507-am62lx-v5-1-4b57ea878e62@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250507-am62lx-v5-1-4b57ea878e62@ti.com>

On Wed, May 07, 2025 at 10:09:19PM GMT, Bryan Brattlof wrote:
> Add the binding for TI's AM62L family of devices.
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
> Changes in v1:
>  - separated out devicetree bindings
> ---

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

Best regards,
Krzysztof

