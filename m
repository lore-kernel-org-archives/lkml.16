Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7432F2DCC0D
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 07:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748763738; cv=none; b=dlRkxcQpCNiFJADEdWuxxq1hIjxm9DPZ5WXE3hY7m7rljPd5FKsGALTdQhbEZ7LM/lTNHIr5p98kmlBeGpxqBy8DLrLHWzsDSGyefvJnK2AeGUfYGsMmPjmjbVTIoUCHlXvPaRlauGVOB0S2d6/Upyqn9e8BphjunnyMcJNagYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748763738; c=relaxed/simple;
	bh=D20g92w+vh18WlgCkeHNq+gdjSvcQJMxCn5qQ6cg3sY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N6pTGvDwNuRo5i+c3sI7dnsGQC8m9gZ1t1Cq8y6HLWBOeOCaxhk2szpYR5sEs5GIFDvXQsAW8RYNUjylYjTEzEgKOyDDDrFVP0fBDQ8H5NQ4vcL0gpN60Nm0pTT78Tql2ehQDpjm89U2Z9N8wUDjX+mMMmh8LX9QxdWZEVVwZAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aenQk5t+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aenQk5t+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57B5C4CEE7;
	Sun,  1 Jun 2025 07:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748763738;
	bh=D20g92w+vh18WlgCkeHNq+gdjSvcQJMxCn5qQ6cg3sY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aenQk5t+VVsuP5gbALaV8KY0uJbhOxncFNz2SZsOojRm6vhQTzMtDMRmpONKVxYOd
	 eNKxzFdwPPeYsmmG6sp01pIH4Olfaz+S5qf11U5SmqhMQvEgScBC4xSF7xW3KOuga7
	 2EA09nq+MqC2D1XSURA9lmR4/U4YaxeynNQj3klVmGg75PnoXXEZ3BbO11WmHl2x+s
	 64gl0lAHQq3LbujSl0V0OiyxR8cUkR4McHD+wmqULX21lGD5dSb7otyupMdFCqdaY9
	 lVm5sddDWddAS0RR9muauk7H6mrHfeAYofiHlULGaofJvDR7W7dzxACRz6Su23SLnp
	 BO/5x520ZnaNQ==
Date: Sun, 1 Jun 2025 00:42:14 -0700
From: Kees Cook <kees@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>,
	Ingo Saitz <ingo@hannover.ccc.de>,
	kernel test robot <oliver.sang@intel.com>,
	Marco Elver <elver@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Subject: Re: [GIT PULL] hardening fixes for v6.16-rc1
Message-ID: <202505312300.95D7D917@keescook>
References: <202505310759.3A40AD051@keescook>
 <CAHk-=wj4a_CvL6-=8gobwScstu-gJpX4XbX__hvcE=e9zaQ_9A@mail.gmail.com>
 <156567EE-E5BB-43C4-B5A6-439D83FF387D@kernel.org>
 <CAHk-=wjktqa94u_=++YX7XxUr57iLAs1GqtHPOY-o-N0z7wyeA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHk-=wjktqa94u_=++YX7XxUr57iLAs1GqtHPOY-o-N0z7wyeA@mail.gmail.com>

On Sat, May 31, 2025 at 07:35:45PM -0700, Linus Torvalds wrote:
> The rebased history would explain that, but the reason I'm upset about
> it is that I don't even see how that rebasing could possibly happen
> "by mistake".

Here's my reflog, but tl;dr it looks like "b4 trailers" did it. If you
want to skip to that, search for "fast-import" below...


eef1355c269b (HEAD -> for-next/hardening, origin/for-next/hardening, for-next/kspp) HEAD@{0}: checkout: moving from broken/for-next/hardening to for-next/hardening

Getting back to sfr's recommended "known good state".

f8b59a0f90a2 (broken/for-next/hardening) HEAD@{1}: Branch: renamed refs/heads/for-next/hardening to refs/heads/broken/for-next/hardening
f8b59a0f90a2 (broken/for-next/hardening) HEAD@{3}: checkout: moving from broken/for-linus/hardening to for-next/hardening
7ea1ca94c127 (tag: hardening-v6.16-rc1-fix1, origin/for-next/kspp, origin/for-linus/hardening, kees/for-linus/hardening, broken/for-next/kspp, broken/for-linus/hardening) HEAD@{4}: Branch: renamed refs/heads/for-linus/hardening to refs/heads/broken/for-linus/hardening

