Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F4327718
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 03:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746157997; cv=none; b=LHgE2CgysIq+Fud7IbCFBC1T09EYhMdQIli69CabiF/xo0UqhSYR32p3BbRSx258JWKlVoX8r0K62sH3FPprP/aCAy5qBepfd/+Mz0IlFZOCjrcLDxah36py4ICb097StCbAXYLMssz+7Kdm/HEsuqcoCmgMuOXuPoerIn8cObc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746157997; c=relaxed/simple;
	bh=3guqmtCUgZU4RrlWuBDVyZE/GiHf7japNUzdE+nkYF0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=k9cIRptU4cE1GiifOtL58jH6oziFETRo/5upRMrXPCDGPNlnxVQ/wu6PMoHtTQhnIUEl+mcWhe2JPUuS9btzp/o4pqofajNfGN4wRaKeFpgD4ZtHYmAnLStV9vDBQGk4GXxmVRYDXqI0NQ/5L8WHmGZD+K9be8ibSNCh1GGS46I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=immunant.com; spf=none smtp.mailfrom=immunant.com; dkim=pass (2048-bit key) header.d=immunant-com.20230601.gappssmtp.com header.i=@immunant-com.20230601.gappssmtp.com header.b=UKPCcbQ8; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=immunant.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=immunant.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=immunant-com.20230601.gappssmtp.com header.i=@immunant-com.20230601.gappssmtp.com header.b="UKPCcbQ8"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-605f7d3215cso820374eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 20:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=immunant-com.20230601.gappssmtp.com; s=20230601; t=1746157995; x=1746762795; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ojFTK86BOKHs5Sffk/1VcJDUeg7+bF9Sd/43yKdhw7c=;
        b=UKPCcbQ8wN9Db1R8g3fkykokiLykFb+LBYw0WeP7hxmAFjD9I/uPHo5gSVNNzTCk75
         EgwJxB0Xcj/mE3onGcMVEzBmA3+1muEZh+/8nsO0TsbjOaCXGVdtN4RBVvJwPqLhFZKY
         xzykgSpVwpFVhRWm7/dJZDHRHWuKYBaAgnnvaI90AJjmUUiZolx096Dww6Wxr/lPJyPS
         4G7TP70OkxFZNKuhHlxtbovlAo4tRL2O1iI4U4gJtovXFhhCyri2T+w5wmvibrcsM2Rg
         +etj/Ts9Mo2lYMaCMsMitJYhR7afuF+Sge37sxM3MkBKcVNMlvfJIKzEe5Rx3v3lylGh
         EaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746157995; x=1746762795;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ojFTK86BOKHs5Sffk/1VcJDUeg7+bF9Sd/43yKdhw7c=;
        b=Cqa5P767adl1ISwwstXfNqmcdhx+ojn/SpwBErzBvDj+jsfRxg+L6rlJzJKWhxWhwZ
         25aRgHeR+tytF3xssn67NfmQ6yYdD8XvLSwwtM6NkRvwn55Wd6GTN7YbRbtTgVS9oUu5
         6eXy6aMT7s9wVI2ehuk31wgJ1mTs/SgQkEB5seZCGONanFlMgw44UIGuiIWsbI+fGTWH
         /N3kFO5mtNH8vwQued4YmZ4bqC26RGR1C8R5/ss/Uhrrdj5hmVS/YMBUaiMuHumR+n97
         d/giBpVc771nbYsnNHLylOwhcXAAtsMvpi8YoxwR8/IWMX3bYuLzzIpIDh+fyHNvhctm
         Xevg==
X-Gm-Message-State: AOJu0YwtC9yKQTvGZV5HJy4pcamPgMtbSwrFJvQ35sUpHlfd5uQF8C+B
	3WswW61s+x2/iWOAG79eGncFFvYP2/j1L77ipUmX8dybS7ixsvLnqNlJ/4G8gMjQE8VFgKIXdmo
	jgP2+zCxZMQqhyyqYbWJVRE/ZG+/KLns2aYlL6JXT2AKJQvxbzq2NKA==
