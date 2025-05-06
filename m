Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089E922AE7B
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 12:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746534985; cv=none; b=HZ1M95kcF+9/vNqAtBBPjEni34L2FENFSM7NaMn8KYDRArlHTCYwoI7jKKd80Ow9vvwBCjW5KddOjQcNXedPtUyfbkj3mq+nUubOMYNlXZmF3bA6MUrI8Y26M7PcbWISrY8jAnVFeYCkcgjdUoi19j6amBeqcucoWzv6v/Tfl/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746534985; c=relaxed/simple;
	bh=ZMI8odsUTWL7O2ibZVeVjRKsgP060noUpzvYiu/+D74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W9KupmQHQTtRO7dH6DWcQMKZYrh001usZZFOl3DI460NBk63RtWOw+5ag4aJKJk4l5we1KjktpSB3CQTNaPSP2NmpQRGvfDvUPg7hNqK7WGjHN4FT80kQwSQYuTfVVBuQlNaSsUhMtfSDgog3Rdj/pdpJXHgrezA49MWI6MA55A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZE2o90fu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZE2o90fu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F39C4CEE4;
	Tue,  6 May 2025 12:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746534984;
	bh=ZMI8odsUTWL7O2ibZVeVjRKsgP060noUpzvYiu/+D74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZE2o90fuA13mBTzROjnCThsXqzopTraOQIwDEe1Sxcls0bIyr1i0jMDpFl/HZfXB8
	 ZuJVjt43dMib/y9VaYzRykwikFqvu07i7uRcbljna/hoYmvztkjPjMZDTeR6G8crqG
	 gcmQ1v8tQEBNcPp37b7RqjL0TEJBdKV1rt386kXsg4TDYYa0PEJ2i28ldogAsDKaq7
	 V+QIF7jX3PJdQi391hMkWADEXGaOxoTnUfnzdM7qf7TQg3H4c9UORg4voFD07y9+py
	 o7ay2VbFX3D6DckBbW6/+Bk2r9l2vTmg5q/C1IJV5/4qOBhYOc09mK00GrwYm04eJN
	 35NOeMJZTnKTA==
Date: Tue, 6 May 2025 14:36:21 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Michal Hocko <mhocko@suse.com>
Cc: Marco Crivellari <marco.crivellari@suse.com>,
	linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH 4/4] Workqueue: add WQ_PERCPU to every alloc_workqueue
 user
Message-ID: <aBoCRTWyYkOCN6TE@localhost.localdomain>
References: <20250503082834.49413-1-marco.crivellari@suse.com>
 <20250503082834.49413-5-marco.crivellari@suse.com>
 <aBiDSHee4TKs8HF-@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aBiDSHee4TKs8HF-@tiehlicka>

Le Mon, May 05, 2025 at 11:22:16AM +0200, Michal Hocko a écrit :
> On Sat 03-05-25 10:28:34, Marco Crivellari wrote:
> > By default, alloc_workqueue() creates bound workqueues
> > (i.e., without WQ_UNBOUND).
> > 
> > With the introduction of the WQ_PERCPU flag (equivalent
> > to !WQ_UNBOUND), any alloc_workqueue() caller that
> > doesn’t explicitly specify WQ_UNBOUND must now use WQ_PERCPU.
> > 
> > All existing users have been updated accordingly.
> 
> I assume that the next step is to drop WQ_PERCPU when it is not strictly
> necessary, right?

Indeed. And also convert the users of schedule_work() and queue_work(system_wq, ...)

> 
> Looking at the huge list this will be a huge undergoing. Is there any
> rule of thumb to tell whether WQ_PERCPU is required or not? Maybe
> something as simple as - if the worker doesn't use any per cpu variables
> then it is highly likely that it doesn't need WQ_PERCPU? Are there other
> useful hints?

None that I know of. But yes it is a very big work. Ideally we
should focus on core users first. And then we can think about
the drivers later...

-- 
Frederic Weisbecker
SUSE Labs
