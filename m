Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F00A3218EA7
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 17:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749577763; cv=none; b=QCZlwdbujF1lLTNmInXZ35CdAWCqGTUW4KC7loCOLIXWslQWs10u8/HKjMcM/4q1xjVzCIgWKOM1rXVx2nYQ50/aBEgfH2eLsiEAM2njUUeHxZI02gL8jOC+J61pDjTJAQP4Oi0O8MUAewyH8QaG9jh9ggRp/M37dlllMEb7nnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749577763; c=relaxed/simple;
	bh=VqWY3CHcf3Vt/NL3ZhL8kLp8b1SOBJtyQGcDDaw9ENY=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:References:From:To:
	 In-Reply-To:Content-Type; b=hTqtox/rU9flZxiAbvXvjdu7HpEU5t2Btwh19CJCF0fakDLbpn7vHuWQoB3yXK4kb2/sVd81RJnaw2NrT5USTmrI9+W8B79RL6B/fAZX7NfKdFviccisqVKAJLLcQB0+6E4kSid9AuziuSk5aKFvp/hVuh7T5j2+adtE6OU5+qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=Amvd2k9j; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="Amvd2k9j"
Received: from [100.65.129.218] (unknown [20.236.11.29])
	by linux.microsoft.com (Postfix) with ESMTPSA id 5AE8A2113091;
	Tue, 10 Jun 2025 10:49:21 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5AE8A2113091
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1749577761;
	bh=FTHn6/xfwys+lrx2PwIo9Jrp/Uvzq79Fn9+PtwLxE5E=;
	h=Date:Cc:Subject:References:From:To:In-Reply-To:From;
	b=Amvd2k9jBCeg177sVrWdLDHxUbqaIxECM99fJ3cFBtsRrB+mXiEPV2z+rcLL5qstH
	 D2Vq80ftLF6ACvcjf1T/OeSz4JQqvj+6bKR1OdHKXgCdRWR9RUQPqjHi6jT/pyWy6D
	 MWsZfypaA+DnXGTXKHWlNUdRZ5LvZbCJGChiCamg=
Message-ID: <00e40c21-4797-41df-b082-318f474f76ae@linux.microsoft.com>
Date: Tue, 10 Jun 2025 10:49:21 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: eahariha@linux.microsoft.com, Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>, "cocci@inria.fr" <cocci@inria.fr>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] coccinelle: misc: secs_to_jiffies: Implement context and
 report modes
References: <20250610174521.12294-1-eahariha@linux.microsoft.com>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
To: Andrew Morton <akpm@linux-foundation.org>,
 Ricardo Ribalda <ribalda@chromium.org>, Jakub Kicinski <kuba@kernel.org>
In-Reply-To: <20250610174521.12294-1-eahariha@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/10/2025 10:45 AM, Easwar Hariharan wrote:
> As requested by Ricardo and Jakub, implement report and context  modes
> for the secs_to_jiffies Coccinelle script. While here, add the option to
> look for opportunities to use secs_to_jiffies() in headers.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Ricardo Ribalda <ribalda@chromium.org>
> Closes: https://lore.kernel.org/all/20250129-secs_to_jiffles-v1-1-35a5e16b9f03@chromium.org/
> Closes: https://lore.kernel.org/all/20250221162107.409ae333@kernel.org/
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> ---
>  scripts/coccinelle/misc/secs_to_jiffies.cocci | 49 +++++++++++++++++--
>  1 file changed, 44 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/coccinelle/misc/secs_to_jiffies.cocci b/scripts/coccinelle/misc/secs_to_jiffies.cocci
> index 416f348174ca..f3241ce75a7b 100644
> --- a/scripts/coccinelle/misc/secs_to_jiffies.cocci
> +++ b/scripts/coccinelle/misc/secs_to_jiffies.cocci
> @@ -7,26 +7,65 @@
>  // Confidence: High
>  // Copyright: (C) 2024 Easwar Hariharan, Microsoft
>  // Keywords: secs, seconds, jiffies
> -//
> +// Options: --include-headers
>  
>  virtual patch
> +virtual report
> +virtual context
>  
> -@depends on patch@ constant C; @@
> +@pconst depends on patch@ constant C; @@
>  
>  - msecs_to_jiffies(C * 1000)
>  + secs_to_jiffies(C)
>  
> -@depends on patch@ constant C; @@
> +@pconstms depends on patch@ constant C; @@
>  
>  - msecs_to_jiffies(C * MSEC_PER_SEC)
>  + secs_to_jiffies(C)
>  
> -@depends on patch@ expression E; @@
> +@pexpr depends on patch@ expression E; @@
>  
>  - msecs_to_jiffies(E * 1000)
>  + secs_to_jiffies(E)
>  
> -@depends on patch@ expression E; @@
> +@pexprms depends on patch@ expression E; @@
>  
>  - msecs_to_jiffies(E * MSEC_PER_SEC)
>  + secs_to_jiffies(E)
> +
> +@r depends on report && !patch@
> +constant C;
> +expression E;
> +position p;
> +@@
> +
> +(
> +  msecs_to_jiffies(C@p * 1000)
> +|
> +  msecs_to_jiffies(C@p * MSEC_PER_SEC)
> +|
> +  msecs_to_jiffies(E@p * 1000)
> +|
> +  msecs_to_jiffies(E@p * MSEC_PER_SEC)
> +)
> +
> +@c depends on context && !patch@
> +constant C;
> +expression E;
> +@@
> +
> +(
> +* msecs_to_jiffies(C * 1000)
> +|
> +* msecs_to_jiffies(C * MSEC_PER_SEC)
> +|
> +* msecs_to_jiffies(E * 1000)
> +|
> +* msecs_to_jiffies(E * MSEC_PER_SEC)
> +)
> +
> +@script:python depends on report@
> +p << r.p;
> +@@
> +
> +coccilib.report.print_report(p[0], "WARNING opportunity for secs_to_jiffies()")

Sorry, I was testing sending this to myself before sending to the list, I've added the mailing lists now.

Thanks,
Easwar (he/him)

