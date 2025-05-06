Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73672264A94;
	Tue,  6 May 2025 12:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746535082; cv=none; b=jbV9pIEmfOXHP5kc4xNRQksewPwGEmR+hp4hNoUzD7zsb+M9JjchfifwAsJBRsb85zl9yYtNt0+XUVEKbg/YbapulzxKsz/nJTz3hsYXPUWxdjanT1aWj2qZX9l0IaOEB/FX7F92tYg2iIal63GgVqJmC2SypXp+RPbylOXGXDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746535082; c=relaxed/simple;
	bh=8pEwVmxSd5/k9VwZONa5T9VOsEUR7lsS4AVBM+/xJaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qCvOzXvFw1LCIOArJkr7DxnOaytl92TPZ7E+2sox2mIpzvpMFJeN29nYAtYHOKKiWSKoCQBFkOYPGAlmYZqhdti9EoYf2XOJ0u8fT1/ThY1Eig/ZbGlMXyVB1v/zNR7veIVJlTXA0NvsqP+0LJi3u8quCiw7hGZ4nFbWODcVWJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=QH8h8kv5; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="QH8h8kv5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=fX4hC4wtwnpA4kRyTNVi9k79+L9Hkq8xM6nbvmPzJh0=; b=QH8h8kv5xgI1oMVh74eElxJ7k7
	afhVIZ1zohVuyXzsiwUEEpcKbldcCARqE45e3/4AXnwJnkcM8KUg0/EN2LnDlIaRRAhn5gAU+TDtV
	uo6k3OtdoyQYNZS114EkR999xtSbFrCMnDA6tx8b2xqu2vKys6ORyaQnMOFjxkobLIgY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uCHYb-00BlGs-PS; Tue, 06 May 2025 14:37:57 +0200
Date: Tue, 6 May 2025 14:37:57 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: Convert marvell,orion-timer to DT
 schema
Message-ID: <f6c8731c-6d8c-481d-a359-cbd628fa4748@lunn.ch>
References: <20250506022305.2588431-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506022305.2588431-1-robh@kernel.org>

On Mon, May 05, 2025 at 09:23:04PM -0500, Rob Herring (Arm) wrote:
> Convert the Marvell Orion Timer binding to DT schema format. It's a
> straight-forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
