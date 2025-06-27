Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A78194137;
	Fri, 27 Jun 2025 02:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750992804; cv=none; b=cBqLOOG8RMTxvSG1MN+57bAa/yCkgio6hB25B2HdvG136cksetF22uGCol6ha9KXqRiBIbkc9z8zQS8qfrAewuGgfWeIKnYOiTXhSntdFd91bHnxJ7eNsCV9Z1m35JQoIH+utzcJ4H2EpzFRa+JUMHQ+YBCf3w9ocrRYT7sMO80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750992804; c=relaxed/simple;
	bh=mdZBBhEzaAZpeEG1n4qDMh8q8nXUtt4aTKpuZ8dR7C8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fpkttDpkEqbCabt4dxruv101Lc8NdExxPDcccVt3wOzK/qZpNS1Ba4pbxCUF0m8F4UgcZ8oQ5JQJLgWtneSR7R4s0xGdnqczJXk5chyhyOxHXXDUXos+WQy6ejiUkPXNQStq3rco59jgMUF9qv7FHeWzYcZSdAPD1GGzxTUuc3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UCGp7Ip9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UCGp7Ip9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7654C4CEEB;
	Fri, 27 Jun 2025 02:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750992803;
	bh=mdZBBhEzaAZpeEG1n4qDMh8q8nXUtt4aTKpuZ8dR7C8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UCGp7Ip9a2jNFoWrFnVs5XiXhVJqsJ5Q3vDFuaXUn65K9UMp0XgJKk9woZyiEShIb
	 ymPDzFafQBX2cvd8pWbLgirZyeEQ8TZFuGQZw6G3mp061fZ2g5QWaOjVx5WHsdLmO6
	 R8biJAW9rT4jDU84Qis2Y3QJcBmZ5+9wIep5f0eO0leVjIBc8KtDLPrdcANHdwQpdJ
	 y95Xp0z0X9Izkjhh2yLYN/Ma/Z7gES2p/9tmJxh/MKUg4nZwUBlbjdsUp58nR6YlZw
	 g2betzQ2JsiT/k7WKJ4UEdBNZ588bm8K/5Rt1ky0xXYzZzxLddhSipl8/gA8AhDjtr
	 ABSK9qdeIQ3PA==
Date: Thu, 26 Jun 2025 21:53:22 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Grant Peltier <grantpeltier93@gmail.com>, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Naresh Solanki <naresh.solanki@9elements.com>
Subject: Re: [PATCH 1/1] dt-bindings: trivial-devices: add compatible string
 nxp,isp1301 from isp1301.txt
Message-ID: <175099280209.1666570.11765308754679377242.robh@kernel.org>
References: <20250623204048.2493819-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623204048.2493819-1-Frank.Li@nxp.com>


On Mon, 23 Jun 2025 16:40:46 -0400, Frank Li wrote:
> Delete isp1301.txt and add compatible string nxp,isp1301 to trivial-devices
> because this i2c device have only reg propepty.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/trivial-devices.yaml  |  2 ++
>  .../devicetree/bindings/usb/isp1301.txt       | 24 -------------------
>  2 files changed, 2 insertions(+), 24 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/isp1301.txt
> 

Applied, thanks!

