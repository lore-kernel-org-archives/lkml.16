Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D5C3C0C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 03:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744081252; cv=none; b=Vqj1WnZKZrLHpuH0D6ogNoGWKnFys+LZsJNCLI1m7Sv9wah95w6p2f17hlEZ0eDw8eYV370U65KnZYgiNSyYRkkXI4O3BfCEOZDer/CieHWqi8BBrl5M7VdpmbANfzwlr3KwA20w8wIK0N6h1+FxHB1PY7O4jiBmRb1JMLCevog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744081252; c=relaxed/simple;
	bh=tHoSCxI+SWDvs0Q3b7BJoUvNL0mHMJ4tBCNOFHaxvxc=;
	h=Date:From:To:Cc:Subject:Message-Id:Mime-Version:Content-Type; b=Gmffhr5h4WVUTQBaJzob2lvoWvYTNC4KgxCCQ53++VQ3T2BZTeix2aG4VE5MaqdUlwL/T7607/DEYNqXM7mlGk7zBfTxu5pWzkvqAGzAK62o50hvMidWzY+NNsahXG1xLEzNDu5B+ENV0BY4s0ysZSVIIVxBSwMuNp9OKz/cjJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BffcAJhL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BffcAJhL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF9CC4CEDD;
	Tue,  8 Apr 2025 03:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744081251;
	bh=tHoSCxI+SWDvs0Q3b7BJoUvNL0mHMJ4tBCNOFHaxvxc=;
	h=Date:From:To:Cc:Subject:From;
	b=BffcAJhLeBhxAm1+0R+IBhig0PfoUGeOyzm+CIXFtKcO38vnDISUooWG8v/IW0PLZ
	 w/SbuPp5wbZ63bt8OylF8q0RVy2IRiYvkbRBddWNFnsI9gKIwPtivU13rqUqFnvx3T
	 ULpdmpanRJhxLVhwl4WC12m+4EXRV1nY/uEQNrRrO5sT0AYrOpl4+qe4SVaEswKD/4
	 69TlxnEUppLrx6vYpBmdbxTB5XJeUwVZa5lYfpeecB3K0IdR0VbgFFzFlfap0GNv6l
	 97I6VOLofRvhK5CRw+xbL6v0KTqU0D9wodmS57g7gy3ZbB/RF4PJlrXg2j5T9OCR7w
	 QV380RyvVoOYw==
Date: Tue, 8 Apr 2025 12:00:47 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masami Hiramatsu (Google) <mhiramat@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: [GIT PULL] probes: Fixes for v6.14
Message-Id: <20250408120047.5c643902769ba724aaae8326@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Probes fixes for v6.14:

- fprobe: Fix to remove fprobe_hlist_node when module unloading

  When a fprobe target module is removed, the fprobe_hlist_node
  should be removed from the fprobe's hash table to prevent reusing
  accidentally if another module is loaded at the same address.

- fprobe: Fix to lock module while registering fprobe

　The module containing the function to be probeed is locked using a
  reference counter until the fprobe registration is complete, which
  prevents use after free.

- fprobe-events: Fix possible UAF on modules

  Basically as same as above, but in the fprobe-events layer we also
  need to get module reference counter when we find the tracepoint
  in the module.


Please pull the latest probes-fixes-v6.14 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
probes-fixes-v6.14

Tag SHA1: bf8e826e269fd4454c4c7df4d4d662b99466052f
Head SHA1: a3dc2983ca7b90fd35f978502de6d4664d965cfb


Masami Hiramatsu (Google) (3):
      tracing: fprobe: Fix to lock module while registering fprobe
      tracing: fprobe events: Fix possible UAF on modules
      tracing: fprobe: Cleanup fprobe hash when module unloading

----
 kernel/trace/fprobe.c       | 170 ++++++++++++++++++++++++++++++++++++++------
 kernel/trace/trace_fprobe.c |  26 ++++---
 2 files changed, 166 insertions(+), 30 deletions(-)

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
