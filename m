Received: from cloudserver094114.home.pl (cloudserver094114.home.pl [79.96.170.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62A02749C0;
	Mon, 14 Apr 2025 15:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.96.170.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744644341; cv=none; b=Mq9ho698zE2p+pTlmf+HXQiKVyCEeC0n9yMMtTdbVkdCt0CdJtWzXFhXOzhjWLaXYI8Xxs4zkfhT0OsN8UqLMWZZfhu5pojmBtROdLbxUJXcy7AdlWI85Aja63+oig3wzcWauA9RY3r5tXWOfHbIvqfwwU0igPrK5bjSWBP3WNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744644341; c=relaxed/simple;
	bh=cdtlU6lp8CCmhUzL7XpoyeqgCaeFyBKoSMU81k3GxHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mmHYxNdZcjs9EKmTbU0PLvnO3CkuJTLsbHs8gNsG/GBsbQz2XQIXDITSIdQDmRiUMprmJqNrk44+a8T5RDuTBrEAQi6XTG0ynK+8TJIPoY2Ki3E0FONH4Kx14tCbD+huKisJIUj4reeAH1lCkGbNyCm5lLv34LL/Q3gdbPLOYGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rjwysocki.net; spf=pass smtp.mailfrom=rjwysocki.net; dkim=pass (2048-bit key) header.d=rjwysocki.net header.i=@rjwysocki.net header.b=DW1gvU/R; arc=none smtp.client-ip=79.96.170.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rjwysocki.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rjwysocki.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rjwysocki.net header.i=@rjwysocki.net header.b="DW1gvU/R"
Received: from kreacher.localnet (unknown [195.136.19.94])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by cloudserver094114.home.pl (Postfix) with ESMTPSA id 377D466258C;
	Mon, 14 Apr 2025 17:25:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rjwysocki.net;
	s=dkim; t=1744644337;
	bh=cdtlU6lp8CCmhUzL7XpoyeqgCaeFyBKoSMU81k3GxHs=;
	h=From:Subject:Date;
	b=DW1gvU/R2v+K2WueQ6nVrZes0cd2dSqa/5tcxj92sCVTZeAARTFJwyAMaud4ol/yN
	 g8ytItvmjlpHar/t33KFD1M40OFsAmbem7YjtJJKJ5DbeEha9qUi+MNnFpbb+nDHIx
	 p1vzk8fM2YsB5e6tahCam0TkkEVPPMeIlOfpwhHDalQWiNbLe+LN2HyK58uD+JLstz
	 aMk2pgEG9l7VdzpJ+5IAMC1ucsQkZv+PbWap7bKOJPuS475RdEUwPUJucYjLJWiJE9
	 V8A7IuW3MelAeSrckD4JOd43wYnkLRgdu0nyDZD6xnYlafVcjU/lI6QiP07ELm9sDg
	 9t3kEUG+W5x+A==
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the pm tree
Date: Mon, 14 Apr 2025 17:25:36 +0200
Message-ID: <5016241.31r3eYUQgx@rjwysocki.net>
In-Reply-To: <20250414115759.3e203c23@canb.auug.org.au>
References: <20250414115759.3e203c23@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
X-CLIENT-IP: 195.136.19.94
X-CLIENT-HOSTNAME: 195.136.19.94
X-VADE-SPAMSTATE: clean
X-VADE-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddtledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecujffqoffgrffnpdggtffipffknecuuegrihhlohhuthemucduhedtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfgjfhgggfgtsehtufertddttdejnecuhfhrohhmpedftfgrfhgrvghlucflrdcuhgihshhotghkihdfuceorhhjfiesrhhjfiihshhotghkihdrnhgvtheqnecuggftrfgrthhtvghrnhepvdffueeitdfgvddtudegueejtdffteetgeefkeffvdeftddttdeuhfegfedvjefhnecukfhppeduleehrddufeeirdduledrleegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudelhedrudefiedrudelrdelgedphhgvlhhopehkrhgvrggthhgvrhdrlhhotggrlhhnvghtpdhmrghilhhfrhhomheprhhjfiesrhhjfiihshhotghkihdrnhgvthdpnhgspghrtghpthhtohephedprhgtphhtthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprhgtphhtthhopehrrghfrggvlhdrjhdrfiihshhotghkihesihhnthgvlhdrtghomhdprhgtphhtthhopehsuhguvggvphdrhhholhhlrgesrghrmhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlhdrohh
X-DCC--Metrics: v370.home.net.pl 1024; Body=5 Fuz1=5 Fuz2=5

On Monday, April 14, 2025 3:57:59 AM CEST Stephen Rothwell wrote:
> Hi all,
> 
> After merging the pm tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> drivers/cpuidle/cpuidle-psci.c:453:53: error: expected ')' before '(' token
>   453 | module_faux_driver(psci_cpuidle, psci_cpuidle_probe, NULL, true);
>       |                                                     ^
>       |                                                     )
> drivers/cpuidle/cpuidle-psci.c:426:12: warning: 'psci_cpuidle_probe' defined but not used [-Wunused-function]
>   426 | static int psci_cpuidle_probe(struct faux_device *fdev)
>       |            ^~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   a60e3d71e4d4 ("cpuidle: psci: Transition to the faux device interface")
> 
> I have used the pm tree from next-20250411 for today.

This should be fixed now, thanks for the report!



