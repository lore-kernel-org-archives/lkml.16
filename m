Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D7417BA5
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750859951; cv=none; b=rZqKYm9grZLvn1w6USRvjTWxHYRTi1oAQznvHBHT9Lxg8j9vL/S+GPePMYMFqxTJRUin0voiiIVz7JypqOyo3j5FfXA7/ZC3fpL2cc40Lzetp/+fYFmVFOFUObfEMRz80HfgWvNaWxPXvEKTjUGjvivGZ12h8QdRkn9DC7JymuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750859951; c=relaxed/simple;
	bh=wpziqr1yl0gTdvL6UwsuV5sbAVaoiPzYbMOhqZJwCD0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZUg80tQiWunSDFhDDrLQ+hWc7FjuTvMB0pzf5FPGE4SveF94wlT/NqH1QdymaH5jWDQxldOKfj4WgMQsD5CUG3ZlOyRYIoNPWGEBVleN/TRkunW4MMvDgSbHx8uxW8W5GoOZp3r0L/Mf4ii2QnMDhkm7anPaqIhQul5OggUf2i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3K/bL6kQ; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3K/bL6kQ"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2365ab89b52so14766555ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750859950; x=1751464750; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0DTZm9QvxflsIUmAFZMEHRbPEwz6ipU1FHjjce2WDMM=;
        b=3K/bL6kQxJfM8VcTk4dzOGChiAontMiFFgFsxEcEc42KCr4ZnBcM0s8B3BQkAPNo5a
         4YLbNg0X7bWKYSu/7LKax/mtktaScnwF4u1mVKWsoNZgUZ3ADL436KAtTQO950a4jX5S
         k/L+AsfccQ20N7sBru5p1z+AwpRVwr1hRU4fTdpl+9D+aJjGxAhFFK/O2W96QK3xrB1C
         fztagvHM/ePl+0KqkQgE3HhB5QIgOcbaQAJyUkh3CvcirW3XKfcC5E2h2e9beMSc1kV7
         jVU9pgdVo9l1Ta4Y7zLeC7PV55rx97K1wiCtQ8vkN+wZxcLqjfkcVWoy0fOhmeY7357P
         E0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750859950; x=1751464750;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0DTZm9QvxflsIUmAFZMEHRbPEwz6ipU1FHjjce2WDMM=;
        b=cQf9yVI5mbdQKA0ZH74yKkQgAUmw9ZLt3ZWKeOrBxqMx+5T0nVB/VXHKHCUP6MxWbZ
         YV1/Xb52ygk/MPyQTG1dCWWeFp3Qfu5SB4pQ4KNr7mieY3d5Y6xCYZAtY5EZBLee9s79
         OhRhfwueKZVckRMkCqBeY1W2cs3WAe8Ds0V/ozCunpw6mvW2OThAsgcoLuMkb55ZdJNX
         DB1Lq4YNYMShfxILLuNk/XpbhfwUdv0u6yzE1+6MIYlgKcDRbeeON3wv9V/0mEaS21bf
         qLR1bimQZrkppLypIkeyoPf3TWLGxqb8MzpohwUj4GmsbTAQ/pW6z2t/JO7jmZmybZY2
         30Vw==
X-Gm-Message-State: AOJu0Ywy4a/cEnKOPUknV1vYRhUvXrTNfVKgegZyBNeT8kYfcOljWZ9f
	QYiha17261xpp9SIr0GmUH90v4ePHpJLpHMbJxyvXRCDO3Lsik4/mYTM8gj/7AZIXcT7QtbzZKO
	FI4iaTA==
X-Google-Smtp-Source: AGHT+IGQe92huN8leXfbzYtwrE0iqie4lMiaTPyOttTMTlmm3UfkdJB79ObQOs2LE/JzEH9q+NLF70FDwf4=
X-Received: from plev19.prod.google.com ([2002:a17:903:31d3:b0:234:952b:35a2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e888:b0:235:2375:7ead
 with SMTP id d9443c01a7336-2382424b99fmr55012525ad.28.1750859949699; Wed, 25
 Jun 2025 06:59:09 -0700 (PDT)
Date: Wed, 25 Jun 2025 06:59:08 -0700
In-Reply-To: <20250610175424.209796-12-Neeraj.Upadhyay@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250610175424.209796-1-Neeraj.Upadhyay@amd.com> <20250610175424.209796-12-Neeraj.Upadhyay@amd.com>
Message-ID: <aFwArAOF3e2hhEAn@google.com>
Subject: Re: [RFC PATCH v7 11/37] x86/apic: KVM: Move apic_find_highest_vector()
 to a common header
From: Sean Christopherson <seanjc@google.com>
To: Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>
Cc: linux-kernel@vger.kernel.org, bp@alien8.de, tglx@linutronix.de, 
	mingo@redhat.com, dave.hansen@linux.intel.com, Thomas.Lendacky@amd.com, 
	nikunj@amd.com, Santosh.Shukla@amd.com, Vasant.Hegde@amd.com, 
	Suravee.Suthikulpanit@amd.com, David.Kaplan@amd.com, x86@kernel.org, 
	hpa@zytor.com, peterz@infradead.org, pbonzini@redhat.com, kvm@vger.kernel.org, 
	kirill.shutemov@linux.intel.com, huibo.wang@amd.com, naveen.rao@amd.com, 
	francescolavra.fl@gmail.com, tiala@microsoft.com
Content-Type: text/plain; charset="us-ascii"

On Tue, Jun 10, 2025, Neeraj Upadhyay wrote:
> In preparation for using apic_find_highest_vector() in Secure AVIC
> guest APIC driver, move it and associated macros to apic.h.
> 
> No functional change intended.
> 
> Signed-off-by: Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>
> ---

Acked-by: Sean Christopherson <seanjc@google.com>
