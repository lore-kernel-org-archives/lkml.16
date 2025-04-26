Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0471991CF
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 00:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745625613; cv=none; b=lnlVrHQJldSxjB0/AR+r/wOtpSAQs8K8NZAnVJ3MAc76ADumLGaHwWAY8vMNAtXv0jY88NRtZL18LdFUazj4mqog0ePItOq+w209T6FDFBXs6XL5kXrt09gkRrkPthx00UGW9pN4uyvX9b2Kcp6uVv6If6EvzP7S0m4thVE+9lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745625613; c=relaxed/simple;
	bh=H4uJxKCF8X2YSXybFoa0pezBDVH59awZSGnN4OANeXA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EqvlIJMIEf2B3+ZGE8wjnj9HNjY4QC/cxd+gAJ/b2W4LoJwxw1Gg7I70S7+83U98UKY7JR6KKRVMKtMaK68OOCUvarQI2nASH7jJZy1J2EXlIRDawI1eSmJxk+V93Xas6bpslsAJWlPBb8oBa2xee52P0rcpNHmYmJZaRg0/4X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tXSGxQ5f; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tXSGxQ5f"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3087a703066so2769959a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745625611; x=1746230411; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4GFetroiVqwabK1sZJi7Gssm6Y2r4VSG5IcyflglpQ4=;
        b=tXSGxQ5f0DpFbNe5BgRC7VYcidi1J+gQTMQNc55S/R8Crf2pZ9cuRmqAJjDQ8uJM8y
         cclJXDTIwpMJUVUq15Fxx2fJLoSUSbMfAUw8fU8Jh0jJQzXhvqJ2w4L200PZNpc8KMir
         TWImCmZXe5Rkk8iALhoDl6pw4COMJkKuIdT7S4cdHtoHZogtDDQQ75jlCbLK7M2Frlb8
         4lpuDJIuxL7kUhoH7tLP5So295K6m9c6yeuNRtFlTA1Gnqp5SzWSbx0dbvYIRGa7SNLv
         pcJPpjy1VFcW1itBBYCkjwLWUzC8K71q6d8Cgz/ME1wg0IwFUd9RLES09+nhmZ1c9OUK
         2OMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745625611; x=1746230411;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4GFetroiVqwabK1sZJi7Gssm6Y2r4VSG5IcyflglpQ4=;
        b=rtTEGYbuR+Nz70wzT3UCEZglm7uxy3NMJW1/BonV10DxwME/m67kS7sv1zwbtW9CTX
         NneFtFqos6O3kNzS627d6mEepk3Da63DB4q3W6kPI9JUt/5As20ScKLPLStCQVfOwqr+
         xj3kz7eM0nV5MjsWLDe7RDkUdjTO/9gy+1mg7Rc7PQj+yRSWB5ABRY0NFsDsqj7z+di8
         xxhGjxcJsQr4f+f8UtbBNxdkGaoUYd+pL4MlsroXZiJ2JiRKCMHbT998eiViK6rba6MJ
         4nfUp3DsoYBJU16Vduy3POBlPPKAIKDlWC9Qqna2hfdBkLYYgp6tNkqOyD3a2S8DUvWL
         tNDA==
X-Forwarded-Encrypted: i=1; AJvYcCVcyv3WGViAMeZY18Q5eyBbUxXECeK1DhuRdri/hqkMt56bkNE2tlpNr18jTv+oQoQQlEH/H9y+6lTAAyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0cDKrPZBchkqWjC08xf50nK4ncpeASFzJK602KosEEOnPCPtu
	22OJxVPsbuzSH2bVuQzveUdJMtVL6FfRN5bdCY7kwfXaZFT94HmmuFxqrTh6Yp2i+EBRMeN8BQh
	0wg==
X-Google-Smtp-Source: AGHT+IFkMqUvzxmIb5DQHMQAnE51nLU+gQzqYa24MNOiSl84Fum6ZnRW7j2yLz/4lpczDu9ZcESx8vr5f2E=
X-Received: from pjgg7.prod.google.com ([2002:a17:90b:57c7:b0:2fc:13d6:b4cb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c8b:b0:2f9:9ddd:689b
 with SMTP id 98e67ed59e1d1-30a01398779mr1331415a91.22.1745625611465; Fri, 25
 Apr 2025 17:00:11 -0700 (PDT)
Date: Fri, 25 Apr 2025 17:00:09 -0700
In-Reply-To: <ff8408bb-b110-4930-b914-98afe605c112@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1745279916.git.ashish.kalra@amd.com> <b64d61cc81611addb88ca410c9374e10fe5c293a.1745279916.git.ashish.kalra@amd.com>
 <aAlYV-4q6ndhJAVe@google.com> <ff8408bb-b110-4930-b914-98afe605c112@amd.com>
Message-ID: <aAwiCTNoQoV2nDfP@google.com>
Subject: Re: [PATCH v3 4/4] KVM: SVM: Add SEV-SNP CipherTextHiding support
From: Sean Christopherson <seanjc@google.com>
To: Ashish Kalra <ashish.kalra@amd.com>
Cc: pbonzini@redhat.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, herbert@gondor.apana.org.au, 
	x86@kernel.org, john.allen@amd.com, davem@davemloft.net, 
	thomas.lendacky@amd.com, michael.roth@amd.com, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Apr 25, 2025, Ashish Kalra wrote:
> On 4/23/2025 4:15 PM, Sean Christopherson wrote:
> 
> > 
> > 	if (boot_cpu_has(X86_FEATURE_SEV_ES)) {
> > 		if (snp_max_snp_asid >= (min_sev_asid - 1))
> > 			sev_es_supported = false;
> 
> SEV-ES is disabled if SNP is using all ASIDs upto min_sev_asid - 1.
> 
> > 		pr_info("SEV-ES %s (ASIDs %u - %u)\n",
> > 			str_enabled_disabled(sev_es_supported),
> > 			min_sev_asid > 1 ? snp_max_snp_asid ? snp_max_snp_asid + 1 : 1 :
> > 							      0, min_sev_asid - 1);
> > 	}
> > 
> > A non-zero snp_max_snp_asid shouldn't break SEV-ES if CipherTextHiding isn't supported.
> 
> I don't see above where SEV-ES is broken if snp_max_snp_asid is non-zero and
> CTH is enabled ?

Please read what I wrote.  I did not say it's broken if CTH is enabled.  I said
it's broken if CTH isn't supported, i.e. is disabled.

snp_max_snp_asid isn't sanitized if CTH is unsupported or disabled by userspace,
and so KVM will compute the wrong min_sev_asid if snp_max_snp_asid is non-zero,
even though snp_max_snp_asid has no bearing on reality.

> >> +	 */
> >> +	if (snp_cipher_text_hiding && sev->es_active) {
> >> +		if (vm_type == KVM_X86_SNP_VM)
> >> +			max_asid = snp_max_snp_asid;
> >> +		else
> >> +			min_asid = snp_max_snp_asid + 1;
> >> +	}
> > 
> > Irrespective of the module params, I would much prefer to have a max_snp_asid
> > param that is kept up-to-date regardless of whether or not CipherTextHiding is
> > enabled. 
> 
> param ?

Sorry, s/param/variable.  Doesn't need to be user visible.
