Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCED42163A9;
	Tue,  4 Feb 2025 17:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738688800; cv=none; b=PFM3reNJlsJOqVKhhQKZWggwyqV2VesATw1aBaInyKIzhWmMUAuNFDpJd04TWejAVnKqPIfQ+aLUsXTD8uXmZnD27l+UxZKp0q7KhwK0zxv1OpUb2+QKnf+yBZiunwk3d7UiXq3W98mMIpgPwS5a4Hf1KNdZBcampTz1hHuEOsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738688800; c=relaxed/simple;
	bh=p2DRIu8KLLvmm9Z/uj2gWCzSGzrsOqfFLMOVhZ+AzQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gw+Kl8hdKPK5NCmNpR4P9CRXdgEKRzbz6GJKZbvyx5mB0fLImfAEeLQXfK/P8UaRdzZlIfSrjvSyuSpEBs3Et9c1N5ZWLEa2d2dSkPuL4giGGIMTFySgF3skDek7a2dHSzilKGi2HB2P9Q4usK3TVkuueGGsDj9u4R6f7WA1+2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=d/qDg8j9; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="d/qDg8j9"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8791F204AF;
	Tue,  4 Feb 2025 17:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738688795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6zFF1b3j69EERw/FBO+Wy6FgZkbp8/xXMiSMoc8F0RU=;
	b=d/qDg8j9GAb5BYoC7Y8WAsTlCWIBoNzIC4zLHFOPiOJ/muL++Dcq+GIuukWgH1sUZnzEL8
	WP+Ps1FwtOw58lALybVz7vkL0y+zWu3YZOBBZ8yEEHp0JoZKA/oS/kLVoJwHMNagkoPRPI
	iKu22P3d9MdYDAGLjjiLzlXnIoiBpV0kU1bT7eYd7NQXJyfnxYw75zHOur9cehU6MYfioM
	MscAMH1TVKDnkD3+2ROA4SY6INZjM89Pgea2ECExXN5/9Jpk3zE/ic0f6+4ACfho9CUSG4
	SBYDLGcQbeNNyYXDux/QPMSDLj7DH/bpL7jcNEMKMupT+8Jcov+fDz4DS85BnQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 04 Feb 2025 18:06:14 +0100
Subject: [PATCH v17 3/7] drm/vkms: Drop YUV formats TODO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-yuv-v17-3-9c623880d0ac@bootlin.com>
References: <20250204-yuv-v17-0-9c623880d0ac@bootlin.com>
In-Reply-To: <20250204-yuv-v17-0-9c623880d0ac@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, linux-doc@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1022;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=/yTvpBX8xyEutWAbZei5v4J/5jD2SVjZo3rKvYXn4Iw=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnokkT/Ml2tdFrmKGrmQABrVDSQPTALUXhrbLAf
 EM+Z8CJLn2JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ6JJEwAKCRAgrS7GWxAs
 4upmEACh0wIP/zOkbI0c/9rSHoeD/Vyk3P2BsEJ0HCTzf9DtPcI1ek7nYT3O0QCdictmsNrSb31
 IcIn5rUFx6hayiK6EToogYFuYjitor2KVeMVB2syicDLL89QNbdEJ/bNWPQaG2RX02JxjMB97S6
 rnwEXioJAzIx9qfqrKE1rl7qCRZREt6d0fyksVe4P5H0USDOdtLQ+0U4ars+GSWd+iBM713WCN1
 12TCoETMVCTIRKGCNMLFugySPpQkJJlR6Nmyk/bufETtlY+28xtRDyr7pLRA0Hg029J4kf5Wki7
 MPgcIwMEEmm4VgOlhpEhq/SHq20g723P7WwNaX4ZtKtaL9VvQ06VNDOKD5wQ0D9cvNgUM54RVuq
 fC8lxauB3I0LhJAmkqev+hUJNdIZcCHx//WXERBDXM9w6gYCInzZHjhjbJxoOUQr3imHhruzMiB
 aXG+ySV1niXyZEOs4fr7vexKHY5jYlWMLgihofeKkD9JSakf+1J5+g8GNDvuKR4pVSUa9TphH/m
 Uq1t6YLhX+5odWfBfmeCx7HANCVi6uF9r50ELX02s1p99S1Yuo56dW+6nvAnQselPCd2N8vQxi9
 iAmk04Zr6jmQoau7atn8FSvsQGjzlCS2TQ55KefklrvySS+GC6Hg0o1lrNxF5RTwjN1EZiT6TJk
 VFbDrmC98Vl5WNg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephedtjedttdetieeigfeljeekteetvefhudekgeelffejheegieevhfegudffvddvnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludejvddrudekrddtrddungdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvhedprhgtphhtthhopehrohgurhhighhoshhiqhhuvghirhgrmhgvlhhosehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopehnihgtohhlvghjrgguvgihvggvsehgohhoghhlvgdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhni
 hessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehpvghkkhgrrdhprggrlhgrnhgvnhestgholhhlrggsohhrrgdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com

From: Arthur Grillo <arthurgrillo@riseup.net>

VKMS has support for YUV formats now. Remove the task from the TODO
list.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/gpu/vkms.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index ba04ac7c2167a9d484c54c69a09a2fb8f2d9c0aa..88e0913ca33a83255f40411472f48a849002e76d 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -122,8 +122,8 @@ There's lots of plane features we could add support for:
 
 - Scaling.
 
-- Additional buffer formats, especially YUV formats for video like NV12.
-  Low/high bpp RGB formats would also be interesting.
+- Additional buffer formats. Low/high bpp RGB formats would be interesting
+  [Good to get started].
 
 - Async updates (currently only possible on cursor plane using the legacy
   cursor api).

-- 
2.48.1

