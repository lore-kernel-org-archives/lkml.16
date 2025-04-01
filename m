Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB7020D4F4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743523881; cv=none; b=GSqZz/LseBoModRXUxIhiupEWR/ptohs4DzwGGQ+BZI2qEaeaLrrm4eq0FRzYLugvnGbtujPccyiB1qHSxnEcZltdagc2gPyeaYVKsu4Ro9fWTj5NRXRGcNsicxoGzQFPPMXaOfncSGkl+Ka9W+1eae57fiOMPNbCvjg2vi1I8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743523881; c=relaxed/simple;
	bh=P8Cr7Z2TxPF0ktXGH33ko7FhabI+md/UaeO2mhqlq9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eEK5FjJOb6ZHUy4ksrXmkre6pqkOduykqAC8FRw7bJ0Lk8FcxsXwDvidKlHI+7hPiJ82Q5NuVW78unGiLeGLzlamYbMipeJ63VZ/tqbCdEKRhtmD0BMokPBdRxDkjgBhx0wTgJywP5iUUu/SZe3cNmI9OmXfIintlRprUrdFRwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tqt000+5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tqt000+5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743523878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xan579+d7KgslaidCIf/x6Agm9xb9cfRwwriUXqq5BU=;
	b=Tqt000+5WPb4a2EupowFeOKEkMKsZIeEpmDDIdphznd1+/vke+ntJOBqvWJPPSgjp1JiEU
	dN7GtZnQGO6U6NJygHhQ3jt15ZkDeaPELTTOId0DMmiUQ0a6igtIJzUfYV7OEK056pMmb4
	6qhNGZnQPUV6TyuD2jLACw6JivJ8yu8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-C3nW-pdcMPyxOnwZmk-KDA-1; Tue, 01 Apr 2025 12:11:17 -0400
X-MC-Unique: C3nW-pdcMPyxOnwZmk-KDA-1
X-Mimecast-MFC-AGG-ID: C3nW-pdcMPyxOnwZmk-KDA_1743523876
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d6c65dc52so38991815e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:11:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523875; x=1744128675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xan579+d7KgslaidCIf/x6Agm9xb9cfRwwriUXqq5BU=;
        b=qrnhXAJ82Ds5EC7oRVFh8yf/s81WicJPq6PpQX/QiPexE0RgZaSBN+zGuWQO/p5kIl
         fTMBA/cR5SXojNuK88P+OWolMAfBbroyNv7tYmQgttwzadV78RuTwaLATMRHrwpnPZ6J
         ERUfCc21jYBQkFu2FSxUioeO00mtEgp2SpO9hYgh2n9HiB3dN9WpGUZEFYMKlBJgEHq+
         JJUQ/hbtv2s/oH6RtRXKVX50fzjYWa72v1jT5GiHTavAS2nAXm4O+UU4ldtsr8ZdQGkI
         la+uB+LChRe31+Ujoq/Bf7YuzrLc31DyID9ebZZrZHjddTAfDpyGcmO1OtLyxK4W1TKw
         LTzw==
X-Gm-Message-State: AOJu0YwvxLkIAoANNoVuD3fRN3G04fIIfH6cXHin/60jjl/GaFqN93nS
	/1mg0ZHZc/+LGwzXemuNq1AsBnk6h3LpaXnmu+3VBPnkSqspCI4iWqaLZzrCf5KsB3OczU97bK3
	OUx37678l0ky+weLqTVsjwGvPwy8qK63gaTqWyWyXU5TQM4gskD/YJc3Crkn5RChXQ+CQ7S5GL9
	+oTDrbAPTed8+m0/Drict3DiZabr4f0pzYGHCVr3ZrWUdRkg==
X-Gm-Gg: ASbGnctTUdp+177GK2Qw9TedMOlUxo94j/sdQfYGO8lDxvdDFqbhVB/IzJYOrWr/rp8
	GTiC03p/tJFhlYIAhpqRntwEQbXXAPBV8LI4K4xOCDrmD7/WuFtSi+1symZO43JZAQlifqLq3vZ
	2dvksp/xcCB+oMSL9m9+Bp9+/Z6ribSQdPMQ9RqV5Ro5JwiDUoe3d4bTRZL6tIpmyBediXIC2sK
	ZhFXKubxZI3+ozEM2CSltTwsIkVLPhSbM4gkK3e3bFVj9WMMszlWn3fIOQCHdvhQVM7LpM3domI
	40yG1ur8vHT7WP3WsokQ+A==
