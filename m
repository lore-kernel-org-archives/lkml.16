Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E8D22259F
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750793809; cv=none; b=jiDQgZYPTJoSyaif5e/xyghi79WBRSfBGM1Udf7/KewCPPezXocHv5IMsVhw0+7rWPGsAWVKvjPIX4uqD5YFqgvGCSVcUaX72niGyRk1FiwNwfofVSvmShbvo51Gd2B8rDVrnBpezUMpcM7oZG2UTWWt0e/OQqkZ59Tn79ecg/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750793809; c=relaxed/simple;
	bh=VcRy3+qgDcj5jlMA8aspokLMV/NW3nglxYgdE7+pfKo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bIqJzRzmPjym1ifq87Wmy/UsrtoX6LUo5h0npo1e3vyjh6oeNQG89SvI4tYy5Gw7fiFWsl4z4WNzJEVGSGclaJaCrsgMys9jLQS9+lafIFLGpBYyGoKE97VZH4UDoIZhjw4M47qT4cB683jb1d2Ugy6ardA2tgXWvRqCthLOWnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZKQGWjrj; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZKQGWjrj"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3138f5e8ff5so5628093a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750793808; x=1751398608; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gIPN5QE4nVCmnvt/bgGiImfzJSC2l0VEKxxjN+qLd8w=;
        b=ZKQGWjrj4jTevWIsqtuPEpDC37aklfxAgR/shXqL7leA+60xxBY7EO+Xm5WEoQx/sv
         QCiswwFKE/6+KKup1BihLJ+krywKOeEi2QdRBqKxc+6Ha0xeZ2mh94dyC1J2nYOEogoi
         a3kq9NN24raWmTCjvaf4agdA1EBIJTNHzQPxse8jUB5WTZ9F+5PAkn40qBQSbiMPrvwi
         YaxtIXZ7itFJhOoStq1+B489jtkWOuzqTrE5HDP+xDjYmqEfzRnkRc2q//QUdgpMDB33
         3AprZPf4daHMlcYSa1r42i+mpSBq3P9dmw7g5hPOo2T30khCE69bt1DRfNjlXaTi/tb4
         SK5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750793808; x=1751398608;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gIPN5QE4nVCmnvt/bgGiImfzJSC2l0VEKxxjN+qLd8w=;
        b=FUGG7kTsXeiGQlXlubqB6N6o4UWgnaZ4GcC21XyhjAQQh0IevzfKb1HEhGq8s75IYR
         D+/RBn7bsOFAGhPVmEniBCOeTenDXM+LwHczKih3pshYmUUuwWxq0s8Xc+qkntzwBiX4
         eDFOYftR9cdk8b7MKXlgKEB0tT1T7DiYluYbzX6it3VUioL7JjUpt1LgdB/WUBW5ZXIQ
         sH2x28PNxL8uZtmZRpnsy4Z6LoW8yxmG46epP1yed1DWet1Ev25bnXnlF2NfKBSI6Wyw
         /i/PvZz30UKQU7Asa55KAWTdtYKKNU7Bc6AeJPH2pd8YXHGqz4bHAOXuiL65wIrAUXiT
         PgTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbcTDs4lo+3wDeuemCWQle+Tp/otk9KkL84Ev1eCNi/skq68+f3hfyVab/b4l4fvKd0KrDWMmONf8Z4h8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjYdNJ8MMaNfoA7h15uq+mhtcwzroUlj+2bnzi9beW1Gbup7i4
	K6SHDe+erdwgqe8eCt73jakv+q1NRs1VbFvyn4K1zQ3zfKnhMw2VKgoNQbx7ztAsYwTOx5RBzZc
	hY1Ld8w==
X-Google-Smtp-Source: AGHT+IE3K+R02gXUOmvPAyWInTm2IKLFLQlBc/V2I8P60s8vbzR56VHCiRZI3O+ibJmWDR79ts2sUApeIes=
X-Received: from pjboj4.prod.google.com ([2002:a17:90b:4d84:b0:315:b7f8:7ff])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c81:b0:311:e8cc:4264
 with SMTP id 98e67ed59e1d1-315f2619698mr180503a91.12.1750793807795; Tue, 24
 Jun 2025 12:36:47 -0700 (PDT)
Date: Tue, 24 Jun 2025 12:36:24 -0700
In-Reply-To: <20250516213540.2546077-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250516213540.2546077-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <175079222519.514976.885736874981212717.b4-ty@google.com>
Subject: Re: [PATCH v3 0/6] KVM: Dirty ring fixes and cleanups
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Xu <peterx@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	James Houghton <jthoughton@google.com>, Pankaj Gupta <pankaj.gupta@amd.com>
Content-Type: text/plain; charset="utf-8"

On Fri, 16 May 2025 14:35:34 -0700, Sean Christopherson wrote:
> Fix issues with dirty ring harvesting where KVM doesn't bound the processing
> of entries in any way, which allows userspace to keep KVM in a tight loop
> indefinitely.
> 
> E.g.
> 
>         struct kvm_dirty_gfn *dirty_gfns = vcpu_map_dirty_ring(vcpu);
> 
> [...]

Applied to kvm-x86 dirty_ring, thanks!

[1/6] KVM: Bound the number of dirty ring entries in a single reset at INT_MAX
      https://github.com/kvm-x86/linux/commit/530a8ba71b4c
[2/6] KVM: Bail from the dirty ring reset flow if a signal is pending
      https://github.com/kvm-x86/linux/commit/49005a2a3d2a
[3/6] KVM: Conditionally reschedule when resetting the dirty ring
      https://github.com/kvm-x86/linux/commit/1333c35c4eea
[4/6] KVM: Check for empty mask of harvested dirty ring entries in caller
      https://github.com/kvm-x86/linux/commit/ee188dea1677
[5/6] KVM: Use mask of harvested dirty ring entries to coalesce dirty ring resets
      https://github.com/kvm-x86/linux/commit/e46ad851150f
[6/6] KVM: Assert that slots_lock is held when resetting per-vCPU dirty rings
      https://github.com/kvm-x86/linux/commit/614fb9d1479b

--
https://github.com/kvm-x86/kvm-unit-tests/tree/next
