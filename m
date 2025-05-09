Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0750A2609C3
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 20:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746821931; cv=none; b=lc3LAHiiwn7Fl6iBWfhs3xMjPmICijLkUC0tZ1Se30KchvBNZT+mTXPnN2hW8UxL0kAqh4GCUdixT4jlXz7NzWjfZT/pvWjceKcdZt0MU7/78xVSU5UebQ+BPapzLAuGMIVnKC/Wg3vahAwku2ucJztqPehVDpGihg6A5YD73Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746821931; c=relaxed/simple;
	bh=mk7i+qU2iu2tkfGjWrHjIDumV9LcHQUvOsTx9yuJ8Bc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=GmPT22jB6HjqWPUKuoyUiuhyhAjYkxs/Tgi6Nb4iDy177+zUEb1QpAzkrkhfEGVeL/WAmWQoeRyDQR6hR4FJjTUU99V11jqLRVhSkNVw/GbSx6vgRfjQiT2A2a3Ik0xgNqcBi3iMCOUwTI1wmxAK+tY1qDkIJ/NmYhBeK/PLTns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=t4orQPYf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="t4orQPYf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE5D7C4CEE4;
	Fri,  9 May 2025 20:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746821930;
	bh=mk7i+qU2iu2tkfGjWrHjIDumV9LcHQUvOsTx9yuJ8Bc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=t4orQPYfSe5bX/dKNfm2QCJqVnBbJC0NVBXFu9TLSWgHU++9xFSqV2XnoTaVFu5Rl
	 Hx3cG2vmPjrj4E979nxBxlQ+1afSStfW7nd7heLs9aOQXDFceq/GDVpR68uNLwbKxt
	 V3AVMbGAZlAdatNK9NPkubbvgSKnHUtF6zys28j0=
Date: Fri, 9 May 2025 13:18:49 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Chen Ridong <chenridong@huaweicloud.com>
Cc: paulmck@kernel.org, bigeasy@linutronix.de, legion@kernel.org,
 roman.gushchin@linux.dev, brauner@kernel.org, tglx@linutronix.de,
 frederic@kernel.org, peterz@infradead.org, oleg@redhat.com,
 joel.granados@kernel.org, viro@zeniv.linux.org.uk,
 lorenzo.stoakes@oracle.com, avagin@google.com, mengensun@tencent.com,
 linux@weissschuh.net, jlayton@kernel.org, ruanjinjie@huawei.com,
 kees@kernel.org, linux-kernel@vger.kernel.org, lujialin4@huawei.com
Subject: Re: [RFC next v2 0/5] ucount: add rlimit cache for ucount
Message-Id: <20250509131849.112545d60dd7bb2d28c3b966@linux-foundation.org>
In-Reply-To: <20250509072054.148257-1-chenridong@huaweicloud.com>
References: <20250509072054.148257-1-chenridong@huaweicloud.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  9 May 2025 07:20:49 +0000 Chen Ridong <chenridong@huaweicloud.com> wrote:

> The will-it-scale test case signal1 [1] has been observed. and the test
> results reveal that the signal sending system call lacks linearity.
> To further investigate this issue, we initiated a series of tests by
> launching varying numbers of dockers and closely monitored the throughput
> of each individual docker. The detailed test outcomes are presented as
> follows:
> 
> 	| Dockers     |1      |4      |8      |16     |32     |64     |
> 	| Throughput  |380068 |353204 |308948 |306453 |180659 |129152 |
> 
> The data clearly demonstrates a discernible trend: as the quantity of
> dockers increases, the throughput per container progressively declines.
> In-depth analysis has identified the root cause of this performance
> degradation. The ucouts module conducts statistics on rlimit, which
> involves a significant number of atomic operations. These atomic
> operations, when acting on the same variable, trigger a substantial number
> of cache misses or remote accesses, ultimately resulting in a drop in
> performance.

Did you consider simply turning that atomic_t counter into a
percpu_counter?
