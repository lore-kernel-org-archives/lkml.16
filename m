Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041C3264612
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746523787; cv=none; b=oUdG5QN6bQrPjpIHlHhB7qIEHP0p4ZolmfJDVf1u3sj1B7yp10opZt3nNAW8O6WDGRYRKs7vXwcH1NDUOtRntWj+F9zBePPfVglM9E/4jBGNVclK/lZB05G0m0N6ma6JnNMAE/V/+RdkHz3cgSQ7BedlLI+Q45eLxUiPFu2+Y4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746523787; c=relaxed/simple;
	bh=3lRSYAJoDIfqK+krqzkFLo5faoNN//lYCOs7kChMPf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition; b=eHKUhpQotfqhOUR5JQ81wS/w3cFG+k++fpPzz/3/Vbgj21DOQzLLXb1K09fJdSTjKOAp5El5CJhvLbHqUdu1jiqzTk66AiL49LJwQfJndZfj7cFDU46rtn3F85XENTm/yv2RXvbvb/kpSIKLka3xft5OlmqLbJM60N/TyBNw188=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=immunant.com; spf=none smtp.mailfrom=immunant.com; dkim=pass (2048-bit key) header.d=immunant-com.20230601.gappssmtp.com header.i=@immunant-com.20230601.gappssmtp.com header.b=mjneXfRs; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=immunant.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=immunant.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=immunant-com.20230601.gappssmtp.com header.i=@immunant-com.20230601.gappssmtp.com header.b="mjneXfRs"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7082e46880eso46460867b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 02:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=immunant-com.20230601.gappssmtp.com; s=20230601; t=1746523784; x=1747128584; darn=vger.kernel.org;
        h=content-transfer-encoding:lines:status:content-disposition
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bhNqSOC5wF7s/DqPJd5V4+i1iqYVvZl6mD6sr2HXhSY=;
        b=mjneXfRsS6T+LOPR0ntiVsOTa/c+7hMqFfW1dzFrTt4LI8IPX3VyI7yojTga48/1kD
         hBz/d61L85DTkzSBiJiN5isxs+lVzNaOo581Pz5rB9ixe+C0hkT6ZKc/7s21pqeuGTSG
         4oiwjQAwIrNu/Kqgen0fGgRaAAZu9I6RU/b7tR/W4UjSsfv02zUHLORUMfwcNTYisZhQ
         zeq052PJqIldOF02utIRES4MOsA4lnnKddm4UuyQh7kgh7yyNZzuMhjc8zCtWpP5GuI1
         Er//zALXhALGUE2EBZaWq2RsUeQaZcNJcifWZSqwDEpm5Hu6+NHQLuNEn9p77RmrG4nL
         17SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746523784; x=1747128584;
        h=content-transfer-encoding:lines:status:content-disposition
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bhNqSOC5wF7s/DqPJd5V4+i1iqYVvZl6mD6sr2HXhSY=;
        b=pM7ztdewJxbNsXPYsVUWW2fMI1I1sD4hKm+EGSlqrE7XTUA3oninPSz3/b6tIvS3LG
         O/mc7FueTnppRH61vGhRQm6N5DkleGEabrEs2vkiYR1PKZfRvU/XXe0RDt9/BaesXtlO
         IcqTKMUWVvE+cpr41NeNlZncUoNKZJdqoaVhjmZmCSJhLggdA7SSV7YcvxSRA3Ck2ues
         ZHUlIyPGxawWjLdR4GJ2RS/UEHYMFdJw82Z1akA3/USevRSleur9zDILmwf4wpXlKjyc
         8EvQtSRk7HhR4I3GpdRsEHTpBppez7/H3FzDF2w3sq8h9n4fHjPIddFE1W0zn2pvyDgS
         63OA==
X-Forwarded-Encrypted: i=1; AJvYcCWu8t5Hk9C4KcjDVQzNIOjVTTAnQDXtglVKMEcXNMgUMTqe91zM9Xy6RiZSftDkug5BZTgvX+/lA33WhNs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvk2KqFBGdFPBMDNKua1hC7+ivccKr+H6sFuunxwjiGhtz85UY
	yIAjwVjDiUW0cXFUHL9Vc0/eM+ex7x8ml5Y+cJYw8AM006ThLXnyvC+gJCmiQLE=
X-Gm-Gg: ASbGncsKLMfgijqhLVwiLg92jPz/8mSJq2NaodBRc786PhfwKh+ApCWJZGJZzF4Ma66
	DoexfBIt36+szCUiblVvjcy0uLDxIr6sSXt+HK9Z37Z1kMKNjPMk9lhsfUnJIqvZ3OapCVcbRQT
	3+1jWdRvRmXQBza5eC3fzv7PtcJ4kcKemSx02IgKJiWm/UhGyDolkiO2roQTapWrd/aQzgAXsYl
	c47OzXKOIMMTo1VjDJxlFSkH/dRJ/loUcOf/Zb2PjcsmOASBDQkVA1/+5q1tCRhW35E0gA074kK
	MOLTR+OjdlYTTj6CGdxFegGEkmc68lz6pQQ7gDs9AQ==
X-Google-Smtp-Source: AGHT+IEiCZCpczG2uSgoLqesdF0FcNte2ltiX3d2EMvQ1sinI9JkU0e+3u0ocUrtlOW8Mx/0KHeawQ==
X-Received: by 2002:a05:690c:6407:b0:700:a93e:3302 with SMTP id 00721157ae682-70919d40189mr34612227b3.37.1746523783798;
        Tue, 06 May 2025 02:29:43 -0700 (PDT)
