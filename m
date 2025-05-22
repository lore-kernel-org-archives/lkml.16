Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EE819F40B;
	Thu, 22 May 2025 04:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747889116; cv=none; b=dQ2Rj3iZlJtabqPsq8hgmpr3/v6u/XFXiYAv/8p0EbD8kFbs3tKxhrOHiwEn5YvDX7FmUtTX449KUd/Av/bQhNS5LYLu6SIxEYYZ3kgcZ7tz8RIlrXCPYJjCNXpF9qYeAbmFqZRNDn36mQKyk3obnOx/8e42bApVmV5zssV+oxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747889116; c=relaxed/simple;
	bh=gt7aXgMBvPNR41wMkDoLRtl01sUdXWLmkb3HaADdYyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bsVKj2y69c+HppB00P82i1uIy0/iI2OCwwfPDgQcb57rB32eziZjvlEP2PXPRfbZTR1LdE4VI/xxQsNjBJyFZYBIQX4WAwJhTHoVZG9BtOrmfiLEPXUyptDPJrS/2Y9jzoME1X/OgEyjaWdVY7vmH3WSfqATFvfrw0t4tPICKM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qim8KvWr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qim8KvWr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20E1DC4CEE4;
	Thu, 22 May 2025 04:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747889115;
	bh=gt7aXgMBvPNR41wMkDoLRtl01sUdXWLmkb3HaADdYyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qim8KvWr/Iz7q4/ZTQunwKruKnIBgRxqLxUR1biIZL23u1RqNzkvqe7m/k6KM2eZT
	 NKC3SwT/eQEQbs2Lp66eLt3Z53/vDr9lpbO1yFJekwdy4UG96BU8ZCUitRBK6QL73j
	 oyK1loZ3jIl7tTq8SYMACoZdROiniTlzzC7Vyt9Y=
Date: Thu, 22 May 2025 06:45:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Donny Turizo <donnyturizo13@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: Fix typo in variable name
 'ips_deffer_ms'
Message-ID: <2025052256-duly-clapped-c7a7@gregkh>
References: <20250521232326.20438-1-donnyturizo13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521232326.20438-1-donnyturizo13@gmail.com>

On Wed, May 21, 2025 at 11:23:26PM +0000, Donny Turizo wrote:
> Fixes a typo in the variable name 'ips_deffer_ms', which was
> misspelled as 'deffer' instead of 'defer'. This patch renames
> it to 'ips_defer_ms' to correct the spelling and improve code clarity.
> 
> Changes in v2:
> - Rebased on gregkh/staging-testing
> - Fixed build error reported by kernel test robot

This goes below the --- line, as is documented.

thanks,

greg k-h
