Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66A11CF5E2;
	Mon,  7 Apr 2025 14:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744035248; cv=none; b=fDWAWlEw9KLabbyJNlpzGfocpVMne62XrJMNfURx3Sd3KhoWVbcbN4HOZC5l0CyTI7mHfBFzI5he8PD+fTxEt0smMjdWpnEtTgPXoModvNqi5Y27M7QVH8wkMsptArGxqKsMp8+LJ85QPEWmHK9Dd5m32qCGz+9meCmWYtBmUTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744035248; c=relaxed/simple;
	bh=eE3M8z7vIEzEzXYZWugQbudz1ajq2YdJpDuNX1B+lQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hkzbdpwn4XfStQb9RQn/lFjqhgv5R7kc/hfRTAmgppb7MiAFlQlDRfLQOJDbx4p3PBdTxHuoHtzgfHmiK/mcA4vXpcrveElrLyU6b3Re1SkKrCVkE1/ig625vC9ykmGryUjBDsdnnp6emQ0seemvlXTivtCil0A3qG3H2gLZtHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GHYom3BS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GHYom3BS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BDABC4CEDD;
	Mon,  7 Apr 2025 14:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744035248;
	bh=eE3M8z7vIEzEzXYZWugQbudz1ajq2YdJpDuNX1B+lQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GHYom3BSDj1J5/Cj56P29FDzbB/dIJRMbX7QMPZ3vhcXj9PIbNFTahQ84BBwJD6nF
	 hsiT7tbV0eJsILYj5dUq3Zc3+1vICgZFGQbtovQYozzofsFXptcNIfkwxpaVWw2SDI
	 pUQ1eCXOJHul2F7i2GfdqK7YrUAKM777EntgEZtQv4c+FU5NSYLRwD1uvhuONOYoj2
	 Sp9mO4zS8hyNf5OkUGsWf3uS2x8x8r0JwEIHDyaTTzYMT63eQbT9XeO9kGKPosBkmp
	 g4PyCNXKdAwbKnmSVrevNVXdE1my7WBiAOq4X/NRYAUshIFiNUieNnuxwgi00iu0nJ
	 qBFj8f82Gg4Jg==
Date: Mon, 7 Apr 2025 09:14:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: palmer@dabbelt.com, alex@ghiti.fr, conor+dt@kernel.org,
	linux-riscv@lists.infradead.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, paul.walmsley@sifive.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	aou@eecs.berkeley.edu, krzk+dt@kernel.org, tim609@andestech.com,
	tglx@linutronix.de, daniel.lezcano@linaro.org
Subject: Re: [PATCH 3/9] dt-bindings: interrupt-controller: add Andes QiLai
 PLIC
Message-ID: <174403524699.2250131.15335040346348626283.robh@kernel.org>
References: <20250407104937.315783-1-ben717@andestech.com>
 <20250407104937.315783-4-ben717@andestech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407104937.315783-4-ben717@andestech.com>


On Mon, 07 Apr 2025 18:49:31 +0800, Ben Zong-You Xie wrote:
> Add a new compatible string for Andes QiLai PLIC.
> 
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