This is renaming both my for-next and for-linus to "broken/..."

7ea1ca94c127 (tag: hardening-v6.16-rc1-fix1, origin/for-next/kspp, origin/for-linus/hardening, kees/for-linus/hardening, broken/for-next/kspp, broken/for-linus/hardening) HEAD@{6}: am: randstruct: gcc-plugin: Fix attribute addition
2050f9ffa893 HEAD@{7}: commit (amend): overflow: Introduce __DEFINE_FLEX for having no initializer
d316fb5f88c9 HEAD@{8}: checkout: moving from for-next/hardening to for-linus/hardening
f8b59a0f90a2 (broken/for-next/hardening) HEAD@{9}: checkout: moving from fix-rand2 to for-next/hardening

This is amending "overflow: Introduce __DEFINE_FLEX for having no
initializer" and pulling down "randstruct: gcc-plugin: Fix attribute
addition" from lore to get the Tested-by tag -- but it's all going on
top of the broken for-linus/hardening, not having realized it was broken.

32838c389761 (fix-rand2) HEAD@{10}: commit (amend): randstruct: gcc-plugin: Fix attribute addition
e4750e3b77b6 HEAD@{11}: commit (amend): randstruct: gcc-plugin: Fix attribute addition
3e77d5ec7b16 HEAD@{12}: commit (amend): randstruct: gcc-plugin: Fix attribute addition
d8b0249fc36e HEAD@{13}: commit: gcc-plugins: randstruct: Fix attribute creation
8dcf80e5097b HEAD@{14}: rebase (finish): returning to refs/heads/fix-rand2
8dcf80e5097b HEAD@{15}: rebase (pick): overflow: Introduce __DEFINE_FLEX for having no initializer
66989cf66d91 HEAD@{16}: rebase (pick): ubsan: integer-overflow: depend on BROKEN to keep this out of CI
8bfebe2e9cc5 HEAD@{17}: rebase (pick): wifi: iwlwifi: mld: Work around Clang loop unrolling bug
e0797d3b91de (linux-next/stable, master) HEAD@{18}: rebase (start): checkout master
d316fb5f88c9 HEAD@{19}: checkout: moving from for-linus/hardening to fix-rand2

This is trying to figure out why merging didn't work, so I restarted on
master and cherry-picked the patches to a separate tree ("fix-rand2")
for testing.

d316fb5f88c9 HEAD@{20}: commit (amend): overflow: Introduce __DEFINE_FLEX for having no initializer
8c2917224046 HEAD@{21}: commit: overflow: Introduce __DEFINE_FLEX for having no initializer
2e058d249588 HEAD@{22}: checkout: moving from for-next/hardening to for-linus/hardening

This is working on and testing "overflow: Introduce __DEFINE_FLEX for having no
initializer".

f8b59a0f90a2 (broken/for-next/hardening) HEAD@{23}: reset: moving to f8b59a0f90a2
96e5b773dff6 HEAD@{24}: commit: platform/x86: thinkpad_acpi: Handle KCOV __init vs inline mismatches
f8b59a0f90a2 (broken/for-next/hardening) HEAD@{25}: am --abort
f8b59a0f90a2 (broken/for-next/hardening) HEAD@{26}: reset: moving to f8b59a0f90a2
2e058d249588 HEAD@{27}: checkout: moving from for-linus/hardening to for-next/hardening

This is splitting out "platform/x86: thinkpad_acpi: Handle KCOV __init
vs inline mismatches" so I could send it out, and then throwing away the
patch since its going via a separate tree and I need to review that whole
tree separately anyway. (This tree is still the _broken_ for-next tree...)

2e058d249588 HEAD@{28}: checkout: moving from for-next/hardening to for-linus/hardening
2e058d249588 HEAD@{29}: checkout: moving from test/1 to for-next/hardening
9d230d500b0e HEAD@{30}: rebase (skip) (finish): returning to refs/heads/test/1
9d230d500b0e HEAD@{31}: rebase (start): checkout master
939b93ecd094 HEAD@{32}: checkout: moving from landing/v6.16-rc1-pre/hardening to test/1

