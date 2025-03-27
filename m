Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE58204687;
	Thu, 27 Mar 2025 08:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743063547; cv=none; b=Fur9Q0B8WiJ5rPmNRYzy48r/5TnFohPinKVM4NxHySkaQvhAXTboCk5uHzZz3r5Qzy3OSOl3w4YKStC4I4i+JPDB9mWV8T9PjmlZkqxTXfScnZj+TLUMmuoTjVdPE4IlEWTS2SL8otXEbNffUVgljsRg0KoucZOGjg0jGza5CfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743063547; c=relaxed/simple;
	bh=1EDgCYPwyVrzxCUuEyGz2PU5ARY6WYfsdCN11arE1/Q=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=jB+mDZPS7jCdF1i/670fDfPEvoCrrRkr6SCreY1pFc4S5my39aadpLmjOUC6S37HrRWszU+EzQLR6hpvUFPZ/S0INrE/BQvdA5Ey0/ufHTiFJEkichgGH2mJHLPg4glt+nGB3eizBkPnUYwZz7mnTcmafBQL5ncJCUNCUBRWub8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Rwlc+XKi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qVWwO4V0; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Rwlc+XKi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qVWwO4V0"
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id 14711114010C;
	Thu, 27 Mar 2025 04:19:04 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Thu, 27 Mar 2025 04:19:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1743063543;
	 x=1743149943; bh=9CynTm7hEp1Sfyl9DtODjpswo0hQrqnUILQztZwn5tU=; b=
	Rwlc+XKizpvtB2gg5LBo4xpET6CBjMmd5x6igfpbBF82pkYTeo9t6mdsx1ouqG2Q
	cKigO+SPb7GiYEu3Njt20InVl6mIyJVRZVhAQH7/MCCu5C0prN2J+MkBycXFqQUV
	BZl2gxqSJIfFNa4Yx3YPzyZ1wvO1kgRX4cQSZA+r2Qvp3ZCH0HSeev6D55Er6imI
	7qmlvcEEI2JRkY8TueyXIhsBdfMg5zd9PZqS5i5iRemIcoBQ0ytp7hsuIw3zztgP
	ieLTeTiYBcfmscCoQAafQyu4QrV3kChHfeHTLV6SsKnqeQ8mAUwk8hfqOChQtc+J
	/eHxXi4uiFMhqxFIt8B/IA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743063543; x=
	1743149943; bh=9CynTm7hEp1Sfyl9DtODjpswo0hQrqnUILQztZwn5tU=; b=q
	VWwO4V0EnTZmRZY3r939TQclGvc6Mw9DGKO/CdZP8hSYgXZJUOm4qd6shgByn29a
	UNezciFeqk1M60E6zMJCaD1KDkSltlzyezr8JP4EhbEkYEAVcvcw84mgRRV7Gaok
	yzq8z5Waw1tknHsgiYuKfPPZe9vBGA5BhigoS6DoU38jCGlLJX5YMpuArSNnJ6UK
	N5L27AQhTNCi77H8tWkXq8jHvIZtiNDCht+jbUgvCVkIUmmzr+P3QSIzj/bqyYBK
	oA32ffJ2+goe8pXu89jcTQEGwH5RKus0+30Jv6fsc2kTMR+8q3t2/wF2MMzouyOj
	UbUEml98pJIt1xra1uZHw==
X-ME-Sender: <xms:9wnlZ7GYFqNl-VXkOIIxhgBpZHLoYL__WEALLu--ESHHaqC4L2AzAA>
    <xme:9wnlZ4Ul8EausyYLZI9-F3FuiIa1pt6KxQkoGNtxDMfTUlRX5kkgK1gxlq5kMguNd
    CXwilcelZeCWjTeDLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieejleduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhepfefhheetffduvdfgieeghfejtedvkeetkeej
    feekkeelffejteevvdeghffhiefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnuges
    rghrnhgusgdruggvpdhnsggprhgtphhtthhopedujedpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphht
    thhopehkrghjvghtrghnrdhpuhgthhgrlhhskhhisegrrhhmrdgtohhmpdhrtghpthhtoh
    eptghigidqkhgvrhhnvghlqdhuphhsthhrvggrmhestghigihtvggthhdrtghomhdprhgt
    phhtthhopehfuhhgrghnghdrughurghnsegtihigthgvtghhrdgtohhmpdhrtghpthhtoh
    epphgvthgvrhdrtghhvghnsegtihigthgvtghhrdgtohhmpdhrtghpthhtohepmhgrrhgt
    ihhnsehjuhhsiihkihgvfihitgiirdgtohhmrdhplhdprhgtphhtthhopegtohhnohhrod
    gutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:9wnlZ9LP8dmJIVo3AvCyikQqbOhgmJKbQZUiPgbJvWb4Zfmao3La0Q>
    <xmx:9wnlZ5GUJwPkXDjtYRhY1AniLv0vNlvXinHvW02A-wjsCow0OxtQXQ>
    <xmx:9wnlZxVMRNdwZvTuCMEbINhEbyxZSupnOIW6lERPVNSoDwPXUK1QaQ>
    <xmx:9wnlZ0Pfsd7x_8j3b7QcWs1HyyTioCqYvW5dzr47bw-QEePbT594MQ>
    <xmx:9wnlZ1k8xkWClOaeTCGYWJHwrI_5DGo3jOuLm6ZGZ76xeBgXpBMQ6_0E>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1170B2220072; Thu, 27 Mar 2025 04:19:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T24bcb56938053d3a
