Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5F91E231E;
	Tue, 29 Apr 2025 11:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745924938; cv=none; b=ZsPy2H+e1QvvI6wN1Xm4qAaCCNEoYaH3Hogvh9vscf4s0TRk3wg8Ft7CNRvHWKlI5TocR+97lNcd4Bxdi/R028XBaUkZA2aC12kkkDJlE2lpG1GmUugmo6c4XWzTKC/JO7RqNehjoQ9cr2/GGt1brVFxMW4zwtVt0vNKwg2n+F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745924938; c=relaxed/simple;
	bh=2FnrdaPoR6yU2qmctP2qpvbz6w9gH8tMRvd6MmMwPtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PYRSWngZPLpsbCplqwdQPVzhtreTcxGpOTt19pfiO+OOEDuS3Ld7ovDY8KTBee8LCILkHDdYxRCPgzyIQGYWGoF0PUmT1V/+5CszEBT60R4bv4j7ox8gkX75Ux4GrhaPawUKDG7djxWxvgjDAqMGWD9ykxaAmWPxsSDz9hv8eZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ep8YiIFS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ep8YiIFS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3346C4CEE3;
	Tue, 29 Apr 2025 11:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745924934;
	bh=2FnrdaPoR6yU2qmctP2qpvbz6w9gH8tMRvd6MmMwPtE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ep8YiIFSMnfU3uuqFEOyAL/4NxG6aIOZUmzynEAW/YlI9o/KCPiY5jGR/dmplSQwN
	 d2MRjQb6a5JM7uQ64BWL0rAHmYVpqKL8/lglRXyhHr7zlYJgVVW0V0T6odu8OYuvfG
	 KcSYQA8K9UJ2O/mN1bV1ELz31g4XXVrxZEJ57OnxNWbn40TZnHv3wwZ2fqMBWXNG0u
	 nGQtgOU6yWS2ThnBhOrpoBLwpdC943UZg0VdcbIYW+iovwgrvi1swm2HMVNQgLt/Qj
	 3z2IP66Pjgl6UnShX4SxrjmVddzN2+hYdkwDjCF4aSvaQtWbq24NDK2pT+JpMa1nCH
	 7Qu6KhR6I22aA==
From: Christian Brauner <brauner@kernel.org>
To: alexjlzheng@gmail.com
Cc: Christian Brauner <brauner@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jinliang Zheng <alexjlzheng@tencent.com>,
	viro@zeniv.linux.org.uk,
	jack@suse.cz
Subject: Re: [PATCH] fs: remove useless plus one in super_cache_scan()
Date: Tue, 29 Apr 2025 13:08:44 +0200
Message-ID: <20250429-nennen-denkt-6975ae5b1e98@brauner>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250428135050.267297-1-alexjlzheng@tencent.com>
References: <20250428135050.267297-1-alexjlzheng@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1052; i=brauner@kernel.org; h=from:subject:message-id; bh=2FnrdaPoR6yU2qmctP2qpvbz6w9gH8tMRvd6MmMwPtE=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWQIbHbc8nQRz3mTBs533PUhfSJSMw00H9dXWh/q/3/La db9Xj3VjlIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgImsuc7I8FF2yUcNjbWGxh9n pHmJJjqXnqv+fbHGXOeNa9xavkP9RxgZZi8z/cu2TUJqlWrR8Xzj3vdM53uDJ9wtf7LUNudw1KZ f7AA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

On Mon, 28 Apr 2025 21:50:50 +0800, alexjlzheng@gmail.com wrote:
> After commit 475d0db742e3 ("fs: Fix theoretical division by 0 in
> super_cache_scan()."), there's no need to plus one to prevent
> division by zero.
> 
> Remove it to simplify the code.
> 
> 
> [...]

Applied to the vfs-6.16.misc branch of the vfs/vfs.git tree.
Patches in the vfs-6.16.misc branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs-6.16.misc

[1/1] fs: remove useless plus one in super_cache_scan()
      https://git.kernel.org/vfs/vfs/c/9f81d707022c
