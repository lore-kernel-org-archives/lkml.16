Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E87085626;
	Fri,  4 Jul 2025 13:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751636213; cv=none; b=W0HqVGnvh/ROJvtmZUcABtlJOMIeqQQSu/OPC9F4Zji6dW5tNainbrZeaCjSWpX0PBQp//d/xU97Tn+B4nNHuGH285AA7XWVr5hYYcklu7sZi3FiZOU9SPUSTtUYRDqWwW/5vj7d8ZEYpUuhEbKCEliL8ijrZmyhWVG9vmTwQT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751636213; c=relaxed/simple;
	bh=Q9UkrFl51j4x9O2AKzGaYg7j7Qe2rlKFHMgNrDtlZaQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=CT++2CRXxRTgyuXuNiy323Yn/k5rnGlK9BbqqxqIysoudIqEKe/9MGFgWkH5nxZWNXHhN5jGoRGk7BNsvo3pjaMXLnXmy00tQDkgGHj3DP7dnVa1UatmXxKXdhTKhTSGo47gMlgy2iN8Nrpj4bD2sp2QSYLuEaX/nrM6Ru5x8OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Ierk354A; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MvfGxD45; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Ierk354A";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MvfGxD45"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id BC7311400239;
	Fri,  4 Jul 2025 09:36:50 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 04 Jul 2025 09:36:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751636210;
	 x=1751722610; bh=4WAwqvw8g3t1MUCHlAIadPbHEDivdqOU5oF5ZelV4ww=; b=
	Ierk354AvF659FFpEBGZTnHYIKg5Cftf2qg+x1+moeY0eQH0V5tIDArd0R1asTWH
	3Ph/Zhxo4uqzR23mbt1uqpOiQFdzI4DmS2+a7Lj3VE8+rNZgSe6195p1FXRNKvT3
	dDttZYTVyarpE7xl5fG3tnObnDl3IJZu5qn2B8wuYvLUwD4BQRazzHfETlb1e7zr
	C/OIPEWYQNN1ZB+Un9zrdBdTZrZcx7r0loYfP3TGNZPfTdRuZUoAbeI6HhxOYX1e
	9laI7rCkUK0SZI4cF9RKRtwO3HpZrdx2qh/m2P6L4wbIfHRWuxhppW0A2/n7bq7H
	0h2eHRd8WRBgoPKvpdKYpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751636210; x=
	1751722610; bh=4WAwqvw8g3t1MUCHlAIadPbHEDivdqOU5oF5ZelV4ww=; b=M
	vfGxD45kzCPWcC1qgDw6pQLWiTjnNSo9fflkxfhmwu00u4MLErLDWnnQdkbMYPUO
	ep7W9iUaPExx49n1CZGeWZnp4dSbkablwgofEldRzt8PObUUAaBB4SJROM3EZDQs
	EeeQ3KSgbi+98NIXPg1nrjaYrS0bGMNrVeRtAhEQV0JVzlOXJs/DjBIidzK6tgEm
	CyDVMHynVKycn07PBvZo63tH2bvSK3xQuPpyCkgFaNQNyu7fXHuWxo364m00Cqja
	L2uRNuo1C38lM/eKZ5mJskKA7Ym+q2lR6M15+cb7BgUDN4Nls3Sdzw1BRjuPdaE/
	SwPLNckhUFyNtlbdWSsMg==
X-ME-Sender: <xms:8NhnaAT2fbqff4v-deXXDh6h9sFJZglSsRMzCTnlLYYXIqLcyXMNCQ>
    <xme:8NhnaNxzTx6SQttAoJ9N7sO1iylqVB5hrKBqO2l1Gf6q9fOpwAf1pb20QJOlP30ud
    9QSXzURHGpthyNlHo0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvfedvlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedujedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepsggvnhejudejsegrnhguvghsthgvtghhrdgtohhmpdhrtghpthhtoh
    epthhimheitdelsegrnhguvghsthgvtghhrdgtohhmpdhrtghpthhtohepphhrrggshhgr
    khgrrhdrmhgrhhgruggvvhdqlhgrugdrrhhjsegsphdrrhgvnhgvshgrshdrtghomhdprh
    gtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhu
    segvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheprghlvgigsehghhhith
    hirdhfrhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkse
    hkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:8NhnaN1UHNjfOf7_aLGGRl33HPK20Q_iXfXrFxorL-owGRn9rW3zmQ>
    <xmx:8NhnaEAc7p7ywTmYFbhVKVxdggyzX7XfvU1RiYBdW19WFZgvM7Ev-Q>
    <xmx:8NhnaJhLB2CpJT0d2RainLbBsUwZub8QX27CVdSLtt9ZHwwtxI2eEw>
    <xmx:8NhnaApcDHKDpiu1GnI_oTHKrXxpAT8Aar_UyIb5hM8NUcDqVqjbYw>
    <xmx:8thnaIl4lmGLlojO5Dj9VTiwT59P03yJXEJ-mx7s2PP4RHLxjwbmb9qI>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F2AFD700065; Fri,  4 Jul 2025 09:36:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T286e4b5afb74591b
Date: Fri, 04 Jul 2025 15:36:17 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ben Zong-You Xie" <ben717@andestech.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Rob Herring" <robh@kernel.org>,
 krzk+dt@kernel.org, "Conor Dooley" <conor+dt@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, soc@lists.linux.dev, tim609@andestech.com
Message-Id: <ebbaa7c9-156a-4205-94d9-d9e4a683840c@app.fastmail.com>
In-Reply-To: <aGfR+Vx0dseqgmKW@atctrx.andestech.com>
References: <20250704081451.2011407-1-ben717@andestech.com>
 <cb8891d4-de4e-493c-9914-0391b3baf212@kernel.org>
 <aGfR+Vx0dseqgmKW@atctrx.andestech.com>
Subject: Re: [PATCH 0/8] add Voyager board support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Jul 4, 2025, at 15:07, Ben Zong-You Xie wrote:
> On Fri, Jul 04, 2025 at 11:15:43AM +0200, Krzysztof Kozlowski wrote:
>> > Also, there is a patch dependency in this patchset:
>> > Patch 2 <- Patch 4 <- Patch 5 <- Patch 6
>> 
>> How? These are bindings. How DTS can depend on the binding? Do you have
>> akcs from their subsystem maintainers that you are sending it here?
>>
>> Sorry, but no, this should go via their maintainers, unless they did not
>> want to pick it up. Is this the case here?
>
> The dependency chain arises because each of these patches introduces a new file,
> requiring a corresponding update to the MAINTAINERS file.
>
> In v4 [1], Rob and Daniel attempted to merge Patch 4 and Patch 5, respectively,
> but encountered conflicts in the MAINTAINERS file. That's why I specified the
> patch dependencies in v5 and this patchset.
>
> Now, I understand that binding patches are typically handled by subsystem
> maintainers. To prevent the conflicts again, I think I should gather all
> MAINTAINERS file changes into a single patch. Is that right?

Don't overthink that part, the MAINTAINERS file doesn't have to cleanly
bisect, so I'd just create the full entry there in the same patch
that adds the arch/riscv/Kconfig entry.

     Arnd
