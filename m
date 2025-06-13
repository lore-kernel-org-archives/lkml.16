Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6743275B1D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 12:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749817010; cv=none; b=szGfhZy5zetYVubbWYhmdo8Wa+9m9x2qACIOBtQaQbRQh9Bxpvd8eiH4cOAUoL9wFVGN4gW6rlwTLxHWsV2+IjkyRiPFI16srKzgsqX4TO65vN6BnXPPDqRLXnA5sHtQNvzn8PXvWlbPywWh1wVsqkBZGBcn7J58cfPqwnZXYfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749817010; c=relaxed/simple;
	bh=SfoIr08rFFEuKJXvO7anMKrnwyitTK87jSRVy8mAH+c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BqCXA0APNrUmU6+vL976+SNebhRRa7PXSflBYl/uKMidoTfw4kCuh+ChHZ3/62UOhEiC8FvoaaWvLn7dwuoCuwwYbEb1TqznDvXZDiQV1E1V0zFeUhDCWYfyqAJ14dyo4DE8AISchgnefxo8B1fQEbqFDYrI4Bn0chozFAzw04s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf05.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 7391616041D;
	Fri, 13 Jun 2025 12:16:47 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf05.hostedemail.com (Postfix) with ESMTPA id A68BC20010;
	Fri, 13 Jun 2025 12:16:45 +0000 (UTC)
Date: Fri, 13 Jun 2025 08:18:22 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-erofs@lists.ozlabs.org, Gao
 Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>
Subject: Re: Unused trace event in erofs
Message-ID: <20250613081822.12e55023@gandalf.local.home>
In-Reply-To: <20250613081728.6212a554@gandalf.local.home>
References: <20250612224906.15000244@batman.local.home>
	<0baf3fa2-ed77-4748-b5ee-286ce798c959@linux.alibaba.com>
	<20250613081728.6212a554@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: A68BC20010
X-Stat-Signature: m6udp5jjwegyfd1fdgkg9u4nwyp6sj8y
X-Rspamd-Server: rspamout06
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/YlOrz9rks9Xb9kZ1ETrQ3G/D/yxbpkjw=
X-HE-Tag: 1749817005-7527
X-HE-Meta: U2FsdGVkX19UnAUqeEpj35VQFLUlVpMOFJ+N+8y0g/XHToHOaa3gINOQWFY5FEcon3recYuI1u1W8jDnXUKGJBhc5p6PrWy1qk7uT/fmr/e+9iqAY97YwkmWkazLX/wvIygdtF7/hkvVfX6+m8Ny3eY0cRYoEDCOMx05DjLFzQM6it6KpC1lIh2L54TJYQWo9+8praYknIKAMvjdYGIFTO3npXmjBgaFnKrTsC4kwoVsgWVDNx4RsVAszXTBSjKoZzCFGWGy2scRrsh60aBgkQN+l3HYDY15MG7ebC7K92WB4LhyYgSjOfZW0JfO2X43zXGj6zcq9sXsK96htK0v0+A4gYkIEL2J55bWFCvlxD4AYi8ix7Btf9+eCSnDLv9NOVAMsZMUnpvqeaSt0th3Iw==

On Fri, 13 Jun 2025 08:17:28 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> Please make the patch. There's too many for me to do them all.

You're not the only one with unused events. When I said there's "too many"
I meant in general, as you only have one ;-)

-- Steve
