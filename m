Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38A2229B29
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750337433; cv=none; b=nADVX7WqjoQlTHmS3mfjtGB7RiO5GKYlVfzlUiJzZTO8bvCsNgMXlUEuUAQT9VeL5Rv8dg2m7mlURDDKTFEChvjiW3KVUalg9mBNOdKuyRI6EeiSr4dugxfZj5vFekjaYKOVBj3K8lvf23iy8t0mz4iYeHIRrS6vv1rU7LQ7I+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750337433; c=relaxed/simple;
	bh=yh7QELnRNrptOVJNg1wwEe36hey0I5wSEsKPfvthqBE=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=qSq/kAkTJ81uFaC6IKs2Y5EExJ51/KKXTF7aFqlCfAYFl5u0FpufEdpIMhC98LznEPRikPu+vQz4HPsAREC6P/FaKrTSeWThUJpSSPfDTYBIKjGzx+RUzaJ8YgyDbTZpP4m++Jt424ne1bXp4xGVCTGe7ZssgzhgnpaZuMJdndI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=u3jv2xZJ; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="u3jv2xZJ"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750337418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TsJ0nBGHpdZnH6K80AN9JgJCTouRJmJWkXG7NopGTGU=;
	b=u3jv2xZJb/er2cf6uegzj+1col9ihPUFeBH5xG7I8qVTdX2EnCyPf1boesTApw9XrtFqYo
	vIh9Gd3fpTtFSQsO57G6KKtfczJVC/quRDqg9wKPbc7HWjJ/60uRXgs1g03tCQ2DhPFv41
	2l3skikPXF1sFz57xkHQFStamLd6VKU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] ALSA: mixer_oss: Replace deprecated strcpy() with
 strscpy()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <20250618224926.GS1880847@ZenIV>
Date: Thu, 19 Jun 2025 14:50:04 +0200
Cc: Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Takashi Iwai <tiwai@suse.de>,
 linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <DA7484EA-83F7-496A-AB9F-2370BBBC0883@linux.dev>
References: <20250618223631.1244-2-thorsten.blum@linux.dev>
 <20250618224926.GS1880847@ZenIV>
To: Al Viro <viro@zeniv.linux.org.uk>
X-Migadu-Flow: FLOW_OUT

On 19. Jun 2025, at 00:49, Al Viro wrote:
> On Thu, Jun 19, 2025 at 12:36:29AM +0200, Thorsten Blum wrote:
>> strcpy() is deprecated; use strscpy() instead.
>> 
>> No functional changes intended.
> 
> Have you actually read the damn thing?  Seriously, look at the uses
> of 'str' downstream.  The only thing it is ever passed to is strcmp().
> 
> In other words, why do we need to copy it anywhere?  What's wrong with
> having char *str instead of that array and replacing strcpy() with
> plain and simple pointer assignment?

I read it, but didn't question whether copying was actually necessary.

However, it looks like 'ptr->name' can originate from userland (via proc
file - see the function comment), which could make using 'char *str'
directly unsafe, unless I'm missing something.

Something like this would skip one copy while keeping it safe:

char tmp_str[64];
char *str;

strscpy(tmp_str, ptr->name);
if (!strcmp(tmp_str, "Master"))
	str = "Mix";
else if (!strcmp(tmp_str, "Master Mono"))
	str = "Mix Mono";
else
	str = tmp_str;

Thanks,
Thorsten

