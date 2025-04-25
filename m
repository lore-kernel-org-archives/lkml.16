Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782B413B7A3;
	Fri, 25 Apr 2025 23:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745624185; cv=none; b=qEAAuj9SElUXHtcCGHfrLBTHXJr8+ZD6umyZQ7mTUaizJOFkUuel54kiH7EC7Zb/XCq9jdd7mFCNVzaWUh+0GhksiCtOySR9RG/Um+GOUxe4uAfsq55BkP35SqlEi9mMLzUVfymEwQnYUEI0DXiB04jfY7bXmgyU8DJFxcZmMvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745624185; c=relaxed/simple;
	bh=uC+uqb7UlcVkB/i0xfNXC9o3FUOJRPHTBlXaQvLUIu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZGvgqoHBlqgBuHs1ELy1VkNYLHLRf27Nhbx3P9Hs7E7um+tZW7DLaC66yoFjQsdU8FnaWWBOSBPw1D6lT74PVDw4aKbu2+9p95CJmSHxDrF2YIs9nRk9YFVtMHmXa+VwwhyFWiTwQv7uspnpDWPpqRgG9i5t4JtlbwpO7i5UD70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost.localdomain (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id BFFE6340A12;
	Fri, 25 Apr 2025 23:36:19 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: Alex Elder <elder@riscstar.com>,
	Haylen Chu <heylenay@4d2.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] riscv: dts: spacemit: Add clocks to pinctrl and UART
Date: Sat, 26 Apr 2025 07:35:39 +0800
Message-ID: <174562390817.16593.734541789172552483.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424-05-dts-clock-v2-0-17d83a705c4c@gentoo.org>
References: <20250424-05-dts-clock-v2-0-17d83a705c4c@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 24 Apr 2025 15:48:07 +0800, Yixun Lan wrote:
> Populate clock property for pinctrl and UART controller.
> 
> The pinctrl's clock dt-binding patch is still waiting to be merged[1].
> 
> The UART's dt-binding and driver code has already been accepted[2],
> so we now are only sending the DT part patch.
> 
> [...]

Applied, thanks!

[1/2] riscv: dts: spacemit: Acquire clocks for pinctrl
      https://github.com/spacemit-com/linux/commit/1fa2b7dd8e3efb7b50a24d13f91dc04b25adc43d
[2/2] riscv: dts: spacemit: Acquire clocks for UART
      https://github.com/spacemit-com/linux/commit/fe066af241681269d809ece2ad663f334a0d8120

Best regards,
-- 
Yixun Lan

