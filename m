Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417971C5F14
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 15:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749135781; cv=none; b=HOsSLJOMEFiTWelUwING8nqmw8n8SGSxQYCq2FIpvHu5KXffhyOnCNwxGheV7OJgUYgG/YJdeL8FCQZnA8nxMsx5splxwTdlZJeAqxMfGDcRWZruTretmHuWfTvYqwB9yLe1K3QNtPsv3UzqGOa5Qau1uIDSWijqiNw2P7tyups=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749135781; c=relaxed/simple;
	bh=3jeQmiKt06GXrIHfpjh0oQlnOaSY9Kr4rz+umFvQdDA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LRaQoZJ/CKkFq26VYx404jy/xn48Ww8BHio5ay3X7F3I+//jVQ2K8ditRtBWU/Hs808RBu5ftdEOKAW4ciT+gM8tJ4paRbQ6NHr6YT7YLKsjc9o7S2Rfo7VTM/2wp4YqL9SY+OaJwbLtSIzNJ5geLdm+Mzsgbd+gVI6HITiW37Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xxcbR5lM; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xxcbR5lM"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7377139d8b1so1071401b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 08:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749135779; x=1749740579; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xzwm5+cjAdLoNMVYNUU/eCk5jF9CVdW14YhkjiBUlxs=;
        b=xxcbR5lMaILUjVpQrFjgd3/BOPL+dbjdx7N0iqLoFCCiWU48g512azL/kg8x5DHHsz
         UMEdP3DXImkfJea5LBpIp/R60bRrhqadUxRMBpJlMQiMQqQnExxL0dC/5kURg4OhZ+Rq
         3I0v5cJxmk8BudW0COy79kuny57EQ+2LA2Nrwgrlwa23Pt7lPFpNtmfanm+AHmTJiXC2
         sJzcTrz9/FusxTWSl3Ey8I2GC3Nr6I7D6UKoMkJEHJeoWX3jcG60CJCVNaJ7bZkANJZN
         nVf084+oupRHmDBN6HjaPMlEnz2qxAjMj9iv5y6DqwmqSCxPgDsJ/LBWz6PH/bt9WXp1
         mqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749135779; x=1749740579;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xzwm5+cjAdLoNMVYNUU/eCk5jF9CVdW14YhkjiBUlxs=;
        b=hmZyc5hcQugvMbTbn41HA6NMl3cfD8o0tjvKPm8LjL8TuF58KIU1COzuXqrHqkxZA0
         z7zbdnojwtJu+F/k3w6ThBWzv2+NTzoP+jO/TgKt84zIcFbT593yeqR3JvuiYJUZH/Sd
         dw0Oz3+MwuOjN4q8QSi7eKrcVD97nnTyt1322LNQH1X2m6P91jw2X8xDWEF+mh5eyTH6
         EVxVqj4HGEBWsx4Agui5s4Vr1ULNNY0nNQkpAurTA+VLhXMpeIlynWUGfJKFI6WJ5WIX
         1/o9rP0S1WL0sE9q56a+rskNYwIC1MRFacgVQrTrwi1C9E+umvjB1OUB84+6Jmix0n6J
         1quQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCv9E8JNOhNFJ/4zw7ICpvzm9EQQ9CXIqlc/5PmKQ7FsmxlNJC7TsrWd94vBsH81WLvlb9NMtoOshrO6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YymUv9nRY5VOrkwlZo14LXGK8Q8kemw3XpDLWvuHpEGWSi+0wC3
	ZTzj45IKg7LXaK68rS1McUZA+RtBFcRnSAMPL51MjmLFoHOhJHNtuHJNV0JL83GB+9KLWN3pQ4Y
	t427Zzu9iJKzH3HYRjnsEjbyamw==
X-Google-Smtp-Source: AGHT+IHb5hKDUYrgVOzSrfCbbqZtDuSQIRve0rxtHVkUEsiBbiESd9WvsZr9lyVAILAcpiMtqMiFe+S0tlpgh2kuCw==
X-Received: from pfvx14.prod.google.com ([2002:a05:6a00:270e:b0:747:9faf:ed39])
 (user=dionnaglaze job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:b53:b0:747:ee09:1fb4 with SMTP id d2e1a72fcca58-74827f09679mr61292b3a.15.1749135779455;
 Thu, 05 Jun 2025 08:02:59 -0700 (PDT)
Date: Thu,  5 Jun 2025 15:02:36 +0000
In-Reply-To: <20250605150236.3775954-1-dionnaglaze@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250605150236.3775954-1-dionnaglaze@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250605150236.3775954-3-dionnaglaze@google.com>
Subject: [PATCH v6 2/2] kvm: sev: If ccp is busy, report busy to guest
From: Dionna Glaze <dionnaglaze@google.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux-coco@lists.linux.dev, Dionna Glaze <dionnaglaze@google.com>, 
	Thomas Lendacky <Thomas.Lendacky@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <jroedel@suse.de>, Peter Gonda <pgonda@google.com>, Borislav Petkov <bp@alien8.de>, 
	Sean Christopherson <seanjc@google.com>
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
index e45f0cfae2bd..0ceb7e83a98d 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -4060,6 +4060,11 @@ static int snp_handle_guest_req(struct vcpu_svm *svm, gpa_t req_gpa, gpa_t resp_
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
2.50.0.rc0.642.g800a2b2222-goog

