Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6001F17E8
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 12:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751113186; cv=none; b=Y+wIRjGyt4bSM5ik3W6dHyUDKX52fSxlQGcI8TKovrY9wMbMH70b2GqYuqw590WBjzUBuTkUbPFoE2+gf+1XzDhLjJTOzq9dLpVRnON+fJ68Ce7aj7egYff2zXKaYCLGNCnrNNxqC/t24QoItw/RUOfuRxBR9QEF5n5M6J2aZQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751113186; c=relaxed/simple;
	bh=QhnZ7KS4dcO10Zf6dRimAYrqaLaH9hV/1OodxZ6Dess=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jF+Fhr2JwvAUQPUHgVx0JYacFNwQennSQAD6osi2kiwfkb8xyL9D7YAfVR+wj/4+Vfh3E0dcbldSiGQPxw2aA+nIQ7ayPl3BqhF11jQ8yJZ/fHRgwqn0Bvbl3qZX7geVyoxUmU6j2dh0ZFhoKpiMQSpTNWHLWKu8rCda3l4j+Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cta7eDaC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cta7eDaC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13674C4CEEA;
	Sat, 28 Jun 2025 12:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751113186;
	bh=QhnZ7KS4dcO10Zf6dRimAYrqaLaH9hV/1OodxZ6Dess=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cta7eDaCVajo/VmSdGNFM/pCfNX/Dk1Y42mL+oXVgdXNLJtzfRA1lLbDbaMrmUY9B
	 g1xuCPTWvARXXN2lPpD+SzQHGvHuoehp4iRySbidQhJPbg+oD8X6xJcLNxWywl2n26
	 8q0ahpA27J+GlksGUam3PbikcXxgJ0hww1kpjRdE=
Date: Sat, 28 Jun 2025 14:19:43 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, anshuman.gupta@intel.com,
	rodrigo.vivi@intel.com, alexander.usyskin@intel.com,
	daniele.ceraolospurio@intel.com
Subject: Re: [PATCH v4 02/10] mei: late_bind: add late binding component
 driver
Message-ID: <2025062808-grant-award-ee22@gregkh>
References: <20250625170015.33912-1-badal.nilawar@intel.com>
 <20250625170015.33912-3-badal.nilawar@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625170015.33912-3-badal.nilawar@intel.com>

On Wed, Jun 25, 2025 at 10:30:07PM +0530, Badal Nilawar wrote:
> +/**
> + * struct late_bind_component_ops - ops for Late Binding services.
> + * @owner: Module providing the ops
> + * @push_config: Sends a config to FW.
> + */
> +struct late_bind_component_ops {
> +	struct module *owner;

I don't think you ever set this field, so why is it here?

Or did I miss it somewhere?

thanks,

greg k-h
