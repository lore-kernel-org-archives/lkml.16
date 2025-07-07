Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A69B2D9489;
	Mon,  7 Jul 2025 14:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751898535; cv=none; b=LZSaV0k/UIXaJMjXbtPrJopAp+uB43eI/ECXlPX6IRFm/j/DjO0/4V0HCoUnRX2425jn5lylmCCOSbIVkor7a6z0t5dzlKp+UpO7l1QxMBCzETck2PlaLm9qTZYzVtE164yUjluqUb4SQM1sHHGuz9F/XokFk3FX0/laYaUGkBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751898535; c=relaxed/simple;
	bh=Ik5/xYwJsxB8a3sAte6wEJzOfbrZUDja39y8JI0XNCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PfpsM1g2JQnyaQWUi2qemH+R/S+OGlkcYRB8AI5+tIZvWXvUbmZwOfYEeQQ6m3YIPrSkHReGzXfyJ4Og0VUKa04eYjkiVQGTtKQ+fucyONuKu1AR/4WD4HElcZkJW7Ri8kYoYDqX2QZd/E3QweH1SkzNRXIs7nYXhWypyA0UjjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 18ED2341E79;
	Mon, 07 Jul 2025 14:28:52 +0000 (UTC)
Date: Mon, 7 Jul 2025 14:28:46 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, heylenay@4d2.org,
	inochiama@outlook.com, guodong@riscstar.com,
	linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] clk: spacemit: mark K1 pll1_d8 as critical
Message-ID: <20250707142846-GYB408198@gentoo>
References: <20250612224856.1105924-1-elder@riscstar.com>
 <7bdbef20-da43-4b23-9ae2-a0cf077fec92@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bdbef20-da43-4b23-9ae2-a0cf077fec92@riscstar.com>

Hi Alex,

On 07:19 Mon 07 Jul     , Alex Elder wrote:
> On 6/12/25 5:48 PM, Alex Elder wrote:
> > The pll1_d8 clock is enabled by the boot loader, and is ultimately a
> > parent for numerous clocks, including those used by APB and AXI buses.
> > Guodong Xu discovered that this clock got disabled while responding to
> > getting -EPROBE_DEFER when requesting a reset controller.
> > 
> > The needed clock (CLK_DMA, along with its parents) had already been
> > enabled.  To respond to the probe deferral return, the CLK_DMA clock
> > was disabled, and this led to parent clocks also reducing their enable
> > count.  When the enable count for pll1_d8 was decremented it became 0,
> > which caused it to be disabled.  This led to a system hang.
> > 
> > Marking that clock critical resolves this by preventing it from being
> > disabled.
> > 
> > Define a new macro CCU_FACTOR_GATE_DEFINE() to allow clock flags to
> > be supplied for a CCU_FACTOR_GATE clock.
> 
> Is there any reason this bug fix cannot be merged?  It was
> first posted a month ago, and although there was some initial
> discussion that led to revisions, this version has been waiting
> for over three weeks.
> 
Ok, let me explain..

I've queued it at for-next but haven't sent out the "Applied" reply email,
it should be eventually merged for version v6.17 if things goes well.. 

the reason that I haven't pushed it hard for fixes branch is that only DMA 
is affected for now, but DMA isn't fully activated in current mainline
(No DT, No config merged), so I think it's fine if we target for-next..

-- 
Yixun Lan (dlan)
