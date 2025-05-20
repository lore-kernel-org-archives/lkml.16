Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A4C1C8603;
	Tue, 20 May 2025 16:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747758152; cv=none; b=sMAfRRSeCIfyiG1SFULWM4N6H+/XNI56sr8opi8kBQ9LoM/BHAjGZH6TjhJVwJG2itad14pFTnsdxFmWuRK5C3QKyH18JH8nGVtSM9C4lyva0M9TOFWL9zvzqLe1jQZTS5AKoN69CLpQ0h6O+HrrgQFZZDJdDytgOsTOAD10lVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747758152; c=relaxed/simple;
	bh=naEzOodXmNB/lHuYW8b67sTBk+ID1df/XbMzjhsiUqE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=l7prp9a2YOb/480s55+wMDYhNfB++CaGp54+Jfk3W15OjsqD0tSmlDwkoTQuqRU3A/S48tzfrcvPxSDbKddP8CS1b8HHg1voNxZUFTdJQdEh6LsjBoqrPHFaPaRQ3MHYKhKwabyTx7AcBul0kN9DnUmR8PT18mcGLTr/hbhoeis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=3/Qu47xI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=au5aQakf; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="3/Qu47xI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="au5aQakf"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 87321114014D;
	Tue, 20 May 2025 12:22:27 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Tue, 20 May 2025 12:22:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1747758147;
	 x=1747844547; bh=AW5lpl+/XmJrf0OsSrunvwiIR/VhyXtbnxD6RHQ8TH4=; b=
	3/Qu47xIupPdBUTcaVsklFFx7ApHU9s6U5DdAO1ZbTkkJ6Z/FK7PWV3QWHdCMx5O
	IBBlZZ+MYLwLGjlqaKm57msrFwp5vEL8M7Ls8hmRgRx+GWxQp59INQ8IU3aDDVTD
	UuQW3nbEAbmg8RhabU8GTr/eBoNeuYUq7/X4nEftEv/ZIQ5sD4cO7hS8TQ9uCKnu
	Lc/nHBRk1splgnZ6KRk/iaRWVAFwp/YiefOntfvOdhHEFfE4qgwR26OAp4xdhnLK
	/Um5H13bwQwNMp2LAV/aaDD70Dxjx5ay5whoKzSQ1obXoD/Tc6AkmJOA7M2aPudV
	9xvemaxwV51XV7IDahfgbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747758147; x=
	1747844547; bh=AW5lpl+/XmJrf0OsSrunvwiIR/VhyXtbnxD6RHQ8TH4=; b=a
	u5aQakf0UoI0H6+esJjmWk6VVL4fIBmYLL3kOE+N9jUGeM6Y6pYSwrNqsMbqMlND
	A7BKm9NT2dSW0EnfXNKw4lsE539pmrrjHnB4zFz0pMuzC8EkL237b/xHccsURdF/
	tsQIqdGMFziYgo8JAhE8pKHHo6S7lYzo+v1KMGUYZLn0SU7z7JZ//ohOdwf/kJed
	D/7++TRrEzmg3yFtEI0SEyvVMHfzQ3NeQplt331SNPZZ5VJkpTwImj/ii8cd7mmg
	gj5fuCqn+h9jrw20NBDqzHvAkTI7Mrh6/2hWOIAqu3Jx+MY+NI8UQjKmAaymIB/k
	ppefkdXQZ2e8fLBhuTFEg==
X-ME-Sender: <xms:QqwsaFCR8qJPK1AjziCbjohCb2kgD31TKRqP4ftmmUXTp1O-3Xojfw>
    <xme:QqwsaDjbi-1oy3MVX-1722B9n-1k7QXSj8AKyn6L-hYnWU4NYHyoLSDEmfmB6_Qs9
    cUzukreNQ_N4SocYXo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdeikeculddtuddrgeefvddrtddtmd
    cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghn
    shhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtne
    cusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghf
    ufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoe
    grrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudek
    teeggffghfejgeegteefgffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhn
    sggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrrhhnug
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhfsehophgvnhhsohhurhgtvgdrtghi
    rhhruhhsrdgtohhmpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgiipdhrtghpth
    htohepthhifigrihesshhushgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhn
    vghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqshhouh
    hnugesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:QqwsaAn_gGqSoUf0ng_tU4jjVT0xbIidP3nD07O65iuuE9ipKUlYcw>
    <xmx:QqwsaPwYPm00xPuJpfF_zibClRK5ketQ47LhWiU-1c97zIvZLmvHiA>
    <xmx:QqwsaKTPdhqaEcA-WDOTK_GSph9ezs9n8AzGUg6sftMdVL6yKl4ZzA>
    <xmx:QqwsaCZdOicFIo3VPdNeYGUVxVkMoKpOph_Vv1tbFz2nOMlqMOvfoA>
    <xmx:Q6wsaKJbOmtR49r6gj7hzg-1nRgxMfXEiCiUrax06qmqWPM8oRUmOKSq>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 85C741060060; Tue, 20 May 2025 12:22:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T2bc9d7ffe1879561
Date: Tue, 20 May 2025 18:22:06 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Richard Fitzgerald" <rf@opensource.cirrus.com>,
 "Arnd Bergmann" <arnd@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <882d4fee-ce81-41bd-9b4f-12efe0299257@app.fastmail.com>
In-Reply-To: <6611093a-5add-41ef-8604-f3b8343d663e@opensource.cirrus.com>
References: <20250520152702.1976221-1-arnd@kernel.org>
 <6611093a-5add-41ef-8604-f3b8343d663e@opensource.cirrus.com>
Subject: Re: [PATCH] ALSA: hda/cs35l56: select FW_CS_DSP
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, May 20, 2025, at 17:55, Richard Fitzgerald wrote:
> On 20/05/2025 4:26 pm, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> Fixes: 849c83fe4991 ("ALSA: hda/cs35l56: Remove dependency on COMPILE_TEST")
>
> But the error messages above and the change below are for CS35L41

Sorry about that, I think I found the correct cause now and sent a v2.

      Arnd
