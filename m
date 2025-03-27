Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A68A81741
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743091689; cv=none; b=ra4ruVsCpqCPkPSr8MahkqWNexwe7o+foU3LlVEi8nGAN9H/BPB4eAbSgsLMelbGyPMSoKpg1Umj2JbmbcjBDK99DXb5cbw6qDSJ2J1+T1pmg8t5BKpGQLmqqzXtpDfrT7Jb6Ss2QdDzCPghZ1G5nCzLNUzSCavvm6WK0nhlaj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743091689; c=relaxed/simple;
	bh=u0b3Ud+GfaB8kwU4LYqfhLQ1JALJUiGqPe+HZa1KWEc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IODCwXvOA2haYalBWCbED5M1qSXvcZYELT13dlPFvZa0gbIhSkwt2KUhTIJW59nxY+mPfGZivHvuSGmrfbg1FJxc6pHRWLdfbuazVqNXjbwN8gA+i/2SjVIJTTTysvvlRfzQk+wJE9Oy68FVkrsIy91qY2/wyWFLR1QH3pt839E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3268C4CEDD;
	Thu, 27 Mar 2025 16:08:07 +0000 (UTC)
Date: Thu, 27 Mar 2025 12:08:56 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Gabriele Monaco <gmonaco@redhat.com>, Tomas Glozar
 <tglozar@redhat.com>
Subject: Re: [GIT PULL] latency tracing: Updates for 6.15
Message-ID: <20250327120856.5f930e53@gandalf.local.home>
In-Reply-To: <20250326115109.32b69701@gandalf.local.home>
References: <20250326115109.32b69701@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


It was reported that there was a documentation issue.
I have a v2 of this pull request. You can ignore this one.

-- Steve
