Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0B420966B;
	Mon,  7 Apr 2025 23:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744069930; cv=none; b=vDNPgZx7GMO4Wg+UgnBK3MR5lhyFCophofcQ7EwxitItJojB8VSIvZ/k6wtYaqPtdS22w/99qkT2P2EZN4r8ZJDJV6hwk8zhFMctEevpva1Ml5P07SeYnHLsZyzxwvAlgkYb19qPDn0fpm3J47K1nCylBV6P6KgMKN8cKl87b2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744069930; c=relaxed/simple;
	bh=zCMgZMzN0sTQTH/EOoR7qctgb3Y/xzBu3/1USlzvvnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RKY56+kus3WOuDUw3VKukcSDUrsiAj8tn7Re+8hHfsY3Kcp3xhXbNov4wiKzkclvBU8LIEd443Ni5hD7I9CdaViYuDJ4Dy6xzfawq5edBYYFqXUBZY4Tiy7h5BC96ZzdchIhVxkTpwEeDWAETAnTkfl4Kn3E5/afPiqJZEUN80c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kzkhOp3d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kzkhOp3d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43EAEC4CEDD;
	Mon,  7 Apr 2025 23:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744069929;
	bh=zCMgZMzN0sTQTH/EOoR7qctgb3Y/xzBu3/1USlzvvnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kzkhOp3dcc7z2eli6QTtyAHZFCzcPV+ppFrEmsQxxjkB9ey0+tlwbMAto/MjLA0qe
	 jn/JGOKntKv0+sPl5d4PBKCSqfd2UvYbVUvyuRf642LppxS7cToOgFq3EmW4j1SGIf
	 VA9j5GtYM7BF2k+dzw4u3f/GGfH7Ju3nqP/8SMM7NWj3mgt+tt96sfEISaP1htbuBY
	 YqavkZrfZxRylrO8iZv++66hS+jYM0ST/S/l00lobtG2bvgft5P0j0JYU6GFjCMBx4
	 MxdAsI3BQN2mV/qzIRKybw64/bko/EZewX+F/iisPkzBDxnV1zUd9GPv1VNGKDClpL
	 jvguydmTrM+Mg==
Date: Mon, 7 Apr 2025 18:52:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Bai Ping <ping.bai@nxp.com>, Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH RESEND v1 1/1] dt-bindings: timer: nxp,sysctr-timer: Add
 i.MX94 support
Message-ID: <174406992731.197552.9902534650678941011.robh@kernel.org>
References: <20250407151340.2779124-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407151340.2779124-1-Frank.Li@nxp.com>


On Mon, 07 Apr 2025 11:13:39 -0400, Frank Li wrote:
> Add compatible string "nxp,imx94-sysctr-timer" for the i.MX94 chip, which
> is backward compatible with i.MX95. Set it to fall back to
> "nxp,imx95-sysctr-timer".
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> RESET collect Conor Dooley's ack
> ---
>  .../devicetree/bindings/timer/nxp,sysctr-timer.yaml   | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 

Applied, thanks!

