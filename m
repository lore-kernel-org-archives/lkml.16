Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2E716F271
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 07:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738307413; cv=none; b=DykA54WLXuzpS+y7Kct6fGss58GfY6ow/ByOgyBg0obK55M37SF1yXcckz4CdqGeXxmm3JuF6OlyCa2pWLI+xkNasEYV1KBwO4/OqsT2UjTnuVM9EwkRd44WpM7AH2h/Y/dBOhR9HWeOHSw0L7Zkgqv86BCRAMZL0cnyd6YWu0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738307413; c=relaxed/simple;
	bh=YkfbNByqPN07H4VAKX8KkM+g7r2tCCsmJRGEXIoeTDw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=K3Wer/Ce48frfxd3gcxRx4xgtM3gN2gGqQTlwmtou8N10TzkDo8CBy4IWsh5wT9vm1s6XLi8d58jdoRtr8OUSn8HJcLSHeKUXzH15eTEPAjJ287nuNR6LT9GsUflGirQ0+eGrpDZfe/h/IMLbnoJKo36w0zQiLdd/+afl2borxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=tew+9jhQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=vTKCvtMf; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="tew+9jhQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vTKCvtMf"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 7899513800F3;
	Fri, 31 Jan 2025 02:10:09 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 31 Jan 2025 02:10:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1738307409;
	 x=1738393809; bh=YAl96TURg6PF7G+PHmg5BT/uT8fASOvG3BeA1ovZCfk=; b=
	tew+9jhQGs7FGdJx6t5kebTnlbG/l0LCyFqi2uxNUE7zUAncE5EbcwXTovSr2M28
	WO5jXMeX2kcTSrWae2opih8p5uyvZRjckuBMh2OvKlCWJT+QzLlk1L607UToKeXC
	dFGDGa6plP/99s26UwN39OWsjH9UviXVmkTS444UsCxwK3xg28/QLzOvqdq8OJrD
	xgfO4hYKSXkd9KSOseKBRKuj4C7cXsaUMkGZoGn9ePANVuhDHjc8g+ocl98EjRQ3
	pSO7OE/wgGWe5NGWZAif42Gac+PT27Md6iIGYv8R5uYVlWdZSZa82d77LFHtaIf0
	cGUFN6m/FkHcRkZpobWL+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1738307409; x=
	1738393809; bh=YAl96TURg6PF7G+PHmg5BT/uT8fASOvG3BeA1ovZCfk=; b=v
	TKCvtMfoefAO0Vr2OVHvYpZJP0cTNscm1Zyw7tdiYbPWvatFT3zm/j4iEeeaETAL
	FzX7K5B95QyWcknlfChlQklR/MwkNihzbVIKP2nGhejXG1KrYCos697lgYThCZZE
	C0cCH4jglWQeFj5QCXPmZvoNPGcd9ZH66AY6ikHAIbJXCk2bl4M3dhZADBKGF4Sp
	pge0bKnlAz1HyUNerXd4YZxOR4eSKQXlRP+FrrHp7YEcwqBkv3G8xRa7FCblmjCd
	aKWrjGW3NLqZKTNLE9Oe9+l+ZoQ7NHnfTFRPGU7cIK4gVbUljdBHHMmc4f1htD2K
	g2ZTdsFspJJclVMXZ1OSg==
X-ME-Sender: <xms:UHecZ6Ypsc9pZ0n392ZlFODTVMh76PxkK0Bt2TZyaY5Xg_coTStzzQ>
    <xme:UHecZ9b71zrkPU_zNpo8qbRHsX3fqioguHNjxD0C8aEJAhHaxDBedcfvnkmi10pwc
    _tVNG9TQp6LfxMFbKg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepgedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghlvgigrghnuggvrhdruhhshihskh
    hinhesihhnthgvlhdrtghomhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhu
    nhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigsehtrhgvsghlihhgrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhg
X-ME-Proxy: <xmx:UXecZ0_W4M4JwoPITrQ6dgdu0pOuuCA5N0PZWi8nwpP2lsYKKz_VlQ>
    <xmx:UXecZ8ql_W0NQWemoIoX2wit1ypswIzoBjSMB_qtBuXwKhW7zopAHQ>
    <xmx:UXecZ1rXbvYdB_KM9Z6IdqW4UZtHfdUAsciupOgOdR6lXMXdPLq-dQ>
    <xmx:UXecZ6Qpi5a3pXVXLRkI-Ql82ZxJgVjduwrUgDGVjWZx_bsh90TI_A>
    <xmx:UXecZ8WfKZ0LcQgYw7wIf1qgG-B2Nup4xR5wCKz8dDOfI1bWIBT8AfoM>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DBC902220072; Fri, 31 Jan 2025 02:10:08 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 31 Jan 2025 08:09:34 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: linux@treblig.org, "Alexander Usyskin" <alexander.usyskin@intel.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org
Message-Id: <8c9f6d8f-cf4f-476c-aeda-25a68ea36b0b@app.fastmail.com>
In-Reply-To: <20250130012654.255119-1-linux@treblig.org>
References: <20250130012654.255119-1-linux@treblig.org>
Subject: Re: [PATCH] mei: Remove unused functions
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jan 30, 2025, at 02:26, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>

It looks like git-send-email failed to find your cleartext
name in gitconfig.

> The following functions have been in the mei code for
> a long time but have never been used.
>
> mei_txe_setup_satt2() was added in 2014 by
> commit 32e2b59fca2c ("mei: txe: add hw-txe.c")
>
> mei_me_cl_rm_by_uuid_id() was added in 2015 by
> commit 79563db9ddd3 ("mei: add reference counting for me clients")
>
> mei_cldev_uuid() was added in 2015 by
> commit baeacd037697 ("mei: bus: export uuid and protocol version to mei_cl
> bus drivers")
>
> mei_cldev_recv_nonblock() was added in 2016 by
> commit 076802d00615 ("mei: bus: enable non-blocking RX")
> it is the only user of mei_cldev_recv_nonblock_vtag().
>
> Remove them.
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Makes sense to me. IIRC there are part of mei that are only
used by out of tree code, but this is normally discouraged,
so no objections from me on that.

Acked-by: Arnd Bergmann <arnd@arndb.de>

      Arnd
