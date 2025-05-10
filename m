Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BB71A841A;
	Sat, 10 May 2025 06:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746858166; cv=none; b=XuqIszgQ9AWmjflq+fgm/NYQuBVKcUaq9yG9DKsADWh0dV57NnSEvZKeOLrXC1qSg9Qb4PE8SCKfioDpYQyUq8RUnuByAIkr+9BQ83zVVrajKam/M0IIcXgQGueb9/Bdqbkv3k7XgwhZ+ZlnrDBTXVTnGkoMEsaVKoOR04RwPkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746858166; c=relaxed/simple;
	bh=tdehS8bdWnrtuiNPph3XA6VufIvfMgwvXF6t6gpSaHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UuIQxe8FHl/SpCfSVR0lh/5YAbEzodoSFZ4r/Usouw8MOCG7KPD/+QZfsTZJlzhVhiafGQdGVK0EVN+f8O04W1nK3f1CukTNDdlIoiK+rOTs8fq1FUagGTYcwAaGn574KSsvUnkggODwV2/q9S3oTeKx2uQV21cqyx6hOuuIlls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=I0SlfZh7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="I0SlfZh7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8E60C4CEE2;
	Sat, 10 May 2025 06:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746858166;
	bh=tdehS8bdWnrtuiNPph3XA6VufIvfMgwvXF6t6gpSaHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I0SlfZh7LGvSVM9+gwQL25U1V9SDUlNAFDa4yovv6e9dERkhgvXnqWv0tnQyhR5Md
	 o+hf+UifL/C1iWhnSjTpOgSzufbBnPl7LG+0t5/Aw4S8NWdswP2MbQ2jeAYSLlKBpt
	 fl+UgcpYGxo21UyGduWm/iAe6A1B/jc0Oy+1LaqM=
Date: Sat, 10 May 2025 08:21:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/9] CodingStyle: recommend static_assert/_Static_assert
Message-ID: <2025051046-epidemic-broadways-d3cf@gregkh>
References: <20250509203430.3448-1-adobriyan@gmail.com>
 <20250509203430.3448-6-adobriyan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509203430.3448-6-adobriyan@gmail.com>

On Fri, May 09, 2025 at 11:34:27PM +0300, Alexey Dobriyan wrote:
> Linux's BUG_ON is done backwards (condition is inverted).
> But it is a long story.
> 
> However C11/C23 allow to partially transition to what all normal
> programmers are used to, namely assert().
> 
> Deprecate BUILD_BUG_ON, recommend static_assert/_Static_assert.
> And then some day BUG_ON will be flipped as well.

Odd, why are you attempting to make all of these mandates without
actually changing the code itself first?  That's just asking for major
churn for no good reason...

Sorry, but this series makes no sense to me.

greg k-h
