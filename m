Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1E819DF66
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 04:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747889128; cv=none; b=goHLE8hwUijxznkr88prUynIJWp0wte7j7ORt4x+xPzEq7TjDzbhQ/YlYoj4LKJjG53hSlS/YhIK233yIJvebKMJcsSls1Oayt2m+4M6zB93MAuvx+hUT5dnPrqkQ44Xbc5HiGk8+f+PF9Mwx2aMRecARSMJCzO1XIetrFo7ipw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747889128; c=relaxed/simple;
	bh=MI0UzchgfZjHRRr4t4+5f3tFo54LMgRfeWFwCE/OLiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A7Mjb5pVgXUGyIQxPtTwqHk4xDJogVDrGWYGRUz6EsR/cgRWUXR/LHCw6Hjc8Nc4wRztYBxoAYc2E+9YM7G5p67x3j3n0AWZzEjv8hK/RrS7+Jd+sbZa7M7S7A3BvGJVPu6ouRVDuXWfl0/82wxqRrFGzkAIVIEIYzMPaIs6RgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FkXpzrRc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FkXpzrRc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8006BC4CEE4;
	Thu, 22 May 2025 04:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747889127;
	bh=MI0UzchgfZjHRRr4t4+5f3tFo54LMgRfeWFwCE/OLiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FkXpzrRccn3jQE6xIX3qto77OWuktvbPhqfifkD6+mh2oJQzAx2CPh9OyO4CleypV
	 V3MlFlX41S9VQaDA8WmVzqGe/1th4JIxuU0l4r6Q4OCeg5JtCDM+txZm+IMCFZLgNo
	 NjRDKB3STyGn9LI2c2Ct2oSIEYLsojdtSBB4FpzM=
Date: Thu, 22 May 2025 06:45:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Donny Turizo <donnyturizo13@gmail.com>
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drivers/staging/rtl8723bs: Fix camelCase to
 snake_case style in core files
Message-ID: <2025052216-compacted-esteemed-bb32@gregkh>
References: <20250522000412.22210-1-donnyturizo13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522000412.22210-1-donnyturizo13@gmail.com>

On Thu, May 22, 2025 at 12:04:12AM +0000, Donny Turizo wrote:
> Signed-off-by: Donny Turizo <donnyturizo13@gmail.com>
> ---

No changelog?  No v2 information?

