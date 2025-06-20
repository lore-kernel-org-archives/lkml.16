Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0082C033C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750437096; cv=none; b=rFCljDhiUvArjK9U3EUt5rI8kupHc5amSvmRUA5OJ5c50alqXPVBdaNPyrUecvXHK/iyidivlEHYODgOKr3RUvh/IugQCcr4l9pv07ADInCYCpnEcidaAN5J2QQynsyWsN8+kk0H2Arbfp7CfJu5tBMtZ+mi2NkSrSgcuy7pqsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750437096; c=relaxed/simple;
	bh=6d+s0CkqlJ/sOToQl8k/f74nUNCoAX/LBX6JColUsXg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fovbYn8BURkwJV0V/6uK7/pQVK0Zk20tQqGIJe5LqtEvmPtzlTibvOwMMaox/RUawxaDiSUv3SmPBLoqX00OxRFQ1gwbaY9D5zETaeNIzhLhDLvTsB4+1g2X4di/tz/sF55bJdPlxpVWS18IrdNA/aGtRAUJakld6hZozwamv3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KZSx1t2G; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KZSx1t2G"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3132c8437ffso2162460a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 09:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750437094; x=1751041894; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sx8+8DGKtrespCvd+MPDf0olTwmKfWlonqZRNRuVMNc=;
        b=KZSx1t2Ga8wUx4dBKWJayxzk9/dGt7P1N1EpDM6KQoj8a+eDxtYYKH+rbHoGTS8ewt
         g9cQoMtcPhxNdhBj+sZXv9xAMrl+fpkmAVaIwf4wnQuAOKwJpomIKH1i8iHuffpETsnx
         j3mKQq62Yr+2rCFD5oLoqfhAHmw6wIOl38ImOMlVhRe9lmApWKzO1Ne/ycsAhr01YXMN
         08ShQZKEN3XmFstb8R3TY2b1WSj6BCXu+8Ii/BhDUS6guvdHBBVtxbiRQpPExhur3EVO
         AJ1asGPeaprLlaMjaEEy6CyWK+Sa+UG/divj4PEvZERyLz6DiIngGRkZ5Mfd6zIS4hqq
         f5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750437094; x=1751041894;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sx8+8DGKtrespCvd+MPDf0olTwmKfWlonqZRNRuVMNc=;
        b=UtClrBLDzEclTkrX3/opbDSDuS3Bh6/u6pQ4tPDBzlajCvu69J6jXJH0CW8kHd9fBy
         moJJZD85qb5SxsEzmH8Xxu2/VoAW/hpY5Vh59Msu+k60ZNK66OEXFdSq6P/OLOFRh81E
         uSRzMxoukm3U41xrykB5OAPw1BJgxO/iSjahBIv8877i1GF0PEXdEOhe5YefLeNweT4h
         EiUBoeUmfQ0BBmHoDUIJASOE1m+RQIjuv0jVpDIAfHGaussFvMFcEDppAUaIwIAse/dI
         l4OdP2p1S1xhcKnfv00E3d6/xAD1TGUzDfz7oT3DTfBC50zwAWLU2pG37kIAcva32Kvx
         vwBA==
X-Forwarded-Encrypted: i=1; AJvYcCWUzo41mqdn2iK5Nu0wZP2M7kHuFuWiVZwoqVjIFleAIdJ0CALvaze6xaRIaCYneu1vRMVOQeiSxmaM7Dw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1yefGQqGhx79+i621QE97cKCjDdUfYHhNVSe50V4CsK98uT66
	Cczo0ngeqCsNhmc8cLHdXXyJEQe6Wv+6JNnj0pgVmN+DAOFMqOT0UrEbuaADU0S+lq3rVbujjCE
	F6rVq7g==
X-Google-Smtp-Source: AGHT+IHklug2ba3q9Wif2FADWfkSx5k6lBEvxxtE09puatzGAYnXj2jFn5mw0J0Rq+MA7vvdp3cogC18c2k=
X-Received: from pjbqc8.prod.google.com ([2002:a17:90b:2888:b0:312:1af5:98c9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a05:b0:313:db0b:75e4
 with SMTP id 98e67ed59e1d1-3159d8f8fdfmr6421986a91.33.1750437094559; Fri, 20
 Jun 2025 09:31:34 -0700 (PDT)
Date: Fri, 20 Jun 2025 09:31:32 -0700
In-Reply-To: <aFIIsSwv5Si+rG3Z@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aEt0ZxzvXngfplmN@google.com> <4737093ef45856b7c1c36398ee3d417d2a636c0c.camel@intel.com>
 <aEt/ohRVsdjKuqFp@yzhao56-desk.sh.intel.com> <cbee132077fd59f181d1fc19670b72a51f2d9fa1.camel@intel.com>
 <aEyj_5WoC-01SPsV@google.com> <4312a9a24f187b3e2d3f2bf76b2de6c8e8d3cf91.camel@intel.com>
 <aE+L/1YYdTU2z36K@yzhao56-desk.sh.intel.com> <ffb401e800363862c5dd90664993e8e234c7361b.camel@intel.com>
 <aFC8YThVdrIyAsuS@yzhao56-desk.sh.intel.com> <aFIIsSwv5Si+rG3Z@yzhao56-desk.sh.intel.com>
Message-ID: <aFWM5P03NtP1FWsD@google.com>
Subject: Re: [RFC PATCH 09/21] KVM: TDX: Enable 2MB mapping size after TD is RUNNABLE
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Rick P Edgecombe <rick.p.edgecombe@intel.com>, Fan Du <fan.du@intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Kai Huang <kai.huang@intel.com>, 
	"quic_eberman@quicinc.com" <quic_eberman@quicinc.com>, Dave Hansen <dave.hansen@intel.com>, 
	"david@redhat.com" <david@redhat.com>, "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, 
	"vbabka@suse.cz" <vbabka@suse.cz>, Zhiquan1 Li <zhiquan1.li@intel.com>, 
	Kirill Shutemov <kirill.shutemov@intel.com>, "michael.roth@amd.com" <michael.roth@amd.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chao P Peng <chao.p.peng@intel.com>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, Ira Weiny <ira.weiny@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	Vishal Annapurve <vannapurve@google.com>, "tabba@google.com" <tabba@google.com>, 
	"jroedel@suse.de" <jroedel@suse.de>, Jun Miao <jun.miao@intel.com>, 
	"pgonda@google.com" <pgonda@google.com>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Wed, Jun 18, 2025, Yan Zhao wrote:
>   when an EPT violation carries an ACCEPT level info
>   KVM maps the page at map level <= the specified level.

No.  I want KVM to map at the maximal level KVM supports, irrespective of what
the guest's ACCEPT level says.  I.e. I want KVM to be able to completely ignore
the ACCEPT level.
