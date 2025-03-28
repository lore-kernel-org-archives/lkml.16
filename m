Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755A1158538
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743169992; cv=none; b=HmF9b+T+tki18INgeUYOWX6GnHdDxIC/imFleu+0nGdSkB2xJskd8FcXjNSZ2JShAL5eHa6kPMG3y1mqBW5x1mC9sFIJKKA/z31v+U11fDqk5083N+bW1nu7z6a16yO9XZuXqJ6jIbxGp4n5FfGJAnC+h8o+yyeCx8R8/kyyfDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743169992; c=relaxed/simple;
	bh=QpQXk4zm5AZSqDMomscvAL2yt23D5+PTjvZd0kqYvwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tloacdIKfsLrMvP2/PnujrSpVkDe/tT5z3egy1/TC9dVZ6mis2LW0YihSR5Gj6u1uu+QiFPJxd+ml0/Dyfyp7k7UXU6jehg6b8pMcCKxQl0DMZaWWPFRoEcAccq/MaxjO6qFDqVoSyYjui5N4/tAO/g4Jp3CVHKfopdvp9A5dPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UHn2qnfH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UHn2qnfH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6BC0C4CEE4;
	Fri, 28 Mar 2025 13:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743169990;
	bh=QpQXk4zm5AZSqDMomscvAL2yt23D5+PTjvZd0kqYvwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UHn2qnfHPf3NAnfDLwKcyuVBuHJjBRnNryMGE7Tko7GQBnb9SmfH7BjvSDgMCxV6P
	 jMvcTvpErsqrTvoKnQBzutWoM57B/KzffAb78MwDhBJ6H+q3IuD+/7vFGb7FMt9sA8
	 KP17F+mDF8F5zj+4Z0z3bvoJB+BJr1mqurhvBJ2phbgqih1lKmt0kfYcgeHmXzpmcV
	 P+g477Ybxm5xT0ZXcQOuUMF7KWJJXZ/eRRlChgDDCR8IsMHagm2174wMBxLreS0Ov6
	 vWj4F1Phfiv0CSpoo6sBXfcLcmJtVBHSylIMybut5ZcrDRPZHn41ZOgTDr4/D5zM2I
	 BpFAMHHRFFLYA==
Date: Fri, 28 Mar 2025 14:53:06 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: boris.ostrovsky@oracle.com, linux-kernel@vger.kernel.org,
	tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com
Subject: Re: [PATCH 0/2] Clear AMD's microcode cache on load failure
Message-ID: <Z-apwoVEQkwCH-Y2@gmail.com>
References: <20250327210305.1694664-1-boris.ostrovsky@oracle.com>
 <Z-XEPVvEDhC5vzR4@gmail.com>
 <f8ec905f-04d4-46f6-909c-7f79b151c0df@oracle.com>
 <Z-alzhvfSXN4liNE@gmail.com>
 <20250328134544.GAZ-aoCA03g9SygDnW@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328134544.GAZ-aoCA03g9SygDnW@fat_crate.local>


* Borislav Petkov <bp@alien8.de> wrote:

> On Fri, Mar 28, 2025 at 02:36:14PM +0100, Ingo Molnar wrote:
> > It would be a pretty common usecase to attempt to load the earlier 
> > version if the loading of a new one doesn't succeed, right?
> 
> This is only for late loading and no one should do that anyway.
> 
> And load failure almost never happens - unless you're a cloud guy doing
> special hackery.
> 
> So no need to expedite this as a fix - the majority does not care.

Well, it's a regression over previous behavior, so it is a regression 
fix for an upstream change that is only a few weeks old, and it's an 
overall quality-of-life fix for those users that are affected. There's 
no exception to the expected upstreaming of regression fixes just 
because there's few users affected.

Given how simple the fix looks, and how fresh the recent big microcode 
loading changes are to begin with, I think we should apply it to 
x86/urgent and then (maybe) it can be forwarded to -stable in a few 
weeks if there's no problems. (Or not.)

Ie. my main point is that delaying it to v6.16 is not justified IMHO.

Thanks,

	Ingo
