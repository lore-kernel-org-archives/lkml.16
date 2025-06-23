Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D941078F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 19:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750706641; cv=none; b=oFlALMIF7MPGPMuc78XH55gnF4FBffWHUzYIAOKjJVSqd89lipZba2ppHoDJ3GTyFRFV/XiaGEBL5SJjs3k2zG133Ru5GvL08w2qFPmzRPxYHlNw2O4FTTzaFW1+XtRBYCoaW/ePSDUqV+zd6Sn5zKP24T3r3/+ZI8fGFF/+NU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750706641; c=relaxed/simple;
	bh=eOCCXYnRjmWMp3WxqNOWuw6DWz0xgyxB0iFIx1qsPhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nob4KBezyvS7daYv4TwOxO2bx7zv6biujBsHs9WnJSBV7DP+t1Vcm9dy5s2SKfGFjK9j7+BVD2K/WAdY+r47kH84Ar/WXDTkKLrJSxJEx0jbH6jL4LSGO6bJAV4cHU1dx5s/qUMlpAjK6ghyGaDMFbx6kyL4oFdDfJuKLdg3XnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZ5n5ciB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZ5n5ciB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88BACC4CEED;
	Mon, 23 Jun 2025 19:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750706640;
	bh=eOCCXYnRjmWMp3WxqNOWuw6DWz0xgyxB0iFIx1qsPhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mZ5n5ciBk8TRQH84GlKTNREiepjtLGzN4iTe+nNwEP35llXOP3GOQz5U/9K2dlKzk
	 +M7WcKB0gG5G0NYvGBlOY862Liz7Op6qCnGEfHMNH5iY8NXDumyB6iExdIwxCV/Fue
	 8j55zrio10LHWRNtNm4hS7fsX6IrSSjoNA+g1Z16mJnekef7mPaPt/Nz52dYHfci+T
	 JTh398Ln6a2BpM9YEUykDXaloqwoo2bYz0FgLv9koU8uFTpLHutr9wJUa9YQErEh0r
	 U1z7D182gEBpZKI/Mfc7i3rioI3nUUDPqdRJM8i+xqLT5dr9+7qZO6l+J5Lu3ZvDe3
	 2AIt8ZQsgryLQ==
Date: Mon, 23 Jun 2025 09:23:59 -1000
From: Tejun Heo <tj@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: Frederic Weisbecker <frederic@kernel.org>, linux-kernel@vger.kernel.org,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v5 0/3] Workqueue: add WQ_PERCPU, system_dfl_wq and
 system_percpu_wq
Message-ID: <aFmpzwNlwP3LVs9O@slm.duckdns.org>
References: <20250614133531.76742-1-marco.crivellari@suse.com>
 <aFBj9PXQiw-7O6yQ@slm.duckdns.org>
 <aFFozq_dzk8Qn7XN@localhost.localdomain>
 <aFGwmO3cNdR38lo8@slm.duckdns.org>
 <aFG5-qBWHy-LeLGS@slm.duckdns.org>
 <CAAofZF7xVETGVzrpHdMghcGDwNvw3jVumFWwWMqd+tq4Gm+m=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAofZF7xVETGVzrpHdMghcGDwNvw3jVumFWwWMqd+tq4Gm+m=Q@mail.gmail.com>

Hello,

On Fri, Jun 20, 2025 at 06:13:09PM +0200, Marco Crivellari wrote:
> Just a quick question Tejun: when do you expect to receive the other patches?
> Should I wait till the next rc1?
> 
> I just want to check the work again, but they are ready.

So, I can route the patches through the wq tree but I shouldn't do so unless
subsystem maintainers want to do so for the specific subsystem. Waiting for
rc1 is an option but not the only one. You can send out subsystem-specific
patchdes to the subsystem maintainers and me cc'd with:

- Explanation on what's going on and why.

- What needs to happen if the subsystem wants to route the patch (pull the
  wq branch with the prep changes).

- Offer the option to route the changes through a wq branch.

There are no hard rules on how to do this but it's all about making
logistics understandable and easy for the involved subsystems.

Thanks.

-- 
tejun
