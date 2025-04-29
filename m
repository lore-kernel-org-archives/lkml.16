Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BD1215764;
	Tue, 29 Apr 2025 23:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745969651; cv=none; b=QJKjtUtLdgk0TEVzbH7J0Ie8Q8DIvdpCcEbgCUhxEAT2Rbp5Zf0hgvQ/Y4zF5FiQlmfYcGBOcbqvHk3/rZu7fxVj6pGEmWi2/m3CCqYbpvXxlYsDVLkqR87KDly1uDPLvYgAC1BnfKzj/+uFM/aLEZJGcWyCZD5XykCDU1kLtUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745969651; c=relaxed/simple;
	bh=PI1bWM9PSBAB+xNlqE8e1e3TgpJcG5zMWUncSkFgR3w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fh9KBTiUzSY2XzBPUBgrW2wULiFoTcqWdtnTLQRrTN736JJcNcy33vB3wWafOH7Tu/EChffZ4kyeAZcnfvNdJrsi+1qoYZlT3O9Cm1QT22RDTPEKjzhHS8sBy2kYHW8W2gW0BLq+R89C6/hYnA2DJFHR4JBfeeY7mOLrrUbZ0EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HXXHsUoC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HXXHsUoC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68121C4CEE3;
	Tue, 29 Apr 2025 23:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745969650;
	bh=PI1bWM9PSBAB+xNlqE8e1e3TgpJcG5zMWUncSkFgR3w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HXXHsUoCX6PRG9Y7LdiUBHlexrPbMvWpWtg4XGDUDxbCflpmtz0GrH55jLmnbc+Vs
	 /yvlQtGzeZ3vk7R/uyVy3tP0mjuZ+TzWLeHhtxuf2xlqnCiASJt8HJUSwYVlRsgyu4
	 ytuDoVvbab99pQE2V42cH0ryBs3l+djmCg4zP4yJZZcR0uLxA4H073+MX7nCP4CUB6
	 8Icv8GJGvFQS4zh95dt3gKkMl5+ZocDmvizhOwR1K3mTDX0Qg1Q97CG/NEavSFv/an
	 PXYXEPmFPJ7Itb6xZp3Bxqoi/VCdiGXwgBTTt6+3k+ngKhJbiz3JxPNohic81XL5mq
	 Nyq4evUdG1iZg==
Date: Tue, 29 Apr 2025 16:34:09 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH net-next v3 3/4] net: selftests: add checksum mode
 support and SW checksum handling
Message-ID: <20250429163409.2b7e8c65@kernel.org>
In-Reply-To: <20250429074103.2991006-4-o.rempel@pengutronix.de>
References: <20250429074103.2991006-1-o.rempel@pengutronix.de>
	<20250429074103.2991006-4-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 29 Apr 2025 09:41:02 +0200 Oleksij Rempel wrote:
> +/**
> + * net_test_setup_sw_csum - Compute and apply software checksum
> + *                          (CHECKSUM_COMPLETE)
> + * @skb: Socket buffer with transport header set
> + * @iph: Pointer to IPv4 header inside skb
> + *
> + * This function computes and fills the transport layer checksum (TCP or UDP),
> + * and sets skb->ip_summed = CHECKSUM_COMPLETE.
> + *
> + * Returns 0 on success, or negative error code on failure.

Has to be Return: or Returns: for kdoc to be happy
-- 
pw-bot: cr
