Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BA52C327E;
	Wed,  4 Jun 2025 10:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749034564; cv=none; b=HwVzQhJf3qvT/orUP0TthJpcmF4EizmDL70j5tZcYiLxsN/ndS8pmWfR0OQELx7EmXmdRSbQzG4u4AjVXZQvUdEvo7vBfiBmU20224sQC379jXS2+ls55QKN8AzlmqLyAGNvJbLncZDmXJ/di3J+CBC+vhgK6UxvmPi2D2/W/gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749034564; c=relaxed/simple;
	bh=PTR/RCyK2e6HQxlFTyr65MmvnXHyyyrK+apYSD459UU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iBsGxxJAl4DNBjHlwF88vW7s9qAblUgRywvomS8Sy8ANMSSJPD+xhK/Jdpi/w6dq+srjGXkKoiGGmQs1fRIyy6mMP3YCz20rTsDPHARvA7UpLxT0Njxyh137VS98DUQi4b6Q2Ehay4rRkjUblweg5mrH749c3Kaf22Wqusjsm8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tTqGyC6r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tTqGyC6r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF3FC4CEE7;
	Wed,  4 Jun 2025 10:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1749034563;
	bh=PTR/RCyK2e6HQxlFTyr65MmvnXHyyyrK+apYSD459UU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tTqGyC6r69NMq/Ro36XGPbxC/P5UWL2ERimFZMcuP+Q2B4ERq2KH3bD0hv51hd3gK
	 Pfu6xr0Ous+eV+CzuZ/CDzQqED0rfYygjSUnHMIs73kPjjwbpPjPGGngTqKHI9530i
	 pkUn94A5uuX9Nl9Ew1GUlYh1V7nWAjrx4V6T1vOw=
Date: Wed, 4 Jun 2025 12:56:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Guan-Yu Lin <guanyulin@google.com>
Cc: mathias.nyman@intel.com, gargaditya08@live.com, kekrby@gmail.com,
	jeff.johnson@oss.qualcomm.com, quic_zijuhu@quicinc.com,
	andriy.shevchenko@linux.intel.com, ben@decadent.org.uk,
	broonie@kernel.org, quic_wcheng@quicinc.com,
	krzysztof.kozlowski@linaro.org, sumit.garg@kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 0/4] Support system sleep with offloaded usb transfers
Message-ID: <2025060407-geologic-excuse-9ca5@gregkh>
References: <20250604082449.2029156-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604082449.2029156-1-guanyulin@google.com>

On Wed, Jun 04, 2025 at 08:23:06AM +0000, Guan-Yu Lin wrote:
> Wesley Cheng and Mathias Nyman's USB offload design enables a co-processor
> to handle some USB transfers, potentially allowing the system to sleep
> (suspend-to-RAM) and save power. However, Linux's System Sleep model halts
> the USB host controller when the main system isn't managing any USB
> transfers. To address this, the proposal modifies the system to recognize
> offloaded USB transfers and manage power accordingly. This way, offloaded
> USB transfers could still happen during system sleep (Suspend-to-RAM).
> 
> This involves two key steps:
> 1. Transfer Status Tracking: Propose offload_usage and corresponding apis
> drivers could track USB transfers on the co-processor, ensuring the
> system is aware of any ongoing activity.
> 2. Power Management Adjustment:  Modifications to the USB driver stack
> (xhci host controller driver, and USB device drivers) allow the system to
> sleep (Suspend-to-RAM) without disrupting co-processor managed USB
> transfers. This involves adding conditional checks to bypass some power
> management operations in the System Sleep model.

Is there a reason you aren't cc:ing the developers from a "big android
device company" that is currently testing and finding problems with this
patchset in their device testing?  I will require their signed-off-by or
tested-by in order to even consider accepting this patch series based on
the issues they seem to be finding with it in an
internal-company-bug-reporting-platform that I seem to be also copied
on.

thanks,

greg k-h
