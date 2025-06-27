Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A05289E2D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 21:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751060635; cv=none; b=OCUs+kncTEmQgSPmjmR2epsTUdf1N+kd38RdaYuMR6MwWPtq1p/9k1yizc2J9tGI0zKL+PNPb6OLGZHCZg/GPxSc+GJUJE3W9p/n8uou3iwdEAmqz+hqKNqTt2C4IFVwSqzthvpsSIeb6t4R9c2x89/9ulgb6SkyKHmDn1mufOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751060635; c=relaxed/simple;
	bh=D+gXU4UtMEccbF0FM5UGBExJ8SzeCkvd3uqjNim8IVE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tzXBeBWgXry1p18rSangiFaNbWRL8rOjrJJzj/tXOXCIYaVAGJmfhiaxBL0PB1tCsPF80hfLnmi0Bjm6Nw2xHqdnz1ZpU+CGmljKB/g/I4v44AYM2mVvGovKFPMuuXySfU44mYv9EZndG2NzWK7jem0wmna50NB34NL6O3olJIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BYEbp0no; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BYEbp0no"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B2FAC4CEE3;
	Fri, 27 Jun 2025 21:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751060634;
	bh=D+gXU4UtMEccbF0FM5UGBExJ8SzeCkvd3uqjNim8IVE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BYEbp0nocLjCd9+Plhx44R8iEuYKqSyBrndYaQVYIs/q6yF+xJlvsFe+06lEat9Cz
	 Z3JCkX69T67wNAjNv/J/UGYns2TXIjto92WJjjd2kyTI4Pu/rwh+otEgwwSwTK0vB7
	 D8YWqiDgU6RX3gXyhiW3qcyLpwrDsu531dE/Omfx5vVLHzQ+Jkf1Hd/bNguALxcrzk
	 FTDVXhPohcJMPV19GPGE8/GGDTnLP56yB9O0C0GKyWlE0YVjmEH+1iLly6vfuyJs4Y
	 0i9jLiDZ0j1+9hcp+Z5lJ78jH2lbB/TLIH1B0cgWQ1uCsNFv4V6r6kC1EqzY931x5e
	 CFhgA26AbsCag==
Date: Fri, 27 Jun 2025 14:43:53 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>, Andrew Morton
 <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, kernel test
 robot <oliver.sang@intel.com>
Subject: Re: [PATCH] ref_tracker: do xarray and workqueue job
 initializations earlier
Message-ID: <20250627144353.57ee3f18@kernel.org>
In-Reply-To: <20250626-reftrack-dbgfs-v1-1-812102e2a394@kernel.org>
References: <20250626-reftrack-dbgfs-v1-1-812102e2a394@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 26 Jun 2025 08:52:14 -0400 Jeff Layton wrote:
> The kernel test robot reported an oops that occurred when attempting to
> deregister a dentry from the xarray during subsys_initcall().
> 
> The ref_tracker xarrays and workqueue job are being initialized in
> late_initcall() which is too late. Move those to postcore_initcall()
> instead.

Applied to net-next (on top of an -rc tag again, if anyone else
needs it). Thanks!
