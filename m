Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BB815E96;
	Fri,  9 May 2025 13:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796238; cv=none; b=ueUFrXSWlB7WGvEwIMxc8NreptkuLbFJg5V4FW+buv+u4ZFkJoPX58ayaDDBiTq6utr/vTZjkPUTgLrsqa/eu+z85Q0k6qqiH7FbqDHxuB+TR/hsrlmhZ9rMF9lPlwtAfPlsm2ZHHRSSJHuibbaCnOQKzwoGxBiSj6xoh2GeEXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796238; c=relaxed/simple;
	bh=+Im8v0nLTAPq++xLUEB0H2J/YIEV1PCEf1tLoeEK7bE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gCDBcFLIs9ibruFME+j/M7DqQFfwE8W1vUvta/shNdxL7YsMjmOITQAoyVTa7gTmPMDeMeHzrmKvGoAn7hl35DvBZ2qu+19YnVmY4arKN5VaCeYh2xM+KWaxX5vGACR1OKiyIoLSC/d/N/wVjnh8FMvk2tLKW9Apmk+Pd7kotig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost.localdomain (unknown [116.232.147.96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id A075C342FB2;
	Fri, 09 May 2025 13:10:26 +0000 (UTC)
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
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v9] riscv: dts: spacemit: Add clock tree for SpacemiT K1
Date: Fri,  9 May 2025 21:10:08 +0800
Message-ID: <174679618903.112900.10080419497278985987.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250508111528.10508-2-heylenay@4d2.org>
References: <20250508111528.10508-2-heylenay@4d2.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 08 May 2025 11:15:29 +0000, Haylen Chu wrote:
> Describe the PLL and system controllers that're capable of generating
> clock signals in the devicetree.
> 
> 

Applied, thanks!

[1/1] riscv: dts: spacemit: Add clock tree for SpacemiT K1
      https://github.com/spacemit-com/linux/commit/4dc6429d29436d99ef5ac07bbe6f305e00516acb

Best regards,
-- 
Yixun Lan

