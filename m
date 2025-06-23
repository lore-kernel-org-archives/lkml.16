Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C7626D4C3;
	Mon, 23 Jun 2025 16:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750695678; cv=none; b=L3DRp5eoUfr+QahJyBBkcVg1p2iDHZAM3owI5/gFWj+YM4iQghergVGceAlqeDHK2GIP0PnT1IdDLCHpSM4dFHB59rViEbHgfhsXrlJhIhek/Fl1t4vr053EtpsB+Dr4OhUWhtL/f6KiQyQoGBhzVb3kocmhkn2zvmZ8kcQD19E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750695678; c=relaxed/simple;
	bh=gTAgsNPze2zYKE8gKT+Wb+PTpT0Fig6HPGnb1n1HS7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kG4H3k2bOgMvoNoWry9f+bZvBrXNmN05YkYUT6jGhIxB0LbMI1QYs3HRj/dgfKnCAZ+XvCez+N5Fv9jTp6W+T++Utrem0xJ4bNiH/3taTzdNXPVo7sXF9G4RQOi+LYTS+1aF7IbE9MmzxMkiYXPAA1PkLqWMFlob/urdabCKivg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KegIIPZe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KegIIPZe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3D3C4CEED;
	Mon, 23 Jun 2025 16:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750695678;
	bh=gTAgsNPze2zYKE8gKT+Wb+PTpT0Fig6HPGnb1n1HS7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KegIIPZecUCexbl3HIXT0RGyxz6ara7WEzV+d/Aa/8UDTUQ32+oa/1wcofSYd3gBz
	 tP8pVXjKTpkwOreA+BC+ZRzYoETKVTGSyaz+K6lrD0eME/26w8OyzX86RiOhErySre
	 Jtmc7k5nmgW/zpcKglQ+4peDxl8y+diZgkuMJgQlRh8EBHZp3C89WyDmhGR+jwFoeP
	 5eCUVQYXHrIz1TrEMe3LDaYLZ/jArucukQftwvJw4lSrpg5g0twXPOq9oHkRSJHdGE
	 UPKnuuxbg6BuXVMkDG/92ipzjAvVFs5uw4u0X3GMpNf/UrL2aJjnqF4/xsa976r4R7
	 gPy7cWHu8Dd5g==
Date: Mon, 23 Jun 2025 17:21:13 +0100
From: Simon Horman <horms@kernel.org>
To: Jijie Shao <shaojijie@huawei.com>
Cc: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
	edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch,
	shenjian15@huawei.com, wangpeiyang1@huawei.com,
	liuyonglong@huawei.com, chenhao418@huawei.com,
	jonathan.cameron@huawei.com, shameerali.kolothum.thodi@huawei.com,
	salil.mehta@huawei.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 net-next 5/8] net: hns3: set the freed pointers to
 NULL when lifetime is not end
Message-ID: <20250623162113.GC506049@horms.kernel.org>
References: <20250619144057.2587576-1-shaojijie@huawei.com>
 <20250619144057.2587576-6-shaojijie@huawei.com>
 <20250621083310.52c8e7ae@kernel.org>
 <fc76feab-8390-43dc-9de6-e1d53bd9986d@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc76feab-8390-43dc-9de6-e1d53bd9986d@huawei.com>

On Mon, Jun 23, 2025 at 09:44:45AM +0800, Jijie Shao wrote:
> 
> on 2025/6/21 23:33, Jakub Kicinski wrote:
> > On Thu, 19 Jun 2025 22:40:54 +0800 Jijie Shao wrote:
> > > ChangeLog:
> > > v2 -> v3:
> > >    - Remove unnecessary pointer set to NULL operation, suggested by Simon Horman.
> > >    v2: https://lore.kernel.org/all/20250617010255.1183069-1-shaojijie@huawei.com/
> > You removed a single case, but I'm pretty sure Simon meant _all_
> > cases setting local variables to NULL in this patch are pointless.
> 
> Ok, I will drop this patch in V4

Thanks, much appreciated.
