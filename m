Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDFF22A4EE;
	Fri, 30 May 2025 14:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748616530; cv=none; b=dns9HbqY3v9tJz2JQxEztcU/5Wo7RxhIwihnO3QF1ebZcMJi6hbhMRqDFweNXd99+fuTQYa0h/cOvXoeDiV0QYyZ0ccbzyB6a4NzvKogyOyKMklYK6PZtjrIdGQWn9y6Jyh3MKUqtbZB2gnBK8mzFpcbssAlHJX3WmdKrzzp7q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748616530; c=relaxed/simple;
	bh=UB8l+3n9sD265pPFssJvMbps25NHgkpJSzDq/5epGiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ozyo09iTrNvkT6z0nZi5vAqoftC5k7+VTGpU3ETUAeeKPln080CI1nRj2KuMj2nxP6uKhArwBIqNrUAbM3DUsFMaycZiHKFiwnYH+Ru5evZLpMxhybSM2vm87NUD+zng6+2Da12bxls7Wqvxyba/Kd4PvFwkrJv51uWACVLInDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VjPXLbqj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VjPXLbqj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 492B4C4CEE9;
	Fri, 30 May 2025 14:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748616529;
	bh=UB8l+3n9sD265pPFssJvMbps25NHgkpJSzDq/5epGiQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VjPXLbqjMek/pnIR/YoUe+fin5ODfMn5E795MJafq+Jn+YSLs5FV1/YiIS2GSYlGT
	 hnT3BPdc9eJz4K8YuICaFPP4Er4xnlFwb776vqHtOG7gmH57KxQqq7thq5W/xqfU0t
	 PKROsYYvPk+k7tQ+CjMhCcZMdKZC8/1T/IbyLX2nT6sL5WNwn18Y+Ql9d4saqa+eNt
	 owYaeIOdrsNDqHf2jHI/oNUwICui78gbF7gQkXgg+ZWdtnxnZjyHjsTtQwwBZiR7XS
	 a2IHv8xBbWMMbVMqeGCJHIQmNQDMHmrVSUpBVAonc98a2OJRCILGK1jUnfzt89SbxC
	 XVWqv13bf8t6A==
Date: Fri, 30 May 2025 07:48:48 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Joe Damato <jdamato@fastly.com>
Cc: Jacob Keller <jacob.e.keller@intel.com>, John <john.cs.hey@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Bug] "possible deadlock in rtnl_newlink" in Linux kernel v6.13
Message-ID: <20250530074848.59b02d47@kernel.org>
In-Reply-To: <aDkF-Q5K6RhIX5MD@LQ3V64L9R2>
References: <CAP=Rh=OEsn4y_2LvkO3UtDWurKcGPnZ_NPSXK=FbgygNXL37Sw@mail.gmail.com>
	<c9b62eaa-e05e-4958-bbf5-73b1e3c46b33@intel.com>
	<aDjyua1-GYt8mNa1@LQ3V64L9R2>
	<20250529171640.54f1ecc6@kernel.org>
	<aDkF-Q5K6RhIX5MD@LQ3V64L9R2>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 May 2025 18:12:25 -0700 Joe Damato wrote:
> I'll post something to the list, but I don't have a reproducer to
> test. I'm a noob with syzbot, but maybe there's a way to trigger it
> to re-run with a posted patch?

If there is a repro you can post a patch and say #syz test.
You can reply to just syzbot, no need to CC the list.
