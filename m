Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52912701A5;
	Wed, 23 Apr 2025 14:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745417584; cv=none; b=rYXTd4fwOdgAUmsNH4xHFFYv6cBdCAYji94Bq9aMd5pp1cZVu/pJeQipGEUz+xPrNJYB+L7x0F8dnpZBZRb8al540+wkp0Zfd2aT0deU5x2zNqVM5QMYgH6B+o+/yozNl5JP1yngedZKf/DI5byu5Cqf6+qpfqDOCmUdhTnl9DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745417584; c=relaxed/simple;
	bh=PjwZWD346ibdR/6vUhrLL4BPFca74P6cBBLnBwcTHGU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=GpjTGY59TufzRO6I/lah1tkiSCj2QVMspEpaceeUgoLOSc4yGtI2x6zwcd379rqfvkb22dyigYuFzcsnLVwN5SKgwinswoh5ojQkMnsP5uFR14rZR+X0HHoNmZkCs/yZKmHSD2jDF2JRJgKE6qCt5VQOSX6c3niTP4ZgGsSCvos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lyndeno.ca; spf=pass smtp.mailfrom=lyndeno.ca; dkim=pass (2048-bit key) header.d=lyndeno.ca header.i=@lyndeno.ca header.b=D0RoE7Nj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XkA4TT/H; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lyndeno.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lyndeno.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lyndeno.ca header.i=@lyndeno.ca header.b="D0RoE7Nj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XkA4TT/H"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id AA52211400A6;
	Wed, 23 Apr 2025 10:12:59 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-06.internal (MEProxy); Wed, 23 Apr 2025 10:12:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lyndeno.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1745417579;
	 x=1745503979; bh=avDcGee6fBbgjgoFmtOPzOoVyWrBc05rlWydS5w/gyI=; b=
	D0RoE7NjGpALb8xSLS/mnRdtuMPPCkJJhMnClZzvtdaI7/Fu97nC5JJCDPp+L5qL
	Z6vztw/f/Ujp3MbXUkQSGFmm8GO3hxUzMETpPxDGHWCbOszVamlu/lh9/W21iaHM
	6Eco1cexUiDs6HPlfNoK9o3h0OtpZVWWA134Ii1uer/AGhBnIKjjdnE2y2z2AJ36
	rihvSiBRVo1KwWWuvJew+ZfeRaOagLUF3MrUhzEq4APgNNQYiJiJ8p6yZNXxgLLL
	rukeX9S2QxDdnNcIu0v3yvkvBRiC+BNLTcPOFvPpysh/cW7FKFAl7wlnpDZf4XO+
	PlBQ+iX/4AeR6487qFmG1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1745417579; x=
	1745503979; bh=avDcGee6fBbgjgoFmtOPzOoVyWrBc05rlWydS5w/gyI=; b=X
	kA4TT/HG7q7sJGdm9dL0VvUkpo7zyHuKXhFQE4vkxWevb1Vuj4p41T2dUU4HmeMh
	+TZMzw8RuGQlDfnX5cSF9HHA07sAfFtQNPJl7w8/7Gl5CRkJwq5Ko/dSGqBrLiUr
	I/mgKuKI/26pbXC5neWnbyuggPExf6H8zQMIlm98sxW3ij0kH0RXQMluZeqXAb4l
	Aq0h39DD9MMyvtbnhvHaAIxWBK6Z+JLZca7c+Nd7Tb3bUBi1D+QaURX2rz0NAQ8e
	4BMlzq1B1lf2tIiQ9kHiz2m+3QqgibNOWJn6K3kI6JYlhEQfyIy/SsA1ntssrI1E
	iWJMINapec2FRM2SdyYAA==
