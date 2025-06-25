Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49932F3627
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 22:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750890450; cv=none; b=EaLS2xE1CN+vbCO346+K9FWMdUDV52LLEoI9gBBr5+En0WQonaqXiIpKVmuKkhtRlyOiXgEv79nkgUSpUjZ5nmGT6KYyAqkgDJyl9tValNPNvw19yaOM6PL9qSuAXts1UNdeYjXMDTYbKLDfo5u8rPUrpklyaCI05yNkCCRnhx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750890450; c=relaxed/simple;
	bh=vWw3uexPmgGirIdC5hWdSreMJG5sOiwUXmIQy2pr1vo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ajLaEDxD1OPfDkWG/l+lCd7Jnbnle50x6FoVVRlogHhH8skvUa3iVP1RGyJJnAu070/hcIAv5uXsMX3+9HjJToh5MLvKcVPPkcaVs4gm3xuYh4cEBBgv8e3NRQznf4+X0ljSs3MN+wdSumpmFBWZOcVbQWgB88IsqWXzbkRUNRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CM4i4c4U; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CM4i4c4U"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-315af0857f2so231790a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750890448; x=1751495248; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gYMiziqxx+dkKfmpL4cjtXaxzDCKbeuDEZS/eoFgwQc=;
        b=CM4i4c4UOfx/X9HtfPPLdki+Kma9B4tXp0MeFq1+nntxw/HnKXp/09lPKoMXzhOTT6
         ojO4KDtj+C8TJqRPCE6YDv42E2FX5Akh5Cm/jboDhFTduYMwmZGxbIIiJopwAokWKPtv
         pjRYfS3Mzp/Of7BP7eyVseWO4vQYqWEhfE9PAUVUVFSxxXGt+EwM12wwcg//68pptA7i
         V9GGXUfnSMNSVqFDfA6j4Jv6bkox27zfs8P3zB7i1EDmJl0e2YxbgIgzW03VBrVi/CGb
         fqTG7l5n3KF/48gllfsyjYnAAqPfestUaE+OgGKR9FNiFri7I9u0WlxQMlfCvXJwLuSA
         Q4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750890448; x=1751495248;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gYMiziqxx+dkKfmpL4cjtXaxzDCKbeuDEZS/eoFgwQc=;
        b=spndUaXVMYbIOXahTH0/3qr4GvVhwVLpJ27AAVPxogp9bjxt5dWXRC54eDm0yH3zC/
         v63tBA+P/a4Gn8hayPxesOaa0In7BSQ/+2fxKgu0k2436QJaCT1QSVhle6w0O7Fi6JSA
         08AK5BN7FiFr9y5AsAP6HlVZGuWzCmWbKweKZxxTFgreuEzhepeUaaCsx7CeocXhqyZ7
         LNa3YXAPLiYfouWl4RocPS+LjE2lBbsbSNXt54z4m+RxEIDw8GF/ZH5SjB63bn8IlZCL
         DVT4TPS3mhfbsqRFWX2V/MkZX6n74uCjtEhG6nl0W7uGlMkJqvnEBghaKYVKQIB0/ZdZ
         4Ukg==
X-Forwarded-Encrypted: i=1; AJvYcCWzWWpSmOYxNMmZwjscoZGN04vFVSSTH+PwJzbiWkce5tKVcPzn5TNk1N/d3OFIQgqwrnjK/hB2iFfqOjY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/2ZaSe1qwooj21qkShF7IlLy3YTEqBqtAipKiUnE9YodBJy1w
	w4jnEhZ03GfUBwQCSsmvHB9ydRPlKAa6HGk3uxJGO+WFRdYRoXSJyQ9DbJNqdd/o+G0MHn5IaEa
	IAy4X4g==
X-Google-Smtp-Source: AGHT+IHrWdsFl3J6w4HEzuAFNNbssKmcxXqloPX+MrQvOJXMAJjnDmWQLgmVsR7XTsscuW1aXJeG/K0ib/E=
X-Received: from pjbnd12.prod.google.com ([2002:a17:90b:4ccc:b0:2e0:915d:d594])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5690:b0:312:29e:9ec9
 with SMTP id 98e67ed59e1d1-315f268a5b0mr6819475a91.24.1750890448137; Wed, 25
 Jun 2025 15:27:28 -0700 (PDT)
Date: Wed, 25 Jun 2025 15:25:45 -0700
In-Reply-To: <20250611095158.19398-1-adrian.hunter@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611095158.19398-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <175088949072.720373.4112758062004721516.b4-ty@google.com>
Subject: Re: [PATCH V4 0/1] KVM: TDX: Decrease TDX VM shutdown time
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, pbonzini@redhat.com, 
	Adrian Hunter <adrian.hunter@intel.com>
Cc: kvm@vger.kernel.org, rick.p.edgecombe@intel.com, 
	kirill.shutemov@linux.intel.com, kai.huang@intel.com, 
	reinette.chatre@intel.com, xiaoyao.li@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@linux.intel.com, 
	isaku.yamahata@intel.com, linux-kernel@vger.kernel.org, yan.y.zhao@intel.com, 
	chao.gao@intel.com
Content-Type: text/plain; charset="utf-8"

On Wed, 11 Jun 2025 12:51:57 +0300, Adrian Hunter wrote:
> Changes in V4:
> 
> 	Drop TDX_FLUSHVP_NOT_DONE change.  It will be done separately.
> 	Use KVM_BUG_ON() instead of WARN_ON().
> 	Correct kvm_trylock_all_vcpus() return value.
> 
> Changes in V3:
> 	Refer:
>             https://lore.kernel.org/r/aAL4dT1pWG5dDDeo@google.com
> 
> [...]

Applied to kvm-x86 vmx, thanks!

[1/1] KVM: TDX: Add sub-ioctl KVM_TDX_TERMINATE_VM
      https://github.com/kvm-x86/linux/commit/111a7311a016

--
https://github.com/kvm-x86/kvm-unit-tests/tree/next
