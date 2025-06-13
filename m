Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86E91885B8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 00:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749775467; cv=none; b=dSMtPY/zhbqqdIJvmxGNJ6FEawxgNba6B+KhasY9gWVeTqydWWDMHhZ7rdXs8cnGzh768Ab6VmUAabdWLLh5+L4RST1qGHZGo5+9+j4H1wEhJK3DA06bI2uE9b5d1P3KtcC7bj/ef8ofmbSWrjVeUv04iKA8tyAz2W95J52pYmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749775467; c=relaxed/simple;
	bh=qjV8I61m5Ce+7fcZ155IHQqOvBkqUUl+LFanirdTQpg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LaoUAnfRYiKDVXIE7ySZN+4/YBGcJb38xBShcH9R3ZYIzQqStdLP9F0CqIRKwP4daW/X7lgf7PY6W8rGBKk82Ev7ve9mrIbkHaU9eS+6Fl4y4Zsd8Q6N0rxjMwzIv62ymOAuEQLKsO8N4Mqk2IjykTAxRq/FQynJ/BHhFV3yJhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NMRIynpM; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NMRIynpM"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-235dd77d11fso13263475ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 17:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749775465; x=1750380265; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NoDP1PzJo+JhoHPqRKT7Ls4qXBOrUxSG8VSYNnYgfDU=;
        b=NMRIynpMXy9EbSo1EqWCegq4z2qOy9JZWn3MbAaFzWC3MaDGpXYfnBKEvi8/MIw2m2
         Ke0wdVI149oacd+d6vHGICjIRDjx7NJ/S6398/mJbW6cvHpG6XxVwgyLdPYK1+eb6QFj
         aL4Gr10CDFqCetXgSuINjApB67TGtFrWl00be71YE4ULxskjduiigxPbyxTim9G3AYW+
         12dG7tSNnLv8C6R+TXEiMi+OXCx330AyTvG7NlCGhr8pmGky6t6RvEpi9zFOwilnSGjH
         7ENtRrqtQXf+WEdcdQEL4hbOZT0v8I7UgZ9dpUvXeqodokg/knfeV/FBST42/WwZq33o
         4xpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749775465; x=1750380265;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NoDP1PzJo+JhoHPqRKT7Ls4qXBOrUxSG8VSYNnYgfDU=;
        b=E9L8eTNmkWVOr02uzVDzgD56kHJzZzwyXI3gLm9qNYt7TLeaOuLmxYCHEOO1WMikzL
         vh1G0w1HPugulyGh0pcVoYlOF5WnSy18KV9IPQ24ZBnZo+nf03F5ohqggSraVgRugcWg
         qwvu1Oi4BgrfO42iTLStZQt5uEm5MfHQaK0K2yEZyArag/hI9O50dur/WBLKvwtjouTU
         DUgiIgaxUNFD8u6WvBE0RXVqyStIESlaemqvmGtJ2nt0GguCML8i0CJtbAc2cAM7E4jD
         ryvyViVOejTmGPgLRRlZjlCdmL3zu5xsBeP/qsbn/vVO3DTklaDXRceV8LJ4Ye6huPPF
         1dxg==
X-Forwarded-Encrypted: i=1; AJvYcCVsYM2HsCqvKVff0oxkfpEJ6bBAYKknrJajAONGfIq516kYPF19JYsxKKk6DcUVYtKuaJugPLBZxk3CBic=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqGZIYs1b3W/ROzq36P93GBqfrJ4jhYjdtbiMg3oeVL8O8e00i
	laVJwEH9x1A4glvIvF58fUkC5ZIhD5Hs6hJhTcyE9Wnv0qMAeady3GjkjdGlJTxE0HIqXtNNuRK
	VD2M5AA==
X-Google-Smtp-Source: AGHT+IFiMHcR7v7YOleAgZOGqiF7s3lQ/RilLV7anOXAIv/Wn2gruQs9wyGFklb+9A85XAYEbjcWfiQ86zA=
X-Received: from pgar12.prod.google.com ([2002:a05:6a02:2e8c:b0:b14:df7a:ff1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:41d2:b0:234:a139:1203
 with SMTP id d9443c01a7336-2365da0bbf3mr14996075ad.32.1749775465048; Thu, 12
 Jun 2025 17:44:25 -0700 (PDT)
Date: Thu, 12 Jun 2025 17:44:23 -0700
In-Reply-To: <d9bf81fc03cb0d92fc0956c6a49ff695d6b2d1ad.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aCcIrjw9B2h0YjuV@yzhao56-desk.sh.intel.com> <c98cbbd0d2a164df162a3637154cf754130b3a3d.camel@intel.com>
 <aCrsi1k4y8mGdfv7@yzhao56-desk.sh.intel.com> <f9a2354f8265efb9ed99beb871e471f92adf133f.camel@intel.com>
 <aCxMtjuvYHk2oWbc@yzhao56-desk.sh.intel.com> <119e40ecb68a55bdf210377d98021683b7bda8e3.camel@intel.com>
 <aEmVa0YjUIRKvyNy@google.com> <f001881a152772b623ff9d3bb6ca5b2f72034db9.camel@intel.com>
 <aEtumIYPJSV49_jL@google.com> <d9bf81fc03cb0d92fc0956c6a49ff695d6b2d1ad.camel@intel.com>
Message-ID: <aEt0ZxzvXngfplmN@google.com>
Subject: Re: [RFC PATCH 09/21] KVM: TDX: Enable 2MB mapping size after TD is RUNNABLE
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "quic_eberman@quicinc.com" <quic_eberman@quicinc.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Fan Du <fan.du@intel.com>, 
	Dave Hansen <dave.hansen@intel.com>, "david@redhat.com" <david@redhat.com>, 
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	Zhiquan1 Li <zhiquan1.li@intel.com>, Kirill Shutemov <kirill.shutemov@intel.com>, 
	"michael.roth@amd.com" <michael.roth@amd.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, Chao P Peng <chao.p.peng@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "vbabka@suse.cz" <vbabka@suse.cz>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, "tabba@google.com" <tabba@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, "jroedel@suse.de" <jroedel@suse.de>, Jun Miao <jun.miao@intel.com>, 
	"pgonda@google.com" <pgonda@google.com>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025, Rick P Edgecombe wrote:
> On Thu, 2025-06-12 at 17:19 -0700, Sean Christopherson wrote:
> > > I think this may need a guest opt-in, so the guest can say it can han=
dle
> > > errors for both smaller and larger page size matches. So it may not
> > > matter if there is a rare usage or not. If KVM finds the guest opts-i=
n
> > > (how to do that TBD), it can start mapping at the host level.=20
> >=20
> > Hmm, clever.=C2=A0 That should work; requiring an updated guest kernel =
to get
> > optimal performance doesn't seem too onerous.
> >=20
> > > If KVM doesn't see the opt-in, the guest gets 4k pages.
> >=20
> > As in, KVM doesn't even try to use hugepage mappings?=C2=A0 If so, this=
 idea
> > probably gets my vote.
>=20
> Maybe an "I can handle it" accept size bit that comes in the exit qualifi=
cation?

Eww, no.  Having to react on _every_ EPT violation would be annoying, and t=
rying
to debug issues where the guest is mixing options would probably be a night=
mare.

I was thinking of something along the lines of an init-time or boot-time op=
t-in.

> Yan, do you see any problems with that? Like if a guest passed it in some=
 accept
> and not others? Thinking about the new "unaccept" SEAMCALL...
