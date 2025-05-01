Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1BF7405A
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 10:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746096147; cv=none; b=tRXXsbmsJQZGlAjpbF/roaotRwxHzMsNbXrlm1hYSZsATc8LUX3jaabvXhIVaBRhL97i5uixaJYzptbDXUkuMR88dILM+rFlUJSA5bGor4uZixw5dkPXEEGT1dRjPavl57tAH8yWTy1G0edFSdm6Qx1UqQ0S4nrZgZmWUL0fxjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746096147; c=relaxed/simple;
	bh=K9/2wk7X6g/zFFcBv3ArB8dQVBngplBfKOhnASXyWuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MqWNEU4wjzyYt7xgKzkrwGVv0cWQtGgWCCcjz7fYc4xVyeMq2wmd/3mYH/iNnfZQkWki0OdzUJLfv/3Imox99z8D1IcnOfkqGMqbSpFxW3vdiIfTsS73W/GGryzp1BKFl7deL7csEIQttoJ/xYDfFuyyZxOq2hKOwVh63CaMLRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4288EC4CEED;
	Thu,  1 May 2025 10:42:26 +0000 (UTC)
Date: Thu, 1 May 2025 11:42:23 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Luiz Capitulino <luizcap@redhat.com>
Cc: lcapitulino@gmail.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	david@redhat.com
Subject: Re: [PATCH 3/3] mm: kmemleak: mark variables as __read_mostly
Message-ID: <aBNQDybcsttFxUsP@arm.com>
References: <cover.1746046744.git.luizcap@redhat.com>
 <4016090e857e8c4c2ade4b20df312f7f38325c15.1746046744.git.luizcap@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4016090e857e8c4c2ade4b20df312f7f38325c15.1746046744.git.luizcap@redhat.com>

On Wed, Apr 30, 2025 at 04:59:47PM -0400, Luiz Capitulino wrote:
> The variables kmemleak_enabled and kmemleak_free_enabled are read in the
> kmemleak alloc and free path respectively, but are only written to if/when
> kmemleak is disabled.
> 
> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
