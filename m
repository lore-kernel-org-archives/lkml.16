Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDC32DC768;
	Wed, 30 Apr 2025 00:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745974472; cv=none; b=kug5bCYKjLmPofjLUpgdt7qGI3KksO/Jt2BQv6QzV+ngDziR1vSL8l3/DxNtAoEE0Nz+xrofqasRbx5TiCaYR9BMsn0x8KudcWC0kwDnrmXnIC9P2YvetTzJenrD5yygZEbPqSb85sSm7kjSmKnMW0QJj/QEGvrTFPONxKreLMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745974472; c=relaxed/simple;
	bh=enao3FgooSyOsyIAsaIebLYwspArWySvzWiz0aGleOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+Kg4JWk13trUpBib0qMVWbpQayqo/MesrTaqcWmeITTKiVba6wRjCPaFa+/ntEKIAKloko6uGKd35OlFzlPVJjPnsydCDfPbEr9qznCm7oBhAnUZ7jjB+6AoLNYSuM/0OXNtiUvwTJfyqT3vO9S+lsIkygAf+h+LgSLkoJjt14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.147.253])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 974E3342F9C;
	Wed, 30 Apr 2025 00:54:29 +0000 (UTC)
Date: Wed, 30 Apr 2025 00:54:15 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Haylen Chu <heylenay@4d2.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v7 0/6] Add clock controller support for SpacemiT K1
Message-ID: <20250430005415-GYA187600@gentoo>
References: <20250412074423.38517-2-heylenay@4d2.org>
 <20250415004612-GYB29591@gentoo>
 <deb072638716e9978bd6381352cc721b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <deb072638716e9978bd6381352cc721b@kernel.org>

Hi Stephen,

On 13:49 Tue 29 Apr     , Stephen Boyd wrote:
> Quoting Yixun Lan (2025-04-14 17:46:12)
> > Hi Haylen Chu:
> >    I'm quite happy with this version, as all the issues are solved,
> > Thanks for working on this. I will give my RY and start to queue them.
> > 
> > Hi Stephen Boyd,
> >   My plan to send a PR for inclusion to the clk tree in the 6.16
> > merge window. But, let me know if there is still problem I overlooked.
> 
> You should send the code now. 
Ok, will do

> The merge window is when subsystem
> maintainers like me send code to Linus, not when SoC maintainers send
> code to subsystem maintainers. 
Sorry, I was not precise on this. the PR should target for v6.16 via clk tree

> Typically folks wait until around -rc5 or
> -rc6 to send it for the next merge window.
Thanks for the information, I was planning to send a PR to you (clk maintainer)
at v6.15-rc6 which should eventually merged into v6.16 ..

-- 
Yixun Lan (dlan)