Received: from donna.immunant.com ([12.9.190.3])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-708c3f3d939sm26255167b3.45.2025.05.06.02.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:29:43 -0700 (PDT)
From: Per Larsen <perl@immunant.com>
To: maz@kernel.org
Cc: armellel@google.com,
	arve@android.com,
	catalin.marinas@arm.com,
	kernel-team@android.com,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	perl@immunant.com,
	qperret@google.com,
	sebastianene@google.com,
	sudeep.holla@arm.com,
	will@kernel.org,
	yuzenghui@huawei.com,
	Per Larsen <perlarsen@google.com>
Subject: Re: [PATCH 1/3] KVM: arm64: Restrict FF-A host version renegotiation
Date: Tue,  6 May 2025 02:29:41 -0700
Message-ID: <aBnNXyJn818ZEKOS@google.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <86r017h00e.wl-maz@kernel.org>
References: <CA+AY4XcaJa1_U3qXQUBj4wZJYc9hKmRX8FTNeDvV2auEnC_WrA@mail.gmail.com> <86r017h00e.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mutt-References: <86r017h00e.wl-maz@kernel.org>
X-Mutt-Fcc: ~/sent
Content-Transfer-Encoding: 8bit

From: Per Larsen <perlarsen@google.com>

On Fri, May 02, 2025 at 09:47:45AM +0100, Marc Zyngier wrote:
> On Fri, 02 May 2025 04:52:39 +0100,
> Per Larsen <perl@immunant.com> wrote:
> > 
> > FF-A implementations with the same major version must interoperate with
> > earlier minor versions per DEN0077A 1.2 REL0 13.2.1 but FF-A version 1.1
> > broke the ABI on several structures and 1.2 relies on SMCCC 1.2 is not
> > backwards compatible with SMCCC 1.2 (see DEN0028 1.6 G BET0 Appendix F).
> > 
> > If we return the negotiated hypervisor version when the host requests a
> > lesser minor version, the host will rely on the FF-A interoperability
> > rules. Since the hypervisor does not currently have the necessary
> > compatibility paths (e.g. to handle breaking changes to the SMC calling
> > convention), return NOT_SUPPORTED.
> > 
> > Signed-off-by: Per Larsen <perlarsen@google.com>
> > Signed-off-by: Per Larsen <perl@immunant.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/ffa.c | 19 ++++++++++++++++++-
> >  1 file changed, 18 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > index 3369dd0c4009..10e88207b78e 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > @@ -712,7 +712,24 @@ static void do_ffa_version(struct arm_smccc_res *res,
> > 
> >   hyp_spin_lock(&version_lock);
> >   if (has_version_negotiated) {
> > - res->a0 = hyp_ffa_version;
> > + /*
> > + * FF-A implementations with the same major version must
> > + * interoperate with earlier minor versions per DEN0077A 1.2
> > + * REL0 13.2.1 but FF-A version 1.1 broke the ABI on several
> > + * structures and 1.2 relies on SMCCC 1.2 is not backwards
> > + * compatible with SMCCC 1.2 (see DEN0028 1.6 G BET0 Appendix F).
> 
> I can't parse this sentence. Missing words?
> 

Yes, I will fix this in v2.

> > + *
> > + * If we return the negotiated hypervisor version when the host
> > + * requests a lesser minor version, the host will rely on the
> > + * aforementioned FF-A interoperability rules. Since the
> > + * hypervisor does not currently have the necessary compatibility
> > + * paths (e.g. to paper over the above-mentioned calling
> > + * convention changes), return NOT_SUPPORTED.
> > + */
> > + if (FFA_MINOR_VERSION(ffa_req_version) < FFA_MINOR_VERSION(hyp_ffa_version))
> > + res->a0 = FFA_RET_NOT_SUPPORTED;
> > + else
> > + res->a0 = hyp_ffa_version;
> >   goto unlock;
> >   }
> > 
> 
> Something has gone seriously wrong with your email, and the patches
> are badly mangled and unusable. They are also sent as individual
> patches and not as a thread, which is a sign that you didn't send them
> using git. Please fix this for your next posting.
> 

Yes, my apologies. I will use git send-email to post v2.

> More to the meat of the patches: why should the hypervisor paper over
> anything if the spec is broken? Why can't the host just as well decide
> for itself what to do?
> 

Asssuming we drop this patch from the series and apply the rest, the
hypervisor and host can negotiate FF-A 1.2. If the host then calls
FFA_VERSION a second time to request FF-A 1.1, the hypervisor would
return version 1.2 (without this patch). Per the spec, that means the
host is can use the compatibility rules (DEN0077A Sec 13.2.1) to go
ahead and use FF-A 1.1 (every function in 1.A must work in a compatible
way in 1.B if B>A). 

However, the hypervisor negotiated version stays at 1.2 so it will use
SMCCC 1.2 for 64-bit interfaces. The host has no way of knowing this and
might as well assume that the hypervisor was implemented to fall back to
SMCCC 1.1 in this particular case. 

I don't even know that the host will ever try to renegotiate as it is
explicitly not allowed by the FF-A spec. There is no way for the
hypervisor to say, "stay at the negotiated version" so we must return
NOT_SUPPORTED. 

> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.
> 
Thanks,
Per

