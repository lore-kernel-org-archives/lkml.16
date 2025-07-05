Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C63028BAAF;
	Sat,  5 Jul 2025 03:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751686489; cv=none; b=MZ+wOJYQmQl07Lj6pf3oIVZtwwPiMJ5Q5D2/4z39oBwRdyOjgrv2qdBWGF7ODHJJuZ6+sjQlywYbMjrFcx3xMUwBNzQRUI7WcBQPEIdfIp9DxNItca91X4MBVy/wm1vDOBLleKa09PpTW7dwtvc41TO/EvbqfO02b8BxmhOOz0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751686489; c=relaxed/simple;
	bh=hOd6+qOcYjH/w/j3ddYeY0GLTSBfqJE3weH99urGytI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ay8b1XrdLyd0xSslp5CISRnCwD6v0peSnxxFofvLcDKMq6hoqSXOp0o8Fw9ef1LZL8OXjrTZwfCcmNQoZjwTg48NA+kz8AoEvXloAwDw4CGb661RBMHkJ+EDO6WVdy/U9NUh7fBbtmNQlq5g4lMkPQr2DwHh7ZoHYaapP7v++vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J1cbvPRT; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1cbvPRT"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4a58ebece05so18652481cf.1;
        Fri, 04 Jul 2025 20:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751686487; x=1752291287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3DnWNuVGlcxt97iON5+GLNil5h81EohwejutmAGRqZY=;
        b=J1cbvPRTwYV7HBDrsBaKyYrhMGYgJA8zVc1k9cG3PijFbQXx603UK99NLkyUsGC4HM
         CjvQ1LzssZay/LLRLnCm2Yebh2leZgCXpcSe7DJw+CFguspCyT8xVYx84+A1gyy2be8M
         cbDoxmWMuIsPWFlrNlZ1OKDDEAfWruGdusRolbV9ndSOVNspFKT3vbudz2/p6LCu4qgK
         60OYSPEKiB3+HB/MdvoIxKok+PN2hZw7TpDFZhWd08HYhri0pr2eQzKUipAdj242qqNl
         kljP2mdScfuRvvb/2xd75S+o+E/EGI2l7oe4xCWaB4N2p6+xZ9oRX+3fe6EDtL+mCb7Z
         zVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751686487; x=1752291287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3DnWNuVGlcxt97iON5+GLNil5h81EohwejutmAGRqZY=;
        b=LG2mitAHQdNQ7imPg0ru0DSqFE2N0Rukg1YetASJelQMpoJvcRkaSV7uMoOx6TPxay
         U5F7BRYDhrjVBobaGCSZ7chID9gPhLRuyiJUaMIUs4JMmekklZ4keBA8MemF72/bFMws
         H4YYnX9t9Q8SPyMvOYnoOoQnz3Ma/hSXnBofGNaxrgi9XNZ5LJl5Mo0cIJLXHBAHdvXU
         q0fTNMpQpioYK1Vus//C1vX/fIS655plnJyTUDyRWJ+aEynLjb51TjXaqQmjQLyQcsbs
         9/KR+bTRO9JD40GwxWj51PMj2vmP2QTtiJd/sGswZAqGcRz3aEzl2LE/+ShyzgHGagpA
         RARQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVKmeV3JiiExe53T2kSwUpBzlJGLyM0ryGlasxN3wJOSbkqeiJmMSVQQZpW/O6d/8WHrN3fcGPqEc9C6A=@vger.kernel.org, AJvYcCXWRWxoUHesu+OICxjbz7303+1BQ41fo7hDn1LWK0qzuxOSUbP+iJ0c8NgC80C5hZEWGS0xkC+c1f0G8A4Z7K9P2Q/Anw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6CHGasRupyenP0O4Vi9EUxpOe6Y3XZup+ZXW/AhE1yOna0sVC
	0PCl5+8aww+ZyIYmMRfLvxRqHQOzMoROzFjKu625hROXOn1QpDXIaIop
X-Gm-Gg: ASbGncsbvuBUMPO4wZhIwd4lo6lFbwydEktCmMQXhjXlq/tSJ7dGk3cX/PZSMLJdGEK
	WeBFRcNoN5BoCHZNst/Q8d9wbnsZROG4T6CgQnmbA0GLsaeBitj1a+YB5ZrWwJdpprXIAZ9jT2p
	PnuttuTpc+WCrPo1H5Ckd6Q0B9Rp5cnK4rtENynl1VNQ2KM0fEfErJaYe5JoSj66xvuYrWedzF/
	7OTxno68+m8fuKhxa3iecNuyxeeZcc89AywInHJY6fg3TEfKgiPyyTvTADCN8YidXno843aubH9
	toKITTpXO7Nwn8nTrYXHIBw0kOqu0ew/1I39bgcLqNH+uxm1hhPZzQ8MO67mfA==
X-Google-Smtp-Source: AGHT+IHrDdoTE2f9tihUfrdXEUCbU8AFPiaXN13MoT//IKpgavZ7+H3EahWcMhecuTgSgt46Vlj2iw==
X-Received: by 2002:a05:622a:1e87:b0:4a9:8ddf:83e7 with SMTP id d75a77b69052e-4a99672a3bcmr78983931cf.39.1751686487284;
        Fri, 04 Jul 2025 20:34:47 -0700 (PDT)
Received: from [192.168.1.26] ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9949e4a48sm25850281cf.13.2025.07.04.20.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 20:34:47 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 05 Jul 2025 00:34:01 -0300
Subject: [PATCH v5 6/6] MAINTAINERS: Add FIRMWARE ATTRIBUTES CLASS entry
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-fw-attrs-api-v5-6-60b6d51d93eb@gmail.com>
References: <20250705-fw-attrs-api-v5-0-60b6d51d93eb@gmail.com>
In-Reply-To: <20250705-fw-attrs-api-v5-0-60b6d51d93eb@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=875; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=hOd6+qOcYjH/w/j3ddYeY0GLTSBfqJE3weH99urGytI=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBkZc20PTt4SaJVd98p/q6BW/ETJxUpfTsfMvZqTXH1tt
 s2PPUHlHaUsDGJcDLJiiiztCYu+PYrKe+t3IPQ+zBxWJpAhDFycAjARbk5Ghn8rE44FlxXc2zfZ
 ZlKAlO625tyzJTXh10s1226FB9b0BzH8M5UNz3iy/LdpS0WL549ovya2w4I7mQ5+evW0USz3shI
 PLwA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Add entry for the FIRMWARE ATTRIBUTES CLASS.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c14614613377df7f40565c6df50661fe3f510034..c799f603e9210e4703eeb1f0ac9d6b9e8bd469c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9352,6 +9352,14 @@ F:	include/linux/firewire.h
 F:	include/uapi/linux/firewire*.h
 F:	tools/firewire/
 
+FIRMWARE ATTRIBUTES CLASS
+M:	Kurt Borja <kuurtb@gmail.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/firmware_attributes_class.c
+F:	include/linux/firmware_attributes_class.h
+K:	(devm_)?fwat_device_(un)?register
+
 FIRMWARE FRAMEWORK FOR ARMV8-A
 M:	Sudeep Holla <sudeep.holla@arm.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.50.0

