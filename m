Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE921E0DD8;
	Fri, 25 Apr 2025 20:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745611450; cv=none; b=UP/46uRuUSc2pl8U2pYkHN862pHsSTE7DGStMOMq+yVGlp8MxO5/EVOALXaKXYuE0zOMiKYNLcrV7bRwol4b3bAdD44OAydpR34KvUTSf6zep6Ol+YUAAG5WGNokDiT0okzLtvlisECu5Els56Cqv8Zpsy/ItW4RwO32l/o6rTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745611450; c=relaxed/simple;
	bh=4UWy2JHG2LUvJkjrlQYr0V4ExuSPFQvuOJhzRHDcKGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FZ1nE3CIudR4GrQoqO4C+TtP3tX8XOsooT9+dCmQgF959Gd0xjfNOb0MjX9EvFM3ytjnnyG7YaxmlNhRfzcpJ6hXjzVekCCtYXKFYsOoRu1viVFDVH9r7UShb0l05sRDScnA9duHjoLSUWlQneziQlGlLxz8RS7AwdfQsSNhQBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OGO87fH0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OGO87fH0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FB47C4CEE4;
	Fri, 25 Apr 2025 20:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745611449;
	bh=4UWy2JHG2LUvJkjrlQYr0V4ExuSPFQvuOJhzRHDcKGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OGO87fH0wQ53eMLq5xdDd6WDA0EZPztkcuRpUw9i5EUeJg3nMqBEAu1KvQechrpKq
	 FqFkQ22XUE+HrDwDJ4QKd0L/zoXxeARJFMT8zh0gYTcVG7oJQ+BIpXON3mSCYY+Je2
	 lHGntoZzHCZYrMeW3REQGwiF1yRqCYJoUTA63soTDDn56OR00HWN05VQXcTSyAbKYn
	 UMsXeRAihM4ytoyWSuICU7Hx53S8g9KkyVpwW0QSOPWD7GVC025cZrlEmDLPm6qMA5
	 IOBZZcw/Rt195MJ1mS2B0zk9U4uhWsmq+/KJJNQZy4t0aMjjSnwjP/IIJEiJZaPMAu
	 wG+jLmxiY4CPw==
Date: Fri, 25 Apr 2025 15:04:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Pin-yen Lin <treapking@chromium.org>
Cc: linux-usb@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Stephen Boyd <swboyd@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: usb: Introduce usb-hub.yaml
Message-ID: <174561144733.2905131.13737700118522261776.robh@kernel.org>
References: <20250422082957.2058229-1-treapking@chromium.org>
 <20250422082957.2058229-2-treapking@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422082957.2058229-2-treapking@chromium.org>


On Tue, 22 Apr 2025 16:28:27 +0800, Pin-yen Lin wrote:
> Introduce a general USB hub binding that describes downstream ports
> and hard wired USB devices for on-board USB hubs.
> 
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> 
> ---
> 
> Changes in v3:
> - Remove redundant schemas
> 
> Changes in v2:
> - New in v2
> 
>  .../devicetree/bindings/usb/usb-hub.yaml      | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/usb-hub.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

