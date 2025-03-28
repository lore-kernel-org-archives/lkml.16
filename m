Received: from out203-205-221-202.mail.qq.com (out203-205-221-202.mail.qq.com [203.205.221.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0219A1F5E6
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 01:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743126708; cv=none; b=MxfhCjEeUAgBRQ57oKragINektO0ybhUYfO6ax6bbM/iTKS9q9dNNPtS5uoRf77RQgnrOTF97EKP47JQLFOMQqIT7S0eVm0ofGRQ3lYDeJvvEZimssxxPFF6rouCXB/4/4+LaFWZOG2gTlMkPaKHFzm8tEFDyGpJ7y9dix2j6rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743126708; c=relaxed/simple;
	bh=CdInnaW2IoMquTqrJ0EaLqunLOWjgUx9zTs/KAhtqgA=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=UNjirnH1hSDvn0qJIbRXf+kglQ1W589CqTDFRBT6CJTFhfGUHNgW56AMy66wSi08vQ8s66XWOwija2tGSDxdgi93O48niZQe7iEOrcvze8rKFACnf2IYrMk99pmppC+86QGJq5/8bQotmpnASQBufee1UgWWasC+ZjzJGv6dR1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ZQYhvZfJ; arc=none smtp.client-ip=203.205.221.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ZQYhvZfJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743126403; bh=PjXUOGWXY+dEUkurv+VbTf8nEAUGXROEdkAf6TL7DIo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZQYhvZfJiWbu5bslotLmCBIyFbSl+Px7tZABXMxkxLPJtS0fD5mXSHmDuXF8z+TOC
	 jVTIsgXzfsqgKKYD8c8kurSojyJ+wHHAMRfRbu7T2T0WN7M7cFoP3V47oWpmjj1NNh
	 UFHBcqmUly4tPxr8xnovrpHHK27LhhByyOnHagLo=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
	id A16BAECE; Fri, 28 Mar 2025 09:40:22 +0800
X-QQ-mid: xmsmtpt1743126022tnsyc6efw
Message-ID: <tencent_10073A637F934BE4C78884A0465872286C09@qq.com>
X-QQ-XMAILINFO: NkHKfw09D6j8I5pEsPCmWh/6BKZqiMrnvcCXG4fCP1/9IllAXb2wFCI+NKgdTe
	 Hi0yLm8wVOiu8gzYGvTKkcpuKUtFk1G3BtoZypnScNh4JxQuCECK64vFjDU1Z5HQP6QrRS9ZA1E+
	 Fkt34nHUlLdC3c8Y7QsKeMWbQltbwiyRLSfvTlPLoZHuk9Tpv82RW8kPjjrk5QO0cnnBJqnuFsNk
	 qba98qvUg8lv/LoqkAHQ37x6EBhgO2J+/UVZYDYwinCvQRw6PHQvlcglzr3WpmNepmdo0kkpUyAf
	 FEFoH32j1ZaYvAHbRE9QgzdBS5zlKgkuE1Az+3/jm3FDaL+R3jzmb6+eWDF8L5GEe/sLDF0qBCut
	 YjI7lGfA5btSV2QKV9hYaK8v1lTolRhbDKFMUfFfyihBsk1+kfdnPutluioh9lkcsktHKuPMJmXo
	 9wndBYSuyneSosS/wTapNel6fFZARYFPBRBVpElgwbbHIpXC0HY+wRlVbz8WtxO9aBrrVnDhfxa7
	 q7PHAwcxEkkYpeA0fKrLt3GhrDY29xmIIQyMsND2VZ9kapOvUwthmyMU1yfnthUTkSJCdfGZEIY5
	 xkSkTS5ai2BAx7TM4CA2xDkqFIEtxq6A4Iu3aDPW+5WzC2La6/zoeyEsAmztG2808+ienjqg08wV
	 D9aEQi0AxG8891e6Ih/QU5sLdTFWTXO0OFt/Ksm9nxEMucb1Ty7QqPFDXc3JToCsrScTogUFHrIe
	 oeB3akTgJFXu7JciocPKMgA+OOKuh+6ODdWKMDYh1/ksiRaE2Mg5IkYAmWm50S6dDda1a2PiP5fF
	 imKZlCvO2ZHyjnslAErSeSy82EartcnbEQ3k2WvlzzLOMQXL9L1/8xlfqHAZmxucnMxTvM4YZ2qm
	 raqRY+cA9u8e96L91cJGz+YjOC4CinmRG+rjPK9rVMKSWEWtne02CCZQV6ztuA5FiCh74loni7Af
	 odA2YfbiO9iJ8j72OqGuECzWpqCUeY
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: Yaxiong Tian <iambestgod@qq.com>
To: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaxiong Tian <tianyaxiong@kylinos.cn>
Subject: [PATCH v2 1/3] nvme: Add warning for PST table memory allocation failure in nvme_configure_apst
Date: Fri, 28 Mar 2025 09:40:21 +0800
X-OQ-MSGID: <20250328014021.94451-1-iambestgod@qq.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <tencent_4A5421BA11BD9C5B5BF3CEA95FD212AB3107@qq.com>
References: <tencent_4A5421BA11BD9C5B5BF3CEA95FD212AB3107@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yaxiong Tian <tianyaxiong@kylinos.cn>

Currently the function fails silently on PST table memory allocation failure.
Add warning messages to improve error visibility.

Signed-off-by: Yaxiong Tian <tianyaxiong@kylinos.cn>
---
 drivers/nvme/host/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index c2d89fac86c5..fb0404fee551 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -2678,8 +2678,10 @@ static int nvme_configure_apst(struct nvme_ctrl *ctrl)
 	}
 
 	table = kzalloc(sizeof(*table), GFP_KERNEL);
-	if (!table)
+	if (!table) {
+		dev_warn(ctrl->device, "Failed to allocate pst table; not using APST\n");
 		return 0;
+	}
 
 	if (!ctrl->apst_enabled || ctrl->ps_max_latency_us == 0) {
 		/* Turn off APST. */
-- 
2.25.1

