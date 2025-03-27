Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5677B81741
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743091545; cv=none; b=egx4jx0Jh3H2J0hb6qTev1aqcPeeThl7hweTaIMrgO1kCNXP32VwynFAdkicYZjQfm76Kkvt1ntNodtVOdShngfI3Mpa1RkKOVMf6gUCZS+4RxQOiMwI3fFgfS/9x9miSkllez3AXRy8RLa6ukK3lZYFCeXhOZy5sDdtFfVlXPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743091545; c=relaxed/simple;
	bh=A1DnH5xupDQ/Zzlp4LDxYu4mVe2fclD2rCWvfGPregY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hdTBd/4k0U8YC6Jm6WpUcRi1vpl9rWcFA+YJE+5Ig/8NmlqsQfjDS+ZzuaNsn6B9aijBYhnDCBTsqWGxK3/04ptOEU5hflEHlKp4CU4LAyb3e7g06Bru5q8RVv+r2WMp8lvCbSapEdhmMs5fVEHMENAJaNJvlUudFaAz/PZdNvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10809C4CEDD;
	Thu, 27 Mar 2025 16:05:42 +0000 (UTC)
Date: Thu, 27 Mar 2025 12:06:31 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Gabriele Monaco <gmonaco@redhat.com>, Tomas Glozar <tglozar@redhat.com>,
 John Kacur <jkacur@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Stephen
 Rothwell <sfr@canb.auug.org.au>
Subject: [for-next][PATCH] Documentation/rv: Add sched pages to the indices
Message-ID: <20250327120631.61c974f7@gandalf.local.home>
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
latency/for-next

Head SHA1: 4bb5d82b66002b770f8917d68ab4fbefcb7f5f9b


Gabriele Monaco (1):
      Documentation/rv: Add sched pages to the indices

----
 Documentation/tools/rv/index.rst | 1 +
 Documentation/trace/rv/index.rst | 1 +
 2 files changed, 2 insertions(+)
---------------------------
commit 4bb5d82b66002b770f8917d68ab4fbefcb7f5f9b
Author: Gabriele Monaco <gmonaco@redhat.com>
Date:   Thu Mar 27 09:12:40 2025 +0100

    Documentation/rv: Add sched pages to the indices
    
    The pages Documentation/tools/rv/rv-mon-sched.rst and
    Documentation/trace/rv/monitor_sched.rst were introduced but not
    included in any index.
    
    Add them to the respective indices.
    
    Cc: Jonathan Corbet <corbet@lwn.net>
    Link: https://lore.kernel.org/20250327081240.46422-1-gmonaco@redhat.com
    Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
    Fixes: 03abeaa63c08 ("Documentation/rv: Add docs for the sched monitors")
    Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
    Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>

diff --git a/Documentation/tools/rv/index.rst b/Documentation/tools/rv/index.rst
index 8fd16d91d639..64ba2efe2e85 100644
--- a/Documentation/tools/rv/index.rst
+++ b/Documentation/tools/rv/index.rst
@@ -15,6 +15,7 @@ Runtime verification (rv) tool
    rv-mon
    rv-mon-wip
    rv-mon-wwnr
+   rv-mon-sched
 
 .. only::  subproject and html
 
diff --git a/Documentation/trace/rv/index.rst b/Documentation/trace/rv/index.rst
index 15fa966102c0..e80e0057feb4 100644
--- a/Documentation/trace/rv/index.rst
+++ b/Documentation/trace/rv/index.rst
@@ -12,3 +12,4 @@ Runtime Verification
    da_monitor_instrumentation.rst
    monitor_wip.rst
    monitor_wwnr.rst
+   monitor_sched.rst
