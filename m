Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809E23074B2
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750859275; cv=none; b=ihfScvDRPDfEyWwFhsDm9vo2bv1zwgqproHX4c6BPNguKsvDDD/yjm4w9M0+Qj3r4GXDgfe7mEkcLi/CSLhmZqP8iMsqDm1wxbUdgz+mY5WW0j7Jj+sYegArLRqJnYioGIykIxSBy45y8rQxfcetLfUFGBuou16YH1VQ55Ht1MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750859275; c=relaxed/simple;
	bh=VGtVJi5CoDux4I3VQLDQbQlUaY8C6zsXK6vGNWYjQe4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DFVDC9tUJ+Ey5SWbA0V2r/l6C3vdxS4K2h+2Ymx7X4FwbJyK9xmYT8iHqIh9kJc/DQ33TIbfOtHm4rJyJsL+HgAvejW7T5/CHWWw7T8BPW3w8aauHJ8tzz6ewd54wbUJ3hxL0mPj0utFuP576MHDLkCBXSl4nQByo7fqoIuTDVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4v3nLrua; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4v3nLrua"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-237f270513bso138955ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750859274; x=1751464074; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGtVJi5CoDux4I3VQLDQbQlUaY8C6zsXK6vGNWYjQe4=;
        b=4v3nLruaC3KrZnxUtYbX68lg1BDHdpHLRZWwCvM7GmHPFpfvwuEIDSRPCJLWNIQCwF
         zIcS9jnwC/OqOWZEbM5lzpPYaA79nHHoZ6CvYpDrToSzC5W5JcpaJBK0FzLGd52+onUx
         KYALv0U+M03ywnETuK6rR8tGm0LcURnZ7PGZqzBufduebbQ6bRqNbNzJVvXWBQAwUVwx
         aP5ICcNCW7I5ATTrJXe/T/ega/UDkqqrw7hL0/orgx6L33tyfh6EDf/3j7d+E50w9xMO
         fy0lAHZuulHeTZ3FwSEBX5192ThzJbZWrUr9A2zQAWqD+aXDRVNNZYTzAf4kI5ng18Tw
         wylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750859274; x=1751464074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VGtVJi5CoDux4I3VQLDQbQlUaY8C6zsXK6vGNWYjQe4=;
        b=LCkreenbFzXT9vjeArZq6UIK/tY0HRHMK3gduhDqTlJ+eTA2V8KALKL7VDMxSyyqhJ
         Y7BDH3Zgb7ewCae4i5mapaQZujf4gZxNPxseQzaiK8SGnC3E51QEW78C+MpE0IFLxrzj
         PvbBFXujQPuUp6OiFvpDmMuicA2XrSbw/IwR9MrzTcq8OGy3FkdG0cgT0pvxRCY8Lya/
         8gY9ROkhkDiiUC8BLrQ4cQCJd5Vv73sO1BvYtbpeMrT3b6UjpNwA9BPo8mr0eS3f2fIX
         FqJ5h2ExInRYGQvIY9KHegMtsMEDnq6KdH1diayZJmB8su+7SIlBA7zcQf4c7ijI1BJI
         Se0w==
X-Forwarded-Encrypted: i=1; AJvYcCUTs7fxFwofmoYH5CoQj52rvtGQbNUucBnlnG0Xr1TUwUAhS8a/SwWr9XocuDlk/XyWNIi6l/eiUMNDh2c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbtYBbsz1b33pVeyGN8VA9h9e2x4KODqg4j1SCt2A5i4K16sK/
	3b58S56NyFcRUM114/dkir6UKvgLEGdrvaXf7lKyAKx4hXSGfUg6szhghiL2W7TsY/wkBTun2f8
	N1pun46aQ/yKtk0R1q76Txk8cOFaQfBKU9sGATnKM
X-Gm-Gg: ASbGncvZnN768Jhrq10h0CgohcJJ6asMYz+QPGnzr4AFlCKanbig5d47SFAxuDzlrN3
	104ZZb2wSjiP/F+WvZdBKbHD9XheodDsUbWtXVEd8GdfeU5Q8UNlBsROoyO6CiUGiesFZMqhcpD
	EUMAu9MsR8yKTS839U2X9U/FZ7Zz2RZ/R4H1igfC8mSWJu3OtP2X/qA52PcD3Lfj/cr84efUz+d
	TRD
