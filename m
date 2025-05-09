Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A649928682;
	Fri,  9 May 2025 01:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746755502; cv=none; b=qrfkrm36DP9fEoOUzVd8nJA7UzKD4XF+XXexidNPJjTcVwTUWy/rZQB0VGfGxElggTxUpHbrGuE84qzgDyoBKRGF1ts4W74/xPDROBjU2vzBts4fkvOKAhb1g+2zOum61ItORZT3htgyyEhUzBaYJ8qfZqAps7nrqpRI3U5GMVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746755502; c=relaxed/simple;
	bh=T+0Q4j3MxfhBAraC6JNdvOq+YPwmYa27MFXEx5piVGo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U6wVt+J20J8fQu7ah5kSa3mFZzBaeyc2nPswBPDw7K7FfIeFTZ3pKFSyMfJwQwtH1BtupLC6LNd0xQkieufwsA91WFl2dGmt3wJ6l6MbD1+kREsh7inVNCRQk2ru54IkSUN0rXFfqP8zMmjmyfS4xaCLkz5TnCMGHFT/6TlBJbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tzudw4Km; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tzudw4Km"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 056F2C4CEE7;
	Fri,  9 May 2025 01:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746755501;
	bh=T+0Q4j3MxfhBAraC6JNdvOq+YPwmYa27MFXEx5piVGo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Tzudw4KmBThifSMpYc7W7axYTh2IOejdGBQzfSlTyhpDun4fADce3rhT+rbLXgyFH
	 WeVwMJ6rtnbnVI64ZmOiWnMgYl8FC/usqBLKxVnM8zlOELp8TtWy5HBDvGALKiWUf3
	 74bJiMNfP1RR+WiknPHo6y3b/WDp6izOGynUrI84EAS3tbeUz7ysFIVIXgPiP3hosQ
	 sjTWYS1ZuoAkDWnltTX/7Su589UipCycLv37+9wbq1CUu9AeohthlcIfQ+znHiYpiB
	 4f3DdAY9bnVQ1IDAQxnahUu8JVNrccVTkpqQmY+tzH83jvfO0EjBe+2c4vEaqt82PY
	 GCUoZe59P+zCQ==
Date: Thu, 8 May 2025 18:51:38 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Gur Stavi <gur.stavi@huawei.com>
Cc: Fan Gong <gongfan1@huawei.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Bjorn
 Helgaas <helgaas@kernel.org>, luosifu <luosifu@huawei.com>, Xin Guo
 <guoxin09@huawei.com>, Shen Chenyang <shenchenyang1@hisilicon.com>, Zhou
 Shuai <zhoushuai28@huawei.com>, Wu Like <wulike1@huawei.com>, Shi Jing
 <shijing34@huawei.com>, Meny Yossefi <meny.yossefi@huawei.com>, Lee Trager
 <lee@trager.us>, Michael Ellerman <mpe@ellerman.id.au>, Suman Ghosh
 <sumang@marvell.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, Joe
 Damato <jdamato@fastly.com>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH net-next v14 1/1] hinic3: module initialization and
 tx/rx logic
Message-ID: <20250508185138.44849a7a@kernel.org>
In-Reply-To: <35f370e77ceaec7ebff5e160e9daee2f9c7b98f0.1746689795.git.gur.stavi@huawei.com>
References: <cover.1746689795.git.gur.stavi@huawei.com>
	<35f370e77ceaec7ebff5e160e9daee2f9c7b98f0.1746689795.git.gur.stavi@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 8 May 2025 10:56:47 +0300 Gur Stavi wrote:
> +	if (unlikely(__netif_subqueue_stopped(netdev, q_id) &&
> +		     hinic3_wq_free_wqebbs(&txq->sq->wq) >= 1 &&
> +		     test_bit(HINIC3_INTF_UP, &nic_dev->flags))) {
> +		struct netdev_queue *netdev_txq =
> +				netdev_get_tx_queue(netdev, q_id);
> +
> +		__netif_tx_lock(netdev_txq, smp_processor_id());
> +		/* avoid re-waking subqueue with xmit_frame */
> +		if (__netif_subqueue_stopped(netdev, q_id))
> +			netif_wake_subqueue(netdev, q_id);
> +
> +		__netif_tx_unlock(netdev_txq);

Have you tried the macros in net/net_queue.h ?
netif_subqueue_maybe_stop() and netif_subqueue_completed_wake()
They implement tried and tested ordering, the lock shouldn't be
necessary.
