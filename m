Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFFBBA2E
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 13:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738760701; cv=none; b=a2dfKRwV8BKf7iwEXbvVcacrCx1SOKWTrFVU/ZPfxDtPPPdR52gMFNt6YVzWU6hW/zJqEistPIR+YT6t3C6j2kwCfScYyna1wY3124ph0E7uwZ/Z1W7zry1yNZi4DPv1NasNdyqaWeacP4i0HTCm//f60r86FHa1F9LfzfG82f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738760701; c=relaxed/simple;
	bh=+NBSWZpDWNiZ+g0G9+x9chkAzgB8xrxrcBYRgdsou40=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=RHVrMwfPc6LPBG3x/w82yqPFCFLy3T4XhXhSRHKbJ6KtAykg6ChbvhJYKV44ex8eVGMbWkbTmduXghPMRFMlo315mDE3QeDCB/TQ2Alvt0sfzbipkZoyydxQiWLU7NNkKPoWQihq1fOwc0zYFJDBAn4ahSbpWpdi5y/jnxVCSr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=HA5ovZ+y; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=t4VBP/B9; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="HA5ovZ+y";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="t4VBP/B9"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id F275725400C7;
	Wed,  5 Feb 2025 08:04:57 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Wed, 05 Feb 2025 08:04:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1738760697;
	 x=1738847097; bh=SCHItT6QcLiTwUenlw5c4ZeAjQ1AhCR3IiJ9jW3mjV0=; b=
	HA5ovZ+yaLL4TiFQ3Ff21+W26FuMd19wh8/1oo6TJAn2zeoOLPRk55DuEjlpjHPv
	pF+GmDfT+vY/1gSAvnw8TJQeqmob/retWrKkLU7OLlO7+wOH70E0Jyzj8ZXRzIsV
	b/6Zqzl1EbHHtTXUedWik/0inL+pQASNUR92FDOaeAEcb+bxKxIuuoWVMQ58k4I1
	kT5vEdcgMgSDMl5rSEsG1lU+PVaJFQgzyLii7JtXfWeuJYsoImLf3yxhasPN37J0
	+ww7Sx75jZQpVmL0FdsV8JkJqaEP3kakz0i7oXzDqP9OR96O/tzHZvOaqswuegbh
	c9+1wub0hBo5lI0eXopz5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1738760697; x=
	1738847097; bh=SCHItT6QcLiTwUenlw5c4ZeAjQ1AhCR3IiJ9jW3mjV0=; b=t
	4VBP/B9oSKg4v7czOmnBorKeN3mXv2jy95tr3pdeMb4RFgdFN8sYBI2o+5mQAylU
	JMYHgfd+Rp7A3A21DRSJo/dar5yq4G9hYfBgz7LBtOpTSMLpA4U4ffSGfXqhAAnp
	VuF/80shqgFWA4j/uAqiepYSMPwXfN/rFf/2+l/Yu3AlxlIB5MGof21WE6fCiJUX
	Wj2k/fD/SMbquFhk5LhOf1iEQZg9R+TQH5sDPXDtE7VoXYMhArXTNQdJzhFv55rH
	XJRcmc9szdiXlNRBw6GhLdLPuYIHle0nd48LJtqoEMaFnVZnanBIeiRbXREG9gGS
	/3f6af8eBrl7bd4sy7cYA==
X-ME-Sender: <xms:-WGjZ9PrOG1QnZo8Nx28LM6AsgnWmUq5tOO8oNy2DjjBdgwImq7mRQ>
    <xme:-WGjZ_8Wlk1s_f5xNP-FKILExJk4p8kBf55PITdiGQdUJtT12OYLyVJrDvNice9Et
    KjD6A-mYGz_qaNIGB4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeehvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeek
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeguphgvnhhklhgvrhesghhmrghilh
    drtghomhdprhgtphhtthhopehnihhhrghrtghhrghithhhrghnhigrsehgmhgrihhlrdgt
    ohhmpdhrtghpthhtoheprhhohhgvvghttghhrghvrghnsehgmhgrihhlrdgtohhmpdhrtg
    hpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnrdgtrghr
    phgvnhhtvghrsehlihhnrghrohdrohhrghdprhgtphhtthhopehgrhgvghhkhheslhhinh
    hugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhsthgrghhi
    nhhgsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgvrh
    hnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:-WGjZ8Q8BS4qf-MNMXgmjtx9sh1-INx-VkZ1BO1zgS7fd-REHZ6zTw>
    <xmx:-WGjZ5tjZo7OxZo8VHW2V04yX6FZaAnrpfVbOqKIV7TCBYTRXpsa-A>
    <xmx:-WGjZ1dvPRjGZ4cG7a00l4uLiY9IENP9LkJrnS6z7IFQNjG7lzLiiA>
    <xmx:-WGjZ10uSxvNnYzBYkAg2zhsX6qJIlG3NU30WIKjVbGAjtcY3Gjtsg>
    <xmx:-WGjZ_teP91Z-XpCzrjeFt6SZIft2RgsreCC86zDlVTSpmvLRfM63XR3>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5BE8D2220074; Wed,  5 Feb 2025 08:04:57 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 05 Feb 2025 14:04:37 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Dave Penkler" <dpenkler@gmail.com>,
 "Dan Carpenter" <dan.carpenter@linaro.org>,
 "Nihar Chaithanya" <niharchaithanya@gmail.com>,
 "Rohit Chavan" <roheetchavan@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Message-Id: <19cc695e-47e6-451a-a443-384e2b423953@app.fastmail.com>
In-Reply-To: <2025020532-roast-shortage-4086@gregkh>
References: <20250205121244.322054-1-arnd@kernel.org>
 <2025020532-roast-shortage-4086@gregkh>
Subject: Re: [PATCH] gpib: mark pnp_device_id tables as __maybe_unused
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Feb 5, 2025, at 13:25, Greg Kroah-Hartman wrote:
> On Wed, Feb 05, 2025 at 01:12:26PM +0100, Arnd Bergmann wrote:
>>
>> @@ -1390,7 +1390,7 @@ static struct pci_driver tnt4882_pci_driver = {
>>  	.probe = &tnt4882_pci_probe
>>  };
>>  
>> -static const struct pnp_device_id tnt4882_pnp_table[] = {
>> +static __maybe_unused const struct pnp_device_id tnt4882_pnp_table[] = {
>
> I see this happening in many different drivers right now, what is so
> unique about pnp that causes this?  Shouldn't we fix up the
> MODULE_DEVICE_TABLE() macro to not require stuff like this instead?

I think the other drivers that produce a similar warning usually
have a different bug, they have an incorrect of_match_ptr() or
ACPI_PTR() around the reference to that table, and the correct
fix is usually to just remove those macros. I have previously
sent patches for all of these, and could resend those.

These two pnp drivers are special because they predate the
linux-2.6 driver model and there is no reference to the table
at all in the drivers.

    Arnd
