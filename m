Received: from gw2.atmark-techno.com (gw2.atmark-techno.com [35.74.137.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894C01ADC6D
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 06:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.74.137.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738562967; cv=none; b=cjrySUVPkElubu458ol1PdCfA3IRoN6PXm7vCwdHG8f74ehcYQNHHjnkw2kKZBj1NuNCwkzQbjKtJB3u8GyALUhIEmx8mMzOa1mAjHw4pUDHF5H+9cB7kbWMSlw7sVPp2NsikumnwRQW3Qu+91Pyy/JHrvIrE+IPusbrKtOPSPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738562967; c=relaxed/simple;
	bh=rLWgZ6eUauYiCONMe295ObHlUI97EXwV/4fS4BXwZ0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=V6O+yfHf745AL0aCKx4B651iRCILb+EIQFIGzRekY7fslWZ6LkceRQfwcwW3J0vVrR5B52KhHOevIljkCF8xn0kLDKPkG1kVLzHIBXkHOBthHRi7wFvHeoWY18d4Po1bbwkpOZkMe8WrczHcKY0698mLMD6MutFLJwmEUZFji+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atmark-techno.com; spf=pass smtp.mailfrom=atmark-techno.com; dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b=wGB0swZB; dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b=XxYIMKtc; arc=none smtp.client-ip=35.74.137.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atmark-techno.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atmark-techno.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="wGB0swZB";
	dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="XxYIMKtc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmark-techno.com;
	s=gw2_bookworm; t=1738562963;
	bh=rLWgZ6eUauYiCONMe295ObHlUI97EXwV/4fS4BXwZ0I=;
	h=From:Date:Subject:To:Cc:From;
	b=wGB0swZBkJNLieSdlrHaNVeqgtIWV8zIq7SuLSXnixGkA/pijRyc2cQ/IgmKPPpRd
	 3piLoAx026+UeD8RMhJU2jPHBqnLFGNGM2SFXJgV0g9SqspAcUgfhpo6ftSAYC5qVD
	 Vwoe4uBC3cmvI64J5fV2gl2vBC2GWOWK31Z9cUaclikhQkVMF0jU4O3n8bnZ9o3Si/
	 qMAaDozhG1tskkCYA9aXdP2J9+S2oGpIl6Dc2jAMYHdcecbyHZuZnYz94YeKCR9kuK
	 x4MD5otOK/5j1oJewE89feN/PkyfvSYMa4e5t4ocOuCaW8NzCEox+K7uFHy4dOvmr8
	 RWqZB8Iago/yg==
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
	by gw2.atmark-techno.com (Postfix) with ESMTP id 62384370
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 15:09:23 +0900 (JST)
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=XxYIMKtc;
	dkim-atps=neutral
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id 506B931B
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 15:09:22 +0900 (JST)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ef9b9981f1so11459823a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 22:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1738562961; x=1739167761; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d0sM4/RmXwuU/ijuwtLBjbi8cvcOWTlQXElR9KepwmM=;
        b=XxYIMKtcOhEuEkJ0wYbXJ6XiW0C81JDT+ceZnkeYbDw+SAEd6UX+XGz4BqNGdL0Fe0
         RBYwYIG21LQmEkkGJqOGITvhgtHJFY5PRHpi39m3KO9a9mz5XvrRIZ7CxCmvpB/UURhx
         GYN5N5D28FY22cnqEwS5BF7D4/ASlhiEYrvMHZjV3hDhHDWuWosroBXJz3Es5EhkMNTy
         PyoEbBESJ2K3bPUgg1XdsvWrYQPl3QIhhZ4k50VBOYSnUjD9xhe9g4+Kg+AyX54G4zl7
         AvlDUX16PfYXVS0NOBX+8mi3NFW+6c7zf1VqZj1mr4ThoUaGPiLnr8CQbR6cw2SU5nAU
         F/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738562961; x=1739167761;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d0sM4/RmXwuU/ijuwtLBjbi8cvcOWTlQXElR9KepwmM=;
        b=h/QGkCNl+bNJJZ5f8AIvxbCom4pE+5RZZ4NXQkBOJi08jFfzy2YlT81YJJm6k3uznk
         JTiUgO6oghiLVkIzRxr5BFzlM8zuzO1BWadHUTYdTmm+VAHXvwkQRO2cRnH3pp9Fp44x
         14qoH8KCQM0pDuGs/5usOyRJBKNG7PVlXfffXe4vutyYGnXa2520g+2SJ7d67VSZ5dNh
         yj9QeYUnRHame5Z1MWEyrZgBIadiF0AYtiORa/5Nz1My8UykUm9e/c4/InO8UgnQ5UJM
         glc8gRhS5HV5Jp480pDkdlAFRVqmXg6Ih7j2n4jTgi7NfNM/FO+IqWflwJYZf19EUoTt
         toZg==
X-Forwarded-Encrypted: i=1; AJvYcCUlFkprfFj4JMKDJni3LYewAeVH3pA0eNqqcZs4dPSOmDIspl2ELArYIPhw3tCNsFWFGs8MOo0VoU18vRU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwloGxcMtu3ScIMn/oR0b41ZVLVKnSTUmAKH0ZvEYcfhgClYucG
	JETuesLdj0S83lgPP/qeQjmHnUyv/EjWTDAsddnqLW6N5OpgXb4SAvG9O7/dCI8cNYsV4AB9MMc
	4DEJnI/MRP3lv5O7KHJU9V9xP43cIGZm/2YfZwubranRRNSUxNj3BPMV3orYeNzc=
X-Gm-Gg: ASbGncuWhMFgetkxa+2y9x97V06y5hxo3hAJFMZwonE3oxuN4r84wwsdEnD7h2kpPp0
	kIvuC8NvqUZnDXEgn4qtLHpllbCxZs+wJMbPAfSAxCGDW67NZ/oUhAs16BJvhdI3rboBXyzCSSr
	VGfJWmWCrMbqpoqeH9oVgp0+5LEVbVhc7MfGh1NJ4JfgAEjpQiWQJAUS3gqfehL5gkyon0IkNHH
	O5KudVW3qR708xZeT27dwh0pmdA2//UxJX+ub9JGP19MF15CZXgdeogZcVw9e6NQihkGNOL02/i
	tGX9BQ8YkGX7u03j6MFMyvdjYmgan1WXO6lO1UMQHp0LJ+1htErPmpDFJnPOc8MM
X-Received: by 2002:a17:90b:5485:b0:2ea:b564:4b31 with SMTP id 98e67ed59e1d1-2f83abff361mr29356009a91.19.1738562961369;
        Sun, 02 Feb 2025 22:09:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPlyVzISCSESRGQK82l9QvxGtfTDK4CsmACY7TnxikBjBA5eBNIk3T/ibndka6W854Lw5+ew==
X-Received: by 2002:a17:90b:5485:b0:2ea:b564:4b31 with SMTP id 98e67ed59e1d1-2f83abff361mr29355986a91.19.1738562961075;
        Sun, 02 Feb 2025 22:09:21 -0800 (PST)
Received: from localhost (162.198.187.35.bc.googleusercontent.com. [35.187.198.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f7927sm68024175ad.99.2025.02.02.22.09.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Feb 2025 22:09:20 -0800 (PST)
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
Date: Mon, 03 Feb 2025 15:09:11 +0900
Subject: [PATCH] usb: phy: mxs: silence EPROBE_DEFER error on boot
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-defer_usb2-v1-1-2366f26462e0@atmark-techno.com>
X-B4-Tracking: v=1; b=H4sIAIddoGcC/x3MQQqAIBBG4avErBN0IhddJSIsf2s2FkoRhHdPW
 n6L917KSIJMQ/NSwi1Zjlhh2obW3cUNSnw1seZes+6UR0Car7ywAtgGa502zlMNzoQgzz8bp1I
 +rfM3lVwAAAA=
X-Change-ID: 20250203-defer_usb2-ee26f66a01ad
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>
X-Mailer: b4 0.15-dev-7be4f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120;
 i=dominique.martinet@atmark-techno.com; h=from:subject:message-id;
 bh=rLWgZ6eUauYiCONMe295ObHlUI97EXwV/4fS4BXwZ0I=;
 b=owEBbQKS/ZANAwAKAfKKYH/WjHEHAcsmYgBnoF2O3a0jWTHdw/jtTOd3PohMx324/DljYO7n+
 O+T2jfpKJmJAjMEAAEKAB0WIQQoFSiLMD+txr0veJbyimB/1oxxBwUCZ6BdjgAKCRDyimB/1oxx
 B4wlEACYkp3ePrAVerdSG7mZHg/um8PiPAEYvgNbS91eBPyCxdpaY3hktUcwRhuUXSUHcYuj4Ez
 el5W0YN4Gsf8q2k7SiEEZGxsUSSr47WfH6DMcKOUBmEhca6vxGze1iXa8Gs7LeSyHnzkHL4X2Lx
 QqtWr3AHrLbhhJy1DpFoaWl0Yw3agCI2z0PKp+7JGfuQ50UdC5LKq83mlhAYUccuEnMeUMRYAeX
 DodnrZpGIxbZUv1JlX6AoOYDx0qfUof2+m8yPq7LFuZbnbE3vlPRubDHJEeDjp+qWteTYZVujfQ
 kUkIkeH7xpPoDjs7DYfWsYozwCazQDhv8nFPaKfyDE2igikxm1StjAO5T4bluWKBzH/oaJTq1+h
 sdMBH2m73jBMxEfot4JOgAolJifbHi/bavXfLzhDJQDl2P1augT38S+XV0VBRpN9ssU3YV7sj/p
 PQNoOUw0eHcr85NPjb+LqI1s9SIctiFwTirX7On5U5oDOyL3OZ0/bOZ/q4BHEuoZ0B3IcuV794e
 8KlEntd5ZgzfNMQWJZnYsAFBFOQ7UChqTsRPlplU+uwmtOYwNmpWP+S8P6TtHFEpqz79AfjY8yn
 4kH7dH+ppIusR28uUAf+Q0dZYmzsNYDwIjuoQdwSstKKDyYTkH0+7gArO82kNEXdMi/4T2QwTmx
 TQVYet7/9LUejLQ==
X-Developer-Key: i=dominique.martinet@atmark-techno.com; a=openpgp;
 fpr=2815288B303FADC6BD2F7896F28A607FD68C7107

Use dev_err_probe to silence EPROBE_DEFER error on boot on i.MX8ULP:
[    0.127301] mxs_phy 29910000.usb-phy: can't get the clock, err=-517

Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
---
 drivers/usb/phy/phy-mxs-usb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index 7490f1798b461c39c29bb74e1e57e0a4adce2bd7..dd2b4a5633934e257e792bbd61d6748304b5e679 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -770,9 +770,8 @@ static int mxs_phy_probe(struct platform_device *pdev)
 
 	clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(clk)) {
-		dev_err(&pdev->dev,
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk),
 			"can't get the clock, err=%ld", PTR_ERR(clk));
-		return PTR_ERR(clk);
 	}
 
 	mxs_phy = devm_kzalloc(&pdev->dev, sizeof(*mxs_phy), GFP_KERNEL);

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250203-defer_usb2-ee26f66a01ad

Best regards,
-- 
Dominique Martinet <dominique.martinet@atmark-techno.com>


