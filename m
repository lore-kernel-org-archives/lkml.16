Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353D729AAF2
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747941290; cv=none; b=GJcNRnGuem8YcSSIUeII4rVPdmDiTLMVSgF5iLPMW3baJTLcdxj9FeLxrcXso1rNbJ0r85EaAzQPzoQH39DHCDdmdahfaMpfuIjE/1bE3ng31L9iygn3tVtwF5ZJM69ljSNVMksbHdzZK9kEyJxNwhLyodq9W+EAhn4+ZESEPog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747941290; c=relaxed/simple;
	bh=ZKftViqfFFhN799plnLsAOvLuBZBpAPSXcMvWbXpQ+c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fg8Xd+IEK5Qza7lxyC3WpRidwYPLgNwxsNERsqNLGl8n/3HoI04g52ZELdSsE9pfS6+kLPSXZo9nOLfcklv9SSqif7c4utGmve+AAuAo8i+FX4AuhSIs36djXUGNDPHTaQNNd+/7k9Cmfy8SprFj4w8uGJwGtmLZ4YfVFsk+mj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O8jb1gtw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O8jb1gtw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747941288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=D7brFv7pUq6T8Mxdu91uiPIb94+Tmd0tGfLRCcDs510=;
	b=O8jb1gtwvzOU5uNKR3UUf160UZwht2O2OqDaLBfuQ01hpwPoD67neWldH3zgnN9H7yD7rr
	eyqfL7dr1387HO2mzIWUVamEqT+lO6Ac/yvjVP5toVVs6HGkJePxtEMhyCTJGOBPBoTJDZ
	tKt1F1ex2eHDe1R4dwxZAxFi+0CdQIA=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-PNlpXCp1OHCJ949Qenrnaw-1; Thu, 22 May 2025 15:14:46 -0400
X-MC-Unique: PNlpXCp1OHCJ949Qenrnaw-1
X-Mimecast-MFC-AGG-ID: PNlpXCp1OHCJ949Qenrnaw_1747941286
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8dd95985dso105620226d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:14:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747941286; x=1748546086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D7brFv7pUq6T8Mxdu91uiPIb94+Tmd0tGfLRCcDs510=;
        b=ViIwsRSDOtVKj0FS9RET1WTzb5GpOGfMk/+i3BSMvWYhpzrh5Qvwat36UHWGXBov1F
         nKG0BIhfizzOmyG2M79Xzk5kkj6Ynw7DIQ9/bvHFLTjqa4r1AF8QvGsqyzI6p8HRyPFA
         Bls+Dz/h7tcQN4j8AwcLLERDmUl4HraypkUAGUDP4jQTT4rKlCeZP109nvV+qPEboIx9
         RjW0q6UU/FcptS8xjMeyO1/aYrN1YSl7hUsDLU4wCSyt+pD5MxCftvuC3hWcB4U9LTkL
         pLGtEZonPZBt73sMCmBq98isrmFgOks6juyHxChkbP24pQNHSDShFe53KS8sEA6AuTQV
         pQOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoF+43+0n4bQI5mHpFt75OBH7vDcgLPTWQ/YAdyUhYYCxRN34YRDT5P1RavkuIDHB70hTN267MXh9Mcdo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP1aexEJFGRgBL+DXyZZ/iItTWpNvretuzIEzcPXQvQ5RmnnQ9
	iDNj9VUM2QWKn2Ivz/UClwRb13RDB3Xz0kpyenNJ2FmxkHmmJ6zOlRjWJ3daVREk1hbYHiqIcJF
	JeRarhBj0nljae6PvTc3MdToSe9Fe4lrlyHDawp4KqMWTL/0nAMgR+aFhP2p3boVT+Q==
