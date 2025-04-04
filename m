Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887A01BEF87
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 10:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743762571; cv=none; b=HwfyNLLAdJjOh1GIbPSL7oU9gNVlA7pYsVvWEroXKsESfqnWF/Kk2VIG04NBwWXP32Bu7gYkgj6F7WajSZWKCXhcFJZAzH2lg/KPe8uBkqTM4nEzKowgxlbbgARYuTszD80KOH/ktekngXl6MQ5guZwiI8mE41uLQnTowRNFu8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743762571; c=relaxed/simple;
	bh=wPnxq84hCxnZktHB5n2SHxZDe2iMMhApu5mhJ8fGjr0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gvdTf9h01+t4yhIOztOH2q5DizLsBPC2oqgqwJB1DvJIClbcBA+yD6Z7PNkjbySS1tjYr55N1bc7CN6zldhJCHKTDXvfdVCAcaKFruZ8D+/F57M/pU9lDWEy3PVJ8X26Zsmjt4YzBYo2s5gitkLUvteW3gZ3M5+N4ywtTv9XlpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EGeP6yY9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EGeP6yY9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743762568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wxOnUPdlMvuJ8v48pnMnggaUsB9ujf80p/0TOnoHhrk=;
	b=EGeP6yY9g19O+cGlZW/oHtFixl/XbdVG+4j+JlzD/WFj8UxghPbVuMmqIgJ4/pmhxz7sA5
	ZBJ7EtLKaT5IalMPpAlF1LRRjMr6PebssTgx/Gnl/odhASm3b59bBwfPsyIdoMCbNgTBcT
	TauF6mgUbJcGU/x9CHHflN1qFPfRTSs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-iBigO-E8OzqDZYk0sJVpNQ-1; Fri, 04 Apr 2025 06:29:27 -0400
X-MC-Unique: iBigO-E8OzqDZYk0sJVpNQ-1
X-Mimecast-MFC-AGG-ID: iBigO-E8OzqDZYk0sJVpNQ_1743762566
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac297c7a0c2so153818666b.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 03:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743762565; x=1744367365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wxOnUPdlMvuJ8v48pnMnggaUsB9ujf80p/0TOnoHhrk=;
        b=oBNUxc2ExoZXgvA6S7u4/ISPS//rKLuosQKW+mzNrtuWmbGZhRPxVKFQeK5RjHOWaQ
         2LkBymHvuBww3AC2TDx3D4Bzx9wpAcDqe5y11ZsX6UpA5VIWKx/uVsG1O1RLtUEpQymc
         GB6QO1STcE/eLdfkI3q9STy17vXSisbzmywDJCMgOB3Rntj42ItRhXxXfWOFhKMB0Cd5
         5TYj2H+P22LmA1udFm6KFUHFtB/P5YKvXLdz1fO436rgw+zUYrkTPFekPI/SoQa1KBhA
         1t3teO9GB/HSf+D+sMwzICc379qcxEuuf+dO5EQvCMwqvFGMY+RWFDSygFCP12YsvDu0
         oOow==
X-Gm-Message-State: AOJu0Yz8A8DQpmMMyp3Mb1T20bdNdn1GEA08fisoSJkdu5gD1bwtDwkq
	7hUB58NpxmJ+bQo7SurTw7DbPRH2u7381RgJ5DuRs6uG4nN4Y8mknxubHCWla6s3WIOmM+MzF7W
	ANHqop6WsnHOB/pBagkBQugFTdxbMpBWsBlc7Zuk/md2xCww7xx9vQCNaYNsPLbtrQWSrJlq4bI
	XWoDt73WGz4haqpLo1CWTmTaJOMGYfRBD3mEiIpGePb3Yqgw==
X-Gm-Gg: ASbGncseAH1Dt4JZXZNrH7oCIcX3udinZRcr2ohRUrexp9671zrxvti0uapYc/++WSB
	dTM9jitw8R3t6yWWTM+B+tX7XmueD0fJH5mvctMKFq0CNDvOW44GIqj/i7As373GcRj+0HzbXNx
	BogmfomcloCqHdGKsSgu8M3cbP1x1dv2dyyDuT5W/hctH/U3319YRHAoMsWtsBQC+IVmExJXjjW
	xhjkgJNJI/7XhIUPyQ/0yb32FQ63E27RMAYKP8YQVGynHHQRKjh0IvzHvSVyeWmBr2oIB/Isu2I
	iZs3vddb2cwG3OTKw0A2
X-Received: by 2002:a17:907:9801:b0:ac6:e33a:6a0d with SMTP id a640c23a62f3a-ac7d199c8e5mr253555266b.55.1743762565276;
        Fri, 04 Apr 2025 03:29:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8o0pRabc4+gB4uulEDJjEE2gwOSpzOcpXqcH6CxNlDKuFME6qGnzVcNfndR6IyXcr7RMoSA==
X-Received: by 2002:a17:907:9801:b0:ac6:e33a:6a0d with SMTP id a640c23a62f3a-ac7d199c8e5mr253553166b.55.1743762564788;
        Fri, 04 Apr 2025 03:29:24 -0700 (PDT)
Received: from [192.168.122.1] ([151.49.230.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe5d688sm228256566b.33.2025.04.04.03.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 03:29:23 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Subject: [PATCH 1/5] Documentation: kvm: give correct name for KVM_CAP_SPAPR_MULTITCE
Date: Fri,  4 Apr 2025 12:29:15 +0200
Message-ID: <20250404102919.171952-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250404102919.171952-1-pbonzini@redhat.com>
References: <20250404102919.171952-1-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The capability is incorrectly called KVM_CAP_PPC_MULTITCE in the documentation.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Documentation/virt/kvm/api.rst | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index ef894e11727c..49a604154564 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -8862,10 +8862,9 @@ clearing the PVCLOCK_TSC_STABLE_BIT flag in Xen pvclock sources. This will be
 done when the KVM_CAP_XEN_HVM ioctl sets the
 KVM_XEN_HVM_CONFIG_PVCLOCK_TSC_UNSTABLE flag.
 
-8.31 KVM_CAP_PPC_MULTITCE
--------------------------
+8.31 KVM_CAP_SPAPR_MULTITCE
+---------------------------
 
-:Capability: KVM_CAP_PPC_MULTITCE
 :Architectures: ppc
 :Type: vm
 
-- 
2.49.0

