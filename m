Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75451D63EF
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738920099; cv=none; b=tESKRJw1lQc/AU15D97QmLp6qUtZa0X7nN3/Ou6mRlDZVKFk8DAJfDa1mPi9T7s+Sjwe2VoxuDPVcr62YOlU4QDQSIkjKdy2zONnR4sauMbxqQFm+Xn6hiHtS/JtT2teW/BohjAbw77nczoMD9xF56e3eudYfafMuhfunXx1Tig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738920099; c=relaxed/simple;
	bh=K9u7VXX60c6GNKepv7e2/TezpJ7Bd+MQ0QzhSDCsw5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tcs78kmuAm9OphcqcUmRhMU0UpAs+/4Iv0/OtUFoRNvXqyClXuup2Qr5izRX9If+RRdf+CmZSZlEjLxgrwrtQyscE4U7yjIGCWpws8zfdh+g9CAS2DoYx6w1d53eGYIj/D4w1cNZyCxv9oSI9MwzN70URYAssQjnAJd/WvRqmIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YuqNFAtH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YuqNFAtH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 515B7C4CED6;
	Fri,  7 Feb 2025 09:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738920099;
	bh=K9u7VXX60c6GNKepv7e2/TezpJ7Bd+MQ0QzhSDCsw5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YuqNFAtH5J4Nu2plJ9bSXPRN8mRa+NYob8JEz4wtpP23jeJ3HgwMBQiBt8raSzXgL
	 woOvin6lLuV+ogWHCoFnaSntV+vkgdie+FZqK8XNrs0ZW61d6CkdekyQaE4q67qkJs
	 C5RE9lL8ff7sqZn/zD7tmoppXRsLPbss0ByOcOUWmK4+qonOQJVoR2H+sZ0bkQCBhH
	 OXLAbsvKzNeFJZABByydbgk5UvU0gqvhNC5e4AoW2976+At+1eUW1DTSb2luWEby/a
	 plFdV35pxaH2eAqppPYUJGIdo5VmcA8eqwYE29GVkhhMjXquOSn7FyPa0CGzDwtTWH
	 cpebNUaxc2C4w==
From: Christian Brauner <brauner@kernel.org>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>,
	akpm@linux-foundation.org,
	Liam.Howlett@oracle.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	ebiederm@xmission.com,
	oleg@redhat.com
Subject: Re: [PATCH v6 0/5] reduce tasklist_lock hold time on exit and do some pid cleanup
Date: Fri,  7 Feb 2025 10:18:22 +0100
Message-ID: <20250207-wettkampf-binden-648f00063d8f@brauner>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250206164415.450051-1-mjguzik@gmail.com>
References: <20250206164415.450051-1-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1583; i=brauner@kernel.org; h=from:subject:message-id; bh=K9u7VXX60c6GNKepv7e2/TezpJ7Bd+MQ0QzhSDCsw5Q=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaQvvdDl9LlSN45V8ayVwY+5M27lzq+6ol/PXmvgL3RGa e3SvInJHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABPpfMbwT+WZjopvqi2jktD6 vTu/qB++/33qETHH5W/XnX5zSLRDQJDhn9kXuS3O15efmvpe8slHnhuOrRrbdZ+v8o8QnGFjG7+ glRMA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

On Thu, 06 Feb 2025 17:44:09 +0100, Mateusz Guzik wrote:
> I fixed fat-fingering and touchedup some commit messages. git diff
> between the old and new branch does not show any code changes.
> 
> hopefully we will be done here after this iteration 8->
> 
> old cover letter:
> 
> [...]

This is great!

---

Applied to the kernel-6.15.tasklist_lock branch of the vfs/vfs.git tree.
Patches in the kernel-6.15.tasklist_lock branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: kernel-6.15.tasklist_lock

[1/5] exit: perform add_device_randomness() without tasklist_lock
      https://git.kernel.org/vfs/vfs/c/c8be3764feff
[2/5] exit: hoist get_pid() in release_task() outside of tasklist_lock
      https://git.kernel.org/vfs/vfs/c/9ee2997cbf14
[3/5] pid: sprinkle tasklist_lock asserts
      https://git.kernel.org/vfs/vfs/c/7d0030e1660c
[4/5] pid: perform free_pid() calls outside of tasklist_lock
      https://git.kernel.org/vfs/vfs/c/7b15589a575f
[5/5] pid: drop irq disablement around pidmap_lock
      https://git.kernel.org/vfs/vfs/c/07e518c464e8
