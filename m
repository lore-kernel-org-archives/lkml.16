Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E182F1A08AB;
	Tue, 15 Apr 2025 13:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725349; cv=none; b=a28FbcbdNsliBLKJHszaHxj/EGnsvcx3BiVv3nP5BKIxo1lyd/rcEaisb4yfPGLi7KOesqItwMVbcnIEHIknfIL8O6IUVFtn1xswybBs0D5hEteEzBaG2okm4FvoRfGqONazxwbv3LO2GzDsXkee/M7jx8kyVNgzY5Ffh0YeaZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725349; c=relaxed/simple;
	bh=TE96165AetMbR/S7vqnxy5nn4WpdKRl+1GUBg+1t+iE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=teMZ+6YMKttSr7iGdU05le9mVuNoWKrjP2KUraqxHPivJdNb3FlZfYm7JzS/uLGbYsQfw0z8BUa1yvNQAepAko6n6sbKgt9YvR7n3qHZFnEk2jWWSfONnK2KG/ht8QCvjT4J9BibH+Eig+9CK2i1sV3qBJghL+iypbHbi309NmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ame845Xa; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ame845Xa"
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE3F043396;
	Tue, 15 Apr 2025 13:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744725345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dR9yWEIRRHJ25nlTr1+EBuKO+fo6LUQvlyPhe1j7Leo=;
	b=ame845Xa4/vDWc4kquMFbyAF8HPoAiTehqvTt3LK2TVfasIxeQvAS1kKmgIhYBoLgkC/qz
	bl2N4dazjzWjROjDxpXSTCmJ7pfWOPonukuaQJ5LEPL9VjiPoYaqCF3LKfPrLAPyQxIc1i
	PGe4/uCJyuSXBuua2pCPG6n9PoyPUBLM4+X1wiNpDExqvmbFJ6Z4xR4xXiI6gOH7vVlnx+
	WFqBpMe2kJDq77A82/f+/lHHDtiVdDgkawfOel76DEF9BJgGhwfEzVLvHPnWtHMXGf4qpT
	GFK72PCnDMUBsPXrGS3/BZObQX3Y93rD6nEpX33EZG2bqcnr3ctosoWLNmgdPg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 15 Apr 2025 15:55:35 +0200
Subject: [PATCH v18 4/8] drm/vkms: Drop YUV formats TODO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-yuv-v18-4-f2918f71ec4b@bootlin.com>
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
 Pekka Paalanen <pekka.paalanen@collabora.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=966;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=BFg9CaGVVOEbb1ePvX1HYTdy4iQZcBj7S0puGrXjR1k=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBn/mVXOr+3zUszbJLtfrrZ8RU3BoIYbd/+f4aAB
 hRTI6cUiZCJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ/5lVwAKCRAgrS7GWxAs
 4qTDD/9Ah96YxbrCb8edvPFzeVvvYh4SIfCdr/nc+m34kdvysv/1KtrdYMbVQHpE/p6ALGDaYB9
 yF2FrxO87r0dTmFw+vDN2lnp+IViq+yZYhOA/R8v4xitsNP0zN1Y5lPjExvQskLq0oYWE5ojLy+
 ycD6+msj0VwsNdKyb5Bxu3nFEihWZnxXAF6fvTwN5csn+S5aXV/DYiBW6e61Jrva7Kt8hkBa4G/
 FBpNRof5KM+k6C8+mkgLxyAbVKi6NPEzoLFryynmL14MJBmnBYTMgmf2t/ySOrSdX4zS/ccSn+l
 SyYd2O75WTyZ+Cdalax6UWmi6yU5PKK4BrrW8fwvQ0YE9Y1qz2X/79ymuW0stiI+hWHTwH4vBUA
 O0ckhGR6ljHijcN96pWV/kuVUTrFVYco2UTjTvHU1oVz1yFuRLn9V7VPARwFDoJUtX1qK4zIgPk
 UdMBiEB830UcPvNlF0FoVVcBYxT7N8xULjQKoj+in15HyUKFVWQsG2Ecq+Q+OKfM9UL6YmJKMSn
 YpxiBKysFEXQmckVJ978DJV2zHZIDOIy9FzZaJKOyvOFX4eoE8Y8a/+2745GwsgkNO+0QvL2xxk
 i77gaICWKMQrlhc4oYhlywb/oRh9H5ik9U+SN5+OHsfnXE1cmN7B8e7cr0eiHGqydt7gLOOORlw
 Td/64rTBEGhG3XA==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdefieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehtdejtddtteeiiefgleejkeetteevhfdukeegleffjeehgeeivefhgeduffdvvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgdujedvrddukedrtddrudgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdehpdhrtghpthhtohepshhimhhonhgrrdhvvghtthgvrhesfhhffihllhdrtghhpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmrghirhgrtggrnhgrlhesrhhishgvuhhprdhnvghtpdhrtghpthhtohepnhhitghol
 hgvjhgruggvhigvvgesghhoohhglhgvrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehmrghrtghhvghusehgohhoghhlvgdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggv
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
index ba04ac7c2167..88e0913ca33a 100644
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
2.49.0

