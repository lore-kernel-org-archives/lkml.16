Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A952AEED;
	Fri, 18 Apr 2025 00:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744935765; cv=none; b=T9qRnFjmQ7ZDWtCKUTL2res65VkYv45b/k4um1fYxcxIuTW3fBMJPCQoqfWbJ2eJAByEMCdeubVzlByDR5ao9wTy0aAkYrvvAPNOBzJBSWa3qmywyorxPLgY1ehW27UDSsvqqXXxbjFg2mFcyMNsXJOoaec6ZdnF8ArT5J36FHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744935765; c=relaxed/simple;
	bh=eCJzhCM/N9tfeIoXxAgMxE9th3g84gBE4CoN6UFnlco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lQURFE4gYkB2g9bbOV+L76jKILiY0VqMDImPA8OS9Ot09nW/0xN6KVbJKqhffqrx2UaZqFqmV0AKGP5S0aVZ6GFVxN57NKrecaqX7pcpdvdEX5ICpUadwaQoBY/UFH+74z7GSF+4nn25zGt6d0CSS6NpA+w8JcrP5pm6ss2odTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost.localdomain (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 624F7342FE7;
	Fri, 18 Apr 2025 00:22:37 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Haylen Chu <heylenay@4d2.org>
Cc: Yixun Lan <dlan@gentoo.org>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: (subset) [PATCH v8 0/6] Add clock controller support for SpacemiT K1
Date: Fri, 18 Apr 2025 08:22:03 +0800
Message-ID: <174484549885.160158.3249067849153986093.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416135406.16284-1-heylenay@4d2.org>
References: <20250416135406.16284-1-heylenay@4d2.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 16 Apr 2025 13:54:00 +0000, Haylen Chu wrote:
> The clock tree of SpacemiT K1 is managed by several independent
> multifunction devices, some of them are
> 
> - Application Power Manage Unit, APMU
> - Main Power Manage Unit, MPMU
> - APB Bus Clock Unit, APBC
> - APB Spare, APBS
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: soc: spacemit: Add spacemit,k1-syscon
      https://github.com/spacemit-com/linux/commit/61e312a001a394a93998c353af859841ddf50d5d
[2/6] dt-bindings: clock: spacemit: Add spacemit,k1-pll
      https://github.com/spacemit-com/linux/commit/8090804045066ab8cd92737c8e2adfb46f166c0f
[3/6] clk: spacemit: Add clock support for SpacemiT K1 SoC
      https://github.com/spacemit-com/linux/commit/1b72c59db0add8e47fa116b21f78ed0b09a264f3
[4/6] clk: spacemit: k1: Add TWSI8 bus and function clocks
      https://github.com/spacemit-com/linux/commit/49625c6e4d90a9221127c49a11eb8c95732bb690

Best regards,
-- 
Yixun Lan

