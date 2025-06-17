Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828B82E06FC
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750167317; cv=none; b=Sw+DxgwgYuehVMJAbX7+uplzugPXkZ5lhP7s44QdPyGIMWY92/ozvdZOJqWDjABJ7yH12CyEp8zzmWWkTbkUgnD2mupH236ex8r6KzAiIDbi5qaq4EeD7TpEttieTOsivgdfNuSuhwhqTTqBxMwyaFaByFbT0N0y/4yn0ZZuoLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750167317; c=relaxed/simple;
	bh=3J7LvW5RNqE+39eKEobGL/0umKo2mKcLNR46Sih0jJ0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lZBnQ/wF6ZnXDdau9JMVqDT8ftstYLNxV6OdgAB7t5+Cdbs27RuL55rKRS9q55y2EwzAfBiizb+6ARgTUuWrwUdGT+VFh+2IhIXudnc7OgCbRY2hSG24B5tbS4h1OlyILiEzQk1/QtdHnRMFRV8rCPjiIVgNmDjBzPZrowcsOzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x2xryWX9; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x2xryWX9"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-748cf01de06so1358228b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 06:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750167314; x=1750772114; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uye/GAu8no+PcGbBRYirIpHxbOuu35ESQDvMeTfQe2M=;
        b=x2xryWX9thO0cL1Zb2ZBwabDiMwmHZKAAdW3q1MJcSMeQTKgf9WBuLym9qmIj3dttu
         3+OO70Ls/N2AivX/m+EGzQHjpYTGNfWwNoBbphfpzs8FCE257N2YimciHfTbTBIDZwX9
         UE2PXayRotbeHuIdBS/MHpVb77P8YgB3qr7kNMSTM4hnCDaov+khKqqip+KMqAjMyiL7
         jHFfYqGFh0s4+21y7V4bpv2baQCFt4ULVhnxmBeo/ZlRSmQXaylRsfESkOOcJ40XxflY
         zQfY1SkK8KpOoShenn3OPWz2oPZ0XwrPr71hbN/7Vpq0OLDHvk/+yUt1+GhXAkUw8Gja
         Pygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750167314; x=1750772114;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uye/GAu8no+PcGbBRYirIpHxbOuu35ESQDvMeTfQe2M=;
        b=Yga4GcO3FU1oeRwMTTETuoRin0IrcV3RowziJaToTVjEAZVGNsAgW4N8sdUvaqLNUI
         Ae0LPs/DZi0807znvWgS5zYRbWuB/u+ARl5AA3EVb0IBY2TbxYU2CeVERBf0Fk50FRNs
         XF9p2SzuN9gLY68NzItwsnawsHXI9HLswooby0BBfPZUz2eELUIFySd6/3wcDjM21Gut
         ZAD3ds9Cei6FRI1/+Sn1NpAqat7i9lU0wsLgat9Gy4znNulfRwwuhmB21JdWmM6Tt9M2
         y/4o1d0TWPWphlprC5PwWQZKjiAY3+AtW255R6CaS90in3YiEkPMDkp+cGTthY8pMjsO
         1SKA==
X-Gm-Message-State: AOJu0YwEivyr8fBWsVq+FjouZwf+L89q/ZDuz0b1A+Sh25CKXm7F8lxq
	e7l2JNCNzKmtK0cEt18qa2Quofq68Wht8BDikMeaRMauI2Cha6kdDGNiGFuUC6Sbrw2FtcbLtEG
	ukpiEDA==
X-Google-Smtp-Source: AGHT+IHXJ1h76wPXLbi6KROt1OegMIlc8haOhKRalL32tULjTZV4Z0XlghudkokLH2oGGA0km7otLEkOAHI=
X-Received: from pfbef26.prod.google.com ([2002:a05:6a00:2c9a:b0:747:aac7:7c2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2e8f:b0:740:a879:4f7b
 with SMTP id d2e1a72fcca58-7489d174486mr17495902b3a.18.1750167313834; Tue, 17
 Jun 2025 06:35:13 -0700 (PDT)
Date: Tue, 17 Jun 2025 06:35:12 -0700
In-Reply-To: <20250617073234.1020644-3-xin@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250617073234.1020644-1-xin@zytor.com> <20250617073234.1020644-3-xin@zytor.com>
Message-ID: <aFFvECpO3lBCjo1l@google.com>
Subject: Re: [PATCH v2 2/2] x86/traps: Initialize DR7 by writing its
 architectural reset value
From: Sean Christopherson <seanjc@google.com>
To: "Xin Li (Intel)" <xin@zytor.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, pbonzini@redhat.com, peterz@infradead.org, 
	sohil.mehta@intel.com, brgerst@gmail.com, tony.luck@intel.com, 
	fenghuay@nvidia.com
Content-Type: text/plain; charset="us-ascii"

On Tue, Jun 17, 2025, Xin Li (Intel) wrote:
> Initialize DR7 by writing its architectural reset value to ensure
> compliance with the specification.

I wouldn't describe this as a "compliance with the specificiation" issue.  To me,
that implies that clearing bit 10 would somehow be in violation of the SDM, and
that's simply not true.  MOV DR7 won't #GP, the CPU (hopefully) won't catch fire,
etc.

The real motiviation is similar to the DR6 fix: if the architecture changes and
the bit is no longer reserved, at which point clearing it could actually have
meaning.  Something like this?

  Always set bit 10, which is reserved to '1', when "clearing" DR7 so as not
  to trigger unanticipated behavior if said bit is ever unreserved, e.g. as
  a feature enabling flag with inverted polarity.

With a tweaked changelog,

Acked-by: Sean Christopherson <seanjc@google.com>
