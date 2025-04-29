Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4CC16DC28
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 20:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745959183; cv=none; b=rLOzbrBtDh6KbCIUhNss0RoOZPzrngGNcNXANuF+tWgR+4q3y7rOA6EO3BbfdKjYkP/U5i8TL2MBJxEJn3Pkq7qcpqWrdO9zs6fFANm1+RPBbIf2Z21pfCBMiOu9i/Qgsby8jYrl1Snv9oapj6l4q7wRAieuvdtIho7qLaeNvRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745959183; c=relaxed/simple;
	bh=ZUs1RHwHkXEDQaSSYSd7+zpQpA0rtzZG37moqeP6BgI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ZmmMC/l0DJkODy+ptAY4E0TdkOowO1S/+OWa6r2H6tUDxCyQjJMqPfYNcJ0KFDO03FosZHv6UJklqgQKihRmDm0ToOPN31q+qy9O8CQHXw7tB61Beri73PihDydD2I7CW5Mdrhoq58IX6DqKvfBpnRbRGjqlBGIQXRZQ/06xYI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Db85jYIY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Db85jYIY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21D2EC4CEE3;
	Tue, 29 Apr 2025 20:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1745959182;
	bh=ZUs1RHwHkXEDQaSSYSd7+zpQpA0rtzZG37moqeP6BgI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Db85jYIYlgnYWhOhbPdxOdhOYAk44JDS5INdAgfGPeKGZsdACQHSaE89HLKwTcv7Y
	 J/4I7qlFuUDQ6PTpmIXCV9OMNBwbXxBbHaRDIgF5uWgPzPnaxlf+AImwzJBgyrojIz
	 DQ4XjELZvP1ZPlSuL3DOFZ3+WHBlEUW9sRiyNEwU=
Date: Tue, 29 Apr 2025 13:39:41 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: carlos.bilbao@kernel.org
Cc: tglx@linutronix.de, seanjc@google.com, jan.glauber@gmail.com,
 bilbao@vt.edu, pmladek@suse.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 takakura@valinux.co.jp, john.ogness@linutronix.de, x86@kernel.org
Subject: Re: [PATCH v3 0/2] Reduce CPU consumption after panic
Message-Id: <20250429133941.063544bb4731df0ef802440c@linux-foundation.org>
In-Reply-To: <20250429150638.1446781-1-carlos.bilbao@kernel.org>
References: <20250429150638.1446781-1-carlos.bilbao@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

(cc more x86 people)

On Tue, 29 Apr 2025 10:06:36 -0500 carlos.bilbao@kernel.org wrote:

> From: Carlos Bilbao <carlos.bilbao@kernel.org>
> 
> Provide a priority-based mechanism to set the behavior of the kernel at
> the post-panic stage -- the current default is a waste of CPU except for
> cases with console that generate insightful output.
> 
> In v1 cover letter [1], I illustrated the potential to reduce unnecessary
> CPU resources with an experiment with VMs, reducing more than 70% of CPU
> usage. The main delta of v2 [2] was that, instead of a weak function that
> archs can overwrite, we provided a flexible priority-based mechanism
> (following suggestions by Sean Christopherson), panic_set_handling().
> 

An effect of this is that the blinky light will never again occur on
any x86, I think?  I don't know what might the effects of changing such
longstanding behavior.

Also, why was the `priority' feature added?  It has no effect in this
patchset.

