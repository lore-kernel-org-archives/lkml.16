Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A50920B7F9
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 16:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749831179; cv=none; b=BepollMi7zz5AbnrdIjE+XVBkOs/MrOR/VpWcWBQ2geYzB988q5BtJZKSL0iIQ/iKEE2QGJ/YZT1L7VcTZYlaw0KHOXXQtFbpNgnx83A7eenv1e5/AgE87WbDepRfWuVOSKjACSXoZsVSNC2ZdrNewGh4mwF1NC/r1DqFwHV0wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749831179; c=relaxed/simple;
	bh=ZZEne7qikLFkdQ3stkJCan3JkkGUHisvHyZAgqc3sJI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hRg3P6qZIsI6aEdQstc8MVNtE+xpDkbUiVtSkOQ2smpH2Zos8HKRvGjOIDWrnTI+C4nj9c3c09wf/MC+2UPTinj/L5FjYCi0Zml8R1xsynIF/07d9p+l5EwXgwWIMQa4t2xz1fu0RuA00g2uLOx+hk9HshJfqxXEL8J9ZTBRZTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LaRnq2Sd; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wt0D9bCV; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LaRnq2Sd";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wt0D9bCV"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749831176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m+jE6fzuh2gV3y2nxU8l7POmAwr9riaShkdw2Yq7x9w=;
	b=LaRnq2Sd7zjrHsTNdKv5UrcImIpEJPHRnp2URXd/jbTniT0/8z6Gqz28VrHpwuY1FRCZqS
	eFSRcFYxxFjQwFRuQeIr3bWVEcQ1FuCVAUNygexjzuJ85+xBHBvqU2fHYoEUMsG34h9zy+
	FbtHOR6317rxVWzc1Uc4acN/UatAqMq47/JQMhvQKxJ7klmvnrKKYQihN5dSqBDnrqBA3n
	MEU1w/ncv5lUcVsoziWTkNefCyXcCFb8bXjrSCZ2Yj9tAM4hdcyGqSfBfx+/NvJKAQyOGh
	ipAfq0TGKTvR3aYQ0o7/J3NW+eF92AoJgvpP7aJQxhVn2PbdcZ6wWzrDwFMFqA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749831176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m+jE6fzuh2gV3y2nxU8l7POmAwr9riaShkdw2Yq7x9w=;
	b=wt0D9bCVOv9a7E2WeC+fsQQTC+YtEtc9DVmi9CkDC4zhHPu4MsOeczHskUO3a8FuDLbw67
	BreZx5MDkssD4TAw==
To: Khalid Ali <khaliidcaliy@gmail.com>, peterz@infradead.org, luto@kernel.org
Cc: linux-kernel@vger.kernel.org, Khalid Ali <khaliidcaliy@gmail.com>
Subject: Re: [PATCH] kernel/entry: Remove unneeded header "common.h"
In-Reply-To: <20250611072400.4376-1-khaliidcaliy@gmail.com>
References: <20250611072400.4376-1-khaliidcaliy@gmail.com>
Date: Fri, 13 Jun 2025 18:12:55 +0200
Message-ID: <875xgziprs.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jun 11 2025 at 07:23, Khalid Ali wrote:
> syscall_user_dispatch() is part syscall user dispatch and it has a
> header already, so this patch moves that function to
> include/linux/syscall_user_dispatch.h which fits well. In that case we don't need 
> common.h anymore. All functions related to syscall
> user dispatch are on that header i mentioned, so this one shouldn't be
> special. We need to access the function from that header.

This word salad does not qualify as a change log. Please read

  https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#changelog

including the documentation it links to.

The reason why common.h exists is that syscall_user_dispatch() is a
internal function, which is on purpose not exposed globally. There is no
reason to expose it globally, so it stays where it is.

Thanks,

        tglx
