Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD82618CBE1
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745327323; cv=none; b=bkDqndUxG8Nzb24xfUf/JE+YVroCBUzecZEeC9VIX/XsUtaJiOHdhndgQsuF3UjCO1qk+B9PogKrhClqnBL6LotAwuJKdOlScBz5odrZsjf25w2kBR/Dbih0TGHPWWCtWluT0+49NZ8xm57PYbKOeT0qlBHUvePCc6BFm1nTvfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745327323; c=relaxed/simple;
	bh=IQwy2SzLPzM+v4MDQXs7828lO5dmCas3qG4gF2jXqsg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=g8Vba9FV+2uUpvEhjCOOTRI8B5UZ9ZlH6yfQ4HqHz5vmJ2Yfm3VZoGMFNUkWeQ5Q/vYopIVrqkXYwTozJc0j/u1vQZjY+y4sd1zO+yTg1QeLYlNEMttwLbEEuU8tidgne0IMloK3h5rdxLuX6icb7aRcF9ZgH8iewFyRPpSEoBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 976291FD49;
	Tue, 22 Apr 2025 13:08:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
	(envelope-from <peko@dell.be.48ers.dk>)
	id 1u7DMZ-009gwR-26;
	Tue, 22 Apr 2025 15:08:35 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Praveen Teja Kundanala <praveen.teja.kundanala@amd.com>,
	Kalyani Akula <kalyani.akula@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peter Korsgaard <peter@korsgaard.com>,
	Kalyani Akula <Kalyani.akula@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] nvmem: zynqmp_nvmem: unbreak driver after cleanup
Date: Tue, 22 Apr 2025 15:08:31 +0200
Message-Id: <20250422130831.2309995-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeefkeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepveeiveethfelteelueelvdffieevgfdvtdeivdetuefgffdtvdeuffevheegffdunecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghkoheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehsrhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhrtghpthhtohepphhrrghvvggvnhdrthgvjhgrrdhkuhhnuggrnhgrlhgrsegrmhgurdgtohhmpdhrtghpthhtohepkhgrlhihrghnihdrrghkuhhlrgesrghmugdrtghomhdprhgtphhtt
 hhopehmihgthhgrlhdrshhimhgvkhesrghmugdrtghomhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: peter@korsgaard.com

Commit 29be47fcd6a0 ("nvmem: zynqmp_nvmem: zynqmp_nvmem_probe cleanup")
changed the driver to expect the device pointer to be passed as the
"context", but in nvmem the context parameter comes from nvmem_config.priv
which is never set - Leading to null pointer exceptions when the device is
accessed.

Fixes: 29be47fcd6a0 ("nvmem: zynqmp_nvmem: zynqmp_nvmem_probe cleanup")
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 drivers/nvmem/zynqmp_nvmem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvmem/zynqmp_nvmem.c b/drivers/nvmem/zynqmp_nvmem.c
index 8682adaacd692..7da717d6c7faf 100644
--- a/drivers/nvmem/zynqmp_nvmem.c
+++ b/drivers/nvmem/zynqmp_nvmem.c
@@ -213,6 +213,7 @@ static int zynqmp_nvmem_probe(struct platform_device *pdev)
 	econfig.word_size = 1;
 	econfig.size = ZYNQMP_NVMEM_SIZE;
 	econfig.dev = dev;
+	econfig.priv = dev;
 	econfig.add_legacy_fixed_of_cells = true;
 	econfig.reg_read = zynqmp_nvmem_read;
 	econfig.reg_write = zynqmp_nvmem_write;
-- 
2.39.5

