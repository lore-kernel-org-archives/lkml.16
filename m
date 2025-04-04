Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D43F1F94C;
	Fri,  4 Apr 2025 08:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743753746; cv=none; b=i+bQt3Xq0e4y1KbJ++WtoFgYOiQv3a3Qukok6WqEaD61j7+fQdgNKhHbEHoV/60V9riX8k0zOJsaMoKiW7RkUoy2eSf6R6pZtfENejiKTgAG+hSmDCrNaULVjg3PfDNcRcwVBxpFsucSd+agsfeJZrSqz/+QjMBYjD20UM9XJ0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743753746; c=relaxed/simple;
	bh=E8C0LD9acvN2S2Nm7WLqkEC4F/RvxUV/p8KPGrrhyJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kXs+UPeE3FmLOEQApKTfs1lA48dYR5CSs/j+GRlvTjBnYQVMkAbVF2hxrHxYiFsJE4y609p7AUhcTUaIulHDu9NVaQ12BvBdioFdH278E3qKu01AwWHrj7LgfMxxyjUUeu2p0OFPNua1PMU/H9appd+4CXdhEWb1gd8CLZ9U59g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QUkAX3Ut; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QUkAX3Ut"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAD19C4CEE5;
	Fri,  4 Apr 2025 08:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743753746;
	bh=E8C0LD9acvN2S2Nm7WLqkEC4F/RvxUV/p8KPGrrhyJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QUkAX3UtWsiiz73bMdKQwda5ZIvsR4KA3USkPWQSYoFy4OAozSoSMATbBR23qoopi
	 mWqCcjUjSKfgFNmoW7V9YsQ5znAQkBk9Cvj58c5/n9GvEBZ+GySlfRY2FRYjarYuoX
	 5cIAvJ+oTcQTiUyHfbx01qxQnO2nT33bl3/R26GE=
Date: Fri, 4 Apr 2025 09:00:57 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Erick Karanja <karanja99erick@gmail.com>
Cc: Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev,
	philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] staging: rtl8723bs: Modify struct rx_pkt_attrib
 attribute bdecrypted
Message-ID: <2025040440-provolone-uncertain-77a0@gregkh>
References: <cover.1743613025.git.karanja99erick@gmail.com>
 <00287fa9f40c643b8451a0d2df8e2fb97235ee46.1743613025.git.karanja99erick@gmail.com>
 <2025040215-confusing-sibling-f99f@gregkh>
 <3c235d91-efd6-ddf8-7c9-d8d35c7585@inria.fr>
 <2025040246-series-tusk-bec1@gregkh>
 <cebaec5995fd21c429160b30795e03c2caa29cef.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cebaec5995fd21c429160b30795e03c2caa29cef.camel@gmail.com>

On Fri, Apr 04, 2025 at 09:58:23AM +0300, Erick Karanja wrote:
> On Wed, 2025-04-02 at 21:41 +0100, Greg KH wrote:
> > On Wed, Apr 02, 2025 at 10:34:22PM +0200, Julia Lawall wrote:
> > > 
> > > 
> > > On Wed, 2 Apr 2025, Greg KH wrote:
> > > 
> > > > On Wed, Apr 02, 2025 at 08:16:42PM +0300, Erick Karanja wrote:
> > > > > Standardize boolean representation by ensuring consistency,
> > > > > replace instances of 1/0 with true/false where boolean logic is
> > > > > implied,
> > > > > as some definitions already use true/false.
> > > > > This improves code clarity and aligns with the kernel’s bool
> > > > > type usage.
> > > > > 
> > > > > Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> > > > > ---
> > > > >  drivers/staging/rtl8723bs/core/rtw_recv.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c
> > > > > b/drivers/staging/rtl8723bs/core/rtw_recv.c
> > > > > index a389ba5ecc6f..fd04dbacb50f 100644
> > > > > --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> > > > > +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> > > > > @@ -1358,7 +1358,7 @@ static signed int
> > > > > validate_80211w_mgmt(struct adapter *adapter, union recv_frame
> > > > >  			u8 *mgmt_DATA;
> > > > >  			u32 data_len = 0;
> > > > > 
> > > > > -			pattrib->bdecrypted = 0;
> > > > > +			pattrib->bdecrypted = false;
> > > > 
> > > > but bdecrypted is a u8, not a boolean type.  So setting it to
> > > > "false"
> > > > does not seem correct here, right?
> > > 
> > > Is false different than 0?
> > 
> > Does C guarantee that?  I can never remember.  I don't think it
> > guarantees that a 'bool' will only be 8 bits, or am I mistaken there
> > too?
> > 
> > > Elsewhere there is an assignment to true.
> > 
> > Was that in the original driver?
> > 
> > If this doesn't come from the hardware, then it's fine to make the
> > change.  If it does, it needs to be verified that the layout and bit
> > values are identical.
> > 
> > thanks,
> I have compared the generated assembly code
> before and after and I have observed the only
> change is the comment below.
> -# drivers/staging/rtl8723bs/core/rtw_recv.c:1361:
>  			pattrib->bdecrypted = 0;
> +# drivers/staging/rtl8723bs/core/rtw_recv.c:1361:
>  			pattrib->bdecrypted = false;
> There is no change in the assembly instructions.

Showing the assembly is key, not just a comment :)
