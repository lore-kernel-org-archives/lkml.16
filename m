Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682781EFFBE;
	Wed, 14 May 2025 20:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747255138; cv=none; b=kGL/I+7045twAIBFHtQh9DEsLHOok8YWbo5WcAQLP0aenVjKPMXfz0UXx8EgND0ickMvd9XhgsW8NbMNTp/yFTc1gbdFC+q4VPiUV3gigv0E3Pqze9I8aqss6RdRcrlUsq7K9D1wJYIBoQZuf9X/1czh9jGxd0Q4x89RMzsjDcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747255138; c=relaxed/simple;
	bh=Hhes5VHwsLittF2J3kFmZbR48iD5VNibK1jaZEbtyh8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=mSi8Cm907gk67f4ja080iuGCM4guRvNxF6bceTywemt1hKbSgO0KxdqDVmiqnuTx2xaP3yVU+f/98ZsYJaTvKtWmSQvmIGJG4bL5ww9Wm5C9fufFRDLVpb0X1ZTkiJmg7o/CtvwWnu7WaVundVEKZ7AUHxhjo6nM74p51/VatUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev; spf=pass smtp.mailfrom=svenpeter.dev; dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b=gIkhnSjD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eL11UxC+; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b="gIkhnSjD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eL11UxC+"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 829A611400DC;
	Wed, 14 May 2025 16:38:55 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-04.internal (MEProxy); Wed, 14 May 2025 16:38:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1747255135; x=1747341535; bh=hshJilJM1JyPorgPX6dw8qkPCbGQDgkU
	1Npy+ZQKRC4=; b=gIkhnSjD08iZtboMwCqiApxMWfCl5H9D5JxGZKFq8dkS9o0Z
	YvKomnHWe54h9pLdnneVSKAjDGJDGndnBmEUrmDJQk/Yuhz4/dWqVi1L0RhoNC65
	4BpcmTOTx7BMi/JOwsr0bpx8si3XgI4znuaXasqb1czy4Kgc6kLXjKSGaZUf1083
	FNiSA7/D3OwUK2ggercFqG0eOJXntWQmeOlrFe1vavSOFp1PQGMl6H7dmwcK1Hnf
	Ln0z3cI3zqHmVag1WiR8doQ8Fr4khP+PQ/G7nrd36+lII/T8gB+B+0occBse2BJj
	a0tJ7+8Qh7cZinU1hm8I1jIIedh/k0fdnM5jLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747255135; x=
	1747341535; bh=hshJilJM1JyPorgPX6dw8qkPCbGQDgkU1Npy+ZQKRC4=; b=e
	L11UxC+y33WuKPm+6RNzbwHIuxb5ebXizkysonvlyKvE/B4+Div59Dtaq+CnukwG
	gKClgoakQ6ZnIo7nTeRbwi/vuOtcSRSA2m8SKwSOjelAzBFAsGgj6gXC+2hKjTak
	ZROH7MCqd5Jln+a0BTBoDvM2scmjJgQ5YwAXhVmxM85eF9AJUz+WtSHymXBw3fsL
	AqtoVa1D/ksFwzgLZuNzQ5TTdaw12+jnPjfgE+M1csQqsmQNPo6YueuFpGH+7vTT
	684WYInIuzxad9a9OM1Q2ZiMO3kWtV6JzdgaCXNlvKMpOW1anuyReiuHrmWVQw1k
	ShHBORlMVB/hV5ke7vK+w==
X-ME-Sender: <xms:Xv8kaH0vCettaoZYE6XBXIl7Y_i0tY1v-rO-9_MUbqyMsmfPIrPLTg>
    <xme:Xv8kaGGixchVGz2D8MU28salbNpON3jzeMVALY3TL9JrQDg2qygRTB9PV2aTzu5eV
    q06dKXCp-cAQ75ZWWg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdejleejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedfufhvvghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvth
    gvrhdruggvvheqnecuggftrfgrthhtvghrnhepleefteeugeduudeuudeuhfefheegveek
    ueefffdvffektdffffelveffvddvueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhnsggp
    rhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhqohhuse
    gsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehnvggrlhesghhomhhprgdruggvvhdp
    rhgtphhtthhopehjsehjrghnnhgruhdrnhgvthdprhgtphhtthhopegtohhnohhrodguth
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrh
    hinhhivhgrshdrkhgrnhgurghgrghtlhgrsehlihhnrghrohdrohhrghdprhgtphhtthho
    pehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdroh
    hrghdprhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:Xv8kaH6h1dJNCvTU9hWQf7ZFYL0svD1K1AsdUm5VlZDth3lW302XQQ>
    <xmx:Xv8kaM1iGB0gvattQ-pqWDk9WpMWjikFuHnx0ubIcgHaPc29IL9CIQ>
    <xmx:Xv8kaKEDZmPrqsFb1KLDqA0VeKY-iB7s4BVKsVKh9GJlhUm_uHzI6Q>
    <xmx:Xv8kaN_NBHFVYew2eUO_ju4iJY22znUnI7hhoK8ALNEw_alwjxmSog>
    <xmx:X_8kaKsyjFxxjmyTIar3L9AhK6KV-TuzsDCoXbcZZQRKFlPbu01CuDuv>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9B799106005D; Wed, 14 May 2025 16:38:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tcdd0f146f03b0d0c
Date: Wed, 14 May 2025 22:38:34 +0200
From: "Sven Peter" <sven@svenpeter.dev>
To: "Rob Herring" <robh@kernel.org>
Cc: "Srinivas Kandagatla" <srinivas.kandagatla@linaro.org>,
 "Janne Grunau" <j@jannau.net>, "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 "Neal Gompa" <neal@gompa.dev>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, R <rqou@berkeley.edu>
Message-Id: <b336221b-e1fa-42d8-a879-bda178f73735@app.fastmail.com>
In-Reply-To: <20250514203246.GA2958656-robh@kernel.org>
References: <20250510-nvmem-dt-v1-0-eccfa6e33f6a@svenpeter.dev>
 <20250514203246.GA2958656-robh@kernel.org>
Subject: Re: [PATCH 0/7] Support exposing bits of any byte as NVMEM cells
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Wed, May 14, 2025, at 22:32, Rob Herring wrote:
> On Sat, May 10, 2025 at 07:44:40AM +0000, Sven Peter wrote:
>> Hi,
>> 
>> I'm preparing USB3 support for Apple Silicon Macs for upstreaming right
>> now and this series is the first dependency. The Type-C PHY requires
>> configuration values encoded in fuses for which we already have a
>> driver.
>> Unfortunately, the fuses on these machines are only accessibly as 32bit
>> words but the Type-C PHY configuration values are individual bits which
>> are sometimes spread across multiple fuses.
>> Right now this is not supported by the nvmem core which only allows a
>> subset of bits within the first byte to be exposed as a nvmem cell. This
>> small series adds support for exposing arbitrary bits as nvmem cells.
>> 
>> The second part of the series then adds the nvmem cells required for the
>> Type-C PHY to our device trees. While it's technically independent I've
>> included those changes in this series for context.
>
> The idea in the DT is normal addressing is byte-wise, so the only thing 
> needed to specify bit level addressing is a 1-7 bit offset.
>
> If you have access size restrictions, then that should be handled by 
> your driver. The nvmem layout shouldn't change because of that. You 
> could perhaps define the access size with 'reg-io-width' property, but 
> really compatible should imply it.

fair enough, I'll just handle the unaligned reads in the driver itself then
and adjust the offsets in the device tree.


Sven

