Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A666ADD
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 17:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748884086; cv=none; b=Ih7h+vExkVpNzC9qRTJwjYmv6XDoVL2e80ZoGVnhxMyZ+0YRzCwBpOeH/n7r4hJ3JTXN6Rv+1eYV62oKOb8PTOGnSTrbcdCp02JAIsJH3oReWKZ98uisOJlJuGSHklkCt7D81/do0WCA0sy0/s/j0B6F5Pa8CyYE+yk2aCvJV88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748884086; c=relaxed/simple;
	bh=+WvDBTQGgVcJ4+48hvjRRqUcYgzGsQGUF27/OrTHv5o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sJ2CQ+WMlpMk5cOl/omKhSfkPnxvhQbLYNMaDLAKvs1P2G+c84LKrIZ8ZaVskfm5hgujHCGWEvmdUDjmnlwGnV7uFGR/+x2jt0QT3DXwGT1NGSZ7yrXDt4iLgw6f8GuOoMXC3hsPHmEC0sURlfbCe8I9hQxRpxfhAjeR/78t3Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eob+SzUP; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eob+SzUP"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-747d394f45fso1503305b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 10:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748884084; x=1749488884; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ydlOhEkRopFxTeDK5Q649uIqLSzngVdlEEZytCet2UU=;
        b=eob+SzUPtE3ImVsCeAyZg6ziFCJNEJxczLkKMgOLoizfQLj1/2GwEuwsrwloJNo1eD
         EB4FwpVPCeGUVecMIQ7SDOy/sLKxZfVpDepv8JUlLwzKBpkwTTL4ZRfMf5Mdjyx+vmBq
         nfunpXzFuql1p3hrAS8RVx9cW1cuKwW71tYqzYiEnISBkRr1hxhaoVBsUPJuzE9zY5hw
         v9tAhVH2Oe6tlnW24zbWe5Fw01yZJTZf/XlNIRNSDtWRA9BmN7oVMJti1vIPl6gASew2
         V5ERA0LAsGtuntjWSLlk3CvT8S3yQUngo1AxRBYuNwCvlGd21I/4zGblkuOa4FF4z/FG
         OnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748884084; x=1749488884;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ydlOhEkRopFxTeDK5Q649uIqLSzngVdlEEZytCet2UU=;
        b=rFMm/hIgqg6AH0to1RHZhRiGbgREfT+WfQgk6UeGH+6uqjvmh8VB6EeflQ3m36vN2I
         kevgp+kJ0IE6q5GPGyu2GCyBTWKIgJ6xCK7rd8oIiDMu5mBWd/PXfnI5GDu791QdpTBu
         /ef7KMmi7+m9scuuFYaWv2d51sNplO2QjblelnO1ek24X3MTtB/fBJ/1sjd9/wQveJRd
         u2MpniEGjH5tjRZdfiMd3xzhMU8nhlndWZxD6CEcgyRvSYU67+51eBNr19KLic58/AlZ
         U9BhyuiFCKFPPb1l9NDQDfcIB9oApH0YrdzzUay0CLN23le7knxVOe4eK8S2KkVAfQUt
         +E3Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1VydzwiCSF8hmJ4Cc0jtBBCp7nwmT+n+OHXlAsqit3OY42V8dUmoAP5jjK9Y812YxEJfPXDmspg+YlzI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwveygFWWmWD9i9RCsF7tzq/steFRVTr04gBqxny1ibR+E6lEjP
	OqoDKVu87+PbPn2tmqO+TsPH6ds5uqiZf8D9nz/+G7NWTWpb09ucTalzGQcmQHMaIVQiY7fFLLw
	T5i3kfg==
X-Google-Smtp-Source: AGHT+IF5TZWeKQm22/4S72UXWjGujgvsZqXcKchu15yQOBD2jnBt1xngILSWHoW56WuJMyOtVuiL0dTcYe0=
X-Received: from pgbfq4.prod.google.com ([2002:a05:6a02:2984:b0:b29:bc7a:8aa2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:339f:b0:1f5:8e33:c417
 with SMTP id adf61e73a8af0-21adff48c6cmr20699816637.2.1748884084082; Mon, 02
 Jun 2025 10:08:04 -0700 (PDT)
Date: Mon, 2 Jun 2025 10:08:02 -0700
In-Reply-To: <e5e1fb2715a98f24ba69cc4da5c30777633f6f62.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250529234013.3826933-18-seanjc@google.com> <e5e1fb2715a98f24ba69cc4da5c30777633f6f62.camel@gmail.com>
Message-ID: <aD3acnURwE7am7gf@google.com>
Subject: Re: [PATCH 17/28] KVM: SVM: Manually recalc all MSR intercepts on
 userspace MSR filter change
From: Sean Christopherson <seanjc@google.com>
To: Francesco Lavra <francescolavra.fl@gmail.com>
Cc: bp@alien8.de, chao.gao@intel.com, dapeng1.mi@linux.intel.com, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, pbonzini@redhat.com, 
	xin@zytor.com
Content-Type: text/plain; charset="us-ascii"

On Sat, May 31, 2025, Francesco Lavra wrote:
> On 2025-05-29 at 23:40, Sean Christopherson wrote:
> > -static_assert(ARRAY_SIZE(direct_access_msrs) ==
> > -	      MAX_DIRECT_ACCESS_MSRS - 6 * !IS_ENABLED(CONFIG_X86_64));
> > -#undef MAX_DIRECT_ACCESS_MSRS
> 
> The MAX_DIRECT_ACCESS_MSRS define should now be removed from
> arch/x86/kvm/svm/svm.harch/x86/kvm/svm/svm.h, since it's no longer used.

/facepalm

All that work to get rid of the darn thing, and then I forget to actually get rid
of it.

I also failed to remove the msrpm_offset declaration (and its size macro)

  #define MSRPM_OFFSETS	32
  extern u32 msrpm_offsets[MSRPM_OFFSETS] __read_mostly;

which are dead code as of "KVM: SVM: Manually recalc all MSR intercepts on userspace
MSR filter change".

Nice catch, and thank you!
