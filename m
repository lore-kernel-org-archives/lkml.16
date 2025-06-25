Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D3826158C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750859920; cv=none; b=uDWRxAVHpcEEkc4W2+CMUxTBP0k/nmujKZaAQt842onH40ePf+ssjva+2vg8X9DFQY9InrFXM8Tm3/0ZdR2dAu0jcMB3XQzZG5vPgzoIQN0vLPNKGq4+uMKVjnbk6Wwcqe8KeUufMBXYGT46EEMIr9UgZcPORYU0gMvXQlFv7kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750859920; c=relaxed/simple;
	bh=xwmzEUlG2R7xVazTb9/Jc2Qom2RBZMVFZfDlBmoQ4Mg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iZYir5gGLrHW8w69EMYp8g6P3I89vC5Uesb8UEUWzJznSdPpYWZiuf293Da73cOHWHow1HtUq/xPWB3j26Z2gNhpQNfeDqrF5YMMfBY2prqWnXRJq1qgiNIPsG/hUW1A0scECBZXj4kJzb/umm3dFQa1BlbcFHoAaaf2ptNQDEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HSmzJqf6; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HSmzJqf6"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b2eeff19115so2324613a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750859918; x=1751464718; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qP1LjaQLH363yLgNr/FeUMdQPTa16fdKsNMB8w7jtyQ=;
        b=HSmzJqf6nAwXz/5/uurEDPD5UP+rjklQKQZQGJRLH7jgVCHZP7S6UCJz2sCb/t/gf1
         Jp/nMYQQwJwCApFeW4p0h1CsylCUaZypkKNON1yG6GTOmCXNMzctY+gfjwIeds226uKt
         bE1gjsWRl+PfsJuT8mfWe/ZXBGunA9znH8/jPapCfLiHO2oyx6uyin3kGjpZklHLUF81
         QFnIkvHjUVrUBFfB1Wyf81f/q4L2CTGKJKcrzJjHrexz2m5IAN5eNO0UYrlh1oQ592ev
         0i3RHqHaHMel42KqYb32hIVead70ldij1bjdKlzBpK+H95mnTGUXF/xS5XGpbycZaQrB
         KIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750859918; x=1751464718;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qP1LjaQLH363yLgNr/FeUMdQPTa16fdKsNMB8w7jtyQ=;
        b=RgzivP4Vj2U5nvVYbdBbz07zRiR9xKa9yiyH2Fg6ruWyM2puTPFmM0xPCzuepVs4ff
         UVcvgoBHhKSDGjOZ7LERkkmUDxPqTivvojihkTWwI399LRE9hqg2i05LjClwsI8UAJIu
         Xsg09W3tunQ4/xEs/Yd48MOtb3AVRqu0tcIC8YJTXj3m42KvE79MgLf1dzsdVTVxK57d
         7oQny3K6zgb3x1r88Ec1ais2U1dIWE1YOKpmypfS9Vj8DBpRrm2LlL8dSxrGEE2SBtJO
         PZfRqJkPuqZ1fdzvbwgSSoIe5ujyx/hMAvK6BeWx6qbiMW5IzN59hIRRCcaCKLT8tz80
         iIaw==
X-Gm-Message-State: AOJu0Ywq2FU1hF1LG99nkSlTrAMkGNz3TFF8e0tpwXyKHafpd4EK8LsB
	rRsqrOXqDymRdz2Mj1MOHpvdT9/NKFViXxyOZ8eoIJanNcFteeSOr8fPLBl1Q8zoK67Y+q1Vj66
	u2GZwHA==
X-Google-Smtp-Source: AGHT+IFfkRs8pTU1cqMi3anm83+ieWHKSGcCAn99oVQttbpqmHod9vPFoo3AfSmdUW1/AgkE+CjFGYOK2xk=
X-Received: from pjqq16.prod.google.com ([2002:a17:90b:5850:b0:313:245:8921])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:55cc:b0:311:fde5:e224
 with SMTP id 98e67ed59e1d1-315f25ce93dmr4245772a91.6.1750859918426; Wed, 25
 Jun 2025 06:58:38 -0700 (PDT)
Date: Wed, 25 Jun 2025 06:58:37 -0700
In-Reply-To: <20250610175424.209796-11-Neeraj.Upadhyay@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250610175424.209796-1-Neeraj.Upadhyay@amd.com> <20250610175424.209796-11-Neeraj.Upadhyay@amd.com>
Message-ID: <aFwAjaTeqHco2J-c@google.com>
Subject: Re: [RFC PATCH v7 10/37] KVM: lapic: Mark apic_find_highest_vector() inline
From: Sean Christopherson <seanjc@google.com>
To: Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>
Cc: linux-kernel@vger.kernel.org, bp@alien8.de, tglx@linutronix.de, 
	mingo@redhat.com, dave.hansen@linux.intel.com, Thomas.Lendacky@amd.com, 
	nikunj@amd.com, Santosh.Shukla@amd.com, Vasant.Hegde@amd.com, 
	Suravee.Suthikulpanit@amd.com, David.Kaplan@amd.com, x86@kernel.org, 
	hpa@zytor.com, peterz@infradead.org, pbonzini@redhat.com, kvm@vger.kernel.org, 
	kirill.shutemov@linux.intel.com, huibo.wang@amd.com, naveen.rao@amd.com, 
	francescolavra.fl@gmail.com, tiala@microsoft.com
Content-Type: text/plain; charset="us-ascii"

On Tue, Jun 10, 2025, Neeraj Upadhyay wrote:
> In preparation for moving apic_find_highest_vector() to
> common apic.h header, annotate apic_find_highest_vector() as
> inline.

This is way, way too fine-grained of a patch.  If placing the helper in apic.h
is the desired state, then mark it inline when the code is moved.  
