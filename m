Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B862123716E
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 16:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738859422; cv=none; b=fAeKXt7hztBQDQ0bUE901LJXETEy/sDIKow5KZatZPfMXOLwBWqTYIt/djAUo5PoktlK4V9L0GJgv1974qkmX/JjL/MaX8IUYtrwlxLBGmuMFt9TnkptEmE2c2cUiu5K+ZipSk0qc76P6T9gfHbYkEpd1HsNGTOSQg4+79fFd74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738859422; c=relaxed/simple;
	bh=Iq+FFokjIcaxtsT86Hdgg3D6PjtfHV0uPD05hxSQreM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cidY61pv3Swo+WoOn9Vfktja8los5qiFAafLPa4ebIV48A7MCJdzrV+nkJdg1ci+IVTzvLEmc8AoncgD7hpPRb3GUJ+wLhv7pNAshIfYcav6yv9+14Ztporn0WBKYxvRLYDfudjNFMrnQ7cYrFzmGdoPC2Mwh/uVt7ff37B8Udk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R1AD9MmY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R1AD9MmY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1147C4CEDD;
	Thu,  6 Feb 2025 16:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738859422;
	bh=Iq+FFokjIcaxtsT86Hdgg3D6PjtfHV0uPD05hxSQreM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R1AD9MmYrGBgOJIX2r4yPzZr+/iE7cjZPo4VyYYvYwkBCKy9o8ZrKUdEU3lD7Ke9s
	 rwV+hguozX0rChfAG2ryowSlnLE7/cdffknTt4IObh7toWkwoT9pvkWhbZMq/0STy0
	 JBTqsfewyp+HeIHOZDPnQyRlDeqdoB1WTCFbsG0HjuPqVpfv5GyVJ09UvvjbM2plo8
	 HaE0QT/qMWm0LgxW9WNKfFT1ffpeSkX37Ia93FtBkXUsrwrS9jUBLSIzR8Ug0L7Qdq
	 mF+ZbT9zDJBKLEA76dCAqYSx1oECnqH1JNCzI1fxn1nM5bsBAVztafwZuAHlV82ye7
	 EbJFXPtNeaGrg==
Date: Thu, 6 Feb 2025 17:30:19 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mateusz Guzik <mjguzik@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] exit: kill the pointless
 __exit_signal()->clear_tsk_thread_flag(TIF_SIGPENDING)
Message-ID: <Z6Tjm-3eacmkSuuZ@localhost.localdomain>
References: <20250206152244.GA14609@redhat.com>
 <20250206152334.GB14620@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250206152334.GB14620@redhat.com>

Le Thu, Feb 06, 2025 at 04:23:34PM +0100, Oleg Nesterov a écrit :
> It predates the git history and most probably it was never needed. It
> doesn't really hurt, but it looks confusing because its purpose is not
> clear at all.
> 
> release_task(p) is called when this task has already passed exit_notify()
> so signal_pending(p) == T shouldn't make any difference.
> 
> And even _if_ there were a subtle reason to clear TIF_SIGPENDING after
> exit_notify(), this clear_tsk_thread_flag() can't help anyway.  If the
> exiting task is a group leader or if it is ptraced, release_task() will
> be likely called when this task has already done its last schedule() from
> do_task_dead().
> 
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>

Acked-by: Frederic Weisbecker <frederic@kernel.org>
