Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB5E2D0ACB
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 20:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746045073; cv=none; b=tOpa0duVc6qgjTIBokSJkyerCCeZRQeINJU+D8uyHH3bSwHv4Mg2cMZxxyivdy0fR7jCuDogUtAcEzp7AGe4F6SLCKKfISggSX3hczfpfP3in7FQabnvV6Q7cqHjOZU9tCB4iPn/oWv2YEq92Zmmzhf9wpKtHFzKKg1evLPI4rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746045073; c=relaxed/simple;
	bh=ICGr00xREAImTG7PalegtjIssnWbLJIbF1OpE+eDNbw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dWg2lp8EG9TxZrxYdp297b8QHUIFD3Twvh5jEOA6NwryIzESBoiXPYCaNbmTvFLIVhiWjFa0r2lyhdMJrE/Z3d2uE2eusMKDWLsaOuxp4S1eXi8aFI0W/AmAswKAiu3ueBwT/SQ1o441pt553Eqtp/IQwhu7hXqX87BFTgoxdXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fz8tvGPp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fz8tvGPp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746045068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kLCLNjhH9N/SbhZgwe55OZ5mfyV+uMRJ+/FIl8sp4MU=;
	b=fz8tvGPpEhFiQS1hNcFcF+xvULiQDZaqKQH7KC9bBFNc101cL6gorEkoGUQ0Luxy+leLdT
	xIX9DpgIQMcWJIIQqjIZKN40zJLAijrJysHBqc1MXu0AXl0SD3A2HNZUHZW8vg7s8wkl7K
	Xm5kbxdNMEPvjXkakDkjTTvYhGxzMO8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-hFpY9hGkNOWeKVe-D1edOg-1; Wed, 30 Apr 2025 16:30:57 -0400
X-MC-Unique: hFpY9hGkNOWeKVe-D1edOg-1
X-Mimecast-MFC-AGG-ID: hFpY9hGkNOWeKVe-D1edOg_1746045055
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8f184b916so7360666d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 13:30:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746045055; x=1746649855;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kLCLNjhH9N/SbhZgwe55OZ5mfyV+uMRJ+/FIl8sp4MU=;
        b=uGSW4MMkOZh5kKJGYIOqvIEjDFHn3p4VA9BmCNq6TTC1/r/B3g98Xn8+Gup24Di9jR
         0KfOREv/86quJHkCZmngudymKgNiOm6URIcVTrVHgKW50AgBHw63ZQEZj8pfgxy8V2Mx
         Tr1UazxyAyXlMzMSliTcjEdQzhU1opH1KEE2v7bCgKHB22DpA7TDvmLIv1+O2nQ015ZK
         3ESqPyzw1tmf9WULCBay/21b6guHX8zvOBsPeXCuxFCCuPWJQQwq1og0LmY6A1gUI1Kd
         mHHC7tIBefyY0i7T6SEOyuMlRZt02ukXTIi20Cdx+QXp7JAM3/0g+Uq1aPKWK1OcBRv0
         /5AA==
X-Forwarded-Encrypted: i=1; AJvYcCVzJp+7XP7yhItMt66yWC7j2AOic2Hma9lxf/wSyew1/29+6RQIekh+KCJBChU6Rq56pdSoCEwc698Ky0A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdk+eDxnbtCwsICBBEdTD9ilzunLtJYxetR8usbCTxrjX/YYSI
	R8Izhg5EMKc5AHyXwsAt/sysve4Fl4S1sKeP+Db8WbtFNkCk62bedQcsQiJ8LG7qlpNTM8v1ikP
	pJHw/Q3hAzl8rPHQ+uhPlYzMJCjYG2AggckMjrQH0pljzRYlfLZcLPIM+kQ5Sxw==
X-Gm-Gg: ASbGnctw80Lu+h8tJ5qf90/q6oLwwfhrVb5T+9K+aXGvR7uSIzb6MCRWTsErykSUvHT
	hqBLFRGVS5AZ4ePdCnBEHCEjECeqcBQZ38JWo2vca3Id2fwhLUHSt4Y3d1xiJSS5Bd9C/E6mCA8
	Fp40ot29OiTUEBLuesfbPQA6v2bSkcSBluaCof9zLrYvde0MNvFKs7ePViTOszSzhan52fgwTC0
	7vnOqiTBc5xaQtWHeDNtfWsdgYmFBSKiUkpAQSYjx9JourxGFknyD32/kCt+nxZ3mycKi92fjK1
	Xtm12NmLZ7Yk2ZULEplyCfkT1P0zvBe0W3vgS8TLX+P3BZt2xolhHGr9jhg=
X-Received: by 2002:a05:6214:2584:b0:6e8:fb92:dffa with SMTP id 6a1803df08f44-6f4fe081236mr60226336d6.25.1746045054712;
        Wed, 30 Apr 2025 13:30:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqMC1VAUYkFR8BRk72B9YM6tHcI7coSFQe+I2l2BvKOrJizso3ayI0TGKXXExNYQxM53jAuA==
