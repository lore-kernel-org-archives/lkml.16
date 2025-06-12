Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FD01A00FA
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749739668; cv=none; b=pHwE8gch2ixgTWnA1RiqcG+s0gkGdBRKK42ZR/bZM/Lw8lDEPHJ7Oe/QMrKgIACdBu2MEuKPTe7TpEzgg4pY6qqXpuNHGyJBrWuyg9yL6ns5mwXUTk+jJqKOh6tGNevdwIjjc7v2TF9WfJTAH5fq6LuWGD0Zw2MIkIkL8ErkBEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749739668; c=relaxed/simple;
	bh=ynWR55TQH3yk/Z+9bQkVu5DeO8xy6zINmUV1WeDJ/tU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbX1Kwa1Kx7c+CjewqKetqMIUqgxOu9dIro8kCxx0SyUcINomITmo/9fRU/qAJYcs6cSRSGSk0i8HW2IrhHHNMAFHe7bb6Ar8VDcLcfiLEjk6U86Xw5F2yvHHHawzV4RPwuvm0ovWUOK2BHK6zP/GfQ7Ik4h/ZEg1W4FaP/8J+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B63C4CEEA;
	Thu, 12 Jun 2025 14:47:46 +0000 (UTC)
Date: Thu, 12 Jun 2025 15:47:44 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/gcs: Don't call gcs_free() during flush_gcs()
Message-ID: <aErokN0vKT3urlmA@arm.com>
References: <20250611-arm64-gcs-flush-thread-v1-1-cc26feeddabd@kernel.org>
 <aEm-F04k0sC1tOCp@arm.com>
 <4b354842-2108-4904-9294-fb9b00978986@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b354842-2108-4904-9294-fb9b00978986@sirena.org.uk>

On Thu, Jun 12, 2025 at 12:40:42PM +0100, Mark Brown wrote:
> On Wed, Jun 11, 2025 at 06:34:15PM +0100, Catalin Marinas wrote:
> > However, I thought there was another slightly misplaced call to
> > gcs_free() via arch_release_task_struct(). I wouldn't touch the user
> > memory with vm_munmap() when releasing a task structure. Is this needed
> > because the shadow stack is allocated automatically on thread creation,
> > so we need something to free it when the thread died?
> 
> Yeah, I've got another patch written but not sent for that (since it
> doesn't actually overlap) but like you say I need to check that things
> are joined up for threads that had a GCS created automatically for
> compatibility before I send it out.

OK. For this patch:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

> > Another caller of gcs_free() is deactivate_mm(). It's not clear to me
> > when we need to free the shadow stack on this path. On the exit_mm()
> > path for example we have mmput() -> exit_mmap() that takes care of
> > unmapping everything. Similarly on the exec_mmap() path.
> 
> We need that one to clean up the GCS for threads that had it allocated
> for compatibility, you can see the leak that results without it easily
> with the glibc testsuite (or anything else that does threads, the glibc
> tests just spot it).  Most of the checking for arch_release_task_struct()
> is verifying that deactivate_mm() is guaranteed to be called eveywhere
> it's relevant, I need to page that back in.

Makes sense. I think we should only keep gcs_free() in one place,
ideally deactivate_mm() as that's more related to mm rather than the
task_struct.

-- 
Catalin
