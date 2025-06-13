Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED82C1885B8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 00:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749773980; cv=none; b=fWsjlnCRUdmnJ/HcNTGrWuVkt4BYSQbHkavRXQSHUmHHZyu5N5jsnv2Qav+Mhv0xpvUlrHP7CsdoHqgW82ZTTZTEUOD/u5JaO+s1NssnYau6S3FVmdULkFdyEzf2tY8KTLVOI5IZSa5HcxaVoceM2okyJgBan6rm6d8uZg0Guxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749773980; c=relaxed/simple;
	bh=XKX29iWpKhMQompHnBgc4Myn5jWYJDdT+waJrSl6fzc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EyacQRnD+Rj8zP7in6IMbJw8XSp+fNwqbkDYZopPQrzdwjycEFE5LGzw4PD1tqnIp34uWxE1J7C1tCiwr/GEPdo/98RjjWLNHXSp+OByYb87gSf7qn/Wqdw/MmmrrzeHK79u2aWLnHVfDTBL+GV0u0tCH8mAa0hWFbKXL4wdC7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=evBAP4J6; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="evBAP4J6"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b26e6b84a31so931753a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 17:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749773978; x=1750378778; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zBXdLKf3EEYV1ASkezHpDPB0kJtg+7zVKaBfxM4yoCM=;
        b=evBAP4J6jgkQysXauVhvsI++1Q8WFQeVqPNed61ULxbbkWQcixjnKBAhNxJTkc24JV
         CLuwAjshcdo56v1m8z8fhzra0dlN0L1qkACA5xU1LF/87i1ZXDW/hdkD1BoD2GK9wmnH
         GhRiUuiNHE6Ee2nbtEga22jy+VO8N33zFz0Vk5xvK3NQYxGRBBlyBG+2IB+5GYCjwpm3
         0ba9J6f4NQI5EMY+tFHrnEGcf9J51TPlBrdzjmak4JLYRBUAVN366ehtWZ67S1VrMqJz
         OoJu/wYUb6Db2JlVclynrrf/0+9+i0mGVn+Lr4h0aO0BrkwA3OOewZfb02f///2WESpc
         zbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749773978; x=1750378778;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zBXdLKf3EEYV1ASkezHpDPB0kJtg+7zVKaBfxM4yoCM=;
        b=gmeGeWsgHIe74XA3zdaWCz1rs5Wmb+WKdUYTDTv065fBvOqOROK2n2X/C3R0hjo6vw
         izswQ59slMTrZ0LE4mZjfDBEtM6+Uh/zvvtEmzHs/VH8U9gCkecYDubUUU9v7d6YAWWZ
         wkeRwoGOTB5aDXR7o8l09kn4C2w3d6QiKGXUQZg/rYrB23cMfOy+arKDRBxw0b9NovbO
         XOjexrP1DuHa9NK+CLmKjK3d16n8zo+W5tg0dz7YG2Y6HxV2JkoFYOC3qC8OlsaKve74
         SmXqPmjyVUXSkppJCjKiHYQNX1/oXWVH7zmANfd+Po6VZOgo9D1Tz+B+xjygzdUWzIwv
         t4Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVaHDfKcCtPS1Kxmy8i7Y38jCDzwd7Bd4KlEyLpwbpLGVR6iTtfjzIdFfjRlniUmNp5M1G0xo9wArB8ELc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHpz1oVJCuunr5O2kiu46ivQGNNIgkrt+GEniJQkeTIR7l3hcZ
	nEHN/z6V+kKdhJKUksJnTb6HTJdt9l9bbHITZskUPaMo1AGo4BdFxkyqLhwu9uR3yH4vRd48VID
	+3yiZeA==
X-Google-Smtp-Source: AGHT+IF0k1+tIZDVtopDDRGGLH/11kf76s150e/KNVxM3GDrSe802uK39miuCbgBaj11TWbqb+85X1tW07M=
X-Received: from pgbdh21.prod.google.com ([2002:a05:6a02:b95:b0:b2e:b370:6975])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:999a:b0:216:5f67:98f7
 with SMTP id adf61e73a8af0-21facc87cc7mr1099362637.33.1749773977713; Thu, 12
 Jun 2025 17:19:37 -0700 (PDT)
Date: Thu, 12 Jun 2025 17:19:36 -0700
In-Reply-To: <f001881a152772b623ff9d3bb6ca5b2f72034db9.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <dc20a7338f615d34966757321a27de10ddcbeae6.camel@intel.com>
 <c19b4f450d8d079131088a045c0821eeb6fcae52.camel@intel.com>
 <aCcIrjw9B2h0YjuV@yzhao56-desk.sh.intel.com> <c98cbbd0d2a164df162a3637154cf754130b3a3d.camel@intel.com>
 <aCrsi1k4y8mGdfv7@yzhao56-desk.sh.intel.com> <f9a2354f8265efb9ed99beb871e471f92adf133f.camel@intel.com>
 <aCxMtjuvYHk2oWbc@yzhao56-desk.sh.intel.com> <119e40ecb68a55bdf210377d98021683b7bda8e3.camel@intel.com>
 <aEmVa0YjUIRKvyNy@google.com> <f001881a152772b623ff9d3bb6ca5b2f72034db9.camel@intel.com>
Message-ID: <aEtumIYPJSV49_jL@google.com>
Subject: Re: [RFC PATCH 09/21] KVM: TDX: Enable 2MB mapping size after TD is RUNNABLE
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: Kai Huang <kai.huang@intel.com>, 
	"quic_eberman@quicinc.com" <quic_eberman@quicinc.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Fan Du <fan.du@intel.com>, Dave Hansen <dave.hansen@intel.com>, 
	"david@redhat.com" <david@redhat.com>, "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, 
	"vbabka@suse.cz" <vbabka@suse.cz>, Zhiquan1 Li <zhiquan1.li@intel.com>, 
	Kirill Shutemov <kirill.shutemov@intel.com>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>, 
	"michael.roth@amd.com" <michael.roth@amd.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "tabba@google.com" <tabba@google.com>, 
	Chao P Peng <chao.p.peng@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	"jroedel@suse.de" <jroedel@suse.de>, Jun Miao <jun.miao@intel.com>, 
	"pgonda@google.com" <pgonda@google.com>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025, Rick P Edgecombe wrote:
> On Wed, 2025-06-11 at 07:42 -0700, Sean Christopherson wrote:
> > If there's a *legitimate* use case where the guest wants to ACCEPT a su=
bset of
> > memory, then there should be an explicit TDCALL to request that the unw=
anted
> > regions of memory be unmapped.=C2=A0 Smushing everything into implicit =
behavior has
> > obvioulsy created a giant mess.
>=20
> Hi, still digging on if there is any possible use.
>=20
> I think this may need a guest opt-in, so the guest can say it can handle =
errors
> for both smaller and larger page size matches. So it may not matter if th=
ere is
> a rare usage or not. If KVM finds the guest opts-in (how to do that TBD),=
 it can
> start mapping at the host level.=20

Hmm, clever.  That should work; requiring an updated guest kernel to get op=
timal
performance doesn't seem too onerous.

> If KVM doesn't see the opt-in, the guest gets 4k pages.

As in, KVM doesn't even try to use hugepage mappings?  If so, this idea pro=
bably
gets my vote.
