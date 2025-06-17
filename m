Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FDC20DD72
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750193686; cv=none; b=ezhtYsQSNbGoYnkyUn/LHNi66+5m2LytGKn3kdYJMSHA2jiL3jvSzEi7seeBuAd6MIrVtyiZ9+wEDUMHCYbaBaNKydKy1PVzzdGtbnYpR3licYVQzpGdKRrMhleOuJ3Nx3IWPNn1luVVLdwAp8NK/6UoXNssuCpojLMcat+CoqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750193686; c=relaxed/simple;
	bh=PGJeLmL5BC+Rw9tIs3WLl6u3yQElE12oXIBDOcON/04=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=UbY69DeEBMlAjPsRMpoNJwzdednAIvAp6D+FpFntij7NylQouEknFDWJZ1WCsP4u3o9WAeFjuQFPTgh14pQ5SELx+VnypPOuZLsIpTvrwodEWlroL7vjq4v4pPUW7Zi2xmpqxSPazqMrBqiDKVAZesvchoksHptRlEPAMQAVSiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xmnDUaVu; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xmnDUaVu"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b2c36d3f884so4043589a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750193684; x=1750798484; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HWKecspuo+ev9wne99H5wLjQXDHgVDwuCJhq27N1fCg=;
        b=xmnDUaVuuQUcuxy0B+i7tj6N6mnPjsL5CIyA+8RbTAc+VS6y2tBOlaSHCf5mVCRoe3
         hO4RQNOob9KivvsVAQ6fPWurj7i66/ZnxoEhOU+w51Yov99L6T8yrElPD6s61UHPlxzj
         o/r+FthNdj4j0DViLh/wNH+TUDLGspTqlqnrIZVhn64/yKdTStgdyFJLJKypFOTCkn6Q
         G1loSlYcNJD4+Su0PUMYgWzgTbHF0rD3aQdOQY+n8IeIKyja0CGPo9u9po6Gq1OQ3ZBN
         5pRzsy59opRsv5R3048ztrIu6DPa9Dad6GLa1rfrjZwr4Mrg1/ngUKDDNhi80uEbaQ2m
         RWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750193684; x=1750798484;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HWKecspuo+ev9wne99H5wLjQXDHgVDwuCJhq27N1fCg=;
        b=XAOsMSlgqNuXTLKr1wE4xMV0xIiWGH/VUuNhWxa3N/DmMEVv1sVGfiSOmHJYV8f+Pn
         qdKap4mqjHTGrjKmfLDlDfbYQx1hattPXMYyVR+KQ3pCtYEW6AoU35+0TGjKZdgszwFJ
         O7N4UU3Nfqj9A5kWoTdsL/gg8GrRfvfKEAbhB4hYpmsihUUyjrBewnwb6zKtnxsN1V2s
         80MmyTAuacQw1AW/YdbTuyKM44UqaxROLh2WoNBHLkPMdA2WJmfdSbX9WEV7dsvqocRW
         z50x5vxiqpWSnP+bKn23IPFpGpR9OlU2ssZN7ytKIHLIAI5N0ybXy2762OYtFhbta1K+
         BaIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUMv10QghycGiib8nnfxfiUOWYXUSUoLYN3mNxtnMkr8SQO96W7ocp9HXEUKrLoXnlF3dgyULM/Uuns+E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yycu8WiAyi5qcxkhiV9CrFzYBG24FP7DL9AAQSqFQwFKkoHOyGD
	06gAFqckDJUT6putVqy7Tp9aqhXnSl9KuXTT8aW4U7TDjdhIUJPQSuc2TVGCCJl5JwqJvBUT72h
	LFthdFNa74g==
X-Google-Smtp-Source: AGHT+IFb0EMD8vA4bwuyPz+bGCf8RNhlX8C4tNzsgg+unC3a6Y10WZDs3ITYohLj7Z5W5d4VV8ICM8xHrJ9m
X-Received: from pfxa17.prod.google.com ([2002:a05:6a00:1d11:b0:73e:665:360])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6a0b:b0:215:df90:b298
 with SMTP id adf61e73a8af0-21fbd559f50mr21504036637.26.1750193684494; Tue, 17
 Jun 2025 13:54:44 -0700 (PDT)
Date: Tue, 17 Jun 2025 13:53:17 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc2.701.gf1e915cc24-goog
Message-ID: <20250617205320.1580946-1-irogers@google.com>
Subject: [PATCH v2 0/3] Switch get/put unaligned to use memcpy
From: Ian Rogers <irogers@google.com>
To: Eric Biggers <ebiggers@google.com>, Yuzhuo Jing <yuzhuo@google.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Cc: Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

The existing type punning approach with packed structs requires
 -fno-strict-aliasing to be passed to the compiler for
correctness. This is true in the kernel tree but not in the tools
directory resulting in this suggested patch from Eric Biggers
 <ebiggers@google.com>:
https://lore.kernel.org/lkml/20250614044133.660848-2-ebiggers@kernel.org/

Requiring -fno-strict-aliasing seems unfortunate and so this patch
makes the unaligned code work via memcpy for type punning rather than
the packed attribute.

v2: switch memcpy to __builtin_memcpy to avoid potential/disallowed
    memcpy calls in vdso caused by -fno-builtin. Reported by
    Christophe Leroy <christophe.leroy@csgroup.eu>:
    https://lore.kernel.org/lkml/c57de5bf-d55c-48c5-9dfa-e2fb844dafe9@csgroup.eu/

Ian Rogers (3):
  vdso: Switch get/put unaligned from packed struct to memcpy
  tools headers: Update the linux/unaligned.h copy with the kernel
    sources
  tools headers: Remove unneeded ignoring of warnings in unaligned.h

 include/vdso/unaligned.h        | 48 ++++++++++++++++++++++++++++-----
 tools/include/linux/unaligned.h |  4 ---
 tools/include/vdso/unaligned.h  | 48 ++++++++++++++++++++++++++++-----
 3 files changed, 84 insertions(+), 16 deletions(-)

-- 
2.50.0.rc2.701.gf1e915cc24-goog

