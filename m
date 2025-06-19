Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBA728E7;
	Thu, 19 Jun 2025 04:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750307564; cv=none; b=CZPp9yRxMXhuaLxn+3u9nTIisslT29hafHiQHbn/SwUIP79NYGuwAyXWR0wHUlTE0XMKiqa1ZoFxF0dK0RLIwiF3sdyDptlC0C48zDAadA5hHVsHz9pyLcQhOmZJwH9YF3u3BRLq3U9tjuf8OJpB1c5J+wvBIn7tYhe+V2F3/fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750307564; c=relaxed/simple;
	bh=qbe+/2v3JUtbJqh84tEiBcbNdK8uv5A25Ck4Z74YWrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lBRmMwe/d7REkbP+vIxtpAdXUA/5uhPwmzjXMMNiTiZqPY5Rp5RSNOKSYrmpMFasqNh+69fIkYL5WBxCu9i9FozdUGm8lm3AA/loyeMBf/NVclKhLYRkECi5spSiwCvuuoUCopx+QJn5rK+AKe95bkdsw/p4T1IzfBulnQ5V9vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rj6/2Z8q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rj6/2Z8q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80BE0C4CEED;
	Thu, 19 Jun 2025 04:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750307563;
	bh=qbe+/2v3JUtbJqh84tEiBcbNdK8uv5A25Ck4Z74YWrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rj6/2Z8q60Qh8ZwuOKqZJ1ogmkwtRiLsAtHqCbYFzV1pVEADgYZvtNqjGZrHajrlJ
	 FwyM32K2Fec08yzJeEgxGh+FgHd8M3oB3RCdAFU4fZHPvSACORYZrGOCUwSYP2EDM2
	 WIDukVdv2WW1nMf5M8bvVtmwLQfMzTnJKmk040Oc=
Date: Thu, 19 Jun 2025 06:32:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: RD Babiera <rdbabiera@google.com>
Cc: heikki.krogerus@linux.intel.com, badhri@google.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] usb: typec: altmodes/displayport: add irq_hpd to sysfs
Message-ID: <2025061924-eats-john-8554@gregkh>
References: <20250619000343.3299526-2-rdbabiera@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619000343.3299526-2-rdbabiera@google.com>

On Thu, Jun 19, 2025 at 12:03:40AM +0000, RD Babiera wrote:
> @@ -170,6 +178,9 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
>  				dp->hpd = hpd;
>  				dp->pending_hpd = true;
>  			}
> +			if (dp->hpd && dp->pending_hpd && irq_hpd) {
> +				dp->pending_irq_hpd = true;
> +			}

Didn't checkpatch complain about not needing the {} here?

thanks,

greg k-h
