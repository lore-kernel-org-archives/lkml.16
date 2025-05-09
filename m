Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DED22749EA;
	Fri,  9 May 2025 07:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746776966; cv=none; b=CUDygamxvK1MVAaf/jIGQIsZ5B9cbw8NO8enqu260cSZO42ioQTziLzBzjcjUI38Inv5uW1ErZRZt1S6NHZL57HGenmQOv3krW7kunPvGkr9AKqbfXyfezOYmZYXfnkE4tzNv/G7iQ5rdIpEWKR4uR/G+PDa/geVynD5D033DFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746776966; c=relaxed/simple;
	bh=ESzEa2XBYeCXCYfZ5PnQ+bede9o4BuhRrBkVwojeH30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MusBt2zRi17XrdsQ18kwpH/MeVw68CdTfVVNQBoTtnAjPl5HkNA+EV+qUOGsSErAjCLfgKyu2aVAAEdc6ad0Y6MV6+tf5cKHUal7UfcV+TjSVcxai+clCfE3JTP5gFVV7bH45KU5SQ55gkvtJ8zux7MlPGXfNHDGGgfat2OHTOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g9/p8K8w; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g9/p8K8w"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4c34dcdaf88so611014137.2;
        Fri, 09 May 2025 00:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746776964; x=1747381764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/phAatFkBAwQ5t8wNBWoDLE6oTpZIJwGQghZ3e9clt4=;
        b=g9/p8K8w0EHzKZ6KIQf6YD6Oi/pev1bNeuNpZuQ42oK8vfnpQNIOO4hGi+nAcezpBP
         GLMsgrZ0i+VjSRInf1FRVlmc40tbBToy+dAStiF9AUpe3lH57qkRUH2lV9Qsbw4gKJGf
         IUyznhx8kuk293bRsBIROrFIdyD0iBTlsA/FxipBFqKSSxz3OVEHqwIUFBL/JaeZA0xx
         fTQc5zRcElpB/tRJG2M4qGBxWv5sg4UxM4hAw09VAZXQFwtNQEUkG2hUwQFQHkEYUL65
         0xl8XWOwzH2TUnrWlyQ0EcEs2+g4tOGzILH5ld2yMWUISoE3MIIFJD9ShrIQ9uIcLV8Z
         5mMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746776964; x=1747381764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/phAatFkBAwQ5t8wNBWoDLE6oTpZIJwGQghZ3e9clt4=;
        b=OL7isJ2hDWWOBcvUFeKH+aHfYuYeTQ1GvpF6VtMovPxvcGL3q8mWTNFiPlipW0aVfa
         LlHNzAmiZUV6SHnQ8GcV5a93rn57uIBRSIMJQy6+B/hXWPR9J2gGR3A0f3UhiasoSkok
         W46AXPTo6nQEzeS2hoaoCCLpEN94TqNMQxlfeL0yQY1J1/pMgMSOmuHe5ikZT4xKdPb9
         xqtOe+XE7tf3gj9Rf2FFd+E4NMLC6q5jhJbvaOSzHtZBJV4nSHrtlmUSqyQ9es/Z6ZJA
         cGDruS9wsvb6VdMQveMEHI9NCLEv32WwUJlclz+frk6Rq27sKSTF4uC+L2u2ECRROZt+
         zyyw==
X-Forwarded-Encrypted: i=1; AJvYcCWzsmmdPzJ5jXX0ITEtOllRwKT7KC8IaYsfDVh+zNczNautI8XmMyQw5DINfl3UiEuIU6pKMEK136ZooN0W/Cc+Jp1S0w==@vger.kernel.org, AJvYcCX6hj5CO4KC4KzWcB/TSng4sATPX0vF9ecVGGqLY69po71DidXAkaO/xd1aKQgjoZWRLcs2rtG6Fpxawgc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcEhIPGKSEwm6bI13+Oe+x6IBM2pR7DG3eyxsuweEbPVgqpCUO
	LMaT0KAzSewj1P0pDdtOKDVHfV6upjEYAseMd61DBg/XSHdExnqQ
X-Gm-Gg: ASbGnct///1XFkdc0751TFbQ+Em+owYI8LwnF1o1IWhGnBNmm8PpA7aYQfh5twMAN1U
	jkuFurZjx7eZZsm0QLYV7d6wUl4d3x4iZJGVk2KY5G2qyam7YYeytDnhW0IUjm74R+zktviArXV
	tLxwErPJN6F8ds4W9rAmRNsHYntQmDoPDVxRotXK3NrMAfFHOjVdX0NG5sq9GANbnZPrvx3WmxG
	+BHgAvpTvn0gTGAREoMVCeqztctl9i+WxPZ0LJeRTulrUwf1DjnhHEoNdSknKr54ZN5JI6hJX2E
	sice2o51DI3BEn46FfP2tjK8q8z6ETRSGaAhgezj
X-Google-Smtp-Source: AGHT+IEV2wUxDT4UZ7wEWbIKRaAtnNbGm5X6GYvdQjajcMwDG6DRQ4uWU/Wuk+dtBnlr2TeUERl47A==
X-Received: by 2002:a05:6102:8097:b0:4c1:774b:3f7a with SMTP id ada2fe7eead31-4deed3d4b5bmr1629019137.16.1746776963975;
        Fri, 09 May 2025 00:49:23 -0700 (PDT)
Received: from [192.168.1.26] ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f62986f3sm678265241.33.2025.05.09.00.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 00:49:23 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Fri, 09 May 2025 04:48:36 -0300
Subject: [PATCH RFC 4/5] MAINTAINERS: Add FIRMWARE ATTRIBUTES CLASS entry
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-fw-attrs-api-v1-4-258afed65bfa@gmail.com>
References: <20250509-fw-attrs-api-v1-0-258afed65bfa@gmail.com>
In-Reply-To: <20250509-fw-attrs-api-v1-0-258afed65bfa@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Joshua Grisham <josh@joshuagrisham.com>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Antheas Kapenekakis <lkml@antheas.dev>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Prasanth Ksr <prasanth.ksr@dell.com>, Jorge Lopez <jorge.lopez2@hp.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dell.Client.Kernel@dell.com, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=827; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=ESzEa2XBYeCXCYfZ5PnQ+bede9o4BuhRrBkVwojeH30=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBmym3PMjCYfYzsRI/P8btaEEz9+6Dhtf+182i3D3MPza
 qjgIp2rHaUsDGJcDLJiiiztCYu+PYrKe+t3IPQ+zBxWJpAhDFycAjCRtWsZGXaf5dzGZPla4MPP
 xKBwvuhH8nHFbrw+C7I1v9nNCTRkm87wP/bIu9JgTdWL/Sw/PuqfkXCT5d+/r8kl/FTQI/n3h2L
 V+QE=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Add entry for the FIRMWARE ATTRIBUTES CLASS.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f9417b4e9bafd1a4033bba2fdb4a4e6fb68cf219..c4adad420a8ffee7bc7624d3edc8ba36aec5cb40 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9190,6 +9190,13 @@ F:	include/linux/firewire.h
 F:	include/uapi/linux/firewire*.h
 F:	tools/firewire/
 
+FIRMWARE ATTRIBUTES CLASS
+M:	Kurt Borja <kuurtb@gmail.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/firmware_attributes_class.*
+K:	(devm_)?fwat_device_(un)?register
+
 FIRMWARE FRAMEWORK FOR ARMV8-A
 M:	Sudeep Holla <sudeep.holla@arm.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.49.0

