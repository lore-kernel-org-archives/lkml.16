Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9554425D8FA
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 15:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746460334; cv=none; b=j5Zui68sLEEiwj9NVAuSNaDDdLgMnkY+11w+Z0gd9lGnf0IFXfEYyB07i2YBih9tLEEBYlpcdmZHQNp6VRqVgsnfktH1993rJhU+Wq3+AORHyXslQz+q7J+pf9S3iDoTA7YVfocV2UWyfWxhgB8R4hpTwKM9wgS0qNibPgJo+dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746460334; c=relaxed/simple;
	bh=oiOejJCbfqzwUZU106HHZyvHCL0wN8VY5YWpFmWMxNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4fGrWYTK475M6YV6ZkwoMxL4FxXeVVIgOEZah6VP+ZZ2h8/uWy4pl5HKwkdMqqb4EO1+68CNCC0sFh5E1at3mN8/3o5BSUoLNKC/B9YXKGGhElqiRZVnwOklf8du51ENpNq0UM4pM3pqtIzAJCJNMItINS+QXsKY270sx87Iuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M/zZQO3T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/zZQO3T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12EC0C4CEEE;
	Mon,  5 May 2025 15:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746460334;
	bh=oiOejJCbfqzwUZU106HHZyvHCL0wN8VY5YWpFmWMxNU=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=M/zZQO3TNV4m4/RBZ9L38N1/YcTFkL0d4V05mQ0pudhM8voH3YyvD4PPpSXvlx6W8
	 +JZfCuE9ukONxQS5zGK/mHHhAsZsxLYgz2CqylufuWUsaML+UdmlEXeY3G6/ouOZG9
	 cgxT+Wa5uqzPztc36KN9rUc1LthyEgvkOCxu1HYcCmYqjWc6pOHvxToT37OZ+2+E21
	 vuBHtrA9WS2vsyKzjH0u6boiJdT1ZW9tH6hN04TlnN305eDfFYRhBm7M6iiR9dySuC
	 vaqpdbfhKZ5RSBC8ANbBaDAwvzGYr/oc8xgAVr8DPtTVhT5jB/w/D5rkRfVvKxq0QM
	 8tEMT7+HMAWew==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A0630CE08DA; Mon,  5 May 2025 08:52:13 -0700 (PDT)
Date: Mon, 5 May 2025 08:52:13 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Petr Mladek <pmladek@suse.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jon Pan-Doh <pandoh@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>
Subject: Re: [PATCH v4 0/20] ratelimit: Reduce ratelimit's false-positive
 misses
Message-ID: <738b09ea-235a-4140-b8c7-67ab44c0bc9a@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop>
 <4edcefb0-cdbd-4422-8a08-ffc091de158e@paulmck-laptop>
 <72ee57b8-9e2a-4cad-aaa0-1e3353d146d8@paulmck-laptop>
 <b0883f20-c337-40bb-b564-c535a162bf54@paulmck-laptop>
 <aBijFf91NBzjy0kr@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBijFf91NBzjy0kr@localhost.localdomain>

On Mon, May 05, 2025 at 01:37:57PM +0200, Petr Mladek wrote:
> On Tue 2025-04-29 18:05:00, Paul E. McKenney wrote:
> > Hello!
> > 
> > This v4 series replaces open-coded uses of the ratelimit_state structure
> > with formal APIs, counts all rate-limit misses, replaces jiffies=0 special
> > case with a flag, provides a ___ratelimit() trylock-failure fastpath to
> > (almost) eliminate false-positive misses, simplifies the code, and adds
> > a simple test.
> > 
> > The key point of this series is the reduction of false-positive misses.
> > More could be done to avoid open-coded access to the ->interval and
> > ->burst fields, and to tighten up checking of user input for these fields,
> > but those are jobs for later patches.
> 
> JFYI, the whole series looks good to me.

I double-checked, and after I apply these two Reviewed-by's, each patch
in the series will have either your Signed-off-by or your Reviewed-by,
so thank you for your reviews and feedback!

							Thanx, Paul
