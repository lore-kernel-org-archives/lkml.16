Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0555623E35D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 21:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744405961; cv=none; b=XgX+lsvo7qz+JDUrCWka3x7NuVfxpdVelIE387JWdIRw2fO/ReiKZz1d8EdCEMp48EVJ9oD+5FQIeW06e8tjze20UIjUSeNo1lFApA7Ua0bPgpgep0j/Ga4w6cSepvG4rO6EhOZw6Sti5Xcja2qJ1gxKKl56+v8Yu1b35vLrWPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744405961; c=relaxed/simple;
	bh=HIoeRzZ4XL/sqMS6l6dsp3lLVoJy7wnMtD2NyOs3WuM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jv3YBja79YY0Ai4p77z8v0E1XFbyS/hthjDWvFx6Ub99yYkNMjs7PYJGMH3o4+yLBxFS/ajVS6Rv6buLUN6soH8HhLb4FUBG3pBvRpm4nMZrmBufzLKlahNrCTSQs7tIwWuHH2SvM8FCT/QxjEdgNfjX4MzULFqaNcz1CR1mKPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lyYEmkt+; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lyYEmkt+"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30364fc706fso2096357a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 14:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744405959; x=1745010759; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fTerkmabK1RPmin6YSGz3yw/UPXy21WADjby6VaDxu0=;
        b=lyYEmkt+4W/qmYTbqLfgcKWygcpTCT+AcNxQPJV4qwTs3wfz/+CvHP/PqFpPfgL09i
         rcopAT+whi4UWNcTSg/HVJeSGrj0CA7gBa5NcQ6FyN8uBirYoUYvwN6XuxZUeCPIFFrN
         lGdqvfm+/X9XO2lbFwqd8SlNNNyaukBAURqDTv3xyPDYmqcWdAKAbyu2aou2gZRCpscc
         hRPihAiiaeGODqPuibtDr2NjQsJwvkyJdrduBduRFKMZERwp4Kpp0ouTEVYMS0XpY7Du
         SWLjrZkqUJoQMBIDI45oqQJADgO9Q4T/feG3mimLQsZrBdkgn3b+SfKOzMG6xROfsmGp
         tx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744405959; x=1745010759;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fTerkmabK1RPmin6YSGz3yw/UPXy21WADjby6VaDxu0=;
        b=HD0ClpiC0rQVkbBGDek9hK5cWYcm0ekANku39AnB8/YvxXpz34uCCGNvd31trFZTYW
         mVxcLmvDHSDBQlVBBo/whtk0Ha8D2Se5IoRH5iFHKV+x+AIGVMAUVBo/S3pMtEy/Jjni
         R1iavForBecFkAZ4PSfC0ObRb7DEORiHcXAo92bL/5WELlR+Q8w3+flNdn41zhkjPgrS
         mOxTE2FmbSLj5Gsw7WeJyuW06xigzCdxHEh/6oiftFD9LGfpHebehhM9Ks/o3Jqk1d/q
         N8ne/5im6ReKvKLcVChnJgNwrl4NEb/f/647BHVHqylYKUrKEH47hCalkxBYNR2SOrKA
         h8TA==
X-Forwarded-Encrypted: i=1; AJvYcCXhhLjS4/Jfu3tCRcOIgcpQph0NGWdQGpYFglUzZEUmj9mHv5gPaz/fhNMC+bpMEwwDKhf7pzQMqSCkl2s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yze98kbc3qMGFejAMZJrCPiEIDqHbTufQiZh3Sz5FRa+7DZJKOo
	eS04K9j0gA9naZ2h0gsPNuVaF7E/EHJrXFqtQJ4OsIqMJCvkBnsOf5kHMiSeviTzoPhrRHGNPvq
	IkQ==
X-Google-Smtp-Source: AGHT+IHCwmlsejUy/39yMP4wbG3Y4o+uj+/0NvNbE4QYI/YW+78TKNJvJdox+x120ZMs4bTF49FtEDiDTlU=
X-Received: from pjtu11.prod.google.com ([2002:a17:90a:c88b:b0:305:2d2a:dfaa])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5403:b0:301:9f62:a944
 with SMTP id 98e67ed59e1d1-308237cde17mr7424213a91.33.1744405959367; Fri, 11
 Apr 2025 14:12:39 -0700 (PDT)
Date: Fri, 11 Apr 2025 14:12:38 -0700
In-Reply-To: <20250331213025.3602082-2-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250331213025.3602082-1-jthoughton@google.com> <20250331213025.3602082-2-jthoughton@google.com>
Message-ID: <Z_mFxiXcWKcxRo8g@google.com>
Subject: Re: [PATCH v2 1/5] KVM: selftests: Extract guts of THP accessor to
 standalone sysfs helpers
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Cc: kvm@vger.kernel.org, Maxim Levitsky <mlevitsk@redhat.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, mkoutny@suse.com, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Yu Zhao <yuzhao@google.com>, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Mar 31, 2025, James Houghton wrote:
> From: Sean Christopherson <seanjc@google.com>
> 
> Extract the guts of thp_configured() and get_trans_hugepagesz() to
> standalone helpers so that the core logic can be reused for other sysfs
> files, e.g. to query numa_balancing.
> 
> Opportunistically assert that the initial fscanf() read at least one byte,
> and add a comment explaining the second call to fscanf().
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>

Needs your SoB.  It's a bit absurd for this particular patch, but please provide
it anyway, if only so that I can get a giggle out of the resulting chain of SoBs :-)