X-Gm-Gg: ASbGncst1vu3qWdF1sYajvga4ibshQgLlROWB4Qps7qfU+jdMHFsC5okxKCQw9xsWSh
	nFmL1HXc6dj/VitQMWT3Niw+I1TNYPp3lCdQxUa+GR/QQsoWgG2/0DE4VuTCej3MyZnGNLrDtCZ
	Aw/+fzb+Xw7T3yPzMbv8CIrmK1hLIYmnl7+ey5azB9wu1Rarr5eiMVDcWiWS/UQl/q1igIY3J9V
	N8KptvxfrFyMKS6QrRENCUf4/VrMAwGe52p64WJe/uVDKDt22kJOlTwTslcYaITTYo/SXRFXWUv
	3zTSBfH3MmjCxXtpt6kHPLQhXbFs1hz23hUSO5sr3KE=
X-Received: by 2002:a05:6214:cc2:b0:6e8:9394:cbbe with SMTP id 6a1803df08f44-6f8b2c7b117mr370336306d6.20.1747941286035;
        Thu, 22 May 2025 12:14:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnvP93RgtHFU3/OIdPk/sEAnUG6j69VFPbMwWobtaNerAwoUt+hZltUAYDKdgFPSEjENLeGA==
X-Received: by 2002:a05:6214:cc2:b0:6e8:9394:cbbe with SMTP id 6a1803df08f44-6f8b2c7b117mr370335926d6.20.1747941285457;
        Thu, 22 May 2025 12:14:45 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b08ab862sm102862916d6.38.2025.05.22.12.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:14:45 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
To: sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com,
	Brian.Starkey@arm.com,
	jstultz@google.com,
	tjmercier@google.com,
	christian.koenig@amd.com
Cc: mripard@kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Jared Kangas <jkangas@redhat.com>
Subject: [PATCH v3 0/3] dma-buf: heaps: Use constant name for CMA heap
Date: Thu, 22 May 2025 12:14:15 -0700
Message-ID: <20250522191418.442390-1-jkangas@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This patch series is based on a previous discussion around CMA heap
naming. [1] The heap's name depends on the device name, which is
generally "reserved", "linux,cma", or "default-pool", but could be any
arbitrary name given to the default CMA area in the devicetree. For a
consistent userspace interface, the series introduces a constant name
for the CMA heap, and for backwards compatibility, an additional Kconfig
that controls the creation of a legacy-named heap with the same CMA
backing.

The ideas to handle backwards compatibility in [1] are to either use a
symlink or add a heap node with a duplicate minor. However, I assume
that we don't want to create symlinks in /dev from module initcalls, and
attempting to duplicate minors would cause device_create() to fail.
Because of these drawbacks, after brainstorming with Maxime Ripard, I
went with creating a new node in devtmpfs with its own minor. This
admittedly makes it a little unclear that the old and new nodes are
backed by the same heap when both are present. The only approach that I
think would provide total clarity on this in userspace is symlinking,
which seemed like a fairly involved solution for devtmpfs, but if I'm
wrong on this, please let me know.

Changelog:

v3:
  - Extract documentation markup fix to separate patch.
  - Adjust DEFAULT_CMA_NAME per discussion in [2].
  - Warn if the legacy heap name and the default heap name are the same.
  - Fix DMABUF_HEAPS_CMA_LEGACY prompt.
  - Touch up commit log wording.

v2:
  - Use tabs instead of spaces for large vertical alignment.

[1]: https://lore.kernel.org/all/f6412229-4606-41ad-8c05-7bbba2eb6e08@ti.com/
[2]: https://lore.kernel.org/all/CANDhNCroe6ZBtN_o=c71kzFFaWK-fF5rCdnr9P5h1sgPOWSGSw@mail.gmail.com/

Jared Kangas (3):
  Documentation: dma-buf: heaps: Fix code markup
  dma-buf: heaps: Parameterize heap name in __add_cma_heap()
  dma-buf: heaps: Give default CMA heap a fixed name

 Documentation/userspace-api/dma-buf-heaps.rst | 11 +++---
 drivers/dma-buf/heaps/Kconfig                 | 10 ++++++
 drivers/dma-buf/heaps/cma_heap.c              | 36 +++++++++++++++----
 3 files changed, 46 insertions(+), 11 deletions(-)

-- 
2.49.0

