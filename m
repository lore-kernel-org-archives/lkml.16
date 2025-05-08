Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941132882AE
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 17:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746724858; cv=none; b=iESe6DTkpCjEOvl+LfBbEMMqbgFYzwnTRbCiDVeQr1G3uXxXq88KOi0MXDMXFeGlEMFXSaaIoSDla2TjFI4FHBNgdC4o5sjsPdRsIshIp1JQ6QFPs1rARw2IsmYj3epCQZZf+flHEZ48XrMSOrLLjzyFVQ6mnvRkGPemAGd5xNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746724858; c=relaxed/simple;
	bh=nYR+JQeqFAQOAPg6YnoXR5XOJU0Ab0oloBQbSOVfKXw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qpbIleZP//KXeMRqvlCbxgyt0gBXG+zqG65gEg0xlWBR23u2iuhtw3WOx4gVSnerVT9M88h2VnLUnkvlX9SSncbxUpONGD4XMIXBf9jNBkNW0z1OrDIIXlDlW3UIBeeFBgBEnHqu8ADbKmtuL7457BbMkR6M8+bO0EWDIKRlWtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=msmxaoqQ; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="msmxaoqQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1746724844; x=1746984044;
	bh=nYR+JQeqFAQOAPg6YnoXR5XOJU0Ab0oloBQbSOVfKXw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=msmxaoqQ+AUd0iRjBbdNZ6XykDoNqWIH2sho6943mX7XkLJfOwNOZi0pTwcJzclxi
	 5zQ7iRaatcQDITryH81QQ9Ikw4Sz6iJro1ZBXtRqjS2DTep/oRpg0WTqu99oUw424s
	 V/HoE0TZCYURVMmBFnJ6nXUVC+rXMaE9sRovKzYrCGSFyw9sRSuW4fJLba7pOVy5Op
	 TeQBzlYTwcjYxBbzLoxGwajx+fHtJTkTkiMoag3kiSvQGFiKHPqNVCRDprnLjew4Lk
	 MTA/H6OzQGphwXsGIzaOYbYhePw4Te2uf1L90Ljrfwu8J2gr05+l77M4LSkjYWHErq
	 /B0bpyI0pZeFQ==
X-Pm-Submission-Id: 4Ztf6M1WRfz4wx9Y
From: Esben Haabendal <esben@geanix.com>
To: "Matti Vaittinen" <mazziesaccount@gmail.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>,  "Mark Brown"
 <broonie@kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] regulator: bd718x7: Ensure SNVS power state is used as
 requested
In-Reply-To: <54f3b79a-38d2-4760-ba1a-125172142255@gmail.com> (Matti
	Vaittinen's message of "Mon, 05 May 2025 09:07:03 +0300")
References: <20250501-bd718x7-snvs-reset-v1-1-1fcc7088200e@geanix.com>
	<j3M49vfoxys9iFGLs2PwAULHoQsSQsHAKmaT1D2QCwyjUJNzjxXKESFYkXasW3_3owOakk-tXosNLIgfnMC6vQ==@protonmail.internalid>
	<52221c62-689c-44d2-b65d-07a5301090b3@gmail.com>
	<87tt638q7t.fsf@geanix.com>
	<6JY6cJAFrLw-8XD2zgLh0lxzqzEVtz-49qgct8PAirT1ik1BU1glEyOJJg8lgYnivBWFz1vi7-faSRX_yCgmrQ==@protonmail.internalid>
	<2996270f-d03e-45f7-9b6b-c5675c39515b@gmail.com>
	<87ikmi82ut.fsf@geanix.com>
	<0EMp5PpI517LdEsWqblAW-ZJ6PfGz88VnEcUGMml1jB3ztGKpkgTDWjcPUBE9Is3P3NErImIozuRketifUq9EQ==@protonmail.internalid>
	<54f3b79a-38d2-4760-ba1a-125172142255@gmail.com>
Date: Thu, 08 May 2025 19:20:42 +0200
Message-ID: <87bjs3auj9.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Matti Vaittinen" <mazziesaccount@gmail.com> writes:

> On 03/05/2025 12:23, Esben Haabendal wrote:
>>
>> What do you think, should we leave it in the current state, or can we
>> figure out a way to allow the driver to actively change the watchdog
>> reset to go to SNVS power state?
>
> I can't really think of a safe way other than adding a new property.
>
> The IC is oldish, and AFACS, quite widely used. People seem to have
> found a way to make it work without (in-tree) feature for changing the
> reset target to the SNVS. I wouldn't try to implement this unless we
> have a use-case really requiring it. So, I'd suggest you to do it in
> boot. Still, if you have a valid case for this to be done in the driver
> - then I have no reason to object adding a new binding + support in the
> driver.

I have now implemted the PMIC setup in U-Boot, so am fine with dropping
the patch for now.

For anyone else finding this thread later on, the advice is to setup the
PMIC in bootloader or by some other low-level method. But if that for
some reason is not feasible, you can continue the work / discussion we
have had here in order to add a new binding + support in the driver for
it.

/Esben
