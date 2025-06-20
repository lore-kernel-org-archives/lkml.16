Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8AA21FF3D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750444834; cv=none; b=tG+cR+P9MQvhDnqJl1Xd7GBYBRO8eNYYMwcaVg89FSaflTu/IupkvYf56BOwulYNYjyHbPFSqEAA3MqvOdB7vVn2Dt24Tm2dRQMBMORhQpJBpLJ94PINQ4Y60TdCZ0YchtbRygXVt8Y6kwJFCR/MerDuT89MOanJim5N4VxT1x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750444834; c=relaxed/simple;
	bh=lyY6FNfCAGhST5Sl1y1OUV5CF+K4ALihyqm6anBB/r0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jN1irlzaIV5wFpPmUD21HRAD78DtLZvn6dhCQUf5cTYBdwEzfw98UR/QymzOX9ZoPWMaAe0rMB4RCs+u7zNkQmtPp+/piqp7CSjJFcamIwWQd1x5gyZsb2OL3fLZ5g/bs47yH1HwVVFEdYgcHWOjjoBoMIws3HE2bkeln+N2ERk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=16xb1XTJ; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="16xb1XTJ"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-23632fd6248so19548595ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 11:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750444833; x=1751049633; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=atP7hQh0CjR/tS90I/fm9NKffIAdFW+oOMo+3bGt6wE=;
        b=16xb1XTJEALseSv+Ltpvp0HAF2pvyqXVXffsAgM88Eh80tBU8s91g20v5Eb6T9deDZ
         E7Ky/z1KyxxIUg1yBcwZCN8MaEKngPkgpV7wNii5xqZ7xTdAQbTSN/lxDmT+eStgl7OF
         FtRQGNNxRZwZdlZw+m8l62Tx+yNkvM0o3c/hJNjcSfehejSZukhreqe6tcMittqK7nvp
         Riu5X1mcIDlWUy8Ph0nQJYHd5MudnhdLzP4OqCMDKKdgaopf4Etp7hXsKaf9a7g548im
         MbxQ2sl7GxUV8hush0pvc9Y5ZEaXPpdnmW5TofVAhRXlShDZleLHvbKy5i7kr6dyu8JR
         vUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750444833; x=1751049633;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=atP7hQh0CjR/tS90I/fm9NKffIAdFW+oOMo+3bGt6wE=;
        b=ufUmsmWHYmLsQ+NpTy08QBaH4skaUDfw+Je2GmI/GagVtumrB+M5b6nioGlY7AHqaJ
         fYJDVNbA7tCQGwocuOt5Ays/dbMuQIYJbVwL0IGTDrdxfU5sCWd5XlXKigJLLRz9ojjN
         zFyqhPp0QcsxANfPfFpIv0yDpQxH6VANfDto60v3x5BpGzOMiFK6zgq1P21xMq73T5Tw
         n5FqxNI1lhmkjJL90C42F3Yc8ljDlk21HKGE84TsYZ3H1Wb4nBevL5oZZ58YkQDVi4/y
         A7fiMwB6xFAM1JOYNi4x/G4dAsmRHLNMjzO8ixOZi57S8bgbB8wYN8b8CJdb7lwBLl0K
         WV7w==
X-Forwarded-Encrypted: i=1; AJvYcCWm0Y1VCz9Ybe2c8X8ME+irpbYJn5XkxWPCfpcKVIZdwCSVN8ieg+oQD54/6xSoJkFZYDBCxlcBYKshCHY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjYxg96NYlJt+IWtKh6fpVlPwy4tbrOYqKIeWgtIfV2S6QGBty
	DlX68bZ9P+dJX2NhQDw7BrUzeSArMbn/CI32qXg2Jmwnu6IxxwlumU/l6bgOAv4nN3lQzrOcHE2
	U99Dj4A==
X-Google-Smtp-Source: AGHT+IHH9/J7sptbL1Cp0bAus4GBwHUgnmlfkgFvU1ch0096H5hv3XDFYHuGwQtRcOasE80UGEVl3WtvpxU=
X-Received: from plhw5.prod.google.com ([2002:a17:903:2f45:b0:234:a456:85ba])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3bd0:b0:234:aa9a:9e0f
 with SMTP id d9443c01a7336-237d9872225mr62675575ad.23.1750444832810; Fri, 20
 Jun 2025 11:40:32 -0700 (PDT)
Date: Fri, 20 Jun 2025 11:40:31 -0700
In-Reply-To: <4m25vi2w2r4zfmck4giiqryy64etpfvozyqifv4f3i636i7i2o@erv7a6wrtvyy>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cbee132077fd59f181d1fc19670b72a51f2d9fa1.camel@intel.com>
 <aEyj_5WoC-01SPsV@google.com> <4312a9a24f187b3e2d3f2bf76b2de6c8e8d3cf91.camel@intel.com>
 <aE+L/1YYdTU2z36K@yzhao56-desk.sh.intel.com> <ffb401e800363862c5dd90664993e8e234c7361b.camel@intel.com>
 <aFC8YThVdrIyAsuS@yzhao56-desk.sh.intel.com> <803d857f730e205f0611ec97da449a9cf98e4ffb.camel@intel.com>
 <t6z42jxmbskbtiruoz2hj67d7dwffu6sgpsfcvkwl6mpysgx2b@5ssfh35xckyr>
 <aFWNLZQ7pqQahdEh@google.com> <4m25vi2w2r4zfmck4giiqryy64etpfvozyqifv4f3i636i7i2o@erv7a6wrtvyy>
Message-ID: <aFWrH5EYg5ljBwNZ@google.com>
Subject: Re: [RFC PATCH 09/21] KVM: TDX: Enable 2MB mapping size after TD is RUNNABLE
From: Sean Christopherson <seanjc@google.com>
To: Kirill Shutemov <kirill.shutemov@intel.com>
Cc: Rick P Edgecombe <rick.p.edgecombe@intel.com>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	Fan Du <fan.du@intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, Kai Huang <kai.huang@intel.com>, 
	"quic_eberman@quicinc.com" <quic_eberman@quicinc.com>, Dave Hansen <dave.hansen@intel.com>, 
	"david@redhat.com" <david@redhat.com>, "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, 
	"vbabka@suse.cz" <vbabka@suse.cz>, Zhiquan1 Li <zhiquan1.li@intel.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "michael.roth@amd.com" <michael.roth@amd.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chao P Peng <chao.p.peng@intel.com>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, Ira Weiny <ira.weiny@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, Vishal Annapurve <vannapurve@google.com>, 
	"tabba@google.com" <tabba@google.com>, "jroedel@suse.de" <jroedel@suse.de>, Jun Miao <jun.miao@intel.com>, 
	"pgonda@google.com" <pgonda@google.com>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Fri, Jun 20, 2025, Kirill Shutemov wrote:
> On Fri, Jun 20, 2025 at 09:32:45AM -0700, Sean Christopherson wrote:
> > On Wed, Jun 18, 2025, Kirill Shutemov wrote:
> > > On Wed, Jun 18, 2025 at 04:22:59AM +0300, Edgecombe, Rick P wrote:
> > > > On Tue, 2025-06-17 at 08:52 +0800, Yan Zhao wrote:
> > > > > > hopefully is just handling accepting a whole range that is not 2MB aligned.
> > > > > > But
> > > > > > I think we need to verify this more.
> > > > > Ok.
> > > > 
> > > > In Linux guest if a memory region is not 2MB aligned the guest will accept the
> > 
> > What is a "memory region" in this context?  An e820 region?  Something else?
> 
> EFI memory map entry.

I forget, for TDX, is the EFI map built by guest firmware or by the VMM?
