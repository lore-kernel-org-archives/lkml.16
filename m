Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A39A22A1E5
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747062105; cv=none; b=R5RWeSugb2SYtq8HSOXbVsP4fBxb9aUZM4XBV9Cng/rOzSJ7uCzc4P8tNJEqXTunh7jbTbz9itqoCfSg1BugAJLHcu6wImJs1ogPm2+I70OJABAPvfuxfvu+BpnnDR6WOPLJ19t78WSdwP0mniUzRv6K4pXevEXOSXgaikBv12A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747062105; c=relaxed/simple;
	bh=LO9PUVRyD9rWR8BpC6i14aNPLHIi4gbO3onxGapKvlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EBigaMrM59ov2iVJtdL4kOdE0zfOXyD8mgRvcY5o2XOPwMOFpmKMELGM0o12ULXPRIRYZYYvwlBpjmUHq+76v/tRaPO+sC13XkrMnWIe1iznlJFI9UtnbQXqlKQkETZMyFVhDShujTk8MNFKde/BeMpzl80heN9Tb2eyw06eIYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from cwcc.thunk.org (pool-173-48-112-151.bstnma.fios.verizon.net [173.48.112.151])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 54CF1Z8D010444
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 11:01:35 -0400
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id F0A8915C022D; Mon, 12 May 2025 11:01:34 -0400 (EDT)
Date: Mon, 12 May 2025 11:01:34 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: syzbot <syzbot+de24c3fe3c4091051710@syzkaller.appspotmail.com>
Cc: aha310510@gmail.com, linux-kernel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [ext4?] general protection fault in
 jbd2_journal_dirty_metadata
Message-ID: <20250512150134.GB200944@mit.edu>
References: <20250512144602.15519-1-aha310510@gmail.com>
 <682209b0.050a0220.f2294.0066.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <682209b0.050a0220.f2294.0066.GAE@google.com>

On Mon, May 12, 2025 at 07:46:08AM -0700, syzbot wrote:
> > #syz test https://asdf asdf"></a>)('"><;
> 
> "asdf\"></a>)('\"><;" does not look like a valid git branch or commit.
>

It looks like this was a reply to Jeongjun Park's request (in
Message-Id: <20250512141322.15270-1-aha310510@gmail.com>):

#syz test git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

Or at least, his #syz test was sent less than 30 minutes before this
reply; and syzbot didn't respond to his #syz test; and his #syz test
request was a plain text e-mail without any text/plain vs text/html
hijinks (I checked).

Maybe someone in syzbot land can investigate?

						- Ted
