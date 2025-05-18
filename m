Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBC64B1E5E
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 21:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747604767; cv=none; b=gsG+kmeQ4eMi9nyMMhD5tRKvexvZROd602Fuu1cRX7JH/8aYTDTbFVaRk1VaNVCR6yTaowYapm5IXNeFlIz0jG627SyC87ISdx4eDoYki9e2eJNxggl3w4H8oUdWNpDW0WJ8zk33g1JQl75rT+fxEQvkoYiU8vdNa3rYDwh44Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747604767; c=relaxed/simple;
	bh=NMeebud6ZLf9VVhQvT+H/0SiEQYEa50hi3Z23TTE+tE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ks7MB45R7iQNJgUkK0M1wUhRnsOVCnYvu7MJWR4rhyopj/HpuIEPwMtkLUFFC2USFjIzu7bMRpu6lGLhbr2tHh6btQGbJqXJfVZS4XWLntZ7bmKhbZqR7N/W4FvYeZ0v3gHzppaZXvuplTkJe5kVZ0LzmjNkex8CBDAtErLBXZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HzhtA6h2; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HzhtA6h2"
Message-ID: <50be88c9-2cb3-421d-a2bf-4ed9c7d58c58@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747604752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uZSxqqn4mhJXzl6y2v3TyeXKWItFATn+OwMdyLVBJuw=;
	b=HzhtA6h2GD1k/hDjl0HKaE/SS9XYgeVKbQAG6a5lf2syUxEdGy3G81A6J03UShreMltCtc
	xKbjbuljjEHrXC1zDdRufdvfdaBYm5/C2/7qj91k/w+Za7NxxvmnVFd2ybpVi0vk8oVdyX
	29F/WZcAKk7HeNB1tbTOdFURfBC96a4=
Date: Sun, 18 May 2025 22:45:49 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 6/8] gve: Add rx hardware timestamp expansion
Content-Language: en-US
To: Harshitha Ramamurthy <hramamurthy@google.com>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, jeroendb@google.com, andrew+netdev@lunn.ch,
 willemb@google.com, ziweixiao@google.com, pkaligineedi@google.com,
 yyd@google.com, joshwash@google.com, shailend@google.com, linux@treblig.org,
 thostet@google.com, jfraker@google.com, richardcochran@gmail.com,
 jdamato@fastly.com, horms@kernel.org, linux-kernel@vger.kernel.org
References: <20250517001110.183077-1-hramamurthy@google.com>
 <20250517001110.183077-7-hramamurthy@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250517001110.183077-7-hramamurthy@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 17.05.2025 01:11, Harshitha Ramamurthy wrote:
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
>   Changes in v2:
>   - Add the missing READ_ONCE (Joe Damato)
> ---
>   drivers/net/ethernet/google/gve/gve_rx_dqo.c | 23 ++++++++++++++++++++
>   1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/net/ethernet/google/gve/gve_rx_dqo.c b/drivers/net/ethernet/google/gve/gve_rx_dqo.c
> index dcb0545baa50..c03c3741e0d4 100644
> --- a/drivers/net/ethernet/google/gve/gve_rx_dqo.c
> +++ b/drivers/net/ethernet/google/gve/gve_rx_dqo.c
> @@ -437,6 +437,29 @@ static void gve_rx_skb_hash(struct sk_buff *skb,
>   	skb_set_hash(skb, le32_to_cpu(compl_desc->hash), hash_type);
>   }
>   
> +/* Expand the hardware timestamp to the full 64 bits of width, and add it to the
> + * skb.
> + *
> + * This algorithm works by using the passed hardware timestamp to generate a
> + * diff relative to the last read of the nic clock. This diff can be positive or
> + * negative, as it is possible that we have read the clock more recently than
> + * the hardware has received this packet. To detect this, we use the high bit of
> + * the diff, and assume that the read is more recent if the high bit is set. In
> + * this case we invert the process.
> + *
> + * Note that this means if the time delta between packet reception and the last
> + * clock read is greater than ~2 seconds, this will provide invalid results.
> + */
> +static void __maybe_unused gve_rx_skb_hwtstamp(struct gve_rx_ring *rx, u32 hwts)
> +{
> +	s64 last_read = READ_ONCE(rx->gve->last_sync_nic_counter);

I believe last_read should be u64 as last_sync_nic_counter is u64 and
ns_to_ktime expects u64.

> +	struct sk_buff *skb = rx->ctx.skb_head;
> +	u32 low = (u32)last_read;
> +	s32 diff = hwts - low;
> +
> +	skb_hwtstamps(skb)->hwtstamp = ns_to_ktime(last_read + diff);
> +}
> +
>   static void gve_rx_free_skb(struct napi_struct *napi, struct gve_rx_ring *rx)
>   {
>   	if (!rx->ctx.skb_head)

