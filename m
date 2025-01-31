Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624A79463;
	Fri, 31 Jan 2025 07:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738308548; cv=none; b=U4eLdkux8DjqhmpJC2ol8ippUFAQzpmYmAOvXTjgnqZ6dNGtLuHrYH+P8lGWIHrNM6YeCvssQ/KPiwhhuQAw71Vr1UT2BImWVoAOU4dzlVB6xcSIhceNnEp0GwlfZ75gPvzIa8rOq2Gd1doIpWGtlEiVOvUrSxZ7VKv7kUNPRh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738308548; c=relaxed/simple;
	bh=n1e0P8AWdOYfLOZrT8Fuz1IQgDTJjovT6OSuGagtroU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Zax057F02BIDZFwO3Mec1UvilIMA04KJCI9m6tSmq3NXpztLSCNsO7WI5EaClAtqRlGIMSA6awoQqUg9lKrZY/udWF1seX+P0Bre5S3UCpLFX4fYOtaQfC2nVT5ZCW/XTB/ZuzFaSDoAk6htV6Qf/GI1Qhu+e3y8FWiiZ5QgAyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Vxqz71MV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=zGjsRWJY; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Vxqz71MV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="zGjsRWJY"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 67F7811401B7;
	Fri, 31 Jan 2025 02:29:05 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 31 Jan 2025 02:29:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1738308545;
	 x=1738394945; bh=H6OFu2gyiy12pYSxQBaXN//26LfwCcvIWXXGaq2MhNA=; b=
	Vxqz71MV9C/pofJNczthGOKhdj1IH5NPxjUNJ3jO3vNkaDscjsiqEYqHXZBaE/9l
	a3uEItjZZB2qpeap99MMtVrL2wxXsvOxPdf+C1btefCfc+qade0BzdJPqR7TfZCY
	tJhXJOu2VlkshqVjTw+CgkbsPibtK41ZUdtvl5mVmTECJRDlTUSeo5UDu6okNVBv
	ik1ZMXwF34axm/d/o50Yk0X4IRZ1zhrsEfws9LteJ1OW77Tq5uX8lHOTqGT7ddrA
	oQ7sJAwalJZ3M3A7WJwN1BCV3SaMBjw/9BI8yMA0bnVoIWhFjqsDohygrkB4AImF
	WF23TeRMTDCc4MMnTxruCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1738308545; x=
	1738394945; bh=H6OFu2gyiy12pYSxQBaXN//26LfwCcvIWXXGaq2MhNA=; b=z
	GjsRWJY8Vgg93NmMU/4mfYcQsw5BNx8XT+oxWbTsOKnEMnEe858eBgJnO5IE29NY
	e5k7XU8loUM8GgzSusqNRrhDb3NwTd7mpxFC81dZBshR6Ur984lxwk0/KI8j+3Pe
	QNxOBwJ+baYxqddycNCmSGSl6Zu1SCLCqtAQNCj0LbMFRIWxrWdLSAqofRqTtXhE
	n+8fruPxBEl0s9i2xWMfCSDnqUMeT4UDiYCS54OPRvrdWiyfcl0hr3mxjKB3riB/
	NFPV5d+ozQSe2Bf8YHPhHigh2clyKdNplLG0pQNXt6XNQVzw9eLc5snaaQhSJzDW
	fbLu3NrYwisrDYU+wVkcQ==
X-ME-Sender: <xms:t3ucZ-PMr7ydazt0rmfJfw2ELUz7LTSiyUVLB2gLNMSaB45Gz9PyFw>
    <xme:t3ucZ89KKEyHQHsG94B-jtLXEyrAyi8o5L7zu-cPKuIjhGc0m4t28sgQXskO0vRSC
    pA_B-DLZQR9R51hPvI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohephedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggvlhhlvghrsehgmhigrdguvgdprh
    gtphhtthhopehjrghmvghsrdgsohhtthhomhhlvgihsehhrghnshgvnhhprghrthhnvghr
    shhhihhprdgtohhmpdhrtghpthhtohepjhhulhhirghnsehouhhtvghrqdhlihhmihhtsh
    drohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehlihhnuhigqdhprghrihhstgesvhhgvghrrdhkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:t3ucZ1QskhCosPDBr4GPBAez-Awm6kNNoQ-VKUMahZdvvVTLJ3nMVQ>
    <xmx:t3ucZ-vDY1wTSHGA53xPo-OutVL2Ke61SInuTHPOqyxUUBBbWD_qGQ>
    <xmx:t3ucZ2dRZ5ssJ4-28hDuCJ5ngrvuP795K5cwQTALUHbfERI23cJEnw>
    <xmx:t3ucZy3P-ts9Z0i4ZjO7T26656k7_a-74dKhgYsb5MfA11vvO45PIQ>
    <xmx:wXucZ6FB2UA0xJUQasmrfaTgQ26ARAt4vEq0cKzmNgEnFtvjkgi7w577>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2512F2220072; Fri, 31 Jan 2025 02:28:55 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 31 Jan 2025 08:28:33 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Julian Vetter" <julian@outer-limits.org>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <543bd0f6-b25d-48b4-8039-496b8ddd10ce@app.fastmail.com>
In-Reply-To: <20250130134825.2646380-1-julian@outer-limits.org>
References: <20250130134825.2646380-1-julian@outer-limits.org>
Subject: Re: [PATCH] parisc: Remove memcpy_fromio
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jan 30, 2025, at 14:48, Julian Vetter wrote:
> Fully migrate parisc to the IO functions from lib/iomem_copy.c. In a
> recent patch the functions memset_io and memcpy_toio were removed, but
> the memcpy_fromio was kept, because for very short sequences it does
> half word accesses, whereas the functions in lib/iomem_copy.c do byte
> accesses until the memory is naturally aligned and then do machine word
> accesses. But I don't think the single half-word access merits keeping
> the arch specific implementation, so, remove it as well.
>
> Signed-off-by: Julian Vetter <julian@outer-limits.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>

This one looks fairly obvious. It might be nice to also
clean up the {in,out}s{b,w,l} helper functions in the same
file, but I don't understand why those are special
in the first place.

Those functions have been unchanged since before the git
history and there are some comments that I don't find helpful.
One thing they do is to deal with unaligned memory buffers,
which the generic ones don't, but that could be easily added
using get_unaligned/put_unaligned, expecting the compiler
to optimize the memory side of the transfer.

     Arnd
