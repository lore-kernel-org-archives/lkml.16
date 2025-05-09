Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C69F28EA75;
	Fri,  9 May 2025 11:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746789613; cv=none; b=nXEvQZYodMPA9hBmEeQsU+mZAah+pg5oifvHWF26qIRwjdBmLi8YTIOnq9pq/NrIRJWU5+QHMasSPSxWUseqBDb0ggV1mCt3UJmKNkDysvFPfwuA2Fp7IwQXcUVCADG8XNp28tgV+zBsar+hamMm1lyzzlc305ivdqRGljzocwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746789613; c=relaxed/simple;
	bh=E+s6OoJgG+h3YTB+bOxBeFfCl/S1GtVx3v7NBigk4N8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pro4+YCIbBq0bBvxIa1ekXpVLXI3G3VGlDuPu4LCVlr0BvGE+dSn5cWrVgGyKRLNDc6lb0WM/B6OHsPXSv3xcRlbCCxiNY76vlQm/zSHDxgC2QjC52no3ZuRL9Uyk3fqWjG8/U249lAhvd8NWmZ1/x8EIqU728HVfRUxrdVCidI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IIZpK6PK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IIZpK6PK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01A13C4CEE4;
	Fri,  9 May 2025 11:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746789612;
	bh=E+s6OoJgG+h3YTB+bOxBeFfCl/S1GtVx3v7NBigk4N8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IIZpK6PKmMoYIe6HXf8nOlb4a7LGWutODyY5I6vimOkGrVtbfOgUCeNvBIlPTgfxl
	 V53tNPZE2m+MCGhcWHLknu+TrQoh5oViF/uqr5bBFJJfeX0dGCbqvVODfbsVLOWSpq
	 Fwkn+hkVmK3AqvlZ+vaLtMIA3uTgwb9tc6YV2PZPXDn/BEXw6q9sMAM1+FR70w6RaY
	 +aMnpnEtHhGSfW8XbeoaubD/p29h+L9V4peeufMvADXv8KG7KXfOQZeNHkhfGxsM+T
	 pOPpPpS0NDp2aDoU+9CiqTBfd77d3uwnULDE+U05OESUdIp5UEVxLtbBGr5wxKltr5
	 PrtHQgW/2ZGSw==
From: Christian Brauner <brauner@kernel.org>
To: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: Christian Brauner <brauner@kernel.org>,
	Mateusz Guzik <mjguzik@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-debuggers@vger.kernel.org,
	Sentaro Onizuka <sentaro@amazon.com>
Subject: Re: [PATCH] fs: convert mount flags to enum
Date: Fri,  9 May 2025 13:20:07 +0200
Message-ID: <20250509-altbekannt-maskiert-292dbfb0daff@brauner>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507223402.2795029-1-stephen.s.brennan@oracle.com>
References: <20250507223402.2795029-1-stephen.s.brennan@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1727; i=brauner@kernel.org; h=from:subject:message-id; bh=E+s6OoJgG+h3YTB+bOxBeFfCl/S1GtVx3v7NBigk4N8=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTIPnnxd8vyc87FZrxK6pvjd08Nm9qzfuMpJearDoe3/ H4l/vfttI5SFgYxLgZZMUUWh3aTcLnlPBWbjTI1YOawMoEMYeDiFICJpOsx/JXSmr9tebfJujmz Pws9m3SESzvzTvWRu5LnvqpFuHBFv53G8M/w4IWnPon3XaaHWWm/9LO42CUVGJ7Jc8SmreFj1ez yYn4A
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

On Wed, 07 May 2025 15:34:01 -0700, Stephen Brennan wrote:
> In prior kernel versions (5.8-6.8), commit 9f6c61f96f2d9 ("proc/mounts:
> add cursor") introduced MNT_CURSOR, a flag used by readers from
> /proc/mounts to keep their place while reading the file. Later, commit
> 2eea9ce4310d8 ("mounts: keep list of mounts in an rbtree") removed this
> flag and its value has since been repurposed.
> 
> For debuggers iterating over the list of mounts, cursors should be
> skipped as they are irrelevant. Detecting whether an element is a cursor
> can be difficult. Since the MNT_CURSOR flag is a preprocessor constant,
> it's not present in debuginfo, and since its value is repurposed, we
> cannot hard-code it. For this specific issue, cursors are possible to
> detect in other ways, but ideally, we would be able to read the mount
> flag definitions out of the debuginfo. For that reason, convert the
> mount flags to an enum.
> 
> [...]

Applied to the vfs-6.16.mount.api branch of the vfs/vfs.git tree.
Patches in the vfs-6.16.mount.api branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs-6.16.mount.api

[1/1] fs: convert mount flags to enum
      https://git.kernel.org/vfs/vfs/c/6a8dcdd969cb
