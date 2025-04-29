Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC01D215F6C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745938189; cv=none; b=GsIyX49eOvFcjvsWC0xA3RSsXdoEbPDweX/oHW/dCE2dv5bk/2XRnFUrd2pLesLDbV+Rd8rR6CRg7c9nVTMB9ne8Ttp/KUsj9PMb8F2IS3yDIXOUi+/uqDjHVz+HfqtlP9H+2hkBteDyIb0uwDqx3XYMOYeSR7JR6Ry3Iqtkbzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745938189; c=relaxed/simple;
	bh=zPKqDubqGQlbbZ0ERGazpJ4D1rDz8spLOm/r4Uz2J70=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=raS78pIlUbhcLhRbU1wlOhDuFhypaDQq/rikPdz5shHsr5JOuCJ753bAOtIxzlU74gZ/4bW+das2CCs61rdvWLDXd7y7BNexMmK0jRYgcEoStSUz8ggRt/mbuFvvBznSbdpxYgsWgx5467KX+EkUZK64ZauxixgAxH8yIdkWLxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zWLAEv8P; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zWLAEv8P"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-73dcce02a5cso3461240b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745938187; x=1746542987; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zPKqDubqGQlbbZ0ERGazpJ4D1rDz8spLOm/r4Uz2J70=;
        b=zWLAEv8PmUgMnNAstxttD1v9ti2O1GDd2QoqMajXyXJu2P+ERV9ieuSacdw6X5LgZp
         4TD4cgZGiiovQx/K0qrz4CyzAMRcxAzoNQw9rJYUIbd0amXyJ8tv87ybBjicYh16XryP
         Kb8yNa1+xn/kPMwy030Lsj97k6bb+V6rBP8vMbMnjeHKWNjgHlJBKnaFpEy7DRFDTseY
         7dR87hHSHtqR4x7DksTE+fIQy6gjI4RogOioUW7O8MNooEDO/uPbvf2HxhvNkBfvi14w
         p0GkD75U37F7NxSarfYrQ9tuJeAF79QxrhN3Tnjd8nxZW/ubWBh4utWfQkXUebeEhiAF
         o3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745938187; x=1746542987;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zPKqDubqGQlbbZ0ERGazpJ4D1rDz8spLOm/r4Uz2J70=;
        b=Mz9cNr/qnmGGTsud1pMHkQTs1aVUTe6bbchvWptlszZ1X89hQxp9yyE+ZFMJiQbCqU
         IncXETxY4bxZeNpegXISHWwlRqeOs01nl/48vVxcoowElVQz2YeRd5grLteTGc3aMbrA
         o65qkyaMaUNceoVwfQb+ghXzIpscflP6+hvNORk94Bkn5ss8S+jr1eqhGCpHGBe/r8tM
         2Bqvu0567o46OzhepSwWeLEBbz/I8FFhRnTjLgMp68XZi+rD0woRIY9jMYB1VW+82RDQ
         fkKVC070Ce6wKFjLXhVLHOMJ7vZk2rpNOIoo06PXYhMab0CK39SZxQpvdWxWiY/98ngA
         u37A==
X-Forwarded-Encrypted: i=1; AJvYcCVJnuk2MnojX1DPuNYrb+MNu7523mh5blnaZfk5p9iAane16Y4JTPTFQrBHfvOTOARz7zWv4TvYjNBAWOw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1k3cbTeG4AmBN+ZZu5uhSkVxoWz2RNny0UtmwbXhcdAGnGgz7
	8YpCD1T7cPJzYoImx/C1+OEit0tHMQpKPnm9ar2iIIAGwN3iA0ZyxziWYE2AZJBHv60/GuYLCMv
	hfp5yqtecKx2BA2ofBYlvng==
X-Google-Smtp-Source: AGHT+IEzQrNdrD5XZ5oQkHZCt1a4CsXs91g+AUEFyHlMqs7LdvOItt0h12zoq6RDItWNFBq3wzeuMH6n8vWHqqoYsA==
X-Received: from pfbbj22.prod.google.com ([2002:a05:6a00:3196:b0:736:b315:f15e])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2286:b0:739:4a93:a5db with SMTP id d2e1a72fcca58-73ff7396ad8mr16428620b3a.22.1745938186941;
 Tue, 29 Apr 2025 07:49:46 -0700 (PDT)
Date: Tue, 29 Apr 2025 07:49:45 -0700
In-Reply-To: <20250402002936.960678-1-seanjc@google.com> (message from Sean
 Christopherson on Tue,  1 Apr 2025 17:29:36 -0700)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <diqzplgvxbsm.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [ANNOUNCE] PUCK Agenda - 2025.04.02 - No Topic
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: seanjc@google.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	roypat@amazon.co.uk, kalyazin@amazon.com, Fuad Tabba <tabba@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, david@redhat.com
Content-Type: text/plain; charset="UTF-8"


Would like to add an agenda item for 2025-04-30's PUCK meeting: KVM
memory attributes vs guest_memfd shareability.

guest_memfd tracks shareability to determine whether a page can be
faulted by the host into userspace.

pKVM does not use kvm->mem_attr_array for tracking private/shared status
of a page, and for Coco VMs like TDX, there seems to be duplicate
tracking of private/shared status in guest_memfd's shareability and in
KVM's memory attributes.

I would like to discuss a proposal for shared/private conversions to be
performed through a guest_memfd (not KVM) ioctl instead of using
KVM_SET_MEMORY_ATTRIBUTES, where Coco VMs using guest_memfd for both
shared and private memory can be able to (with some other changes around
KVM memory attributes) skip tracking private/shared in KVM's memory
attributes.


Thank you!
