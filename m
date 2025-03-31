Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4780524F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 12:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743425375; cv=none; b=UjJNucLCjbYac04fkUkISDr7b+ptuP8Cy20SJJsb+/yuVZ6eMp9ZcbVD0xu/UBa4LKqhOLrFX1+qtVd3nqgtCtiLKeZznHDOnYDtMWMAvpehRdU+qEvBN8NdHF6NFW3Bzk2BDsdWFKImJ48Kbtr8Wp8b9s/tQZfJe5vCCr+HCTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743425375; c=relaxed/simple;
	bh=uZKGcVBYhpFMbuhsl5ANqmWXYozs46bnADj/Hn5QquE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PwU1NP0qgPH/6g1dnZp8XLMSPqu2l8rh3NTkAgsvsYHlD79OWVfetq7EzyMBfIkynGNxjao6yNsB1IOq8S8MgNCyAhae368iH3s2GQS8Z4cMTMxVkHXLMqmL63ypeod1ztsFGZM1+je39CHAMoiqdHisz1UAjqD1WpzzJ6f5KLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=AVRSgelR; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="AVRSgelR"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 309F140E0215;
	Mon, 31 Mar 2025 12:49:31 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id HY6FgqEIX870; Mon, 31 Mar 2025 12:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1743425367; bh=i4ZZg3Y6legd+FBIC9p1MNaHaWs74DOqujPlHLES004=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AVRSgelRKRl/Kzh9yJZyyPZ31M8UBs+dzsjH0HJ1OYqi+u5qlVT/xlM1qtSBB/w8F
	 /wGnRiFgkISsbtre2NdxYvdQPaMdgu9YygczHrqergCdd9HG8vP4G1zOy8D69C3A27
	 KSryUM5dN2Kc5GA5w+vLW+IHTShpCU3x5MtALh2Ig2A2QyRtNi3UlkK0E668AXr7zK
	 lYYqOJkZFW0UQaPqARmKDBwbpiFow2o3/iInGavxQX46lSbfUaQCv+2rjGbwwTtvjE
	 rn8cQ6AiwqwvOiL/fbL4W0N8XJ/3zzFDDtAV1R0qzhPyOVIOInNV1WS4R9Pc+NXxfx
	 IsxAZfAH0X2QmY6MEIb2X4flBeGiAD23OiKsGi7z44bGb+ASddNaF18pn4kErgEWOA
	 KQUOiPNJfWQBOUOTtUnqMANOFtVfW6sns6+8ReNdLo36HbW55SYJ1aHkGdLAPuMWQs
	 lC4fr4iIeYZFP/18M3t3zsG2XFvOE2N4yhcRYIvXROLNk89uL6DSUBJzpLm2QoPBLc
	 ESRo01ogCn9ydwnduLy+/3pUsRBSdKjSihLUDDafft8WHE7W9ijMEz9JVOv9tvrFiC
	 0oqRfS+DJtgrHgFuOvmb9rNMy592SfqvNcRfXgmVwVfZz1IeAH95PblxBhqFM4Vbpf
	 zYRJ6lEQb/TX7QndjNLlBErc=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 3EA0640E015D;
	Mon, 31 Mar 2025 12:49:18 +0000 (UTC)
Date: Mon, 31 Mar 2025 14:49:17 +0200
From: Borislav Petkov <bp@alien8.de>
To: Philip Li <philip.li@intel.com>
Cc: Ingo Molnar <mingo@kernel.org>, lkp@intel.com,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	Peter Zijlstra <a.p.zijlstra@chello.nl>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [GIT PULL] objtool fixes and updates
Message-ID: <20250331124917.GGZ-qPTTDyO7hsZkAT@fat_crate.local>
References: <Z-cSQXJKMyBSfAAc@gmail.com>
 <20250329153242.GAZ-gSmu8qiXufR04k@fat_crate.local>
 <Z-qCrbNvP2cil6jJ@gmail.com>
 <Z+qLDGvkY+TXdCjK@rli9-mobl>
 <20250331123649.GCZ-qMYfyI9gZWwFRm@fat_crate.local>
 <Z+qOKZ2xNK+hUP6x@rli9-mobl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z+qOKZ2xNK+hUP6x@rli9-mobl>

On Mon, Mar 31, 2025 at 08:44:25PM +0800, Philip Li wrote:
> I will also check this as it is designed to have link together with reported
> error in the summary. It is another bug that the bot should be fixed.

Please.

> Apologize again, we will continue improving the bot to make it really useful.

Thanks, I appreciate the effort.

If you need guinea pigs to look at reports and give you feedback, holler!

:-)

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
