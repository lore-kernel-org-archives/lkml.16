Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8824B20B81B
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 14:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739285681; cv=none; b=YCpkONET3ORtuSq9mF56Tw5tgfL7184GeQa7KpZ7IPIpj0vLmmqJUZ+SGZRg1oa9J+6WlkmMcVN0pjpeOw4K8Y4ncNHzDxsWxecYpL1dnDPXgcCMkwJpZxBF4nRXFHNlpxyVK/NpEWkLWciZgvqRd7B4o9S8P8rGkYagtr/gR74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739285681; c=relaxed/simple;
	bh=dR3vaZVDNRhwd8fLzY4rOE2RaJeY/gMcVpJjbHBB+7M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mFYdpr4Nkzqnh1yMfSF05SWZH5mz40Yvip16zHhCSN2qjA9tuRIaTLQAWxCPcT+BLiz+/qx4VzjPLBOllPpmQAhMGZbxuX8L2sDaIXij94SmSJf8yGOh57QSwDAF8iNM4Cd6TJoruPJa2QfJH5draEyFgtkYkxCjngbrenUSOc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QHOWkxnR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QHOWkxnR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 264E3C4CEDD;
	Tue, 11 Feb 2025 14:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739285681;
	bh=dR3vaZVDNRhwd8fLzY4rOE2RaJeY/gMcVpJjbHBB+7M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QHOWkxnRXBMnSXVmlpgVyKs6prkOhBaokBMgS9QBqIDibTMpvos/NjkAi65ByEUnR
	 sjVc8HEfg26NOK2WP46aHn07e/PbDdBIutRdx1ziP/hiK4MRW71+uWAgDesXcNRmql
	 unbuiJOSrIw32U0BABGhaxaK8RHKycfbmKNdYOxgKJlP5WjfHN40bkLlyQajHTo6EV
	 tJ9H5RHogKx765/f2qRWSOGfBpzcu7B1hS/F8f+jTCol6WBxB1lpMrq5T4lRZF7RYS
	 cchxTBtmZBjjeHL3VakDOPSguKe29Yl1qvZ7Xr6R6ET8rcXYUqW3PVnwt3y7S9rSpE
	 hkqw26LzfwMLw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Pankaj Dubey <pankaj.dubey@samsung.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: Will McVicker <willmcvicker@google.com>, 
 John Madieu <john.madieu.xa@bp.renesas.com>, Nishanth Menon <nm@ti.com>, 
 Vaishnav Achath <vaishnav.a@ti.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20250124191644.2309790-1-robh@kernel.org>
References: <20250124191644.2309790-1-robh@kernel.org>
Subject: Re: (subset) [PATCH] mfd: syscon: Restore device_node_to_regmap()
 for non-syscon nodes
Message-Id: <173928567889.2224464.12697953870263722001.b4-ty@kernel.org>
Date: Tue, 11 Feb 2025 14:54:38 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Fri, 24 Jan 2025 13:16:44 -0600, Rob Herring (Arm) wrote:
> Commit ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a
> "syscon" compatible") broke drivers which call device_node_to_regmap()
> on nodes without a "syscon" compatible. Restore the prior behavior for
> device_node_to_regmap().
> 
> This also makes using device_node_to_regmap() incompatible with
> of_syscon_register_regmap() again, so add kerneldoc for
> device_node_to_regmap() and syscon_node_to_regmap() to make it clear
> how and when each one should be used.
> 
> [...]

Applied, thanks!

[1/1] mfd: syscon: Restore device_node_to_regmap() for non-syscon nodes
      commit: 5728c92ae112301936006c5e305677beb1a7f578

--
Lee Jones [李琼斯]

