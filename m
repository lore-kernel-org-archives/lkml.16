Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1BA320F
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 07:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746170227; cv=none; b=udzjohKJBuk5MLEYPByncPdWDheaUwHFhE0tlpEs9ypZWYl81PRr/kxCVQTEj5IbDNy4giBzTY20P1is6bJECl1CYxd5XEkmpjkF43pKkoTukdX8PE+93Vjk5oFvG6zQjoJoKwgGaK+7hySaoSGXBH9pwK03RJ/XCyAoAegRWeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746170227; c=relaxed/simple;
	bh=tQvp3NxwC/YEco1LbxJCrlsE1/zq81i5Juvdy/z8NGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JS7cWE735qOJaJk0CcTGjPHZrAqesUqb+wSOdbMMgG8qLTr3rot42/wXQKNzYNy6YgbaMHDV1zLQyAbGYsWbzPk7NPe6wA7lQdauYP18w7zflbCLrNG79kFq9GpPh9edCSg6g+RRdoPPkt2kjkAC3A4cSOvIpgvfDS4GRfwCEQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=P671J4yh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="P671J4yh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A36C4CEE4;
	Fri,  2 May 2025 07:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746170225;
	bh=tQvp3NxwC/YEco1LbxJCrlsE1/zq81i5Juvdy/z8NGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P671J4yhg2htogLz49Z4PTn8h5Ats3uSMKbNO9BpBO+H51icN7goa2Gl+EDXw4PLf
	 Zb+7M/NuJVuuxgbMbc5WZ2jel3goKT1jmW7wzU6CGIjffEtOUQQNosfUylckv2QOA8
	 M3H3MziFgQrqcCnXUR7lQjlwSYiuJTQklnNZsrlU=
Date: Fri, 2 May 2025 09:17:02 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Gupta, Nipun" <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] cdx: MAINTAINERS: Explicitly mention Greg who
 handles patches
Message-ID: <2025050249-cufflink-renegade-7eef@gregkh>
References: <20250430-cdx-clean-v2-0-7dbfda9364a9@linaro.org>
 <20250430-cdx-clean-v2-6-7dbfda9364a9@linaro.org>
 <2025050158-tingly-doubling-9795@gregkh>
 <45859218-1bde-48e9-bdcf-4ec94fbd47a6@linaro.org>
 <86cd570d-416a-49ab-84e3-6bf54873f8eb@linaro.org>
 <c2644e83-89b5-baad-005a-ed578200d956@amd.com>
 <1039be19-bcb3-4fec-afe7-ce4c217a3753@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1039be19-bcb3-4fec-afe7-ce4c217a3753@linaro.org>

On Fri, May 02, 2025 at 08:57:12AM +0200, Krzysztof Kozlowski wrote:
> On 02/05/2025 08:52, Gupta, Nipun wrote:
> > 
> > 
> > On 02-05-2025 11:57, Krzysztof Kozlowski wrote:
> >> On 01/05/2025 18:06, Krzysztof Kozlowski wrote:
> >>> On 01/05/2025 17:59, Greg Kroah-Hartman wrote:
> >>>> On Wed, Apr 30, 2025 at 08:41:34PM +0200, Krzysztof Kozlowski wrote:
> >>>>> Patches for CDX bus drivers are applied by Greg Kroah-Hartman, so list
> >>>>> him in the maintainers entry because otherwise contributors would be
> >>>>> surprised their patches got lost.
> >>>>>
> >>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>>> ---
> >>>>>   MAINTAINERS | 1 +
> >>>>>   1 file changed, 1 insertion(+)
> >>>>>
> >>>>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>>>> index b2c3be5f6131432647dd01f22bbf4bf1c8bde9e6..505d7d45ad7d1c007e89a555264ff8cbeaf6e1f4 100644
> >>>>> --- a/MAINTAINERS
> >>>>> +++ b/MAINTAINERS
> >>>>> @@ -1008,6 +1008,7 @@ F:	Documentation/devicetree/bindings/w1/amd,axi-1wire-host.yaml
> >>>>>   F:	drivers/w1/masters/amd_axi_w1.c
> >>>>>   
> >>>>>   AMD CDX BUS DRIVER
> >>>>> +M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >>>>
> >>>> Sorry, but no, I'm not the maintainer of this driver.  It's up to the
> >>>> maintainer(s) of it to send me the patches on to be merged, it is not up
> >>>> to me to maintain the code at all.
> >>>>
> >>> Sure, I understand. I  will send a v3 without maintainers patch and I
> >>> assume the maintainers will pick them up (unless drivers are orphaned).
> >>
> >>
> >> And now I found this:
> >> https://lore.kernel.org/lkml/929198a2-6b3b-0f1b-3f36-cd8955ca6f19@amd.com/
> >>
> >> "We do not maintain a tree and  patches go via Greg's tree."
> >>
> >> which means that patches won't be picked up. Your email does not pop up
> >> on b4/get_maintainers. Overall this means cdx driver might be abandoned,
> >> from contributors point of view.
> > 
> > We usually copy Greg once the patches are reviewed/acked from our side 
> > if he is not already on the list. Do you suggest any alternate approach 
> > in maintaining the drivers like cdx which do not have their own tree?
> 
> 
> Either you have the tree or person having the tree appears on
> maintainers output. There is no other option.

What?  No, we do this for many subsystems already.  Look at the entry
for "USB TYPEC BUS FOR ALTERNATE MODES" as one simple example.  The
patches go to the list, Heikki reviews them and if he says "ack" or
"signed-off-by" then I pick them up and add them to my tree and away the
patch goes.

That last bit is NOT explicitly documented in MAINTAINERS as it does not
need to be (otherwise you will have too many lines in that file).  This
is just one more subsystem that does it this way, not a big deal.

> If you refuse to take the patches and handle them, I claim this is
> orphaned from the kernel point of view, even if occasionally Greg takes
> these. I believe Greg was already pointing this issue more than once.

They are "handling" them in that they are reviewing them when they get
the chance and then I need to then pick them up.  Again, totally normal.

I will not dispute the fact that this is confusing for submitters, and
maybe the cdx maintainers need to get a tree and start doing more work,
but I am NOT going to be the one telling any maintainer to do more work
than they are willing to do as that would just be rude :)

thanks,

greg k-h
