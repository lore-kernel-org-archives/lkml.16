Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D812E11B3
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 17:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749834669; cv=none; b=SMce/mDrGOqNGwLanDgQ8EQkrgd8wiqSow9qDIP8E4RNfdLykdUrxTib2HqvSx02Pog/MsY11WbA8MjQLk8RdvfJVobky3XeHKuEPqAqkLyScWs6Ssuo1EabehZywJQnv/P0OGp1eW4OjYOu8Ugs5ju5ec2k7WbdpQfSyWqMCr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749834669; c=relaxed/simple;
	bh=+SipqIhOiSKR0InF7Tt3kVuGYtzJHH0UgGjYFcqEIwg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QXDlAFdF4/N6bfkUQgV/i2T6uGnpAHjWKav1EP3oB6QYjxq/m1RsYAS/aUKRf97jYguVyBO0uQkFLI+qozWvrKdka/1WmRBFLIya4q41DvWUA0UfKn5VFDsszJHtumjods7xSsVpmRQEgpkJGVq1rmLu8uMNS7bemAvlExChNho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf17.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id F297A1A0D92;
	Fri, 13 Jun 2025 17:11:05 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf17.hostedemail.com (Postfix) with ESMTPA id 45B8518;
	Fri, 13 Jun 2025 17:11:04 +0000 (UTC)
Date: Fri, 13 Jun 2025 13:11:02 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [GIT PULL] tracing: Fixes for v6.16
Message-ID: <20250613131102.472dd6dc@batman.local.home>
In-Reply-To: <CAHk-=wgSsH7EwNbyKrMOuXs8RRN4CF4WSzxtL8w3vOVxX7+16A@mail.gmail.com>
References: <20250613114942.61ee3dc5@batman.local.home>
	<CAHk-=wgSsH7EwNbyKrMOuXs8RRN4CF4WSzxtL8w3vOVxX7+16A@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 45B8518
X-Stat-Signature: 8yskdt6ywagt35zea1t619fwfsbdrigc
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/IAV7QrV5zfKkIphWSfJsUyOtHUO78xMU=
X-HE-Tag: 1749834664-468409
X-HE-Meta: U2FsdGVkX1+CPIVnOotykHkbQXCTyTewDWrZ81pPHSPH2pf5bexUzp8qJ8MJ+As47RK6AF8S6MxIc67KdDBMFOreBb6Q6Da2UZXHAmGLuqN0coMDhDkJSkuI6LO+86GNHLcGzWpPWMHBCIUjifFREc42a399SmR3OWkNph6Ql2YXXbZo6+ORxFZG7ENMvRPLUkMQOOGMRR0z9NMpNGXae2XIX0t6IrdwU+vdzIMAM3jmn5ltMpLroCk421b6EUNMTE1sbByanHqYkn+kaOwCW+yOw3Kmyb4bSGV0/D0e7Sksqkb2bxif84p9ZisNEf801rykXvYGOkaVgOyeRnZkjlOQkEvUUEslC0tAp7+qudSSNq9Cp8erxHnhbIYu1NzpLenDLDkyC7PxRe70lHtcSHkUmF2n0n368J1C85aJlC6jSt1AQ67l+A==

On Fri, 13 Jun 2025 10:05:17 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:


> I see the HEAD in the 'trace/fixes' branch, but no tags anywhere.
> Forgot to push?

Yep. Sorry about that.

I just pushed it now.

-- Steve
