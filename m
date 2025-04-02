Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B75A1F151B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 20:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743626073; cv=none; b=BiVJPd6QgKzIFJc6n5+ySYEuPz6kJD85zAXNamfbQPJtO5WS7MkIZTX1gsItHJj1aIKSOWMq93g3wzPGCPUncI/lX1+7caDHo3UCvmIBquqJK/tLr36JztAsZIOvz7QASIxIFUgRFH7GEO5LY7XDvgKmBUH3Tvn3S+zg87R/W7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743626073; c=relaxed/simple;
	bh=t13ChJdfZcyB2oLRzhdA1SW3Z11asTQR/3qPJS36vrQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GcnC+BJhxNXNau7TAP4FoPqLjwpPGJ3THtF3SePa4tq0k5VPSaU7Y0cGtWB5zLPwFKa2s7+0Lrlpg7jO8ZpU7xbQEU/HXPwAmger2xDAe90ySR5ABxSrUuxHPaVQLCJXMStJgAmaJiSlWEondzxHJYXbjgpk6cQW5ONrAo6GvIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=S1+tUC9c; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="S1+tUC9c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=YdY9NjVGP/c1hDSuiBo1YTsoSfUzfjUsbe9MkbnllRs=;
  b=S1+tUC9cZfGverL42ZTwQZe9danfPE1Xj4d6YVvA0CIMVw7AcQup82XI
   Lbp47wdADR0WX8I4+QVWcysWP5phXr3u9tM2HFBqHQSpzJZOipPpKZ3fQ
   lTZvuLHG77uOBCyNQWSYxsFOUxsFPK9KNQKpZcx16dQOhypn6fd9YfTYa
   Y=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.15,183,1739833200"; 
   d="scan'208";a="216085620"
Received: from powered-by.xenosite.net (HELO hadrien) ([89.255.17.162])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 22:34:23 +0200
Date: Wed, 2 Apr 2025 22:34:22 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Greg KH <gregkh@linuxfoundation.org>
cc: Erick Karanja <karanja99erick@gmail.com>, outreachy@lists.linux.dev, 
    philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] staging: rtl8723bs: Modify struct rx_pkt_attrib
 attribute bdecrypted
In-Reply-To: <2025040215-confusing-sibling-f99f@gregkh>
Message-ID: <3c235d91-efd6-ddf8-7c9-d8d35c7585@inria.fr>
References: <cover.1743613025.git.karanja99erick@gmail.com> <00287fa9f40c643b8451a0d2df8e2fb97235ee46.1743613025.git.karanja99erick@gmail.com> <2025040215-confusing-sibling-f99f@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2051585220-1743626063=:3363"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2051585220-1743626063=:3363
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Wed, 2 Apr 2025, Greg KH wrote:

> On Wed, Apr 02, 2025 at 08:16:42PM +0300, Erick Karanja wrote:
> > Standardize boolean representation by ensuring consistency,
> > replace instances of 1/0 with true/false where boolean logic is implied,
> > as some definitions already use true/false.
> > This improves code clarity and aligns with the kernel’s bool type usage.
> >
> > Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_recv.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> > index a389ba5ecc6f..fd04dbacb50f 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> > @@ -1358,7 +1358,7 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
> >  			u8 *mgmt_DATA;
> >  			u32 data_len = 0;
> >
> > -			pattrib->bdecrypted = 0;
> > +			pattrib->bdecrypted = false;
>
> but bdecrypted is a u8, not a boolean type.  So setting it to "false"
> does not seem correct here, right?

Is false different than 0?

Elsewhere there is an assignment to true.

julia

>
> Also, the name of the variable should really be changed.
>
> But, step back, are you _SURE_ you can change this structure at all?
> At a quick glance it kind of looks like it comes directly from the
> hardware, or am I mis-reading the driver code?
>
> Have you tested this series on an actual device?
>
> thanks,
>
> greg k-h
>
>
--8323329-2051585220-1743626063=:3363--
