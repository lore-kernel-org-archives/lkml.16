Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EFB267716;
	Wed, 23 Apr 2025 07:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392447; cv=none; b=AdiqhNCZzfmLC94hryIHAu91mrH5Q5GSzo75t8Ns2dbdMQu+VyFf8D+omeH8SLATzK4qh+011snBKJxK+c/9WZKskt3AVn6WL83Zp9cm2gUizN5nnuB/pfOcr+o3bDqEPtl5wu9zVepssbFhGuOhk7CcJs1lPubDFl/lZh307WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392447; c=relaxed/simple;
	bh=6LBQY25NY7FQEpotneIjhp4OHGl8ZaUBv37RRbI29rQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JUXqNC8Cubm7qbwIsmy2JuQQmUiRtMaEda+glQpeSYuzzeED9GQyQWESweQarxsVW1yYTL3TFUA3CBcVbHNtW381Kgl4AYhmI3laAtqIAWc0DnwHcqa/uOuk26lke7L71sotZByTlx25xjvlj0lwNIgBplNse7l0zyiuSJ/3FZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKLqjuoD; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKLqjuoD"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54d42884842so7748673e87.2;
        Wed, 23 Apr 2025 00:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745392444; x=1745997244; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CS043yq9xeT5N+j80W3Qj8VmUZKpkG0gSF5km+PLc+4=;
        b=IKLqjuoDlDYqpcwlyaI7JBuJ0MGzgwXK42rNUjPG/Pbps1E9YFxDqapqYR91xNkbzD
         QhgE6XvaHmfR+lDl+rYbHA0ieTenLcuKnjAH/pOLOBn7G9uphjFyNFzOHLwaw5niylbF
         bKCPLvmTMQuVsJoJFZ3rRCDYG3eg2Df4ggclmZ3Ko2n0U7tD2k9BPh2HPCtqC8JNKi2r
         s+QdnWRdWh9dWyxJ7i94Yg2RII0Q0Q1jgiDXeKc7yRUrIShxCfqQsi0B1FUgNyi+q/et
         9VzdRbwc6ksEqmvuUhEhUOmDzwcdJ2utEcVytYqqXVX3eUW1J6ew0AnbvMb3jZ86eDYq
         cssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392444; x=1745997244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CS043yq9xeT5N+j80W3Qj8VmUZKpkG0gSF5km+PLc+4=;
        b=dFYy/+0dOXejaJrdTnUisGZFZIRCyIHUJwULpuougqO54dMfyIPuIyNpTRPKeNNeZu
         X6eBN9Pa9rnviJGfzP0mPLkFvRrfDNS4jeVbYMKSCd5a410pdXHbAcQPlOKYR45JLIPb
         GKDdc8JrMncFtHG2U7l9dtGaiFywHVzVvnvCKSUDwI2sWsuD4SjuSAh3BDNAP80Oy49o
         oi+hRJ3gOe6qAbXjzaXe+uURuDhC0eaxmYyblbWtfc2ONfxwaAky0vYiYPaU35ZLulvw
         LnlHoLngQ4XMNtLeB2YAb4akC1CUaCgMMhVtp7jxwcNdadS5ydccvBCDaweQcVCjVA4M
         Rogw==
X-Forwarded-Encrypted: i=1; AJvYcCWQdL1EAyk+G46GbCRT6iGYBUpwm6Wmt1LN3gBK8Ip98ysG3sZbPsga2nTVhdcy4eXOBAuN/oAJPdz0@vger.kernel.org, AJvYcCWkmU6u5V8+VyWcj019Ro9n5/7Lwbiat4jnqbNlX+WHt9bpFAp4Op++j6gzh1Fyp1/AYIiEx+JQcOnxSb51@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4v7jBSXvscuTgwePNGG5tJ0ClwqoYLgsEFWjf49UtVu1830Qy
	a+TTAbo+cN4tV7Lgor4JVB6QWlEA6TcIukJRZYRtr/DPLc+xHXVM
