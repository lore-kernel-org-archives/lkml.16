Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DE572610
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 08:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746606808; cv=none; b=GPwpo0HvRphh3Wx4wnfAw23pt5wUizqX5wW9764+/GfDKLYHzELDpMJhaHlMgnyuZmdcxMLgp7bW/bTHPdEuci1rZr/mzgsPGL3xOtjo+7z5LVLQll885SNqrnBwcmk2CqCFAxXwuOzJ/PmI6NwXELCjmJFYNVpuEK7nZLHkJjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746606808; c=relaxed/simple;
	bh=3p8DiI2AwLwSFTYcEk6gXc3gH2jAD8suAVndNuxXnrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jJWodCgiX9BbHYy89goM/fCZSq7G3pIfMB3ZWXwq93Fy6PKSk9gmKhmX7HR1vQcOIKt2Xx65xjBiYTmaXHcCWGwKEBlp3VNMG1jZiazQfGbC6cQLWgPryIqENjteOJCwSIcgFuwxg6A/XZU+McVS43xeAoQrlYmE8y8KtjTH7V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iKDZmBdO; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iKDZmBdO"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4AF984321C;
	Wed,  7 May 2025 08:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746606803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7YwmEGmhO475by3aRh6mI2nEJY15xlJqyvsiEFrhC6I=;
	b=iKDZmBdO2gMPE+hKvQyVCpof5isnym71xrdB65D+2bBHpZBksGHh0C1sj48tQF+xS+UXaU
	+fnrnfdcfluvB2OyAniaozMS2SuQ71xhJqvIwRhQ51BV8dHioZ5Wh3wPaKtqbImdn1L/zg
	0CGZWZoLDrL3VqRLHk1qLQp5KmPY0vdOKPfv2dgZjHiCoKDYiD7Ro0ahTz2Yppbh+zlfNv
	i5ZsEDoOl4qHLkUJv2c4FUU/QglBZJjmgSdb7qxUQkLZHBJ7Pz25rN4k2mqvEU8zs9KPV+
	hTl3pea9pbg/giMpq0iIEmHESMTD+KmyZ0bfcG9RT/Pn3SNI1dOzuCiAaGnwIA==
Message-ID: <c65c01b0-f407-4479-a6ad-6969c5cab06e@bootlin.com>
Date: Wed, 7 May 2025 10:33:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3] mux: mmio: Add suspend and resume support
To: Peter Rosin <peda@axentia.se>, Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, gregory.clement@bootlin.com,
 richard.genoud@bootlin.com, u-kumar1@ti.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Davis <afd@ti.com>
References: <20250407-mux-mmio-resume-support-v3-1-cb88abc04db7@bootlin.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20250407-mux-mmio-resume-support-v3-1-cb88abc04db7@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeifeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegteekfeevudduvdduveehgeejuefgieeitdeuvdekgfdvgefhjedtffdufeegheenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgfkrfggieemvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrngdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehpvggurgesrgigvghnthhirgdrshgvpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpt
 hhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehrihgthhgrrhgurdhgvghnohhuugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehuqdhkuhhmrghrudesthhirdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghfugesthhirdgtohhm
X-GND-Sasl: thomas.richard@bootlin.com

On 4/7/25 15:06, Thomas Richard wrote:
> The status of each mux is read during suspend and stored in the private
> memory of the mux_chip.
> Then the state is restored during the resume.
> 
> Reviewed-by: Andrew Davis <afd@ti.com>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Hi Greg,

I apologize for involving you, but Peter is not responding anymore. I
pinged him several times, resent the patch but no news.

Could you please review and apply this patch directly?

Best Regards,

Thomas
