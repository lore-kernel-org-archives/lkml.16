Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939D11C84D3;
	Fri, 18 Apr 2025 23:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745019887; cv=none; b=DCFXgubEhIFJC4Ock6HYeci18aXsfQH3Xh8kojDjqtdOX/KBUX0piAY37YwSm7dSrjMh83JN4eI9/NpLSP5ZjeMbwDeibhYUDP4rJ52bbm8FQAzzeTzsS+vO1Xiu0taI0H0EZy0zY9v/vEdkgFLg2rDznsAGsPb2tg+jVoqXG3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745019887; c=relaxed/simple;
	bh=XFDIYIQjHzy9o4L7SDPJIzPd5miWJdDMZWzI/U5nZjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZVJCh2+kw9HqFRMEu96XjE0K1lwlN5SpvB/LzX6AlPsaCa0e2dQ2ug90wH6BBKFNOuKW+F1ltJFylwvR0N1O/208fz9KZNEFtJ7HkuwfZyu5BcHOe0OoAdPFcJVzWRtw45pii5EEajDoaiReTWc1h7VH2BURP90ctTjmQ4PO2Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost.localdomain (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 632B234301B;
	Fri, 18 Apr 2025 23:44:38 +0000 (UTC)
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
Date: Sat, 19 Apr 2025 07:44:24 +0800
Message-ID: <174484367987.156293.8818431955085592220.b4-ty@gentoo.org>
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

[5/6] riscv: dts: spacemit: Add clock tree for SpacemiT K1
      https://github.com/spacemit-com/linux/commit/279d51ad9f6dc0c667f6f141a669b2c921277d1a

Best regards,
-- 
Yixun Lan

