Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127161AB50D;
	Wed, 16 Apr 2025 18:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744826891; cv=none; b=CJ3j0AD8zil0RUmb3OYKfzOZf6UuPn2EidzZz913gDliddtwWW50YBjMg4CqzAM9TWOaJjLA1yRWGaV4kdGNG4YR3SSgoxb1rAaRtGQkwJpBYKgMewIDWO5UHHs/s0+mtJr+L5GIDDwWh7hHqZKJ1rpX+5OCjTupQXt9vkVqL0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744826891; c=relaxed/simple;
	bh=r6PfxA0wKbws+QG5h1LuzMmXPKODCY725E6NfTH1YNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jr+d4z6mm4SVjlohPNjQD3ajJAjM7xAKdhx51jVLGyqxQh/UvLflcSHMlnzSqhkWo63RmvJrghh4fhkghKtpCrp1IW+sRofOD2g2dCeEUlH9RLS+PW5wXpaqKYyBGMXfN3LuDm4S37WFJVZOT1YKW8IjMfNUNXcOVzgtyVzY4AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IPWyYmnj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IPWyYmnj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59BDDC4CEE4;
	Wed, 16 Apr 2025 18:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744826889;
	bh=r6PfxA0wKbws+QG5h1LuzMmXPKODCY725E6NfTH1YNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IPWyYmnjffc7SlioSRT3M2pbdw2gR3ngRnDbPwl6MLkW/eEGZCITQqmFNS0c1xymP
	 LoMtqVZFT01oeMSXwXNGHsIKCSGEZ+2kJiynhx/PF+AtUhAK9cPNpr7ngGRbYqtvNu
	 wt1QTJwh2gBiv56c1G/vkNmFnIdCR1c6Ip2o72jm7f3fNILtqfsh9nBJaui0m/djQR
	 ZjN1gS4MFOg97tNo/iyxRvfV4DVVQ6KxIxdK/Ab4OeWR+hjLLN7hJy9OeRfLOIVRG0
	 XIn7cFgxRZfLgYUB8RITX97pRc6TXWfa0ahSOLSUJFSy2j7RiOHk2fw+2Ndz9DO3+5
	 48ZGoGB0DpgYw==
Date: Wed, 16 Apr 2025 13:08:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: interrupt-controller: Add missed fsl
 tzic controller
Message-ID: <174482688607.3538222.303139918100748355.robh@kernel.org>
References: <20250415154859.3381515-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415154859.3381515-1-Frank.Li@nxp.com>


On Tue, 15 Apr 2025 11:48:58 -0400, Frank Li wrote:
> Add missed fsl tzic interrupt controller binding doc.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../interrupt-controller/fsl,tzic.yaml        | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,tzic.yaml
> 

Applied, thanks!