X-Google-Smtp-Source: AGHT+IFih6i6FHqdKlHiTqYQtuxauWYxR8hxnuVmkAsDP91INYFX6UC1hP2vKvdQJGH9NxCC36goGVBUnX4d54Og02g=
X-Received: by 2002:a17:902:ffc7:b0:231:e069:6195 with SMTP id
 d9443c01a7336-23828dd6ba0mr1711135ad.23.1750859273323; Wed, 25 Jun 2025
 06:47:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aEt/ohRVsdjKuqFp@yzhao56-desk.sh.intel.com> <cbee132077fd59f181d1fc19670b72a51f2d9fa1.camel@intel.com>
 <aEyj_5WoC-01SPsV@google.com> <4312a9a24f187b3e2d3f2bf76b2de6c8e8d3cf91.camel@intel.com>
 <aE+L/1YYdTU2z36K@yzhao56-desk.sh.intel.com> <ffb401e800363862c5dd90664993e8e234c7361b.camel@intel.com>
 <aFC8YThVdrIyAsuS@yzhao56-desk.sh.intel.com> <aFIIsSwv5Si+rG3Z@yzhao56-desk.sh.intel.com>
 <aFWM5P03NtP1FWsD@google.com> <7312b64e94134117f7f1ef95d4ccea7a56ef0402.camel@intel.com>
 <aFp2iPsShmw3rYYs@yzhao56-desk.sh.intel.com> <a6ffe23fb97e64109f512fa43e9f6405236ed40a.camel@intel.com>
In-Reply-To: <a6ffe23fb97e64109f512fa43e9f6405236ed40a.camel@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Wed, 25 Jun 2025 06:47:40 -0700
X-Gm-Features: AX0GCFu06PURghEvWwSxtC_cBelfR-tPSLcItrLKKSKf9WyCjshcXbUMHj0Z9IE
Message-ID: <CAGtprH_1nMC_z+ut3H6Hjjjb9J=sg=h-H10L9PVK+x=Vw2SM0w@mail.gmail.com>
Subject: Re: [RFC PATCH 09/21] KVM: TDX: Enable 2MB mapping size after TD is RUNNABLE
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "Zhao, Yan Y" <yan.y.zhao@intel.com>, 
	"quic_eberman@quicinc.com" <quic_eberman@quicinc.com>, "Li, Xiaoyao" <xiaoyao.li@intel.com>, 
	"Huang, Kai" <kai.huang@intel.com>, "Du, Fan" <fan.du@intel.com>, 
	"Hansen, Dave" <dave.hansen@intel.com>, "david@redhat.com" <david@redhat.com>, 
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, "vbabka@suse.cz" <vbabka@suse.cz>, 
	"Li, Zhiquan1" <zhiquan1.li@intel.com>, "Shutemov, Kirill" <kirill.shutemov@intel.com>, 
	"michael.roth@amd.com" <michael.roth@amd.com>, "seanjc@google.com" <seanjc@google.com>, 
	"Weiny, Ira" <ira.weiny@intel.com>, "Peng, Chao P" <chao.p.peng@intel.com>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "Yamahata, Isaku" <isaku.yamahata@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"tabba@google.com" <tabba@google.com>, "jroedel@suse.de" <jroedel@suse.de>, "Miao, Jun" <jun.miao@intel.com>, 
	"pgonda@google.com" <pgonda@google.com>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 11:36=E2=80=AFAM Edgecombe, Rick P
<rick.p.edgecombe@intel.com> wrote:
> ...
> For leaving the option open to promote the GFNs in the future, a GHCI int=
erface
> or similar could be defined for the guest to say "I don't care about page=
 size
> anymore for this gfn". So it won't close it off forever.
>

I think it's in the host's interest to get the pages mapped at large
page granularity whenever possible. Even if guest doesn't buy-in into
the "future" GHCI interface, there should be some ABI between TDX
module and host VMM to allow promotion probably as soon as all the
ranges within a hugepage get accepted but are still mapped at 4K
granularity.
