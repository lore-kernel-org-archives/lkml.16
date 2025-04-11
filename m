Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B442367A9;
	Fri, 11 Apr 2025 13:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744379566; cv=none; b=p22EWpOUmEolUr4WmWscevV2V83WwSpIL+Q0Yyoa+I9V1R+inC0lHzG3r2TKtWA2d0nWtMuYDFo78w9ixRPUeOpvENqE2BwPZQNjqskpsk75waViP6o+qSDSmfK15Ss7kWNPMM8NaRDRu6b7HeE/+nIgP5sR4Jx475aVpazA6Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744379566; c=relaxed/simple;
	bh=3G+rGOtpQ0mNF/iZgsPQoMZrNlVHNf+NfdoAhIm0n9o=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=M7f48uU5ZK0hbTu5tqMMoDEFNHteAlNYhV5bNy+IwpWmnVnGGfbon/9RNs0LUte5BEIQNpOZJB2fkz0G2haPBoJ9+AL6fuYWVBgs71Tm9nJ4/LWpTc8fKhi7N29zApdvW0zRHPvEDoH5RV5tcdCs0tWQaH9Qjl6mA4OqDP2Tez0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Z97W3Gzr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oQCKUMTK; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Z97W3Gzr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oQCKUMTK"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 626F81140289;
	Fri, 11 Apr 2025 09:52:43 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Fri, 11 Apr 2025 09:52:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1744379563;
	 x=1744465963; bh=M4cYLoC/D6jghjX4s8EBmGsHgbHlWKjK5fbsRmO/s0w=; b=
	Z97W3Gzrz8RAPdOFy81h/QbtEYQQAupnEefJrGB2L3FG2Qryy2pboq23+W+TkOB5
	h5/NkPNxyb9yRF4O+wF9RtzoSdmFEGHbHemZcJ6mZOK/FnHuS+UA6s1VlffduSMd
	GU83h/Xaqm/8XSvEH9Cm8yzyZk6+fABS9mSQbIO0lEoiQX19X9ab3VouE7JrVKZ8
	oDmhlTt599h+4bcrXthGZ+jIIdScW23IYMKkfRzeUzr+TnUANGz9wUcCNKmddN1Q
	G9LCOFmm+6NmEjwfldOgZa8G1NgOis7pcg1HwsyIsp3Q07OGZoM9zh8/H5St21f6
	Kw0boS0iah8Ny6sCktwxPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744379563; x=
	1744465963; bh=M4cYLoC/D6jghjX4s8EBmGsHgbHlWKjK5fbsRmO/s0w=; b=o
	QCKUMTKdorVQ97mGiqq+VmMQx1doraGN581GuFE5wXgDOllc7gWx1kaFhn1v1pAp
	Uzuhi0O43yEPpkrCT24S2xuOSOw3aCLa6f+tQsoOpuWiT4tO5E4yQ2kNwRneBA+J
	pXykANAlov1b5iceCWciBMoUYQwSQz5U6frhtuDYxxXKNRuH6K8cd88PMEZI0Ycf
	k7W4H/DL0pKw3Yyo/h0A253zW8uPesbEzkkbofg5g1Lix7cJrPr7+Z4rneb80t0B
	UpqoOLCbZQ9ceDRL7nFSRyR5tIc54Pu/1LZ1Uzsm3ZiT4kB1p53Sbfygu2vbE/G/
	sazXu5BGhosgDjdHjFXIg==
