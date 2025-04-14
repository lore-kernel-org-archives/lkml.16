Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D531917E7
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 16:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744648597; cv=none; b=tkTfAXEp58m/Bh8w/UXJDoJpjZU+q1paLZUsFQdVSlew57FkuxtcGqrd53KwgdvPIzRi8nidix/kLlxsUCen0YZCrpj1mTMr8cNFse5e4o17GQDVwY1TKUWEJAfuQflbfDrAJ8dTtYEcc+PbGAikjwFC2Kl9ZyrZb0PLIJUoUps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744648597; c=relaxed/simple;
	bh=T3fcE/CaqYTYSbVexCwGe1/Y/xxPi9jrGopxihY2sIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o7nzbM3R+I3D1ywy75EhMZX1L7sCWGIMejQ0dazPSmtDJpmfx2sUhRNi90VUJaQjug+g1gnJshowTQ44yG6vCzW1cbhVostHo+YR/3WWzcb/sbfw82GCVJCpr+V9kJ0a0LqAge9t3i2ez78uRVN3eX+X6H8H/JHUiQnn4E+HZlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TGF9CBiY; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TGF9CBiY"
Message-ID: <ea1c5102-a327-489f-a29a-769e6f542701@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744648593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TJcn9pefyC7ppQQOoCDcqu5IokXAXpujHtDdI79cDMk=;
	b=TGF9CBiYu9FI72uA7c9eUnyDshDGhq7xZp1FfWDNFsohYTUgARJOa4MHCaxD1CwOYOdCPg
	8Gc6mN4LrVoOvmH09KEiPkdV/0KuEZuoRfGBs+6u8NaTEVn/7LZ4FNpSdvdqhsC+XQBXzB
	xocDsdpddxxyZ/SI5VR9pzASkP+Wlng=
Date: Mon, 14 Apr 2025 17:36:30 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1] ptp: ocp: fix start time alignment in
 ptp_ocp_signal_set
To: Sagi Maimon <maimon.sagi@gmail.com>, jonathan.lemon@gmail.com,
 richardcochran@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20250414143220.121657-1-maimon.sagi@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250414143220.121657-1-maimon.sagi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 14/04/2025 15:32, Sagi Maimon wrote:
> In ptp_ocp_signal_set, the start time for periodic signals is not
> aligned to the next period boundary. The current code rounds up the
> start time and divides by the period but fails to multiply back by
> the period, causing misaligned signal starts. Fix this by multiplying
> the rounded-up value by the period to ensure the start time is the
> closest next period.
> 
> Fixes: 4bd46bb037f8e ("ptp: ocp: Use DIV64_U64_ROUND_UP for rounding.")
> Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
> ---
>   drivers/ptp/ptp_ocp.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
> index 7945c6be1f7c..e5b55b78a6d7 100644
> --- a/drivers/ptp/ptp_ocp.c
> +++ b/drivers/ptp/ptp_ocp.c
> @@ -2067,6 +2067,7 @@ ptp_ocp_signal_set(struct ptp_ocp *bp, int gen, struct ptp_ocp_signal *s)
>   	if (!s->start) {
>   		/* roundup() does not work on 32-bit systems */
>   		s->start = DIV64_U64_ROUND_UP(start_ns, s->period);
> +		s->start = (s->start) * (s->period);

No parenthesis are needed here. it's better to put this line as

s->start *= s->period;

>   		s->start = ktime_add(s->start, s->phase);
>   	}
>   

pw-bot:cr
