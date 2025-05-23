Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE0321FF38;
	Fri, 23 May 2025 07:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747985018; cv=none; b=fffdcZYk59WYUo6KPwLOq2KAg7jnOp3Ka32jYSg8Qn3+e2n7Moud4X3XGdAEDOzsHhVfqKfXIcf9Cs/YgAj8l6LvzBV1r5ZaFtPm9Ht+sdtEUAX0hfyaZjwobZunJ8IN4un3rA1Ega9kq49NVIldN5au8DtDMp0jh6I6ps/4L6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747985018; c=relaxed/simple;
	bh=rPHLYxhMuZscmG9fkU/oauuCF9sRPqCz/viJ2hKxSwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NU4JfiNlBswykyEpZ2CavlR7T/RSZGctpI3sqznz/FmSYwKiI670TmeDkl9DtByLvmP1oBetUp4CKO05W2uRLH/DIKgUzBdrEtAadeSuJe33Da5UNSTxIjUEa29jZZPOZmaK2tCPkxUNABjFyFxd/BE3fXmYqshUAD9OO8xFDv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A93E1C4CEED;
	Fri, 23 May 2025 07:23:37 +0000 (UTC)
Date: Fri, 23 May 2025 09:23:35 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Hsun Lai <i@chainsx.cn>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	heiko@sntech.de, andrew@lunn.ch, inindev@gmail.com, quentin.schulz@cherry.de, 
	jonas@kwiboo.se, sfr@canb.auug.org.au, nicolas.frattaroli@collabora.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: vendor-prefixes: Add SakuraPi prefix
Message-ID: <20250523-loyal-bird-of-persistence-c136a5@kuoka>
References: <20250521131108.5710-1-i@chainsx.cn>
 <20250521131108.5710-2-i@chainsx.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250521131108.5710-2-i@chainsx.cn>

On Wed, May 21, 2025 at 09:11:06PM GMT, Hsun Lai wrote:
> Add vendor prefix for SakuraPi.org, which produces
> development boards like the SakuraPi-RK3308B.
> 
> Link: https://docs.sakurapi.org
> 
> Signed-off-by: Hsun Lai <i@chainsx.cn>
> 
> ---
> 
> Changes in v4:
> - Fix vendor prefixes error (Krzysztof Kozlowski v2)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

