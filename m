Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB34F33993;
	Mon,  7 Jul 2025 10:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751885277; cv=none; b=p9/c9gH1d97KnmpllDE2owQoDwiTC+pGg2WtTyFoSMReosSnzfQLy+rt3VFPgq3nzGiRg1E21kqoliGO5j484EJ/RSvOPOapRrupZLNGLQ8iGHECqZpblWS3YJnzAXnsj9x2KgS74su9mCMTAdiFg/nkFfgynhJReP3A1++T8bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751885277; c=relaxed/simple;
	bh=AFyFDMaB9QNNosU1yyH1LUR5Emd2nUyKYRSxZ5Z3TTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k8YO6ndtVpSALpT/9+Cd6zS/rzsuvVWPxNNsM5BtQXfIAvjr67XTxFyeAHjUlGSkzyYWKi33KQfIQbwOxPChFW2TScsM14ezjToKxk8u1Wk+WO9FgfoK/UU0hh0IyLP+AFgOwTlbCJwsl4v+GzyMIOBpUWv4zqupOz3qD5vxvIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E02023413F2;
	Mon, 07 Jul 2025 10:47:54 +0000 (UTC)
Date: Mon, 7 Jul 2025 10:47:50 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, heylenay@4d2.org, inochiama@outlook.com,
	guodong@riscstar.com, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 5/6] reset: spacemit: add support for SpacemiT CCU
 resets
Message-ID: <20250707104750-GYA474251@gentoo>
References: <20250702113709.291748-1-elder@riscstar.com>
 <20250702113709.291748-6-elder@riscstar.com>
 <33a20f6abac7400c8b4842b99c14ea118def2780.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33a20f6abac7400c8b4842b99c14ea118def2780.camel@pengutronix.de>

Hi Philipp, Stephen, Mike

On 11:46 Mon 07 Jul     , Philipp Zabel wrote:
> Hi Stephen, Mike
> 
> On Mi, 2025-07-02 at 06:37 -0500, Alex Elder wrote:
> > Implement reset support for SpacemiT CCUs.  A SpacemiT reset controller
> > device is an auxiliary device associated with a clock controller (CCU).
> > 
> > This patch defines the reset controllers for the MPMU, APBC, and MPMU
> > CCUs, which already define clock controllers.  It also adds RCPU, RCPU2,
> > and ACPB2 CCUs, which only define resets.
> > 
> > Signed-off-by: Alex Elder <elder@riscstar.com>
> > Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> > Reviewed-by: Yixun Lan <dlan@gentoo.org>
> 
> Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
> To be merged via the clk tree, if Stephen is ok with that.
> 
ok, I'll just go ahead and prepare a PR for this,
and leave Stephen to take care of the rest..

thanks all!
-- 
Yixun Lan (dlan)
