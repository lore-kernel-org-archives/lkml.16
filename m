Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82A627FD72
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 19:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747423201; cv=none; b=oyAFSXG4j/ekSu+EaJWnAQJqj0mtooxNp1YoG7sPzIqbcAWLnhaOH0MAd3IQRH20IH0eV6occnQlQwawR5FX9x/9VUlrqpSXZ31sqAWY+CHy671pAENx685kpdQA4BxPWy0O4DSF5NmKallwPf8ydnz84Io7dx/GqPXNpxDdRt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747423201; c=relaxed/simple;
	bh=3OVBGplhuLyJXi91gK0acJyrlMFbObAXSg45TnNYvbw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZQiijHeLeVRFeQ5yz5AGW5Yc7+cEVZlMs+YmdlhsQmkaCmY5Aw2VZrxF4d+UmziQizOPao16c+XT+uF/lOW4g2IjbUi/eKZSAo5WdJDd9akvng5CL/I61xUXon1othSBY1G+qML+ZjfBp0cJi2uW0Gm2TCXul6b3lBlZsDouw+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--afranji.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o4aaaQ9s; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--afranji.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o4aaaQ9s"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30adbe9b568so2388164a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 12:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747423199; x=1748027999; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Ey+qHNz3Id949hQmd8IqzRnzJEXEhx4K2zZ7tQ+zaA=;
        b=o4aaaQ9sGG6wCtxro+Qc8JnHRiR6pDBRMUX4USXdy74+puTRJ89aVNbNjkQcOErHs5
         k8FY7BH+w3EJBdGXttIl0DWOeOIsLGsUzcsAR/sAehTL80T5KVjVexv7R2T9YP2t3IQZ
         wccPBBXqM9cwZpJGSFMkg/lbpiDu0BMTtRnUSLSnA4XeKMptLoDhvlSQaZTvCLlozXVv
         mi7GwXGMLxanIxcPSHyyFwBGFzDyRli53AIQgTGyo6Cj4lmYA98vS3sPHALMGaaYPNAf
         lWZ+OIjytDZMy07GWlVSMeRHL7wZiUXw9poQq77Mr9pscSenf3WxEFNkpUEalQo/Bv6e
         kV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747423199; x=1748027999;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Ey+qHNz3Id949hQmd8IqzRnzJEXEhx4K2zZ7tQ+zaA=;
        b=P+ZOYZXxqbDpQAWo3fJZDTxcAQAisgIzKjw0ozIaK1buqE//0EwYn9lor/jn1R00CR
         I4CgEyLVHgfalFdnmCeyvHz335o7zdBF8F4EuxPTlSgSQoxeQPwrKjLvFVHkuHqmTuoG
         vkDBwgNcnqx6cMw+UV6f9GqBQExXru+HNlmh5pP02xRE056baQop+BZ0Wn3Il2MQVbhd
         fycnpgAsACTQbhGjRnRrnfbY3ZRAZjWTeXoBQigZT6m6rQW7XzFmueJ2uvofzIqu1nrf
         WUMpOC/Mg/daAVycvbWoCOB3YIqCZ8waF632LYs79yx49nqFPJh+piXXdkcEmrVSG0J9
         pJ1g==
X-Forwarded-Encrypted: i=1; AJvYcCXgsAN6i9iRZp297GATWvC+wEJAC5zhMzOEqifwLt4qkjIyhmVCD4Ij8SCjppMRcntXKIxVIbrMIg8ewqU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOeKQ525SAmKWd8kQAT/ZaOLZrUhyxZ1UNH6lm2b1JyrN/NJTw
	ra0AiTc17reg3Cyh/IH2+IZIErb+9TpK+4EYmdfvJ8hR7mpiKI+8O064jskNR5hm+Nupws1iZ1S
	MtOU+zdzH9A==
