Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA26B2737F5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 12:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751371347; cv=none; b=aF91NSw9MPjrN034p+iGeaFvwJF3Lvs8W47t8B17zoU6MWopGaptzN9Sieqn5dD4UgwGoyVDulpmKSj9i7Db1LgXCNnPzwg4NiRZTIgBq9LoqAD39pK3Sad8wQpPxtwJ4jdWIuBKyMC2o/OFP7ag7h0aO6J94LWpcmoVsOjIQ0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751371347; c=relaxed/simple;
	bh=RvKrbR7rC6HMkMypNpw8oY7SOj4JFfsc8Nsm4Wygm+w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oVoI8QpAw+MRa/PMSy7bsC4XITn/7MIz+58a1Smj6dyzarKMtdaGsLW0o6HBlm6rYmJZxjONLqLEowDRYvU4P099vE6hVOO/FNAGf1mEg3PY3qraAQiTvjasnoT0ufSRVuLggVgxA0YKLMY0DnVjoGlMEm3xsnt34cOuTGspP9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wyGMCrD/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wyGMCrD/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243C7C4CEEF;
	Tue,  1 Jul 2025 12:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751371347;
	bh=RvKrbR7rC6HMkMypNpw8oY7SOj4JFfsc8Nsm4Wygm+w=;
	h=From:To:Cc:Subject:Date:From;
	b=wyGMCrD/dQBTa/veK9Ubv/w0cvWGHyKW3WgtxS5GOCUUen0dIu444Hm/GkoZCHqu0
	 Dpayabf6gu5kJWLH+gFqu9KKHciAnjJwF/Dk26i9E27CBRU67i4C2/LKjIkP09TNbG
	 AxrC6qji4itZmWJI+HgtVdTyWj1Z5PUDaMetAyII=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH] nvmem: make nvmem_bus_type constant
Date: Tue,  1 Jul 2025 14:02:24 +0200
Message-ID: <2025070123-spray-denatured-dda3@gregkh>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=814; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=RvKrbR7rC6HMkMypNpw8oY7SOj4JFfsc8Nsm4Wygm+w=; b=owGbwMvMwCRo6H6F97bub03G02pJDBnJ5/xvarA79i83b/jcqLdfI1GlOmzmVd9PzBfCbxTfN RWaGPmqI5aFQZCJQVZMkeXLNp6j+ysOKXoZ2p6GmcPKBDKEgYtTACZiG8owT0WTY+esNbGrgyrM pS/YSKcwbA2+z7Dg3JMKmT7dtbcFen69W/xiTruiqOdDAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

Now that the driver core can properly handle constant struct bus_type,
move the nvmem_bus_type variable to be a constant structure as well,
placing it into read-only memory which can not be modified at runtime.

Cc: Srinivas Kandagatla <srini@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/nvmem/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index fd2a9698d1c9..e74bfb956dac 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -544,7 +544,7 @@ static const struct device_type nvmem_provider_type = {
 	.release	= nvmem_release,
 };
 
-static struct bus_type nvmem_bus_type = {
+static const struct bus_type nvmem_bus_type = {
 	.name		= "nvmem",
 };
 
-- 
2.50.0

