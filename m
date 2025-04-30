Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510412973B3;
	Wed, 30 Apr 2025 20:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746043455; cv=none; b=byEBZDWXGXmpPCFO/WzW+0SXbYILRmHHpw+VBd8St0MA90tt9nQAakaKPQzuFIYI7zW93/bVxOHM3iitmdVvVAlTW8P5OI6R3BRbyh99CKF3eGKXd3aNYySimjEb9dDUrXVujeVYPMEbjsJDMaNvU9q9Om+efBDoiw/b4KD9T1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746043455; c=relaxed/simple;
	bh=sOnwfSJ05AlVpzAlYbQ/0NuGlFxQqXAq2x1C4iV2EKY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=V6fYh/lUfB1GVfpWKDREHNeNntKJlNHmkmFPQSCclKwiOoJYMdN8f1hndmivU2+qO9I2NGoVsllZKuO6ElIF7GkA8LW1ZZPR8ihd83v0Jd4ywzWKXPWUM3mU/SJzT/OioJ6qA2mUdoD1ZgMtVQT+KIe0MNe/T3TmZduR/+M2MOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U25JLx1c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U25JLx1c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9BC6C4CEEA;
	Wed, 30 Apr 2025 20:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746043454;
	bh=sOnwfSJ05AlVpzAlYbQ/0NuGlFxQqXAq2x1C4iV2EKY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=U25JLx1cmAY+jpWLVGD0vUDAi4OfIKit6ldTPXGNtCcvkl9+Yrzln8DVc2doXdj47
	 xkjFrBz9Y0tEP8myMxUKQ+JIcpBpW0fDmzwH06jInApIkXhzRwIVFIvB1WiFriwrNR
	 xI3x/NzJTpC5sTT8TPYBqvS+VuoGYrJMI/iUyyJweJ56UajtNkFmZU8WrgOKFisF7S
	 45ZLrk8Hmbw+IGf379X4/KP+kZibwO5oxFGkPmlyH8cNr05oCqD4GL7fQD2zKjlnsB
	 W6m1TJonDGklm018uSSO7ZsLp+Hjbl5gIWd38Z4Sjv6Rq5//RstYDhsNM6UUaZ8ue6
	 JYR+B7fjy/d7g==
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 03690120007A;
	Wed, 30 Apr 2025 16:04:13 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Wed, 30 Apr 2025 16:04:13 -0400
X-ME-Sender: <xms:PIISaMl66q4oIQvefNEDkOI1vL_wBtYRNWEX8IlLtlVykoJRdjBLTA>
    <xme:PIISaL35aOu31TsXpttNJagiKcZuvx3e8XY8ThmPsByKQnTQNOnX_DjzklWsRsEmx
    v8-chyMEUsn9JataY0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieejieduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnh
    gvlhdrohhrgheqnecuggftrfgrthhtvghrnhepjeejffetteefteekieejudeguedvgfef
    feeitdduieekgeegfeekhfduhfelhfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheprghrnhguodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdduvdekhedujedtvdegqddvkeejtddtvdeigedqrghrnhgupeepkhgvrhhnvg
    hlrdhorhhgsegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudehpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopehmihgthhgrlhdrshhimhgvkhesrghmugdrtghomhdprh
    gtphhtthhopegtrhhishhtihgrnhdrmhgrrhhushhsihesrghrmhdrtghomhdprhgtphht
    thhopehsuhguvggvphdrhhholhhlrgesrghrmhdrtghomhdprhgtphhtthhopehjrghmvg
    hsrdhquhhinhhlrghnsegsrhhorggutghomhdrtghomhdprhgtphhtthhopehfrdhfrghi
    nhgvlhhlihesghhmrghilhdrtghomhdprhgtphhtthhopehjohhhrghnodhlihhnrghroh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhohhgrnheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepmhgriieskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrnhdrtg
    grrhhpvghnthgvrheslhhinhgrrhhordhorhhg
X-ME-Proxy: <xmx:PIISaKp7rqOCdVGbRA2HZDpQJhnVGN5XFHi05juz8PVw8TSEVKlDxw>
    <xmx:PIISaInPACZ2CgKBMH-zw7kJQJ1mlVk92P2laGAC8_MMSsa3IlDHTQ>
    <xmx:PIISaK03XUW8ZeWNLPhTfV3ir-Y9kQd2S23QilEqOqABzQsbMg9m1Q>
    <xmx:PIISaPu-GCM62oFJ-kntqLgaucGOboWPKtoLJoev1nyKI1lVPIQ2Yg>
    <xmx:PIISaGVkIFm3CLtJ7Ou0CatlVuNOkKpCPShcUnK5NeUi2Dujl8k9tTr4>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B7E0D2220074; Wed, 30 Apr 2025 16:04:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T9031dfa3c80e4b2d
Date: Wed, 30 Apr 2025 22:03:42 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Sudeep Holla" <sudeep.holla@arm.com>,
 "Cristian Marussi" <cristian.marussi@arm.com>
Cc: "Marc Zyngier" <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
 "Jim Quinlan" <james.quinlan@broadcom.com>,
 "Florian Fainelli" <f.fainelli@gmail.com>,
 "Vincent Guittot" <vincent.guittot@linaro.org>, peng.fan@oss.nxp.com,
 "Michal Simek" <michal.simek@amd.com>,
 "Sibi Sankar" <quic_sibis@quicinc.com>,
 "Dan Carpenter" <dan.carpenter@linaro.org>,
 "Johan Hovold" <johan@kernel.org>, "Johan Hovold" <johan+linaro@kernel.org>
Message-Id: <94e94c5f-210b-43b8-99bc-e7ad7da2588d@app.fastmail.com>
In-Reply-To: <20250430-efficient-spider-of-criticism-e857bf@sudeepholla>
References: <20250429141108.406045-1-cristian.marussi@arm.com>
 <20250429141108.406045-3-cristian.marussi@arm.com> <aBHXHnXA95TwJths@pluto>
 <868qnhj2yf.wl-maz@kernel.org> <aBIbC15NiqUseZc7@pluto>
 <20250430-efficient-spider-of-criticism-e857bf@sudeepholla>
Subject: Re: [PATCH v3 2/3] firmware: arm_scmi: Add Quirks framework
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Apr 30, 2025, at 17:26, Sudeep Holla wrote:
>
> Arnd,
>
> I don't see much discussions on 20250407094116.1339199-1-arnd@kernel.org
> to conclude if you plan to get this for v6.16
>
> We probably can wait to push this $subject after your changes land. But
> it would be good to know your opinion here especially if you are not
> pushing your patches for v6.16

I've pushed my branch to the asm-generic tree now, so it should 
show up in the next linux-next.

Cristian, I think you can keep the __VA_OPT__, as the build bots
should stop testing with older gcc versions once my series is in
linux-next.

    Arnd
