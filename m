Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BD82951C9
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 19:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745869823; cv=none; b=NRhQBlHGlqs8S5d+322/2WFOhaqs/ImOSbOdVbg2iOLNQD4/X2M/e0//X8B1TJ11CaDHmJN6YldzoHQIM6pQtBlwDHHvIRW+oCJO8IUSIem5Gu4YPh7quPs8CcSeRm0QOwJpxcymEKSjg27PoXF8644O5W9XR7zNp/40TGuAh1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745869823; c=relaxed/simple;
	bh=wNv4+HsrbuDw/xdscKbBplWOTn27Py1sjb/TUhIp228=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ETmng3W+ISrKrmM4p19xuwb8VGUZh0OdxwVnQajPT/BvTaAJH5y3g2YSJoOQgqYw5EaUj642Zkg9ZuMD4NChxfjduKuxxLFbSy0J5501lqg6y6WpYvXxxNHFoDVF+60/W6KnzIFgIpgMKHMa36njed8lYg+vPgF5BfEGDFg4BDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OlyESqYZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OlyESqYZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF95C4CEE4;
	Mon, 28 Apr 2025 19:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745869822;
	bh=wNv4+HsrbuDw/xdscKbBplWOTn27Py1sjb/TUhIp228=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=OlyESqYZRLy2oeYp8lSpnakkbRM7j8wRjugtmquiPGD/Fk8DIDAsSFLnZiwYZ64xI
	 rcKYElbZb0vZd88ZqGpEs4aHgw7LYiVwM6AMSz+T5/ss7F11tej6AoSV0h05ev3oT8
	 KjxbFHCxbuPoV7jvre29tvMDMXj66oXfLqdUvw8FQiI45US05ZM0KhfZ2xZinz1aKF
	 Nco5R1gEsOA1yDYy7cbmKQYQqIkjUmWiblQtF0MJ52gj5L1tDbYt6ojFMV1wu9vcnD
	 eLUQes17qebixQPLwSx3ltDmfwIlHpJd+2kRRWG52Jep4fPj7ydjujRz//Th8hm1vi
	 9NVt/Omi77eOg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 99433CE0838; Mon, 28 Apr 2025 12:50:20 -0700 (PDT)
Date: Mon, 28 Apr 2025 12:50:20 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Petr Mladek <pmladek@suse.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jon Pan-Doh <pandoh@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	Bert Karwatzki <spasswolf@web.de>,
	"Aithal, Srikanth" <sraithal@amd.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 10/20] ratelimit: Allow zero ->burst to disable
 ratelimiting
Message-ID: <0ba74a65-a17c-43bb-8bf8-5b4dff68abd5@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <72ee57b8-9e2a-4cad-aaa0-1e3353d146d8@paulmck-laptop>
 <20250425002826.3431914-10-paulmck@kernel.org>
 <aA-Xb89sgQd5ZaGO@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aA-Xb89sgQd5ZaGO@pathway.suse.cz>

On Mon, Apr 28, 2025 at 04:57:51PM +0200, Petr Mladek wrote:
> On Thu 2025-04-24 17:28:16, Paul E. McKenney wrote:
> > If ->interval is zero, then rate-limiting will be disabled.
> > Alternatively, if interval is greater than zero and ->burst is zero,
> > then rate-limiting will be applied unconditionally.
> > 
> > Therefore, make this classification be lockless.
> > 
> > Note that although negative ->interval and ->burst happen to be treated
> > as if they were zero, this is an accident of the current implementation.
> > The semantics of negative values for these fields is subject to change
> > without notice.  Especially given that Bert Karwatzki determined that
> > current calls to ___ratelimit() currently never have negative values
> > for these fields.
> >
> > This commit replaces an earlier buggy versions.
> 
> If there was another revision then it would be nice to explicitly
> describe also the reason why both zero ->interval and ->burst never
> rate-limits. It is the state when the structure is zeroed. Some
> existing code relied in this behavior.
> 
> If I get it correctly then this is the difference between this and
> the previous version of this patch. And the previous version
> caused regressions described by the Links...

Very good, I will update the commit log on my next rebase.

> > Link: https://lore.kernel.org/all/fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop/
> > Link: https://lore.kernel.org/all/20250423115409.3425-1-spasswolf@web.de/
> > Reported-by: Bert Karwatzki <spasswolf@web.de>
> > Reported-by: "Aithal, Srikanth" <sraithal@amd.com>
> > Closes: https://lore.kernel.org/all/20250423115409.3425-1-spasswolf@web.de/
> > Reported-by: Mark Brown <broonie@kernel.org>
> > Closes: https://lore.kernel.org/all/257c3b91-e30f-48be-9788-d27a4445a416@sirena.org.uk/
> > Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > Tested-by: "Aithal, Srikanth" <sraithal@amd.com>
> 
> Otherwise, it looks good to me:
> 
> Reviewed-by: Petr Mladek <pmladek@suse.com>

Thank you!!!  And I will also apply this on my next rebase.

							Thanx, Paul
