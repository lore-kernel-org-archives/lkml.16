Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C941F21CC6C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 04:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750220688; cv=none; b=c1ge6NEprXx94kQoTMIGh0zXpRzBctPNNADqm9Dl3YKpQCL0VqHvxOdzAcHxNxpFuiEsX70xlwkFU/xEVIepuWqMGOEKbjJa/UX0reP9vXd/wN5w0D5Fwc/us22JhT9D34uHC9rcx4fvTy6hH1Z0KY9yDeo9cgDlJVC3ogUz1ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750220688; c=relaxed/simple;
	bh=jSiCen/C1Tdc2UB541LJK2epQTbdnnCbieLg8I8XSIE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dPoMwMrfxUcAwHL6NYM5D17XReDUfYE8qshOiv4Plnm6UPk41HSjYQ3QA3doFtNDDgxVrGY10LhG1FTpXTHTcJyMmPkurgKASMMWJRUDr37VcYsnriqSiE7429OWr5dnXNZJj0ttrmelz4L9hT80onZioiXxeqN0b3u8354m1r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wzund+6I; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wzund+6I"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b2fb347b3e6so6389145a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750220685; x=1750825485; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lJmtzreapar7RYm6csfZXNlZpVROzgpN0suNPttjN9U=;
        b=Wzund+6Icwa5O3/0juL0BZb2/v/gcv/vvLwv+IGtYkiBSz3VkaqxW91RgcihHfLgKP
         hMogqClv5btqfQiCSNhaC3siOaNNFbaMRlZ4z7NStt5WHlQDdMgW3DhAjjpJQBXuImEI
         zo2gmp8JwJY24+5oxAzWNMEwLAhtQB18by9XZeKq3YDNQJjJWNl5nnZcOmdYaTdfG39s
         Uo5vO0r+HvPJYQAewKf1hjSETfHBeC4Z1TLEyEXaoq3Hxe2r0Tn4qZTYPemi8zfYWrNT
         k0FtyB7fRys1xt2gAxiKDF3ciYUQwr7XEbNdFigzuMO3UnL04G2SzoyD9F1pOehoLucD
         64Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750220685; x=1750825485;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lJmtzreapar7RYm6csfZXNlZpVROzgpN0suNPttjN9U=;
        b=StrlhrPe97HwYYIs4hztFZ/SO58J5HwcZ5+la3nn7neWp6xBZTkdcMDzbqR75CsjIJ
         EEqTmh7Ej4j2uptpexDpyDRT5PlValg2VVmcs2rmwF0yt9o5Me9ksS0CBYvFlNOfzLWi
         o6pWyntBvkX3TIQVEie/6NY+V1Msx3eToskp/3S1UdGGaXfzUhoGbb+v0x70/+I0PshO
         0FgWMgfxcADsgJQFAe0OXHuYk/BchvSvjm8gdJgrvuSbScjzqxjgPRhj0ykZly9E6lCp
         3nHEtWUQV0Rlxilau39BdNVdVbf0LeSwx4lNQdmbhkuhmiDhznaBmUtpexD0qsB44sQu
         BQvw==
X-Forwarded-Encrypted: i=1; AJvYcCWeyWfkvUPSDqRqtAT82QXSgWc0VrxfkM2LvqX99sIUPi8OPYYr2pGskKt6FAr5ZImP1IDsoTWcdOJVJm8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWGp0CWod+jJ3avSRl3XoO9Jk9KTO6YG3xl+twzbi9gG4L37J7
	ifms36xyh9lxcjQKeqj976IPPUSa3Wj6DgCeDUSOlbHY3hzXrznJNVbGpBNKfAp+h2eG0eM5lAT
	7qJsr/Eqky1MDR7NCuPiv5Q==
X-Google-Smtp-Source: AGHT+IEYBcC2cDsFrgiMsyVhS97ys7BmjM02OsUOLrECd3uh2HcwoI2YZYxPTZFJmgzjhVgSJXNOQSUyK0OIbxzF
X-Received: from pfus9.prod.google.com ([2002:a05:6a00:8c9:b0:747:a4c0:983d])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:a115:b0:218:c01:ddce with SMTP id adf61e73a8af0-21fbd5d90aemr27193918637.40.1750220685258;
 Tue, 17 Jun 2025 21:24:45 -0700 (PDT)
Date: Wed, 18 Jun 2025 04:24:21 +0000
In-Reply-To: <20250618042424.330664-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com>
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
Message-ID: <20250618042424.330664-13-jthoughton@google.com>
Subject: [PATCH v3 12/15] KVM: selftests: Inform set_memory_region_test of KVM_MEM_USERFAULT
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Oliver Upton <oliver.upton@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

The KVM_MEM_USERFAULT flag is supported iff KVM_CAP_USERFAULT is
available.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 tools/testing/selftests/kvm/set_memory_region_test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index ce3ac0fd6dfb4..ba3fe8a53b33e 100644
--- a/tools/testing/selftests/kvm/set_memory_region_test.c
+++ b/tools/testing/selftests/kvm/set_memory_region_test.c
@@ -364,6 +364,9 @@ static void test_invalid_memory_region_flags(void)
 	if (kvm_check_cap(KVM_CAP_MEMORY_ATTRIBUTES) & KVM_MEMORY_ATTRIBUTE_PRIVATE)
 		supported_flags |= KVM_MEM_GUEST_MEMFD;
 
+	if (kvm_check_cap(KVM_CAP_USERFAULT))
+		supported_flags |= KVM_MEM_USERFAULT;
+
 	for (i = 0; i < 32; i++) {
 		if ((supported_flags & BIT(i)) && !(v2_only_flags & BIT(i)))
 			continue;
-- 
2.50.0.rc2.692.g299adb8693-goog

