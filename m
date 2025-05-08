Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F912236FC;
	Thu,  8 May 2025 15:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716550; cv=none; b=SrpQT4h8uCcxUWsQ5NpeaYsJ0oVUDan1OQ78W+gNvJXNs5LIipNVRQoAnTsS6nmwCCXmbA2EbGsrzSIV9kY9Up9N1MiKyNTEUApdQfDnQ1L9zh0ig6o9hBkBXzG3/8rAkltnQxx3PBE3RRpsHpywFdC19zk4e2JDCY4Zjx7lk5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716550; c=relaxed/simple;
	bh=q4zUMNZ2twNGBcld3+7a9zKNw3HEkXzGPijyVG9FSAA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=mMy2V95UAWl7CsOyjk+KO2FWOVz4qa/Ko4dgF1xV2FpsQolgfI6grLeEpOhLuqm58MIxEIVebncnWrChQHEsRDX9S96yRWzwjs1et0TThA3sC6nIWDkbm6sKGUcx07H2Nj1dL4vXU3R9H87uLKrENyWjq1A3YHq05r7kL+9MmMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=gkVw4xFC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HWAyOWVL; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="gkVw4xFC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HWAyOWVL"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 56C4F114011D;
	Thu,  8 May 2025 11:02:27 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-12.internal (MEProxy); Thu, 08 May 2025 11:02:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1746716547;
	 x=1746802947; bh=q4zUMNZ2twNGBcld3+7a9zKNw3HEkXzGPijyVG9FSAA=; b=
	gkVw4xFClo0NXUZZzuRleD4DxCy/QCGpn5ND/vCmymxZszC/99F0Zq7fWGsTM7j5
	LwbEw2L8OnRCJKnMWSapjOKb9NQwR3cY01QznQYwv5+/4bc8vDgTgj+nA7SgenC9
	1657LvRAYo/rHcQt2npKdS3dze15u0PgdSBMyfUHG1g0zfKssNUnZzSR/x/TWLI7
	p4JQOmY7kZvq8gdvL0MLMHzJGXrRKQtA6bj2r2sD3Mh8xmsto/4GApobjNALyNT1
	cuN9kay6M7rNddOUkhVHMWrD/xgWoMSRzONzJsuyk+eZLLHhm6Dn5/Bdwc/HoO0/
	Lv9NQsFkkYJ7dxSj4Qzyaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746716547; x=
	1746802947; bh=q4zUMNZ2twNGBcld3+7a9zKNw3HEkXzGPijyVG9FSAA=; b=H
	WAyOWVLlYG+5/x0wZmIAA5ufePaH/hlCEw/Ix9IUbwwcR4t9k5Lg1ecxpCoIBsK0
	8wHdf2fNbkmpchaMy10mBpsz17pNLqpGXSjJn3CgDqyxv1bvYk3AJIcAf8lheYTC
	Bj7CA51y+DJj1LVhbnM6s7/TjHWFbstlNb8N5eH1fcgLfO4FdBb7rKXEXRxgwHbx
	gDP48+zn1+6s4h4RymcUAKaeZejssRRxD+V1JX+1iODkLV4JL8ZiL3cBdYvfQoQG
	dR6OIo7O7YbSULeeRLkEwJ/JwCpIS0YRkOJCudkNaGdAjnvqK2MQzpJlh7zkSYuy
	VIFU5teGCG6IKopv1JPzQ==
X-ME-Sender: <xms:g8ccaHVu-De_ZNVgqdZCPlc3QHdu7HPD-gvGX8hArhElaOo72n5Liw>
    <xme:g8ccaPlB1pmr-N6G2n6AYt18M8PQLCOtGSRzb3X9PqHSoFChjeUTV6qgsR7kT3t41
    3UsBkld5pY0xY0OLc4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledttdegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
    tdejnecuhfhrohhmpedfofgrrhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlh
    gvnhhovhhosehsqhhuvggssgdrtggrqeenucggtffrrghtthgvrhhnpefhveekjeeuueek
    fefhleeljeehuedugfetffdvteekffejudelffdvjeekfeehvdenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhho
    vhhosehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehikhgvphgrnhhhtgesghhmrghilhdrtghomhdprhgtphhtthho
    peifpggrrhhmihhnsehgmhigrdguvgdprhgtphhtthhopegrnhgurhhihidrshhhvghvtg
    hhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepihhlphhordhj
    rghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehisghmqd
    grtghpihdquggvvhgvlheslhhishhtshdrshhouhhrtggvfhhorhhgvgdrnhgvthdprhgt
    phhtthhopehhuggvghhovgguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinh
    hugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphhl
    rghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:g8ccaDYlbLZZwIAWO0EroYiaxD8xid2-gHEg7Casr5GPkD6jCdjCEg>
    <xmx:g8ccaCXIJTz9iLzPHA_inFOIssXca8e204mrjyEorzB0YZf7cV6c1Q>
    <xmx:g8ccaBk6R2Ivzt7zKbUUiyVCk_v0C_-JL0DwIgCG12B0fFHA_0uZEQ>
    <xmx:g8ccaPfOeJRm0Bhs_dJgvzyYTR7-dSorGpmtIN_AKWP27dP5NpJ-vQ>
    <xmx:g8ccaDYb8yhCfkyUtay0E5mmkSoapBD1v7IubKTAbWzBnQLIyWgxuDRN>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 01A973C006C; Thu,  8 May 2025 11:02:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T747cf12b99a35bad
Date: Thu, 08 May 2025 11:02:06 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Hans de Goede" <hdegoede@redhat.com>, ikepanhc@gmail.com,
 "Armin Wolf" <W_Armin@gmx.de>, LKML <linux-kernel@vger.kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net
Message-Id: <9deccaae-8c03-4e3f-a833-294ff060c527@app.fastmail.com>
In-Reply-To: <aBzAkfJvVA04r-2U@smile.fi.intel.com>
References: <mpearson-lenovo@squebb.ca>
 <20250507190456.3004367-1-mpearson-lenovo@squebb.ca>
 <20250507190456.3004367-2-mpearson-lenovo@squebb.ca>
 <6feeae5a-3928-8198-7ed6-2080c929d7c5@linux.intel.com>
 <c8ad9e6d-772d-4954-a3b9-ecafe7e3bdc7@app.fastmail.com>
 <aBzAkfJvVA04r-2U@smile.fi.intel.com>
Subject: Re: [PATCH 2/2] platform/x86: export thinkpad_acpi handles
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025, at 10:32 AM, Andy Shevchenko wrote:
> On Thu, May 08, 2025 at 10:28:26AM -0400, Mark Pearson wrote:
>> On Thu, May 8, 2025, at 10:03 AM, Ilpo J=C3=A4rvinen wrote:
>> > On Wed, 7 May 2025, Mark Pearson wrote:
>
> ...
>
>> >> +EXPORT_SYMBOL_GPL(tp_acpi_get_handle);
>> >
>> > Please put these symbols into a namespace.
>>=20
>> Sorry, not quite sure what you mean here. Could you point me at an ex=
ample?
>
> Use _NS variant of export.
>
Thanks :)
