Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7E628853C
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 18:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747248117; cv=none; b=mcy2FpZ0Bp6/LhcKD6PgLF+Kmort4+jg1i4+V4r+LY4eYjo5gO0j3vkHcTzt89NWejunN+tYuyjpFa0Ei2nIV5JWgPsVYk8P67Hn1Oyxxx/1boOt2wHQxKSvalpGrB3050F9y9SHJ7LBhGvwJZSYbhBT+v5PcLdY1qEwSYDnCmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747248117; c=relaxed/simple;
	bh=2O407uN7TPj25b78VqtGudUAcYRMX6ZZFh6qGZMf62g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VWnVcZzzZOkrYiqPrkxYeXCON1TWszxdKGLnogxkdGHjUri/3rUAF379lOv2iSzCck+bjee9xp2GJWIuGK64Hbg8KBajfWuNVaX64OYvx5JPrJUZmotX6K7+a9n45MxfGb0RyeAwkfJD4aRCELCgvf2+furYcxkHqA/c8qzsHiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bKsVEnG+; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bKsVEnG+"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-740adfc7babso164956b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 11:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747248116; x=1747852916; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QvCauuU2L9CGciSBd5j7n776p/pTGMk1tOvrluwsTQo=;
        b=bKsVEnG+vvBag+77Mu037rJ3BA+ea5Vu/BPF8y/FiNNFT1APwolHZtCHy3g8xI3sAp
         do81ent+2acVws5rD/VDB8wLKCQfxKEXyzIGL2IRyx+wi9fRZQXNDoSbCYNFefitCpw2
         /uv8ZKiAr/08plgbfL7YQXPcsuZlAXz4qMt3OVwBPne+v8nD+QxQu5Gfp6A5xyJ6ICu/
         m3BtL3ct3HFBZcot1ByAe3sPcY22XCs2wlhcaSNubf8V3vL+365QVbIs2qdrjOH/zEH5
         2/JFuk2NdOCeSwcSR8RYoSMPyX9Xh6fK+B2mi9FmrYivouB/5HlOoK1CVoGOLUGX9Y9O
         hXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747248116; x=1747852916;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QvCauuU2L9CGciSBd5j7n776p/pTGMk1tOvrluwsTQo=;
        b=deoEOun4jJsJCX93q3/rlYjqH07oCwpkO1zhpLSM0ZVNFSwSHy76Z4BJsIvJ7Kv0uI
         fsrcR6TaZNPFOIZfVigpXxuAmamTSCJl3jMRM6ZIpXYFofDDMQVHv35jHomLKvK5xtVA
         MGgjrP1rDxEBDGW0YUl01XbjlAMTevHLZugRYB2G9Ub6GUN+jJvd+ER7d6EbACZyBmhh
         WydFYyg3yBaFZN63X5qhggBPXv/rznApD3HeERo0+oZqKnE+VRkAaOKde+kakEg5iW77
         FSBkLHg00W/ht2RVOPv9zdeSTLowdKDZl/WKv8LRty8L4iSRbMt4apiLsvcMojrsNxsd
         w7xg==
X-Gm-Message-State: AOJu0YyFi+tF21vY8ac1guexMDTjxf0IiTgmRmJANqTwG09sV/ISPKqg
	s7K6xdNnlk2PuyY+oaxdoFZo6Uji1bYEgW+StG/+Iv+oTVYwgBrICH2xWSlohc0KvjBN5/cAqnb
	ALh6BSwDYqIlrMGN/r9GXYg==
X-Google-Smtp-Source: AGHT+IHAyCtpbaFX2wLqdc+E6NWHdYXGqYB3sKBEGQUjo89w5UgIHgCaHe6vWLT29dng2koFOR7LeCkZ+D5XCeyATw==
X-Received: from pgc11.prod.google.com ([2002:a05:6a02:2f8b:b0:b14:df7a:ff1])
 (user=dionnaglaze job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:62cc:b0:215:d4be:b0b1 with SMTP id adf61e73a8af0-215ff194479mr8038203637.32.1747248115718;
 Wed, 14 May 2025 11:41:55 -0700 (PDT)
Date: Wed, 14 May 2025 18:41:35 +0000
In-Reply-To: <20250514184136.238446-1-dionnaglaze@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250514184136.238446-1-dionnaglaze@google.com>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <20250514184136.238446-3-dionnaglaze@google.com>
Subject: [PATCH v4 2/2] kvm: sev: If ccp is busy, report busy to guest
From: Dionna Glaze <dionnaglaze@google.com>
To: kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Dionna Glaze <dionnaglaze@google.com>, Thomas Lendacky <Thomas.Lendacky@amd.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <jroedel@suse.de>, Peter Gonda <pgonda@google.com>, 
	Borislav Petkov <bp@alien8.de>, Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"

The ccp driver can be overloaded even with guest request rate limits.
The return value of -EBUSY means that there is no firmware error to
report back to user space, so the guest VM would see this as
exitinfo2 = 0. The false success can trick the guest to update its
message sequence number when it shouldn't have.

Instead, when ccp returns -EBUSY, that is reported to userspace as the
throttling return value.

Cc: Thomas Lendacky <Thomas.Lendacky@amd.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Joerg Roedel <jroedel@suse.de>
Cc: Peter Gonda <pgonda@google.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Sean Christopherson <seanjc@google.com>

Signed-off-by: Dionna Glaze <dionnaglaze@google.com>
---
 arch/x86/kvm/svm/sev.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index febf4b45fddf..c1bd82c26a11 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -4061,6 +4061,11 @@ static int snp_handle_guest_req(struct vcpu_svm *svm, gpa_t req_gpa, gpa_t resp_
 	 * the PSP is dead and commands are timing out.
 	 */
 	ret = sev_issue_cmd(kvm, SEV_CMD_SNP_GUEST_REQUEST, &data, &fw_err);
+	if (ret == -EBUSY) {
+		svm_vmgexit_no_action(svm, SNP_GUEST_ERR(SNP_GUEST_VMM_ERR_BUSY, fw_err));
+		ret = 1;
+		goto out_unlock;
+	}
 	if (ret && !fw_err)
 		goto out_unlock;
 
-- 
2.49.0.1045.g170613ef41-goog

