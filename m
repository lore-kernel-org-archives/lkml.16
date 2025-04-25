Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6C12F4A;
	Fri, 25 Apr 2025 00:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745539461; cv=none; b=dLgfqxswFoEsvYWiZ1fpBc3jIHq/9C8OMapr3CkMsmXyR0/sv2LfuToJm4PxS6UhTjLzhwtJANu28G1o+vbtwWcQuWOHgT7QC6zXVP7sPt0TDBVq3sjAMGFA6PRygECwAutIgn97gF5DnKiCLPQqlcpE5le5jTnSPNpHAABxJyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745539461; c=relaxed/simple;
	bh=yL08VFLSYPbcVaWmbvsr8GwxFwVmu3ru/80RoCesrt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=biDje0P5GjTuB38Ar0TtI8OSdMpaBTBYUVzIcfTe/XQYAJhEG5lHBdxIzyIS7MCM4D329CFB+1cBZ0Ci8UXn0KZOepd0T5bfZNf3wnvE61vsHsKkAM0FnDjQ1nHzZO2LEsYqV4Xajc2da6AXW3DUwUpJqvP+tNxq6uTcZCn2KTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 6E804340C43;
	Fri, 25 Apr 2025 00:04:17 +0000 (UTC)
Date: Fri, 25 Apr 2025 00:04:06 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@riscstar.com>,
	Yangyu Chen <cyy@cyyself.name>, Jisheng Zhang <jszhang@kernel.org>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v9 1/3] riscv: defconfig: spacemit: enable gpio support
 for K1 SoC
Message-ID: <20250425000406-GYA49092@gentoo>
References: <20250424-03-k1-gpio-v9-0-eaece8cc5a86@gentoo.org>
 <20250424-03-k1-gpio-v9-1-eaece8cc5a86@gentoo.org>
 <20250424-untried-refueling-50c5902d63c9@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-untried-refueling-50c5902d63c9@spud>

Hi Conor,

On 16:22 Thu 24 Apr     , Conor Dooley wrote:
> On Thu, Apr 24, 2025 at 05:40:49PM +0800, Yixun Lan wrote:
> > Enable GPIO support, in order to activate follow-up GPIO LED,
> > and ethernet reset pin.
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> 
> Do you want me to grab this patch, or do you have a defconfig branch to
> put it on?
> 
Yes, I'd appreciate if you willing to pick it, to avoid potential conflicts?
(I currently do not maintain defconfig branch)

BTW, we might have few more in this cycle, e.g. - clock, reset

Thanks

-- 
Yixun Lan (dlan)
