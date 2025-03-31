Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480903594F;
	Mon, 31 Mar 2025 17:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743441398; cv=none; b=E6n4i3kqB01YIXZB51EwPwJOzR6Fs4gmoH0vyCyu3UCDYiYg74V+CKMHDCnakbROJaWlOC3OjhYtHUG/FDV7dLCsxXiymLEXkTnzHPsg2mkE1inRfvDiB65+YwyqqwCizmZsjcDuSSNzX/MmzJhRT7EpDwNJEXxleqyLwBNcBxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743441398; c=relaxed/simple;
	bh=rpYQguWv44QHdB5LaETELCvdlhRSzznPximqPUUnDG4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YU3iS1cpn+k9uoh9HOKAuGTUy8sBftlTna+g/nnjcw8tIZzN0tdBT4PQsWub6PViJaBkbuKegg1KdnbUXXpeZN4ns8vAWY1rVMDVHl+nVe8B03bS9NlKhmYrt4u9Gkp68SGSN6fx+Y0CQJt5FrIJLWNl5QVQNEoJbY6jaOORmXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZn9R3C9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZn9R3C9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B23C4CEE3;
	Mon, 31 Mar 2025 17:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743441397;
	bh=rpYQguWv44QHdB5LaETELCvdlhRSzznPximqPUUnDG4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JZn9R3C9eRzwD/RcFurJKZX8+nUebDT4RL7ck98tVEQZGvPRYrqqwdydp4J6PQvzG
	 iw+Up/lYZWJF6+vr/E5wjuZsvefliQSJEDG1BmejGKV1chkRAPPOqMGkrZRX7aaxMY
	 /JqtyqrkzZvaKrlhfzT8lcAulaoztZrOCcQ9M5BMKLh8BG2ITBugJ7ov+B7U3U9owk
	 MtagD2vYfaju01EXzAkf4m+tZtgz02/8GVRq1QqzCgQW4INGHuYY4wZ06R6Cb/Cg15
	 pDNizTo8V35/mn9gUQHXF3kuNyB++YKWFb65zKs40WYTDwjw1Ro7I+xc91Z0J0MlZn
	 NSFTliIxBbDPA==
Date: Mon, 31 Mar 2025 10:16:36 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Stanislav Fomichev <stfomichev@gmail.com>, Stanislav Fomichev
 <sdf@fomichev.me>, kuniyu@amazon.com, netdev@vger.kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux-kernel@vger.kernel.org, michael.chan@broadcom.com,
 pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch, Taehee Yoo
 <ap420073@gmail.com>
Subject: Re: [PATCH net] bnxt_en: bring back rtnl lock in bnxt_shutdown
Message-ID: <20250331101636.58590e38@kernel.org>
In-Reply-To: <Z+rIfMYoinNfz820@gmail.com>
References: <20250328174216.3513079-1-sdf@fomichev.me>
	<Z+qAYXmGY08pQKKb@gmail.com>
	<Z-q08YfJMq8Q76ki@mini-arch>
	<Z+rIfMYoinNfz820@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 31 Mar 2025 09:53:16 -0700 Breno Leitao wrote:
> > But also in general, it would be nice to keep existing
> > rtnl+instance_lock scheme for now (except were we want to explicitly opt
> > out, as in queue apis); we can follow up later to un-rtnl the rest.  
> 
> I am just wondering if the code as-is is already safe from a locking
> perspecting, and just the warning (ASSERT_RTNL) is wrong.

I suspect the notifiers for DOWN may expect to be called with rtnl held.
