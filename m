Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4ABF137E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 21:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750454427; cv=none; b=CKA7c2Q/VA6fjXvDtX8tw7QBn7qu+en5jk472hu+GMMyBKMIEcOj55+zIHOM8yBYP4+D642ZPKht37Jb7HS0rVSkoi6IUG2RGIjhbyaGQ7/S3RSZoujBjQhV4QVJ2Vi3znlwUlViVtR7OEcR5Q0lnJwNfkGH8qxFdwO4ZgLFzok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750454427; c=relaxed/simple;
	bh=ZaEOR90hBsx9FAE+6dDtMjZHVKAuyFTQtXg0oHatjVQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=R1PXcqA45gyMWv/sOY5OyM2Uw6yzKEOfXkyoMK0poo5/XAU5dkG15bqJRGwCbXMOsIPbPg5bjav6pAfbZHu+ae6yi7UBk7leIf6ZXDShcgZKp47n3CvneIOsLxkIGH1kR0cv4BjHhL7DTPjP1ph46Ef4UcCUdhmxOGNz4dhVEvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=y30U/PDp; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=THGwC4If; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="y30U/PDp";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="THGwC4If"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750454423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q84NISkayGt4iFfCyp3cgaIA6uA9XD2L6yoXpNu0zAI=;
	b=y30U/PDpmFXXTmJBQ39F2mUnlII8wu1jlEm9lfVukC3InCZSTwFiQ7KdYrCOYP9oy152ZW
	kdNgQ6kkUp5//UnoTthdC85N9aoPjzPErsGJwyyJHXIG0XBU4JRDBMtZOh3B7Ux+nIlcd/
	hiDwhdPNEfSXCdInnHL3K5AjqhB48/8rlXevTEBRY44ZIVw2QalnR3lyRPoj9JMfsyat9d
	6eagelmAZAKZunV0cgnarbYqd308gVzO2Y2PXvFfTIfFuUzKQsAjKeP+sRzHe+zi+YRiTK
	znZHTRDOziciP515+T+POBHdWDY9B4kmuCO0Vqx62JqeJrBPWpp60XiVJ5rx8g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750454423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q84NISkayGt4iFfCyp3cgaIA6uA9XD2L6yoXpNu0zAI=;
	b=THGwC4Ifbbb1NuNp6yjXWMZ+lDfqQE4TLxquhbk7TIxg+F68GtXDNNIJDsQcvGLKN7aU3b
	9lsbeQnF1ELJn5Dg==
To: Khalid Ali <khaliidcaliy@gmail.com>, peterz@infradead.org, luto@kernel.org
Cc: linux-kernel@vger.kernel.org, Khalid Ali <khaliidcaliy@gmail.com>
Subject: Re: [PATCH v2] kernel/entry: Remove some redundancy checks on
 syscall works
In-Reply-To: <20250615082833.858-1-khaliidcaliy@gmail.com>
References: <20250615082833.858-1-khaliidcaliy@gmail.com>
Date: Fri, 20 Jun 2025 23:20:22 +0200
Message-ID: <87jz56p0tl.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, Jun 15 2025 at 08:28, Khalid Ali wrote:

Same prefix comment as for the other patch.

> Use SYSCALL_WORK_SYSCALL_AUDIT to check if audit needs to be done
> instead of audit context for consistency to other syscall work bit
> checks.

This does not explain why this is correct. I explained it to you here:

     https://lore.kernel.org/all/87frg2q1w7.ffs@tglx

You also missed the fact that audit_syscall_entry() has yet another
check for audit context, which means there is still redundancy, right?

Thanks,

        tglx


