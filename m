Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1023C2DECCE
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749682067; cv=none; b=nEXBU5300Enf9Gke9CXrjJeim+w9A1FJ3ZYNdtPrcIpy8AZnAnUsFHve9NzrOZNP7JSjnW3W7fJI+xOhq+UAEnQjoJm7sXApumUlZUl2I89hxqlcz808eWNtf+60qLAvYmJuYS+L+zuOLTbxbEItw4bb/TMnpv1VZWQHo0k7yjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749682067; c=relaxed/simple;
	bh=i3uXg88GrmDL02Ipc0Qdy2wwCTXE7sOzhUrq+EghysA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rM0gSJamw64cqo9ztPz2OR7PPYpGfPC9nrqE3nKuOpCI+rvG9pZn9wCKsAG4MulRl7rTnZw0LI9iILfQl4de/4QlI/1r8CaG/ziVolXE5+JUgzLhL4m11rFVRd8E9/7xugkEZKweXFiKb/ljonsggCnU/t0hNi30+NIUgXDEJzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ji1VIkVs; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ji1VIkVs"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b2fd091f826so256360a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749682064; x=1750286864; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vtvuCkqBFYEZRyjG1H+yUqFCaACnLIwx9nH+82roXwU=;
        b=Ji1VIkVsSKn91hMtWjBeRs69fVlC/81M9b0VkJt2obusM2t5WlIhJwST8Fxp9qFiM1
         S51OhNCdia0Lep6POMXp5ozFYUqs6H4EBdax4VjslLbeX4mZzRVq2fcRW+JItQEbCaNN
         MEJ1uPLoiJHHXomsP9hUaa2Nq5ki3iwwmWuzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682064; x=1750286864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtvuCkqBFYEZRyjG1H+yUqFCaACnLIwx9nH+82roXwU=;
        b=RiP5HdQvgFOexyrYJoARJqa9+6Kk0u2VZDBPdqgEavceUSDWgqyUg2ihBPHvavO68j
         BXxud/DXpg4jxruy29ScC7lZdEBQwdaCpdGzcJBRQa/2sGXmEMKnATW8OORybTThEZ1w
         dFCLpdZrZcrRO0xnH5kUeRCRYRWN9zqN4c5kP31PenyztXoFle/HHtE6C1L2GJ/jkGxB
         IogQc7lHau496n3yUWGG0G0iDQuP2syMM+0MnI3IdHUr9tqY7+c6VXeCbgQMIJd/bPTT
         jOmzNHXH3LMDp7P3Dv0iSkAm42ciGZ1iS/+Dkoin0/ZfxmzOKeUPjl6mfJJ8JyenpdKE
         7rfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWkiNW0a/oRlH+PuOBlzX+afKU8S5rRnffhWsiHMnlTpRcf14jnK1gb4sg3xV6bhPLdEHC3hTA9lmaNUs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiklH6LEHQD7Y/M/ESy4FKnS+0j54hfZ9rpwaRSrzKypH66lG/
	JyaNec/Nm3oZNz2CSibtNX0BrwEOxqMwxsk4envHHTxQAWz6n/iN4Z0W43edgw36xA==
X-Gm-Gg: ASbGnctCycvGWCT3iQ2KHL2M30C8QQFs4pPon+v2jI95A9LpOCiy4dQ4GFqR+ZsEhle
	spuEHuLRhTOR1oja7Fm/N+1z08sdCXgd3uGEmnsTEzKFZBHg9fLOBzZDNN7E2Wyd2504Ow9umSh
	riC04nX6zrUxFos5ZH2qHVSYXRVKay8VyMaY8oqL0i9JLbU08zXHLSWamLsOUA0VFcHLHVJVZaP
	vgCmJqNBnca5zAbqRakgiv6yZ5QShxS1DwvjwU4iLXczQ8LVkhquYu4YgSG3tl2gbsNn+nDClrX
	Hro89ZlBuVdmC1e+YXlfdcXaCnWfFjvaZ6Dukp+DbxBcMobCxPUKXVpo66MydrBNjFNUzUcj7u2
	YJm5gt6qqnFnO5ntIaDhHk6bQ
X-Google-Smtp-Source: AGHT+IFHrwkXqx2Z3BILANYYSOX7LZROue9EeXw+W5JfDdbWlJ4+YUXrdt9TxJMVZXgYYIXDGyUMfA==
X-Received: by 2002:a17:90a:d406:b0:2fa:1e56:5d82 with SMTP id 98e67ed59e1d1-313bfdcc12emr1461708a91.17.1749682064115;
        Wed, 11 Jun 2025 15:47:44 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:e790:5956:5b47:d0a7])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-313c1bca4c7sm113244a91.3.2025.06.11.15.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 15:47:43 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:47:42 -0700
From: Brian Norris <briannorris@chromium.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jeff Chen <jeff.chen_1@nxp.com>, stable@vger.kernel.org
Subject: Re: [PATCH wireless v2] Revert "wifi: mwifiex: Fix HT40 bandwidth
 issue."
Message-ID: <aEoHjudwZKs4YMls@google.com>
References: <20250605130302.55555-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605130302.55555-1-francesco@dolcini.it>

On Thu, Jun 05, 2025 at 03:03:02PM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> This reverts commit 4fcfcbe457349267fe048524078e8970807c1a5b.
> 
> That commit introduces a regression, when HT40 mode is enabled,
> received packets are lost, this was experience with W8997 with both
> SDIO-UART and SDIO-SDIO variants. From an initial investigation the
> issue solves on its own after some time, but it's not clear what is
> the reason. Given that this was just a performance optimization, let's
> revert it till we have a better understanding of the issue and a proper
> fix.
> 
> Cc: Jeff Chen <jeff.chen_1@nxp.com>
> Cc: stable@vger.kernel.org
> Fixes: 4fcfcbe45734 ("wifi: mwifiex: Fix HT40 bandwidth issue.")
> Closes: https://lore.kernel.org/all/20250603203337.GA109929@francesco-nb/
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Johannes seems to have applied this already, but FWIW:

Acked-by: Brian Norris <briannorris@chromium.org>
