Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1956586338;
	Sat, 14 Jun 2025 17:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749921273; cv=none; b=myy1XcQhvhTf8Hew+z6e3HLFehCDFMS+Mqgh0uWCHPDh+L1adoOyXu0XLHDSFo9g3kIlKEjDgQxYuZZ5thCejnmfImJCOjICFBif47KaKMu7JWfnLOoj/6bel/9jJ65ZU2/oBgkNLg5MU2ZfS4GOyH8uf6KN5xwoMAJKS6Py6gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749921273; c=relaxed/simple;
	bh=l5EHxSIxi7NTnazzC0L1Igk1gz4xMxFq1CE3F4jqqTI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AsBc/4TrYrvOqgE6i5IUzHym8bXlO5BFVGOCUfeN07B4W2PW3Dp4CRbhTieF5bb6ox1LHbPZIQdvgZ6nN4N2HifzAFmjP/pRl2he+lyU431ouU+ElFQdhl3PP5Xw2t9L06MvTnEUYaDvZTKudlVMWYEUEndSpJxk38K8ao6VgaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79EEFC4CEEB;
	Sat, 14 Jun 2025 17:14:31 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id AE39F5F755;
	Sun, 15 Jun 2025 01:14:28 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20250607135029.2085140-1-wens@kernel.org>
References: <20250607135029.2085140-1-wens@kernel.org>
Subject: Re: [PATCH] clk: sunxi-ng: a523: Mark MBUS clock as critical
Message-Id: <174992126867.1032609.10087338535850688863.b4-ty@csie.org>
Date: Sun, 15 Jun 2025 01:14:28 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Sat, 07 Jun 2025 21:50:29 +0800, Chen-Yu Tsai wrote:
> The MBUS serves as the main data bus for various DMA masters in the
> system. If its clock is not enabled, the DMA operations will stall,
> leading to the peripherals stalling or timing out. This has been
> observed as USB or MMC hosts timing out waiting for transactions
> when the clock is automatically disabled by the CCF due to it not
> being used.
> 
> [...]

Applied to sunxi/clk-fixes-for-6.16 in local tree, thanks!

[1/1] clk: sunxi-ng: a523: Mark MBUS clock as critical
      commit: 713d48878e8a5e4bcca6355324f943eb72cd2c84

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

