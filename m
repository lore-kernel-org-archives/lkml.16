Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601F21CA81
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 10:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738318307; cv=none; b=RkPufszb+rHAuqaUCVeZMnPhsxS0pRuQ0hF6MWysY7Zhm4m8KhmFfouruhVQ8bwGRudd/ZS6mwKlsd53eRRGef6m0AT0GPgSQPjbcbZJVlwSXTfkcdZDfEZu3ibiknhvO/bmLYTNr9ySo7hctpQ30vq4+lVDWM4crhPT9/O2jio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738318307; c=relaxed/simple;
	bh=TOpTfUj4QcmOfbWajuCLJSzlivd9P5SjC2vU9aSgC5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=A6Loso7x5uwYwKkT+ituHl8wrHQb1fud783Gjx+hEv4FjtRjXXRwHLmOrz/RjIoMdb21o/Vh78GY7i476esF5qo6p9ftBT1WmJmUP7U42C5CXuPOkp9PcBhssaCvYGtnCMFzbI5DRYoCHCaibnowcTGcPjT4K1FytvZ5YWGp0Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=q5OGCUID; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="q5OGCUID"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2efb17478adso2984132a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 02:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1738318304; x=1738923104; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ujZdT65JgU6NvF/G9jRMjszw2mjGT5YQT3bs1UnrWcA=;
        b=q5OGCUIDJyCR0LNhkq0H5r2VQXUAHdp4tcdX5lxoZEJmOypguDG9DRaOWHpcAGG9v7
         IERH+zJAtCVp4buNyFko/5OgjiJZUNlH/3NV8gOxJA93qAuGkbS4Nm2Ad6WXo/mgTDRv
         JWrpAvMe+DXixXLAo6/U620fzU8H7H5YPbGCxrBQavoVC1lWFTHX/54fK+Ga7DcAAwYy
         L5TJmMUFT5Z3XVkDZAKHkSWdiMtGgwxfx/9o132MdzqtpXGD1K8OFeyEreGRUOGGIR4A
         0rl/S2A3yNH9bMQTVWsHrez3EYxrFu3UDKwRVuFVezCDNwY7HElJNooWb/7yAm029kUo
         aqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738318304; x=1738923104;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ujZdT65JgU6NvF/G9jRMjszw2mjGT5YQT3bs1UnrWcA=;
        b=PaP5RJolsdGwTM8lEJ2lexB3n9FP3+heYxVLFQtkUy/bcaweQU0Pa2qbOSwlBt+M9M
         4I9cyla7DFlFlQI+Uh8OP56z0G6hoYPHrxwSHujCUJQLUW4+Pu+/zqeLoyptYfRVbHnU
         lS5MMgtRE/40kceTG4sEbr9Pvdo4G13yokiOJLFqKBXvuZAqwOHajjg1OliGNrNb5gbU
         6UUogbVlunZzdIkvSOe3wagiHoNrMn5iGLxSV2J/PF8Wj0fIuKkUGbcGMKYi4GWz4LGo
         wYnYf0knrjfVqQU0CW+zbI/7BC0ZQbj02ln/tz3zz9eoYxhjsw0VW49nexM1lMLrLiyy
         eiGw==
X-Forwarded-Encrypted: i=1; AJvYcCUQYfG//ar08Q8+J33Xh4ckj2tghLwdMj8Sm51E4w9QAEt/FrEFj7XelIOqfAKJl557iHWrbSYZQISCrJw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBDDDluvvuH7hGmkWgaBkxLfMayKuvKlst3Klp4/2iMKraa62m
	yQBCBOIE9TIRxrrSFURh27BIWkhvD46LA9eLTWDHGbXNNbOWRqnZjsTwX1kIVg==
X-Gm-Gg: ASbGncuhCf60nFHN4KeQzbrsDTME4wp3kYH+27ssntLmYj2t/AsQHSprhAyJ5MS//iK
	mLTya9PFY6XXdqBT1l4G5G7blgUkrDgDRt2MC6PUlSeZq92cmHawchreb4mMg55EJxSgIuvOEtw
	AOBpCv/2ZzVXRLm9gtzPQn2TouOQLboQTf3THrn6PoGlnFbnexCe0VVXQEhRhpB+gQWXZWEabIg
	psLh8Tn0FKjaRwU5IegH6J2NL1hYSCdM5LR9POoO10PYfqkYCbhKvLWT6BdZO0sjzxcDzawkeEl
	k519vBoUj9xlHWRz7fIDG/I=
X-Google-Smtp-Source: AGHT+IEfxj4SBp1Oe2MZX7KsD9D/+jkJVHcr5vCM3jpYYXxEkDvoWJB97EEeppveLHhHQDQ0D03Azw==
X-Received: by 2002:a17:90b:53c8:b0:2ee:8430:b847 with SMTP id 98e67ed59e1d1-2f83abb34f2mr15086370a91.6.1738318304559;
        Fri, 31 Jan 2025 02:11:44 -0800 (PST)
