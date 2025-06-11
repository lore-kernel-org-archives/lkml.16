Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C08D19A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 21:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749675665; cv=none; b=Xq3K3kx37EwxFWGwhLU9kY2ikqWIoehboyqnSC34srmXcl0s8QVC5fAWx+QtW9xAonurDrL7lH2dPgT2x+z5LpsuPKxp7Dy8hEhAjRQENAj8yX/47pZOJ0Xmlyi6t7H1jqep4gg6Bi2gQA95Ut1ndeICIhprApJ4dYUnAkeRn2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749675665; c=relaxed/simple;
	bh=vXKmBg9cCLOG/aDVQNMY1J9klQIhV9IJ/iiOam11QCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IfvGomeFD9Nq2G4hzgVNPfU40nPiRx8DGG5C10zilfGOiKu93vhFEx/nY/xujdEjSvR1CnGf/QClH04gyd+7LBHXfVHHQZHwheBmBMyNGn8FYYM9Xhrm+WUSgo0nKJqPB0ZcHHmvdK5UeyL5xBom1Ygjk6NazHVy8XSY3sz1328=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XgZjAi8I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XgZjAi8I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DF91C4CEE3;
	Wed, 11 Jun 2025 21:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749675664;
	bh=vXKmBg9cCLOG/aDVQNMY1J9klQIhV9IJ/iiOam11QCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XgZjAi8IQ9wrEYqkWi9+AVLFwkeJfnDcKT1i3R5srIPQnVM5vEJx6Qu149sOWd66V
	 wHwbszWgXcw+8wj/pqu8XSYnqA4zZ/T83Y4cFqW04U4w52lIysJYFGEHWHL1oTABHl
	 t3VK7HT1ISV8/ozJa00+dwxhea7yuRUD6lMEQ0/It4wKUlYHaNG1qjcbeE+7oAMPJM
	 mim9OWMoopt3CWOIZ0pZLhcBaznZdmHB/7BWJvF7TCs2IppjXmUYJQlI/V/lXC91zn
	 Hf9I9EnkXeK34TvNhV+skX9jKmu3CpIbuPU2dclaMT7cJwqU/1OE05iQC70XavhLzY
	 Ay/XEWG1rXCAg==
Date: Wed, 11 Jun 2025 11:01:03 -1000
From: Tejun Heo <tj@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v3 2/9] Workqueue: replace use of system_wq with
 system_percpu_wq
Message-ID: <aEnuj0LuIVWrszuv@slm.duckdns.org>
References: <20250611131438.651493-1-marco.crivellari@suse.com>
 <20250611131438.651493-3-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611131438.651493-3-marco.crivellari@suse.com>

On Wed, Jun 11, 2025 at 03:14:31PM +0200, Marco Crivellari wrote:
>  110 files changed, 208 insertions(+), 191 deletions(-)

I think this needs to be broken up per subsystem. Can you please post the
workqueue patches to add all the new things? I'll apply them to a branch and
then you can send out per-subsys patches with the description explaining
what's going on and asking how the patch should be routed including what wq
branch to pull from if the subsys wants to route the patches through their
tree.

Thanks.

-- 
tejun
