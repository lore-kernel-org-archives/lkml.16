Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57474C7F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 04:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751432380; cv=none; b=LWkNrvu+D5ezEk8fjvBr/cplBUMLkKEDU6unULWsMC6aGATUmzLUBPdY8bE8T6HYiLOxzOYJQ2Qlf/0n/Wo2aXCk+Ki0IUCHW85j0f1mDJshSrxowTgnA+FI4GsTKWv0E++Sy7tRqsUuvSSD3ksRW4XmvruF1zhNAVhRZeBewCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751432380; c=relaxed/simple;
	bh=R7+aLc9/U+umTHHMzGua9NIDU7Kxfs2gE2lwsZ72jsk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=Jy++vlZ3og0tqD7WVvcsUN+BfohT4OaJhtXoDxfevDpozA1XXBA2jvzz8ZNp6QZo2J/a3tQEZMDCHpS3uO1cxqcemaWfrS/B/gXB7hp6qp2WjAo+ok0Rg/bZBxu3hKUYo3mC/I1dsjKM65Ds+efGxxO0ie76fHYQOSqzXm8pg7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=q+zSjsik; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="q+zSjsik"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250702045933epoutp0157c19b52d9e30e375445c019d50bc8b5~OVnbiom6a0085300853epoutp01N
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 04:59:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250702045933epoutp0157c19b52d9e30e375445c019d50bc8b5~OVnbiom6a0085300853epoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751432373;
	bh=KGjwLcs04Md+DMRIwwBdUpoAbzxYSvRIXkhW1M49kck=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=q+zSjsikqKNjIdlL8KWnj0WOvd/cQFsbFPA0zhe2H0LZNCqsKxKtwNylDFFo22jm5
	 a5EjUMalo5zG6fwFh3x8XJPt2v8qguRdHRVe1wrfIBxwaGvUXwVNA0fGDVYx5ukrwW
	 /D52jnEE+1IDSIH779DnJVGeoc7SPTSZvGkMgZ14=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250702045933epcas2p4f1f10a6b0579532430f51f589f2fffb5~OVnbBKApS2940029400epcas2p4A;
	Wed,  2 Jul 2025 04:59:33 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.70]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bX73m2Z1qz3hhTG; Wed,  2 Jul
	2025 04:59:32 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250702045931epcas2p2817e5e08fbc07afd7418dcf296b93beb~OVnZxTJIQ2974529745epcas2p2s;
	Wed,  2 Jul 2025 04:59:31 +0000 (GMT)
Received: from ubuntu (unknown [10.229.95.128]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250702045931epsmtip21019cd1bc071adf164f6d6a49f5fdc0e~OVnZvo_JW2473324733epsmtip2v;
	Wed,  2 Jul 2025 04:59:31 +0000 (GMT)
Date: Wed, 2 Jul 2025 14:11:16 +0900
From: Jung Daehwan <dh10.jung@samsung.com>
To: Guan-Yu Lin <guanyulin@google.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 0/4] Support system sleep with offloaded usb
 transfers
Message-ID: <20250702051116.GA48861@ubuntu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAOuDEK3+=FVj2zrajjqsWamqCEx5-0v+dSS=gRLYyO_8YdEy1Q@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CMS-MailID: 20250702045931epcas2p2817e5e08fbc07afd7418dcf296b93beb
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----6jEij.O31.-jx_HPxteO2QVWZmGJ3cE9whrRgeUheTDLThxq=_14b85a_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250702043313epcas2p4a44401b5ae8930e625c22209bca2dd54
References: <20250604082449.2029156-1-guanyulin@google.com>
	<2025060407-geologic-excuse-9ca5@gregkh>
	<CAOuDEK1471toXVEiNySQtmrRTSPwzo840Q2d5pw9M4fCOfsgTg@mail.gmail.com>
	<2025061957-daylong-legal-fed1@gregkh>
	<CAOuDEK1mY7++0NxRYR_+fhQB5+74KB-=MHhk4Dx3cpD6XrG93A@mail.gmail.com>
	<CGME20250702043313epcas2p4a44401b5ae8930e625c22209bca2dd54@epcas2p4.samsung.com>
	<CAOuDEK3+=FVj2zrajjqsWamqCEx5-0v+dSS=gRLYyO_8YdEy1Q@mail.gmail.com>

------6jEij.O31.-jx_HPxteO2QVWZmGJ3cE9whrRgeUheTDLThxq=_14b85a_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

On Wed, Jul 02, 2025 at 12:33:00PM +0800, Guan-Yu Lin wrote:
> On Tue, Jul 1, 2025 at 11:05 PM Guan-Yu Lin <guanyulin@google.com> wrote:
> >
> > On Thu, Jun 19, 2025 at 5:27 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Wed, Jun 04, 2025 at 08:32:00PM +0800, Guan-Yu Lin wrote:
> > > > On Wed, Jun 4, 2025 at 6:56 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > On Wed, Jun 04, 2025 at 08:23:06AM +0000, Guan-Yu Lin wrote:
> > > > >
> > > > > Is there a reason you aren't cc:ing the developers from a "big android
> > > > > device company" that is currently testing and finding problems with this
> > > > > patchset in their device testing?  I will require their signed-off-by or
> > > > > tested-by in order to even consider accepting this patch series based on
> > > > > the issues they seem to be finding with it in an
> > > > > internal-company-bug-reporting-platform that I seem to be also copied
> > > > > on.
> > > > >
> > > > > thanks,
> > > > >
> > > > > greg k-h
> > > >
> > > > I'm not sure if the company wants to reveal its testing right now
> > > > since the company raised the problem with the internal system. Hence,
> > > > we still use the internal system to communicate with them. We
> > > > understand that "signed-off-by"/"tested-by" tags are required to merge
> > > > the code, so we'll keep working closely with multiple companies to
> > > > achieve this.
> > >
> > > Great, please do so for the next version you post.
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > Hi Wesley,
> >
> > Right now the system sleep with offloaded usb transfers feature is
> > pretty much settled. I was wondering if you could test the patch on
> > your platform? Thanks!
> >
> > Regards,
> > Guan-Yu
> 
> Hi Jung,
> 
> I noticed that you've adapted the latest sideband design for audio
> offload in your system. I was wondering if you could adapt this
> patchset as well to further enable offloaded usb transfers during
> system suspend? Thanks!
> 
> Regards,
> Guan-Yu
> 

Hi Guan,

We can't adapt this patchset on Exynos platform now. My co-worker currently
analyzing it, and it might take some time.

Best Regards,
Daehwan Jung

------6jEij.O31.-jx_HPxteO2QVWZmGJ3cE9whrRgeUheTDLThxq=_14b85a_
Content-Type: text/plain; charset="utf-8"


------6jEij.O31.-jx_HPxteO2QVWZmGJ3cE9whrRgeUheTDLThxq=_14b85a_--
