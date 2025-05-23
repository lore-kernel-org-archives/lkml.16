Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3926A296FA0
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 16:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748017508; cv=none; b=s7oe+Nz9jHGHE4KGZTNl41Y04Gxpuci5FPN+soBq5ALQrM/AsivU6nKKEPsbQidZtGWIZjNhmci3MXilg4WVcSwDyxDgX5P2E7Q0R4Ved76H1WZTynn+CLSLcwpX+8TkPrkjzvDZozAHpRYxfyCHDQE/Lgo6lFJFgZZnkBPTgqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748017508; c=relaxed/simple;
	bh=JWHVlr/Ls9C10fiO6U79Jyr0qMlaTUUpOON0NgjUO7k=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=SvYlCjvvvKo9K+fKYf89nn5cnGHGdwWRoh5XcPIQNYvcVCmDzt2jCa8bVAq9ASsUsZu3uby8QRHPpR7P4se5xgTn75WKeDIbzZR1ImYKwdelAnJWs1uWYCVLOO1BKBEobfTj4ZdNDOWwuAPAWlrafmkE+IiCmn+8kjrVm2DnXjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dvZp7A3U; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dvZp7A3U"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-742c03c0272so125199b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 09:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748017506; x=1748622306; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcrsTyXD2AmllXYsewYY5PNh38B0agH4kXs5sFaesvE=;
        b=dvZp7A3UrEBLkIG+W3gihx/RzCHm5IlP+qX9ybrjMvlDsf3l5KTCXmNaSZtmJejNI+
         PwRSJG//u+JGvQ7pmRIv8ddaq/jiVJjcVJtOCwsS+XWa/Y6ffESgqhdhMIEnERaqN80O
         CcZePgnasSZjijup9NzmXv/4M2O9+vV/HOm25OjkQlkAVhsXCDE22aGV2+DLr1aRCe7i
         4EfI2ZfqiZYhtuyFmkA8oQmg5bsU/U4y1k2YGCE9e3A5uvrBKo3xGim2YPegFvMB0Kn9
         QFxGAwdpdLl2O1SjJr6UqFtQiVlFZXXQiEMmWbu9uYfLC8smxOrNE2Zoe91aYd/G/txE
         zULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748017506; x=1748622306;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EcrsTyXD2AmllXYsewYY5PNh38B0agH4kXs5sFaesvE=;
        b=aUnkXfKMi+vyGKnqJyvcUiQ6q9fu3Q4Pfb5wMKolmIvbKsNlAKZ6kw86oC6IWk7OGX
         /j/94y48IidCtWJ2K1uKFXpDZjpQ8IXlrMo7D+dM6WgtBAAhpzIwEUz6mD6kZ9BQcffk
         Z5sYNc+Oywd/WER2wGFlJy5VOF2NrckgtBNFmRDxWXFhyB1qN8Ye2ODaSgGRFcHFJHgl
         SpZLFoU750E5EYe++Oll4P6bD0S+OGYvZ7hpBEY8G/tGlSAQjidkXWXKzvgV5PDRRObp
         4UFjr/Fc20VD70rC9fOHK3ZsPqL4mB+qAgfmStAz0RPYM6qmnDmBCBFig++F9Nyi6MVJ
         48cg==
X-Forwarded-Encrypted: i=1; AJvYcCWF+QCJxbBV+UixWWRRWCisyxb9t/8vZ6HwGHoDOPrxuBFfyRn6ZDqMwOV6vlfUGnLOA/Q3EzNEdJb6Xn4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtW8LJRqZ/XnMIa8bu0QLjZElV9PdtmVj+twgAff9RyFZHTaax
	GLb2ok+vqBdp7Ice7q1BdR2uCEODnt/WQRNqG/qiWUVAx3+cCGvBaI/nSRP2iiBp4qIiWMusGug
	lTs/iXg==
X-Google-Smtp-Source: AGHT+IHk49mAVdXvYnsz2eilwbCzpnHcQBFR4G/t2LPTQT8ljntMBxaca5pu76Vd5OUhYIPpw2hjarZpA08=
X-Received: from pfbho1.prod.google.com ([2002:a05:6a00:8801:b0:741:2a97:6ae2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:728e:b0:1f5:6e71:e55
 with SMTP id adf61e73a8af0-21621876d2dmr47062666637.6.1748017506395; Fri, 23
 May 2025 09:25:06 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 23 May 2025 09:24:57 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250523162504.3281680-1-seanjc@google.com>
Subject: [GIT PULL] KVM: x86: Changes for 6.16
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"

The calm before the storm...  Though I suppose you already weathered a major
TDX storm :-)
