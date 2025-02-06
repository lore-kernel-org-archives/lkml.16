Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BB523959B
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 19:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738869791; cv=none; b=EcquqMrzkTXtV03GRZxkg3a4B/5pLuSL3AozyRg645UqD5sLApHSWTtj0fFTVxybG9eBfpnHVdKnHVcQN7uSf94oI2tMnadXof4FdLk7yuwI5YPqlzXs6hesRL5JPCa3sS2brA1BMbYG6A+unhROLSjr4wBEHCQiuoKLg4ED2Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738869791; c=relaxed/simple;
	bh=UVj4pVU1RhNhh1PShyNQhh8DN+E0P05HfoG34kJxJvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KAXcEkUq2mh87S2gB5cyOcqtUdwjL9+hSV1Os9Ha0i2sMAf+o+0AzervHQfGFmyLl/xelwP4oIqc7/qziPMRLcoC6cRWfMVueNhk9U4BWjBzTxA5L9jJstnyNWDtDPyLBUqJrx5sov4V8FCKOPzNoIjoq4QG9eM1GYVeaPJGHDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aMhQJ5uT; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aMhQJ5uT"
Message-ID: <25e047ee-cc48-42a0-9ee2-88753114f4a4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738869781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k58zozcxpDbqArBqK1f/mzODhF7FvtZ36zmyRPTeT/Y=;
	b=aMhQJ5uTKa6pKRQcvnIZm88D+ckRIaK1L3RHaUI15EgU/He2eKfvPKEgViPHeYNAcaiCbw
	Q2uDZojiMnJGF02OJ9PjYaGgoAyGMUjnGoLmj/ITPTrDw4MV2iDtsQSQ5U4TbNUfdTeRCX
	NI9eAZewjqXFTK2QaNL05GioegZIIDY=
Date: Thu, 6 Feb 2025 14:22:56 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH RFC 24/33] drm: zynqmp_dp: Fix a deadlock in
 zynqmp_dp_ignore_hpd_set()
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Bart Van Assche <bvanassche@acm.org>
Cc: Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marco Elver <elver@google.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>,
 Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>
References: <20250206175114.1974171-1-bvanassche@acm.org>
 <20250206175114.1974171-25-bvanassche@acm.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250206175114.1974171-25-bvanassche@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2/6/25 12:51, Bart Van Assche wrote:
> Instead of attempting the same mutex twice, lock and unlock it.
> 
> This bug has been detected by the Clang thread-safety analyzer.
> 
> Cc: Sean Anderson <sean.anderson@linux.dev>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Fixes: 28edaacb821c ("drm: zynqmp_dp: Add debugfs interface for compliance testing")
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 979f6d3239ba..189a08cdc73c 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -2295,7 +2295,7 @@ static int zynqmp_dp_ignore_hpd_set(void *data, u64 val)
>  
>  	mutex_lock(&dp->lock);
>  	dp->ignore_hpd = val;
> -	mutex_lock(&dp->lock);
> +	mutex_unlock(&dp->lock);
>  	return 0;
>  }
>  

Reviewed-by: Sean Anderson <sean.anderson@seco.com>

Since this patch is marked RFC will it be applied soon? I am about to
send a patch which conflicts with this one. I would like to just add
this patch to my series.

--Sean
