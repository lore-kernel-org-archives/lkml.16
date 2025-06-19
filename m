Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897AD191F91;
	Thu, 19 Jun 2025 01:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750297186; cv=none; b=j/br4Fq/1qp1bQVPZJh+CTHy6w/r5IhOLKaGKQ/Qtp3UxSYGVLrpfE5EOhD3TWdrX189oPLNQjvX8hp4a6Zwak8D8uFjVeKj2D60E7G2gnfIwWKpVvSjIVKMHD6frhozFLU2uLZax0D2hDsAY9PkCbcPMiqr7TBg28ku1XZFjDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750297186; c=relaxed/simple;
	bh=qvn6T0SveeLiggUZXUzGFW0xhTm/WSr2hKAHtkgyrJw=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=uDTepCPJyyI3b8VeKKw8wcBgnoFGkxG/UXeyfhWmCGdg/HFHH7KGWP7TpNDdyiAfcsGpnQw+TW+G90FP2dy45yEIiB9Wp5o5iuLG5RdN3Va7dHY7liT5U8/sfBHWYXLrOBQ5acH0iQ5ZuekCSwt0/6RW58NYpAvd3IC8FGsHZWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fU0vPOGU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fU0vPOGU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB73C4CEE7;
	Thu, 19 Jun 2025 01:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750297186;
	bh=qvn6T0SveeLiggUZXUzGFW0xhTm/WSr2hKAHtkgyrJw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=fU0vPOGU0FANIFomeQiGtz7Ksy+077Y3o8VyPnCSuPBnBiIbphYWkqKkN60QqFmsj
	 13pnP2vCtMrRejKZpQCXUkgJTH2riuwYEo/YOZLyq6Wyroi0cMu5VBwIHBe5PUX57y
	 /KffHYRDykxVS+ZY9PJXB78FguWvqrTnII7wQ20qImEs3I1i+Ei3JYVW3PTHOVOigD
	 DJ9pjdSe1Ne2xFIhMGl1JwNsgYXZT3F8eXHyJdMQ5yefT0Fh23D76/kATaV/opPp3a
	 1IGKjQe28lqh7QjDv7y3a7c7I+ZxpQS1UYijoYRYwiNIJA9+laaL4YXsgFR+7IiMYn
	 8OpuRxO0jExkQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250521210712.59742-1-robh@kernel.org>
References: <20250521210712.59742-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: Convert img,pistachio-clk to DT schema
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring (Arm) <robh@kernel.org>
Date: Wed, 18 Jun 2025 18:39:45 -0700
Message-ID: <175029718509.4372.8530669371922520484@lazor>
User-Agent: alot/0.11

Quoting Rob Herring (Arm) (2025-05-21 14:07:11)
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to clk-next
