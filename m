Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2856723716E
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 22:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738880892; cv=none; b=fQV9chcAbfBLTaTzWPHC1JZbkjX1AsK5JWahNrRpDqZPjV7bBFqriKk05FQYZERnMqLNevywtdNNrk2294GIRP0yipHNYWexLUrsO7cB37ZQ6KLtsAFQa6DntNMcSUoWBu3k95uD3CXA71nYchMmXGxp9f6CiXqy2jmOjqrzHp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738880892; c=relaxed/simple;
	bh=mFDuaPuJLce7bYnIwmrQvKwK++9BA+sKR/Udf9Ak1nQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ULlatDM1cat1zhgM2m0DDnNF+VOSreYgKJD4CDWml/aFqlFCkr/U2YjvVE3fVR7U7jtghPvE9tixNP833F6uOmlBYmWnyqm7NXfZrPWOShnizd3Vm0TaZsJIiU9VMhZpDFdrSY/PukxsUACe8HOyNPiKREBDdreIqAmbxguEmGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vannapurve.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e77VBA9P; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vannapurve.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e77VBA9P"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2f816a85facso3135850a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 14:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738880890; x=1739485690; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hrC/Lile8Fxa+G6CWF6jG45AjIfizxhf/A144AZzUwg=;
        b=e77VBA9PrXTubOc9v+JV4kwwrR26l9lIuv41V99XXSqb2UDHgRrsBsGOmtLTaIaRDL
         3fxZZ44LFkIeXzfcqCMLYZVcaeQZumJYsN21pSRY9+2XUEkIrp3mxGXr7adt6IN0GQQn
         1OckiEoooJW0ZGpxnv/76nMWqyKhqag2Ox5XN9fBOH8Vo2DZFLHHEhL4bZ09Si2RS7M7
         3190pUb4fnrXV156mI7h048WHkbkVoHGQTrzgxh4uHZZKRLiGHjjzxHIO3TlqnzckET3
         B1cnTo2WmtDZGNKewhC05Y6Qcp2s5JVjxF05pOWr+Loh+S6+XJA36tEq7JIVe7wk0AfC
         DUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738880890; x=1739485690;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hrC/Lile8Fxa+G6CWF6jG45AjIfizxhf/A144AZzUwg=;
        b=I11kgMP14Vo3kigLdleN8+vpX6I+bbWuaN5SBEwKH4epX/O2LK5wxn+/2rEb3gPrxJ
         Pvaiu39Se+t8uu29aE6qBIgiRkDMQUfwSsngONf6uZXg6fEXgP1+rdhjzHMetFQpmrDG
         EjAEzbJ0ayB/dUuA7DssCZXDqJ4CrqDlHFoJtj5FqY3WSDVv3cM99g8Mgmgyp9iubPKS
         38D4s1EP/IShos8rIl3EV47DuxeDQeT0ozotGsRKGgIrOQHYfyYsbRjnqXX6vlMJFhCG
         1rjTm5zgv00H0UvZsuBjFh4VHUFjbegSH3H29u8kfJzDZhoqV4RSHrfB1eJ5u5ESSkmC
         Qy+g==
X-Forwarded-Encrypted: i=1; AJvYcCXZXtay6RlhhjdIKgu9I7onoC9KTPla58EYkInGgcwlEqPpeKZf8L/lw/XYq4Z6gesiiCXKa2zheyFJnZw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzhBFm514pOnLqBA48tgN6ydUcHrORS0/ZQlia86mGIDF51eHa
	Gb3dcasIbx/jeepqkauPAw4Kqg0ZIzNDrl0V3wigUmVAaBQVQ058t/H5VG3jDQPhjwYvvW/O4tD
	6uhYcisv/Mleiyl0DoA==
X-Google-Smtp-Source: AGHT+IGAKNeXYzNmdddEMKmVQ4M1M7lWBtl1f6JoubL4oW+KUHWBxuB9fL1WH1YtGVToXf3HdRqlM7RhyFIZJc8q
X-Received: from pjtd13.prod.google.com ([2002:a17:90b:4d:b0:2fa:26f0:c21b])
 (user=vannapurve job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2e47:b0:2fa:20f4:d277 with SMTP id 98e67ed59e1d1-2fa243e39dbmr1215046a91.24.1738880890297;
 Thu, 06 Feb 2025 14:28:10 -0800 (PST)
Date: Thu,  6 Feb 2025 22:27:13 +0000
In-Reply-To: <20250206222714.1079059-1-vannapurve@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250206222714.1079059-1-vannapurve@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206222714.1079059-2-vannapurve@google.com>
Subject: [PATCH V3 2/2] x86/tdx: Emit warning if IRQs are enabled during HLT
 #VE handling
From: Vishal Annapurve <vannapurve@google.com>
To: x86@kernel.org, linux-kernel@vger.kernel.org
Cc: pbonzini@redhat.com, seanjc@google.com, erdemaktas@google.com, 
	ackerleytng@google.com, jxgao@google.com, sagis@google.com, oupton@google.com, 
	pgonda@google.com, kirill@shutemov.name, dave.hansen@linux.intel.com, 
	linux-coco@lists.linux.dev, chao.p.peng@linux.intel.com, 
	isaku.yamahata@gmail.com, Vishal Annapurve <vannapurve@google.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Direct HLT instruction execution causes #VEs for TDX VMs which is routed
to hypervisor via TDCALL. safe_halt() routines execute HLT in STI-shadow
so IRQs need to remain disabled until the TDCALL to ensure that pending
IRQs are correctly treated as wake events.

Emit warning and fail emulation if IRQs are enabled during HLT #VE handling
to avoid running into scenarios where IRQ wake events are lost resulting in
indefinite HLT execution times.

Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>@linux.intel.com>
Signed-off-by: Vishal Annapurve <vannapurve@google.com>
---
 arch/x86/coco/tdx/tdx.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 5e68758666a4..ed6738ea225c 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -393,6 +393,11 @@ static int handle_halt(struct ve_info *ve)
 {
 	const bool irq_disabled = irqs_disabled();
 
+	if (!irq_disabled) {
+		WARN_ONCE(1, "HLT instruction emulation unsafe with irqs enabled\n");
+		return -EIO;
+	}
+
 	if (__halt(irq_disabled))
 		return -EIO;
 
-- 
2.48.1.502.g6dc24dfdaf-goog

