Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B96719F47E;
	Tue, 13 May 2025 14:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747147511; cv=none; b=RkhZM6hZqQep3Muc5CFrdqvrBRvUnmLmcIH7SfN4EtoGsMaljMYQ5l1rT0Kt0BDZ7BOJ8DrPGb5OXUUnnpinqpMfNiHXHSE43EoSDr29p/DBsLXM26paJSv4yLsHYU6OagkTpoqS4BA9dxQ2NjyNBF3vMrh3XFYcHk0PqlVjMcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747147511; c=relaxed/simple;
	bh=DdDrWj6emgO60ngzGeK6X6Y9DbBXXEFDofI8V+l00AM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rj1ejSJ4Yth4SmXj6gmAo5PAIWq1dA37VApBJQk9rikax8/gp1PF8mNRblxb4BkcjyucxUYp/MDkzTr9QNpc51iUTjgZoVi+sNyiNZ+y+HQQqiUcM6mTMpnLp8vssrtemozDNshIdvnpqzwdtrUmm0DdWNcrAanVdkvnfS4t+iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X4qBE7u2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X4qBE7u2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9A31C4CEE4;
	Tue, 13 May 2025 14:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747147510;
	bh=DdDrWj6emgO60ngzGeK6X6Y9DbBXXEFDofI8V+l00AM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X4qBE7u2OX9o0sEla1sfi0HeueqKHrgXZZppNa+4YBYffA87NRnzET9jrIwXZs1FP
	 1hn7ly6avlZN8HAaIKLIskF4qlMHjYryAbRFMFE8dUczSxSnGRI+HqMKY9UTjS2DMs
	 ltQ67CfTvxzYFmzSuiMrE3rukSNHzAromqt2+esgeIGVJOxmQD0wYbwqfZw3YssXHI
	 SExB1w88kqH+JizyX72Z3ZUttKP0vDssu+nt0K/yk3NwFhTjrvZraj3a/6YBprhTGM
	 lX0RMfE5RAVRPKlmUzd0hcA6OZsxhYbVd+YSJzihuvV7rSEUh0ghkaivP5+O4NReLG
	 iPYYTYviiNmHg==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: cache: Convert marvell,tauros2-cache to DT schema
Date: Tue, 13 May 2025 15:44:14 +0100
Message-ID: <20250513-epiphany-septum-e026d5e69a57@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513015302.1049682-1-robh@kernel.org>
References: <20250513015302.1049682-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=254; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=6cq7wfCBQFfk5cmYqlbrwJzWiUrvA6Fmh4VRqZMIIso=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBnKUXt23Tv1Jj7j5FuWoARN44nO9aUXeB72va1/pVLpe G/iSs2vHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjIuSmMDIeM759QmzdFPYXl Xm3hiw+/GYMjFiz84H5wrrV2TKJsyEJGhjaBFo22y30Rr7ew1vzinHCSz2//r2uaLib8y1uf7T5 TzgwA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

On Mon, 12 May 2025 20:53:01 -0500, Rob Herring (Arm) wrote:
> 
^^^
Body was empty, I added a trivial one aping the subject.

Applied to riscv-cache-for-next, thanks!

[1/1] dt-bindings: cache: Convert marvell,tauros2-cache to DT schema
      https://git.kernel.org/conor/c/64d60a02036c

Thanks,
Conor.