X-Google-Smtp-Source: AGHT+IF3tOGDs3uMTUXFN04Lh1XuUUSb8FRl25FYpCEolQddp0RRUtONR8vJwzDBqRDLQzwKKqJKODObKV73
X-Received: from pjz15.prod.google.com ([2002:a17:90b:56cf:b0:2ef:786a:1835])
 (user=afranji job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d407:b0:30e:823f:ef25
 with SMTP id 98e67ed59e1d1-30e823fefedmr5901603a91.28.1747423198880; Fri, 16
 May 2025 12:19:58 -0700 (PDT)
Date: Fri, 16 May 2025 19:19:27 +0000
In-Reply-To: <cover.1747368092.git.afranji@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1747368092.git.afranji@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <6ef77cc986aa89c1799cf3709de30edd6e4e70ee.1747368093.git.afranji@google.com>
Subject: [RFC PATCH v2 07/13] KVM: x86: Refactor sev's flag
 migration_in_progress to kvm struct
From: Ryan Afranji <afranji@google.com>
To: afranji@google.com, ackerleytng@google.com, pbonzini@redhat.com, 
	seanjc@google.com, tglx@linutronix.de, x86@kernel.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	tabba@google.com
Cc: mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	shuah@kernel.org, andrew.jones@linux.dev, ricarkol@google.com, 
	chao.p.peng@linux.intel.com, jarkko@kernel.org, yu.c.zhang@linux.intel.com, 
	vannapurve@google.com, erdemaktas@google.com, mail@maciej.szmigiero.name, 
	vbabka@suse.cz, david@redhat.com, qperret@google.com, michael.roth@amd.com, 
	wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com, sagis@google.com, jthoughton@google.com
Content-Type: text/plain; charset="UTF-8"

From: Ackerley Tng <ackerleytng@google.com>

The migration_in_progress flag will also be needed for migration of
non-sev VMs.

Co-developed-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Co-developed-by: Vishal Annapurve <vannapurve@google.com>
Signed-off-by: Vishal Annapurve <vannapurve@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Ryan Afranji <afranji@google.com>
---
 arch/x86/kvm/svm/sev.c   | 17 ++++++-----------
 arch/x86/kvm/svm/svm.h   |  1 -
 include/linux/kvm_host.h |  1 +
 3 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 0bc708ee2788..89c06cfcc200 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -1838,8 +1838,6 @@ static bool is_cmd_allowed_from_mirror(u32 cmd_id)
 
 static int sev_lock_two_vms(struct kvm *dst_kvm, struct kvm *src_kvm)
 {
-	struct kvm_sev_info *dst_sev = to_kvm_sev_info(dst_kvm);
-	struct kvm_sev_info *src_sev = to_kvm_sev_info(src_kvm);
 	int r = -EBUSY;
 
 	if (dst_kvm == src_kvm)
@@ -1849,10 +1847,10 @@ static int sev_lock_two_vms(struct kvm *dst_kvm, struct kvm *src_kvm)
 	 * Bail if these VMs are already involved in a migration to avoid
 	 * deadlock between two VMs trying to migrate to/from each other.
 	 */
-	if (atomic_cmpxchg_acquire(&dst_sev->migration_in_progress, 0, 1))
+	if (atomic_cmpxchg_acquire(&dst_kvm->migration_in_progress, 0, 1))
 		return -EBUSY;
 
-	if (atomic_cmpxchg_acquire(&src_sev->migration_in_progress, 0, 1))
+	if (atomic_cmpxchg_acquire(&src_kvm->migration_in_progress, 0, 1))
 		goto release_dst;
 
 	r = -EINTR;
@@ -1865,21 +1863,18 @@ static int sev_lock_two_vms(struct kvm *dst_kvm, struct kvm *src_kvm)
 unlock_dst:
 	mutex_unlock(&dst_kvm->lock);
 release_src:
-	atomic_set_release(&src_sev->migration_in_progress, 0);
+	atomic_set_release(&src_kvm->migration_in_progress, 0);
 release_dst:
-	atomic_set_release(&dst_sev->migration_in_progress, 0);
+	atomic_set_release(&dst_kvm->migration_in_progress, 0);
 	return r;
 }
 
 static void sev_unlock_two_vms(struct kvm *dst_kvm, struct kvm *src_kvm)
 {
-	struct kvm_sev_info *dst_sev = to_kvm_sev_info(dst_kvm);
-	struct kvm_sev_info *src_sev = to_kvm_sev_info(src_kvm);
-
 	mutex_unlock(&dst_kvm->lock);
 	mutex_unlock(&src_kvm->lock);
-	atomic_set_release(&dst_sev->migration_in_progress, 0);
-	atomic_set_release(&src_sev->migration_in_progress, 0);
+	atomic_set_release(&dst_kvm->migration_in_progress, 0);
+	atomic_set_release(&src_kvm->migration_in_progress, 0);
 }
 
 /* vCPU mutex subclasses.  */
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index d4490eaed55d..35df8be621c5 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -107,7 +107,6 @@ struct kvm_sev_info {
 	struct list_head mirror_vms; /* List of VMs mirroring */
 	struct list_head mirror_entry; /* Use as a list entry of mirrors */
 	struct misc_cg *misc_cg; /* For misc cgroup accounting */
-	atomic_t migration_in_progress;
 	void *snp_context;      /* SNP guest context page */
 	void *guest_req_buf;    /* Bounce buffer for SNP Guest Request input */
 	void *guest_resp_buf;   /* Bounce buffer for SNP Guest Request output */
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 1dedc421b3e3..0c1d637a6e7d 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -862,6 +862,7 @@ struct kvm {
 	/* Protected by slots_locks (for writes) and RCU (for reads) */
 	struct xarray mem_attr_array;
 #endif
+	atomic_t migration_in_progress;
 	char stats_id[KVM_STATS_NAME_SIZE];
 };
 
-- 
2.49.0.1101.gccaa498523-goog

