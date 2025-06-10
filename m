Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E042D5402;
	Tue, 10 Jun 2025 23:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749597120; cv=none; b=gTONNgKTQP/wbN0JWvRCxRstcTED9zCyzInS5QEU16qfD0sdWrolaGZD9eTJbXswJh2aPHRFtb2R9YUTFoiV8EErSEa0qOFqo/KNMOstgK057G6ImZxLQa0BD32GtyzVcg1vp7OSVSGyfqqv4MSsN1/CVVrTJfTSxONSNg6jvmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749597120; c=relaxed/simple;
	bh=qDJgBUcJfJgiZmP8rmKonm+Khzfd7QP8iKE+QK3IZhM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=a8Fu/aQyHW+AKcqJ4fvQxtsiIdUg4/rmlzg6toe3YA0Krl61j6D9Cydp1AoYRbnz6TKlxmlqeMkToaEVds22WYqk5DKK+G5PWyQJuOiONd4hcYfKuJhBdIYfMNEGtYrLxsTuRwe/jpV0CMLcm/ciLFn7E8YrzSVs0z93iSpWo9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=U6FbT/UJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KqzwWuv2; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="U6FbT/UJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KqzwWuv2"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2706A2540106;
	Tue, 10 Jun 2025 19:11:57 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-12.internal (MEProxy); Tue, 10 Jun 2025 19:11:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1749597117;
	 x=1749683517; bh=qDJgBUcJfJgiZmP8rmKonm+Khzfd7QP8iKE+QK3IZhM=; b=
	U6FbT/UJuUuMDXHNSX0eu51+tL4jbkR/Bm4jQPck57+6LUf7nwbq+bbvr/9HkMaA
	8DjmeR3bHQjc4pZrsVv4KuV5O12dlSxG3E0Iy99KDQ5H33dEDkhZvTGFrtxVjbN1
	tHjaw797VEIU4++5w7HUBvckQzxizluG7pZo2QI7YizbHPA4fSpz6HT5oEvV1PFO
	rvcYW9r39nUXa7oLxA5OGd7t1AVaY3Kn19qdXcx8QmqFf6g2xYuoMZXkqIU7sZ7o
	aXLEEu9ieMggVV31/k1HisecHxMT5Z0JNiFPtgKofStKR1lSNtSo8zyOxQKGc0T/
	3D83lGo8Z31ryAnhc6Y/cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749597117; x=
	1749683517; bh=qDJgBUcJfJgiZmP8rmKonm+Khzfd7QP8iKE+QK3IZhM=; b=K
	qzwWuv2hSqt/vZp7TnqVk7LwcsCZRBSh4+L5k1Evetj5/oKGEeeVZ5aW5W7N+eH/
	MAPGh53XdN3tbesaVZDejICVzYGL4AK7GrMu5Pgmnsx4DcyfA+pZEhF9VkD6SIwS
	DsmJpv7y3z/ij8MiAt2NazNoVrd2RhFssVrBRZjKgiiMHgmYeHo16csX6ymlGDiV
	35In2wwtE8p09OdBi1C29ByktGAUaqTVCkGpzzQ276xdp0UO1L+SERR/XIB2BFeH
	2cvxfky1WRwAgTJnH753Cq2DIlAj4pUW2MeY/I+hYDHTYNgSLSbLdg0qKYoYkbBk
	MHoV7PMFA09yvAkRm5QKQ==
X-ME-Sender: <xms:vLtIaGq6ewm0E1eqvnyWM2VGeRp7Cxclod77bkUsI-CkQWWDoqKKwA>
    <xme:vLtIaEq310CHc6cHGk2KFraFWWvtTpfwza_rY7gMITtxg-zqYfM5ODdl58ZHRkcGL
    kKxnizBWjFyOi9_jY8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduudefkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdforghrkhcurfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvg
    hnohhvohesshhquhgvsggsrdgtrgeqnecuggftrfgrthhtvghrnhephfeuvdehteeghedt
    hedtveehuddvjeejgffgieejvdegkefhfeelheekhedvffehnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhv
    ohesshhquhgvsggsrdgtrgdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouh
    htpdhrtghpthhtohepihhkvghprghnhhgtsehgmhgrihhlrdgtohhmpdhrtghpthhtohep
    figprghrmhhinhesghhmgidruggvpdhrtghpthhtohephhhmhheshhhmhhdrvghnghdrsg
    hrpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhn
    thgvlhdrtghomhdprhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrd
    hinhhtvghlrdgtohhmpdhrtghpthhtohepihgsmhdqrggtphhiqdguvghvvghlsehlihhs
    thhsrdhsohhurhgtvghfohhrghgvrdhnvghtpdhrtghpthhtohephhguvghgohgvuggvse
    hrvgguhhgrthdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqd
    igkeeisehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:vLtIaLPeHYaGpMIqiG6fhDRw5n6flB7bxdqkQ8VxSwCVb7Z9Aa8wvA>
    <xmx:vLtIaF4QtLwbtmk6ejMcMSwn3pxiAYwHUYQ0VshppAbfRGT5S91_tQ>
    <xmx:vLtIaF4wS_ZIIOEiqnRr_5dn1GfIXLmTW2P_Vh7CKgrSGhvN2HU25A>
    <xmx:vLtIaFioBge3fL2CkhgxZkTON-9KyTclUTjuntBDmM9mC_NjswvmXA>
    <xmx:vLtIaLHPG7Or6MiG3zjSc_VrnrPPMJKodRx_gpYdbwlqAYjU9ELH7FYv>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5B12A2CE0063; Tue, 10 Jun 2025 19:11:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T107eb5199b18744c
Date: Tue, 10 Jun 2025 19:11:36 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Hans de Goede" <hdegoede@redhat.com>, ikepanhc@gmail.com,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Armin Wolf" <W_Armin@gmx.de>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Message-Id: <002d39fe-44ed-45a4-9410-4fecf1c2163f@app.fastmail.com>
In-Reply-To: <aEiVHXI4vS9BDOPW@smile.fi.intel.com>
References: <mpearson-lenovo@squebb.ca>
 <20250610192830.1731454-1-mpearson-lenovo@squebb.ca>
 <20250610192830.1731454-2-mpearson-lenovo@squebb.ca>
 <aEiVHXI4vS9BDOPW@smile.fi.intel.com>
Subject: Re: [PATCH v4 2/2] platform/x86: Move Lenovo files into lenovo subdir
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Jun 10, 2025, at 4:27 PM, Andy Shevchenko wrote:
> On Tue, Jun 10, 2025 at 03:28:25PM -0400, Mark Pearson wrote:
>> Create lenovo subdirectory for holding Lenovo specific drivers.
>
> Assuming Kconfig entries have mostly been copied'n'pasted, the rest LGTM,

Yes - no changes from what they were previously.

> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
Thanks for the reviews and help with both patches

Mark