X-Gm-Gg: ASbGncszgZG8lw1PhzPiP7ZnIlMUhFhgWJn4IVb8p+GVjex95hfrFv+Lue4cO0cd96K
	g1uK0JJBC0t50qGuP4qrzD4DtNBoluNUUMEzoRwJFJJKr4a8HBZmPCu6QrS66w4ngeongGesR0r
	LJ2Etrm/VHM+FJ08rvX+XvQMPP9vLC4E+is3Zhy2+PRciAyr23JHmj924PZiQ8TiXSOZCsCwDvv
	tB1J/M+bDbGKzt4DA3Kl/wVVxId8wgJ7+KEh9Nn/TfYbecFqAn72lCGeTt4FXIV+ZN4e6gbRwzC
	d+cDsRvmSpE50AeEW0ElDHFq9atKYi9n7F8EPRiJruQVSfhKQ1I6E80PS1OxVyC4A4S2Yhc3mD+
	5O9e12gZb
X-Google-Smtp-Source: AGHT+IEyI98Phb3rniHmM73Uu8VSgKzYaXjLamalkkwdXyf9bvMIpXbD1Szpz2ns61Lu7p1u7+g7Cw==
X-Received: by 2002:a05:6512:23a7:b0:549:9143:4e8d with SMTP id 2adb3069b0e04-54d6e619328mr5210551e87.8.1745392443559;
        Wed, 23 Apr 2025 00:14:03 -0700 (PDT)
Received: from [192.168.2.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e524645sm1428793e87.41.2025.04.23.00.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:14:03 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 23 Apr 2025 09:13:35 +0200
Subject: [PATCH v5 3/3] MAINTAINERS: add entry for Sitronix ST7571 LCD
 Controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-st7571-v5-3-a283b752ad39@gmail.com>
References: <20250423-st7571-v5-0-a283b752ad39@gmail.com>
In-Reply-To: <20250423-st7571-v5-0-a283b752ad39@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Javier Martinez Canillas <javierm@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1014;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=6LBQY25NY7FQEpotneIjhp4OHGl8ZaUBv37RRbI29rQ=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBoCJMxn/GFLKWU3PHRZuX3OOlRRF+mwRi8cUo3W
 2Hu8aVL6z+JAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaAiTMQAKCRCIgE5vWV1S
 MjnJD/9wGbZAs9KGO3yi2XO3ZfLlSYOMUwe8JpL7l2n5GBLEn7sScw3WOP4XJaKvhgPD/tCW+4c
 uJrrWvGdqr+vZIUn6vXnkzkFtQKVoW4YQhilyeV7+xZI97E8/ukIDpSvxSoyw8PEnh2v7GelBkj
 4SLEAJ9YJgXOGx9LImYvUGoyxmu0v4BuPCHwUmLQik8QuUXAMoAOMXr+wWFcakU1301GeLBoQ+x
 XNB8OkJENVmDrsm4ESK8flQntGzgwgeP5PAnr2AaLX7rd+YYM5if10QMilIt/MPVJWHJJdAO5oA
 o+YbAsE0H/ZjAsxhHx07vmXta4fr1RNv81vJUjIhbdmG3q1E3059b5FntJqUYeJU7VQ0Ab8uojD
 aH+zPxF/1kV2m3oSzdFtWk59SMBvkNLjhKmrDJ1zyIM/WetyaNzL5o40SoUQwugo2iAVc/XlV7M
 W/SM99As6M0AGrQmiySM/7q284hd/UclBvA0kKRFH0qslcWued2atzNHPmoyAbgJM9p0Y/3Fp/h
 kxLneJnUKgO3aFF6EvSxTmnY7t9w17xZ27tP0JxhEXDIyxLxVPKT3g2YBEoYEjttwIZEJIA9h0P
 mR6NSgqDwT+qUIkuBjKAxFLdFCf8fNFt+lF22jVKmpTnEY+XwHpTMyByZudFdnsY3flI8uZjwv0
 SVZr1Dr+Mj6eAzg==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Add MAINTAINERS entry for the Sitronix ST7571 dot matrix LCD
controller.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 889bd4a59551c9bc125f94944a6e1c7e3ef2de83..eeae24fda846b9f63400ebb08c3fa7f02f3f4b19 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7572,6 +7572,12 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/sitronix,st7586.txt
 F:	drivers/gpu/drm/tiny/st7586.c
 
+DRM DRIVER FOR SITRONIX ST7571 PANELS
+M:	Marcus Folkesson <marcus.folkesson@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/sitronix,st7571.yaml
+F:	drivers/gpu/drm/tiny/st7571-i2c.c
+
 DRM DRIVER FOR SITRONIX ST7701 PANELS
 M:	Jagan Teki <jagan@amarulasolutions.com>
 S:	Maintained

-- 
2.49.0