X-ME-Sender: <xms:qx75Z6z0ZccqpK4iKRXU0l-Cwq85FAVxa9KW55CrzLNP5oU4mPrOQQ>
    <xme:qx75Z2TRwX7hJperg2O7xzLwHz5_KB6Ei85DzdFjx51vAYmNQ4WoQgsBbun2rl4G5
    vXS5IxZgXteJBUyxdA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudduleejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhepgefgjedujedvieejgeelgfdthfduffeiteef
    udeghfffkeejfeehtdejfeejteefnecuffhomhgrihhnpehgihhthhhusgdrtghomhenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnuges
    rghrnhgusgdruggvpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtoheprghkshhhrgihrdhguhhpthgrsegrmhgurdgtohhmpdhrtghpthhtohep
    rghnrghnugdruhhmrghrjhhisegrmhgurdgtohhmpdhrtghpthhtohepghgruhhthhgrmh
    drshhhvghnohihsegrmhgurdgtohhmpdhrtghpthhtohepmhgrrhhiohdrlhhimhhonhgt
    ihgvlhhlohesrghmugdrtghomhdprhgtphhtthhopehnrghvvggvnhhkrhhishhhnhgrrd
    gthhgrthhrrgguhhhisegrmhgurdgtohhmpdhrtghpthhtohepshhhhigrmhdqshhunhgu
    rghrrdhsqdhksegrmhgurdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfh
    houhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugiesrhhovggtkhdquhhs
    rdhnvghtpdhrtghpthhtoheplhhinhhugidqhhifmhhonhesvhhgvghrrdhkvghrnhgvlh
    drohhrgh
X-ME-Proxy: <xmx:qx75Z8VXNtJNzJ2YJ55XuCapjIBu1HDfD2Tc1MAuC77CC9Cy2l9Rdw>
    <xmx:qx75ZwjJfVjDqJq57oE6lkJppWyC2AFR4M2Gf5kTZiqWsJ78-6RhLw>
    <xmx:qx75Z8CMzy-zOhCSymzat7CF4XoQQqUYOPKVV4kP-OwHXsaxCEOO0Q>
    <xmx:qx75ZxIKupWZUEL4oIYR1DjUeqD0bIzTU359XtzJRrNZsHNIwh-yrA>
    <xmx:qx75Z6GELtD11maDUdns3H9hkHOke9EEXGRn4793jSFTNUvT3wULqTyu>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F08AE2220075; Fri, 11 Apr 2025 09:52:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Taae6db3719bf4444
Date: Fri, 11 Apr 2025 15:51:55 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Akshay Gupta" <akshay.gupta@amd.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: "Guenter Roeck" <linux@roeck-us.net>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, shyam-sundar.s-k@amd.com,
 gautham.shenoy@amd.com, "Mario Limonciello" <mario.limonciello@amd.com>,
 naveenkrishna.chatradhi@amd.com, anand.umarji@amd.com
Message-Id: <06b76e0f-0b47-47ea-a48f-2bf09ac4a62c@app.fastmail.com>
In-Reply-To: <20250411133122.1806991-1-akshay.gupta@amd.com>
References: <20250411133122.1806991-1-akshay.gupta@amd.com>
Subject: Re: [PATCH v8 00/10] misc: Move AMD side band interface(SBI) functionality
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Apr 11, 2025, at 15:31, Akshay Gupta wrote:
> At present, sbrmi driver under hwmon subsystem, is probed as an i2c 
> driver,
> fetches data using APML specified protocol and reports through hwmon 
> power sensor.
>
> AMD provides additional information using custom protocols, which cannot be
> enumerated as hwmon sensors. Hence, move the existing functionality from hwmon/
> to misc/ and add support for following custom protocols
>   - read Processor feature capabilities and configuration information
>     through side band.
>   - read Machine Check Architecture(MCA) registers over sideband.
>     The information is accessed for range of MCA registers by passing
>     register address and thread ID to the protocol.
>
> NOTE: AMD defines Advanced Platform Management Link (APML) interface 
> which provides
> system management functionality access to the baseboard management
> controller (BMC).

I think this addresses all my comments, thanks for the update.

> Open-sourced and widely used [1]_ will continue to provide user-space 
> programmable API.
>
> .. [1] https://github.com/amd/esmi_oob_library

I'm still a little uneasy about the low-level mailbox interface
being exposed in a character device, but assuming that everyone
else is fine with having that in principle, I think the way the
interface is structured in this version is good enough.

     Arnd
