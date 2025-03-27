Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599781CCB21
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 21:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743110103; cv=none; b=RNx0GM/lUuCzLSLgrGW4nuy11D4Gd+yGpY5YbOli77YC/fGRsbg29b16fKPMDLlZCSJkEhdwboEZEWla5I3+ju+fN2f5EpqLUWHqhA2/IlbLId2v+HWOGabRR3UKyjglJkEWjXMKlXcBNzNG65nu7kMbvgRsqxEMNn/8O1CYp0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743110103; c=relaxed/simple;
	bh=EWv/+3wG0P7AP4s3fn4LKOLW28DoFuWXZW7o4M3ZVS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qp50chEiykuupqxWFO6s5/icHF0SfhwarpL76vloHJnOm47AyM4GVVvZ/PzBHBHYuShnUV6sSxYGS/Yph0nKKQdxViUCJyoqyJNrJW91vT9NXBfbNFFw5zNlljquznfIDdu+tlFSIgOTDcwH8lCrHD2UwKKIrax9jubQk3/4O3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m5h+c1Au; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m5h+c1Au"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD7F9C4CEDD;
	Thu, 27 Mar 2025 21:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743110102;
	bh=EWv/+3wG0P7AP4s3fn4LKOLW28DoFuWXZW7o4M3ZVS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m5h+c1AuT3h6wyFZhHuPHJW1M+QcBAtor5bLNgJV+Gxufplgj4BJzmRUVLdN/DzQO
	 /DY9lHAX1iP3ij9qS6WGqQzSDgFOnzJCqcT+WTLxHXuyjmbRbq3tm8F52mgUQOpTJe
	 6CVf02Iu7PUaR7jXFyB9p6lSvygxeX1lU8AzI/Tox2Z54KtoovG60ILULJVZajI/13
	 2stlYwXyjhFOn3QQmPVeURSnDePiY2jthzA0cBpALEcZ83zv+F33EVlTCkEo+dbzNY
	 s/cfOazItyhu//HGYC/MapBVen7CMm24g9p+0IQMqXDMerxoKxRY0y8XzgJswBT2cs
	 YZLfqNJfIHPMQ==
Date: Thu, 27 Mar 2025 22:14:59 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 13/14] bugs/sh: Concatenate 'cond_str' with '__FILE__' in
 __WARN_FLAGS(), to extend WARN_ON/BUG_ON output
Message-ID: <Z-W_0wKW1NHjXrKT@gmail.com>
References: <20250327102953.813608-1-mingo@kernel.org>
 <20250327102953.813608-14-mingo@kernel.org>
 <CAHk-=wihuzRytaFKr6b_pbi209JW+GWiNMtb9x-XhQdstxPuMw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wihuzRytaFKr6b_pbi209JW+GWiNMtb9x-XhQdstxPuMw@mail.gmail.com>


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Thu, 27 Mar 2025 at 03:30, Ingo Molnar <mingo@kernel.org> wrote:
> >
> > Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> > Cc: Rich Felker <dalias@libc.org>
> > Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> > Cc: linux-sh@vger.kernel.org
> > Cc: <linux-arch@vger.kernel.org>
> 
> You say that, but I don't see that in the actual email, which only
> went to lkml...

Indeed, usually I rely on the tip-bot picking up Cc: lines, but here it 
would be useful to have earlier Cc:s and my script had, for some stupid 
reason:

  --suppress-cc=all

... which certainly suppressed the Cc: lines :-/

Will take a careful look at a --dry-run output next time around and 
make sure the --signed-off-by-cc auto-cc logic picks up all the Cc: 
lines in the individual commits.

> So the sh maintainers (and riscv and s390 etc: same issue with those 
> emails) probably never saw this.

Yeah, will iterate it once more just to make sure.

Thanks,

	Ingo