X-ME-Sender: <xms:a_UIaCtxiRIDMPNMRcMkq2AJjcQZkJkXYQt8FhIQW3CnGtLzjXF1Sw>
    <xme:a_UIaHfty0U99OTPGISdC1iimFdtgDk0okcIoTZXapjivwdmOlwLzstry-LqUWGfA
    NYXW8Rjv6mn6vNCRaY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeikedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedfnfihnhguohhnucfurghntghhvgdfuceolhhsrghntghhvgeslh
    ihnhguvghnohdrtggrqeenucggtffrrghtthgvrhhnpedufedtuefffeekudejheehuddv
    vedvhfetueeuffdvtdevtdelleelhfdvkeejvdenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehlshgrnhgthhgvsehlhihnuggvnhhordgtrgdp
    nhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgrrh
    hiohdrlhhimhhonhgtihgvlhhlohesrghmugdrtghomhdprhgtphhtthhopehkuhhurhht
    sgesghhmrghilhdrtghomhdprhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlih
    hnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhho
    uhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohephhguvghgohgvuggvsehrvgguhhgrth
    drtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvgh
    gvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:a_UIaNxdQQKgpVXPP5tftjnAAuvd3h5OFgiPbQF3Luier2DN9gHHmw>
    <xmx:a_UIaNMK3EM27Zq1PvO5ELTf-SgYJZMvJGOZqXPZsZ9MgCT3oj3y6g>
    <xmx:a_UIaC_yMcfBWY1f9ZBh6pkWrZ6Oa0370Dex7_17N-jdzFmr6vxJag>
    <xmx:a_UIaFX0FDbZA4TbwjNSWc_HcUXu4amEJ6wAJR6ozegRGJm71_c0Eg>
    <xmx:a_UIaPDXMmiVckaqgSja_AyLng-CHv2IEyHJZZR8SJB1LNIHEFxSnPeM>
Feedback-ID: i1719461a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2BBD03C0068; Wed, 23 Apr 2025 10:12:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T9828f04955b174fc
Date: Wed, 23 Apr 2025 08:12:38 -0600
From: "Lyndon Sanche" <lsanche@lyndeno.ca>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Hans de Goede" <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Kurt Borja" <kuurtb@gmail.com>,
 "Mario Limonciello" <mario.limonciello@amd.com>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Message-Id: <8943a4f1-37af-4573-b778-90a52732e0f6@app.fastmail.com>
In-Reply-To: <2025042314-grub-savage-3894@gregkh>
References: <20250411-dell-faux-v1-0-ea1f1c929b7e@gmail.com>
 <20250411-dell-faux-v1-3-ea1f1c929b7e@gmail.com>
 <2afb6e58-44cb-486e-8062-074ff397dc2c@linux.intel.com>
 <1e8a6fe0-518d-4eac-9895-51179ca23f36@redhat.com>
 <2025042314-grub-savage-3894@gregkh>
Subject: Re: [PATCH 3/3] platform/x86: dell-pc: Transition to faux device
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Apr 23, 2025, at 7:59 AM, Greg Kroah-Hartman wrote:
> On Wed, Apr 23, 2025 at 03:44:56PM +0200, Hans de Goede wrote:
>> 
>> Arguably the dell-pc driver does not need a struct device at all,
>> since it just exports /sys/firmware/acpi/platform_profile sysfs
>> interface by using the relevant Dell SMBIOS interfaces for this.
>> 
>> As such maybe we should just completely get rid of the whole
>> struct device here?
>> 
>> If we do decide to keep the struct device, then since the struct device
>> seems to just be there to tie the lifetime of the platform_profile
>> handler to, I guess that calling it a faux device is fair.

I am curious to see what this would look like. If we can get away with not using a struct for this functionality I think that is a good way to keep it simple.

>
> If a device needs access to platform resources, then it is a platform
> device.  If not, then it is not.  Not too complex :)
>
> But (you knew there was a but), many drivers want to detach their
> ability to create a device, and have a driver bind to them, in a
> different "place" in the kernel.  For many of those, they have (ab)used
> the platform driver/device api to achieve this, despite them not being a
> platform device at all.  For these, we can't convert them directly to
> use faux bus, as it's not as simple of a conversion and in some places,
> doesn't work well.  So let's leave those alone for now, but not take any
> more of them going forward in the future.

Right now we are just using the platform device to register a platform profile handler. If we only need the faux bus for that then I think that is a good way to go. I will look into this new faux bus a bit more.

I'll see if I can find some time this evening to run this patch.

Thanks,

Lyndon
