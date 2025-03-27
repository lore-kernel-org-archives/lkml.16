Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC362366
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 00:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743034060; cv=none; b=RmyiTYmpYuaykdDkACnWFS3/G2ksxcOhnZ7dcGRTbvWI3m5/R2rhGyGPTuw/VsHg8mqesUzPf1GgBB5kmiZydHJTM00HVQ+cmpFDQiWuubTfSaadjw3EXipa4JgD4vOrpwhAW4wA1xu+Y/d54jyvQ/ZZ8EyBYSJ/gnsM6Xq3vCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743034060; c=relaxed/simple;
	bh=wQtDwIBGOYasGvUXkTYZrq0SlPNPYBmbxqf+7/6FKlg=;
	h=Message-ID:Date:From:To:Cc:Subject; b=D8shOMX0CltTPTV24CkX32RdrgGZv4iZE0kaeQfgUdEtczp9g+DKuBKP2qkvYnN9Nin4h+1K2WhzT5NJb0+RGKewUIHxKo0XcFxkG/JHpVjBv31cU17vN/xfh/ztjKu0zxorYJj/HStMytKNRFtIIdzbOV8GWH6H+A93GcBd9JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 574C2C4CEE2;
	Thu, 27 Mar 2025 00:07:40 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1txanL-00000002uyO-3zRt;
	Wed, 26 Mar 2025 20:08:27 -0400
Message-ID: <20250327000811.879041980@goodmis.org>
User-Agent: quilt/0.68
Date: Wed, 26 Mar 2025 20:08:11 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 0/2] tracing: Updates for 6.15
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace/for-next

Head SHA1: e0344f9564f5847dc20e245fbea67a4b262ee659


Douglas Raillard (1):
      tracing: Fix synth event printk format for str fields

Siddarth G (1):
      tracing: Replace strncpy with memcpy for fixed-length substring copy

----
 kernel/trace/trace_events_synth.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
