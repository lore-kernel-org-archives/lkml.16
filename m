Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A90D259C;
	Wed,  9 Apr 2025 07:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744184973; cv=none; b=DBb7V8mds8PCFx+u/ZMPhk/eDp1kGV94rm3abKNAcSZ1WLpcEBRYRAVOE6U2c/Slfem1r5kbsIMG5pG9uD6OjmDE7RFN/jBRbySntM9zR3/px4nF4VCwlb16WoQp9bhQ7l5ulK8T94AS4uWEgTVkUsv/6tYGd/rjPEJUE33bPMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744184973; c=relaxed/simple;
	bh=/TD0IuDa//akCv132OXUCy0NPl5bx2LScr8ZqBMjylU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=THDBT9GMCxOTq/cAqgA4Zv7u+Gm3LgUdSAApt4LmZ5RCzdwu8PmHmKjIH/xvf42xQbjxz++QHGkRYlGuapJ/A1oE82oasiNOBm19+HMzJtBoQskfjr8xJNow2VlxyQyWwgs6GsSMY8LWuTA2E2OZvoHCi4GGFZPXsOKLj3Vms9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=kd1hed4q; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DeHRGbSP; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="kd1hed4q";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DeHRGbSP"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 6655613801B8;
	Wed,  9 Apr 2025 03:49:30 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-12.internal (MEProxy); Wed, 09 Apr 2025 03:49:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1744184970;
	 x=1744271370; bh=b7QO4XxBsidc/k+388zWruWPPsPpYT/wiCzlONis2iU=; b=
	kd1hed4qBru5mq0PUNDyFPHnc1oWGZoYE/UlqjQfMKgzDcx+ZVvgexHpDYGUQRbm
	H80NpaFeQehhRv/p2U7rrK11YycAYQ2DH0B3AwF1diLPC+p0BglmPcsKI8m6Hi9e
	pCxG6gwq5W3/kAqcoSGSFK/b+1AUNlGRo6IpxQ3HUobUtTmQk6xUsO2+/Z41K9DL
	QzZgRSkZ8GtjAaq1TB3mKxsSHPhcRZTOPvXq4dDwpvPgsoBYEV+O0iZC1UNHooPR
	VCRExzQbmr78sN38+iy8OJVUGFm8a5+cvTpJukWp4BL06yOg++ak8h4oYsmrg/2P
	g2oLPElnsgGU1e0977qxdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744184970; x=
	1744271370; bh=b7QO4XxBsidc/k+388zWruWPPsPpYT/wiCzlONis2iU=; b=D
	eHRGbSP+L+TDl8aAREeve+Jf4texGRhNYy3cOjhovDbyOBvC3rjfhxH8uIwQ2zfw
	cJNL520BLh4Gh4gjBXbbPuMNsw3TvnCCBwnxeDHRbp25gEqCg6dbpG99m0zga0yO
	6satkEa6+eqfll7+YpEDYUWeYNiDmu/btCYQQ3tsoC7/WnvZNjxO4aAs06MQR0KX
	qiBSX/fS9kK+nzjVRzxE6Zwo+8FswfnJjwDubzIJEmvlubBOQCL7vhOYBGbXzWzS
	KDjia4a16Dc2SQst83A2ALbPfl53b5Vwlofufm5FkZV7Vj468Xm33l9e485DKOgW
	uFVxdGtrA+Bg/YYYuvliA==
X-ME-Sender: <xms:iSb2Z2Et506oI8LNEYn1Jy3l7oSy2nJHIIfWyojPUtFNQBTv7SZorA>
    <xme:iSb2Z3WUlYb46-DmmRyrTFDn1czxWaZSiT3Y8_eNAf8uE9al9iy8i89CcuNsXbQST
    NIcZMj-hMS-IcaRTZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdehgeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    udefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghtrghlihhnrdhmrghrih
    hnrghssegrrhhmrdgtohhmpdhrtghpthhtohepshgrshgthhgrrdgsihhstghhohhffhes
    rghrmhdrtghomhdprhgtphhtthhopehtihhmohhthhihrdhhrgihvghssegrrhhmrdgtoh
    hmpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlphhivghrrghlih
    hsiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgriieskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllh
    eskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:iSb2ZwKsTfrLqpDyBgskviGCEFI-4Xn2ksXcaYtH4ixw0U2NKKqrHQ>
    <xmx:iSb2ZwF1V-6fwB7e-EhikcvO3A0UvwgoNxPjJ-_mzSwJTVrg2qGTuA>
    <xmx:iSb2Z8V7iwX4xcw85J6wpH2W4Pnw2BMcAvVk0_5PL_1vOwWVRonICw>
    <xmx:iSb2ZzNNGR5BENWLma_5U_rPgbdvYGpgL5POptKyYMsIIniJ4TvbVA>
    <xmx:iib2Z0BjNWvTXgczBR0xN7gwz1CxxiOuyWw3ZfF-kJI6DzOJAJY1AQaO>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D75382220073; Wed,  9 Apr 2025 03:49:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tf8f308e4370a4290
Date: Wed, 09 Apr 2025 09:48:49 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 "Marc Zyngier" <maz@kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
Cc: "Sascha Bischoff" <sascha.bischoff@arm.com>,
 "Timothy Hayes" <timothy.hayes@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Message-Id: <a1c79f36-322f-4444-992b-1b69d8232124@app.fastmail.com>
In-Reply-To: <20250408-gicv5-host-v1-13-1f26db465f8d@kernel.org>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-13-1f26db465f8d@kernel.org>
Subject: Re: [PATCH 13/24] arm64/sysreg: Add ICH_HFGWTR_EL2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Apr 8, 2025, at 12:50, Lorenzo Pieralisi wrote:
> Add ICH_HFGWTR_EL2 register description to sysreg.
>
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>

No comment on the contents, but I feel that having ten patches
adding new sysregs one group at a time is a bit worse than a
single patch adding them all. The patch descriptions don't add
any particular information about why these are distinct, and you
need them all anyway, so I'd suggest combining them into a
larger patch.

      Arnd
