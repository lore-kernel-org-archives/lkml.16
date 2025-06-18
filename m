Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3793B220689
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 04:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750220691; cv=none; b=rFjemDSmQAB10HenE/z2mogGnEDe0RgW3E3tklga/undzoAM0dd7QaZpj3PQ4Tq1Cv+yULZdD0sdSzN9OQVMuMDirWhS93HIjMVlCoadnfUvKouGj76p/j/PW/6Zu2iq2TXzClhQOnI0ORlawqZvf6xk5ypCQMRMYRkkXkJYLnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750220691; c=relaxed/simple;
	bh=TlPwQV38TsKUYD4upWrrqkkEe7fCtClTkHmYIdQHZto=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JHQz76GrD3PgKrN9tc9sHWJPFdcn58EejRzUxdr6aRUqoM+t4LK6C+jQuKw7ifrOwYTesxuFAvnVPYozlCqcA+jT/yaCVXhV/kyZBYE36xBREXHPOa+wAbtR05g3W4jujhimic04whWd67ZclrNNwfJcIpjBYMTa6ZlTXui9dqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sqlFzraH; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sqlFzraH"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b1ffc678adfso4015769a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750220690; x=1750825490; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=P6MpWO9eGHCybkhP95T8R+1KfjKYk4MOXDyWFRHvmIc=;
        b=sqlFzraHghTHRkzSRh5LYZqz0Li96xF/7qXzaeRb6Hsgv5Jp0FgjmB66wj3unmdJQS
         JydoGEG6palK4LvzFRmdY7Jlru8hU3CVV2OSKH+2PEwfslG/VtLyUf6wOhnVqZU21Wuh
         Jdf1V4QZYh041kkYjQ8YWaBueksQ1V07nsXfa28RlR9XllZz/augWVUb+lyVkdvyLqxQ
         VG4ltejQa3Jm7Qy4M7VIxlWtoyQjgZVG7ASR1+QbMtLpz7QzgaR6GgHf9ZP8IAZT5kwQ
         OymuRDSXy4I32QSUpCrot2nXSEllVdLCm18cqtQjVOTvQrNw9tuN+c95DB9DSwpux7g0
         LD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750220690; x=1750825490;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P6MpWO9eGHCybkhP95T8R+1KfjKYk4MOXDyWFRHvmIc=;
        b=n4hBXK/XZYAn3qRR74z7kgspEfnUJd7wCzblsmVZYSd9Qj9G5/xW0rakRmdV7JElyU
         gD5ff70m6dA26cGV8feQxyEsxhtKQFPtfGXe3c2/cj99d3cdd0GSVm0EKjWzFMIuVhwn
         HENxKE05aVWrkaNvQfBX9Z1EKW+pHJEaAqPsv1nUOhCOWI8U1m94a32ZCehqPoT+3Zp0
         qzvK6h/tT2/P/rJFomDExtxCQl77ZqPSWnXcxOpQBODf8YYBedtJ14mSQI6VKFWoCRLU
         JEBIjTcAGyFSwPTWepjKs20/AsncnyCd/G/6jnErLtFogGYrb97qRP1V34+wXygKseVf
         VM8A==
X-Forwarded-Encrypted: i=1; AJvYcCVc7D4maTEG3PyR12Y42zv+TMcpkZnN8i3rEFsIb4odo6K1eLQnrFiDZ7Vab5volK7GmOQxXj08GddrNCA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPgo5GVEmyqwEFW5F5B495yT2gnlmvwmzzej1VbGxE/nCL0Ila
	k9r/zueVJTisMq9AYZo2MbOmfYMnZZ24/o2xzAQJ1xfw4NIrOaGJQ8/WKnjNpAFjmAShSQvwdyQ
	cxThn+9TBpcFbjeTINNpKZQ==
X-Google-Smtp-Source: AGHT+IFBmqhQDFkst9hOrle0gOrugvU+bLMa/osue2o1jv722NhjgUmFbYBlQLzwI5ul7WF7bNf9FKyZ7x+dJLfM
X-Received: from pgbfq12.prod.google.com ([2002:a05:6a02:298c:b0:b2f:dfa3:cb81])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:512:b0:218:5954:1293 with SMTP id adf61e73a8af0-21fbd668df0mr28784142637.34.1750220689787;
 Tue, 17 Jun 2025 21:24:49 -0700 (PDT)
Date: Wed, 18 Jun 2025 04:24:24 +0000
In-Reply-To: <20250618042424.330664-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com>
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
Message-ID: <20250618042424.330664-16-jthoughton@google.com>
Subject: [PATCH v3 15/15] KVM: Documentation: Add KVM_CAP_USERFAULT and
 KVM_MEM_USERFAULT details
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Oliver Upton <oliver.upton@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Include the note about memory ordering when clearing bits in
userfault_bitmap, as it may not be obvious for users.

Signed-off-by: James Houghton <jthoughton@google.com>
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/virt/kvm/api.rst | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index ff0aa9eb91efe..25668206a5d80 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6308,7 +6308,8 @@ bounds checks apply (use common sense).
 	__u64 guest_memfd_offset;
 	__u32 guest_memfd;
 	__u32 pad1;
-	__u64 pad2[14];
+	__u64 userfault_bitmap;
+	__u64 pad2[13];
   };
 
 A KVM_MEM_GUEST_MEMFD region _must_ have a valid guest_memfd (private memory) and
@@ -6324,6 +6325,25 @@ state.  At VM creation time, all memory is shared, i.e. the PRIVATE attribute
 is '0' for all gfns.  Userspace can control whether memory is shared/private by
 toggling KVM_MEMORY_ATTRIBUTE_PRIVATE via KVM_SET_MEMORY_ATTRIBUTES as needed.
 
+When the KVM_MEM_USERFAULT flag is set, userfault_bitmap points to the starting
+address for the bitmap that controls if vCPU memory faults should immediately
+exit to userspace. If an invalid pointer is provided, at fault time, KVM_RUN
+will return -EFAULT. KVM_MEM_USERFAULT is only supported when
+KVM_CAP_USERFAULT is supported.
+
+userfault_bitmap should point to an array of longs where each bit in the array
+linearly corresponds to a single gfn. Bit 0 in userfault_bitmap corresponds to
+guest_phys_addr, bit 1 corresponds to guest_phys_addr + PAGE_SIZE, etc. If the
+bit for a page is set, any vCPU access to that page will exit to userspace with
+KVM_MEMORY_EXIT_FLAG_USERFAULT.
+
+Setting bits in userfault_bitmap has no effect on pages that have already been
+mapped by KVM until KVM_MEM_USERFAULT is disabled and re-enabled again.
+
+Clearing bits in userfault_bitmap should usually be done with a store-release
+if changes to guest memory are being made available to the guest via
+userfault_bitmap.
+
 S390:
 ^^^^^
 
@@ -8557,6 +8577,17 @@ given VM.
 When this capability is enabled, KVM resets the VCPU when setting
 MP_STATE_INIT_RECEIVED through IOCTL.  The original MP_STATE is preserved.
 
+7.44 KVM_CAP_USERFAULT
+----------------------
+
+:Architectures: x86, arm64
+:Returns: Informational only, -EINVAL on direct KVM_ENABLE_CAP.
+
+The presence of this capability indicates that KVM_SET_USER_MEMORY_REGION2 will
+accept KVM_MEM_USERFAULT as a valid memslot flag.
+
+See KVM_SET_USER_MEMORY_REGION2 for more details.
+
 8. Other capabilities.
 ======================
 
-- 
2.50.0.rc2.692.g299adb8693-goog

