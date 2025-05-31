Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F9F482EB;
	Sat, 31 May 2025 05:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748670749; cv=none; b=VFvg7i0TsULXw4LcC00zIn1NLlVE1yCwzmNNzGra+ZtpZy7cL1Cj+QqhAN4bfz0+zaYVcqnkre+ZOu7Y+NItoxIZTw9AdzkP0AWVTjqVyTB6kcqBCzDaRW+DFeOVHqLyiRWiyi+HnyLSG0refi3teST7sYIjm+juYi1fVOSr6Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748670749; c=relaxed/simple;
	bh=cALAC45bcmWERtlmr7LoJYVyMgKP9/CIORLyNtIJDTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XVXrK0bAJI+strxnzFOCznONAlt3JUoELwj5wVGpDpG8rvH76PAwjqxhsHJvF8gaw1dAoE4VJAilgjGSVMK+t3xndfX6XAsc47AoqxjHKEK7v85zxHn4NwcUumlrHK8djGyR1PeaecpbTZ3fRUwJtobDr0USdDATlVd2l+HcR2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BBWe77Ry; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BBWe77Ry"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11D52C4CEE3;
	Sat, 31 May 2025 05:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748670748;
	bh=cALAC45bcmWERtlmr7LoJYVyMgKP9/CIORLyNtIJDTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BBWe77RykKrSJXfko9OgPsygLKF6tjS8vhKXHLKhBdQrJtrdN6bhd9areOJ/wj+U+
	 qBJYns24X8rDCbSdzvbZHJx6NMv7qt0hJnX3c2M5t4KBzB+Nq+TEzvQjPm/wwQiky1
	 zOb2NinsAuY2zsMl2sfINgff+ZCp/HDMbBACbPm4=
Date: Sat, 31 May 2025 07:52:25 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Vankar, Chintan" <c-vankar@ti.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Peter Rosin <peda@axentia.se>,
	s-vadapalli@ti.com, danishanwar@ti.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC PATCH v2 0/2] Extend mmio-mux driver to configure mux with
 new DT property
Message-ID: <2025053128-profound-importer-8436@gregkh>
References: <20250304102306.2977836-1-c-vankar@ti.com>
 <f844e44e-6b71-442a-ae3c-7bbe74a908af@ti.com>
 <2e80f6bc-2fb0-4f0d-9450-cbcf4dddca66@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e80f6bc-2fb0-4f0d-9450-cbcf4dddca66@ti.com>

On Fri, May 30, 2025 at 10:35:24PM +0530, Vankar, Chintan wrote:
> Hello Greg,
> 
> I have tried to implement Timesync Router node to the suitable
> Subsystems (Interrupt controller and Mux-controller). Thomas
> has provided a feedback with a reason why Timesync Router is not
> suitable for irqchip. But I didn't get a proper feedback for mux-
> controller subsystem.

What do you mean "proper feedback"?

> Can you please help me deciding in which subsystem I should implement
> it, if not mux-controller can it go in drivers/misc ?

Why not mux?  What's preventing that from happening?  Why would misc be
better?

thanks,

greg k-h
