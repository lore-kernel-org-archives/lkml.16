Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2344320C02D;
	Mon,  5 May 2025 13:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746450421; cv=none; b=Q85jMVtriY4eXfPmVd4qAtwAA055Enw8svueQjQbJeV84MtRAddwmgjg+WGvAHSq8YvJf3rfHfTalqlpPUnzkhxsKO/KJHh763n/RXur+sjhCGZBAzZFgFCkm2GBu/9yijQczFmXrajNSYjcjA18EIbNwv0g4+GDKsfED+7v54I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746450421; c=relaxed/simple;
	bh=wLI4WhaIi2O4ptbBTKPS0qRwzR+rgk9Z5fzmtbWH+EU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QCfdHe6y+x6GKgNGHVApRmHQ7ue0EcieOIuAXyVwC2O3kJ7Okv43BcT3eXd083d2rcR8/Vz2aBZWVlLFTjI6wlvZnW+UkiIzTxuIR8SiL5L+yHR7HCT9iL7D5pq9D0FlC3GbVadKByiX2kP4aTK0Efl8j/+XifyUWSbFlf4ic4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sm1q1CCI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sm1q1CCI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D7E0C4CEE4;
	Mon,  5 May 2025 13:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746450420;
	bh=wLI4WhaIi2O4ptbBTKPS0qRwzR+rgk9Z5fzmtbWH+EU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sm1q1CCIuJQLJdknNDQHwqFfQAMye278VLzSW2ZAvKVwISkgSkVoF3/0jBunKEPNc
	 R53iiAUDy2kgO3wUboHWXbGGUYcDNtLPW9ZxXx6bcY0tOwJlnR3RPn1Fwx0lpyrUDr
	 vMCJAMme5IAdq1yTbIHdcAI7rxCcpX4+1DK126w4=
Date: Mon, 5 May 2025 15:06:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michael Grzeschik <mgr@pengutronix.de>
Cc: Badhri Jagan Sridharan <badhri@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tcpm: detect orientation in debug acc mode
Message-ID: <2025050539-agony-surging-ae99@gregkh>
References: <20250505-tcpm-v1-1-e6142985a012@pengutronix.de>
 <2025050510-malformed-outweigh-3dbf@gregkh>
 <aBigoRYPnQntXNel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBigoRYPnQntXNel@pengutronix.de>

On Mon, May 05, 2025 at 01:27:29PM +0200, Michael Grzeschik wrote:
> On Mon, May 05, 2025 at 01:21:18PM +0200, Greg Kroah-Hartman wrote:
> > On Mon, May 05, 2025 at 01:06:16PM +0200, Michael Grzeschik wrote:
> > > For the debug accessory case, the orientation can be detected by reading
> > > the cc resistor values. The will be TYPEC_CC_RP_DEF and TYPEC_CC_RP_1_5
> > > in sink mode and TYPEC_CC_RA TYPEC_CC_RD in src mode.
> > > 
> > > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> > 
> > What commit id does this fix?
> 
> This applies on 64843d0ba96 .

Great, can you resend with the proper Fixes: tag added?

thanks,

greg k-h
