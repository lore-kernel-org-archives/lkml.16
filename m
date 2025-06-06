Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8799220FAA4;
	Fri,  6 Jun 2025 19:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749238246; cv=none; b=UrvDorodLQQB5qAnnRrESj+IIy29oVd/uiAnKJFiEvr2TGn3IQ6r84Z6Cjs7gvJWff0bzZrOUE+QPkJQUbp/Z/1UmBODcs4v9Mow0XnHnSVGtcS4cuC9QgtYFjHFhAtffg82IJ4fiPYORV7JjfjZtkXWMjsgwJQxWrKlYPhbdvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749238246; c=relaxed/simple;
	bh=mop+KlpuK8X386yUkF6VkytkPGwtEzTMMJxWKOhtygo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=iw2Qr7jETCB3lQ1f/Xp7/6pngmQe9RFyJHh0ZIhGZL1hkLy01C4MKdjBbH6kumMXyNmywhZPWoctD1iu+suLFrZAiN1UM7p4fj8+Y8Qf3ySvdbwUIRng/vasBriYuZpMLL170llirUtc3K+UZVXyFYrxItXEwshkKYL9++pfmiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=R/CZGEpf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ls3Sm07C; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="R/CZGEpf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ls3Sm07C"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8D1301140193;
	Fri,  6 Jun 2025 15:30:43 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-12.internal (MEProxy); Fri, 06 Jun 2025 15:30:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1749238243;
	 x=1749324643; bh=lEYf3neoow/7vEvxjuEgRsFKRcKeW6cqpzgTmhNHb2g=; b=
	R/CZGEpf2uJtX9c5zhVO/wgEY531AM5LvDJrSmDrK3jEQzjTkTMzcjRX187dWR84
	oIbQD8KXGP6YFK9fYC23LRe49M5teDXkK0Kz7d1KVsrLoPZaXXSuRO5by7URUhJN
	lDmsEUOkOigp1YI6oTnhyIiVzJO7mPl/eULFOqIHC8v85yCxpCbrOhurSUqR+DaQ
	jxtJ504ytF76XFsmpCienWJKMYFCl3B3Gy8iBKA6zE9AdW+D1ZxDzxrPKqx5eNWv
	XMeezlkno9ykDQXuhvmLat4lxi6u0mObQxYc4iVVrgInmEeM2NYXWruCDmoW0umO
	pP2u54ml6Z1U53fqM8UCzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749238243; x=
	1749324643; bh=lEYf3neoow/7vEvxjuEgRsFKRcKeW6cqpzgTmhNHb2g=; b=l
	s3Sm07C1nnR2e9ZaUstuOe39LaA4ILuj5i6IH3wzVdHTi2IaLfZElQ5ssZ8WfQqZ
	KWosRgmzq2hWEZEj/wjD8GGoMZC/LFUF10n+yLMrRoT7YU5SPNlPDei4/GOYszWL
	5ex4LXel+75mZdZSLX/L2VdWwvZprLGAWd4y0wNBOKXsho5qSDQVbqMvjf0rbjMt
	4G1QNaZrTS/8hWtQGnRbOv8xbxVeNndzyU43UN1FphT9p9HhnPoHc3A5tGqEnltC
	3DffjneC9Mql+t6N0uXSou61iqT2fo8S9fDRn1ABSiAVQB5Bd3a+9nxr64it5oJE
	vNYJmwuMNFA5c6V43yVYg==
