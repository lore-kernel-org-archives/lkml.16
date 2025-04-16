Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30FE189BB5
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744816961; cv=none; b=QFBAwJ4qM+5LYHwa6ruBnBwnFcbNJvA+RZSxEDJ8LY1UVGBiFN4976f3JACmX5ZojX3IUSi7VmbZZkd4x6r6MMOfru2Z/ax4iVVJKw1cn7BprlQwf+qT0QmNfjI7IH3gitxarvalhnZCUComN3VsxyrxqVltKPlMiIX9VxWtc44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744816961; c=relaxed/simple;
	bh=CnMILBvc8rRhboHDN/fUxl9d3X+YHRkK9VTANc07ic0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YzJwJt/jpvouT69tkKdgCSnFT51e1o493yW/HVbHw/tFlFztNVOU5yjfLDdEQm4INa6GyK6bRIQrD3731qiPZZXoSSQsTZd8rfkIgwP+ZTvTgltlmLe3PtaSjyuNY36ipgOy8q8l5ZZWP1VbxUQnLj+/782pOJSubhuUitdGFb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=JPPTeuAw; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="JPPTeuAw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1744816947;
	bh=CnMILBvc8rRhboHDN/fUxl9d3X+YHRkK9VTANc07ic0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JPPTeuAw0UDzdtTpApn989K4QpZOIgzquJjR7Vj84a3h51dSEu6qZ2QLmwSRxJ4mD
	 5SV+QFEOi3Fw6MQ4JAnWwoyAI6SGgsb9fkV88Y8s9SyEIhQ9BPVQTw1tJOPsWynGao
	 zIzU3sfvTXHWMHtPhUUIbg7R8EDOQZzJmcw+gJTo=
Date: Wed, 16 Apr 2025 17:22:27 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Jemmy Wong <jemmywong512@gmail.com>
Cc: w@1wt.eu, linux-kernel@vger.kernel.org
Subject: Re: Follow-up: [PATCH v3] tools/nolibc/types.h: fix mismatched
 parenthesis in minor()
Message-ID: <6ea86cae-531c-4426-90d7-7b3f52b663e3@t-8ch.de>
References: <20250411073624.22153-1-jemmywong512@gmail.com>
 <20250416134216.29102-1-jemmywong512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416134216.29102-1-jemmywong512@gmail.com>

Hi Jemmy,

On 2025-04-16 21:42:16+0800, Jemmy Wong wrote:
> I hope this email finds you well. 

It does, thanks! I hope this response also finds you well.

> Following your feedback, I submitted v3 of my patch:
> https://lore.kernel.org/all/20250411073624.22153-1-jemmywong512@gmail.com/
> 
> I’m writing to kindly follow up on the status of this submission 
> and check if it’s being processed or if there are any updates.

I picked up the patch and it is scheduled to be part of the v6.16 release.

https://git.kernel.org/pub/scm/linux/kernel/git/nolibc/linux-nolibc.git/commit/?h=next&id=9c138ac9392228835b520fd4dbb07e636b34a867

> Please let me know if there’s anything I need to address
> to help move the review process forward. 

There is nothing more to do, except wait.

> Thank you for your time and guidance.

Thanks again for your contribution!


Thomas
