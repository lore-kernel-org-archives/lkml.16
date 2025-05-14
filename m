Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D12827466E;
	Wed, 14 May 2025 11:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747223770; cv=none; b=UItkz3ncCVH/+KF2tCLQIiuCtvJYDSMtMV4YnSe9mFOsxdhzfXJ/01r4HfYq6ausHomUbYH27XeyvHwZdUpzlE8RqKzucIUDSxGegU0F0MnpQPraNsGOS+2nCSiGVdBBIQ1WK2fRcbh6P8o9kFsJCcTkCTx77+5Zv8iWzTcI4Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747223770; c=relaxed/simple;
	bh=FxUj0Q3Hbzzlo9vltMkfS3G/1BLac1smAJqfGR4/wdg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SfzpVANfdMG9EXsGi/jpSKvtkZwU3fAuk+qRi1fhv7Y9RzATDBMOUSClIfuCabAiQmlbwIYpBpKLYkff9eK7NL8ByDYx0LrGJurL56JxLIuefw1kE18UVEEh1nTqIPzSqwWxH1YZN+Tf0iYeARyn70v8rDuGdGy/DROA9FCUENc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GgBbZQJF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GgBbZQJF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C009FC4CEE9;
	Wed, 14 May 2025 11:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747223769;
	bh=FxUj0Q3Hbzzlo9vltMkfS3G/1BLac1smAJqfGR4/wdg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=GgBbZQJFmW7VlTZ1fu2WUMqOP6sdxbuXUGXqDBWMOma+t+8cpBiTy4w1WFeRzeA72
	 k0G0Bg60UetylV4HHOvdWYGcC5F7GpkbibqzS4Jd76d/0Vhsg3hglkGmhPPvON8cuz
	 ioSdfOwKbJANZDCzDXrSxGVXnlGGUAaCr8VdOk3SzVgVwYFNDXkTWXoju+0rCkjbWT
	 Loh9Xal05rdIvrNTknk7CFzhMjd/owA4Z7OkAKrxKUm8MVPbm0SLMaJLutcJp+83JP
	 rKODGm5wl8vo/76Wz4rgXd5oQJnG2Vwoa1ar6zHwW9EOIgN2PoYamfM4+KavFVcT4b
	 ei+sTAXKWE6Hw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B01E9C3ABD8;
	Wed, 14 May 2025 11:56:09 +0000 (UTC)
From: Alejandro Enrique via B4 Relay <devnull+alejandroe1.geotab.com@kernel.org>
Subject: [PATCH 0/2] Add u-blox,neo-m9 compatible
Date: Wed, 14 May 2025 13:55:53 +0200
Message-Id: <20250514-ubx-m9-v1-0-193973a4f3ca@geotab.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMqEJGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDU0MT3dKkCt1cS11zg5Q0g7QUi2QTiyQloOKCotS0zAqwQdGxtbUAwmY
 FzVgAAAA=
X-Change-ID: 20250514-ubx-m9-70df0fd8c48b
To: Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Alejandro Enrique <alejandroe1@geotab.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747223768; l=668;
 i=alejandroe1@geotab.com; s=20250514; h=from:subject:message-id;
 bh=FxUj0Q3Hbzzlo9vltMkfS3G/1BLac1smAJqfGR4/wdg=;
 b=Fclj0erYWxoN7IjKp0yeMD6wAsRkETKDIqX3C3DQKPx96XyFgVi7V3R6LRMCKld0+U3kWJPmT
 7Dl3VW5yMMpBik9K5deywSu4j0cPHsf5mmvqZvuKiZDrCSOrGe/9QGe
X-Developer-Key: i=alejandroe1@geotab.com; a=ed25519;
 pk=xzHMPbqczL/tMsjXr26iLoHwIzLveHVnT+GIU4p1k38=
X-Endpoint-Received: by B4 Relay for alejandroe1@geotab.com/20250514 with
 auth_id=404
X-Original-From: Alejandro Enrique <alejandroe1@geotab.com>
Reply-To: alejandroe1@geotab.com

This series just add the compatible string for u-blox NEO-9M module. I
have tested the driver with such a module and it is working fine. 

Signed-off-by: Alejandro Enrique <alejandroe1@geotab.com>
---
Alejandro Enrique (2):
      dt-bindings: gnss: add u-blox,neo-9m compatible
      gnss: ubx: add u-blox,neo-m9 compatible

 Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml | 1 +
 drivers/gnss/ubx.c                                        | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
change-id: 20250514-ubx-m9-70df0fd8c48b

Best regards,
-- 
Alejandro Enrique <alejandroe1@geotab.com>


