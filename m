Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FEF2DCC01
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 15:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748792294; cv=none; b=Hz3VpjPouJNcEhp3mUtAYe8mJ+W2yK9GDSNK0lSMJO/CYYxrPaadbjhgnXxqY3nxFbD7UkZYMad2b+WVxFp8mAKsAe3hnY5lL1lbb6S9boSUweHOgXbz/Ru2cgVcMt9WE+M0OklXs3c2g+lJOb875cL3KieXe6TSCal5S0M+oLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748792294; c=relaxed/simple;
	bh=r/EOLHKSI8F0VRAetCQJgG2X0nEnR1wxPP54NOIl96o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AezQ53cU5fvEFb/3ud4v9BmWOZ8Mm6LyBcuViR/Vc2x+G+cfQIaHbYqBB3KeObJTphJ4j3HlIxAjwS1ZHXBwxyYGac32qjUybUDjjH9rngdnWA6d7Vcb/Nk03TAe4IbkHnhwP55ZfzDUOqT+BC/eCvbzn6oKjkCbBNOEI5uLNjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p+WJZ8od; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p+WJZ8od"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90BEDC4CEE7;
	Sun,  1 Jun 2025 15:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748792293;
	bh=r/EOLHKSI8F0VRAetCQJgG2X0nEnR1wxPP54NOIl96o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p+WJZ8odtZErNxH17IQAl/swbtDf61oD0+KD6wz+hJqOZ2BwKrMEqgFV+JOfHK8py
	 4FR1N+wgU9FmNxTfQ+nMggs9SkQyEpnMmd71oZ+Pm18sfojoQsxLGcQ9tdb96woapu
	 dD+tKCmogqpufd4BK2WnEjrpQ036mjHBqRzqgRZcit5uMUq6AiRU9C4eM8tY8MBfQK
	 JxUh2stc5w/av2xB/vM62BLGKSgkb/PS9hzomb+Nym9FtFr7hc6K+zFx955QwbH771
	 /yCS6l2myksgZJ3ddj9BO1uaOMsvq7VxpfDGDXs89LJhkER+VbavrK1FYq/NHdx1HM
	 3Uo/LjnkDW2bw==
Date: Sun, 1 Jun 2025 08:38:10 -0700
From: Kees Cook <kees@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>,
	Ingo Saitz <ingo@hannover.ccc.de>,
	kernel test robot <oliver.sang@intel.com>,
	Marco Elver <elver@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Subject: Re: [GIT PULL] hardening fixes for v6.16-rc1
Message-ID: <202506010833.A33888CC@keescook>
References: <202505310759.3A40AD051@keescook>
 <CAHk-=wj4a_CvL6-=8gobwScstu-gJpX4XbX__hvcE=e9zaQ_9A@mail.gmail.com>
 <156567EE-E5BB-43C4-B5A6-439D83FF387D@kernel.org>
 <CAHk-=wjktqa94u_=++YX7XxUr57iLAs1GqtHPOY-o-N0z7wyeA@mail.gmail.com>
 <202505312300.95D7D917@keescook>
 <20250601-pony-of-imaginary-chaos-eaa59e@lemur>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250601-pony-of-imaginary-chaos-eaa59e@lemur>

On Sun, Jun 01, 2025 at 10:40:18AM -0400, Konstantin Ryabitsev wrote:
> On Sun, Jun 01, 2025 at 12:42:14AM -0700, Kees Cook wrote:
> > Okay, reproducing the "b4 trailers" steps:
> > 
> > #### start from known good tree
> > $ git checkout 62329e859b25 -b test/wreckage/before
> > $ l
> > 62329e859b25 (HEAD -> test/wreckage/before, dev/v6.16-rc1-pre/-Wunterminated-string-initialization) [DUP]
> > 9a7d4e791037 crypto: Annotate crypto strings with nonstring
> > b080c44c4d69 kbuild: Re-enable -Wunterminated-string-initialization
> > 8c2bb7d12601 ubsan: integer-overflow: depend on BROKEN to keep this out of CI
> > b9dbd69a32e3 wifi: iwlwifi: mld: Work around Clang loop unrolling bug
> > 9d230d500b0e Merge tag 'driver-core-6.16-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core
> > bf373e4c786b Merge tag 'devicetree-for-6.16' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux
> > 8ca154e4910e Merge tag 'for_linus' of git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost
> > 43db11110730 Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm
> > 12e9b9e5223b Merge tag 'ipe-pr-20250527' of git://git.kernel.org/pub/scm/linux/kernel/git/wufan/ipe
> > 90b83efa6701 (stable/master) Merge tag 'bpf-next-6.16' of git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next
> > 1b98f357dadd Merge tag 'net-next-6.16' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
> > ...
> > ### Try to update 8c2bb7d12601 with the Acked-by from the list...
> > $ b4 trailers -u https://lore.kernel.org/all/CANpmjNPpyJn++DVZmO89ms_HkJ0OvQzkps0GjCFbWkk0F+_8Xg@mail.gmail.com
> > Finding code-review trailers for 39 commits...
> 
> Yeah, this is danger territory, because you're asking to update a random
> commit in the tree history. Without passing --since, we're looking at raw git
> history in the current branch as far as 1 month back to try to figure out the
> range of commits that we should work with:

Yeah, my SSD glitches were a red-herring -- they happened before the
"known good state" sfr pointed out (so, yay, I did fix my trees from
that).

My mistakes were:

- not noticing the "39 commits" warning

- overriding my push sanity checks

Sorry about all the noise and confusion!

> https://git.kernel.org/pub/scm/utils/b4/b4.git/tree/src/b4/ez.py#n1048
> 
> I don't yet know why it wants to rewrite 39 commits when we're updating a
> commit that's only 3 away from the tip. If you manage to rerun this with b4 -d
> and send me the output, I will be glad to look at it. Alternatively, if you
> can let me know the steps to get my tree in the same state as yours, I can run
> it locally.

This shows the same problem (using Linus's tree and linux-next):

$ git checkout 9d230d500b0e -b test/repro/before
$ git cherry-pick 368556dd234d
$ git cherry-pick eef1355c269b
$ b4 trailers -u https://lore.kernel.org/all/CANpmjNPpyJn++DVZmO89ms_HkJ0OvQzkps0GjCFbWkk0F+_8Xg@mail.gmail.com

> Thanks for looking into this. Linus, this is accurate and I am 100% convinced
> that there was no malicious intent. My apologies for being part of the mess
> through the tooling.
> 
> I will reinstate Kees's account so he can resume his work.

Thank you! I will now *very carefully* construct a v2 PR...

-- 
Kees Cook