I was cleaning up old trees, and went back to look at old commits
(9d230d500b0e) but couldn't figure out why I was having trouble with
merge bases, and tried a rebase but it exploded. I return to the
(broken) for-next.

dbfe626a6fbf (landing/v6.16-rc1-pre/hardening) HEAD@{33}: reset: moving to HEAD
dbfe626a6fbf (landing/v6.16-rc1-pre/hardening) HEAD@{34}: Branch: renamed refs/heads/dev/hardening to refs/heads/landing/v6.16-rc1-pre/hardening
dbfe626a6fbf (landing/v6.16-rc1-pre/hardening) HEAD@{36}: rebase (finish): returning to refs/heads/dev/hardening
dbfe626a6fbf (landing/v6.16-rc1-pre/hardening) HEAD@{37}: rebase (pick): ovl: Check for NULL d_inode() in ovl_dentry_upper()
a3ca08cb5fb3 HEAD@{38}: rebase (pick): slab: Decouple slab_debug and no_hash_pointers
9d230d500b0e HEAD@{39}: rebase (start): checkout master
345b264de969 HEAD@{40}: rebase (finish): returning to refs/heads/dev/hardening
345b264de969 HEAD@{41}: rebase (pick): ovl: Check for NULL d_inode() in ovl_dentry_upper()
31f107a183e6 HEAD@{42}: rebase (pick): drm/amdgpu/atom: Work around vbios NULL offset false positive
3523b5868c43 HEAD@{43}: rebase (pick): slab: Decouple slab_debug and no_hash_pointers
8ffd015db85f (tag: v6.15-rc2) HEAD@{44}: rebase (start): checkout 8ffd015db85f
541157c72800 HEAD@{45}: checkout: moving from for-next/hardening to dev/hardening

Checking if some expected patches have already landed in master while
cleaning up older dev trees and rebasing them forward for potential
revisions during the coming dev cycle. This appears to be sanely based
on master, not a broken tree.

2e058d249588 HEAD@{46}: checkout: moving from dev/v6.15-rc4/hardening to for-next/hardening
9d230d500b0e HEAD@{47}: rebase (skip) (finish): returning to refs/heads/dev/v6.15-rc4/hardening
9d230d500b0e HEAD@{48}: rebase (start): checkout master
b7286d1e8cad HEAD@{49}: checkout: moving from dev/v6.16-rc1-pre/-Wunterminated-string-initialization to dev/v6.15-rc4/hardening
62329e859b25 (dev/v6.16-rc1-pre/-Wunterminated-string-initialization) HEAD@{50}: checkout: moving from for-next/hardening to dev/v6.16-rc1-pre/-Wunterminated-string-initialization

Trying to figure out why I can't sanely rebase. (Note that 2e058d249588 is on a
broken base tree, repeated above. Below, c102753312e8 is on a sane tree.)

2e058d249588 HEAD@{51}: reset: moving to 2e058d249588
bd31653e0d81 HEAD@{52}: reset: moving to HEAD
bd31653e0d81 HEAD@{53}: fast-import
62329e859b25 (dev/v6.16-rc1-pre/-Wunterminated-string-initialization) HEAD@{54}: checkout: moving from test/kern-splat to for-next/hardening
9a7d4e791037 HEAD@{55}: reset: moving to 9a7d4e791037
62329e859b25 (dev/v6.16-rc1-pre/-Wunterminated-string-initialization) HEAD@{56}: checkout: moving from for-next/hardening to test/kern-splat

This is where 2e058d249588 first appears, and before it is the branch
juggling of one of my scripts to send a single patch out of the middle of
a tree ("kern-splat" was a script to email the top patch, "kern-splat-one"
sends a specific sha from the tree by temporarily making a new branch,
"test/kern-splat", with that sha at the top, using "kern-splat", and
then restoring the tree to the prior state.)

But the "fast-import" is NOT part of that, but rather from "b4
trailers". I checked my reflog against my bash history...

