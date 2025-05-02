Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC0F376
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 18:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746211054; cv=none; b=uwsT1sr8+3IVi49NCtoLbs9aaYqIGFhD1/Qic4gqkyZAHmnHLyPUtuTmXJVUCtWjQYOnUsMuiZqgwRL4MWl/UWLl6WN0jhNnedDhlj3uuafg3oIL/olwIbWVRVwY8DFt8UXO0n92/vjPX7HzXOgZgERA0B3oWq9YFO0cU8ihG4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746211054; c=relaxed/simple;
	bh=tjqmdo/y+NzqGCLF2N3V0LU8Oibccrm4FknfoYbIvpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vCvyrfBvyuxpTQRLupsIW0JhIMuneJ2mmaztrgrJu8nQmoXdpGaevjyq+utKHez1nXJwLhgmSXvrd1ABss9oAWGyFnH47WvX0AliDEijlBctTdEoEz9Y420s9wtyBk4pqQNEhJFCo4onlUZNP/rPXRQUCUTvIy68OE91RZujj4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SDdK8Ctb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SDdK8Ctb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD5CBC4CEE4;
	Fri,  2 May 2025 18:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746211053;
	bh=tjqmdo/y+NzqGCLF2N3V0LU8Oibccrm4FknfoYbIvpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SDdK8CtbiVJRXbrmohLmF9V4x2WAwg+iViN+kX9wfLqUkodFYF5tuNwR6I6Lqpq6x
	 8UdOtEsbeXtMYjLCHLNpXM5rBFivWdXam3ULTLdaYngz7EkQvuk23w8gIs2imhS9R4
	 7m/wI1DQz3vU+FgZqEM7wbh6XR6CLgmggAKgJ3YejlSeAhEV5dGnGp+0VL6iGg8Tkn
	 rQZ9eJJbCL6awyumzqYnj0SqWZLLYctolTZb1Lpse00AUIvNrCe0qpbztWSZhrPCaz
	 8VhHiEsF0cfNvIOTK+nFtZZ8GmaColaJaNlv3kWZS7XXox2qklrBBaYTgo8rCh65Dw
	 L38WDsKQgZcyg==
Date: Fri, 2 May 2025 08:37:32 -1000
From: Tejun Heo <tj@kernel.org>
To: Max Kellermann <max.kellermann@ionos.com>
Cc: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>, hannes@cmpxchg.org,
	cgroups@vger.kernel.org.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kernel/cgroup/pids: add "pids.forks" counter
Message-ID: <aBUQ7EzmeWYCyLwB@slm.duckdns.org>
References: <20250502121930.4008251-1-max.kellermann@ionos.com>
 <bbublxzpnqrzjq5rmmbp772w2darjoahlewqky7caanaknglbx@6wuy5nidsnu3>
 <CAKPOu+_8cbUk=8d41GQGOvUrmG9OuaNVuSQrksDcUQMyFc4tiA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKPOu+_8cbUk=8d41GQGOvUrmG9OuaNVuSQrksDcUQMyFc4tiA@mail.gmail.com>

On Fri, May 02, 2025 at 03:23:26PM +0200, Max Kellermann wrote:
...
> That would be fine for me. Maybe that's one reason to initially add
> "pids.stat", and then maybe people figure out more stuff to put there?
> If you wish, I can implement that.

+1 on pids.stat, and use rstat and avoid the atomic ops?

Thanks.

-- 
tejun
