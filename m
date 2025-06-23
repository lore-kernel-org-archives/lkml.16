Received: from frog.ash.relay.mailchannels.net (frog.ash.relay.mailchannels.net [23.83.222.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C07277813
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.222.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750696672; cv=pass; b=Bfk0LHshBrWtsrNtQkTHBci8tXu4wgIExQ7gdxwRx2HbCZDmWL4sDvRMU4jI2B7GMhqIo+3QwyTZOte5w4ROU1tGvccmMTrM4bMI7o6Vzb3qb3ie5Ngzfhsk9V0dwKopKzbU/3c0Du1rOvCTxE22VlSCIn2useDWt9Ti+XCtg5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750696672; c=relaxed/simple;
	bh=F9f9rrcSqXCHq/D5i1TfPTmVWWcxuSa12Xech6gShKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IGUKbUnQTElPY0Vb07wEGU6JYolojfgxKN6bCf8cKRptgNqhcUOBWxOoeeHYeq4BWBs/SPWGoRTW12PK5nPYq27IrlkHgAN5HDTGush6zWI6MZEcmHtnI1ikek3e485k75+8Q9Jx4gMQ/Wz2t9SatK5kqgpOPKCBJtDicFjFAu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net; spf=pass smtp.mailfrom=stgolabs.net; dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b=rbXYSI+c; arc=pass smtp.client-ip=23.83.222.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b="rbXYSI+c"
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id DC81A16638A;
	Mon, 23 Jun 2025 16:37:48 +0000 (UTC)
Received: from pdx1-sub0-mail-a231.dreamhost.com (100-108-116-219.trex-nlb.outbound.svc.cluster.local [100.108.116.219])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id DBD53164BA3;
	Mon, 23 Jun 2025 16:37:47 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1750696667; a=rsa-sha256;
	cv=none;
	b=oSeHRW5bHTv4OYZC0vr6G1aBsJGWFCdd3I8D6AC3niXg4PjIeS0+OwDQvbdQZ0N5A2ca58
	JJ0fTi0p++w0wP5ZgBL4qzAPo82rMRkD+tjJmVeKnOG410xPQuY3v6QqFMWJTMci69gikS
	Kmlk/YDokVbYUp2npIDt6JAOJSPxbgNf6dqBJTvM/SF6WGFirQRfHyau23u7B/1KdysXe8
	idR02tc4MqxPO1b3XsEEydpTlHbr9XTzFJmVvLnP9nQnygmywjFzMGhzFx5vy1aifQy5M+
	UmZla6SCowy2KO708WWFpr/KJpnEPhYPHIgZ+JDuwy39o9/NwlcLjgH2qQYZsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1750696667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=F9f9rrcSqXCHq/D5i1TfPTmVWWcxuSa12Xech6gShKE=;
	b=DlzCAuTCNTtWPiLP4JT3YxYSRs7oOlaXUYm9drUcbOH+hL4s3A8DHcM+8c337ohz6OpzSE
	9J4umRrIC3DCxCGaG+Pgbkm54/T3YqjTaB3j2x5Nzk45+DswnttEBagyAddiZYZyxRNLj3
	SbgFEerb+gsnBtGrh7zblrHKH1VA9SPCs3hh9v//F6Tn3MCRPx5EpAIUWnqheVuFHPhq5y
	y/D8cE8fdG9jkGUtQUAzb0dkhHc2sBBz2thCs7gXMKS32ypvIh5MCPf36JgdLEqGOWBrqW
	soWBFKLMHAjyxpvqZrFUBvMDi4YDeawg8JmD/g6tqjLM0JKUpuApioCt3ATHFw==
ARC-Authentication-Results: i=1;
	rspamd-6597f9cdc7-7kqxh;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Language-Tank: 2cfaeedf74dc8afe_1750696668669_2787627355
X-MC-Loop-Signature: 1750696668669:579541687
X-MC-Ingress-Time: 1750696668669
Received: from pdx1-sub0-mail-a231.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.108.116.219 (trex/7.0.3);
	Mon, 23 Jun 2025 16:37:48 +0000
Received: from offworld (syn-076-167-199-067.res.spectrum.com [76.167.199.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a231.dreamhost.com (Postfix) with ESMTPSA id 4bQtzb2CLrzGm;
	Mon, 23 Jun 2025 09:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1750696667;
	bh=F9f9rrcSqXCHq/D5i1TfPTmVWWcxuSa12Xech6gShKE=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=rbXYSI+cKHpCxHvyJaklRGJ6ew53ZGS1mAhaDuDayLEXPwLwvpWEVZt+ibuQh5m0k
	 kCqtsI/65flngJ4m6FoegPEPNtftu1X3CxPE0jjVj8mJeXpS2hdNyY1TSUePPMcskp
	 I0nCM2KvmQZrqFdltEGH54knylREai+9Gvs/rfRan2YbsPwfFJfEzd6BmJd06z+XUB
	 orn/nbzHY2BWQDzewbWjyKUEoHlCpvtZl5rv9hmHxqAoPQDhvytevkMKtS52WNfCYc
	 eySYvsAVKRRjalJ5dx0BxgyTbSyVyqrIHmPapOjsRzgLl8vAC0AK54tC1IzFlsZWvD
	 84pIFt24F8f0w==
Date: Mon, 23 Jun 2025 09:37:43 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org,
	=?utf-8?B?QW5kcsOvwr/CvQ==?= Almeida <andrealmeid@igalia.com>,
	Calvin Owens <calvin@wbinvd.org>,
	Darren Hart <dvhart@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] futex: Initialize futex_phash_new during fork().
Message-ID: <20250623163743.ocimtxqdrwnkffjv@offworld>
References: <20250623083408.jTiJiC6_@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250623083408.jTiJiC6_@linutronix.de>
User-Agent: NeoMutt/20220429

On Mon, 23 Jun 2025, Sebastian Andrzej Siewior wrote:

>During a hash resize operation the new private hash is stored in
>mm_struct::futex_phash_new if the current hash can not be immediately
>replaced.
>
>The new hash must not be copied during fork() into the new task. Doing
>so will lead to a double-free of the memory by the two tasks.
>
>Initialize the mm_struct::futex_phash_new during fork().
>
>Reported-by: Calvin Owens <calvin@wbinvd.org>
>Closes: https://lore.kernel.org/all/aFBQ8CBKmRzEqIfS@mozart.vkv.me/
>Tested-by: Calvin Owens <calvin@wbinvd.org>
>Fixes: bd54df5ea7cad ("futex: Allow to resize the private local hash")
>Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
