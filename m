Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794CE19B3CB
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 17:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749749081; cv=none; b=RuR5mmsbRQ9NGFqvZHL6WJLBhxnWizwopTO/pogknT3d/iaXJ/mUzkVm79i1mGcD9rH6B1fcloHCyH8YjGV6iQwNMrxGYBJxGumijj0MeZzXKgAQGSJAafCUWLRx9Ny3yRsgsbfZYiyXQl3yt2OiT5GjONJkR1r4xnWUcqd6XT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749749081; c=relaxed/simple;
	bh=WRKb87UdKPXbYjK/v8MKnErSrlTQ53xJ1XH/XRBVYFk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OGV8soCOrBRrE70uzUaZXYjWarJmgBpFR3cCMdcl7Nc/ZQ2nWWn9AuEb62ZcK6T6mBz6antTTczdOH5FW4L1JBFTIeqv/Aj5ckzwVDVegpUqIRVjoSp5ZcalMixKRzHBvqkn5eEYUoeu/S98XTlmVxuKlLvxbGS+PVUCxDWQ8nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (3072-bit key) header.d=posteo.net header.i=@posteo.net header.b=mFBRqP94; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (3072-bit key) header.d=posteo.net header.i=@posteo.net header.b="mFBRqP94"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 85AA9240106
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 19:24:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net;
	s=1984.ea087b; t=1749749069;
	bh=WRKb87UdKPXbYjK/v8MKnErSrlTQ53xJ1XH/XRBVYFk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=mFBRqP94M4cuhSLPz0WQ+Q8WZuvfkW2aexNW2Dbqrega8iFBHuEmlZ8r8Hv84iX3O
	 13fOeI4OTURg+xWyQ3CkWH3hlmBQYcmzE1zssHtGj1ORo81x+70YlHcbkVxj42QEhF
	 4fV3YYqC7qO2F24xdOQfAaK0M1zV8mW1k0hooYaAOT1RmzjsSMkWk0eaanI5m0MWrJ
	 72czjYjOYdZTqKkKpBY4N0NvwLrR9tMY6Nc5gVQ9FKVepwgeogOAQCQzrpbRyZN7GE
	 9f63MfTs8z04NVo2wADc7PgF9F9/mcHxgs1rdQbvkkE1r9c0mCb9xEvdSDMXAakbYv
	 T1kaCTwRSQbdNRHG1cG/haSLBG96/RCVbFYOxXRyEuRE8aRkACLIAFm4d3OSsIp3bJ
	 eV7gyBDUV6nJBOgg+1+Q8zX+A/vEK4mblrGccM5rC+hQxiIOO3AWpd2Yf+T/xnvrjc
	 h3wvyqIMge51tKsLzPbsiJMz6g1uW0jlbDt6rPCd8k5xVQR7W6u
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4bJ8XW0Qt4z9rxL;
	Thu, 12 Jun 2025 19:24:26 +0200 (CEST)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: Chris Snook <chris.snook@gmail.com>,  Andrew Lunn
 <andrew+netdev@lunn.ch>,  "David S. Miller" <davem@davemloft.net>,  Eric
 Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo
 Abeni <pabeni@redhat.com>,  Ingo Molnar <mingo@kernel.org>,  Thomas
 Gleixner <tglx@linutronix.de>,  netdev@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] (drivers/ethernet/atheros/atl1) test DMA mapping for
 error code
In-Reply-To: <20250612150542.85239-2-fourier.thomas@gmail.com>
References: <20250612150542.85239-2-fourier.thomas@gmail.com>
Date: Thu, 12 Jun 2025 17:24:02 +0000
Message-ID: <87jz5gyitp.fsf@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Fourier <fourier.thomas@gmail.com> writes:

> According to Shuah Khan[1], all `dma_map()` functions should be tested
> before using the pointer. This patch checks for errors in `dma_map()`
> calls and in case of failure, unmaps the previously dma_mapped regions
> and returns an error.
>
> [1] https://events.static.linuxfound.org/sites/events/files/slides/Shuah_Khan_dma_map_error.pdf
>
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
> ---
>  drivers/net/ethernet/atheros/atlx/atl1.c | 38 ++++++++++++++++++++++--
>  1 file changed, 36 insertions(+), 2 deletions(-)
> [...]

Hi Thomas,

This doesn't seem to build. You can also see it here[1].

[1]: https://patchwork.kernel.org/project/netdevbpf/patch/20250612150542.85239-2-fourier.thomas@gmail.com/
