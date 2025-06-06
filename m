Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C83D29A1;
	Fri,  6 Jun 2025 00:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749168518; cv=none; b=jkI2DzI/6o9e/wcxsu8GQofa7lMilSMK14jLRHXZNaaWOvsWRhH03tp+f3vOvlZYNt92F9bl7AUKh8k2c5L03Q4OpgLpJY2g+r28oQIx7wLoUHOlWK+GqOXojBPYYkBpM14xy4OffYJH5gim6/mRLZkX+g11daLD7vC+odn6XKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749168518; c=relaxed/simple;
	bh=096tcwFPpeJG650wQF6YIxLq94RUk9uyR/oF7cR6+RE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y9dzSQzzXt56acdmPIMaWkuAu1MxCrJtG4zUX4sZEKWREp+1RqCOvquxiLSc62IZaWt3c7LBZyCuBdVxiMccdmqnEH6dff4eIgZk1sckukO2NSaIwRzeV2KXksBK14tXMeB5ibQuRr5PRI9mpCWNqUEUt7JMUuc2tgiyluPSED4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tlY3UW/K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tlY3UW/K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72D48C4CEE7;
	Fri,  6 Jun 2025 00:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749168517;
	bh=096tcwFPpeJG650wQF6YIxLq94RUk9uyR/oF7cR6+RE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tlY3UW/K9u2JgwKDcNQfnVeBUy7hC2xfe1v6W6OWg7aZbXOdcl8TXEzA9d1Ny/T16
	 Wt80q6QSXA35UMSeatSZr8jHqdfyo8/sK7SX9r4uHImRD6+I+0te6ZV5RJ4rXDPVx/
	 OqRnyGKF89OtAvy9gV5ms9Tk0rwh2ZfjdkKY5ztFUBeS8a5RWiQpSAuPFqWVsKg5Pk
	 KSQ9XbATQIDUaUscrAfuw+UzTPA8u+WNrLmBe9lhVBS/Yj69CDu9wpktMbeHYunLSb
	 s8GxzNo6oVfJmTkCKLTRXeqpbDOOzbzSYERp6vX9CMT3BB1f399DwXOAbRSAy8bWjq
	 Jve6yHyxMRt2Q==
Date: Thu, 5 Jun 2025 19:08:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
	linux-clk@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: clock: convert lpc1850-ccu.txt to yaml
 format
Message-ID: <174916851320.3533561.1893618858405515968.robh@kernel.org>
References: <20250602141937.942091-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602141937.942091-1-Frank.Li@nxp.com>


On Mon, 02 Jun 2025 10:19:36 -0400, Frank Li wrote:
> Convert lpc1850-ccu.txt to yaml format.
> 
> Additional changes:
> - remove label in examples.
> - remove clock consumer in examples.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/clock/lpc1850-ccu.txt |  77 -------------
>  .../bindings/clock/nxp,lpc1850-ccu.yaml       | 104 ++++++++++++++++++
>  2 files changed, 104 insertions(+), 77 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/lpc1850-ccu.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/nxp,lpc1850-ccu.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

