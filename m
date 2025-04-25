Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FFD2973D9
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 23:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745623435; cv=none; b=WasDS6nsWp3VmR6bcG3AvmxwkbAP/JHh43zol+8QrITHPRUwz7hnz2Y5DA9eRwwe4dIiywhugHz5kDjcQyjjol03MTJmn4HSXog5KJLg9OCul/6pHLMIlKDlcZjnzeO66ZAjE2KLYd8Kv/Ox7LEmOmmCaoPSqTx/PZg6iZe9XSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745623435; c=relaxed/simple;
	bh=wuuN7iOZFG4lR7kqhMA4uEBLa8MH72iBh6btbqH8OQk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QrMwZO2C5uFz38CfdE490H3piPTo34O3T4iGKhdLaOoZ6G/4iEpk4YFrQUmIInCU7Pj1ilpL6Tk23SaJDAsB0PJMKHZmooF+ANV2HI7GlTY5rRMiK4WxVZA+pDXt2h5yJ1pK1PVZ1MpgUm5pVRFeOj84I4YKiXK/hJab1MHoZOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XcLM/C/f; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XcLM/C/f"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3082946f829so4066794a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 16:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745623433; x=1746228233; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XJ5gLSrci4Aw+MzrITEjedWtV5V0wkfqlcC7WoEJtmE=;
        b=XcLM/C/fdnoQCZhRXS6rssTlypHqY2ttuNXAXlTTsvOBtIfBrKbxBi85T0O4rWlj18
         H+Y+vvE5oQHz45YpDsIn+e2zJzak5MIlzpFK7sABHWa3+ANCJ/7u30GOictkwoAi4/GR
         Czv4Et9NSJoPqEEoRLYrGfSDVbr15CkKCuFcD5J6vYZxbumpZYsv2mJPd9+30Vae4fv0
         VfRviCuyXJvCBwHxUP6krc2u9G8XGRY7V8yCN94oXGILZRVEPK7K+QlYsfxd+ncYfi9B
         9WiD0cbclDYtVvpF+CfREHGTvbysXvW8ouAVmcqNZd2p+Kwx388yAx53LI2ZbIs9tupD
         dJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745623433; x=1746228233;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XJ5gLSrci4Aw+MzrITEjedWtV5V0wkfqlcC7WoEJtmE=;
        b=encdD7VaSvm+wD4/vYynjLhR82yFrbUPW/H8dSUDhRojn+qjvNzjDdCLeIK/EFPd6Q
         rPgahAnDRNybOirKxJ29V/UUhXBFXMEByfNUZUtO8MWzFfWey9EiJvOY+pjUT7ZSsVBG
         T6DVtQZJuPfjVDGsRLD8rfPS5UEDoxs1M0NzCW+RM4843grnNOkiDQsG1FZs16uHmmAf
         TgbRPCd8ofRUXdyG5uYPWFKuw3i9g+ga+MxkdSw+CEI7waOHHvfhkFR4MGszw6dc8Xxz
         E2TrQZ2RcZXRfS2R22GItfigv/4DTUr7fw5Nmwt5rTrEabQr1XqAIbZd3pyc0Ctd9nt6
         AdMA==
X-Forwarded-Encrypted: i=1; AJvYcCXOXqD9GeoHA1I7Jq0LzK0CmFHw5DmWr0lgiVJ0nHNJ1KfjHsGnzwu5WLA9uOcqZNwtQ+Kixt736hPWtoU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7LnJOEz/N8EzniJRjZzQmGsQRZ0S4E5VOizt9e9j0IyIkgcqK
	HBbqwGuY6YietM3URNWnBY6QsQrCUQato1x+2zE82TOt9OPKDXdb8srAc1TW31D0E8q5tiDh5k+
	lvQ==
X-Google-Smtp-Source: AGHT+IFwFKINyR6hf5b8W3KsnyJYWEnQMZg540yanE+eHmwOxKRoKlfsLFGK/Ath0f1cxL8IM6fdIC/1VTo=
X-Received: from pjxx14.prod.google.com ([2002:a17:90b:58ce:b0:2f7:d453:e587])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2741:b0:2ee:c91a:acf7
 with SMTP id 98e67ed59e1d1-309f7da6d24mr6070582a91.4.1745623433539; Fri, 25
 Apr 2025 16:23:53 -0700 (PDT)
Date: Fri, 25 Apr 2025 16:23:20 -0700
In-Reply-To: <cover.1742477213.git.thomas.lendacky@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1742477213.git.thomas.lendacky@amd.com>
X-Mailer: git-send-email 2.49.0.850.g28803427d3-goog
Message-ID: <174562167852.1002481.1333824218465912701.b4-ty@google.com>
Subject: Re: [PATCH 0/5] Provide SEV-ES/SEV-SNP support for decrypting the VMSA
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Tom Lendacky <thomas.lendacky@amd.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="utf-8"

On Thu, 20 Mar 2025 08:26:48 -0500, Tom Lendacky wrote:
> This series adds support for decrypting an SEV-ES/SEV-SNP VMSA in
> dump_vmcb() when the guest policy allows debugging.
> 
> It also contains some updates to dump_vmcb() to dump additional guest
> register state, print the type of guest, print the vCPU id, and adds a
> mutex to prevent interleaving of the dump_vmcb() messages when multiple
> vCPU threads call dump_vmcb(). These last patches can be dropped if not
> desired.
> 
> [...]

Applied to kvm-x86 svm, with Tom's fixups.  Please double check I didn't botch
those, the last few days have been a never ending comedy of errors on my end.

Thanks!

[1/5] KVM: SVM: Decrypt SEV VMSA in dump_vmcb() if debugging is enabled
      https://github.com/kvm-x86/linux/commit/962e2b6152ef
[2/5] KVM: SVM: Dump guest register state in dump_vmcb()
      https://github.com/kvm-x86/linux/commit/22f5c2003a18
[3/5] KVM: SVM: Add the type of VM for which the VMCB/VMSA is being dumped
      https://github.com/kvm-x86/linux/commit/db2645096105
[4/5] KVM: SVM: Include the vCPU ID when dumping a VMCB
      https://github.com/kvm-x86/linux/commit/0e6b677de730
[5/5] KVM: SVM: Add a mutex to dump_vmcb() to prevent concurrent output
      https://github.com/kvm-x86/linux/commit/468c27ae0215

--
https://github.com/kvm-x86/linux/tree/next
