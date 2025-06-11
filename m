Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7346726B084
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 18:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749665639; cv=none; b=U1xlJUiYheMqBZYBhRSykd9Es9oTk5VP+WhAueESDAs+OS51soAPnM0t5ijhsWLICqyidaauBppyu/EWB90xPRbNmnRVlK2ZRvPxAsOa19NpBX7UwLPepFW6XRO1MEJBinQ7bZT9ctE3MkM10FcRyJknUpSssmVmam0nQ8brjM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749665639; c=relaxed/simple;
	bh=IeatVXM/VPJssVAVzMs9KocuyEJiD/TQkBaPU8yqP9M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OHwyamdFttmI5MEDMd3Q+pR+YCDjVGBsQGTne4A9bMdsZPu2GPBh2RPNoMbFGTcPSxeoVM4ZXrincCqvPmCqwof8aZyEd2JNiTK257DMToKOFnNlypfyTYBSulQvAgrwYx/m4yBKrzBhPGSE0LIobaHJL7vHBoUxMmpyyB/la/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ndzXYe66; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ndzXYe66"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-30a59538b17so121760a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 11:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749665636; x=1750270436; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9AP2CEelaM2vm+ln8/2uTSplrSdzavfE46dg+YRKF6M=;
        b=ndzXYe668sooADCn2WBwnrVPfUuujajE2G/4oR3/zAGlUEJXQjNsMC57m+vsx6zntP
         Kkr3mZVEOhYtnw3Di0PGZ7OI2MhRhckGWQHVqfDhE2HTZ6pYtSGMMXBKNNSj25nrzmP7
         Lb9opzc1hVnkI9WT+kfkVMiM9pcIuVjSwmNP3j4gA3a/W65AE12OejD8Lt20wNE1tDY1
         w04c2q2L+8f1xEPcajzCxHcwdtrEp0Rq43qJ9XpQKpsyRu7TDFwnyT4qfmwU7AqzOLVg
         aeZYnW45LDcbO2Ewn5CJp0gTuZKLmaqnYtc2AvAYj3xw6OPmvieh8nk0PX9r/LSZ/2Jb
         8lKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749665636; x=1750270436;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9AP2CEelaM2vm+ln8/2uTSplrSdzavfE46dg+YRKF6M=;
        b=EtFINc+/ggfgMklJHFlr6VKRL2iaRKle3sDnD5NiDLPTrICDXd69JNzP6RHeaet9WX
         3wI0pxiFkoQR4FZH4FiVbH1j2tosJxpZ+ksvzzQlPmA3fIA6okYHyKBuFtT4x4adXmMf
         Vvm32N2EHMMmhmzJCfy2EnrG5jtRXfUcxva7T3Tv6vpLUroOaMmG1jb7tsYJVxrwbpGB
         y47NfK4Vu5pqBbhT6XiaSkshYNH5fOwWwJ/mZ6eIUczv4ARyzeaR4xmHWUBuJNML1niV
         Ux9pLIRBjzoFdnRIPtKzXnvlSQdQ+NKtBJueqMzucnRq4Y17tGGtycq8Yt6etqgvuSEk
         HOSA==
X-Forwarded-Encrypted: i=1; AJvYcCXPs26MRm/XSdqK82im3XQ/fYWmqG+RqanC7eD37GRihiJGXT0tmXmhHkcTkaavew6NTRC7LGIxK+ZxezE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy1iVUww5vUXlI43/IfF58AowZbBK9Yht7JmFx9MIjJdMp3m/T
	uyUE//cb0PLuNEa4nzjUs0crpJYe4bBJ5cUsyopfRi/Fd2idRPHM4sROy8nsYpb1/9zjU5al9cv
	BhZO4Rw==
X-Google-Smtp-Source: AGHT+IFHVGTO4vjh2VGjTQJUjZQ7j92tMCP8tpw8KYudlqm/NMDL6qN15xcu4YOSiQLv7dKLIC6IDIM5PMg=
X-Received: from pjcc3.prod.google.com ([2002:a17:90b:5743:b0:2fc:3022:36b8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5410:b0:312:e6f1:c05d
 with SMTP id 98e67ed59e1d1-313af0fce66mr6663752a91.2.1749665635713; Wed, 11
 Jun 2025 11:13:55 -0700 (PDT)
Date: Wed, 11 Jun 2025 11:13:54 -0700
In-Reply-To: <089eeacb231f3afa04f81b9d5ddbb98b6d901565.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250610021422.1214715-1-binbin.wu@linux.intel.com>
 <20250610021422.1214715-4-binbin.wu@linux.intel.com> <ff5fd57a-9522-448c-9ab6-e0006cb6b2ee@intel.com>
 <671f2439-1101-4729-b206-4f328dc2d319@linux.intel.com> <7f17ca58-5522-45de-9dae-6a11b1041317@intel.com>
 <aEmYqH_2MLSwloBX@google.com> <effb33d4277c47ffcc6d69b71348e3b7ea8a2740.camel@intel.com>
 <aEmuKII8FGU4eQZz@google.com> <089eeacb231f3afa04f81b9d5ddbb98b6d901565.camel@intel.com>
Message-ID: <aEnHYjTGofgGiDTH@google.com>
Subject: Re: [RFC PATCH 3/4] KVM: TDX: Exit to userspace for GetTdVmCallInfo
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "mikko.ylinen@linux.intel.com" <mikko.ylinen@linux.intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kai Huang <kai.huang@intel.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, Jiewen Yao <jiewen.yao@intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Tony Lindgren <tony.lindgren@intel.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	Kirill Shutemov <kirill.shutemov@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025, Rick P Edgecombe wrote:
> On Wed, 2025-06-11 at 09:26 -0700, Sean Christopherson wrote:
> > > GetQuote is not part of the "Base" TDVMCALLs and so has a bit in
> > > GetTdVmCallInfo. We could move it to base?
> >=20
> > Is GetQuote actually optional?=C2=A0 TDX without attestation seems rath=
er
> > pointless.
>=20
> I don't know if that was a consideration for why it got added to the opti=
onal
> category. The inputs were gathered from more than just Linux.

If there's an actual use case for TDX without attestation, then by all mean=
s,
make it optional.  I'm genuinely curious if there's a hypervisor that plans=
 on
productizing TDX without supporting attestation.  It's entirely possible (l=
ikely?)
I'm missing or forgetting something.
