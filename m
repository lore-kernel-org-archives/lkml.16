Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DDE288A2;
	Thu,  3 Apr 2025 15:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743693011; cv=none; b=qnsHhINPMZiF/J/m1A/d04nZB4z57o8mM6UBaZR8UmUfo1QyQgvkZrWk6n5dTN+ae5ozgepv2ku/zrtjISuIo9QZ0XQDcfS9kOzysJxYtfdDjAW2PVLaI9Tw/uS3qkIESwBl07+0ajlAfEagLoccqq+t/NQa3NWPl43IDG+15bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743693011; c=relaxed/simple;
	bh=V1lmana2G6EmWOiwfHVR5u2St/2u8/iUhU9ob9LilXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENgG371C6BKTOhDQ87DtMe5udYo0UeiZcdDOqwCdwmudqUNlwtjVfPY5/RFrfzWepUUpyIvb85mbplMbVYaQoGNr2axqg1/1H6wzipfI9Syj+LCtvqaEH51PqqeknioF+SPGh90jX9IGVfbAGME2E1eA/cLKMAaw98GvMd2i+c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U9pm5syE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U9pm5syE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C822C4CEE3;
	Thu,  3 Apr 2025 15:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743693010;
	bh=V1lmana2G6EmWOiwfHVR5u2St/2u8/iUhU9ob9LilXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U9pm5syEzaRJg2UhjExs5Qw/ZaSG+LZd0ID1kMwDflsgHdY73qTnUFyoutIygQgow
	 xQYu7HCuwQ7B81eEuwVc4sqZlZjbOJI08ceNx4dyMXHjWHW3ZXG03sLzE0fcQ2gBlG
	 sc7pUcVxpxbZafyg26Uhgc8ZkcAgajXdvegDWxdsPGeC9w/PgWPu4doi8AU2K//l/Q
	 mtAgKVZd9V79QaJ33VHASjwMcLw6bH0VEzWHSATDH4fZeui4+OAGKnuKtTFohHvvxI
	 bBrkisa7zCLMMfVxzQelKRDQZmBqUUyp6JsmhUzZQrW4RPQdUY8BDmaj0AvcKLw4C5
	 wsIIRhH+HU/2w==
Date: Thu, 3 Apr 2025 20:32:15 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, x86@kernel.org
Subject: Re: [PATCH] Documentation/x86: Clarify naming of CPU features for
 /proc/cpuinfo
Message-ID: <en5nisgiq2in7sjj2ysovxrqcuqh6ruhi32nsfrwamrt6odftc@jehodnirqa64>
References: <20250403094308.2297617-1-naveen@kernel.org>
 <20250403121727.GFZ-58VzYwaTBv4rbu@fat_crate.local>
 <4uxkf5riuv66kdxa7zteubdfsjy4vac6td5z6cckilyiqjceft@zk3mzmfv3lgk>
 <20250403132121.GJZ-6LUVmn5S2BMF-A@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403132121.GJZ-6LUVmn5S2BMF-A@fat_crate.local>

On Thu, Apr 03, 2025 at 03:21:21PM +0200, Borislav Petkov wrote:
> On Thu, Apr 03, 2025 at 06:40:00PM +0530, Naveen N Rao wrote:
> > As far as I can tell, the script still processes cpufeatures.h but no 
> > longer "generates" names. It simply picks names within double-quotes if 
> > present. I don't think that is relevant for describing how the flags are 
> > named anymore.
> 
> It is relevant in a documentation file which is called cpuinfo.rst. Because
> this thing is somewhat of a magic - and Xen has even more magic there - so I'd
> like that file to explain the *whole* story.

Ok.

> 
> > Regardless, please take another look at this and let me know if you 
> > think this still doesn't read right, or is missing anything (the script 
> > part, in particular). For reference, here is how the flag naming section 
> > looks like with this patch:
> 
> Tell you what: I'll take your text, put it in the file, edit it how I think it
> should like and send you a patch for you to ack. This'll save us a lot of
> time.

Sure, feel free to edit my patch as you see fit before applying. I am 
fine if you want to retain the section about the script - it should 
still be a minor edit, unless you want to rewrite other parts.


Thank you!
- Naveen

