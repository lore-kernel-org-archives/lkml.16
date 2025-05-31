Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287844A08;
	Sat, 31 May 2025 00:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748652352; cv=none; b=EPEJSIfg66Odm6oArEYx5oGZ+3CRWUH/Zpmu+4Ig2PBrqhJvkdaCg6oAIfuXolC54kBy6UjYeRbBrNNdhH/uuLHnXTTGkfAPrZqgLDcPdXSbh1GXqnnI/VU0NIXtHUJW0GLoTePmQbWyxphGk5uyeiHEJ50bo03JTSml7B1G2HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748652352; c=relaxed/simple;
	bh=eFuUU5H0EZTvta9tnSmPNt8NChN173VFZtM77Xz79WU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bc0h7vMtct8GpVFQ8pD9IDH9s2JEA8T0Ydn8JVwgJGFtK38QTX/+NZQzQMpRB63iZ1IzzkhIT8AAE8dN+sDa3ShdE8NxwrltXktuYKYj27Dl8Wbe6YT2c2NwfozxVZbnkc2mcBIC01wGHKAAyIxCGTUaDVhEGITGS4vQAYqll3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JF92qscn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JF92qscn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C24AC4CEE9;
	Sat, 31 May 2025 00:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748652351;
	bh=eFuUU5H0EZTvta9tnSmPNt8NChN173VFZtM77Xz79WU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JF92qscn5WOuWyTX5GtXUGeQFX4mdZ/eypeD+e9RGTcztb40wgLhpY5jj3iqEnBFs
	 WRZh9mJgorIz8wJoZ92f8UCyvqw8Lx/lsWmTlRzEENCfsvdPk7XJMxGJnqMm0p6bWA
	 1HSsiDjprlXGcfI0pBn8URbxtCOfb7VGB9SnfKA++PevnkWjzOKEESsJozCJUysTpx
	 f3FsquHVIlRPedOqPG1vB1rk5cn6oNB7K287kdtqi0jce6ADuSuzyR08qcL2LWxij5
	 OJ7ytBjxgX2gZI2MYNIWDlRUlS5z5Sm3H4qp9F5oclFq7uSRXNNirsJoSAzZDbXNiv
	 3M2hfcSDwQNNQ==
From: SeongJae Park <sj@kernel.org>
To: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: SeongJae Park <sj@kernel.org>,
	Ye Liu <ye.liu@linux.dev>,
	akpm@linux-foundation.org,
	linux-debuggers@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-toolchains@vger.kernel.org,
	osandov@osandov.com,
	paulmck@kernel.org,
	sweettea-kernel@dorminy.me,
	liuye@kylinos.cn,
	fweimer@redhat.com
Subject: Re: [PATCH v5] tools/mm: Add script to display page state for a given PID and VADDR
Date: Fri, 30 May 2025 17:45:48 -0700
Message-Id: <20250531004548.170935-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <875xhhagp8.fsf@oracle.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 30 May 2025 15:15:15 -0700 Stephen Brennan <stephen.s.brennan@oracle.com> wrote:

> SeongJae Park <sj@kernel.org> writes:
> > On Fri, 30 May 2025 13:58:55 +0800 Ye Liu <ye.liu@linux.dev> wrote:
[...]
> > As reported to the previous version, I show below on my test.
> >
> > Memcg Name:      unknown
> > Memcg Path:      Unexpected error: 'struct kernfs_node' has no member 'parent'
> >
> > I know you explained it is an issue of drgn version on my setup, as a reply to
> > my previous report.  But, could you please make the output more easy to
> > understand the problem?  No strong opinion, though.
> 
> This is an interesting issue.
> 
> The cgroup helpers in drgn were broken by the name change of
> kernfs_node.parent to kernfs_node.__parent in Linux 6.15. This was fixed
> in drgn promptly, and the fix is included in drgn's 0.0.31 release. If
> you use that, the error should go away. In essence, 0.0.31 was the first
> drgn version to support Linux 6.15.

FYI, I'm using drgn package on Debian 12, which says

    $ drgn --version
    drgn 0.0.30+82.ge2b60e4b (using Python 3.11.2, elfutils 0.188, without libkdumpfile)

Also I run a kernel built from damon/next[1], which is based on 6.15-rc6.

> 
> However, there's no general way to catch any drgn error and determine
> that that drgn doesn't support your kernel version (yet). The code could
> be updated for this specific issue, but it wouldn't really fix the
> general problem. I think drgn needs to include an (INFORMATIONAL ONLY)
> set of kernel versions that it has been tested on. Then, you could use
> that in a script to print a warning (or add it to your general purpose
> error handling).

Sounds like a nice plan!

> I'll look into adding this.

Thank you!  I'm not urgent or having a real problem with this at the moment,
though.  So, please take your time and fun!

> 
> This is itself a corner case for committing drgn scripts in the kernel.
> Omar does a really excellent job with running tests on the -rc's and
> finding broken helpers promptly -- usually well ahead of the kernel
> release. But even then, there can be a delay from the fix to the next
> drgn release. The more that you rely on drgn's helpers for a script that
> you distribute in the kernel, the more likely that it will periodically
> break, and the in-tree version wouldn't work until the newer drgn
> version is released.
> 
> I don't have a solution for *that*, but it's something to consider when
> deciding whether to include a script in drgn's contrib/ directory, versus
> in the kernel.

Makes sense, thank you for sharing your wise thoughts.  This is very helpful to
me.

[1] https://origin.kernel.org/doc/html/latest/mm/damon/maintainer-profile.html#scm-trees


Thanks,
SJ

[...]
