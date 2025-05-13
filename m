Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F271A2381;
	Tue, 13 May 2025 14:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747147479; cv=none; b=mYicgDchYGhf+xfEyDmxS+qc8fn454SBqeRG8C3pmN3x1uDIeyAmPsoSTfCa5ihnCqleCobE4luhOFyDrWiwkd3J7QxlVpygdLcEYcqIHkXCVjNyy/bZ+GShAlRMfRQ527YXqmSkoPTU2MZo+A49ehiA5/86WycCvqBCBsdqDW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747147479; c=relaxed/simple;
	bh=sy7k+xAKGCn2+Bg9wUMUr0JAk7Z0jyUq84uEsYE8DbY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DvU5xQgfYnsNh9SoJJfmNi31L8CvkeaChPE+GGXzlk4WVSTZgzRO+kjXAFWRpJ4lvO3B+qGCPI7WG7jiQO4LmdsiXuJIoKtFVmDv+AUbt3aZJ3/6cIQkJqiEUV0XbXdulWva5g4BDrFwiQWeHX2FehKJF/zhRkJT8jXCaPb8oe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bTYr0mXq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bTYr0mXq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38135C4CEE4;
	Tue, 13 May 2025 14:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747147478;
	bh=sy7k+xAKGCn2+Bg9wUMUr0JAk7Z0jyUq84uEsYE8DbY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bTYr0mXq2E5iEmpyyN6alTcHlWxdA0ncMRxXa14sI6zoEnalpLxKoroZSUtKvojFh
	 9yDF5OyUnUUxq8MOk0zgZuuRiCfOG5r84J6lO4qY4IzCm3ERlYD9jqwWlHYGRnaPY4
	 1l5L2+KMWYC/lPjwa9jFiT1tGubEDrVwFG+u7FzR4I4gyL4JtDITwrtsgabwHwebWU
	 4ZTv95dTKntpHpz2wjk0woZ54hTLExOIsVC/B3vXSD1RvuZRGVr0KSOe03XaGxfPJq
	 9edwM0GfdSvciSRiCQR/egPmq30hHXH5n9lJnaTPTD3/nuLJQ/JNOitWEZg7exTUjs
	 aDBexfRrUKyJA==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: cache: Convert marvell,{feroceon,kirkwood}-cache to DT schema
Date: Tue, 13 May 2025 15:44:12 +0100
Message-ID: <20250513-deflate-janitor-92a25ca1543b@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513015252.1049409-1-robh@kernel.org>
References: <20250513015252.1049409-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=459; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=kHwmJzwZ9KywxR+OsGDbigeKXRXXOdrwrxxKNePQnzI=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBnKUXvi+g59Vrsu8lb/TSjHT9e9k2QLD1e9OF776c/MC dZ6xZesO0pZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCR7Z8Y/tnvt1nsFP7AXCD+ slpO5+aNDM5LFWZ07QpQOZT4eUEb70ZGhvvcF+8s3/0xOVF693nJeR0HXq/kfrHB6nVHZfH8Q29 sznAAAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

On Mon, 12 May 2025 20:52:51 -0500, Rob Herring (Arm) wrote:
> Convert the Marvell Feroceon/Kirkwood Cache binding to DT schema format.
> 
> Use "marvell,kirkwood-cache" for the filename instead as that's only
> compatible used in a .dts upstream.
> 
> 

Applied to riscv-cache-for-next, thanks!

(that is the branch name, even if this is not riscv...)

[1/1] dt-bindings: cache: Convert marvell,{feroceon,kirkwood}-cache to DT schema
      https://git.kernel.org/conor/c/438d216e6791

Thanks,
Conor.
