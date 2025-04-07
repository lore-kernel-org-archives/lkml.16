Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88661C7004;
	Mon,  7 Apr 2025 14:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744035557; cv=none; b=oxLxJrUidGnRETQ6orQV8nSG3bmishRajrMVjxBwxwpctaQiQgyLFlAcDueUOut9UainyxJ+jbqKE2ZWzuyaFLBfjoHQcoDijfDbNCWVBUWskaPtX7Rbg8/thJBCi5pL4gMjFKtAashK81bxlMSzsRNA0Sc7d8axpQxl4XX8mEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744035557; c=relaxed/simple;
	bh=GjGaoAAE9MKbGwuqWCzyfmhuFwEKdCeeIbdKCd9ibFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oGLXxfmX/lmv1w6Xb6oUhP2xjAUGmFwiCYZbRMR5W76DJqVk+tgDuGifqp5bIz3C111IyLmsu+nE75JA+aXKHw4buY8Kr9n6zzOAK0fOvsYePvkKKKJkf4lNrMffpjnUA2H9QlzhEQG6rB7R3u4tcuaNJ78NZamDBu215G9FWto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b+f1yaJ+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b+f1yaJ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22F14C4CEEC;
	Mon,  7 Apr 2025 14:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744035557;
	bh=GjGaoAAE9MKbGwuqWCzyfmhuFwEKdCeeIbdKCd9ibFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b+f1yaJ+ILi+Gv1CUx81xTjEJCIdg58gl4Q11D6u0Bro/5+2ufums6D6TJc3vMGGU
	 QPEvh6yz7Ks/PQxZyKeWD7cIk6m0OnabmzLwCAr9UkTCInEM3T9pXwy/2tr1DZCRHZ
	 ZlN90fBYh0ZDZjEKHPgnNkf3BAx3RP4m9mvuXryCXvnwquJebXpqZDxicgEG2ZBK5e
	 uxb2Fi/Uw4DwXcewGnzxm4Y0JZwaGWNVhJnIlj7bdC0x+nLxuSFjhUGl418K5c3bGM
	 nyBaWNN61q+Y99DGJEb+jgKoAasOhDw6geTW7Wby5AyTNvwzsNAZN9I34uWBQ/msDB
	 bvW3KiGeykEAQ==
Date: Mon, 7 Apr 2025 09:19:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: linux-riscv@lists.infradead.org, krzk+dt@kernel.org,
	devicetree@vger.kernel.org, tim609@andestech.com,
	palmer@dabbelt.com, paul.walmsley@sifive.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-kernel@vger.kernel.org, tglx@linutronix.de,
	aou@eecs.berkeley.edu, daniel.lezcano@linaro.org,
	conor+dt@kernel.org, alex@ghiti.fr
Subject: Re: [PATCH 6/9] dt-bindings: cache: ax45mp-cache: allow variable
 cache-sets for Andes L2 cache
Message-ID: <174403555555.2295519.2830969748366451702.robh@kernel.org>
References: <20250407104937.315783-1-ben717@andestech.com>
 <20250407104937.315783-7-ben717@andestech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407104937.315783-7-ben717@andestech.com>


On Mon, 07 Apr 2025 18:49:34 +0800, Ben Zong-You Xie wrote:
> The current device tree binding for the Andes AX45MP L2 cache enforces
> a fixed number of cache-sets (1024). However, there are 2048 cache-sets in
> the QiLai SoC. This change allows both 1024 and 2048 as valid values for
> "cache-sets".
> 
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> ---
>  .../devicetree/bindings/cache/andestech,ax45mp-cache.yaml       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