Received: from [172.16.119.211] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bcd0fbasm5551977a91.16.2025.01.31.02.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 02:11:43 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Fri, 31 Jan 2025 15:41:33 +0530
Subject: [PATCH v3] arm64: defconfig: Enable gb_beagleplay
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-defconfig-beagleplay-v3-1-f556b851ff96@beagleboard.org>
X-B4-Tracking: v=1; b=H4sIANShnGcC/4XNQQ7CIBAF0Ks0rMXAUJS68h7GBZQpJWlKA4bYN
 L27tG5caFz+P/lvFpIwekzkUi0kYvbJh7EEcahI2+vRIfW2ZAIMJONwpha7Noydd9SgdgNOg55
 LWUspjBFKASnTKWLnnzt7u5fc+/QIcd6/ZL61f8DMKacA+sSYkii4uL6PJuhojyE6srEZPqnmB
 wWFklo1rKmFBfhCrev6AqTYWlIJAQAA
X-Change-ID: 20250127-defconfig-beagleplay-de4553bb3882
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, d-gole@ti.com, lorforlinux@beagleboard.org, 
 jkridner@beagleboard.org, robertcnelson@beagleboard.org, 
 Nishanth Menon <nm@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1692; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=TOpTfUj4QcmOfbWajuCLJSzlivd9P5SjC2vU9aSgC5o=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBnnKHbwZVB+mJgzK6b/fOc7tfoWTD5FhXBGeElc
 cH2iLgf9kGJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZ5yh2wAKCRAFzvXHieVa
 dF12EACzMtsatvuCRyTm/BqzXFVGMr3+L/pvRJdX+Y/8xpDVYAO85+U0axJohgsCoW6dPvrEjbq
 1DfTD/x1JQvsyjL+vDY4yA24CmWhoOjMcmAcUAJj+6EftzVEUUp3lZWdcrd2ZRA/fLaq9an6lht
 NhMUQklLihSw1XsDdk//WxoTryyU5nQWtSQzVe6hb2IKhe7ezVlwAUUokjUZGs2W5uyhxnBlWjM
 FH9bolUONCnPr09OkIkCSG4Kv8jsqa2VHfzApU7OCQjqnGgzoNw79LRF/6z+jwVSr55h9os55y1
 c8AJTdtW8GtxmRqJpsL77r28/KdSZ7u9Sx9F1MxEUtzQnQdAOuZgNZQk/y3WPrIj+hVwnb4P5zd
 V/ii1CvKu1HkqHdy/A9VYRKJfrVk5cU4YIJhq9tsBZgwSRpE7Cv9k4aBNgL4Ah6enZO6h3MQDVB
 OQGmNIDqv+ufkeZ8UblY7iKOBWCNCN4Zhw2wx/pdHkpOwhMZoU2/e01yKWY/wccNuMZt0KaAWIZ
 5qwM1MzMwKj4i5/fz/hUPigYc7kHKRIFZdmg/8DMNcYOe46bKEIJA2/1oAf7d/Inj139T636ksf
 WVPFpNQ8BwVSuNtmdQtV3OLRKy8CCjdyRMpQirLc34uz8YogL5+0BbThc1pon4RLV6NW2baUSUs
 F46w0tC3lcECehg==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Enable greybus driver used by TI K3 AM625 BeaglePlay.

The driver communicates with TI CC1352P7 co-processor which acts as
Greybus SVC. Additionally, it also provides firmware upload API support
for TI CC1352P7 over UART.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Dhruva Gole <d-gole@ti.com>
Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
Enable greybus driver for TI CC1352P5 over UART used in TI K3 AM625
BeaglePlay [0].

[0]: https://elixir.bootlin.com/linux/v6.13/source/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
---
Changes in v3:
- s/Ti/TI
- K3/AM625 to K3 AM625
- Link to v2: https://lore.kernel.org/r/20250129-defconfig-beagleplay-v2-1-5a890943d223@beagleboard.org

Changes in v2:
- Add hardware name to commit message.
- Use savedefconfig option to update config.
- Link to v1: https://lore.kernel.org/r/20250127-defconfig-beagleplay-v1-1-22a60085e313@beagleboard.org
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da44155999b59aff95966f4cdc9107f2af46a..62309fd2482ab35e917aea2e63780c45a4347f43 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1270,6 +1270,8 @@ CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_MMIO=y
 CONFIG_XEN_GNTDEV=y
 CONFIG_XEN_GRANT_DEV_ALLOC=y
+CONFIG_GREYBUS=m
+CONFIG_GREYBUS_BEAGLEPLAY=m
 CONFIG_STAGING=y
 CONFIG_STAGING_MEDIA=y
 CONFIG_VIDEO_MAX96712=m

---
base-commit: 5ffa57f6eecefababb8cbe327222ef171943b183
change-id: 20250127-defconfig-beagleplay-de4553bb3882

Best regards,
-- 
Ayush Singh <ayush@beagleboard.org>

