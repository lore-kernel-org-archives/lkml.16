Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4F3367;
	Fri,  6 Jun 2025 00:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749168365; cv=none; b=lZZ+tgFgMR8OtCBq9HJP+eykhLA54jvOZordrfQM0KDIPMxpoweBIrdPsdM7nPthlgGJ3M0TYwQL5V6Qlu7DrXLU8TiOblV8simEHj79IQ9fM/8VFlqV289hcBWedntKgdGjh/4aezc3IqUWJAvnr6u/aoHBwEDZivYS4QIjezA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749168365; c=relaxed/simple;
	bh=hSIs+JYM8vJxjMnIyYlHr6ZxfFsr/R1fg93FKy/BzrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LkmuGkL+qD8aHJVMBOgf7CJ0V2LfDZTEglJUvVbqAXXVyvxoqSZ1MjZc1gYbwrX915WYGSFPmWVcoOS/c2znGdIEZRSNZ7Xa3tgNMgmh5BtdeOz60LHkikjM/kIiuYhYhvNzLqW9og7HIghtrJp3qNx1d+5sSFB7n+1kQdxfRhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U28wb4eJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U28wb4eJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA263C4CEE7;
	Fri,  6 Jun 2025 00:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749168364;
	bh=hSIs+JYM8vJxjMnIyYlHr6ZxfFsr/R1fg93FKy/BzrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U28wb4eJV/+YzWsok3THoYIvFPcIhj+gp0A+P5TUlQevefc1tCBYAhCMAhb9yvyD1
	 XnUo4TQ1aFCcN+PbFT6huestOvdiSNEtM1PVjvA/N0Mwm4XWNZ04JkjXz1v9dkbkY4
	 qBZcYfFbYlaDtbI9tKhqxdbMP+OHRYwwKUG8NUM7BVfl9uoeO/W6ElpAzMKF5M1eJA
	 XvV6hIXCP4N61RTa7rM6N4mdGQ3+pHcMBTaYLpIkuAhsQzTVUIpbaxnNk88Bwev7tr
	 l0ucpz2WCsNWyhgIIieIWU2BtVMhwzFOI0SU9GB2a/NUtygq2XW5XRArESNn5GgUl8
	 CTa7V8ikFLGlw==
Date: Thu, 5 Jun 2025 19:06:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: memory-controllers: convert
 arm,pl172.txt to yaml format
Message-ID: <174916836118.3514924.952936723669634038.robh@kernel.org>
References: <20250602141246.941448-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602141246.941448-1-Frank.Li@nxp.com>


On Mon, 02 Jun 2025 10:12:45 -0400, Frank Li wrote:
> Convert arm,pl172.txt to yaml format.
> Additional changes:
> - add mpmc,read-enable-delay property.
> - allow gpio@addr and sram@addr as child node to match existed dts.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/memory-controllers/arm,pl172.txt | 127 ----------
>  .../memory-controllers/arm,pl172.yaml         | 222 ++++++++++++++++++
>  2 files changed, 222 insertions(+), 127 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/arm,pl172.txt
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/arm,pl172.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

