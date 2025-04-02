Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE1D2E3385;
	Wed,  2 Apr 2025 20:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743626605; cv=none; b=Ls4ptAdRvisjhOQM6EXurlOsHP+twNc+PPrQyD5XgnpRQNDcwh56SWANEcQmnWTd1JIqw+PEyfhZs1d+z5adPp2tTlgCOts7bGdui2YVMi3bli4rNuy5lTh5gY8Pe79MplMd2Ts2A5e9Mlwj63jVYARKvCz6EAHyBnOS+SSk7zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743626605; c=relaxed/simple;
	bh=T/AA5lvkKLCltmvkMx0uLlEFgfjmiOxjCld5CPY4p/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gI6e+35NQb22gp2w3d7dN5c9pKsFcG2bFCOXSlJ+H8M+Zq0JtFI99Gg4iKhKRaD/U43r5Y+hIL8mgJXm6lcdBfFeKkPAss/RHUHNeGsDZPbAusaMfjWUxG4K23jhXwVlQAGRvani92oSUt1UOOO8NVhR6wplyyHCehwpK3NziBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xVlHR9r5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xVlHR9r5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7853C4CEDD;
	Wed,  2 Apr 2025 20:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743626605;
	bh=T/AA5lvkKLCltmvkMx0uLlEFgfjmiOxjCld5CPY4p/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xVlHR9r5Dhyb36sMzOmchWD+e802vwm/YKN0NqyNcnMK8uBlVTcFMPqxEbvya+AuN
	 4wm7EzM8nPKF5WMvFGYFvHryewKO02VQWjLrOhm1rXjceZ8ytAjCWFt40QzX+ZmRY1
	 j4SuOFhjGiES+clLcFHTqwKm0bsu326c6KgwmOBA=
Date: Wed, 2 Apr 2025 21:41:57 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Erick Karanja <karanja99erick@gmail.com>, outreachy@lists.linux.dev,
	philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] staging: rtl8723bs: Modify struct rx_pkt_attrib
 attribute bdecrypted
Message-ID: <2025040246-series-tusk-bec1@gregkh>
References: <cover.1743613025.git.karanja99erick@gmail.com>
 <00287fa9f40c643b8451a0d2df8e2fb97235ee46.1743613025.git.karanja99erick@gmail.com>
 <2025040215-confusing-sibling-f99f@gregkh>
 <3c235d91-efd6-ddf8-7c9-d8d35c7585@inria.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3c235d91-efd6-ddf8-7c9-d8d35c7585@inria.fr>

On Wed, Apr 02, 2025 at 10:34:22PM +0200, Julia Lawall wrote:
> 
> 
> On Wed, 2 Apr 2025, Greg KH wrote:
> 
> > On Wed, Apr 02, 2025 at 08:16:42PM +0300, Erick Karanja wrote:
> > > Standardize boolean representation by ensuring consistency,
> > > replace instances of 1/0 with true/false where boolean logic is implied,
> > > as some definitions already use true/false.
> > > This improves code clarity and aligns with the kernel’s bool type usage.
> > >
> > > Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> > > ---
> > >  drivers/staging/rtl8723bs/core/rtw_recv.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> > > index a389ba5ecc6f..fd04dbacb50f 100644
> > > --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> > > +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> > > @@ -1358,7 +1358,7 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
> > >  			u8 *mgmt_DATA;
> > >  			u32 data_len = 0;
> > >
> > > -			pattrib->bdecrypted = 0;
> > > +			pattrib->bdecrypted = false;
> >
> > but bdecrypted is a u8, not a boolean type.  So setting it to "false"
> > does not seem correct here, right?
> 
> Is false different than 0?

Does C guarantee that?  I can never remember.  I don't think it
guarantees that a 'bool' will only be 8 bits, or am I mistaken there
too?

> Elsewhere there is an assignment to true.

Was that in the original driver?

If this doesn't come from the hardware, then it's fine to make the
change.  If it does, it needs to be verified that the layout and bit
values are identical.

thanks,

greg k-h
