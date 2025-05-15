Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC1528B51F
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 10:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747304641; cv=none; b=WM2gCPrEAArYSIFSCNvuZvQ+gUCgvf7oKcDD5iJ2h4WEb5zINdxZtewVbUxzjJnegy0HCI1GGgzqh+8y59hQMsF4SRSmHTD2PbIXoZ/T2JcU9MVjlqkR+rN1zKkDwNyOC1CCFFrwfDlfrFroBG/VOddKCUvvxn6Kxk67RtvhatM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747304641; c=relaxed/simple;
	bh=Oxp2w9OWHirsw3ss15+AmDNksnPtP/J0KFspKwMNe30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kyF+yH9hXmrFyAicYo69v/NZ2RlZ6mpANTlB+M2+CEsNoDeI0kDZ0qLklMiPzFn3BuBiA0tRb47u2wZ+q+dciqvqQPyovilicDjtIzNEJB1Zd2ttVZWCral3Gtf9Y7s6QXMalbieeP9iUHFIQ8JeYpWsqB9FkXfCeNUp36Ewhd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bn5U8X6B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bn5U8X6B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88470C4CEE7;
	Thu, 15 May 2025 10:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747304640;
	bh=Oxp2w9OWHirsw3ss15+AmDNksnPtP/J0KFspKwMNe30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bn5U8X6B7dml03EGlo8AgWzAH9YVEYdA0xqHx+SU0/AsqYTFJMDA2aES4w9x4l5BI
	 qeQYupmM11W6vdK+QS17Ot5hdo/GTwT02cxjtojrr/uAWdWw5sa2qjGBKHfW7ZYtML
	 OXvn/C50ugm3OzqIgEHiI2+fCzaGK3Z73odbYiS8uCjnVcMjxKYx6UTu/o9FdvvUs6
	 2/nhWagH+Itgk9ZogZV1TVEbHe8QJOiP/sSGRHzMCWJHcB2sk0c+EX8lbfvX5DkKWF
	 edwUSn54KhhF+bDC37jHTzM5lyX6qZMx7PobWudWUSM89M7Kfp/WAn/K8VhB9MXlWl
	 p5aRKoalv761w==
Date: Thu, 15 May 2025 12:23:55 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH 05/29] x86/boot/e820: Print gaps in the E820 table
Message-ID: <aCXAu1xx48nS_MmU@gmail.com>
References: <20250421185210.3372306-1-mingo@kernel.org>
 <20250421185210.3372306-6-mingo@kernel.org>
 <aAcwYKtGMDv-AoL1@kernel.org>
 <aAc2o_W3ZIYPwMre@surfacebook.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAc2o_W3ZIYPwMre@surfacebook.localdomain>


* Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> Tue, Apr 22, 2025 at 09:00:00AM +0300, Mike Rapoport kirjoitti:
> > On Mon, Apr 21, 2025 at 08:51:45PM +0200, Ingo Molnar wrote:
> 
> ...
> 
> > > +		if (range_start < range_end_prev)
> > > +			pr_info("BUG: out of order E820 entry!\n");
> > 
> > Maybe "BIOS BUG"?
> 
> FWIW, we have FW_BUG definition, with that
> 
> 			pr_info(FW_BUG "out of order E820 entry!\n");

Agreed, I've folded in the change below.

Thanks,

	Ingo

=============================>
 arch/x86/kernel/e820.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 36b74b233bd6..c8833ac9cbf9 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -213,7 +213,7 @@ static void __init e820__print_table(const char *who)
 
 		/* Out of order E820 maps should not happen: */
 		if (range_start < range_end_prev)
-			pr_info("BUG: out of order E820 entry!\n");
+			pr_info(FW_BUG "out of order E820 entry!\n");
 
 		if (range_start > range_end_prev) {
 			pr_info("%s: [gap %#018Lx-%#018Lx]\n",
