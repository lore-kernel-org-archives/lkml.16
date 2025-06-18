Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD712F5319
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 00:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750206702; cv=none; b=TMJM+D0IMjm/4I0I9jAnDHE1M9G51gu1gxjNSRBY9eksMuQPyXZjdAoP+R2qNSO+b6PEn34byrwxjdUF3rmcYTJj+VqhKkd+S7Zl7yjvh2zYocH1+H06sNIbzezClzyRTWZQMcxcpcdzc5ckxGdXHkxltyS5A5GVO/VUihfd35w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750206702; c=relaxed/simple;
	bh=4B6FVUO6iVM/BOLA9sAKmcKKwngtc3S3IPUlpSvSW5Y=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=QgTm/WJzpcKwGNhg/YyRMPgXpuAGAVYcHorE2nURhK71SZTjdBKDRA0Id4nDfUYFwiaxxRW8w4yYVvvVJKAweHzzyqrhW58RT1JAipfxaxAsmxsNKWmwijg2/nZVXq6fAudTQyoXRt5WXYN7xnaQreqDMu9pJUbN92i9AlJDKgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=vrBUTAmo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="vrBUTAmo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9224BC4CEE3;
	Wed, 18 Jun 2025 00:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1750206701;
	bh=4B6FVUO6iVM/BOLA9sAKmcKKwngtc3S3IPUlpSvSW5Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vrBUTAmouvD0fv+WpAB21DvNjrj+7Am8wCMVaddMwmiRtcqRwvxAdhIjamNolEexG
	 r0tXrB85yEiPrrTG0RLNLxru437bBLRc9Lxn1EuqngEeC6LZKMBJyDwN1EeReuoQ1s
	 N5GzZmE0gNvS274kzejZv/QFPrSbifAOs3XohsAk=
Date: Tue, 17 Jun 2025 17:31:41 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Michal Hocko <mhocko@suse.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, David Rientjes
 <rientjes@google.com>, Shakeel Butt <shakeel.butt@linux.dev>,
 linux-mm@kvack.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mm: add OOM killer maintainer structure
Message-Id: <20250617173141.8f7e110aa027fab242f8debc@linux-foundation.org>
In-Reply-To: <aFHJYymXpMQu6nEv@tiehlicka>
References: <20250617085819.355838-1-mhocko@kernel.org>
	<002eac51-1185-4a51-94f9-49987db84202@lucifer.local>
	<aFHJYymXpMQu6nEv@tiehlicka>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Jun 2025 22:00:35 +0200 Michal Hocko <mhocko@suse.com> wrote:

> Andrew, do you want me to respin with the sugested change or are you
> going to pick those up?


From: Andrew Morton <akpm@linux-foundation.org>
Subject: mm-add-oom-killer-maintainer-structure-fix
Date: Tue Jun 17 05:26:51 PM PDT 2025

fix mhocko email address (SeongJae), add files (Lorenzo)

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: SeongJae Park <sj@kernel.org>
Acked-by: Vlastimil Babka <vbabka@suse.cz>
Cc: David Rientjes <rientjes@google.com>
Cc: Michal Hocko <mhocko@kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 MAINTAINERS |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

--- a/MAINTAINERS~mm-add-oom-killer-maintainer-structure-fix
+++ a/MAINTAINERS
@@ -15851,12 +15851,15 @@ F:	mm/numa_emulation.c
 F:	mm/numa_memblks.c
 
 MEMORY MANAGEMENT - OOM KILLER
-M:	Michal Hocko <mhocko@suse.com
+M:	Michal Hocko <mhocko@suse.com>
 R:	David Rientjes <rientjes@google.com>
 R:	Shakeel Butt <shakeel.butt@linux.dev>
 L:	linux-mm@kvack.org
 S:	Maintained
 F:	mm/oom_kill.c
+F:	include/linux/oom.h
+F:	include/trace/events/oom.h
+F:	include/uapi/linux/oom.h
 
 MEMORY MANAGEMENT - PAGE ALLOCATOR
 M:	Andrew Morton <akpm@linux-foundation.org>
_