X-Received: by 2002:a05:600c:8411:b0:43c:efed:733e with SMTP id 5b1f17b1804b1-43e9532e1ebmr100629205e9.14.1743523875173;
        Tue, 01 Apr 2025 09:11:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUdn3Vx4U1/8c8ov9d3i+5ptLX3WkvMAvnyRA6d81On2Tt/Y/tDhAYSD2hlI0h2+y0PDDicw==
X-Received: by 2002:a05:600c:8411:b0:43c:efed:733e with SMTP id 5b1f17b1804b1-43e9532e1ebmr100628635e9.14.1743523874749;
        Tue, 01 Apr 2025 09:11:14 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.111.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fbc10f7sm162095215e9.14.2025.04.01.09.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:11:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: roy.hopkins@suse.com,
	seanjc@google.com,
	thomas.lendacky@amd.com,
	ashish.kalra@amd.com,
	michael.roth@amd.com,
	jroedel@suse.de,
	nsaenz@amazon.com,
	anelkz@amazon.de,
	James.Bottomley@HansenPartnership.com
Subject: [PATCH 02/29] KVM: API definitions for plane userspace exit
Date: Tue,  1 Apr 2025 18:10:39 +0200
Message-ID: <20250401161106.790710-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401161106.790710-1-pbonzini@redhat.com>
References: <20250401161106.790710-1-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Copy over the uapi definitions from the Documentation/ directory.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/uapi/linux/kvm.h | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 1e0a511c43d0..b0cca93ebcb3 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -135,6 +135,16 @@ struct kvm_xen_exit {
 	} u;
 };
 
+struct kvm_plane_event_exit {
+#define KVM_PLANE_EVENT_INTERRUPT    1
+	__u16 cause;
+	__u16 pending_event_planes;
+	__u16 target;
+	__u16 padding;
+	__u32 flags;
+	__u64 extra[8];
+};
+
 struct kvm_tdx_exit {
 #define KVM_EXIT_TDX_VMCALL     1
         __u32 type;
@@ -262,7 +272,8 @@ struct kvm_tdx_exit {
 #define KVM_EXIT_NOTIFY           37
 #define KVM_EXIT_LOONGARCH_IOCSR  38
 #define KVM_EXIT_MEMORY_FAULT     39
-#define KVM_EXIT_TDX              40
+#define KVM_EXIT_PLANE_EVENT      40
+#define KVM_EXIT_TDX              41
 
 /* For KVM_EXIT_INTERNAL_ERROR */
 /* Emulate instruction failed. */
@@ -295,7 +306,13 @@ struct kvm_run {
 	/* in */
 	__u8 request_interrupt_window;
 	__u8 HINT_UNSAFE_IN_KVM(immediate_exit);
-	__u8 padding1[6];
+
+	/* in/out */
+	__u8 plane;
+	__u16 suspended_planes;
+
+	/* in */
+	__u16 req_exit_planes;
 
 	/* out */
 	__u32 exit_reason;
@@ -532,6 +549,8 @@ struct kvm_run {
 			__u64 gpa;
 			__u64 size;
 		} memory_fault;
+		/* KVM_EXIT_PLANE_EVENT */
+		struct kvm_plane_event_exit plane_event;
 		/* KVM_EXIT_TDX */
 		struct kvm_tdx_exit tdx;
 		/* Fix the size of the union. */
@@ -1017,6 +1036,8 @@ struct kvm_enable_cap {
 #define KVM_CAP_PRE_FAULT_MEMORY 236
 #define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
 #define KVM_CAP_X86_GUEST_MODE 238
+#define KVM_CAP_PLANES 239
+#define KVM_CAP_PLANES_FPU 240
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
-- 
2.49.0

