Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B99E55B;
	Fri, 27 Jun 2025 00:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750985226; cv=none; b=EFJ3pHL15oqZHLDCTbIuLY/JZKdqE6Pailds5m97LLWhuZ7JUu6Gz4XQ9vumj/NUWc0ASsectcmu2iOib2koOWnw5KnEE7k3FvoNb2Fehi+1FZWzXNF7OErEGzWm9HYan0V0m3z6HXgR/SoAq3kkCaI4ZOoUrywBqvb/k+iGmJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750985226; c=relaxed/simple;
	bh=hgeVknDOC/0zBF1/a5xJ9tCtK3wFHkbZAPTH1sx75Dg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DLkfQSZUsGbHrQy6gD/LORvIswmTqS0ORd0YfxF39JBWskV+fTvIo4V4Oh1xezDE2iX9ZCBtWOVQi4sWUzRWa38hNyPgim6BOBbGcdNNhMX2oGWkx4apUZsyjZraX9S6JJ2UrCcMeMO7n6+K6ODrNvbblzc7PTqrbAPvYIFQ/40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G73Nw3t8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G73Nw3t8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B421BC4CEED;
	Fri, 27 Jun 2025 00:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750985226;
	bh=hgeVknDOC/0zBF1/a5xJ9tCtK3wFHkbZAPTH1sx75Dg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=G73Nw3t83ZFM7Yc59Z15z979dAfVLGLng642E0ZsWHFjctl+bLIiBeI623MLDasLT
	 8bz+amtyntoCCeDDwJUDJ3wx0ftmEInKVSce90M/DGZ6sGH92/fSbKVwHf4Z6N6Vv8
	 mhU/BuWoEa/+uM5cBh930HisLc97kcs3h299T2SL4mMTsnlfft9hINYPtZa7F2PXpr
	 5yE7JVWu5lQBSx/YkR4CQeTz4MzRwj1iJyQOCCzcoMuS+zJiZmZjo1tlM5ZBJzKsh8
	 ogqW5FJzHR27hJgmwf3aak6VCGHc1ynBXyCiSZ2GBJ32QnG393coY8eXexl6W4Ae2u
	 AY2Smj0jiQ8Tw==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Khuong Dinh <khuong@os.amperecomputing.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <5b8e9b4f645bcac9d50059e513abba4db7e1aaea.1750771156.git.geert+renesas@glider.be>
References: <5b8e9b4f645bcac9d50059e513abba4db7e1aaea.1750771156.git.geert+renesas@glider.be>
Subject: Re: [PATCH] dt-bindings: phy: apm,xgene-phy: Remove trailing
 whitespace
Message-Id: <175098522563.106297.14885803182264962743.b4-ty@kernel.org>
Date: Thu, 26 Jun 2025 17:47:05 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 24 Jun 2025 15:22:29 +0200, Geert Uytterhoeven wrote:
> Remove trailing whitespace which hurts my eyes.
> 
> 

Applied, thanks!

[1/1] dt-bindings: phy: apm,xgene-phy: Remove trailing whitespace
      commit: 05c6f31991300f1c0e5e80eb1f66a580b9b5ca5f

Best regards,
-- 
~Vinod


