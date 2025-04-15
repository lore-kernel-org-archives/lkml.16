Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB8E1AF0D0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744703479; cv=none; b=Og4p+sSOaoyiOlSITy+WLZtmkfQ6Cyx5guBQOKQbSbznXedInCcBQVlm+5ixqt7zT4fax71zI5qFXRpgu3esMB4MD2/Yg9k2Rq5J3ePbl41+1qUQFkkPYhM9G1b+iAc+/23uldPVPCif4BADkSmcBNidijQCO+WT5Fd6qEh2Rnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744703479; c=relaxed/simple;
	bh=V7WN/v5jfqovO3L5tNovFCaLqiFkyYSdDlSkoFmtnWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yj71849bUB3YRtTB9wr0igpMqzR/d8f6SLxYACy1jVEStbPm2Tp9nWN+hfRjTm6iAs/VyOpnE1EwyMvwIuPkRyXFy+VRV6ZBoYBym1QnqDJEKuUXWH2AK+syPM5I4LsObjh99ZWB8Cnfl4W7VtN3staBIO/0uZfwbediAQwN1Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iqaP9mDX; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iqaP9mDX"
Message-ID: <68769daa-fbd5-4dbd-87a6-5b74bdc20094@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744703475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V81s/f0QCbsd/984Wr1FAdBVpqvVsMp5C6LqkC0blZE=;
	b=iqaP9mDXFsvR47REF0cUT3/3u+Cp4hPEqwSmT3AqLac9n5PJHiGI+zXxY+OlKlZFl9ko4f
	T8GKE4g2TZqPMEtx6N6fJGzVhNzYCzL9PLPyWfJPUPN0rvJGxCaSC4cuNdl8MPA+8cYpRM
	joDROi6/DeaKKvPU4F80gmdmyZFDa7Y=
Date: Tue, 15 Apr 2025 08:51:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] ptp: ocp: fix start time alignment in
 ptp_ocp_signal_set
To: Sagi Maimon <maimon.sagi@gmail.com>, jonathan.lemon@gmail.com,
 richardcochran@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20250415053131.129413-1-maimon.sagi@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250415053131.129413-1-maimon.sagi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 15/04/2025 06:31, Sagi Maimon wrote:
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
>   Addressed comments from Vadim Fedorenko:
>   - https://www.spinics.net/lists/netdev/msg1083572.html
>   Changes since version 1:
>   - Simplified multiplication in expression by removing unnecessary parentheses
>     and using compound assignment operator, as suggested by the maintainer.
> ---
>   drivers/ptp/ptp_ocp.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
> index 7945c6be1f7c..faf6e027f89a 100644
> --- a/drivers/ptp/ptp_ocp.c
> +++ b/drivers/ptp/ptp_ocp.c
> @@ -2067,6 +2067,7 @@ ptp_ocp_signal_set(struct ptp_ocp *bp, int gen, struct ptp_ocp_signal *s)
>   	if (!s->start) {
>   		/* roundup() does not work on 32-bit systems */
>   		s->start = DIV64_U64_ROUND_UP(start_ns, s->period);
> +		s->start *= s->period;
>   		s->start = ktime_add(s->start, s->phase);
>   	}
>   
Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
