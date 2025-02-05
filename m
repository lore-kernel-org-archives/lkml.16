Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73D514B959
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 14:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738765393; cv=none; b=nRqWx03CHupCDNA0LLyCJkCOiuhi/raA8AY7Wy5aKh/RABf88dV/+1EXyfKflNL0pSHxu1sNOC6nH/wzXulyMBcDu+7vLwQoZETXkQLKKstHkWPar0lUlt00MZqqPRqjNKVGe31Z+5k0yPgiKh/qyTXmrCzQsUtEFxN8c1Gyzno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738765393; c=relaxed/simple;
	bh=zn1OZ0/xC5hWSYyFfGAzueY2AGtYBGt8AuLFCHG10t8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jfYto8GcgzxZwCjwM20VQ28YNBoe/dVCD9sVSGO51z+7cHjBeP8lUfCQumWF6u1LdIjt34ztoVGJq94F3YzoLk1AumDt9+UkQNxRO5isC2GR1IqCgHY7FXbtB2QTXMSrT5aDDpzIKxsaBuENcg0cNPdR9RndgjKrKUSbcf5dwCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eg4nZJbO; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eg4nZJbO"
Message-ID: <f728a006-e588-4eab-b667-b1ff7dfd66c5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738765376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zn1OZ0/xC5hWSYyFfGAzueY2AGtYBGt8AuLFCHG10t8=;
	b=eg4nZJbO0xpeG0pLWlbhMOe6AYAiwdcu4kYoQMdLWO+eZdJ3lFgi+Jpg3kpYb/i14hvLjJ
	/+NqrmVuZeacszL66SFSgoFSCyY+PoN4hFtdoc0HT7vGRqjXutkQ+JV8tyyG3jBtPypA32
	7MoUOedOYpMYKM+fZ/PdUpF9Kz9lHl0=
Date: Wed, 5 Feb 2025 22:22:00 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] net: stmmac: Allow zero for [tr]x_fifo_size
To: Jakub Kicinski <kuba@kernel.org>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Steven Price <steven.price@arm.com>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, Petr Tesarik <petr@tesarici.cz>,
 Serge Semin <fancer.lancer@gmail.com>, Xi Ruoyao <xry111@xry111.site>
References: <20250203093419.25804-1-steven.price@arm.com>
 <Z6CckJtOo-vMrGWy@shell.armlinux.org.uk>
 <811ea27c-c1c3-454a-b3d9-fa4cd6d57e44@arm.com>
 <Z6Clkh44QgdNJu_O@shell.armlinux.org.uk> <20250203142342.145af901@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250203142342.145af901@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2/4/25 06:23, Jakub Kicinski 写道:
> On Mon, 3 Feb 2025 11:16:34 +0000 Russell King (Oracle) wrote:
>>> I've no opinion whether the original series "had value" - I'm just
>>> trying to fix the breakage that entailed. My first attempt at a patch
>>> was indeed a (partial) revert, but Andrew was keen to find a better
>>> solution[1].
>> There are two ways to fix the breakage - either revert the original
>> patches (which if they have little value now would be the sensible
>> approach IMHO)
> +1, I also vote revert FWIW

+1, same here.


For a driver that runs on so much hardware, we need to act

cautiously. A crucial prerequisite is that code changes must

never cause some hardware to malfunction. I was too simplistic

in my thinking when reviewing this before, and I sincerely

apologize for that.


Steven, thank you for your tests, Let's revert it.


Thanks,

Yanteng

