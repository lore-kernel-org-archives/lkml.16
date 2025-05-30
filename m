Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697E51E515
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 15:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748617454; cv=none; b=JSJ1PGm0eKl702C8I96MRKClbDR25hIu5UT+x1ktXdd5M1wLxp0QA6mtOam8sCPe/BzKDrS4qtzkOPsx9TUxj5ax+gplwPrY+WHNEsyVOxiST0k44hR+9dUI1Yv4WLxCnvTGtnu3b+FQa+6xYEZ4TKWJyEm3MzR1WzKROgH+QeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748617454; c=relaxed/simple;
	bh=KALkRHWr2x7oc2NfUJmDl9Xk3d9z8IS4JawLoIptgoU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=qiSOsm8I3glcfsvspqAdTAMT0TV6le7amTUQ5r0dwWYQ2WqOugbnek5Mrzxt/6aRX7qpvrCyBJqQR7+b8MnwZ/YuQdxQicERgpfUsjMqb7sTQCvB+Gh0pW8a18PSv2fdyAfSond3uEI/+UxyGSqA62APv0IUkr7sYwIARoKLM+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=QBtOCxq9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jU7y2yoS; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="QBtOCxq9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jU7y2yoS"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 1813F1140178;
	Fri, 30 May 2025 11:04:10 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 30 May 2025 11:04:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1748617449;
	 x=1748703849; bh=KALkRHWr2x7oc2NfUJmDl9Xk3d9z8IS4JawLoIptgoU=; b=
	QBtOCxq9do11N460argK6gxYJQQgamiGMYhP+WkMtjou6hdHaZId5Lji4cGBvJTs
	qByRoPnSmF7ts1QIXMKdVCEN9ZfqAXWm8JRCJeOaBv1Sl5f9G9v8qCuOTQFc5JnX
	mBV5mrAW8GZyg+3DMwygiXrBCHDGmOij2HI6sVwarFi++OoOKgb5he//21XgHspd
	ovzb0eWMMYxNzMRHkjku4IoV3+xfXwLs7j1GJpYCGnYNeDh7EqwMRr3A90bsLBmL
	ywDuo7cQuv3b04JnrncZW6pbt8oteGrvJ0K7k7iBHzHATy6gSpDkJ3L4ny7TI5D9
	Xne4oaShLbQ95ho3eOzPDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1748617449; x=
	1748703849; bh=KALkRHWr2x7oc2NfUJmDl9Xk3d9z8IS4JawLoIptgoU=; b=j
	U7y2yoS+dyun7wHJ6cLzj4vifsyBwIFjOBpTMa6i5nsrKSVqB55zTqtp0zinMbn0
	0SZYVz9/AoOtEYI82YqeMj8ROlvFl+1rD2/BTzpjkSna+/5uQE+s/Arl/6XRve9x
	u5I6JbCOWL13OBhzhcPy/9RdQiDvrrH6SN3vlcZvycaq8JC2ts73ra35C7/wuZ6C
	6lUR9GLhDM18gFUw+HFoZOObrFBUmn6TOZZsuP9n6wqbylmoJ7STLinbFUpdMmK4
	xmjNvMqys0o9e5cpUOla8LLeKo84AYajjKfus5+rIXDIkNxkybwZpfM8db+LbVhC
	eveGlG2pxJ8Z2xCdJxwbA==
X-ME-Sender: <xms:6cg5aFq57vf4FojijZQkOTa3L-su3drEJpN3nTF-6O1DlncF2-yq5A>
    <xme:6cg5aHrjGT4ZanblcA1S-fOESExth9HFvvusYohN-YJF-OyxTsxH1aB_N9uBXexx3
    6VcT_oJfGuKrh7BfpA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvleeffeculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefk
    jghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfd
    cuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpefhfeejhfevudeg
    keekjeevgeetgfevfefgueegtdekudfhgedtgeegtdfgheffkeenucffohhmrghinhepgh
    hithhhuhgsrdgtohhmpdhllhhvmhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtph
    htthhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghtrghlihhnrdhm
    rghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtoheprghruggsodhgihhtsehgohhogh
    hlvgdrtghomhdprhgtphhtthhopegrrhgusgeskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhs
    thhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhlvhhmsehlihhsthhsrd
    hlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdr
    khgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:6cg5aCPPPSuQPYWQYAyNuIW6hNzIlvl_JHjTVJFd8dbo695Oq3ZZQQ>
    <xmx:6cg5aA4QkoRfDrBZTcEBMWYBNvE1k2JL51BICdjV-Nbsj4W3JuSAJw>
    <xmx:6cg5aE4uydm8M5CyBeFYHp13m3t6cwb7-07tjkqP5ZDhshX09_so_A>
    <xmx:6cg5aIhnEU_CWBGCEtINzFb7M2GOpwsGc8Zo-Cu3HTqK-_4rDxvNdQ>
    <xmx:6cg5aK_Sc856ITTyjWvdzqWctIyz-i-Zoh5H7CwSeb2UeGjD1mVu0VOf>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 748F3700061; Fri, 30 May 2025 11:04:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T5be5ebf0a6c00b33
Date: Fri, 30 May 2025 17:03:29 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ard Biesheuvel" <ardb+git@google.com>,
 linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Will Deacon" <will@kernel.org>, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Nathan Chancellor" <nathan@kernel.org>, "Ard Biesheuvel" <ardb@kernel.org>
Message-Id: <35249898-a48f-4a9d-b586-2c6231136b6e@app.fastmail.com>
In-Reply-To: <20250529073507.2984959-2-ardb+git@google.com>
References: <20250529073507.2984959-2-ardb+git@google.com>
Subject: Re: [PATCH] arm64: Disable LLD linker ASSERT()s for the time being
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, May 29, 2025, at 09:35, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> It turns out that the way LLD handles ASSERT()s in the linker script can
> result in spurious failures, so disable them for the newly introduced
> BSS symbol export checks.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/2094
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

I have lld-21 from apt.llvm.org, though with a slightly
older version at the moment:

1:21~++20250418112422+c609cd2df981-1~exp1~20250418112440.1395

this version still hits the assertions on the bss symbols, but
I guess we don't really have to worry about pre-release builds.

I checked your patch with the latest ld.ldd-21 and an earlier ld.lld-20,
both work fine.

Tested-by: Arnd Bergmann <arnd@arndb.de>
