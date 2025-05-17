Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A315B4C97
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 00:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747442260; cv=none; b=j4W1rWHYSehkg5ZX8Ir4O8ucLuYylvq9viEA9SY599zz1qDlX0yMclNt0o+ZXtGJmdg9zYdR+AI15AZEiZmXk5GR0s/97JQ4TL88MjBPK3HrhkBDjRRwCEtYR2+DuA/LpUw8X1BFHsC2waEfLkd/xz6CjMA8s5hp+3AZ0lyalpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747442260; c=relaxed/simple;
	bh=5QWqpt8UQT+7sGjaLvlYOPslmVhHfwIca9fRx8275Mc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QbmpQfL1qShVk2RtohRHauRzG5AhFeSJhi3DzI+t+RoxXI5rMZhhRUBnMRPQh3CZoRveVvGgU11y5mHJAFoZGX48WHC5ZtApRPIYYDlafBMMNrzpvDgVKVAjQBL+4LfnsVgpESzGuL3Uu+jWZ3/1+E10uMPCr8/+T7cP467+61E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Sbnuri5U; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Sbnuri5U"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-741b3e37a1eso2903460b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 17:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747442258; x=1748047058; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GGBS69GTPI2RAKvmYg8FGeQcpbc48jJia8g8c3mkVTE=;
        b=Sbnuri5UKoUl7Uea/um9RR+qApovQ27lnhs9DJTg1zhN4lmhj+O+bM0ehagDpMXSfC
         w0yVGfhdlBFqoX5lnci32Z34FAh9RvlwsPFGfv/6EKOJvxn6U0f54cygkxQJQo0TQ4rw
         d0dkAFwigg3FFu2xKUqwir0yK2HcjnMGkUrkE6v9gSjYp9kZsJsE3J1GU21BuA6xVmbN
         fEfe+khEZ5mtPnTn48R8+qB4EWEzNOytlxm1WFzb9ixf6/PCB2Otzk5FBk8O4wX2Ij0f
         HTSJn6q6llQshMqJloAypR5AXf5Dhpxbcj4NXNvKAuM6ItSt7Oe2mhr33DR8Cq21SvCE
         ECNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747442258; x=1748047058;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGBS69GTPI2RAKvmYg8FGeQcpbc48jJia8g8c3mkVTE=;
        b=wd/k+C6KMGf1al25S2bSvnS0qhXXoheewCaT0VAFAhsp5RHpV4XZLr/caiH4LRVgde
         MQgU11TngRG81JAEJbzl2UFCuLi3WbjzoDoFyWt5bxXvwxZIXuVlvHG50YE6UPuj6N+r
         pRcleLcsgoA+GMQnAPgqkUfBOg+hY1RkMAWzMs3bjMr2+quzMiCERQaxQL/Yp6zNeeZP
         ZVaw9N4lGN5+FIsJiwLGH/v6Km1naVE95762rb2DNRiB/n42g/d5EISRaOgoXqpgNd1W
         AIJYeIQkx7sbtgYuud0eheDvBeWAbA48IU5a1rJM/2uYfp4E975RSJRy7DRlvayCS8HO
         TRLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPB7bZzFtQr+oLWig5L9HGmL9wNceRg0YMP20UTsGxFhkmPKLo6i1HBAwdV30Rvg4FfOwzB/tFLniPQgg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7h3OjJbLXSz2fkJ/wNojQwaSdgHtlRDLWucs1++1UE8xeEQ0k
	4OFv4OMPUe1mZJOmFJ+lEeVs19rc0GfLSDwZkf14QLr0dbzGbIwcjEov96GHPndFQQc/WPMypcY
	uMBwVPuli66V+u/XeNZJuTfqXgKnG1ezt9Y2+nfhY
X-Gm-Gg: ASbGncvZQK6NXLkGGc1UJD3FRvsrejMVubgzhgwR4dXhxAVYUsCBE0xgrwdDDw2CQya
	pn1qNlyCVt2I5q8qF1aaclLQmRJPbSvWZtOO2j+UmbNhWVBQNfmUfAVaQrg8M2BgZ53VU3uDOBi
	ajuUSOXAxE3Ar9ucMGy0NUy/dIE82AC6LCXA==
X-Google-Smtp-Source: AGHT+IEw6yv27A7ypvZUsX54CsMfyWQh56U8kZL5hyzUNYgeL0+XsFUYBvlDzHmNtXxZGuv43oWXWL4xM7ruRZ33L1A=
X-Received: by 2002:a05:6a21:9188:b0:1f5:8754:324d with SMTP id
 adf61e73a8af0-21621875a26mr7295097637.9.1747442257679; Fri, 16 May 2025
 17:37:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515220400.1096945-1-dionnaglaze@google.com>
 <20250515220400.1096945-2-dionnaglaze@google.com> <aCZtdN0LhkRqm1Vn@google.com>
In-Reply-To: <aCZtdN0LhkRqm1Vn@google.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Fri, 16 May 2025 17:37:24 -0700
X-Gm-Features: AX0GCFvqpnmmIdGRZ0Krupreoa4zV8101M6bKqT1JZaaQ4QUjjDWnxQ2I5c7uTA
Message-ID: <CAAH4kHai8JStj+=HUiPVxbH9P79GorviG2GykEP7jQ=NB2MbUQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] kvm: sev: Add SEV-SNP guest request throttling
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, Thomas Lendacky <Thomas.Lendacky@amd.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <jroedel@suse.de>, Peter Gonda <pgonda@google.com>, 
	Borislav Petkov <bp@alien8.de>
Content-Type: text/plain; charset="UTF-8"

> > @@ -4015,6 +4042,12 @@ static int snp_handle_guest_req(struct vcpu_svm *svm, gpa_t req_gpa, gpa_t resp_
> >
> >       mutex_lock(&sev->guest_req_mutex);
> >
> > +     if (!__ratelimit(&sev->snp_guest_msg_rs)) {
> > +             svm_vmgexit_no_action(svm, SNP_GUEST_ERR(SNP_GUEST_VMM_ERR_BUSY, 0));
> > +             ret = 1;
> > +             goto out_unlock;
>
> Can you (or anyone) explain what a well-behaved guest will do in in response to
> BUSY?  And/or explain why KVM injecting an error into the guest is better than
> exiting to userspace.

Ah, I missed this question. The guest is meant to back off and try
again after waiting a bit.
This is the behavior added in
https://lore.kernel.org/all/20230214164638.1189804-2-dionnaglaze@google.com/

If KVM returns to userspace with an exit type that the guest request
was throttled, then
what is user space supposed to do with that? It could wait a bit
before trying KVM_RUN
again, but with the enlightened method, the guest could at least work
on other kernel
tasks while it waits for its turn to get an attestation report.

Perhaps this is me not understanding the preferred KVM way of doing things.

-- 
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
