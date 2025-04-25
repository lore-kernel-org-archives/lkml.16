Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4142C21C184;
	Fri, 25 Apr 2025 23:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745624197; cv=none; b=R+pEQPBr9MMQave0rY5/RPAYfXe5uv3EWr6N8QZlqdtSOhesXsYXgJ7/hdv8PtmBETQc0mqCD2p81Ih7f9ktzYBmEhj/CgQmcbI9uDvXlvjCZ2lg8+lstCrVH8WD3EqkTjbA6QzEH4qBI/ZmznE00jdrpglc5dsvWPttaY3LK9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745624197; c=relaxed/simple;
	bh=cqlwv2vPIA0AJYCC9J8uX3oIMqf20tDiQvD0X0XAzbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bt7+cqtS1Cv1gu1Dbnsad6tn7tQo7XixJp3Rbgi6hIFcdySVZyU6Gpq4KIOuXgvzLHdwyvZJgHlnXMxdKEfC2OC7zrEEDrIlDRlRIzKMuCYXPJre5gtt86WRc7G96aDzlW+Uzczydna6gKd9RvUcwKF8zWFF/feZ39+rCjvnMTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost.localdomain (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 4556C340BDE;
	Fri, 25 Apr 2025 23:36:30 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>
Cc: Alex Elder <elder@riscstar.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Jisheng Zhang <jszhang@kernel.org>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v9 0/3] riscv: spacemit: add gpio support for K1 SoC
Date: Sat, 26 Apr 2025 07:35:40 +0800
Message-ID: <174562390823.16593.8457766773146505593.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424-03-k1-gpio-v9-0-eaece8cc5a86@gentoo.org>
References: <20250424-03-k1-gpio-v9-0-eaece8cc5a86@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 24 Apr 2025 17:40:48 +0800, Yixun Lan wrote:
> The gpio controller of K1 support basic GPIO functions,
> which capable of enabling as input, output. It can also be used
> as GPIO interrupt which able to detect rising edge, falling edge,
> or both. There are four GPIO ports, each consisting of 32 pins and
> has indepedent register sets, while still sharing IRQ line and clocks.
> The GPIO controller request the two clock sources from APBC block.
> 
> [...]

Applied, thanks!

[2/3] riscv: dts: spacemit: add gpio support for K1 SoC
      https://github.com/spacemit-com/linux/commit/39efc98da7c60cad066a18049a98d41b8542f44a
[3/3] riscv: dts: spacemit: add gpio LED for system heartbeat
      https://github.com/spacemit-com/linux/commit/cb9c3aeae509b36afbdf46942a7a0a0dfc856ce7

Best regards,
-- 
Yixun Lan

