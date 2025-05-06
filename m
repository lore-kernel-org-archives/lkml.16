Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55AC24A064;
	Tue,  6 May 2025 12:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746535057; cv=none; b=S3cHSaJjCYLf8kYt+mZSZ2m/PtU3dJZPSXLhulhN3fXJgQX5HN7EQYwv6YNh274F9TTdjJCWCnlNsCaLdit+8sm9frfNMKHYcjJw++tvvIayl+pQsVqMa1ycT/m0vSWa9tQgSBzLxKrUYxT2U4ZP5n27ZXHJFuP2r0rvAIgvS50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746535057; c=relaxed/simple;
	bh=I+2eKrQLZP2DktThj9h8LYNIUQt34+aCdKTbE44HRVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ytk8vPt77rMgSuLHCA5FfViU5roIDLLum/P1c1RfqQEyhwnP3L5ffdnUpyNV8ihtlV7fdvI89ugoXUT0emU5BT1bf3a3nemj4VEYbEQVIlrcpz7iemJaPRh+UlLi/aIm33VbgZcwRJwkxnzAyC2Tk1F5etKDjlTEvMLwVsMX4vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=fGYG4vYS; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="fGYG4vYS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=hpU3Fs30fri5vrglId+87d6nQjF1xeJFd95WxWLr/+g=; b=fGYG4vYSBL1+J5asSJyNLkr308
	VqxviKmxj1TydKlsg6ZHMUgt/O7s3U8irhv8eLbmug7FXvpa0h4MuXOXmIXwqzETZcHK/emDHATeX
	pYM6tBV4Ag0kFq6+bH12cdb3i2/ZKXUWu776I7mXKvtDthCJWO8yevPYjMH44UX+nr9E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uCHYA-00BlGO-1Z; Tue, 06 May 2025 14:37:30 +0200
Date: Tue, 6 May 2025 14:37:30 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: Convert marvell,armada-370-timer to
 DT schema
Message-ID: <be41f0f2-cc21-4786-acf9-a19cdae5d873@lunn.ch>
References: <20250506022301.2588282-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506022301.2588282-1-robh@kernel.org>

On Mon, May 05, 2025 at 09:23:00PM -0500, Rob Herring (Arm) wrote:
> Convert the Marvell Armada 37x/380/XP Timer binding to DT schema format.
> Update the compatible entries to match what is in use.
> "marvell,armada-380-timer" in particular was missing.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
