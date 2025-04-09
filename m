Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483DE25F965
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 12:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744201429; cv=none; b=BZ8DY3H6vdHbyFvEFKBlKMQePC+1UKMnbNiyqupHKeX3Ot8E9vM3hQ3o6Sc3yix8rYx5wqrOJ5WlDJxiHRhMz0Y2D4noD+pmjo9osigK3e6Rz6sSkbFOe+gNaTtOanoBV1w13jGGuMXA1hyUJo2x/BJob/6QL7ZvjAY/IIIHDEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744201429; c=relaxed/simple;
	bh=dw/Bs++PpsNCE3uNfxFPVQNMSdRGskgKYc917Yg+n60=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gyRxRpuXAm5mukA8RrKxOXhdd909B5WElVfexwF/lVZRw3NAJYNkDke/sgdS/9xzgKZkw/SvFZ9pHbdlmziYSm+w2w535Hdl6bvje9v1e8e7lbPKco5+TXqkzu6ILEbqszeSiI5vf9yi1mNKQs5vw9eILHi/pbBVQneRxiYKUuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IZI2v7HR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZI2v7HR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF0AC4CEE3;
	Wed,  9 Apr 2025 12:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744201428;
	bh=dw/Bs++PpsNCE3uNfxFPVQNMSdRGskgKYc917Yg+n60=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IZI2v7HRHhyKd64bG+U8K20qScoYcl4Mh3twNz29DjGkOjrpmGPOE4oKpldGLGzrf
	 EP9vGFCVgEzlbKfHq4w8u6wVyw7K2dGVV0dMxyKVRrJzf8C32jWgym78Oz893aTpi8
	 7J7mfrIuIFxRKkYgFQEJ1hSb4CFULuNc9BerQ/BdbOTp9AALz6jSVenJyUsoaqgwdI
	 eQJ4tXSl36l2PrAmnI1Sey1r6LVQuNdge7tVBXvh1Mu1+bdf+1TsaGm2I/S1OVrNRH
	 AsufL0Nv85RAnSfpmuJoMD/hqs2kWX3uLSV/Z3pYN0/ZO69+rmedFYU+iM0JcBo4Vc
	 KTWGW+ajQRyyQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Peter Rosin <peda@axentia.se>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/10] [RESEND] mux: adg792a: remove incorrect of_match_ptr annotation
Date: Wed,  9 Apr 2025 14:22:56 +0200
Message-Id: <20250409122314.2848028-4-arnd@kernel.org>
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

Building with W=1 shows a warning about adg792a_of_match being unused
when CONFIG_OF is disabled:

drivers/mux/adg792a.c:134:34: error: unused variable 'adg792a_of_match' [-Werror,-Wunused-const-variable]

Acked-by: Peter Rosin <peda@axentia.se>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mux/adg792a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mux/adg792a.c b/drivers/mux/adg792a.c
index 4da5aecb9fc6..a5afe29e3cf1 100644
--- a/drivers/mux/adg792a.c
+++ b/drivers/mux/adg792a.c
@@ -141,7 +141,7 @@ MODULE_DEVICE_TABLE(of, adg792a_of_match);
 static struct i2c_driver adg792a_driver = {
 	.driver		= {
 		.name		= "adg792a",
-		.of_match_table = of_match_ptr(adg792a_of_match),
+		.of_match_table = adg792a_of_match,
 	},
 	.probe		= adg792a_probe,
 	.id_table	= adg792a_id,
-- 
2.39.5

