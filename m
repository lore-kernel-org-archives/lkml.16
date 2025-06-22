Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6112A1F0991;
	Sun, 22 Jun 2025 19:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750621495; cv=none; b=JNa6Ql8ERYrf+vF6JYvKTDQbO3o9ex3oeX4g5DoFfqkrRhwg9sfmNTFXr+mwdSpRn+0iuh5nYk3mQbjWohp9DQvoXQqThPI7Wjxb+SnFuX/n4RvyXaAV+ePv57kkQL0nD9QrIy5NtAuflQ1Q5fIU3oCFAzuu1SDxfodCm6HuJSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750621495; c=relaxed/simple;
	bh=d6AfsluOuu/DSo/pl5Iw3jcwxIdjlkLMgVdfv/HPrv8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XjmGkssAgZpJQPZIOYH/sKQrackTmM4ko4776D0n44syHR+ecHnZllaqPDV7niXMcvqGKoGNWnlOXslqOXtThRxsbq8vdVhLjCU6+jdvDNeH6PxxFmjYXp7jklYKq2hu9TvYHXeC7juhKhTa9tqbkdLK2GKOTLhbCXFcQShTwHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NyUFmWlQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NyUFmWlQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE4F6C4CEE3;
	Sun, 22 Jun 2025 19:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750621494;
	bh=d6AfsluOuu/DSo/pl5Iw3jcwxIdjlkLMgVdfv/HPrv8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NyUFmWlQxp6bOTOiVFZLKOrnWuxmZvE/HqCQUg7/1aUCOvlUytQ4XrYttbYTfaB5U
	 BG6WpZqPgJLl1rrcwh0LU6GGYRsVUN3yUNUt7OgJqlm8rVI83hjekieeH6pcg4jMtj
	 0mLmiz4JZ0zl3PMUiirPfPZ821OxJ9jVpEiTRiibVnL4puLaK+VT8144Bx45y3wk1v
	 YlNyhatsGCmr3iqcWfPzwDHYr87qAZOtWwoQRy5Hv1lDy09DnEXVjWEgQufZLiWxF+
	 I9Ihz7iPtkgKqEDy/nYMd907rednTVVxUeipbkn0y5llAQ0aaZn6j4+QWj8KjLfPV+
	 sSxzYv5GT5C1g==
Date: Sun, 22 Jun 2025 21:44:50 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH 0/6] Some improvements for the doc build system
Message-ID: <20250622214450.2a1a9639@foz.lan>
In-Reply-To: <874iw7boqv.fsf@trenco.lwn.net>
References: <cover.1750406900.git.mchehab+huawei@kernel.org>
	<87ldpkdgv6.fsf@trenco.lwn.net>
	<20250622060015.76a0b29a@foz.lan>
	<874iw7boqv.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sun, 22 Jun 2025 12:44:08 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > Em Sat, 21 Jun 2025 13:39:09 -0600
> > Jonathan Corbet <corbet@lwn.net> escreveu:
> >  
> >> OK, I've applied it, but ... someday, I think the test_doc_build tool
> >> should be properly documented and put somewhere under tools/testing.  
> >
> > I added a better documentation for the tool at the v2.
> >
> > With regards to move to tools, I'm not certain about it as I can see
> > advantages and disadvantages. 
> >
> > Creating a new directory to have just one tool on it seems overkill
> > to me. Also, it is easier to type "scripts/..." than 
> > "tools/testing/build/..." :-)
> >
> > There is another aspect: while doing conf.py and Documentation/Makefile
> > cleanup, I noticed that there are still lots of hacks inside them,
> > that are there from the early days when we adopted Sphinx. Perhaps
> > it could make sense to move part of the logic there to this new
> > build tool, which could, for instance, replace the logic inside
> > scripts/sphinx-pre-install and get rid of some magic at the Makefile
> > like the one which handles SPHINXDIRS.
> >
> > So, at least for now, I would prefer to keep it under scripts.  
> 
> I pretty strongly disagree ... scripts/ is a dumping ground, nobody
> really knows what all that stuff there is, nobody is responsible for it.
> Something under tools/ would be more evident as to its purpose and
> maintainership.  We could maybe just do tools/docs/ and move things like
> sphinx-pre-install there as well...
> 
> Anyway, I won't try to hold up this work based on that, but now you know
> how I feel...:)

A tools/docs with all doc-related tool there is certainly appealing.
Yet, I would move all such scripts on a separate patchset.

Thanks,
Mauro
