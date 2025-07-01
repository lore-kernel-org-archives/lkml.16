Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC44C1EA6F;
	Tue,  1 Jul 2025 07:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751354380; cv=none; b=Nr6hYHfflXydeP8Ra6jSqxhW1XMFCD6WxRfryY5JOwtj+UZStcaVQj61k5Zf18c6W6dW+FS+cgMvvo8SqsOGfkMp/UXTpE+ljw+NXEVIRF7v0uQTERtZ9lwnLS1P58YL2eMMRXOYpTXX/MUS5S5Kdb0aEy0BkzsWYXmFPYBw4Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751354380; c=relaxed/simple;
	bh=RdC1b/J9a0B1FwKlrcoXTqoAmRaXAhA9LvceeEfGy5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jGH3MOerp4IsOFK2AjLNPZKTsJUqoFI7Jl36BZwM0xZ5eGz0OxaBE6bNHMqHJ23/1cUlURHnz0rK5bqg+ZxKmhLX63Ou0uHv2Nlwfpj/LVXYqXwCIz6tNVJ0nr25axVXr6Wpgru2EnARPfuXrRGiG5g4il7YTAmoBkQKDb/SHvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=upd/VbPZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="upd/VbPZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C474C4CEEE;
	Tue,  1 Jul 2025 07:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751354380;
	bh=RdC1b/J9a0B1FwKlrcoXTqoAmRaXAhA9LvceeEfGy5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=upd/VbPZATRrgVeK1gTpaFdeL4r5MxGkkyhQ2axHQqIRQ//DIhT3CrExq4C9RcsSl
	 Yzzp4Ho8LVIvHxnIZxJirpcfUKFMgPUW3/gfaUus6EMObtsOPVKJB+3XuDrCFwXFWK
	 rkFVRAvnKFgJLhv90MeLXagl/Viyillg/D3TDTnHSwthkPYhgLV2XRlAqB9joXpX0V
	 T5ah4xTIV7tVcBBRni2ROSjpzJn0HfFwqYM74vkYLuHlzXbDLitT/WFw+2FrB4zMIY
	 HW5PVlAOxwtykEVmOPRRdMHMoiYLurOMoz3p3CdTF6iXD1x1D1+owGtHvjsd0p7rm1
	 Z8h0kWwzLLnPg==
Date: Tue, 1 Jul 2025 07:19:37 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	Benson Leung <bleung@chromium.org>
Subject: Re: [PATCH v1 1/1] platform/chrome: chromeos_laptop - Remove
 duplicate check
Message-ID: <aGOMCSXpW2VQLb47@google.com>
References: <20250630101225.1855431-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630101225.1855431-1-andriy.shevchenko@linux.intel.com>

On Mon, Jun 30, 2025 at 01:12:25PM +0300, Andy Shevchenko wrote:
> fwnode_remove_software_node() is aware of invalid input,
> no need to perform checks in the caller.

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: chromeos_laptop - Remove duplicate check
      commit: 0c8fe93f4e7767b0e579959de051dcaddd7197fd

Thanks!
