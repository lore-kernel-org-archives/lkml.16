Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D39C145355;
	Mon,  7 Apr 2025 06:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744008901; cv=none; b=Tyd/JEA2aOMRPitaxjCJp45jp3uEtGIZe3OLdhoSuyWku/N4XhqtR+rKq2n+1y7NB4H3jt9ldjWSXd5JWz5xfEzba09BMyug9fhfZfiEi6+70BnohceFG9w6aHUoMWzemK4cNSTdyvDsjSPLwQAMX/i812AIka/cLI7zvmBnkB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744008901; c=relaxed/simple;
	bh=db+GTmg1rbPAfKbLONYsRWU+hDGxCL9xkdh/uMlcal4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TiGla05qyRT6VfuMSa+H1yvpiaN6o1WEKRiDZnsh4iaZMjF1yoqHG418WNtQGA6EjIE7TXIaM2BMMpe0kXWGJmBVkVnPerbslA+Sd4O3BwLtlMQIBjb6Wl3rcT5YEcnVFdK/cNjSGMYDsL1vJP41+i8WUvPou+Qa2zp/DTe5jEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SiDqloZM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SiDqloZM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49FCCC4CEDD;
	Mon,  7 Apr 2025 06:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744008900;
	bh=db+GTmg1rbPAfKbLONYsRWU+hDGxCL9xkdh/uMlcal4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SiDqloZMntHaHxxa5eSLdbt+6FISVHUxkYnUbDnV7fQgpx0RNCiRFZS3Bht0kbUAy
	 WeWQT4bkq6w+PIdwEFXeq+vj5/wqELKkj/8AekEUnFreh8Vqy4jtrphe0W3uyu4X3V
	 MoLnGPtvcDCXTIti94AN79/74KV8JjyGw23JRk1A=
Date: Mon, 7 Apr 2025 08:53:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: julia.lawall@inria.fr, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org, andy@kernel.org,
	david.laight.linux@gmail.com
Subject: Re: [PATCH v4] staging: rtl8723bs: Use % 4096u instead of & 0xfff
Message-ID: <2025040752-unrefined-labored-8c8c@gregkh>
References: <Z/NxGilPLPy7KSQ3@ubuntu>
 <2025040757-clergyman-finalist-0c63@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025040757-clergyman-finalist-0c63@gregkh>

On Mon, Apr 07, 2025 at 08:36:35AM +0200, Greg KH wrote:
> On Mon, Apr 07, 2025 at 06:30:50AM +0000, Abraham Samuel Adekunle wrote:
> > The sequence number is constrained to a range of [0, 4095], which
> > is a total of 4096 values. The bitmask operation using `0xfff` is
> > used to perform this wrap-around. While this is functionally correct,
> > it obscures the intended semantic of a 4096-based wrap.
> > 
> > Using a modulo operation with `4096u` makes the wrap-around logic
> 
> <snip>
> 
> > -				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
> > +				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 4096u;
> 
> I do not see a modulo operation here, only another & operation.
> 
> >  				pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
> >  
> >  				SetSeqNum(hdr, pattrib->seqnum);
> > @@ -963,11 +963,11 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
> >  					if (SN_LESS(pattrib->seqnum, tx_seq)) {
> >  						pattrib->ampdu_en = false;/* AGG BK */
> >  					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
> > -						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
> > +						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&4096u;
> 
> This also looks odd, nothing is being "AND" here, it's an address value
> being set (and an odd one at that, but that's another issue...)

Sorry, no, I was wrong, it is being & here, but not %.  My fault,
the lack of spaces here threw me.

thanks,

greg k-h