"l" is "git log -1"
"s" is "git show"
"d" is "git diff"
"latr" is "git branch --sort=committerdate"

14029  git commit --amend
14030  s
14031  d
14032  git commit -asm '[DUP]'
14033  l
14034  kern-splat-one 9a7d4e791037
14035  l
14036  b4 trailers -u https://lore.kernel.org/all/CANpmjNPpyJn++DVZmO89ms_HkJ0OvQzkps0GjCFbWkk0F+_8Xg@mail.gmail.com
14037  l
14038  git reset --hard 2e058d249588
14039  l
14040  latr
14041  l dev/v6.16-rc1-pre/-Wunterminated-string-initialization
14042  git reflog
14043  l 62329e859b25
14044  latr
14045  #git checkout 62329e859b25
14046  git branch -D dev/v6.16-rc1-pre/-Wunterminated-string-initialization
14047  git checkout 62329e859b25 -b dev/v6.16-rc1-pre/-Wunterminated-string-initialization
14048  l
14049  latr
14050  git branch -D dev/next-20250516/Wunterminated-string-initialization
14051  git branch -D dev/mld

HEAD@{57} below is 14029 above.
HEAD@{58} below is 14032 above.

HEAD@{54} through HEAD@{56} above is 14034 above.

HEAD@{53} and HEAD@{52} above is 14036 above.

Then I try to throw away (with 14038):

62329e859b25 (dev/v6.16-rc1-pre/-Wunterminated-string-initialization) [DUP]
9a7d4e791037 crypto: Annotate crypto strings with nonstring
b080c44c4d69 kbuild: Re-enable -Wunterminated-string-initialization

and just have "ubsan: integer-overflow: depend on BROKEN to keep this
out of CI" on top, but for some reason it shows in "git log -1" as
2e058d249588 not 8c2bb7d12601.

Now, looking at the tree for 8c2bb7d12601, I see I'm on sane "master"
base. I'll bet "b4 trailers" did something Exciting when rewriting stuff.
More below...

62329e859b25 (dev/v6.16-rc1-pre/-Wunterminated-string-initialization) HEAD@{57}: commit: [DUP]
9a7d4e791037 HEAD@{58}: commit (amend): crypto: Annotate crypto strings with nonstring
08652ab8b218 HEAD@{59}: commit (amend): crypto: Annotate crypto strings with nonstring
7bf10004aed0 HEAD@{60}: commit: crypto: Annotate crypto strings with nonstring
b080c44c4d69 HEAD@{61}: commit (cherry-pick): kbuild: Re-enable -Wunterminated-string-initialization
8c2bb7d12601 HEAD@{62}: rebase (finish): returning to refs/heads/for-next/hardening
8c2bb7d12601 HEAD@{63}: rebase (pick): ubsan: integer-overflow: depend on BROKEN to keep this out of CI
b9dbd69a32e3 HEAD@{64}: rebase (pick): wifi: iwlwifi: mld: Work around Clang loop unrolling bug
9d230d500b0e HEAD@{65}: rebase (start): checkout master

9d230d500b0e and 8c2bb7d12601 are sane trees. I'm pulling forward my
patches to enable -Wunterminated-string-initialization for testing, and
I find a new warning (in crypto) which I make, as well as another that
I'd already fixed before, that I split and leave as "[DUP]", then run
"kern-splat-one" on the crypto patch to get it sent[1].

c102753312e8 HEAD@{66}: checkout: moving from dev/v6.16-rc1-pre/-Wunterminated-string-initialization to for-next/hardening
9d230d500b0e HEAD@{67}: checkout: moving from for-next/hardening to dev/v6.16-rc1-pre/-Wunterminated-string-initialization
c102753312e8 HEAD@{68}: rebase (finish): returning to refs/heads/for-next/hardening
c102753312e8 HEAD@{69}: rebase (pick): ubsan: integer-overflow: depend on BROKEN to keep this out of CI
fec8dc564c2f HEAD@{70}: rebase (reword): wifi: iwlwifi: mld: Work around Clang loop unrolling bug
368556dd234d HEAD@{71}: rebase: fast-forward
f0cd6012c40d (tag: hardening-v6.16-rc1, kees/for-next/kspp, kees/for-next/hardening) HEAD@{72}: rebase (start): checkout f0cd6012c40d
70f74ef707fc HEAD@{73}: commit (amend): ubsan: integer-overflow: depend on BROKEN to keep this out of CI
eef1355c269b (HEAD -> for-next/hardening, origin/for-next/hardening, for-next/kspp) HEAD@{74}: commit (amend): ubsan: integer-overflow: depend on BROKEN to keep this out of CI

