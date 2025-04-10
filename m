Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4407D20C03F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744274563; cv=none; b=F7oWMUwC5HZ61JBkz0e0jOlX13gw43j7As7MOYPQKbR3Rub1uJIquT50X8IDJEEl9Xzlrxm1VXk5xR4vN0to3f6HzfDVBPZ2dQdPpeHfsLTvrN9Wmg6/BMVfYabn6RmbWqcI/bMRu6dGOLOn5LP1w0QH/9M5rLUvHyMQ9h5jYr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744274563; c=relaxed/simple;
	bh=4x2pJ/3gR4zTelTEP4JEeBrwQqbjkYq3/RKcwQqzT1U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=d3dRZlrvY+J/ejGreDaa6PbIbwQJ8Xh+6j8WFWNslR0nXe8i0TdkSEyZ4R9ff70bWD5WGYFP2C2fcNndH4/z7tl0HUP7qptNbgwIBg3L1POJBztW5YIz8LwtAKG3czUmCwejieJrCEzgZOgZ6FGbDe9kKguk/pHnr0rzHvLdrN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HP5yuzo9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bMQZSZmh; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HP5yuzo9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bMQZSZmh"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744274560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pKXwQikwTKDD20gwM+YQi2ybtx3E1QIf/rOHDJaeUEc=;
	b=HP5yuzo9xYR7wvfYu2ymXQ2uASFkXNhhx+h6Qzafo/+RZhM6MvrX7cUGVPYQFO84X4f2QH
	m1CXHJ5ZJ55wVXEmFUm/uCjIAfp21kUJ6VBk44oJ0jF3eLCqo3mOnoWP0oJ9K773USDKV0
	8Im/waInNus5R3uOk4SUO3kk6kVLbl36UB0Ui+n0RyNHk6f37Shgm5NLfIQWznp7ZvCyw8
	dHVp9b0REvm2oKDb6lamGVnULvAi3EAXqNtF4B7C99tg4sTG4Xfjym8sP8K/yV70+I4GYJ
	uzVOunyQSefCFX2Ikg3cCJUKrcGRaroM2CeR/18s39/dfArOpbMyhv4L8/Uz3g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744274560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pKXwQikwTKDD20gwM+YQi2ybtx3E1QIf/rOHDJaeUEc=;
	b=bMQZSZmhzM4xljp18CB83PujtKtFgJmgzDMOujyIPduAo7ASseG7QjqcHskw8iU16vPdX4
	ahf4XpgFu//HmZAg==
To: Cheng-Yang Chou <yphbchou0911@gmail.com>, linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, mingo@elte.hu, corbet@lwn.net,
 jserv@ccns.ncku.edu.tw, Cheng-Yang Chou <yphbchou0911@gmail.com>
Subject: Re: [PATCH] IRQ_NOTCONNECTED: fix typo in comment
In-Reply-To: <20250403073902.265838-1-yphbchou0911@gmail.com>
References: <20250403073902.265838-1-yphbchou0911@gmail.com>
Date: Thu, 10 Apr 2025 10:42:40 +0200
Message-ID: <87bjt4tnjz.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Apr 03 2025 at 15:39, Cheng-Yang Chou wrote:

'IRQ_NOTCONNECTED:' is not a proper subsystem prefix.

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-subject

> Fixes a minor typo in the comment for IRQ_NOTCONNECTED definition:

s/Fixes/Fix/

Thanks,

        tglx
