Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FC725E80B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 12:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744201461; cv=none; b=GLQqRHgoHr4in/zHa3OonlXERZIiWe2nyidMYb6DL7LourVUQwyGW1ohBGGoGmLQwbwLy3BiFPll7SiBdF7U4go7Fl/kEf2alZF6GBSsltf3uf0loCYM3bevY3bLpp8Q0itfdEHdaxFLj650g0mGHKXn8dnpMqJS8kBRmgRSBhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744201461; c=relaxed/simple;
	bh=4f3zqeUf2l96bOM8cmDyuUo+fnc4TY8/SVT6maVvOTU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sDe61z8ihf+6IkyluT1igW7l2USH5NEeDqJaB/SdV8cRvty6rqftjFXftJD6EhJnLUtUbUgn0gLV4usFeDITInMNlPQRqO9TjNrcwXrqkq/sScZ6W9xO3gRrkdoX2bu5Ut/KeXlW5QiSojetSSgchIvJcA0OTQXSw2oqUGV3wWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cVJuMTIJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cVJuMTIJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F79C4CEE7;
	Wed,  9 Apr 2025 12:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744201460;
	bh=4f3zqeUf2l96bOM8cmDyuUo+fnc4TY8/SVT6maVvOTU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cVJuMTIJ/Pnv1YUYnoSmuzXCXUPjfLGY3NsM+ComJejxAOSYH7xZe6xjP7YFL3Zwc
	 L5MYHrCoxIMCVaaR6hnBhnIM286M33F+a7VKqYCa1JSy6J2FxCOyCxzzQh8Hv/rUk5
	 XyofOcVjvRua+Lk58UmRHcFROz1fB4sBrzpGcs3oHIBQ5dvYJsMJNNkenywEl5mSFq
	 jCqkCAXHxbmjC5asGvqfO6wnWwxiosTf9wMgubVHCWR4RLjm4GADCHbcy+gxKFXQ4f
	 olBzl62clnJ7Le8LhqiplNT2cu9u9tdLfTtomiwvpQ7qFThMvbX40z+vRvd6eWHn5W
	 nilFGJEhK5xiQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/10] [RESEND 2] comedi: ni_atmio: avoid warning for unused device_ids[] table
Date: Wed,  9 Apr 2025 14:23:00 +0200
Message-Id: <20250409122314.2848028-8-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250409122314.2848028-1-arnd@kernel.org>
References: <20250409122131.2766719-1-arnd@kernel.org>
 <20250409122314.2848028-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

When the driver is built-in, it produces a W=1 warning:

drivers/comedi/drivers/ni_atmio.c:209:35: error: 'device_ids' defined but not used [-Werror=unused-const-variable=]
  209 | static const struct pnp_device_id device_ids[] = {

The actual probe() function has a different way of identifying
the hardware, so just mark this one as __maybe_unused so it
can be dropped when built-in.

Reviewed-by: Ian Abbott <abbotti@mev.co.uk>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/comedi/drivers/ni_atmio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/comedi/drivers/ni_atmio.c b/drivers/comedi/drivers/ni_atmio.c
index 330ae1c58800..b4e759e5703f 100644
--- a/drivers/comedi/drivers/ni_atmio.c
+++ b/drivers/comedi/drivers/ni_atmio.c
@@ -215,7 +215,7 @@ static const int ni_irqpin[] = {
 
 #include "ni_mio_common.c"
 
-static const struct pnp_device_id device_ids[] = {
+static const struct pnp_device_id __maybe_unused device_ids[] = {
 	{.id = "NIC1900", .driver_data = 0},
 	{.id = "NIC2400", .driver_data = 0},
 	{.id = "NIC2500", .driver_data = 0},
-- 
2.39.5

