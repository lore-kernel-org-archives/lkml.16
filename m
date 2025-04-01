Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772792036FE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743519349; cv=none; b=aORBM8Z+jxxLmBo99O/YRjLwkeji6CKcjvC7vwZP06/lrzEwxHhdWCVDB6yCtnSiS5QJdV/BDO8kNo6TDDlFdufqiIb/WRH6ZM+eKtchIu02bDnbmplCf/rmsCQrVCjPc31/uYCFjP6KsOXgRPeSKBbUC2GqyWA6i74n7wxF0jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743519349; c=relaxed/simple;
	bh=AJy09il0eyMI2sk0qCoS+j7Iy4LNr+zEPi7uOPurVzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQotYTYkB2hLFsSXQ7+wVw84mszBXiCMHsCbqihQzw8h2hnveXWewdFZRNwnXU22CqwJAHd5FgtyLUdJz+IFmZftmV1JEAPvxhyWDZU16SS2HgIo9m3jBA3i0s67LGstpEJqotGo0d1FsxFpqfVMjujfXR7NSgw7+WwtuWvObqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=huw3PFlX; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="huw3PFlX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AJy09il0eyMI2sk0qCoS+j7Iy4LNr+zEPi7uOPurVzQ=; b=huw3PFlX6+fvAuraBULFbPca6U
	vrcfQ03lQ4AdDlnEnofqyVkEVkJyCpPjqT1F3Mj81/9I0T+kJmUukzKZ/Un3W6WkeGTmEpe8fcNJU
	hKaMvv352v2sbHa6BQXj2tIUBcpoPE/T2B/g2yIPzc+YSdkwM+O1GdwGrVn4EMerhyRcuukj3W5/c
	HlLsqJ3XpWfN3fGHq8gjLws0V9cSV2JecFeCnISRxkXcrKosaxAL41V9F/VcjVRRP3QE56NSUDQvR
	/2nF1qwQBLf1o73UHgaHpV1ba0u+HMe63VHh6IclZfl+T+e9kxCp0chcySNnh/lhL63m1U8gLPryc
	AjsP2YcQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzd1l-00000007UsH-1oZf;
	Tue, 01 Apr 2025 14:55:45 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0997830049D; Tue,  1 Apr 2025 16:55:45 +0200 (CEST)
Date: Tue, 1 Apr 2025 16:55:44 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org,
	Juergen Gross <jgross@suse.com>, "H . Peter Anvin" <hpa@zytor.com>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 00/41] Simplify, reorganize and clean up the x86 INT3
 based batch-patching code (alternative.c)
Message-ID: <20250401145544.GL5880@noisy.programming.kicks-ass.net>
References: <20250327205355.378659-1-mingo@kernel.org>
 <CAHk-=wjwuO8UVLP5N7972TmfVc+sYEekcnZMF4rQLr662j7oXQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjwuO8UVLP5N7972TmfVc+sYEekcnZMF4rQLr662j7oXQ@mail.gmail.com>

On Thu, Mar 27, 2025 at 03:19:40PM -0700, Linus Torvalds wrote:

> PS. The casual meaning "tp" has in English everyday language is short
> for "toilet paper".

Yes, which is why the old names were awesome :-) /me runs
