Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9B126F477
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 12:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751372414; cv=none; b=qo+1AKQ5Ix/VK502MZgAiAS9CvmUqCOS/n+jRv44NG2J/fJc0OtDTWR5T6sL7DGEoPy2CwP2kYv7kAo65A1H7wf1DkWqzaIaD4tHw0DpiuyrZCZhGvtf0jCFy0V1+82pYeKOHD0La9rlrk451A0GcTtfnKbqqFHgMjTZghLWui0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751372414; c=relaxed/simple;
	bh=Cey/1A5doCD8DkIDA8nHKRd918FyBxWY0j4lxorG6Qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fjXNiWazBfvHqDZG57swLzr9bEuGFrxiseaY8coJmaIBilDVAQuvJ1FixY3Ph1IiEFdYWdN1HNWmgshoVKNfDijb9zcl/GwQiTkc8vNIU/pE84B+xBJGJVAsFUUmz4BST+wHo3tg3Jj0saHNbEwzCCKiEWlNGgaikLXaMQG1juw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=coqZTQTK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="coqZTQTK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD88FC4CEEB;
	Tue,  1 Jul 2025 12:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751372413;
	bh=Cey/1A5doCD8DkIDA8nHKRd918FyBxWY0j4lxorG6Qc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=coqZTQTKghxbxm/zVcD9m7ei0OQymE8zk/gnuJ6VqEttaDtmLLEQfFFfvZrqP/uZA
	 BSZ52HL48lT68Bp8Wtfoq0iKLYTy2X7I1H0MeTJAYmilWsgS81ZLHrMTBAPeZ6MWtG
	 eZsDforhI1nXO8Wou2SLzfbM2luIytTIw6qmS+vE6PpKXu1E0FCo2p6qErTmXdYh90
	 b/6DhoNIJaTmCYtWzGbHLMoAvE2Q3R0kX2Z0GKAl9wInZZi2C7M3jFX9IBP2RNpqmC
	 qI1s2jPIGJZCoq1xcKWblCc2Sc0a+6q5XtDRiHKKfReLoY+c6I63Pyt+hs/fjaF8KB
	 JoZHKdXorIPIA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uWZy9-000000006I0-1iqk;
	Tue, 01 Jul 2025 14:20:14 +0200
Date: Tue, 1 Jul 2025 14:20:13 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org
Subject: Re: [PATCH v2] staging: greybus: gbphy: fix up const issue with the
 match callback
Message-ID: <aGPSfRSTDXsNNp1P@hovoldconsulting.com>
References: <2025070115-reoccupy-showy-e2ad@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025070115-reoccupy-showy-e2ad@gregkh>

On Tue, Jul 01, 2025 at 01:06:16PM +0200, Greg Kroah-Hartman wrote:
> gbphy_dev_match_id() should be taking a const pointer, as the pointer
> passed to it from the container_of() call was const to start with (it
> was accidentally cast away with the call.)  Fix this all up by correctly
> marking the pointer types.
> 
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Alex Elder <elder@kernel.org>
> Cc: greybus-dev@lists.linaro.org
> Fixes: d69d80484598 ("driver core: have match() callback in struct bus_type take a const *")
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> v2: - add Fixes: line as pointed out by Johan
>     - don't make gbphy_dev const, it's not needed, as pointed out by
>       Johan

Reviewed-by: Johan Hovold <johan@kernel.org>
