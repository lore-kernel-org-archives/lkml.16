Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6691521660D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745609159; cv=none; b=vEM4+RRq8PIqmIC3vwCzqUntR8WGUxPo79khAkbxCPKo2FFmg8jXD+CUTCdPIF+5mu4CRi6iRXYLk8Z0LY9VWx8IGBE0CLZITsF2dynerJvN3ys64J1P0P9Eb8KnkikxnJ93hMIbGMz/kEO5TyzRzpfHcWhmrTzPgN/E7pgYPMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745609159; c=relaxed/simple;
	bh=fevWv2WsbzFZWwQm0Gdx21OiWcz6gRZkqGLmD4zYuvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6reu23kJlLBBavmDHINwhK0gc3gGkONxpvC5yCyi47tRKgmidfqAYwd+XhgfxfG/4QJ3LRj9XxeOIVlXzZrPs0/BPZ+/ovozvYXEGasVSE0GfsAGiA/B+qK4XczfVIAQRDRtf8XzNdXarYrK374A+F3aJV1Ea8Qxe+m9Y+L+aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qyg5Pn6b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qyg5Pn6b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B62ACC4CEE4;
	Fri, 25 Apr 2025 19:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745609158;
	bh=fevWv2WsbzFZWwQm0Gdx21OiWcz6gRZkqGLmD4zYuvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qyg5Pn6bZcbU6/dfF2eZEggsqPeoRa3gi9jW0KjYUXH2jDh7kzCzbJK+qon/XfH/T
	 Lc1F3nLCes03aeOrzmWNeP6UrhVevVuJmWPVRgAAXOP5XmQE0fpR05aNTHvWQjSAgk
	 0IH6x5Pmbl6v3ufs0s0lSse+Ar2c3b6VynPDUKj4MopQMcXPWLrkfiBluCYuwECCwo
	 D7jluSlqDvb3J1AbgbUNiAcl4sP47Z76co5Sqe7Im0soWhMXHR5qVdmFauBFx91bPw
	 zKDz4HZcHEGZ6/Vf8IWj+OURndiXaKbfT+Ol7lxOIsLXqExmD1KusbgUgmOSJSiAm7
	 stPCaGtpyXgRw==
Date: Fri, 25 Apr 2025 09:25:57 -1000
From: Tejun Heo <tj@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>,
	Philipp Stanner <phasta@mailbox.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] workqueue: flush all pending jobs in destroy_workqueue()
Message-ID: <aAvhxfGvndybqkJm@slm.duckdns.org>
References: <20250423-destroy-workqueue-flush-v1-1-3d74820780a5@google.com>
 <aAqXw3t9UVU8pF8_@slm.duckdns.org>
 <aAtXApA8ggJa6sQg@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAtXApA8ggJa6sQg@google.com>

Hello,

On Fri, Apr 25, 2025 at 09:33:54AM +0000, Alice Ryhl wrote:
...
> Hmm. I think we would need to add a new field to delayed_work to keep
> track of which list it has been added to.

Can't we use the same cpu that's already recorded in delayed_work->cpu?

> Another option could be to add a boolean that disables the list. After
> all, we never call destroy_workqueue() on system_wq so we don't need the
> list for that workqueue.

It's not just system_wq tho. Any busy workqueue can hit scalability problems
and the result would be usually subtle performance penalties. If we can keep
it cheap enough, I'd prefer the behavior uniform across all workqueues.

Thanks.

-- 
tejun
