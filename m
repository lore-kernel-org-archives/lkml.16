Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB309218821
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 04:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750220681; cv=none; b=JiZZDHF1LSOu+XEuWPn8FDE56bhY9j4/3+dxq9WmnZWxALVq6CLo1k0Q2/KhuB5K14MlRWYpGVCzl35gt1ge/BbgW4nM4ckkeCvm39phCeg6Qnwu0ukl/aqufNRXI1/lnM53ndOJ2ICpqT19cnwMEByghaQcg8pX5drXQ14wYU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750220681; c=relaxed/simple;
	bh=M4cA5QCIbC4IC69I7rkdIXP2+hXIfCYUAcCljeAUiHs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YSRGMQdMpAxL+1q+coaA/cjMjl1kop+TZ5XaRGO/AneJC9NvE7RmUIfft+Z3r2yljFxbXXtqxFnwLzDB1iEcNx9Fjvgb9ZZW395FlZktOrYW6qWKAPHpP8GbZRIq6+hFcg/yBZIdeAwAak4L63zz82Nv8isnX/sHiMHCvgNGxU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l5OD17Ho; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l5OD17Ho"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2369261224bso17374965ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750220679; x=1750825479; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7EMNAB7VqggYskY7+oMW704PIZytljaHYvhJuoy4xGs=;
        b=l5OD17Horq3OM1avRrphBdfnroSlZGi9P2pMC+1CzyShVQ8woxzk40rE9G6tOo0Hcd
         G7voY+f9Iy8T2C4XHckV+Ipf6DhcHHerj0RBQjxxWKgjovOPKxMGCPdi4iYxgjnXdKsk
         9qXFh/Iy+aQ9uMOCAEPPH/ZRX2DwbiJ/r356hzeQlOx3b+ka6AbezRc2JX5HBI7p3J5Y
         XclB9pYg4ztShPeYW6prdILfWrCywDr05QdAVyzPcbO0JT9IHSK6JHEbYjQtZuFm/ivb
         VgkPP/SCtHO6/oGFEiSN2uOh5LUBieCtXMmeaEYG6RhGhZOxSncMf+zM9ypLj/fklQX+
         aN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750220679; x=1750825479;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7EMNAB7VqggYskY7+oMW704PIZytljaHYvhJuoy4xGs=;
        b=BDI2T2TM36eUm7q19aQobcfVmSBpOF0hWE8i2rwjwc2H9TRrz45OzyukBOYdr2zuuN
         bybm6XZzhD5ariSlNURz327UzW1BUiWaDhiOLpPebuQkiHlB6rFG6Eo9e37nwv+nPcbT
         C3uwLbXhKxhLugpK5Zn6/YEPYEJ/na84Lxt/UMvPol14iCH78WiEet0ECd1rIOt5yIHW
         4Wj6ibwTZuKrhlduvO/xwSzZTzLi5v5O/lVIi+aNJwZ/pJF4j05K+GYbindpJtk7wXMh
         EJLBEQzQIdC2n3B4/gFnsIyZZMbkgF3hxL7aSsoRqbYPX6LA2afVfxc/xf+lVS5OXKjn
         zCuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqoKt20bkqK2TATCTofQ3S4pUqapkQgQzKI9nJD5W8dZjutAqxm7R7c5GTzubez2RVUxng8mkqt8v4zX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTelXQf9yi//7vlQAnH19QMJ1e2S9WRdne40A2dNkAbEsYS7QY
	0N0mGpB3gBVs4DbhHit2jmvzU0dVYNvQvZ9Ha9MrlY0iAuIrPCaF6OhxVXgt4hLA7xjch9XrcxJ
	WZGoDfY1BdDYgYoioYISeTQ==
X-Google-Smtp-Source: AGHT+IHf6vnwz6tnrJF7nGJhTQOliXFukjknoI4nKYkvX84klDeaakiCUnur6sPI4XGwPrQLqZt03lOgVrYxLq6x
X-Received: from plbks6.prod.google.com ([2002:a17:903:846:b0:231:c831:9520])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d2c9:b0:224:23be:c569 with SMTP id d9443c01a7336-2366b32a5a5mr279237755ad.22.1750220679165;
 Tue, 17 Jun 2025 21:24:39 -0700 (PDT)
Date: Wed, 18 Jun 2025 04:24:17 +0000
In-Reply-To: <20250618042424.330664-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com>
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
Message-ID: <20250618042424.330664-9-jthoughton@google.com>
Subject: [PATCH v3 08/15] KVM: selftests: Fix vm_mem_region_set_flags docstring
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

`flags` is what region->region.flags gets set to.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index a055343a7bf75..ca1aa1699f8aa 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1200,7 +1200,7 @@ memslot2region(struct kvm_vm *vm, uint32_t memslot)
  *
  * Input Args:
  *   vm - Virtual Machine
- *   flags - Starting guest physical address
+ *   flags - Flags for the memslot
  *
  * Output Args: None
  *
-- 
2.50.0.rc2.692.g299adb8693-goog

