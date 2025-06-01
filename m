Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF6E14C5B0
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 14:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748788822; cv=none; b=TPv/16jQouNWlHJQm5hc1mIHxV/ZMKldxzYKPj1lO6wLMzx6EAkLadpaUOSdQ/IU4EM+xhCnunZIAX3hkMmH6uRqIS2N3ATxbZbHPtbBXy95CnjE09/CnQsmMYitcAxsdzCOkrs57nkR8Go3mjadSgVhy6a4Bq73ebE5y2p4xEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748788822; c=relaxed/simple;
	bh=pJtXb5p6b/+bjzifcqF+CajBnpcqwSB8KY8PtggMUow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GI5vfClhO+vkTAif9MbV/uJzAlMku+Wpgu3X6YPfhxa3r4iuAPG/UnISIP8EAnwbtfmbMQMBxka7ZpcyQ79jWjIhO1gYteubMN1+xYBOQNpaI9UVxHdzBD/ULq57LhQS+uAbqFiCrGFANkuORjmNTGqU7WiFXJwwGlW7m3hu/U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=V14puNRe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="V14puNRe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F602C4CEE7;
	Sun,  1 Jun 2025 14:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748788820;
	bh=pJtXb5p6b/+bjzifcqF+CajBnpcqwSB8KY8PtggMUow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V14puNReXNMhx8uLA5HLadRmbiICJoV3xlcEvY/Dd7HBO3NFSW7OMgSJYbyBBkqIS
	 Ry8+xRX7Kmd/jUmsdqgBg7tqkc5fALuczsdTrNl9QY/1MmRok7XRJrjI0UUuo4o6cP
	 Ee2bUb9qAMZD969wuJpfN6g9G/91D31Cyc6mH7m0=
Date: Sun, 1 Jun 2025 10:40:18 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Kees Cook <kees@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>, 
	Ingo Saitz <ingo@hannover.ccc.de>, kernel test robot <oliver.sang@intel.com>, 
	Marco Elver <elver@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Subject: Re: [GIT PULL] hardening fixes for v6.16-rc1
Message-ID: <20250601-pony-of-imaginary-chaos-eaa59e@lemur>
References: <202505310759.3A40AD051@keescook>
 <CAHk-=wj4a_CvL6-=8gobwScstu-gJpX4XbX__hvcE=e9zaQ_9A@mail.gmail.com>
 <156567EE-E5BB-43C4-B5A6-439D83FF387D@kernel.org>
 <CAHk-=wjktqa94u_=++YX7XxUr57iLAs1GqtHPOY-o-N0z7wyeA@mail.gmail.com>
 <202505312300.95D7D917@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202505312300.95D7D917@keescook>

On Sun, Jun 01, 2025 at 12:42:14AM -0700, Kees Cook wrote:
> Okay, reproducing the "b4 trailers" steps:
> 
> #### start from known good tree
> $ git checkout 62329e859b25 -b test/wreckage/before
> $ l
> 62329e859b25 (HEAD -> test/wreckage/before, dev/v6.16-rc1-pre/-Wunterminated-string-initialization) [DUP]
> 9a7d4e791037 crypto: Annotate crypto strings with nonstring
> b080c44c4d69 kbuild: Re-enable -Wunterminated-string-initialization
> 8c2bb7d12601 ubsan: integer-overflow: depend on BROKEN to keep this out of CI
> b9dbd69a32e3 wifi: iwlwifi: mld: Work around Clang loop unrolling bug
> 9d230d500b0e Merge tag 'driver-core-6.16-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core
> bf373e4c786b Merge tag 'devicetree-for-6.16' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux
> 8ca154e4910e Merge tag 'for_linus' of git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost
> 43db11110730 Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm
> 12e9b9e5223b Merge tag 'ipe-pr-20250527' of git://git.kernel.org/pub/scm/linux/kernel/git/wufan/ipe
> 90b83efa6701 (stable/master) Merge tag 'bpf-next-6.16' of git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next
> 1b98f357dadd Merge tag 'net-next-6.16' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
> ...
> ### Try to update 8c2bb7d12601 with the Acked-by from the list...
> $ b4 trailers -u https://lore.kernel.org/all/CANpmjNPpyJn++DVZmO89ms_HkJ0OvQzkps0GjCFbWkk0F+_8Xg@mail.gmail.com
> Finding code-review trailers for 39 commits...

Yeah, this is danger territory, because you're asking to update a random
commit in the tree history. Without passing --since, we're looking at raw git
history in the current branch as far as 1 month back to try to figure out the
range of commits that we should work with:

https://git.kernel.org/pub/scm/utils/b4/b4.git/tree/src/b4/ez.py#n1048

I don't yet know why it wants to rewrite 39 commits when we're updating a
commit that's only 3 away from the tip. If you manage to rerun this with b4 -d
and send me the output, I will be glad to look at it. Alternatively, if you
can let me know the steps to get my tree in the same state as yours, I can run
it locally.

> Welp, that precisely recreated it -- even identical shas! Looking at
> the b4 output, I do see a suspicious "39 commits" listed for some reason.

Well, that's the point where the user, in theory, goes "this is weird, why is
it 39 commits," and does Ctrl-C, but I'm happy to accept blame here -- we
should be more careful with this operation and bail out whenever we recognize
that something has gone wrong. To begin with, we'll output a listing of all
the commits that will be rewritten, just to make it more obvious when things
are about to go wrong.

> So, I assume the "git-filter-repo" invocation is what mangled it. I will
> try to dig into what b4 actually asked it to do in the morning...

Thanks for looking into this. Linus, this is accurate and I am 100% convinced
that there was no malicious intent. My apologies for being part of the mess
through the tooling.

I will reinstate Kees's account so he can resume his work.

-K
