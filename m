Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FF3233728
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832049; cv=none; b=QQXWi7GidfNhC+WwSup28F8UmU5fgOaLDV+Vi/HOpL7y7bR2xK4t3IkmHUmrnRIJaqyKf2/p+IddRSmTQeadRAa8HYzFC2EgkA1JpS8DYPdf9Y7QRVW1lDsMCcq80GM7xUDh5VXJEbXbSIqOAz15QkeCTxgXYvfLpP89eXRl7f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832049; c=relaxed/simple;
	bh=WlUeDq00lkzPztyiHb0sHgFJ6Ma360A2yW8/IYtoTr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EBxDqU22HYW6dhlvEuRX66xa/jz8CcqfJ2h1cJNMf+rUGtID9RV7U1nzEAC/S96LYt+ZbS+6Xc+eWYNwne+zW+V18ea8LlRUqip8+x35M/QFftQvDkJlTer68l/s7LrXj9i5Y9yFI0gzjj809hhy+GWlH0hTtmekABO6fIOQSV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XBL2KBf3; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XBL2KBf3"
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6A9A439FF;
	Wed, 21 May 2025 12:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747832045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fdrCrgS4ayB6MeGy7Xp7zYGpRk46T4s6g0elV560Deo=;
	b=XBL2KBf366f040xaaol3YK52yxWPIbSAmCQauXVcBvpGHC/OkW4eaCQ1VAHcXx1sI851Nf
	5QpiR06FTH/29Kn+qtLc3T8Sc72JkEc19cnt4T/U0BLoQdapWBh+jqc9nITqZknRlDRMXO
	O5FKebakLAdBgGOjMNFK+FjohAovXD6BQTTzizLkc7+M8/tQ68by3AiiC4Z4QQPzrbe9Xt
	j/HxvuKXneZTj16ZN3+OqGzry9kn6jCWDgL+/2gpHNi1eZJN/taza11xycXaR5IWqJS6mI
	5VFjzrI2J8GQDzCOlUSw4QJUDec0KA9JZ1Ckquug0loDLfnWC9uRW7w3L+h4Kg==
Message-ID: <8f6fb9b4-dc84-4443-b7e2-1a857400f79a@bootlin.com>
Date: Wed, 21 May 2025 14:54:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3] mux: mmio: Add suspend and resume support
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org,
 gregory.clement@bootlin.com, richard.genoud@bootlin.com, u-kumar1@ti.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Davis <afd@ti.com>
References: <20250407-mux-mmio-resume-support-v3-1-cb88abc04db7@bootlin.com>
 <c65c01b0-f407-4479-a6ad-6969c5cab06e@bootlin.com>
 <2025052119-agenda-greyhound-d37c@gregkh>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <2025052119-agenda-greyhound-d37c@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefudefucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegteekfeevudduvdduveehgeejuefgieeitdeuvdekgfdvgefhjedtffdufeegheenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgfkrfggieemvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrngdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehpvggurgesrgigvghnt
 hhirgdrshgvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehrihgthhgrrhgurdhgvghnohhuugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehuqdhkuhhmrghrudesthhirdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghfugesthhirdgtohhm
X-GND-Sasl: thomas.richard@bootlin.com

On 5/21/25 14:27, Greg KH wrote:
> On Wed, May 07, 2025 at 10:33:22AM +0200, Thomas Richard wrote:
>> On 4/7/25 15:06, Thomas Richard wrote:
>>> The status of each mux is read during suspend and stored in the private
>>> memory of the mux_chip.
>>> Then the state is restored during the resume.
>>>
>>> Reviewed-by: Andrew Davis <afd@ti.com>
>>> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
>>
>> Hi Greg,
>>
>> I apologize for involving you, but Peter is not responding anymore. I
>> pinged him several times, resent the patch but no news.
>>
>> Could you please review and apply this patch directly?
> 
> Does not apply to my tree :(

I just tested again and it applies on v6.15-rc1.
Which tree are you talking about ?

Best Regards,

Thomas

