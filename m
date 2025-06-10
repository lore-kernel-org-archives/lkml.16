Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7226828BA8E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548962; cv=none; b=dxrzHGK13DfQvcBocZh++ittXDDLCqAXRhvHr/h3iv0qlREsDCGxJmmi7+Njz02Slkp3wRCcjM7R1am3B9GzPQeLFJFETKJqU1weeCX+49Ncc4Mc7vpukSkX5j/0fo91jOHHoz42WsxvweM0xClVqb89NXDZRFWI5NPq/sCZApk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548962; c=relaxed/simple;
	bh=fR3aKBzIuq4QNp761ispeI17CxzGUpWNrgME/vThguM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kCUyZsQj1bBB3goTB6P1RUFWdp7UdA7iFc7vjtefwDk3RKkFHWwzToCMpkOSHqkP6M3wkK0k0aqexYmST+gd2CenO6BzFLx8B3AUY54O4u68fED/QSiICdY7aqZu0nPK5T/sOeNwRDRmgLlwmRVH7MqsnEEuWpEorxze5jY4gOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SO2QcGLE; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SO2QcGLE"
Message-ID: <5857c5e4-ebdd-49ee-b4c5-05df1a27e6ce@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749548956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QrRxyHc4cz8xge2b31AbQ6li0J4u7B2b8AA+LN1T4a0=;
	b=SO2QcGLEfvJsV6+J68lGo5tuI0HARHWYtXgkGT5oVmTW+e+NfQOFYD6xltivrzfT2Vx38M
	ZNoKPk8lkqnHUJAwqVfyUTDxzwP2DmWL4CKfViOAHMkhuTccsa9Nyo6PEKf8MnwGn9pxPS
	PdE+ljIvssYyGHvVoB5i+qLwG5+omRA=
Date: Tue, 10 Jun 2025 10:49:06 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next v4 6/8] gve: Add rx hardware timestamp expansion
To: Harshitha Ramamurthy <hramamurthy@google.com>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, jeroendb@google.com, andrew+netdev@lunn.ch,
 willemb@google.com, ziweixiao@google.com, pkaligineedi@google.com,
 yyd@google.com, joshwash@google.com, shailend@google.com, linux@treblig.org,
 thostet@google.com, jfraker@google.com, richardcochran@gmail.com,
 jdamato@fastly.com, horms@kernel.org, linux-kernel@vger.kernel.org
References: <20250609184029.2634345-1-hramamurthy@google.com>
 <20250609184029.2634345-7-hramamurthy@google.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250609184029.2634345-7-hramamurthy@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 09/06/2025 19:40, Harshitha Ramamurthy wrote:
> From: John Fraker <jfraker@google.com>
> 
> Allow the rx path to recover the high 32 bits of the full 64 bit rx
> timestamp.
> 
> Use the low 32 bits of the last synced nic time and the 32 bits of the
> timestamp provided in the rx descriptor to generate a difference, which
> is then applied to the last synced nic time to reconstruct the complete
> 64-bit timestamp.
> 
> This scheme remains accurate as long as no more than ~2 seconds have
> passed between the last read of the nic clock and the timestamping
> application of the received packet.
> 
> Signed-off-by: John Fraker <jfraker@google.com>
> Signed-off-by: Ziwei Xiao <ziweixiao@google.com>
> Reviewed-by: Willem de Bruijn <willemb@google.com>
> Signed-off-by: Harshitha Ramamurthy <hramamurthy@google.com>
> ---
>   Changes in v3:
>   - Change the last_read to be u64 (Vadim Fedorenko)
> 
>   Changes in v2:
>   - Add the missing READ_ONCE (Joe Damato)
> ---

Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
