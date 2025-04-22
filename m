Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B70F293B70
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745340129; cv=none; b=KIaCCF0y4JZiBFLcbjYPAzKHtmALtatR2sAhT7w3tvBz6APaoDrTuT4C/z+R8coEgj3SqIP0fGw8WEXSzqQ6EHgl+aHXhnZSmtNDk/jblP2QrumIwdAXKUcEGSPyzcTNR4SwRMBvUY9gCBaJOKymHlKE9gWVgKSpHbOKHpqb4uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745340129; c=relaxed/simple;
	bh=UQBX8x4rTC1R9wFJI5Tf5/gNMsjeHaRLmt9zIWXzchg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NE77oBgR/pDSgKVDykghQYRboK8L8Gug3MJmxRWArNDbwth3Oa2V+D0wEjRADJJwCgyP7iloNsYqZ7Ol3GASWSlTfCUmdLqTnj/JjErsbI+4otZtoY5SPmucnObHDSlyPWdYTTsUnjbYWLPrLhZEnwqaFURmUDS2871ekNbMxWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IQc/UWLj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IQc/UWLj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745340126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KK4TWsLp0PtMCarQy+1TyJOWeXbWvyau46qeTqoxrRM=;
	b=IQc/UWLjuNm7ZXho0avBVw0bofte8s+fFwclZii8+UINy5z63/e4UK5qdUTl1N1FyLEfeO
	xG91lOdhyvGPhTfFJqyLnlzXYZLCcFCifxYwxYnatFKeyP7T0Ouenh+fq8jtPAyHb7WKfg
	5oM/QwW2CRru/63hewNK5DSOv6SfS0c=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-bOAdl9cUN7mZJQajCIKa0Q-1; Tue, 22 Apr 2025 12:42:05 -0400
X-MC-Unique: bOAdl9cUN7mZJQajCIKa0Q-1
X-Mimecast-MFC-AGG-ID: bOAdl9cUN7mZJQajCIKa0Q_1745340125
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f2b50a75d8so70160146d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745340125; x=1745944925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KK4TWsLp0PtMCarQy+1TyJOWeXbWvyau46qeTqoxrRM=;
        b=Zobteoq0fagByYJcgAz6cpYk102d8A/71smEPVlBi0GI2O8ANhcMfgWJgZJOqhKpNH
         KvwPx2Q0nlCuSJEpN5UVZclH4fmiZVEJ0s98nGCHkfK77/PO3CTfCJux1Sk0qfBbYdBy
         IwjYwlQ96A8PcJ1a743ZgqFqA/qci0XcxpT3ZG8LZ2IQ7U91S8ieD7ablm84Zvux6yrB
         yunv7+t4zoBgU407j4oy+H+GhDoWRfBP547dZXjBIuXqnMOzmUf1qh68+SR1c+WU4vZ3
         /c5A0zCQA8gghSSPo1GJuXgjCM6GI9G46wgsBuGu6xnykx3c3ZuQuE73LrUtmxlc299k
         1Erw==
X-Forwarded-Encrypted: i=1; AJvYcCVYgYUtQHesXRs7hEY+N0H/FCNbcL/rlVv74NkQgCfwdn2foI9C0RvEJPVXSYLPPm4XFHmQ6LDnE9MTzJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyODGwbBSDCv51nG5CDG2LjeeC/jObegmmISqrK3RAq/rS54mz1
	VwbjvaAL48jTDoLRWevz57sJ4hPoa1qW4mQbPK5VZtcsqGNtOikjzwG8/IDLs2xXN1Bi6s9d9fE
	SOwRxQ0bYdyZyNxtSBwJRNbIyM30nRljNN+AkmHqNudwfuQ7J/mIDsyoIGRJfCA==
X-Gm-Gg: ASbGncsmg8THRN42WEp7m75ZIhc/KKNYvLIxDN+OeVTunCjeCZKjMEs75bf9G+aKNbj
	pXCc/E5zZnRA4Vahb76er1UgMHJeH/LN/VItgYzWXS1SFHmKuC+D0ELETSA4EQZ42WrQN3MTGJ3
	7xPKcg/dtJhNrowcbd+ac5GB5Ps6Rw8seGJ3IKqop/ioe8PA7fkEeUKVvCHWftkQvdYSPxjjn5I
	+hcXfYSfjWuNNOuEtYf44hi+YhwZmqEFsiV1RMF1mTZRklrQkTkWjSw/V90kotpg6NcgKd75hWP
	5tRgEU7KfQL1KUuYdZtEtV0sWyt9aDr+u8yqevUoFUE=
X-Received: by 2002:a05:6214:c64:b0:6f2:c10b:db13 with SMTP id 6a1803df08f44-6f2c44ea415mr295054686d6.5.1745340124691;
        Tue, 22 Apr 2025 09:42:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHDj03Kvoy5X2geaEJFNrce1J9/+WUYtjeTgPtoN7cjkmOT88E1rMHseJK37Trf6aqqKx0kw==
X-Received: by 2002:a05:6214:c64:b0:6f2:c10b:db13 with SMTP id 6a1803df08f44-6f2c44ea415mr295054326d6.5.1745340124403;
        Tue, 22 Apr 2025 09:42:04 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2bfd182sm59451376d6.80.2025.04.22.09.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 09:42:04 -0700 (PDT)
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
Subject: [PATCH 0/2] dma-buf: heaps: Use constant name for CMA heap
Date: Tue, 22 Apr 2025 09:41:46 -0700
Message-ID: <20250422164148.547798-1-jkangas@redhat.com>
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

Thanks,
Jared

Jared Kangas (2):
  dma-buf: heaps: Parameterize heap name in __add_cma_heap()
  dma-buf: heaps: Give default CMA heap a fixed name

 Documentation/userspace-api/dma-buf-heaps.rst | 11 ++++---
 drivers/dma-buf/heaps/Kconfig                 | 10 +++++++
 drivers/dma-buf/heaps/cma_heap.c              | 30 ++++++++++++++-----
 3 files changed, 40 insertions(+), 11 deletions(-)

-- 
2.49.0

