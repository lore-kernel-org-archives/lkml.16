Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71B825A2AA
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 14:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746453952; cv=none; b=tXKVMuYB11L7Nl1dkHBgoTzk15J4w0ez4oSwEaThrHoT5Z1paefhWM6+kcrXiBchnJ+ndwsPsL1W2Mtm7bzvn1GzBuouXnZgGwz/5sSJLrQ0TFw0oZhkEHMZWIHs8P0PKgTB35Gmlr1iQg99BvzlPQwuB+K+TtZdxzqY2ClDi6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746453952; c=relaxed/simple;
	bh=WPDPjoeDcUl2bxyE8QhhUjV5JBaZAPddAUa0HV8mTes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kqE48KiqzI9ZZiVO3Cl6p6RMwZBRYKyEK+dfemCWy8U///6A7Fef89lQkIkSt0dxSPyjUIdtoR9PcW83k0wVsGEobTz6gbpr2SVGuJl8NOvM+oCOtCBEsL/pNyzNLBrx2p1Wk+52MOo6pD/MkkeFRBzvoTV7M0ZnvmPvmVo7qgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KLKeALSH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KLKeALSH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B30D4C4CEE4;
	Mon,  5 May 2025 14:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746453952;
	bh=WPDPjoeDcUl2bxyE8QhhUjV5JBaZAPddAUa0HV8mTes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KLKeALSH21CRBLs/XtDCbYD0o1yWFIAXj5rpmY8DzUC8KQ5gknqzvSDz1YvjDMEWU
	 fP9IHzwpquS9y8z4MnaQfmQIVglacZHxKr/qjnCKw3OWUR7O5CgnhQ/x9c82NXk/XJ
	 qnBNsn89mNBYeGbjoW4GhSk+Ai5d7MtYtmMOpoA65Ea42qTUOOaSBu1U6SM5ke2mRS
	 wEb0RtZC3a2Gw80dskk76ZUlvILBEmBx8IdiFxBtE9ek3mXPqYMInuLAkTvo/l/xZp
	 R64L2PHN2BTpxaWq/RSSFvgzEZBu73r9eILUJMwO/Ksw5vxOm3iHw4ofrs2Jadf7p2
	 YgZFpn4cH/GGQ==
Date: Mon, 5 May 2025 17:05:43 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Donet Tom <donettom@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Yury Norov <yury.norov@gmail.com>,
	Dave Jiang <dave.jiang@intel.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] driver/base: Optimize memory block registration
 to reduce boot time
Message-ID: <aBjFtxwAYO69h2L6@kernel.org>
References: <b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com>
 <aBdK2EIMYYRmmEwA@kernel.org>
 <a1e0cddc-ed38-4f48-b028-f3ab5025c157@linux.ibm.com>
 <20250504130343.d1e7f73040daf053a171a99f@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250504130343.d1e7f73040daf053a171a99f@linux-foundation.org>

On Sun, May 04, 2025 at 01:03:43PM -0700, Andrew Morton wrote:
> On Sun, 4 May 2025 22:04:08 +0530 Donet Tom <donettom@linux.ibm.com> wrote:
> 
> > If this configuration is disabled, the current patchset would not function
> > correctly, and node device initialization could fail during the hotplug path.
> 
> I'll remove the mm.git copy of this patchset.
> 
> Probably Mike will be taking the series anyway - I grabbed it because
> this was unclear to me.

I usually only take patches that are local to memblock/mm_init, but I can
grab those if you prefer.

-- 
Sincerely yours,
Mike.
