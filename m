Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999012222D1
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 12:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748521352; cv=none; b=iqj+qHtyhfcI00yEGnKC59nwvpyNjE5o/u2AsIcSGFbP0SWmSie9pw6ka4RptdVN2SKziOTlhFgCzL66cyWfL0LG1Peckhtc+hVwJFjyhJkjxvk7eT/BLZuSo8e31YOSv9xVtAA3W0IZTDNeo6TV/QDLrEdOHiY3PHh/3F6rU1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748521352; c=relaxed/simple;
	bh=csrzy2XCqFRqP0SzPq6qUnx4IDi16rO5RtgeCx7Gmyk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OPcp902KVZkx6aLpTrLykz511lWeS7MTdRGpQ47PbFJgUBdtuy1VJUupWzzizM/VnR88oJpHO0EdrR9VS8e1wjPaR68cEpZZUCHtHwlAurfN+WR8IOuRn/T+320D8h1p+rmSi1Cf88Un47khN8jj47hIXo4GyqF4KwH2nQq2+L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C306C4CEEB;
	Thu, 29 May 2025 12:22:31 +0000 (UTC)
Date: Thu, 29 May 2025 08:23:33 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Pan Taixi <pantaixi@huaweicloud.com>
Subject: [for-next][PATCH] tracing: Fix compilation warning on arm32
Message-ID: <20250529082333.655cc7a8@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace/for-next

Head SHA1: 2fbdb6d8e03b70668c0876e635506540ae92ab05


Pan Taixi (1):
      tracing: Fix compilation warning on arm32

----
 kernel/trace/trace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
---------------------------
commit 2fbdb6d8e03b70668c0876e635506540ae92ab05
Author: Pan Taixi <pantaixi@huaweicloud.com>
Date:   Mon May 26 09:37:31 2025 +0800

    tracing: Fix compilation warning on arm32
    
    On arm32, size_t is defined to be unsigned int, while PAGE_SIZE is
    unsigned long. This hence triggers a compilation warning as min()
    asserts the type of two operands to be equal. Casting PAGE_SIZE to size_t
    solves this issue and works on other target architectures as well.
    
    Compilation warning details:
    
    kernel/trace/trace.c: In function 'tracing_splice_read_pipe':
    ./include/linux/minmax.h:20:28: warning: comparison of distinct pointer types lacks a cast
      (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                                ^
    ./include/linux/minmax.h:26:4: note: in expansion of macro '__typecheck'
       (__typecheck(x, y) && __no_side_effects(x, y))
        ^~~~~~~~~~~
    
    ...
    
    kernel/trace/trace.c:6771:8: note: in expansion of macro 'min'
            min((size_t)trace_seq_used(&iter->seq),
            ^~~
    
    Cc: stable@vger.kernel.org
    Link: https://lore.kernel.org/20250526013731.1198030-1-pantaixi@huaweicloud.com
    Fixes: f5178c41bb43 ("tracing: Fix oob write in trace_seq_to_buffer()")
    Reviewed-by: Jeongjun Park <aha310510@gmail.com>
    Signed-off-by: Pan Taixi <pantaixi@huaweicloud.com>
    Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 2c1764ed87b0..b60d495c2a79 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -6891,7 +6891,7 @@ static ssize_t tracing_splice_read_pipe(struct file *filp,
 		ret = trace_seq_to_buffer(&iter->seq,
 					  page_address(spd.pages[i]),
 					  min((size_t)trace_seq_used(&iter->seq),
-						  PAGE_SIZE));
+						  (size_t)PAGE_SIZE));
 		if (ret < 0) {
 			__free_page(spd.pages[i]);
 			break;
