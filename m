Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B771FF1B5;
	Sat, 28 Jun 2025 15:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751123906; cv=none; b=eKvxRLT0euqo6vfypBnksW/fe0vzJ6I7zsBQYllEibUM32nqqEMUn+2pG2Weuun6MUiH1e/CV/W3RLoBQ/dcZlcvbgFmvMqfluquDiz4QX8OmXsnnoL1Sq19O4cfgEwgrLm+IvJUe0eRFPPdVyvldsFYvRF21v1/nb+joI4B7xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751123906; c=relaxed/simple;
	bh=Nml2PZZ7GTAN+BSXPHMDxZ1RcD8h9pkz90DQrcczXxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fim9w0mexG2S+tmN54MbOcRGyyl3+b6K3fvAHHDXc3kS2lvDKiwIyvIZpZ5BlcDprvW7xbUvWhFNWmAytRsFTD4UcqsCcTThiAaT+5h9i8nhJ4Qrz9SydWzL7cjLLrW7C92MjWDqGEMmErhxfslo5Fb8pBb3gr2tMrkcFFEFl4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ynEaHozP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ynEaHozP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C3AC4CEED;
	Sat, 28 Jun 2025 15:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751123905;
	bh=Nml2PZZ7GTAN+BSXPHMDxZ1RcD8h9pkz90DQrcczXxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ynEaHozPtGuAX1C2qvTAsG1Ient4YfMsBdm0AVZ2+3rYyn7/lRo2TMSwagtEpw/r6
	 kvBltArCMEluoZNlMZNdfUVuqyZz2TMrV0OBpxFWNBkUakmjEzaBle+M9Xp2NXcMfB
	 gMrXhCgjILDFZByAbXgRAP/SH+LL488zLE8IejL0=
Date: Sat, 28 Jun 2025 17:18:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] usb: dwc3: gadget: Fix TRB reclaim logic for short
 transfers and ZLPs
Message-ID: <2025062832-pebble-superhero-fbbc@gregkh>
References: <20250621-dwc3-fix-gadget-mtp-v1-0-a45e6def71bb@leica-geosystems.com>
 <20250621-dwc3-fix-gadget-mtp-v1-1-a45e6def71bb@leica-geosystems.com>
 <AM8PR06MB7521A29A8863C838B54987B6BC7BA@AM8PR06MB7521.eurprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AM8PR06MB7521A29A8863C838B54987B6BC7BA@AM8PR06MB7521.eurprd06.prod.outlook.com>

On Wed, Jun 25, 2025 at 07:49:16AM +0000, SCHNEIDER Johannes wrote:
> Commit 96c7bf8f6b3e ("usb: dwc3: gadget: Cleanup SG handling") updated
> the TRB reclaim path to use the TRB CHN (Chain) bit to determine whether
> a TRB was part of a chain. However, this inadvertently changed the
> behavior of reclaiming the final TRB in some scatter-gather or short
> transfer cases.
> 
> In particular, if the final TRB did not have the CHN bit set, the
> cleanup path could incorrectly skip clearing the HWO (Hardware Own)
> bit, leaving stale TRBs in the ring. This resulted in broken data
> transfer completions in userspace, notably for MTP over FunctionFS.
> 
> Fix this by unconditionally clearing the HWO bit during TRB reclaim,
> regardless of the CHN bit state. This restores correct behavior
> especially for transfers that require ZLPs or end on non-CHN TRBs.
> 
> Fixes 61440628a4ff ("usb: dwc3: gadget: Cleanup SG handling")
> Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Cc: <stable@vger.kernel.org> # v6.13
> ---
> v3: no changes, re-submission as single patch, with Cc stable
> v2: no changes to the patch, "faulty" re-submission
> v1: initial submission as part of a series
> Link: https://lore.kernel.org/lkml/AM8PR06MB7521CFF1CD8A93622A537EEDBC78A@AM8PR06MB7521.eurprd06.prod.outlook.com/
> 
>  drivers/usb/dwc3/gadget.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 321361288935..99fbd29d8f46 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -3516,7 +3516,7 @@ static int dwc3_gadget_ep_reclaim_completed_trb(struct dwc3_ep *dep,
>  	 * We're going to do that here to avoid problems of HW trying
>  	 * to use bogus TRBs for transfers.
>  	 */
> -	if (chain && (trb->ctrl & DWC3_TRB_CTRL_HWO))
> +	if (trb->ctrl & DWC3_TRB_CTRL_HWO)
>  		trb->ctrl &= ~DWC3_TRB_CTRL_HWO;
>  
>  	/*
> -- 
> 2.43.0
> 

How was this tested:

drivers/usb/dwc3/gadget.c: In function ‘dwc3_gadget_ep_reclaim_completed_trb’:
drivers/usb/dwc3/gadget.c:3519:13: error: ‘chain’ undeclared (first use in this function)
 3519 |         if (chain && (trb->ctrl & DWC3_TRB_CTRL_HWO))
      |             ^~~~~
drivers/usb/dwc3/gadget.c:3519:13: note: each undeclared identifier is reported only once for each function it appears in

Ugh, b4 is picking up the wrong thing here...

Can you resend these as NOT part of an existing email thread if you want
them to be applied on their own?

thanks,

greg k-h
