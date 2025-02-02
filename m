Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9182BBA34
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 17:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738517822; cv=none; b=smR/rrfgDVTdgf/h30qMVA6+WyuM1k55Vgodm6KoaePsuyzOffwg69JQpuzdsPZqlsj68e2IJg7yXBziG6HvO1ory8PfazUIISFwT98lzc36x+TMH1ok7wFj93nxLBDeKTY6koj/lhT6rbmgjy7PRO93kAAluVRBkgAZtTgHXVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738517822; c=relaxed/simple;
	bh=JD0kUo1v0DGpy0LVxC4vg0LsyYOo+DpRiXq2yw0Fujg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KI0Zel3+CjMYbgHeNCyA+EkzDzNFD1vAOXlJsEA1VMwgVvBWA41XuwtzS0Vm7qGsB5A6BD2wEH4jSfWb6BTeTuxYdTou6sZAcyRKPhjjOv/3jJ3c3f6lTg6g28dgI4tX/G85mw0PWJGKGlLolwZvoBTdrkU+sLwpDjAT+JQVcUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=udwc+PEc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="udwc+PEc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE877C4CED1;
	Sun,  2 Feb 2025 17:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738517822;
	bh=JD0kUo1v0DGpy0LVxC4vg0LsyYOo+DpRiXq2yw0Fujg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=udwc+PEcaSH0abO2S9m7EcqdLxYOuH1JfjJSXExH8oTvv1uS1Whd3b45CRqCBsDU0
	 5Q2CMWmxL/KEizY9Zc47cAdnn4xVuxS5T7Bewxvq/rro0QI4KLbTChPUokmhaxkyyZ
	 JjZoXnIks48/s6kX7E4bJi2Tp/cHnoZxxJuhKTMXXVK5VadV2wc6OgG/j1LDgsolrN
	 7a3HLTzkN0JpvJJxF2IMGAOrLQ3eaxRl9pXbiFDtex77YnHK4K1rz0FF18XqEc+RJY
	 L8hJ3cin6P8mLE9RRuL1rHIggcjbjaLcficp/6LVGmxY+B8Oi+6t8otnxcKsIHv0G1
	 3u6oROLLqlMqA==
Date: Sun, 2 Feb 2025 07:37:00 -1000
From: Tejun Heo <tj@kernel.org>
To: Changwoo Min <changwoo@igalia.com>
Cc: void@manifault.com, arighi@nvidia.com, kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/11] sched_ext: Implement core event counters
Message-ID: <Z5-tPKaNhT6DNHTA@slm.duckdns.org>
References: <20250131070938.95551-1-changwoo@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131070938.95551-1-changwoo@igalia.com>

On Fri, Jan 31, 2025 at 04:09:27PM +0900, Changwoo Min wrote:
> The sched_ext core often has to override the BPF scheduler decisions,
> and some events could be interesting but not easily visible.

Applied 1-4. Will wait for refresh on the rest.

Thanks.

-- 
tejun
