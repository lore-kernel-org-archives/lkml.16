Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BE529408;
	Thu,  3 Apr 2025 13:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743688529; cv=none; b=kO3WhnulGmtBmhH+8WGN93L1XvTU4/R9r48ZFg6mq5vuHYN67kzD+LPehM9AW+J7u+9y3WM2Zt8Y+hyIYHeYnEWdQ17zEV5xNl9f4AzoXwb+JWaZSEheVg3QxXGOVZpDb9J/ug9pAdmyYSBZRY4mi1pvGsApAZZa0/qQVZE9jkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743688529; c=relaxed/simple;
	bh=jMcUJTuyrHqWUvUZgo2jQWpaqg+ikyXlBK4xmCiiM6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OpwsKuv3hXD18Fx/mYT8zzPKSjYAP2GmtHX4XlMZWUOlGj4OQFGFrmK4nj6hqjhc7aXuJLGX3LJOg2RPTBrWuxo83kkiOVHoFMGUZJzxN+otiy3JvUPgDyBNAqEOObdx3GKaMCmdeb0xZCXOLALGaJdhxph3ZzhX5tuk1sKdonE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cQKTeSgb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cQKTeSgb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E61F5C4CEE5;
	Thu,  3 Apr 2025 13:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743688529;
	bh=jMcUJTuyrHqWUvUZgo2jQWpaqg+ikyXlBK4xmCiiM6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cQKTeSgbgRY4KNuIF5I2rjU5L/WvPQkY7n0cgDO4/bwmQa/hoE6Evnn8CTudbbHfg
	 stJuWukj0FZwXyJinzNI7pfWwiNrCos5e9LbpE9Xhw5bG7NZvmCMPX3vTQAwaMi6mh
	 mPLR65P/cdOl00ewRLIAYmtSRoJlkNk+usLn57T0=
Date: Thu, 3 Apr 2025 14:54:01 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Samuel Abraham <abrahamadekunle50@gmail.com>
Cc: Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: modify struct field to use standard
 bool type
Message-ID: <2025040304-overdrive-snugness-8b05@gregkh>
References: <Z+05IEjV3pczMLNQ@HP-650>
 <4c35ae41-c834-e25a-ccab-5cdd34aa4680@inria.fr>
 <CADYq+faUTmNcUgk5jB3YHT4UCQZhf=Wsah1WUcPHqky6kp_cUA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADYq+faUTmNcUgk5jB3YHT4UCQZhf=Wsah1WUcPHqky6kp_cUA@mail.gmail.com>

On Thu, Apr 03, 2025 at 10:33:49AM +0100, Samuel Abraham wrote:
> On Thu, Apr 3, 2025 at 6:06 AM Julia Lawall <julia.lawall@inria.fr> wrote:
> >
> >
> >
> > On Wed, 2 Apr 2025, Abraham Samuel Adekunle wrote:
> >
> > > The struct field uses the uint values 0 and 1 to represent false and
> > > true values respectively.
> > >
> > > Convert cases to use the bool type instead to conform to Linux
> > > coding styles and ensure consistency.
> >
> > This is vague.  Ensure consistency with what?  You can point out that true
> > or false was already being used elsewhere in the code.
> >
> > >
> > > reported by Coccinelle:
> > >
> > > Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
> > > ---
> > >  drivers/staging/rtl8723bs/core/rtw_ap.c      | 2 +-
> > >  drivers/staging/rtl8723bs/include/sta_info.h | 2 +-
> > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
> > > index ed6942e289a5..82f54f769ed1 100644
> > > --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> > > +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> > > @@ -389,7 +389,7 @@ void update_bmc_sta(struct adapter *padapter)
> > >               psta->qos_option = 0;
> > >               psta->htpriv.ht_option = false;
> > >
> > > -             psta->ieee8021x_blocked = 0;
> > > +             psta->ieee8021x_blocked = false;
> > >
> > >               memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo_stats));
> > >
> > > diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/staging/rtl8723bs/include/sta_info.h
> > > index b3535fed3de7..63343998266a 100644
> > > --- a/drivers/staging/rtl8723bs/include/sta_info.h
> > > +++ b/drivers/staging/rtl8723bs/include/sta_info.h
> > > @@ -86,7 +86,7 @@ struct sta_info {
> > >       uint qos_option;
> > >       u8 hwaddr[ETH_ALEN];
> > >
> > > -     uint    ieee8021x_blocked;      /* 0: allowed, 1:blocked */
> > > +     bool ieee8021x_blocked;
> 
> > You should also check whether this is a structure that is read from the
> > hardware.  In that case, it would be a concern if the bool field does not
> > have the same size as the uint one.
> Hello Julia
> So following the conversation here,
> https://lore.kernel.org/outreachy/bf8994cc-b812-f628-ff43-5dae8426e266@inria.fr/T/#u
> I was able to compare the assembly code of the file before and after
> my patch and this were my findings
> 
> Original assembly code for
> # drivers/staging/rtl8723bs/core/rtw_ap.c:392    psta->ieee8021x_blocked = 0;
> movl  $0, 436(%r12)    #,  psta->ieee8021x_blocked
> 
> Assembly Code After Patch
> # drivers/staging/rtl8723bs/core/rtw_ap.c:392
> psta->ieee8021x_blocked = false;
> movb  $0, 434(%r12)    #,  psta->ieee8021x_blocked

So the structure size changed?  That's not good at all, and is what I
was worried about :(

Also, the tool 'pahole' might help out here to verify what exactly
changed, if you want to dig in further here.

thanks,

greg k-h
