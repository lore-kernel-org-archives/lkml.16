Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3711A8401
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 21:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743627775; cv=none; b=uSWofpExZd1ezXCohP+3sW4CKmGQs3OFmYpKTHS154ALZ27XgxfmjNNQTNR0KlYstSFMoikG3ltw7SdbA99AaY1/D71ICRMEypRwlIN0EV9TfUN5kyINMkEJ6TpEqo989Z6F/V+c062P8gLlcaJlNJZ+fT57yqhJO1MeqOLR2Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743627775; c=relaxed/simple;
	bh=xTIyxS9AQsED4zOvaAeCk6g+wX8dHY/2+iJVfBnAPOY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cZzcimJZpSmOhR+QA675XT56n8sVAnP1AvaRqMIAik3YGIm527u+vNZ5Quulh+vqOu38n+dwWNob6bAIivs3WVXha71EHgI93JfpeQCjGrGSjhCI48m9b+/7MFW5avk2MMvPubaNPNP9nyWO2Ops1RaHITlc7HSLHJ5pDat67g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=aBpXsnA+; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="aBpXsnA+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=8k4fpSuLY7YZgX4IRqPtLSuKZAl28If6nJmBbP/UrL8=;
  b=aBpXsnA+EsfhqvkYWak5pCo+1agam0dTtQVfFCiLCWo4Ccd78ZyAqsWv
   fuv/NlhxG2EoJQJFEekpIIeIqHnGq7YlS9Ue7v42eOKXoO2mDT3ORQwKX
   9IVe+SpFda/IUTdNMGxQfWTA7cer4FhXW4yoSYR7HyAfjmTkxzypHLX/R
   4=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.15,183,1739833200"; 
   d="scan'208";a="216087345"
Received: from powered-by.xenosite.net (HELO hadrien) ([89.255.17.162])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 23:02:50 +0200
Date: Wed, 2 Apr 2025 23:02:50 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Greg KH <gregkh@linuxfoundation.org>
cc: Julia Lawall <julia.lawall@inria.fr>, 
    Erick Karanja <karanja99erick@gmail.com>, outreachy@lists.linux.dev, 
    philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] staging: rtl8723bs: Modify struct rx_pkt_attrib
 attribute bdecrypted
In-Reply-To: <2025040246-series-tusk-bec1@gregkh>
Message-ID: <bf8994cc-b812-f628-ff43-5dae8426e266@inria.fr>
References: <cover.1743613025.git.karanja99erick@gmail.com> <00287fa9f40c643b8451a0d2df8e2fb97235ee46.1743613025.git.karanja99erick@gmail.com> <2025040215-confusing-sibling-f99f@gregkh> <3c235d91-efd6-ddf8-7c9-d8d35c7585@inria.fr>
 <2025040246-series-tusk-bec1@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-6877068-1743627771=:3363"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-6877068-1743627771=:3363
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Wed, 2 Apr 2025, Greg KH wrote:

> On Wed, Apr 02, 2025 at 10:34:22PM +0200, Julia Lawall wrote:
> >
> >
> > On Wed, 2 Apr 2025, Greg KH wrote:
> >
> > > On Wed, Apr 02, 2025 at 08:16:42PM +0300, Erick Karanja wrote:
> > > > Standardize boolean representation by ensuring consistency,
> > > > replace instances of 1/0 with true/false where boolean logic is implied,
> > > > as some definitions already use true/false.
> > > > This improves code clarity and aligns with the kernel’s bool type usage.
> > > >
> > > > Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> > > > ---
> > > >  drivers/staging/rtl8723bs/core/rtw_recv.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> > > > index a389ba5ecc6f..fd04dbacb50f 100644
> > > > --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> > > > +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> > > > @@ -1358,7 +1358,7 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
> > > >  			u8 *mgmt_DATA;
> > > >  			u32 data_len = 0;
> > > >
> > > > -			pattrib->bdecrypted = 0;
> > > > +			pattrib->bdecrypted = false;
> > >
> > > but bdecrypted is a u8, not a boolean type.  So setting it to "false"
> > > does not seem correct here, right?
> >
> > Is false different than 0?
>
> Does C guarantee that?  I can never remember.  I don't think it
> guarantees that a 'bool' will only be 8 bits, or am I mistaken there
> too?
>
> > Elsewhere there is an assignment to true.
>
> Was that in the original driver?

Yes:

git blame -L 436,436 drivers/staging/rtl8723bs/core/rtw_recv.c

554c0a3abf216 (Hans de Goede 2017-03-29 19:47:51 +0200 436)
prxattrib->bdecrypted = true;

> If this doesn't come from the hardware, then it's fine to make the
> change.  If it does, it needs to be verified that the layout and bit
> values are identical.

Erick, you can see if the generated assembly code is the same before and
after the same.  You can see that with
make drivers/staging/rtl8723bs/core/rtw_recv.s

julia
--8323329-6877068-1743627771=:3363--
