Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC542EAD02
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794121; cv=none; b=kJwjzCg7SApkGyMg3QOyARk1lF7gpGdJAYVjVkgTjj4OnePu1lukQGClRPZHI7HARwmQVODxEAmhlU1XR1p7rgcJaE+4jEk5sS0Qv7Ucnp7i2MuytAb8IJF0NPZV5V5q4IT2Th0QeMHkoF/TbjJmbo4/0vhLVcsA7lKEzms4U9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794121; c=relaxed/simple;
	bh=c/7QgBTrR2qs6GVSzENovKFJo2GjCJmS+ATCJzF80rc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZRFE6gV8GwxHz7qFnKF4t7fijp5UwrxT+SJi9iI/NjA329bDJAr8x4aJRFyuX3qhik9doWnhHIO1gnqe4/+eoNy2RHAw4amQreLgzFaR+S3vhTFhLoLQlWIYVgafbi7FcU4OGrOc3A5D7JWJFKhEbCaLoJaC137mCOci7pubmcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2Bwdt0xZ; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2Bwdt0xZ"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-23507382e64so54125715ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750794119; x=1751398919; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=e64Qv/Pt5ojv2npJzdDOICaLHvJLt0TAvdvtcs2VlQE=;
        b=2Bwdt0xZoUmk7EtuyLGtFBGwNp4ccXalG49eIC6gX6mrMfa3eMH6RJGhEPl/D/wuQL
         WugBDFur7pKvWcBram7qHgwqArtUuyfTy4pNmtclDNGHomyLiApHvBA6Yt4KD3J4GU7W
         Nh+/Gjjd3GwBz5ovLg1WvUpaRnoO5agTWxoUH+AzRzHlVwLtsrDGjfvvehcfga5VBd5L
         JC1NfqXa7fCyHg0/9cysmBlBB7QPoH5YKd8t3dgFt49DORnx4oST2PwUe9/GB/ojHnYo
         3aASpqsDRVcTfg3ZJ2RS06dv0zCLZAI+DOFck+lntd0azdK7HUYz7aB4a97SZkybG/IJ
         d6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794119; x=1751398919;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e64Qv/Pt5ojv2npJzdDOICaLHvJLt0TAvdvtcs2VlQE=;
        b=C/S9NcKh5WwCsrR+CfmMpHBLeoolXygMr9dZO7JvR9D6VixxxRvzk8wqZ1/ej4gcPd
         PjXsa2yIUkW4mzzgqruSwJ+QWzcMTEDWfk3PEJSXFK6D1El/mXT8eOpmMA+FY3IpUzRY
         aCCnSVzrpYryuO7B5ytwZ9eb/B8TWc15JLUEqwoSe9tBv56T+xzpxCoa3B0J9geboPX0
         jQu8fYHHEwNUEMxkB2aww+8VSBLhEYIC9F9nvLLeCgMLvizEOnSXy0KaZnN0g9KLdSEH
         vhmd0KotT9LqnC6LimiiT4LmhtVTvsmpXsB/WpYpT5b7bA81hnukyrKkIU2vBSRF49Ql
         FRtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ3KEpvT/vRCYZHTDDFd2T6XpMB4/ePwOTViQL9jk+J9FAnj3NNMBi5tmDMDEPwRcVkTPkjAsYaTQayGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqQYM54Gm8JKtjjoHNmX3SfYXW3/iWFTLA5tx0fME/FV0zVPLy
	MPfrsBOmDAJ9NhNb98ufgWWUDy74/cdvsLmkoSM36RHOpPiVfMif4vRxJGcFKoVJNuBSJCOOCER
	1doTOkg==
X-Google-Smtp-Source: AGHT+IEVTUFFWM+7ReoOwe5q9bU7aGMuWtAYW9EM8tyJI0p++Z5ywj3KuSfop6I7e3jDpuwYECcsURxtmbU=
X-Received: from plkk15.prod.google.com ([2002:a17:902:c40f:b0:234:9673:1d13])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ef52:b0:236:6e4f:d439
 with SMTP id d9443c01a7336-23823ff236emr7903665ad.23.1750794119123; Tue, 24
 Jun 2025 12:41:59 -0700 (PDT)
Date: Tue, 24 Jun 2025 12:38:36 -0700
In-Reply-To: <20250602234851.54573-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250602234851.54573-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <175079322774.520923.14554474229751214016.b4-ty@google.com>
Subject: Re: [PATCH] KVM: x86/mmu: Exempt nested EPT page tables from !USER,
 CR0.WP=0 logic
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jon Kohler <jon@nutanix.com>, Sergey Dyasli <sergey.dyasli@nutanix.com>
Content-Type: text/plain; charset="utf-8"

On Mon, 02 Jun 2025 16:48:51 -0700, Sean Christopherson wrote:
> Exempt nested EPT shadow pages tables from the CR0.WP=0 handling of
> supervisor writes, as EPT doesn't have a U/S bit and isn't affected by
> CR0.WP (or CR4.SMEP in the exception to the exception).
> 
> Opportunistically refresh the comment to explain what KVM is doing, as
> the only record of why KVM shoves in WRITE and drops USER is buried in
> years-old changelogs.
> 
> [...]

Applied to kvm-x86 mmu, thanks!

[1/1] KVM: x86/mmu: Exempt nested EPT page tables from !USER, CR0.WP=0 logic
      https://github.com/kvm-x86/linux/commit/ffced8922050

--
https://github.com/kvm-x86/kvm-unit-tests/tree/next
