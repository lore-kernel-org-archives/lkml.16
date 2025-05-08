Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945F922DF80
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746714539; cv=none; b=u4Gm8AdFrEh7Lptx+dsIWKDd7gV1+SjOe4gEzaVH1z6wJkR14v16XZq6YJYtvPksX47l8ksbO6Q1dNnMT2DUCea/ZXqxqv1Ytidqyy3jhCNhFboYGFLLxjxC9AHnI7tL/+LP5VXhkZeRp82Q0zob06wnd8VaYJ8z32MrLx7s3Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746714539; c=relaxed/simple;
	bh=McQu651ki67ccZAvRQk4ec5g9Jl4X5R1BFgXVoCNQgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kq2+H6gfq1wrke5vBIZVF+uWB6z40OVOT9Kyda1pjb+XB3oj6lV/QO7uJM5kK3obU1TPvMKXS+sk9z9YZuX/oxwg6gc6pSd+K6LtQHhaenm6gWF6dc191af2057Y0F3RvgxWU1p0tdSu1AcIz0YmHrJDkku25P23bv5qXCv17s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mLzONLoN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mLzONLoN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5A21C4CEE7;
	Thu,  8 May 2025 14:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746714539;
	bh=McQu651ki67ccZAvRQk4ec5g9Jl4X5R1BFgXVoCNQgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mLzONLoNy7ZIbFFlsOVCJiQfAGbAWcMpnxjVLFwQurmfaDRn1abY4Tg0wC5VkctlI
	 XbZiJiYJUEPVuo6VB9bVclsCWWX9vX2NJGlZoynkUObeDCvnn23gky8KbWiNfZa9vS
	 0aPFpd6kEoVGnlSu6H7cMxeehCbOKL1YsV1E6iMwvISlxJXv1dGzlu1Gd6TjlGhJk8
	 7N+RUDrDWcppH53OTIb+XON/P7AW/19tok4XkG9MltiD8aWb9ZVbG+Wri2wi0WIOEb
	 4NiFWbc0GsuhoTTG42qykhT8fkbWAlI1yPpFh+uA7OEujOfPGnz0TDoJJAdgW0PRwO
	 rCQH4VgYuO3Vw==
Date: Thu, 8 May 2025 08:28:56 -0600
From: Keith Busch <kbusch@kernel.org>
To: Daniel Wagner <wagi@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, Hannes Reinecke <hare@kernel.org>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme-pci: lock per namespace in nvme_poll_irqdisable
Message-ID: <aBy_qLi3OvYk6HAL@kbusch-mbp>
References: <20250508-nvme-pci-polling-v1-1-29ae900e793d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508-nvme-pci-polling-v1-1-29ae900e793d@kernel.org>

On Thu, May 08, 2025 at 01:55:55PM +0200, Daniel Wagner wrote:
> +	spin_lock(&nvmeq->cq_poll_lock);
>  	disable_irq(pci_irq_vector(pdev, nvmeq->cq_vector));
>  	nvme_poll_cq(nvmeq, NULL);
>  	enable_irq(pci_irq_vector(pdev, nvmeq->cq_vector));
> +	spin_unlock(&nvmeq->cq_poll_lock);
>  }

I noticed disable_irq() contains a "might_sleep()", so the order needs
to have spin_lock() happen after disable_irq().
