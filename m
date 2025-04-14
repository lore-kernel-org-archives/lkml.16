Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BE619924E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744630978; cv=none; b=Igx3ws8myhIVdZSuFqb0NJUE87UOlbJiq3gs+j4aqhTFAUMkF6J/5qhYJAU9w2XdIzPKui2gYM6Ygm6JRm7nCaSWWEHiXZfqyCAQczFV0mW4laozPsgCgsRCe5Y5JnFV6ZJlx52C0OA8lpAui98fXlE8jymkfWQjToo9zjruwGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744630978; c=relaxed/simple;
	bh=tCNsgrDri8daLFGZvhhEyRWqH5aNJdMnDcDM9O99Hm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qDvevjEcpomAOUeBEsFlD/+ao+XgAN1Jnb4dPg4WNorr2YunQrEuN61KluuOHwqQWg7faoJ8nMmMwoInC6h8uwUB0Q8Bi+zfZWh/9MYw4tX3xIT58jdZ1T7QilGZSbpuRW3MvFoaLLY1sVVTdl5za5lsQ4ySZJCxo/GmgZdxGCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U6GlVXGM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U6GlVXGM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50434C4CEE2;
	Mon, 14 Apr 2025 11:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744630977;
	bh=tCNsgrDri8daLFGZvhhEyRWqH5aNJdMnDcDM9O99Hm4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U6GlVXGMrI6w9y190podeFPKmPimN1ITyX0x+5DSidnZAt/g0vVCl8g4Vi9OwSBlZ
	 n0he8ZOP7RXn/kJO8MA4g49mbvpE3GZ7MqCa8fe+idrCztHFngTvcQTF+NZSsP/joS
	 R/frX1L9zPP9/2Z7rjXmV1teoZS4WBQuM18ANw0CgCawNnGtGpzg7scIxhEdwGGFab
	 bN9hSbMn8teXgox8LsWF+e/JLB5KmK+u2xmFNCEP8FF8HuD3lN9KtypVeEloKmsnW+
	 Y7AsTfrMgW+jO8yMziXVBuYZmPZwjuzDQ8xb2Vl1P99SyRMM47/53Ocny3fe8YEUu+
	 Xi+q+Im6W1q8A==
From: Christian Brauner <brauner@kernel.org>
To: Mateusz Guzik <mjguzik@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>
Cc: Christian Brauner <brauner@kernel.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	"Liam R. Howlett" <Liam.Howlett@Oracle.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] release_task: kill the no longer needed get/put_pid(thread_pid)
Date: Mon, 14 Apr 2025 13:42:51 +0200
Message-ID: <20250414-ertasten-gelassen-78abebf1625e@brauner>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250411121857.GA10550@redhat.com>
References: <20250411121857.GA10550@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1117; i=brauner@kernel.org; h=from:subject:message-id; bh=tCNsgrDri8daLFGZvhhEyRWqH5aNJdMnDcDM9O99Hm4=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaT/+bJ3qa6g+zmvGl7W8B8LvjIvYfqt1HY0SNB6yk6r6 oK2PXrGHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABN5FM7wV/Bla/zbACv9HTtt 1nEb9vms/HZTzyhk5uqEDRlpF06cjGRkuCNxJebg1SduxXKsuV2JB8Om5/MflPycPSlC4ecVJdV WJgA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

On Fri, 11 Apr 2025 14:18:57 +0200, Oleg Nesterov wrote:
> After the commit 7903f907a2260 ("pid: perform free_pid() calls outside
> of tasklist_lock") __unhash_process() -> detach_pid() no longer calls
> free_pid(), proc_flush_pid() can just use p->thread_pid without the
> now pointless get_pid() + put_pid().
> 
> 

Applied to the vfs-6.16.pidfs branch of the vfs/vfs.git tree.
Patches in the vfs-6.16.pidfs branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs-6.16.pidfs

[1/1] release_task: kill the no longer needed get/put_pid(thread_pid)
      https://git.kernel.org/vfs/vfs/c/c9e3b2f77268