X-Gm-Gg: ASbGncuOsFhcnO3LEtfjYdOVAxeJcAIoDiyE87CbfZaBh1PiwUl1g0Fyetmpj45XA+y
	PRdR6KvTf/0nkK9HfKXoec6GQ/XkcOvdr92T7gXfXXU0P+0HGan1CZaXuBJjTuAahO38Yf3AIzt
	iljJ58fFwn2DW9IeigLQ==
X-Google-Smtp-Source: AGHT+IFCtscwV8O7+W4yBswaX+xL5CU0m6pTn37NOQZAybr47eZb3GirbpP/+XKz7nDZsXAaZlthUftbLpDAo4xDjtQ=
X-Received: by 2002:a05:6820:3104:b0:606:5531:d903 with SMTP id
 006d021491bc7-607ee6d2206mr788932eaf.2.1746157995308; Thu, 01 May 2025
 20:53:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Per Larsen <perl@immunant.com>
Date: Thu, 1 May 2025 20:52:39 -0700
X-Gm-Features: ATxdqUH0icFH_SkqozKpifraM3UBR6tR1qCNPkxonjxJAJvE10BR_u9dZ27wUdQ
Message-ID: <CA+AY4XcaJa1_U3qXQUBj4wZJYc9hKmRX8FTNeDvV2auEnC_WrA@mail.gmail.com>
Subject: [PATCH 1/3] KVM: arm64: Restrict FF-A host version renegotiation
To: linux-kernel@vger.kernel.org
Cc: "qperret@google.com" <qperret@google.com>, "sebastianene@google.com" <sebastianene@google.com>, kernel-team@android.com, 
	"will@kernel.org" <will@kernel.org>, maz@kernel.org, 
	"sudeep.holla@arm.com" <sudeep.holla@arm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, yuzenghui@huawei.com, 
	Armelle Laine <armellel@google.com>, arve@android.org
Content-Type: text/plain; charset="UTF-8"

FF-A implementations with the same major version must interoperate with
earlier minor versions per DEN0077A 1.2 REL0 13.2.1 but FF-A version 1.1
broke the ABI on several structures and 1.2 relies on SMCCC 1.2 is not
backwards compatible with SMCCC 1.2 (see DEN0028 1.6 G BET0 Appendix F).

If we return the negotiated hypervisor version when the host requests a
lesser minor version, the host will rely on the FF-A interoperability
rules. Since the hypervisor does not currently have the necessary
compatibility paths (e.g. to handle breaking changes to the SMC calling
convention), return NOT_SUPPORTED.

Signed-off-by: Per Larsen <perlarsen@google.com>
Signed-off-by: Per Larsen <perl@immunant.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 3369dd0c4009..10e88207b78e 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -712,7 +712,24 @@ static void do_ffa_version(struct arm_smccc_res *res,

  hyp_spin_lock(&version_lock);
  if (has_version_negotiated) {
- res->a0 = hyp_ffa_version;
+ /*
+ * FF-A implementations with the same major version must
+ * interoperate with earlier minor versions per DEN0077A 1.2
+ * REL0 13.2.1 but FF-A version 1.1 broke the ABI on several
+ * structures and 1.2 relies on SMCCC 1.2 is not backwards
+ * compatible with SMCCC 1.2 (see DEN0028 1.6 G BET0 Appendix F).
+ *
+ * If we return the negotiated hypervisor version when the host
+ * requests a lesser minor version, the host will rely on the
+ * aforementioned FF-A interoperability rules. Since the
+ * hypervisor does not currently have the necessary compatibility
+ * paths (e.g. to paper over the above-mentioned calling
+ * convention changes), return NOT_SUPPORTED.
+ */
+ if (FFA_MINOR_VERSION(ffa_req_version) < FFA_MINOR_VERSION(hyp_ffa_version))
+ res->a0 = FFA_RET_NOT_SUPPORTED;
+ else
+ res->a0 = hyp_ffa_version;
  goto unlock;
  }

-- 
2.49.0.906.g1f30a19c02-goog
