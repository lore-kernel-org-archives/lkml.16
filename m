Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360DB3FF1;
	Fri,  4 Apr 2025 06:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743747775; cv=none; b=b+nys7gsXS4Iqews5p0C2BIGsA9m28Ockssg4ZN/XQADMP+Ovc5daJVWR0wdPynUuYkNgv5ybDdWF841/zRS4NV3dC6RVkiTUGC+0pFiwgxkln/9wjqLRF9h2t+uMnXqJtySMUpkYNWoWwNts4RAgyDn/cyy2uA+dKGkCd4tGyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743747775; c=relaxed/simple;
	bh=cZuWQTUm8c0Fo1+Q4170yzPKsBssXgcsrHd/84K+uZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uqka8l54I4rdvcjPMYh3210t6suUO/1pskQo55yO/ZxH46NR2ly2I7XW+/9s67Yd6B8gx1eh6XyefJ4Z5yWEvOSUyB2f3I24NLeodRdN92F2VIvwb+mkUhGQOXW93ZYI80phI6IB2PjYo6/X9rLRfGH5sETOTzoFXAqHIxuZClE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0na70HHt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0na70HHt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B4D7C4CEDD;
	Fri,  4 Apr 2025 06:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743747774;
	bh=cZuWQTUm8c0Fo1+Q4170yzPKsBssXgcsrHd/84K+uZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0na70HHthHuVif1z/RPhXjygfM9XQFXlK9JB6t73l7qdztrISCO4J/aQapmdkWFmE
	 0ewqHVYegF7NUC9C86UJvdWFMmRjgfF/pSL7VuxouJKuolXbBSWyqaU46as4xNt4Vw
	 CosJfNLOn/N8ShEud4MZ6MwlM3MvoNRixkfz+X9g=
Date: Fri, 4 Apr 2025 07:21:26 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-spdx@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts/spdxcheck: Limit the scope of git.Repo
Message-ID: <2025040417-aspire-relenting-5462@gregkh>
References: <20250225-spx-v1-1-e935b27eb80d@chromium.org>
 <CANiDSCtfcMBMj3=_gWrMd3P1Bt19uZaWs1TYQ+ZPHo5amPi+TA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCtfcMBMj3=_gWrMd3P1Bt19uZaWs1TYQ+ZPHo5amPi+TA@mail.gmail.com>

On Thu, Apr 03, 2025 at 11:34:14PM +0200, Ricardo Ribalda wrote:
> Friendly ping

Empty pings provide no context at all :(
