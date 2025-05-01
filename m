Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5196221CA1E;
	Thu,  1 May 2025 12:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746101667; cv=none; b=LsQ2WmzikZyGKnUVEVeaV3EWyDo751QCN0LRypGyTyQtnEjwAGRrom2zzJk6JE450uIxOAdU52keHwM9LZRVmzg/jUIMQrynmpfNvWAdrvdwn0aT07zfgkPD4W0tL8SGFGSygET6og5GzbbSUGX3q9OQwzdVgUq3Vc2akLUtyf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746101667; c=relaxed/simple;
	bh=ymk5//0V+U3z7Ley7Y/EvkxWtmI7rOWoBuRzpMPOLFg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VB9Iw+DDY4opC/gaSCmDP9O5MtVyuExMBYZdDWpn2c/J1qSZt/s5inkXWCiKhAWnZ5KX9VIL7XZwX3YPKYy2hGsP+ZFOPWsxmDaRFHjfl1ozpviyTVH2tKhV/kIXZt6HQEATuMIFUvZrjnkO4sPnRsaVYlZ55VxhXW9He5OI4pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C14C4CEE3;
	Thu,  1 May 2025 12:14:26 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 1FFD95F949;
	Thu,  1 May 2025 20:14:24 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20250430095325.477311-1-andre.przywara@arm.com>
References: <20250430095325.477311-1-andre.przywara@arm.com>
Subject: Re: [PATCH] clk: sunxi-ng: fix order of arguments in clock macro
Message-Id: <174610166405.2974716.1586244113913047340.b4-ty@csie.org>
Date: Thu, 01 May 2025 20:14:24 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Wed, 30 Apr 2025 10:53:25 +0100, Andre Przywara wrote:
> When introducing the SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT macro, the order
> of the last two arguments was different between the users and the
> definition: features became flags and flags became features.
> 
> This just didn't end up in a desaster yet because most users ended up
> passing 0 for both arguments, and other clocks (for the new A523 SoC) are
> not yet used.
> 
> [...]

Applied to clk-fixes-for-6.15 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[1/1] clk: sunxi-ng: fix order of arguments in clock macro
      commit: 4a9c3c3215491f25bc66d615faa921c814b1a479

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

