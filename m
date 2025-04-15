Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A453C2951DD;
	Tue, 15 Apr 2025 13:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725352; cv=none; b=iHALoB9QI6TIOwWfnrBu4r1InojwA5SHmHf1Wjt7m3Zr0uxoi6bV9cPrOe1sk95zXa4cwsZA3sdTMF2BOlq2+dhM4Q6jPI2MdQiA+1Jjc0Qs1W1t5j/tX3cf3vB2jfZgDcEftmWfsEy+NUJgF7o71T60hLVR+3kUXDitcBNIM5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725352; c=relaxed/simple;
	bh=tHUCqQEdzsYGv9blxVRG4A34WTyeoj4ucVMVtpgFJdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G5Wmts1qxPqXFbBUrE2KLkseTjqiNuzwoLy1vg6SxQuDGUqevyxAJHo0L7xvhLMHfeKr5TXmURf2h1IE3g4icbQ5iTWHyMiOQomh11zTKfFHAqzHPEJCzz7PkJCJhndFEyvP/CHsYykwBm6IX93b5K9+s6pLrFiaqHUoo199/K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Y7PIHt3T; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Y7PIHt3T"
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF27B43B62;
	Tue, 15 Apr 2025 13:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744725349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vltx8mX8ESD4Izg3jWX1FdzqFZybnTpIrj/T6kwhbj4=;
	b=Y7PIHt3TdvglBtvpaf71cuytlUfvac/z1WF3tpqrQf+0fRmcq7Al7CCupeBl+okgYFsmqH
	4tO+r0QA+rfegpOj0M4adti30DXuFD0pRWnuH3TD3AKLy8WMkHgTYMkQUXYr/HELSAUH4E
	s9/IhI/yulLeSNXZzYecrAYZWcd+2BmgjSAI+tv+yLPeRWw0eWCBQuaJuP31V7t/dUj2Tv
	VG9vb2TSvnU6rIDJ7dxF9aRkAv4n8l5fzZXK5L3bTSarzGsX0Gj9t74YaM2nfyxHGpP7HI
	kecFSkSWc5KdFT79HKkKdujixSnVYracvJinT9tuCXpCscn2+SvN56zKGHafqg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 15 Apr 2025 15:55:38 +0200
Subject: [PATCH v18 7/8] drm/vkms: Add how to run the Kunit tests
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250415-yuv-v18-7-f2918f71ec4b@bootlin.com>
References: <20250415-yuv-v18-0-f2918f71ec4b@bootlin.com>
In-Reply-To: <20250415-yuv-v18-0-f2918f71ec4b@bootlin.com>
To: Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona@ffwll.ch>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, linux-doc@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1230;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=YGppOmZ08w7cdLZ6VCQdJA6v437CNcrpfGrTCIG4Hjw=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBn/mVYl7A5OdU5wgLFgyJqo3WRwjpjBtmyRzIeF
 DTRv82maMmJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ/5lWAAKCRAgrS7GWxAs
 4sVcEACT01B7kphm74TDymnMyKEpMCa9bKQPZte1wJeWHiY7H9cgAS8xT9rhnERo2sDe/GzI3D5
 MN9bXVJ60rTo2XK14CNwaEf5BRWzpmtF9YrgqIcx90bB288yAgz6FwaKqOwhH8EAwXvj0yXO5KT
 mPqUG0qjJDSiJ7YmAWjXdNaIpeT/86M9sSf2KXZxVwaX/fLMBJpmvwhn6AHsuGn5EG2kWTD9gCM
 xXQ/mv88CxmhAQ/fSrAETbrmxEGLOinaLCxwNt+jOecr7dIO12W++lYSU1JMtGBVRU3l9fK8BvF
 7jhDq8vj0QCnzqB6zOcfMx00E/cXXHhrVB13t/MdrPwvCF9qEZgh7vOLBh809FeFM72vipaU9De
 U5LfMTuAQZT25Yc+wMYATzN5MGTXaBCNqFoonfd/BTvnuHQEQLlS+aIXoZlaHXop1xJRLW+SzR+
 5hn8cZG4Vb99ikWhtVTX8YrsAi268SuiXkneHfOrnrCBaPUBNlO+H9IxVHfXryroipPQKhLUs7I
 WQG17CqbnqNOmOXZYqvIESSenQYhrDab1fTTFh5g3KMiEvPTbI+a8lmfcmxHJgfESFVviczAvcq
 QKrM5LCp3OzuTDh46Szvrq86zlQv3FX2YUAGFR3DTOHb1+U0hC/7Rp399clCnuBKOf9YI/cE+sw
 ENBQvcl5xu8eshg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdefieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelfeffhfffhfeukefhvdeftdejhfevfefhffffheeiffelieejkeehvdettdffveenucffohhmrghinheprhhsthdrthhonecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludejvddrudekrddtrddungdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedviedprhgtphhtthhopehsihhmohhnrgdrvhgvthhtvghrsehffhiflhhlrdgthhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrihhrrggtrghnrghlsehrihhsvghuphdrn
 hgvthdprhgtphhtthhopehnihgtohhlvghjrgguvgihvggvsehgohhoghhlvgdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepmhgrrhgthhgvuhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepjhhoshgvrdgvgihpohhsihhtohekleesghhmrghilhdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com

From: Arthur Grillo <arthurgrillo@riseup.net>

Now that we have KUnit tests, add instructions on how to run them.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
Reviewed-by: José Expósito <jose.exposito89@gmail.com>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/gpu/vkms.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 88e0913ca33a..8a8b1002931f 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -89,6 +89,17 @@ You can also run subtests if you do not want to run the entire test::
   sudo ./build/tests/kms_flip --run-subtest basic-plain-flip --device "sys:/sys/devices/platform/vkms"
   sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/kms_flip --run-subtest basic-plain-flip
 
+Testing With KUnit
+==================
+
+KUnit (Kernel unit testing framework) provides a common framework for unit tests
+within the Linux kernel.
+More information in ../dev-tools/kunit/index.rst .
+
+To run the VKMS KUnit tests::
+
+  tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/vkms/tests
+
 TODO
 ====
 

-- 
2.49.0