c102753312e8 is based on a sane tree, I'm starting to build patches that
I'd like to land in -rc1, based on my existing for-next tree. Which gets
us back to the "known good state", per sfr.


Okay, reproducing the "b4 trailers" steps:

#### start from known good tree
$ git checkout 62329e859b25 -b test/wreckage/before
$ l
62329e859b25 (HEAD -> test/wreckage/before, dev/v6.16-rc1-pre/-Wunterminated-string-initialization) [DUP]
9a7d4e791037 crypto: Annotate crypto strings with nonstring
b080c44c4d69 kbuild: Re-enable -Wunterminated-string-initialization
8c2bb7d12601 ubsan: integer-overflow: depend on BROKEN to keep this out of CI
b9dbd69a32e3 wifi: iwlwifi: mld: Work around Clang loop unrolling bug
9d230d500b0e Merge tag 'driver-core-6.16-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core
bf373e4c786b Merge tag 'devicetree-for-6.16' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux
8ca154e4910e Merge tag 'for_linus' of git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost
43db11110730 Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm
12e9b9e5223b Merge tag 'ipe-pr-20250527' of git://git.kernel.org/pub/scm/linux/kernel/git/wufan/ipe
90b83efa6701 (stable/master) Merge tag 'bpf-next-6.16' of git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next
1b98f357dadd Merge tag 'net-next-6.16' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
...
### Try to update 8c2bb7d12601 with the Acked-by from the list...
$ b4 trailers -u https://lore.kernel.org/all/CANpmjNPpyJn++DVZmO89ms_HkJ0OvQzkps0GjCFbWkk0F+_8Xg@mail.gmail.com
Finding code-review trailers for 39 commits...
Grabbing thread from lore.kernel.org/all/CANpmjNPpyJn%2B%2BDVZmO89ms_HkJ0OvQzkps0GjCFbWkk0F%2B_8Xg@mail.gmail.com/t.mbox.gz
---
  + Acked-by: Marco Elver <elver@google.com>
    https://lore.kernel.org/all/CANpmjNPpyJn%2B%2BDVZmO89ms_HkJ0OvQzkps0GjCFbWkk0F%2B_8Xg@mail.gmail.com
---
Press Enter to apply these trailers or Ctrl-C to abort
  ubsan: integer-overflow: depend on BROKEN to keep this out of CI
    + Acked-by: Marco Elver <elver@google.com> (✓ DKIM/google.com)
---
Invoking git-filter-repo to update trailers.
New history written in 3.28 seconds...
Completely finished after 3.76 seconds.
Trailers updated.
$ l
bd31653e0d81 (HEAD -> test/wreckage/before) [DUP]
b68e360e9673 crypto: Annotate crypto strings with nonstring
650370e9729c kbuild: Re-enable -Wunterminated-string-initialization
2e058d249588 ubsan: integer-overflow: depend on BROKEN to keep this out of CI
50d526235542 wifi: iwlwifi: mld: Work around Clang loop unrolling bug
f8b59a0f90a2 (broken/for-next/hardening) Merge tag 'driver-core-6.16-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core
301559ea27b1 Merge tag 'devicetree-for-6.16' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux
ca1f463363e2 Merge tag 'for_linus' of git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost
...

Welp, that precisely recreated it -- even identical shas! Looking at
the b4 output, I do see a suspicious "39 commits" listed for some reason.

So, I assume the "git-filter-repo" invocation is what mangled it. I will
try to dig into what b4 actually asked it to do in the morning...

-Kees

[1] https://lore.kernel.org/lkml/20250529173113.work.760-kees@kernel.org/

-- 
Kees Cook
