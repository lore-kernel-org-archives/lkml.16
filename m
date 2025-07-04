Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD11F1DE2DE
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 19:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751656062; cv=none; b=KtCFrmahobeebVoaPYXZKNhfWe4t1t62Uz6WzJRl2V+yWAo93QXjaMCrtocAQRdOcP05Jq4KeJTq7rBYBJ8N5jUr7jjDo6jJdL2HAPbPCYxEHu6Ih6nAjhzzqTy6uaJwXIb3E17CBR0TXu91yJ0CHH8UXc7KH6pwLHtp62u44MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751656062; c=relaxed/simple;
	bh=ZUQqM60VXLx7lxhacx2nNhw/oQ+u0mH75V+TNn+iCQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LBoe4HgxqIh1wbtEbDCJ+u+LNT8CMLu56MgjGZTJGqITWe123OJDIp3X8CGcENEDL8oeaU8wJjYOKaPeNyLFNF8Tv5A13GKRsSfT0iungsXM9ydNkpCaoMwOmEsOScjenVJIFfe+rjQINCVfBsIMmDzWx4Gb79WKdo0COb7Ew10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=bx2Ni8Zz; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="bx2Ni8Zz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=dhkj8G4Lkt5ZrDcOsiUSC5ggMg/nJbcKqL6DITIgXm0=; b=bx2Ni8ZzwXP9m0S+Wc0EtMHgx7
	TzuOQjuUrAZSCRDViNQgfiVRlrmfLNyHNAnTlhM47u0LJWuyFvoUEv236AotRgodKYTexcOJKHFoX
	qQc3D6vmK308mpiNqrMImkFMO3GACvxNkB3zGxC/v7am0lTxMC2VOhKjymNY7oXpUFGv8AWTavfNw
	2qv1gdRwfBFydnUlRGbLuVsDWY4wXTPBJ6uJ13mOl2Id65ez37eyUnjpu1Pum3a+1tUP1+l3ZajIf
	3AU6QBl7jhi3tbhosriLBYOpri2ETZdYaZoLXRpfxHF0f2LzpEG307mlaIlVLjJ+2S8Nx8jjbqjbi
	n20JYksw==;
Received: from [179.100.5.63] (helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uXlkz-00CY0F-R0; Fri, 04 Jul 2025 21:07:34 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, airlied@gmail.com, simona@ffwll.ch, " Raag Jadav " <raag.jadav@intel.com>,
	Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v4 3/3] drm/doc: Fix grammar for "Task information"
Date: Fri,  4 Jul 2025 16:07:24 -0300
Message-ID: <20250704190724.1159416-3-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704190724.1159416-1-andrealmeid@igalia.com>
References: <20250704190724.1159416-1-andrealmeid@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove the repetitive wording at the end of "Task information" section.

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 Documentation/gpu/drm-uapi.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 5bc1da4915af..843facf01b2d 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -460,8 +460,8 @@ event string.
 
 The reliability of this information is driver and hardware specific, and should
 be taken with a caution regarding it's precision. To have a big picture of what
-really happened, the devcoredump file provides should have much more detailed
-information about the device state and about the event.
+really happened, the devcoredump file provides much more detailed information
+about the device state and about the event.
 
 Consumer prerequisites
 ----------------------
-- 
2.49.0

