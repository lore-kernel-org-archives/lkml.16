Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B6320FA9C
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 09:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746868235; cv=none; b=iO3kEgzP4FDU0J8Kc9Cm2LuKAFdQBIfe9IEz95gFc2aqXa5Lvz9KA/h3VACtPenGhl1r800A3eseZy8YNeojm6rHP9AzDLoT6seXQ/DpdKRVxH4grOJCcoVRBxKq/oESiPnhUmfciGLKGMy3g3eLRT1qHHHW8eLdovaXAodbILo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746868235; c=relaxed/simple;
	bh=PZRHZy+ByjIBVYSql3k2lpizr50zfU+ErO3joXOqMfY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=epQsfxgTfS9inHZYhsnbbwjNBZpSsu53R+qfkv2ZEOEv6YkymkK7UL+9j2hWDsJYaJEX6R8R+j01mK3fgHkJjgsSLQEvAe0qIQWtqV/kVDIeNjzG361n+0QVbyuhIvPtmweNmH1mLRrvoZCUP1HmmHy4SBweoj4Ug/xuuxHr8Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=vV3ddkgF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KUUV0YFq; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="vV3ddkgF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KUUV0YFq"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id B19C51380219;
	Sat, 10 May 2025 05:10:30 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Sat, 10 May 2025 05:10:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746868230;
	 x=1746954630; bh=J/usAa3ugAZIjJYLsxHYOSULEojmL5VZ0pEYBLSRHXM=; b=
	vV3ddkgFKEHcfcSZGSYqSQqBLf6vZ4iKq3ArwPPWSFEkEcooheiQMZh4IJm+1SrE
	qJprdl8STpQiMS/MeVePuQ6Old43lRhBxctrvQyD6q2A5e+2Pdv9jrV/tXp3TRZa
	sqSBOoxaooKWLwdwuS5c507KNqYZYBldVvm7nEZl7juL2cLEWO93/Tfqcv8LKFYG
	RNImc0MXgia9uMgAdt6aW91TaybRdMLYb/zSYUT/O3aTpAd2n7eWH+/KGzhtmCCI
	QpuTWIOnAJkUUm75KjSQwfdLL87KGPCs5kRvzA/5/pmNZRf4kkBJPaRGHAV2qoUM
	OtkOmxphNEd/re7Q8zXMPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746868230; x=
	1746954630; bh=J/usAa3ugAZIjJYLsxHYOSULEojmL5VZ0pEYBLSRHXM=; b=K
	UUV0YFquy39Yyrr3cst2+NOpWgEyVwRnBk9b4x4kipuElGUiEGtZNHbe+4PBthVz
	SK15zHtrZGvuXFsbIvf5KvC9qMzvlHEJlhicl+BuJ7zcd5BYjxfOrU2tk6zMsa95
	+JP8bKPqqGAeTVaEv146ql6NVXScV+gf6hHuDJ3RlqAOUwHWY2REAOR+v1ezFAfL
	z81f/AQlB1Lo8UM/dbc3R/cM/E24pJvrWkRCr9gouHZ0Me0IWgIsPtjdJHY7y/Ch
	5QzMRP8JnCEANDEDYHBn8fxdoXp/bAChq3Px3oPHhPDQeEUmBsI+s2iCGwWOB05k
	OOx90weO7+olmGYSv2pMA==
X-ME-Sender: <xms:BhgfaE7jcImWtG4v_bO_B3AdW4GF2xx1CytJfUBduyHIMb_y1MkM9A>
    <xme:BhgfaF74JmmW1H9Hro8TizIQYIYwH8whhG7-7AE-6vpKfBgbN0qmTnwP38BOvUGfR
    IY7eI97KvL1Bk5270Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleehuddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
    tdejnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhepvdfhvdekueduveffffetgfdvveefvdelhedv
    vdegjedvfeehtdeggeevheefleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    iedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgrnhhnhhesghhoohhglhgvrd
    gtohhmpdhrtghpthhtoheprghrmheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshho
    tgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgvnhhsrdifihhklhgrnhguvghrse
    hlihhnrghrohdrohhrghdprhgtphhtthhopehophdqthgvvgeslhhishhtshdrthhruhhs
    thgvughfihhrmhifrghrvgdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlh
    esvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:BhgfaDeMxDowa-e2xFoudRsyu_3jAxrrMMIw66E5ZznlbYphQc3TPA>
    <xmx:BhgfaJKJQNVK0THZ3_k6ByEeRLqD4yCqX6tjZkSmNvfmQiB6GqlW5g>
    <xmx:BhgfaIKD73Lf5m_af6LvA_-wtVx5wzuPg3JD_O4nOS8kRio-Y4uYYA>
    <xmx:BhgfaKxm4Jhhb0tA4aFHeeEkvvQTjtuEXFj-dAKXuPBz9ZV4lvAV6Q>
    <xmx:BhgfaB5bzj2YVdxPCIHRwxoXV2hx504ISgEJQEXye-3FYyzdhqyINrtj>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 424191C20067; Sat, 10 May 2025 05:10:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T91d942121878fe31
Date: Sat, 10 May 2025 11:10:10 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jann Horn" <jannh@google.com>
Cc: "Jens Wiklander" <jens.wiklander@linaro.org>, arm <arm@kernel.org>,
 soc@kernel.org, "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 op-tee@lists.trustedfirmware.org
Message-Id: <a877f411-f6df-45dd-9cf2-351d785db4c2@app.fastmail.com>
In-Reply-To: 
 <CAG48ez3JEg11GZTzmSHeXEDVz9vN68vWjTH+2sq_6+8eK0zkig@mail.gmail.com>
References: <20250509065114.GA4188600@rayden>
 <e5bfb069-6adb-4757-a52c-bb3635990686@app.fastmail.com>
 <CAG48ez3JEg11GZTzmSHeXEDVz9vN68vWjTH+2sq_6+8eK0zkig@mail.gmail.com>
Subject: Re: [GIT PULL] TEE updates for 6.16
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025, at 23:22, Jann Horn wrote:
> On Fri, May 9, 2025 at 11:14=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> =
wrote:
>> The second patch looks like it should be a bugfix for 6.15 instead,
>> any reason to have it only in 6.16?
>
> FWIW, it's more of a cleanup than a real bugfix; there is an unsigned
> integer wraparound, but if that occurs, we're guaranteed to hit a
> memory allocation bailout pretty much immediately afterwards. So I
> think putting it in 6.16 is reasonable.

Ok, I see. Merged now.

     Arnd