X-Received: by 2002:a05:6214:2584:b0:6e8:fb92:dffa with SMTP id 6a1803df08f44-6f4fe081236mr60225826d6.25.1746045054231;
        Wed, 30 Apr 2025 13:30:54 -0700 (PDT)
Received: from ?IPv6:2607:fea8:fc01:8d8d:5c3d:ce6:f389:cd38? ([2607:fea8:fc01:8d8d:5c3d:ce6:f389:cd38])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4fe70a277sm12416546d6.55.2025.04.30.13.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 13:30:53 -0700 (PDT)
Message-ID: <53a26378fce90c8bbfa57a582992324560aa0274.camel@redhat.com>
Subject: Re: [PATCH v3 0/4] KVM: lockdep improvements
From: mlevitsk@redhat.com
To: kvm@vger.kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Randy Dunlap
 <rdunlap@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, Will Deacon
 <will@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, Kunkun Jiang
 <jiangkunkun@huawei.com>, Jing Zhang <jingzhangos@google.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Keisuke Nishimura <keisuke.nishimura@inria.fr>, 
 Anup Patel <anup@brainfault.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Atish Patra <atishp@atishpatra.org>,
 kvmarm@lists.linux.dev, Waiman Long <longman@redhat.com>,  Boqun Feng
 <boqun.feng@gmail.com>, linux-arm-kernel@lists.infradead.org, Peter
 Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Sebastian Ott
 <sebott@redhat.com>, Andre Przywara <andre.przywara@arm.com>, Ingo Molnar
 <mingo@redhat.com>, Alexandre Ghiti <alex@ghiti.fr>, Bjorn Helgaas
 <bhelgaas@google.com>, Palmer Dabbelt <palmer@dabbelt.com>, Joey Gouly
 <joey.gouly@arm.com>, Borislav Petkov <bp@alien8.de>, Sean Christopherson
 <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Alexander Potapenko
 <glider@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org, Shusen Li
 <lishusen2@huawei.com>,  kvm-riscv@lists.infradead.org
Date: Wed, 30 Apr 2025 16:30:51 -0400
In-Reply-To: <20250430202311.364641-1-mlevitsk@redhat.com>
References: <20250430202311.364641-1-mlevitsk@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-04-30 at 16:23 -0400, Maxim Levitsky wrote:
> This is	a continuation of my 'extract
> lock_all_vcpus/unlock_all_vcpus'
> patch series.
>=20
> Implement the suggestion of using lockdep's "nest_lock" feature
> when locking all KVM vCPUs by adding mutex_trylock_nest_lock() and
> mutex_lock_killable_nest_lock() and use these functions	in the
> implementation of the
> kvm_trylock_all_vcpus()/kvm_lock_all_vcpus()/kvm_unlock_all_vcpus().
>=20
> Those changes allow removal of a custom workaround that was needed to
> silence the lockdep warning in the SEV code and also stop lockdep
> from
> complaining in case of ARM and RISC-V code which doesn't include the
> above
> mentioned workaround.
>=20
> Finally, it's worth noting that this patch series removes a fair
> amount of duplicate code by implementing the logic in one place.
>=20
> Best regards,
> 	Maxim Levitsky
>=20
> Maxim Levitsky (4):
> =C2=A0 arm64: KVM: use mutex_trylock_nest_lock when locking all vCPUs
> =C2=A0 RISC-V: KVM: switch to kvm_lock/unlock_all_vcpus
> =C2=A0 locking/mutex: implement mutex_lock_killable_nest_lock
> =C2=A0 x86: KVM: SEV: implement kvm_lock_all_vcpus and use it
>=20
> =C2=A0arch/arm64/include/asm/kvm_host.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3=
 --
> =C2=A0arch/arm64/kvm/arch_timer.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +-
> =C2=A0arch/arm64/kvm/arm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 43 ------------=
----
> =C2=A0arch/arm64/kvm/vgic/vgic-init.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 4 +-
> =C2=A0arch/arm64/kvm/vgic/vgic-its.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 8 +--
> =C2=A0arch/arm64/kvm/vgic/vgic-kvm-device.c | 12 ++---
> =C2=A0arch/riscv/kvm/aia_device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 34 +------------
> =C2=A0arch/x86/kvm/svm/sev.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 72 ++----------------------=
-
> --
> =C2=A0include/linux/kvm_host.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++
> =C2=A0include/linux/mutex.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 17 +++++--
> =C2=A0kernel/locking/mutex.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +--
> =C2=A0virt/kvm/kvm_main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 59 +++++++++=
+++++++++++++
> =C2=A012 files changed, 100 insertions(+), 167 deletions(-)
>=20
> --=20
> 2.46.0
>=20
>=20


I forgot to send first patch in the series, resending.

Best regards,
	Maxim Levitsky

