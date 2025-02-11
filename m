Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336E81EF09C
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739271877; cv=none; b=U8xBXl4mH5MUvsgazfY8AGru5JfED25d9Nli+cl9Oha42+knxt2M+98KLdCybjuvTdQ+xbOflr2UkiD6gPR7Xddr7kCSbXVq+yUc7Firf+BQE6RyjlQNJZ008kq2RSVEHP2ThwX3aC93sCWafyPj2Ya0LRVfEIXmPDdjamBdl7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739271877; c=relaxed/simple;
	bh=BAHrUp9KOWQs4TErYOsec+61RB6+zLfdTuSPzPW9mdk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=kDwGLvD8xvhTdkOpFFNoxvPNbaFGsv8Wdojvo9j8yeQbLMSW/HZAuaEIYGeFedRjcKQG1Mw4VvVsN22oHHWnE1M8GAGu2KgetUzufBe+bb8Q1x+eIxRuFQ/9a++fEk1xR9ltN9OEp+GhVjYzUPQup06x9eWQ7kGlLCSZ05QNLCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=ATKFLgYa; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=uNpBef81; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="ATKFLgYa";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uNpBef81"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 21D9A138023F;
	Tue, 11 Feb 2025 06:04:34 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Tue, 11 Feb 2025 06:04:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1739271874;
	 x=1739358274; bh=iGnJkYP5+H/pd0FLN78vVHhYwNuc2RYycOAr4CSzU98=; b=
	ATKFLgYaMkd3h/6Br61u/BLzj9igPoJOa1ENUU12d6lQFLhqxOnAc8ZJ0eW88jM1
	W91QGXv26KiKt4twUWG3uLxiL2bAAGShCzSL2DHBP0cR4Qp3TOhhxQiT0HJ1I4h2
	r2OqTESYVqhk3srhqiRCkG4UgbTin7BGFJzTibSXHE9+mnBEEfwafeGOZOyWrIHl
	FWsV1du9qapWwdBGmGPJWXvOR5i1bXsb/qfsY0G/G7vGj4gc37PJ+2QabHWHNhVc
	FJCyJHR1q+hZmKtLdkZAAfWT6SFNXzvKMkP/b7ItD6pDkXlUDZXkIiQDiN3AgmZN
	D5bBnBAvHMFxI0mVmsWxtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739271874; x=
	1739358274; bh=iGnJkYP5+H/pd0FLN78vVHhYwNuc2RYycOAr4CSzU98=; b=u
	NpBef81Y7v5h8PL9tmLrNjkwS1PmUaThiAVuyIc5oNd1mCgRgVj0Pp9rMogk3ilv
	xcUSQEZrYyYNrzhHM4h8h+clcyGUAhNab4++N3Bt0hQzxHjx0q1VVKdCZwWQpgTU
	55Rv7D/EbsDAjc4q2CJ/5mh4mCZurWnkApswafAwt9QzWuAeDSjGuB34Pc9McBTN
	sJCgOMzKpkWVEDewbNJ4UmX3ZMGETqRXkfjAu9BDo1k84e5vc9d3uWSZh46Gl7im
	qs+p8K+MwiTeJrGCEVJCIv5v5k4BHIts0n8GtBpij7WujI6k2v7KFp0gF8Q+L0Cc
	oIQr4PRbVEALPXo4GxrnQ==
X-ME-Sender: <xms:wS6rZ9n_h7wZM_SVsexD0Hjr8siGGpPrcuXnFI8tbiy_asK822ssFw>
    <xme:wS6rZ40Bx8ervnIlnQ2nANrL9Sdlw7CGOh8diy8cdFDq7IYWTKytsEfp9afX3-9__
    V7gFeTYJ3-J17vsZgw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegtdekfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeh
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghsse
    hglhhiuggvrhdrsggvpdhrtghpthhtoheprghnugihsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehkrggsvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsrghrthhosh
    iirdhgohhlrghsiigvfihskhhisehlihhnrghrohdrohhrghdprhgtphhtthhopehlihhn
    uhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:wS6rZzqvfIamHrLs9Frz6jyTB06wFcGcSTK7b5eayuxj-z03CfTYkA>
    <xmx:wS6rZ9kj4GK6hM26st_Ik2qyKjQ67wZc10MOATQlzAjX8Wjt9pPdLg>
    <xmx:wS6rZ7398-83QmzidaUQTOqUF28hN6Ir_-ZjPAVImh3s9vp_rDKabg>
    <xmx:wS6rZ8tz_bH2y95f-TH7fZNarXUsXxfoGt03UPh1owxwcdNcAOdaGQ>
    <xmx:wi6rZ2QZ7-gSlJDfJ5n5AvrUYfFb6YZU8hHg0UJkNfLVQvQ9qJ_612Ar>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id AC6562220072; Tue, 11 Feb 2025 06:04:33 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 11 Feb 2025 12:04:13 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert+renesas@glider.be>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
 "Andy Shevchenko" <andy@kernel.org>
Cc: linux-kernel@vger.kernel.org
Message-Id: <6aa243e1-6e25-46c8-b75a-d5e7bc1cd5a4@app.fastmail.com>
In-Reply-To: 
 <077bd67861fe0ee246ba967a3406079373122439.1739271346.git.geert+renesas@glider.be>
References: 
 <077bd67861fe0ee246ba967a3406079373122439.1739271346.git.geert+renesas@glider.be>
Subject: Re: [PATCH v2] platform: cznic: CZNIC_PLATFORMS should depend on
 MACH_ARMADA_38X || ARCH_MVEBU
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Feb 11, 2025, at 11:56, Geert Uytterhoeven wrote:
> CZ.NIC's Turris devices are based on Marvell Armada 385 or 3720 SoCs.
> Hence add dependencies on MACH_ARMADA_38X and ARCH_MVEBU, to prevent
> asking the user about these drivers when configuring a kernel that
> cannot run on an affected CZ.NIC Turris system.
>
> Fixes: 992f1a3d4e88498d ("platform: cznic: Add preliminary support for 
> Turris Omnia MCU")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Drop PPC_P2020 from the dependency list.

Looks good to me, one minor issue:

> @@ -6,6 +6,7 @@
> 
>  menuconfig CZNIC_PLATFORMS
>  	bool "Platform support for CZ.NIC's Turris hardware"
> +	depends on MACH_ARMADA_38X || ARCH_MVEBU || COMPILE_TEST

Technically the MACH_ARMADA_38X check is redundant here, as that
already requires ARCH_MVEBU.

     Arnd
