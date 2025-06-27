Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955C7C2EF
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 00:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750984968; cv=none; b=T+rqzhK0VDef3jszEGcywu6lEgZLSjjQM3zx59ddfAUYKep2nW9iX+fYpog9cVQwde3usH6ORuXRwXyCBTTK8MykQjAV7LV+r9IPqg7uH//5xKFOIciRYMXPuTP3KvhFfR8RBfQmoLUuVfw26T6fXLnDVDBVmOYo+vTsl17QHUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750984968; c=relaxed/simple;
	bh=6xPPIM3NSdh1m0TrrrmsfHxmc3zIoWW2iunm4M56/3E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RXrISZN/KkNK787I3IuAUtugMpHUzQg2V/6kBT/BfoVXqcKQryzruB1g0rFBp+pZZXEJk1XTQU2HL1XLmy6iFZgERqEnz48bq8AvPlW2+4HN7OztRXyPIigMwlShk0aWLDh1TrPFsX2LA+BYXOEElHPTzyTb6vIx+bFyGyhAi3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JKShoHE6; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JKShoHE6"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-748efefedb5so2026267b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 17:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750984967; x=1751589767; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DqTnG1aDDjwMRPo2TP7Xao/+Fe8Uk4CL284uAHomG2o=;
        b=JKShoHE6NJkr2faS/vt848z/J/cclLZU377qT34A6HNxV33Vamk3UE1RILMgOM8gf9
         LVD6+PFvmT41L6gzMU+/J0csbsgi0aGZLacmxt6l42qPfgMUsO28fvB7xfM823Pr3KIn
         2H+WFnGZQ5IHOHOGi6Q9HHnw3TgeSlJcFoBU/GBt+murODLHa67zV7GyKpZvydu1X1AN
         BnZXZlLOGxyyuLnkKXSlG6pyjXomi8qk0Q082xVY39Ap20bPCqI2Wbsz6gbpk7cWyOwB
         yYXbeIra3Y71eCXLHMWvLe280/i2VhXBpLyHHp4YzUKtK5zWlofAE42gOC5uZFSfDsGl
         2x0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750984967; x=1751589767;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DqTnG1aDDjwMRPo2TP7Xao/+Fe8Uk4CL284uAHomG2o=;
        b=pfVaro5rQRnxgqqbA6cHFC0vIL1/F9tIERDGRDKLIi6oex5vm1SBmIVFugzdyZe5pn
         cHvhQf4kO+ecqrdJwWuxyfFB3Sy/IJ23m5yThz/xgA+QQvNbAdJbpvynGOEmoUY39PCb
         210m9aS5Xn0SITIFtVvynsXBCPM7AfF+xWa6h/agmfNzHFVfAcxy3PEjW7R63GGl9UhP
         b1VshOWYhHq0ThyuLYCYHpfTL/9w0vTd0kF6xYFsboLMbQiLQpDHPz3IH26ZBDn7Ioj/
         WSnqZzc43Z9ZcllVDlpYiQXNlX04h1vQu/RnZlHLc4mO27dhe7i40afaMgxLq6zdcRks
         /Qdg==
X-Gm-Message-State: AOJu0YzW0BEuK6zWxIkFFWtuXXL5XgGX2HbFT7XKohMXnOpvQaMhvKRc
	jcve3Ny7PUwRbrY7kFG3KuzwQge0un1b1GGtr5fELiPLBJAd0XoqUGXUbt/1kPq4lS4o5elfnfP
	66is5OPh7kgrCMI+z4cGUC7B18S9nRa8SsgnuEjeh4O3cQ6tP5S6035zyqhQ1pGy+syJ9wt+RZR
	J5yF80cqltzVNo6CemzFULCxMmycm0pAPLCjauEg==
X-Google-Smtp-Source: AGHT+IFesGng+KgIMxUtWrrJzsPBE/Sg/QLnVskl9GoZ67iH4ln8YIl1w39Y28RU5GrZTx948Vj6oKT28g==
X-Received: from pfbna2.prod.google.com ([2002:a05:6a00:3e02:b0:748:d81f:a79e])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:14c8:b0:746:298e:4ed0
 with SMTP id d2e1a72fcca58-74af6f57172mr1469555b3a.13.1750984966917; Thu, 26
 Jun 2025 17:42:46 -0700 (PDT)
Date: Fri, 27 Jun 2025 00:42:43 +0000
In-Reply-To: <CAEzuVAdu3bDXUGgi4U-XY4dRmBxKaCA_OjKrvK-2ftOWWwVEYA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CAEzuVAdu3bDXUGgi4U-XY4dRmBxKaCA_OjKrvK-2ftOWWwVEYA@mail.gmail.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250627004243.19514-1-morbo@google.com>
Subject: [PATCH v4] kconfig: check for a NULL pointer before access
From: Bill Wendling <morbo@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: masahiroy@kernel.org, linux-kbuild@vger.kernel.org, rdunlap@infradead.org, 
	Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"

The call to 'prop_get_symbol' may return NULL in some cases. The if-then
statement accesses the returned value without cheecking if it's
non-NULL. After inlining, the compiler may treat the conditional as
'undefined behavior', which the compiler may take the opportunity to do
whatever it wants with the UB path. This patch simply adds a check to
ensure that 'def_sym' is non-NULL to avoid this behavior.

Signed-off-by: Bill Wendling <morbo@google.com>
---
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
v4:
  - Fix issue with patch formatting.
  - Patch is sent from original email account.
v3:
  - Fix whitespace for real now.
  - Patch from another email account so that the whitespace is retained.
v2:
  - Fix whitespace
---
 scripts/kconfig/symbol.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index d57f8cbba291..9c5068225328 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -272,7 +272,7 @@ struct symbol *sym_choice_default(struct menu *choice)
 		if (prop->visible.tri == no)
 			continue;
 		def_sym = prop_get_symbol(prop);
-		if (def_sym->visible != no)
+		if (def_sym && def_sym->visible != no)
 			return def_sym;
 	}
 
-- 
2.50.0.727.gbf7dc18ff4-goog

