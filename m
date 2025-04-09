Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B863522CBFD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 07:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744182474; cv=none; b=M6A2KiFsPpqY/P6p1zbREdBpGs6e2dvBHmpMAmYCBKyQXeSvuNZpAn+vsD4WePQWDwPPpC4efl64UhjYaHLB/Kl6ujdbUuA+5KWJUAIiE8aYr1z9LN77mPQfF33qOfNUd0jHlwClqV5F9Or7I+0iXf5MDrfFiBQ+04XGASDaRc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744182474; c=relaxed/simple;
	bh=nkERw9n6c8MXtnTyqGDptLjodnivZBAeBeMX2TdqUrE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=W87/ipfgvr8kxK8wNOwF/SbT4etQQQq/8idd/wnNRNjT+15IfWjZk98e/sVu7zc6FKQ1iIeSGxDBlM2IAPB0Zv2qd5nse434myKGom1Q0fJBAKpoB9Q/YDqU/3uk++Nlpl2LrHrSU8A8iYxRFrMNogUDiPwSZFVgpHtGwnNzXbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=iuH3lPCc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ulintaph; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="iuH3lPCc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ulintaph"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 9B64313800F0;
	Wed,  9 Apr 2025 03:07:51 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-12.internal (MEProxy); Wed, 09 Apr 2025 03:07:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1744182471;
	 x=1744268871; bh=szAsIbJGleX/j4m9qmkEAz1NTFE9tgJstm3fvc/GUno=; b=
	iuH3lPCcyo1S0DoI24wAKPHPFrtVK918ADF8S5QBM8k53X2TtaR6uwHbh/mwFDj9
	XOyDfUCOLBYIlj2IV1EnSc7shufvitdkwULefhg6hoUacgmu6W7fkDjZ4/mqZJ1Z
	0i/QUMwN97jvf5FzdzGb8o79yHCJxXL4PuqJ1qwwDgsmxA26E290KWhrcGs/SVX4
	h6lIbp6ylXDCrbSILTxw2d93qBSR2somC+MbECGWgqjkxubnvbBS6JX/uCsmUmzI
	+qBTuy6kQjE9dV90OykDmPVxq+4XVWwUN9KapHc1I7p1ZmZq+pEPlTH6c8SQfzUQ
	zYzmK/H76kT0ms2J1ZZBLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744182471; x=
	1744268871; bh=szAsIbJGleX/j4m9qmkEAz1NTFE9tgJstm3fvc/GUno=; b=U
	lintaphoy8+3KjVy2xdteITmTaFiCkpCzIGQ6+hnR3P6WbQA1FANsBw4S51SlvG4
	hYnA89zivl1pivvIWqs6rbZO/op4thKptrf8Ohfxvsr6eb39qR9KnCywyyY1gUHm
	m4YJ5Sk5oStdhpsQ5guvKGlmjFbgDFEX/hXfSwN61cq/FCSG9aNPyjuBGJGUYSDQ
	fO9yxlivQ2yaPLcpd3nj2w94RDDZNO884Ve0I5jPbFGcLrerPHXo5mhgW+Rwb0I6
	voXULIWP5ylOUcYwPObRICnHQgbMjqO8mcQi1jIZ6Xh6uSbUxC6jF/amAuY5G2Qy
	c5nviMM50vzhZrn/ShqHA==
X-ME-Sender: <xms:xhz2Z0AzYgn00VbzDYrzZkkqIPU9_jtnje6RLqc8DTnpOvaCaQOnWA>
    <xme:xhz2Z2hu0T_LqloitsKXfD-twX9gtcaLCZuoRiir_s4cYVCB-MPtXEx9LijfRYhGS
    LrALUc0aTh-B7GqeAk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdehfeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    vdefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehhvghikhhordhsthhuvggsnh
    gvrhestghhvghrrhihrdguvgdprhgtphhtthhopeguihgrnhguvghrshestghhrhhomhhi
    uhhmrdhorhhgpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtth
    hopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhgvrhhnvghjrdhs
    khhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhhitghkrdguvghsrghulh
    hnihgvrhhsodhlkhhmlhesghhmrghilhdrtghomhdprhgtphhtthhopehjuhhsthhinhhs
    thhithhtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehmohhrsghosehgohhoghhlvg
    drtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshho
    nhgsohgrrhgurdgtohhm
X-ME-Proxy: <xmx:xhz2Z3nKnUTg2qsQUznUq6F1C8Jcv-zINhuWClOuwQmLJTSakHkCQQ>
    <xmx:xhz2Z6xXh9Uh0ouaQ0cyOQv-8rb5PNoOY30cVycnDrmcENLmnbX57Q>
    <xmx:xhz2Z5SgOLrbT3PpgtxsZmgKickE5oCoRJXaA3Oxbdg2ExPyUYFFSQ>
    <xmx:xhz2Z1bztwt8POjFULiMhjIGv8gommrOLPTDEE_vGALfpj_ZnAzlhQ>
    <xmx:xxz2ZwDFYYVUMOkPnGr0y6-qmIHCyGGI6e8hC4uK2ob_A8Kg0dIHwfLe>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5A1CB2220074; Wed,  9 Apr 2025 03:07:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T2c1dd8538360b27d
Date: Wed, 09 Apr 2025 09:07:30 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Arnd Bergmann" <arnd@kernel.org>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Dave Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Nathan Chancellor" <nathan@kernel.org>,
 "Heiko Stuebner" <heiko.stuebner@cherry.de>,
 "Andy Yan" <andy.yan@rock-chips.com>
Cc: "laurent.pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 "Dmitry Baryshkov" <lumag@kernel.org>,
 "Doug Anderson" <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Message-Id: <30e22523-216f-41a9-b931-e90136a45378@app.fastmail.com>
In-Reply-To: <20250408175116.1770876-1-arnd@kernel.org>
References: <20250408175116.1770876-1-arnd@kernel.org>
Subject: Re: [PATCH] drm/bridge/synopsys: avoid field overflow warning
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Apr 8, 2025, at 19:51, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> clang-16 and earlier complain about what it thinks might be an out of
> range number:
>
> drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c:348:8: error: call to 
> __compiletime_assert_579 declared with 'error' attribute: FIELD_PREP: 
> value too large for the field
>                      PHY_SYS_RATIO(tmp));
>                      ^
> drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c:90:27: note: expanded 
> from macro 'PHY_SYS_RATIO'
>  #define PHY_SYS_RATIO(x)                FIELD_PREP(GENMASK(16, 0), x)
>

I still see the same build failure in some other configurations even
with this patch. Please disregard this version, I'll try to come
up with a better one.

       Arnd
