Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D010297A7F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 18:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745865009; cv=none; b=qzhsDDeU7Q6CwKTWfMpn8ywPx6J9cc10h2UbTV5TImVgcUkJWOkzxehI1XlJ0q/ZNzV5BoYzoyKm7wNm2VF29gaLvc9CZcKPi5LY3biHE+O8p1oddWZcBvR6FtMEJUzBTx9kd8ATHo6qgbVjCVh7G6kteKu6rlruy6RaIFOohSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745865009; c=relaxed/simple;
	bh=mdH0QP74IJP/zgx33dXDmyb7ub57lDFu5YqhOatpTsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uMEW2z2OhUPhDIoa1/aJ/ftfBLAxdbosZPC2J4lmTGUKmG9enShmSl0lWkPBPYX5I2Zlz8YzWNt6PcJF/ZqgQIUoPYqvRzq7umDqCsP/Q6GoZyPr/NTTtPh4ZRZ0lkBhgAYDCSKSAo3q/gyV7FJvTNYnSZmO0WhZ72kJP1c7R1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q4+ctTFj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q4+ctTFj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DFB9C4CEE4;
	Mon, 28 Apr 2025 18:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745865008;
	bh=mdH0QP74IJP/zgx33dXDmyb7ub57lDFu5YqhOatpTsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q4+ctTFjaPT9ncrZnA0UhKLy9ntIMWv39LmF+pADpIgqTsmBMZsBmDV8aIrM3zrn1
	 odAw+xf3CoCORs0nIn2ITqLC7LViyofr1SvMPJw1RYSrR67bstA4m+Y1gY8Vgv/YEL
	 Tzmnr0quDdhZgO7tgrb+P8sDdONaC/SmzgSXBrWYUI9Y93RFHX6YgKKq7MIVsc4pFQ
	 9Easj8A7/jlNtugZiQQ3/CL67sXLHXKpGr54GGb8SOgdA05/FHIfDb6wlpEVGXRWhP
	 auGWLGuAqOkEacvmaJqw5QDKimLEXL+zHUlN7f2eufXnb5vap7zqHsIJlB0orhrCDZ
	 jXLFW/yoS7ijw==
Date: Mon, 28 Apr 2025 08:30:07 -1000
From: Tejun Heo <tj@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>,
	Philipp Stanner <phasta@mailbox.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] workqueue: flush all pending jobs in destroy_workqueue()
Message-ID: <aA_JLyCkdH9koy55@slm.duckdns.org>
References: <20250423-destroy-workqueue-flush-v1-1-3d74820780a5@google.com>
 <aAqXw3t9UVU8pF8_@slm.duckdns.org>
 <aAtXApA8ggJa6sQg@google.com>
 <aAvhxfGvndybqkJm@slm.duckdns.org>
 <aA9LPkxMlXT_Dqg3@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aA9LPkxMlXT_Dqg3@google.com>

Hello, Alice.

On Mon, Apr 28, 2025 at 09:32:46AM +0000, Alice Ryhl wrote:
> Isn't that just going to be equal to WORK_CPU_UNBOUND most of the time?
> 
> Though I guess we could use the values NR_CPUS .. 2*NR_CPUS-1 to
> remember which list is used when it is unbound.

I think there are multiple ways to go about it. Maybe we can
wq_select_unbound_cpu() earlier. Maybe we can encode the unboundedness in a
flag bit, or we can just add another 32bit field to delayed_work. Given the
layout, I don't think adding another 32bit field would change the actual
size of delayed_work on 64bit machines anyway.

Thanks.

-- 
tejun
