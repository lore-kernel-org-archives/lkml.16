Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5D41DFD95
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 10:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746096027; cv=none; b=W/G1Gx21A3eHRrmfvo63BNkg6nAajO6Ee3Zt+phKe4qWgmOYjhHZJwvfUCrgiBVmPiz3RQ+PUnixrZ2qN8UIknGJC6tOrsg9b/pkSf1+0WEc8aXklUtZpFeAqCUVpSKrJhBlWlWX6yYxxPHPoBmqApWfusHBo9x/WdZNw9svB9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746096027; c=relaxed/simple;
	bh=Fobmk4QOV1Yu6BZ/KsEBLgDLH+bTHws1AfxgI/JolVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KVh7OLzRrW4Sb9p2BXDuhNtTrNxBPs3B3FYzb3Iu3uaZE8PpMc/ZwAqRFlDZqZpU2kHMCV80t82Nxd+Tm59PgRhmSJCbmKStiuNl5QNzc610dDgChIxHy74P0IMlRz7eByV6eqwce4b9RUrO996rgbKw0lccU5heDv4gPgZyhV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BA83C4CEE3;
	Thu,  1 May 2025 10:40:25 +0000 (UTC)
Date: Thu, 1 May 2025 11:40:23 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Luiz Capitulino <luizcap@redhat.com>
Cc: lcapitulino@gmail.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	david@redhat.com
Subject: Re: [PATCH 2/3] mm: kmemleak: drop wrong comment
Message-ID: <aBNPl2-KCtAf1g-u@arm.com>
References: <cover.1746046744.git.luizcap@redhat.com>
 <3dfd09bc0e77bb626619184a808774ff07de275c.1746046744.git.luizcap@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3dfd09bc0e77bb626619184a808774ff07de275c.1746046744.git.luizcap@redhat.com>

On Wed, Apr 30, 2025 at 04:59:46PM -0400, Luiz Capitulino wrote:
> Newly created objects have object->count == 0, so the comment is
> incorrect. Just drop it.
> 
> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
