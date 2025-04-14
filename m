Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FA6263898
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 09:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744623456; cv=none; b=VVJRiu96OeiC34/WROmplU2K5mQfkw2eukz8lV3mooqioZUAgc639R70euvJwhvLHF/zDf7NeT8jUlDYJYZEpfV9U3AYk5JjOdHkFba6lLG/P3MuIxBdOjGAfWSTMMmUWRmcodF4ejsBBJ19mlLv9LMid189Bclffh8za2TbjAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744623456; c=relaxed/simple;
	bh=RfmKRKgsCSXvsFbpEfR7G5fGocEUnY6wL7YBYirtd9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rISDVWdtMKKtN5Chaj+5UieDXmx1GsucGwXjZXprgmDHmykxRGk4xRjbysbvV1qAShiQ4ee5a1zT3ekSgaU8bU73xPvjjfpzmoNb1hgpWCdBr5vGdPXrfxJoZ0yxVbczzcmLe77l3lE7HvTd6JbLOuy1JPORUznDsXFiD4FKUZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=U5wwHp87; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="U5wwHp87"
Message-ID: <b6aea926-ebb6-48fe-a1be-6f428a648eae@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744623449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dq648+S4Hz/D1ux1j2t4fcnqzswyqgLomIbtcNpKqs4=;
	b=U5wwHp87Ecx4muexWBZG4O/daJF6fMDsFzfC9DSSkjunEY4Q8ztQUwKuWtT8w7pioc0OQq
	tQLTRrQoBCwOiS7+kl+xscSWXHHL027H2V6PZBWGyz124wyZ4kHxI/mjZXvvuG5tczS3bw
	uPwZ2Uz/ug3fORviq3lLflAf1TooDoQ=
Date: Mon, 14 Apr 2025 10:37:26 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1] ptp: ocp: fix NULL deref in _signal_summary_show
To: Sagi Maimon <maimon.sagi@gmail.com>, jonathan.lemon@gmail.com,
 richardcochran@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20250414085412.117120-1-maimon.sagi@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250414085412.117120-1-maimon.sagi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 14/04/2025 09:54, Sagi Maimon wrote:
> Sysfs signal show operations can invoke _signal_summary_show before
> signal_out array elements are initialized, causing a NULL pointer
> dereference. Add NULL checks for signal_out elements to prevent kernel
> crashes.
> 
> Fixes: b325af3cfab9 ("ptp: ocp: Add signal generators and update sysfs nodes")
> Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
> ---
>   drivers/ptp/ptp_ocp.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
> index 7945c6be1f7c..4c7893539cec 100644
> --- a/drivers/ptp/ptp_ocp.c
> +++ b/drivers/ptp/ptp_ocp.c
> @@ -3963,6 +3963,9 @@ _signal_summary_show(struct seq_file *s, struct ptp_ocp *bp, int nr)
>   	bool on;
>   	u32 val;
>   
> +	if (!bp->signal_out[nr])
> +		return;
> +
>   	on = signal->running;
>   	sprintf(label, "GEN%d", nr + 1);
>   	seq_printf(s, "%7s: %s, period:%llu duty:%d%% phase:%llu pol:%d",

That's not correct, the dereference of bp->signal_out[nr] happens before
the check. But I just wonder how can that even happen?

I believe the proper fix is to move ptp_ocp_attr_group_add() closer to
the end of ptp_ocp_adva_board_init() like it's done for other boards.

--
pw-bot: cr
