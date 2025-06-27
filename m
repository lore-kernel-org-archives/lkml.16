Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DDEBE4A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751028798; cv=none; b=cKXWeeXWsGWxDNnqaDZ8e1/huN9cMyR3usZsCR0SAGvB2ZKqIPi4g5/IgnhvwEK6f7HOGAMG2Y+D3lhTDLrfwgT5Qdqfy21x5eKg5Ut/KTIobGcnn6DcKQGE0vWD9RcDOhz5QRzLtXXuM06ZS5XYopIkcKJ1PKQlLAo7RFnzb8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751028798; c=relaxed/simple;
	bh=Edvg39LRqpEu71y5Aw9qPLI34XfCzmevj/Z8Rlfwbvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQuR3TkNXVdLH8lXLJdPbE9IPhhnPHfwSLIjzheAQ8CdZPb9IAOdaChOitIJGjLTA9C1lSX0aT/9qqD7HafNkusjO3Un1GWZ4wXJsrvSTV2rkhXVZwQFxVDZw9pMb0P/X91hm/kG7t5WJaRnBl6C+rmkPw4Ygtbe/Dpug4j2gVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A2ldemRP; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A2ldemRP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751028797; x=1782564797;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Edvg39LRqpEu71y5Aw9qPLI34XfCzmevj/Z8Rlfwbvo=;
  b=A2ldemRPAYJBAkQ84zikodF9sAL7P0VcFOFve7I9/bvPmi/wRBbMNwjc
   I5GXdU6wS42ek3DQixIe0Me00jXtG5QzVutPMdnbDd8zqCuEGdYBTl2Al
   PejKsW3PRcdFFp6OJvcBIgpANb4IYq0NMRjO6mHlB1PcBRnbE/UCEsu55
   Ts2FFhL6SHozrRoAltbfWW7/nQTLRry5MdvSTT/IwEdTBTRKuoPxLn72c
   90iCuCq3ZR2OxPPTJUH9PVVKlKxjTCLD69oFjS6WLV4gRCmfC6S2yIFoz
   89pzzNHcprj3uwSmHI8bNEegSsocP79HkNAkmtu/2fbkG1nKRkMETYFaD
   A==;
X-CSE-ConnectionGUID: Au1kKXrRSjakQ8nuc/Sd4A==
X-CSE-MsgGUID: cIU8zNyoRo+QYe3/BP726w==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53437742"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="53437742"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 05:53:17 -0700
X-CSE-ConnectionGUID: eJf2JToMSWKuSn1MY50r9A==
X-CSE-MsgGUID: GW7EYvmjQk64QcD2EAJoeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="158530913"
Received: from opintica-mobl1 (HELO stinkbox) ([10.245.245.146])
  by orviesa005.jf.intel.com with SMTP; 27 Jun 2025 05:53:14 -0700
Received: by stinkbox (sSMTP sendmail emulation); Fri, 27 Jun 2025 15:53:12 +0300
Date: Fri, 27 Jun 2025 15:53:12 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	Imre Deak <imre.deak@intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Matt Wagantall <mattw@codeaurora.org>,
	Dejin Zheng <zhengdejin5@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 18/18] drm/i915/ddi: prefer read_poll_timeout() over
 readx_poll_timeout()
Message-ID: <aF6UOCLdO0fGHGA9@intel.com>
References: <cover.1751023767.git.jani.nikula@intel.com>
 <59bcc15dd4debf00ee0c7b430a3b701462ac9de7.1751023767.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <59bcc15dd4debf00ee0c7b430a3b701462ac9de7.1751023767.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment

On Fri, Jun 27, 2025 at 02:36:32PM +0300, Jani Nikula wrote:
> Unify on using read_poll_timeout() throughout instead of mixing with
> readx_poll_timeout(). While the latter can be ever so slightly simpler,
> they are both complicated enough that it's better to unify on one
> approach only.
> 
> While at it, better separate the handling of error returns from
> drm_dp_dpcd_readb() and the actual status byte. This is best achieved by
> inlining the read_fec_detected_status() function.
> 
> Cc: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 33 +++++++++---------------
>  1 file changed, 12 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 0405396c7750..fc4587311607 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -2339,34 +2339,25 @@ static void intel_dp_sink_set_fec_ready(struct intel_dp *intel_dp,
>  		drm_dbg_kms(display->drm, "Failed to clear FEC detected flags\n");
>  }
>  
> -static int read_fec_detected_status(struct drm_dp_aux *aux)
> -{
> -	int ret;
> -	u8 status;
> -
> -	ret = drm_dp_dpcd_readb(aux, DP_FEC_STATUS, &status);
> -	if (ret < 0)
> -		return ret;
> -
> -	return status;
> -}
> -
>  static int wait_for_fec_detected(struct drm_dp_aux *aux, bool enabled)
>  {
>  	struct intel_display *display = to_intel_display(aux->drm_dev);
>  	int mask = enabled ? DP_FEC_DECODE_EN_DETECTED : DP_FEC_DECODE_DIS_DETECTED;
> -	int status;
> -	int err;
> +	u8 status = 0;
> +	int ret, err;
>  
> -	err = readx_poll_timeout(read_fec_detected_status, aux, status,
> -				 status & mask || status < 0,
> -				 10000, 200000);
> +	ret = read_poll_timeout(drm_dp_dpcd_readb, err,
> +				err || (status & mask),
> +				10 * 1000, 200 * 1000, false,
> +				aux, DP_FEC_STATUS, &status);

I think I hate these macros. It's very hard to tell from this
soup what is actually being done here.

The 'val', 'op', and 'args' look very disconnected here even though
they are always part of the same thing. Is there a reason they can't
just be a single 'op' parameter like we have in wait_for() so you can
actually see the code?

Ie.
read_poll_timeout(err = drm_dp_dpcd_readb(aux, DP_FEC_STATUS, &status),
		  err || (status & mask),
                  10 * 1000, 200 * 1000, false);
?

>  
> -	if (err || status < 0) {
> +	/* Either can be non-zero, but not both */
> +	ret = ret ?: err;
> +	if (ret) {
>  		drm_dbg_kms(display->drm,
> -			    "Failed waiting for FEC %s to get detected: %d (status %d)\n",
> -			    str_enabled_disabled(enabled), err, status);
> -		return err ? err : status;
> +			    "Failed waiting for FEC %s to get detected: %d (status 0x%02x)\n",
> +			    str_enabled_disabled(enabled), ret, status);
> +		return ret;
>  	}
>  
>  	return 0;
> -- 
> 2.39.5

-- 
Ville Syrjälä
Intel
