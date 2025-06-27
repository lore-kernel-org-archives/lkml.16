Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7392AF1D;
	Fri, 27 Jun 2025 04:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750999582; cv=none; b=f2lpjL1jOBESfLyeQfyVvdhFYPQkh5rqnTmmov97ewZMirMOenduG9QuC6cQnJQq6E0rCWlzWnw9M24sdvm/bq5e9aA6ns00qJYlag/evbAMR8qMNgo2twU4x2q0Tz9k3hj35ADtOXSQFVtues2Y1ul2lvYRb658+oLr/oSDzF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750999582; c=relaxed/simple;
	bh=CRg0EJiCW1vlETaq0gm3K8sth+RJ233ntPmn0d0MeM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SQuB7ADSrOJJWrY/3SdWNyZGoWHruye8GW4FM0uLjwTx+oFKMgt6iZh+Xk4w00US8R6PX8DE2bUrUmzghhjRFfl2tWNEz/OJSr+CkdBXKXTUHdOzfKDhhyoIEVgU+mYPDro6LHBKJlhJxQIt8ywwDm5GJRU85EN7/IM7D2wNYZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=USjY2cHt; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="USjY2cHt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750999580; x=1782535580;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CRg0EJiCW1vlETaq0gm3K8sth+RJ233ntPmn0d0MeM8=;
  b=USjY2cHt1AvTQc7tvOk+1YLNegJj3SAjPh17l82//le6QFCl8xsWeV1n
   QcMeXxpIZah/l42CqYFOgdM8nbrW8J4wVF39DixyrgGpa4TcMwczxuFc3
   EkUmeZsAPbb5NfcYFxW/Xby5cDosdn4Dor2WKU7liYXdGY6wERsClE4AW
   El9ufptIcBjSE1xaq0kQRiu2uWshlmB6OOLay3C8jwN3cZYDFkc+CqIKS
   PcUJNggrLmCYGuLq6UspXQZ7Vs6AGS6WkKTxfsdRckn8seVoRaW0Hw5ZP
   am1Nss+baN+SXMCfT0rC/QebODhW60sSQ7nZP5BQLKED4SbjYn7M3isZf
   Q==;
X-CSE-ConnectionGUID: zePpM+G4SjCrrRxH/l0a0w==
X-CSE-MsgGUID: ZhQiWwvOTXeWhsKSQ4BWHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53389224"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="53389224"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 21:46:20 -0700
X-CSE-ConnectionGUID: d//ftQ1BSUm76VW8/nlTdw==
X-CSE-MsgGUID: WZ7j3axxQfCqoUkijJga2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="157096202"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 26 Jun 2025 21:46:17 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 5DFD321E; Fri, 27 Jun 2025 07:46:15 +0300 (EEST)
Date: Fri, 27 Jun 2025 07:46:15 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Charalampos Mitrodimas <charmitro@posteo.net>
Cc: zhangjianrong <zhangjianrong5@huawei.com>, andreas.noever@gmail.com,
	michael.jamet@intel.com, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	guhengsheng@hisilicon.com, caiyadong@huawei.com,
	xuetao09@huawei.com, lixinghang1@huawei.com
Subject: Re: [PATCH] thunderbolt: Confirm the necessity to configure asym
 link first
Message-ID: <20250627044615.GM2824380@black.fi.intel.com>
References: <20250626084107.2710306-1-zhangjianrong5@huawei.com>
 <20250626093026.GJ2824380@black.fi.intel.com>
 <877c0ylo2f.fsf@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <877c0ylo2f.fsf@posteo.net>

Hi,

On Thu, Jun 26, 2025 at 11:50:00AM +0000, Charalampos Mitrodimas wrote:
> Mika Westerberg <mika.westerberg@linux.intel.com> writes:
> 
> > Hi,
> >
> > On Thu, Jun 26, 2025 at 04:41:07PM +0800, zhangjianrong wrote:
> >> Current implementation can cause allocation failures in
> >> tb_alloc_dp_bandwidth() in some cases. For example:
> >> allocated_down(30Gbps), allocated_up(50Gbps),
> >> requested_down(10Gbps).
> >
> > I'm not sure I understand the above.
> >
> > Can you describe in which real life situation this can happen?
> 
> I suppose this can happen when reducing bandwidth while total upstream
> bandwidth usage on the link exceeds TB_ASYM_MIN (36 Gbps). The
> allocation fails at the asymmetric limit check before checking whether
> the downstream request actually needs asymmetric mode.

Right, but I would like to see here in the changelog explanation of the
situation and preferably parts of the dmesg showing the error as well.

@zhangjianrong, can you do that and resend?

Note, I will be on vacation after today so expect delay from my side.

> >> 
> >> Signed-off-by: zhangjianrong <zhangjianrong5@huawei.com>
> >> ---
> >>  drivers/thunderbolt/tb.c | 10 +++++-----
> >>  1 file changed, 5 insertions(+), 5 deletions(-)
> >> 
> >> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> >> index a7c6919fbf97..558455d9716b 100644
> >> --- a/drivers/thunderbolt/tb.c
> >> +++ b/drivers/thunderbolt/tb.c
> >> @@ -1039,6 +1039,9 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
> >>  			break;
> >>  
> >>  		if (downstream) {
> >> +			/* Does consumed + requested exceed the threshold */
> >> +			if (consumed_down + requested_down < asym_threshold)
> >> +				continue;
> >>  			/*
> >>  			 * Downstream so make sure upstream is within the 36G
> >>  			 * (40G - guard band 10%), and the requested is above
> >> @@ -1048,20 +1051,17 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
> >>  				ret = -ENOBUFS;
> >>  				break;
> >>  			}
> >> -			/* Does consumed + requested exceed the threshold */
> >> -			if (consumed_down + requested_down < asym_threshold)
> >> -				continue;
> >>  
> >>  			width_up = TB_LINK_WIDTH_ASYM_RX;
> >>  			width_down = TB_LINK_WIDTH_ASYM_TX;
> >>  		} else {
> >>  			/* Upstream, the opposite of above */
> >> +			if (consumed_up + requested_up < asym_threshold)
> >> +				continue;
> >>  			if (consumed_down + requested_down >= TB_ASYM_MIN) {
> >>  				ret = -ENOBUFS;
> >>  				break;
> >>  			}
> >> -			if (consumed_up + requested_up < asym_threshold)
> >> -				continue;
> >>  
> >>  			width_up = TB_LINK_WIDTH_ASYM_TX;
> >>  			width_down = TB_LINK_WIDTH_ASYM_RX;
> >> -- 
> >> 2.34.1
