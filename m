Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6682641E7
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747829593; cv=none; b=FNlVGiCy5ei1jGHtxM+jAR8OnW4tFsGaf71MDtdO/ph691DKof3pwlQ0G1LQWy4TJNs2drfFQKzrFXCpVwGNtBdXbcXe0aiy/QysFoA8BY8/sL/a/G2gEZHc+USUU5zWgQ8/3GfynKOC005OLvkLxwCKH5hEHbwELUb9+5rfs4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747829593; c=relaxed/simple;
	bh=buBNh8RwipUkpYoq1/Olg6sz7JiHBeu3cgGsmP6XuDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dxbjBReHBGPALWXNualy33paysATpkyRVjw0XWts/gKls9Ct8T3qcysKA/AuXJLFBk2qMu6VgXmsCMEgNiLAO7vXVg0PvEqBEPlClsX4i968ECvzTKfkztvOT9Oryz/ddcMzxSp8DWTbxzO5zYbMZRa5QQV5eLuxdouSIrcpFOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=X8OUCwK8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="X8OUCwK8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6668C4CEE4;
	Wed, 21 May 2025 12:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747829592;
	bh=buBNh8RwipUkpYoq1/Olg6sz7JiHBeu3cgGsmP6XuDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X8OUCwK8ql3cB8HZ7y2snHI8+GHx4vcyGmRBqLiXCxzOvQczzga4Y0xxxiu2/8nUf
	 34Iulyv14OxJgrxlOpzAkJNvpzdye3nGOPdYRlmPj1FS4m9tm+aG7i3XlY7JHQyQBc
	 UW6LyjDKfArYKtsH0WmoGf6u9yTylIIX8lTkh2F4=
Date: Wed, 21 May 2025 14:13:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org, krzk@kernel.org,
	Kees Cook <kees@kernel.org>
Subject: Re: [PATCH PULL] w1: Avoid -Wflex-array-member-not-at-end warnings
Message-ID: <2025052155-image-mongoose-5117@gregkh>
References: <20250513105058.27028-2-krzysztof.kozlowski@linaro.org>
 <20250513105326.27385-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513105326.27385-2-krzysztof.kozlowski@linaro.org>

On Tue, May 13, 2025 at 12:53:26PM +0200, Krzysztof Kozlowski wrote:
> From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> 
> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> Use the `DEFINE_RAW_FLEX()` helper for on-stack definitions of
> a flexible structure where the size of the flexible-array member
> is known at compile-time, and refactor the rest of the code,
> accordingly.
> 
> So, with these changes, fix the following warnings:
> 
> drivers/w1/w1_netlink.c:198:31: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> drivers/w1/w1_netlink.c:219:31: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> Reviewed-by: Kees Cook <kees@kernel.org>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Link: https://lore.kernel.org/r/Z_RflBe5iDGTMFjV@kspp
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Hi Greg,
> 
> I have one patch in w1 tree for you for v6.16.

A "PATCH PULL"?  I'll take this as a patch, thanks :)