Date: Thu, 27 Mar 2025 09:18:42 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Peter Chen" <peter.chen@cixtech.com>, "Marc Zyngier" <maz@kernel.org>
Cc: soc@kernel.org, "Rob Herring" <robh@kernel.org>, krzk+dt@kernel.org,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
 marcin@juszkiewicz.com.pl, kajetan.puchalski@arm.com,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Fugang . duan" <fugang.duan@cixtech.com>
Message-Id: <422deb4d-db29-48c1-b0c9-7915951df500@app.fastmail.com>
In-Reply-To: <e43b1a00-b221-413b-a36a-3a65e17f800f@kernel.org>
References: <20250324062420.360289-1-peter.chen@cixtech.com>
 <20250324062420.360289-6-peter.chen@cixtech.com>
 <865xjxmlgl.wl-maz@kernel.org> <Z-Nz0DU441Wwj1i4@nchen-desktop>
 <861pukm9yd.wl-maz@kernel.org> <Z-Tz1moMNozx23k6@nchen-desktop>
 <e43b1a00-b221-413b-a36a-3a65e17f800f@kernel.org>
Subject: Re: [PATCH v5 5/6] arm64: dts: cix: add initial CIX P1(SKY1) dts support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Mar 27, 2025, at 08:16, Krzysztof Kozlowski wrote:
> On 27/03/2025 07:44, Peter Chen wrote:
>>>> On 25-03-25 10:52:10, Marc Zyngier wrote:
>> 
>> Thanks for your interesting of our platform, and your comments
>> help us a lot. But I don't think it wastes reviewers and maintainers
>> time, a clean patch set saves everyone's time during upstream process.
>> 
>> For how to organize the patch set for SoC, Krzysztof gave good summary
>> at [1]. We are going on upstream [2], this patch set is just a start
>> and base but not like you said for marketing purpose.
>
>
> I do not think I suggested in [1] to ever send new SoC containing only
> CPUs and interrupt controller, without even serial. My instruction [1]
> was how to organize it. The DTS can be even fully complete, see the
> upstreaming example I have been using all the time - Qualcomm SM8650:
>
> https://lore.kernel.org/all/20231124-topic-sm8650-upstream-dt-v4-0-e402e73cc5f0@linaro.org/

It is easier if there are other SoCs in the same family that are
already supported than an entire new platform, but we have certainly
done it for new SoC families as well.

> Entire SoC sent to mailing list on the day one of public release of that
> flagship Qualcomm SoC. The SoC DTSI and board DTS have almost complete
> picture, except few trickier pieces... but it even has full display and
> GPU! Plus, as I explained on my email on samsung-soc, that DTS/DTSI
> patchset references all other bindings with their state, so SoC
> maintainers can understand what is the overall progress and what will be
> the result in DT schema checks, if they apply the patchset.
>
> The minimum, absolute minimum submission is with the serial nodes. I
> would prefer to have some storage or any other interface as well, but
> that's fine.

Agreed. The usual arrangement for a new SoC family is to have
the minimum set of drivers (uart, clk, pinctrl, regulator,
iommu, irqchip) along with the DT bindings and the dts files
in one branch and have that go through the SoC tree as part of
the soc/newsoc branch. It sounds like in this case we only need
uart and a mailbox since the rest are shared with existing
firmware based drivers, so this isn't even the worst case
but still requires some coordination between subsystem maintainers
to ensure that all patches have been properly reviewed before
I merge them.

Any peripheral drivers that are not essential for booting
(typically mmc, ufs, spi, i2c, gpu, sound, pci) can get
submitted at the same time, as there is no dependency on
the platform being merged first.

     Arnd
