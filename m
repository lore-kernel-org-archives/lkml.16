Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BF528D8FB;
	Tue, 24 Jun 2025 11:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750764625; cv=none; b=DlpcmmCnRQIT0/rRFJzNVuHpe9tla7vVUTiNfS7SHA+4d9QEoaRXLHu9idWm/Qnnp6ZI54scjFGgXcOXieLrpF7Hpm0tB6YkSkURqblRVDjXE+MTcrojFTGViPttPSX8Us6DELQPqtBm3j/fZWdM2uy8qX3kFS86LFi8ngWs8UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750764625; c=relaxed/simple;
	bh=rKiX22wdQ4g6H3C8ZDpCi9Df8pmSFPNkDfJkly9sobM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tteQ5HD+4mCMA7qU3fwhZ7BCdkMQCkze8WETeuUmJs+MY569gfcCg4hMJcT/YqzKJigAdneLXnhm7NILg2zDGVboGR4upqqBED0InM5LAHfw9KSgjtgPp8jGeKmH8yK52uSSgsGV37CTymciQ2jdHfLaHcX44UYMQaP70zqlPWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OIQ3hHFA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OIQ3hHFA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805BEC4CEE3;
	Tue, 24 Jun 2025 11:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750764624;
	bh=rKiX22wdQ4g6H3C8ZDpCi9Df8pmSFPNkDfJkly9sobM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OIQ3hHFAr3UCopZ13/ZeOrxrfbbEIt6dJaXFFnxFWtXekz2juW9oBJraHujb7fxwV
	 eT2jm8thYjiIeJKQdR8OkLiL/n33FqzwJIOCauK5HdzpCjf3n4aupL6JbGVJo1O1j6
	 AqD7pZanOI4GFN+VM7g/xi0g5gQ8khhk+Vb7VTYl9YkkiEhdubmn4f0xDYBOHGaS5D
	 8Jo4WTToaAA4TUX9yCaqWS/g2bU91YlzuNJLHpGCMTWhO0Z9LxVnQBWVYS/AyR/oKF
	 mnhqKYWJlmCxPc5ZK+gEhvDdCied9gouBKCtTEQKVtOIbUm4I2wELQxeap5F9fSOa6
	 0o8Io2Rd1Cc5g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uU1r4-000000002fb-0mIM;
	Tue, 24 Jun 2025 13:30:22 +0200
Date: Tue, 24 Jun 2025 13:30:22 +0200
From: Johan Hovold <johan@kernel.org>
To: alejandroe1@geotab.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: gnss: add u-blox,neo-9m compatible
Message-ID: <aFqMTrHOOu10iSQl@hovoldconsulting.com>
References: <20250523-ubx-m9-v3-1-6fa4ef5b7d4a@geotab.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-ubx-m9-v3-1-6fa4ef5b7d4a@geotab.com>

On Fri, May 23, 2025 at 01:19:52PM +0200, Alejandro Enrique via B4 Relay wrote:
> From: Alejandro Enrique <alejandroe1@geotab.com>
> 
> Add compatible for u-blox NEO-9M GPS module.
> 
> Signed-off-by: Alejandro Enrique <alejandroe1@geotab.com>
> ---
> This series just add the compatible string for u-blox NEO-9M module,
> using neo-m8 as fallback. I have tested the driver with such a module
> and it is working fine.
> ---
> Changes in v3:
> - Remove unnecessary example, 'items', and blank line in the devicetree binding
> - Link to v2: https://lore.kernel.org/r/20250522-ubx-m9-v2-1-6ecd470527bc@geotab.com
> 
> Changes in v2:
> - Modify the binding to allow falling back to neo-m8
> - Remove compatible string from u-blox driver
> - Link to v1: https://lore.kernel.org/r/20250514-ubx-m9-v1-0-193973a4f3ca@geotab.com

Now applied, thanks.

Johan
