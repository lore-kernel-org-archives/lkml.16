Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C182459F1
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 12:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744028921; cv=none; b=k4QjDoxOiUfdPEgQST8VhamG70sCVxWfL+/qkClqkXPldd+cgXNacmqUdJYaXYI5xMvEvwouFM0hopJDeEDZIBQYWVePtArLDkadqmfMZQD0iEsg9wIb1Oj4qA5PBi6TH01aW3xYznXewfOrboxsQarXSvTwlX8D6qiTQyvHw8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744028921; c=relaxed/simple;
	bh=dDCLsoBqPfjWbCG4p1BxBYTwjiD+HPi7id2DzJFDYuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XkRoALacc34d2ZZSuZfeEFNQtz+pvHGV6NcKaB2vzAbmUIVDvaC8tRxDIahBreeMGlRibRI1eL1fiBW3FR3Q9K848j43fCoJaV+CVCtA1q5rKWxHE4DVi9mX8CpWhnWM27NvOyREfK4YkmUircND1fOazLnwY1ATlijwz2D8cP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: D5T64hA0TRON5uuxvF4OSw==
X-CSE-MsgGUID: RigfFxLOTQWRd2lXgQPYuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45503784"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45503784"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 05:28:39 -0700
X-CSE-ConnectionGUID: V7WAbuhdRRaCz1Fu5rD9lg==
X-CSE-MsgGUID: cnCsxASrQrSUBASJDuV33w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127924698"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 05:28:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u1lac-0000000A44A-2D5l;
	Mon, 07 Apr 2025 15:28:34 +0300
Date: Mon, 7 Apr 2025 15:28:34 +0300
From: Andy Shevchenko <andy@kernel.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	julia.lawall@inria.fr, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org
Subject: Re: [PATCH v4] staging: rtl8723bs: Use % 4096u instead of & 0xfff
Message-ID: <Z_PE8usXhpLJ4sTd@smile.fi.intel.com>
References: <Z/NxGilPLPy7KSQ3@ubuntu>
 <2025040757-clergyman-finalist-0c63@gregkh>
 <2025040752-unrefined-labored-8c8c@gregkh>
 <20250407132115.11ded3d9@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407132115.11ded3d9@pumpkin>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 07, 2025 at 01:21:15PM +0100, David Laight wrote:
> On Mon, 7 Apr 2025 08:53:30 +0200
> Greg KH <gregkh@linuxfoundation.org> wrote:
> > On Mon, Apr 07, 2025 at 08:36:35AM +0200, Greg KH wrote:
> > > On Mon, Apr 07, 2025 at 06:30:50AM +0000, Abraham Samuel Adekunle wrote:  

<snip>

> > > > -				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
> > > > +				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 4096u;  
> > > 
> > > I do not see a modulo operation here, only another & operation.
> > >   
> > > >  				pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
> > > >  
> > > >  				SetSeqNum(hdr, pattrib->seqnum);
> > > > @@ -963,11 +963,11 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
> > > >  					if (SN_LESS(pattrib->seqnum, tx_seq)) {
> > > >  						pattrib->ampdu_en = false;/* AGG BK */
> > > >  					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
> > > > -						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
> > > > +						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&4096u;  
> > > 
> > > This also looks odd, nothing is being "AND" here, it's an address value
> > > being set (and an odd one at that, but that's another issue...)  
> > 
> > Sorry, no, I was wrong, it is being & here, but not %.  My fault,
> > the lack of spaces here threw me.
> 
> It is still wrong '& 0xfff' => '% 4096u'.

Why?

> But it is all rather pointless especially if you can't test it.

> Plausibly more useful would be to find ALL of the uses of 0xfff/4096 (I suspect
> there is an array lurking somewhere) and change them to use the same constant.
> But you need to be able to test the changes - or at least discover that
> they make absolutely no difference to the generated object code.

The problem with &, it's not non-power-of-2 tolerable solution. Also using
hexadecimal there is not so helpful as when we are talking about sequences
(or indices in the circular buffer), the decimal makes more sense.

-- 
With Best Regards,
Andy Shevchenko


