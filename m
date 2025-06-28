Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF811EB5FD;
	Sat, 28 Jun 2025 15:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751123972; cv=none; b=RsZMWtqSA5UDYkw22Tw2wudv0uvyXWOJWkKSebQoIDcfrthOYPkW0tRrWgiN18/uVzNBImTqNstr7//WvtWXV/uTROT5UrqNxAg3NMW1wBWSbm893T/aRC+t1klYo/qoH27di3ftv74/pmMSMrxcnV2oeDquJdwTIwfjVAky1qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751123972; c=relaxed/simple;
	bh=28A4LzZ1ADitqkdYC96JZDl7N7FuMJi/0wQBrq1MmUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MDMyHo9GVLiP5aVxFLbHeXRYGTVtKcZVnp5rJCQEH9FZvMH+kgaSbWiCZOpePpDrCgT6AGVfdfUt2HYpBmkMJAK98+dKuP01AKOPEw0qZdM8a+IjcuZJovFUFU0JXTSe/IxIWNHsl2NqiJ82JYAtvs3HLObIKZ+/DNTM7LiwIt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IobvHAqC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IobvHAqC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66F81C4CEEA;
	Sat, 28 Jun 2025 15:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751123971;
	bh=28A4LzZ1ADitqkdYC96JZDl7N7FuMJi/0wQBrq1MmUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IobvHAqCz5TUEJvdrKM4DH+Qs+fEQ3eLA+LgykHAb8yRVOVx3Ig3GQZl1qhKHBAkk
	 ZkkCQpRYGy7G89EWNrNSmmVBvsmZilmYKnPdwQWey9VMfVCiq0uTV6OuFhcbg1FJ/4
	 DU155WcbYhMPPtOl4bL/GBFmfR0yNqAbd8V2Fe3s=
Date: Sat, 28 Jun 2025 17:19:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] usb: dwc3: gadget: Fix TRB reclaim logic for short
 transfers and ZLPs
Message-ID: <2025062818-existing-skies-6337@gregkh>
References: <20250621-dwc3-fix-gadget-mtp-v1-0-a45e6def71bb@leica-geosystems.com>
 <20250621-dwc3-fix-gadget-mtp-v1-1-a45e6def71bb@leica-geosystems.com>
 <AM8PR06MB7521A29A8863C838B54987B6BC7BA@AM8PR06MB7521.eurprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Forgot the ":" here :(

I've fixed it up...
