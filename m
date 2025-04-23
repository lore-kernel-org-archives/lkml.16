Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D551A23B9;
	Wed, 23 Apr 2025 13:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745415904; cv=none; b=n69eIXi3PWKUFgEFGOEqe1eb2VJcbcwv+ntAEb6LX1uaRvmAQwhMjKGiVjS2S/qDL12jLECAnGnmk9fb8XvUfKBvLE9TznyiiAinIo5U1vFpYuO0IB+N5gULxjzihI0RsOJCH7Qhi/b7B93j1XelAjpZT6AngSxng+EcIZi0UAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745415904; c=relaxed/simple;
	bh=pKFVKAxUZqlNuBJ/YpfTYcB0OgoYY9BOOpzjbevN0ZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tfjNPTZb/rh66YBWN6giKxmN7uVDBZ69vd5LbXiFpIasfBGZba2Cnc3uKQhDHyYaXj3a/sPINvH2wol4nCdc8Lu5tzhiXfioydqKjSLAXW3ghCm4JXrlCwCZ34pdxGqQfmL6SqDsV7S0P6dEyuseo+/fyaJLJyzEQWrsA4zhky0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93D8AC4CEE2;
	Wed, 23 Apr 2025 13:45:02 +0000 (UTC)
Date: Wed, 23 Apr 2025 09:46:55 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Aithal, Srikanth" <sraithal@amd.com>
Cc: Bert Karwatzki <spasswolf@web.de>, "Paul E . McKenney"
 <paulmck@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Kuniyuki
 Iwashima <kuniyu@amazon.com>, Mateusz Guzik <mjguzik@gmail.com>, Petr
 Mladek <pmladek@suse.com>, John Ogness <john.ogness@linutronix.de>, Sergey
 Senozhatsky <senozhatsky@chromium.org>, linux-kernel@vger.kernel.org,
 Linux-Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: commit dd4cf8c9e1f4 leads to failed boot
Message-ID: <20250423094655.2a0e25e0@gandalf.local.home>
In-Reply-To: <647b9aa4-f46e-4009-a223-78bfc6cc6768@amd.com>
References: <20250423115409.3425-1-spasswolf@web.de>
	<647b9aa4-f46e-4009-a223-78bfc6cc6768@amd.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 23 Apr 2025 19:09:42 +0530
"Aithal, Srikanth" <sraithal@amd.com> wrote:

> On 4/23/2025 5:24 PM, Bert Karwatzki wrote:
> > Since linux next-20250422 booting fails on my MSI Alpha 15 Laptop runnning
> > debian sid. When booting kernel message appear on screen but no messages from
> > init (systemd). There are also no logs written even thought emergency sync
> > via magic sysrq works (a message is printed on screen), presumably because
> > / is not mounted. I bisected this (from 6.15-rc3 to next-20250422) and found
> > commit dd4cf8c9e1f4 as the first bad commit.
> > Reverting commit dd4cf8c9e1f4 in next-20250422 fixes the issue.  
> 
> 
> Hello,
> 
> On AMD platform as well boot failed starting next-20250422, bisecting 
> the issue led me to same commit dd4cf8c9e1f4. I have attached kernel 
> config and logs.
> 

What is commit dd4cf8c9e1f4? Please use human readable text. The sha is
fine for lookup, but without the title it's meaningless to me.

$ git show dd4cf8c9e1f4
fatal: ambiguous argument 'dd4cf8c9e1f4': unknown revision or path not in the working tree.

Don't make me have to download linux-next to figure this out! :-p

-- Steve