X-ME-Sender: <xms:4kFDaIxR-T4VMUeCvpyO6b0aNY6mc-cKHTNvPCsAcnYXO97MTjv0tQ>
    <xme:4kFDaMSccayqbSsT7xH9tiE_xNR1r_maZ-9AHpaTrTTfmElVg5ZrkUQtuS-UPF_pO
    kMZkGg2lr7GnKFSHXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdehheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedfofgrrhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnh
    hovhhosehsqhhuvggssgdrtggrqeenucggtffrrghtthgvrhhnpefhuedvheetgeehtdeh
    tdevheduvdejjefggfeijedvgeekhfefleehkeehvdffheenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhho
    sehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhopedufedpmhhouggvpehsmhhtphhouh
    htpdhrtghpthhtohepihhkvghprghnhhgtsehgmhgrihhlrdgtohhmpdhrtghpthhtohep
    figprghrmhhinhesghhmgidruggvpdhrtghpthhtohephhhmhheshhhmhhdrvghnghdrsg
    hrpdhrtghpthhtoheplhhkphesihhnthgvlhdrtghomhdprhgtphhtthhopegrnhgurhhi
    hidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoh
    epihhlphhordhjrghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphht
    thhopehovgdqkhgsuhhilhguqdgrlhhlsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtg
    hpthhtohepihgsmhdqrggtphhiqdguvghvvghlsehlihhsthhsrdhsohhurhgtvghfohhr
    ghgvrdhnvghtpdhrtghpthhtoheptghorhgsvghtsehlfihnrdhnvght
X-ME-Proxy: <xmx:4kFDaKUvSPNU1VHVDoLtZsVeoDlZrIuwcqaUW64hDiY5ihLIY22pxw>
    <xmx:4kFDaGjzibfTxl3_FCUnSXmYzJKrgoIEJNYTi1bBxdOQkl1z75bDjA>
    <xmx:4kFDaKDXj-b13AJ8C7SQoQBZPyRQEg6wgtjZydwznk16NGjYmI29ug>
    <xmx:4kFDaHIrX28gXw3p76CQa6l6t2qX-poMA5iFKfHiiFVqfd7undZuOw>
    <xmx:40FDaAILvoi3Ti-qur14dEFImeIPFodxm3Q5F2ESeqfvgtfgCTm4u-vx>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2ADB22CE0063; Fri,  6 Jun 2025 15:30:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T107eb5199b18744c
Date: Fri, 06 Jun 2025 15:30:21 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: "kernel test robot" <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Hans de Goede" <hdegoede@redhat.com>, "Jonathan Corbet" <corbet@lwn.net>,
 ikepanhc@gmail.com, "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Armin Wolf" <W_Armin@gmx.de>, linux-doc@vger.kernel.org,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Message-Id: <68f7cbc2-f81b-47ff-9dfb-093c54bec760@app.fastmail.com>
In-Reply-To: <aEM6PTCql7l1n6e0@smile.fi.intel.com>
References: <20250604173702.3025074-1-mpearson-lenovo@squebb.ca>
 <202506062319.F0IpDxF6-lkp@intel.com>
 <6d17454f-faac-4616-ac2e-7da80feedf2c@app.fastmail.com>
 <aEM6Da6CZ0DI3x8w@smile.fi.intel.com> <aEM6PTCql7l1n6e0@smile.fi.intel.com>
Subject: Re: [PATCH v2] platform/x86: Move Lenovo files into lenovo subdir
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Thanks Andy

On Fri, Jun 6, 2025, at 2:58 PM, Andy Shevchenko wrote:
> On Fri, Jun 06, 2025 at 09:57:17PM +0300, Andy Shevchenko wrote:
>> On Fri, Jun 06, 2025 at 01:30:25PM -0400, Mark Pearson wrote:
>> > On Fri, Jun 6, 2025, at 11:58 AM, kernel test robot wrote:
>
> ...
>
>> > I'm unable to reproduce this issue with a W=1 build
>> 
>> Do you have GCC-12?
>
> To be more precise you need to have a CONFIG_DMI=n.
>
>> > and I think it's a false positive.
>> 
>> I think the problematic line is in certificate_store().
>> You need to check the value of dmi_get_system_info().
>> Or make sure the DMI is always selected (depend on DMI
>> in Kconfig, perhaps).
>> 

I think this is already in place, but it's a bit of a tangled nest of Kconfig options and could depend on the architecture. I can't disable it in my current build anyway.

>> > Am I safe to ignore this report?
>> 
>> Please, try to fix it.

Ack. 
I'll add in a check for the dmi_get_system_info returning NULL, and add a depends on DMI.

Thanks for the pointers.

Mark
