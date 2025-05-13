Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1624B1DC9BB;
	Tue, 13 May 2025 20:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747167140; cv=none; b=OH+A1Wq4WlNOHW3eIT40jED5i8KB0V8ME0/fdhGQ4Gq1C7MdEMo57+zV1yyCV8vWEt6yYq0K++j/7osM6HKBt7ONf2kOshOPWDbqUdmD1nCiMsT7iiEGwPB0frl0HpcGZ88mqzPRC82FCcVk980O8DXIQAmEZ48fb3YFmKOlWmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747167140; c=relaxed/simple;
	bh=9rMCJny3jQ2rtrYGCTQvdBydsovHwI4L37V+IO26vk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/6DD8EtSXgZSY9jmIcs8qQt0CONuo0LDJmshBfJSk0lsvoO77exHDPfYsaf4TSIxhhFBumRuCYFP7XRf2j+wDXknjtiRYEN942KGeORtOQn0iqv5XR222VNnDRqW0PIjyl3CNi+y/7/PWxan3Eynq02zEkhh7CpL6HAHj8nJyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id CE4C9343463;
	Tue, 13 May 2025 20:12:17 +0000 (UTC)
Date: Tue, 13 May 2025 20:12:08 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, heylenay@4d2.org, inochiama@outlook.com,
	guodong@riscstar.com, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 5/6] reset: spacemit: define three more CCUs
Message-ID: <20250513201208-GYA518096@gentoo>
References: <20250512183212.3465963-1-elder@riscstar.com>
 <20250512183212.3465963-6-elder@riscstar.com>
 <ecf46fa3116690b85f51539edf7f6a47c612fca5.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ecf46fa3116690b85f51539edf7f6a47c612fca5.camel@pengutronix.de>

Hi Philipp,

On 11:21 Tue 13 May     , Philipp Zabel wrote:
> On Mo, 2025-05-12 at 13:32 -0500, Alex Elder wrote:
> > Three more CCUs on the SpacemiT K1 SoC implement only resets, not clocks.
> > Define these resets so they can be used.
> > 
> > Signed-off-by: Alex Elder <elder@riscstar.com>
> > ---
> >  drivers/clk/spacemit/ccu-k1.c    | 24 +++++++++++++++
> >  drivers/reset/reset-spacemit.c   | 51 ++++++++++++++++++++++++++++++++
> >  include/soc/spacemit/k1-syscon.h | 30 +++++++++++++++++++
> 
> Could you split this into clk: and reset: parts? The reset changes are
> 
Do you have suggestion how we should merge the patch series in future?
What I can think of 
1) take patch 1, 2, 3 via clock tree, and provide an immutable tag
2) pull the tag, and take all driver/reset via reset tree, and provide an immutable tag back?
3) take the split part of drivers/clock/ in this one via clock tree

> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
> regards
> Philipp
> 

-- 
Yixun Lan (dlan)
