Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C0820297E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 20:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231976; cv=none; b=ud9g0kZlFRpYQDqe43HlGtavkCNVoPjesvrBgF8ripObI7gekqOaYG2wcZ9Yl4KmgU3BzZ80s5AKVEB+9JVLJwJbHEaEU+e6nX4a5+5JTknFf91cqe9h+uDe9srqI+JIOzy+4ev/DNpTJQVNNIduNFW8gfnc3aNcDeWZ0fFv2m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231976; c=relaxed/simple;
	bh=JvO8apHjlhclIbQx/gRDzmFM+JJoJVlhgncErTZaOgw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LMwuuWovEVi9sdvIllR2eqvigsVQeVgzUys7JcrmblIlz2ffHwY5PDrvW1kTN5Ac3GBOEKsbEU9mLMzfjWuHqlMMZICYhdrEgK1ZTmD8rZC4Gfw1gYfzto8j/cH3bmgQ8d2UL9wgR80zziGP7mfwWEhAbirffAtw57vcEl1HFaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ERMDXbJ3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ERMDXbJ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744231972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CwwVdMIzXzZhcHVHa5dTX3xLMXj/2he6DFDzqhP+Y1s=;
	b=ERMDXbJ37QVs38HxJnrLB4Eh1VKtYMF+i6kxOpWYKgJtT2msbJKGMCwd0YCvwqfdnFM7bE
	bZX1P324ApHECVnEMb3GODkcNpn+IH+82zCuhp4ULJyBcmfD4FS/2LJb3lnnZCdJ8mEWj4
	kskwDEFEumIFfuW0apMonHiqYc0zhY0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-akA59-qvNQu-Gwb2MD--TQ-1; Wed, 09 Apr 2025 16:52:51 -0400
X-MC-Unique: akA59-qvNQu-Gwb2MD--TQ-1
X-Mimecast-MFC-AGG-ID: akA59-qvNQu-Gwb2MD--TQ_1744231971
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4766afee192so1575151cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 13:52:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231971; x=1744836771;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CwwVdMIzXzZhcHVHa5dTX3xLMXj/2he6DFDzqhP+Y1s=;
        b=C0ZiCcsP3Z9qMknmszBoAVlc06l3clBTa6VdR/V3qUkVcP3th4xi6s6oyTKg8Suo2t
         1uTmAmW1qiCjE0n99rqhaHPwiHKTi+EbdJ+gAGPVm5LYZBflM/ilS1069AVNCstkkPVV
         Vl4qRektgny0+FjKKoHO427K/DtcvwBOV/Gzp2Wz1nSGbWnffGyoAxjSAY3i65NnMPpG
         0msQfk2XMCtkzyO9Rt354i4sRMzTHRcvZXWW/DO7M1hv6LtKvRZMiooEvQcjfj1Q7GEZ
         zypBDG/t78vlWPqnruranKPybeGfiiId+MTe51AciwPt2b0Yrbm4VPxSXjw3U06AhPfA
         taBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmHOUJFh5jy4m6RJdSHS+ryCxxwikTJIK+TMuIOrearvIUFC8VziE8vlHzxx0jnbATueOg62NFuOKmGKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEfyNJbXeST26JFgU5xkoQniPPK6tF/rbp/RUJyIxNXAXjkJ08
	rKRSWgXIeS5WIz/3jEaEK31AaCselMeD8IgCmP3QwQF3SLyGooRwCaonavkUMQCJHh2yDqb1sYo
	dseluo7OQ3ozSVh2uVQ4XTUznbizGCpPAXv9333JOobLesY6F15fLY2jLX71vOQ==
X-Gm-Gg: ASbGncvRR0rutd7dB4Qqeo3lDOvXSxUnwThhp2CuLqDJ6uVivIdj1UZ3B2m48YPNj/6
	qpuYtJIxCtEoRJ/1kZ/lg727UWAqOK7qYys1yt9ReG2THD3FPuiFvnuzxpWgsiL4YxVynqKw8co
	z2euw3wXuf08cTlYxBtYIMchVRz3z3hoUUYNI3TU+UDSPFPrzXeuI1wMGJtj9w6tJSac2SomsuI
	OoFJmCyTASN39U882aLptVhhqZABtRG1vwDv6/9q/Gsolk0qX3lM/vrsor9ZGM1iyQGjND0aYwq
	kN9DXquizCc=
X-Received: by 2002:ac8:7fcf:0:b0:476:9296:80a9 with SMTP id d75a77b69052e-4796cbc570amr4106451cf.25.1744231971154;
        Wed, 09 Apr 2025 13:52:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMbuLqvSU6RQLdoc67Ywsz5HftBP1YKDQQ3FM3W1T9eNt155wj0aVoxDILQuMOzmxl5HT0Qg==
X-Received: by 2002:ac8:7fcf:0:b0:476:9296:80a9 with SMTP id d75a77b69052e-4796cbc570amr4106271cf.25.1744231970858;
        Wed, 09 Apr 2025 13:52:50 -0700 (PDT)
Received: from starship ([2607:fea8:fc01:8d8d:6adb:55ff:feaa:b156])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47964d75625sm11431951cf.14.2025.04.09.13.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:52:50 -0700 (PDT)
Message-ID: <ed9f56b684a95352462ddfcf10d1075494a5776a.camel@redhat.com>
Subject: Re: [PATCH v3 0/6] KVM: SVM: Fix DEBUGCTL bugs
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ravi Bangoria <ravi.bangoria@amd.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>, rangemachine@gmail.com, whanos@sergal.fun
Date: Wed, 09 Apr 2025 16:52:49 -0400
In-Reply-To: <Z_WmdAZ9E2dxHpBE@google.com>
References: <20250227222411.3490595-1-seanjc@google.com>
	 <1b0fbad5b2be164da13034fe486c207d8a19f5e7.camel@redhat.com>
	 <Z_WmdAZ9E2dxHpBE@google.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Tue, 2025-04-08 at 15:43 -0700, Sean Christopherson wrote:
> On Tue, Apr 01, 2025, Maxim Levitsky wrote:
> > On Thu, 2025-02-27 at 14:24 -0800, Sean Christopherson wrote:
> > > Fix a long-lurking bug in SVM where KVM runs the guest with the host's
> > > DEBUGCTL if LBR virtualization is disabled.  AMD CPUs rather stupidly
> > > context switch DEBUGCTL if and only if LBR virtualization is enabled (not
> > > just supported, but fully enabled).
> > > 
> > > The bug has gone unnoticed because until recently, the only bits that
> > > KVM would leave set were things like BTF, which are guest visible but
> > > won't cause functional problems unless guest software is being especially
> > > particular about #DBs.
> > > 
> > > The bug was exposed by the addition of BusLockTrap ("Detect" in the kernel),
> > > as the resulting #DBs due to split-lock accesses in guest userspace (lol
> > > Steam) get reflected into the guest by KVM.
> > > 
> > > Note, I don't love suppressing DEBUGCTL.BTF, but practically speaking that's
> > > likely the behavior that SVM guests have gotten the vast, vast majority of
> > > the time, and given that it's the behavior on Intel, it's (hopefully) a safe
> > > option for a fix, e.g. versus trying to add proper BTF virtualization on the
> > > fly.
> > > 
> > > v3:
> > >  - Suppress BTF, as KVM doesn't actually support it. [Ravi]
> > >  - Actually load the guest's DEBUGCTL (though amusingly, with BTF squashed,
> > >    it's guaranteed to be '0' in this scenario). [Ravi]
> > > 
> > > v2:
> > >  - Load the guest's DEBUGCTL instead of simply zeroing it on VMRUN.
> > >  - Drop bits 5:3 from guest DEBUGCTL so that KVM doesn't let the guest
> > >    unintentionally enable BusLockTrap (AMD repurposed bits). [Ravi]
> > >  - Collect a review. [Xiaoyao]
> > >  - Make bits 5:3 fully reserved, in a separate not-for-stable patch.
> > > 
> > > v1: https://lore.kernel.org/all/20250224181315.2376869-1-seanjc@google.com
> > > 
> > 
> > Hi,
> > 
> > Amusingly there is another DEBUGCTL issue, which I just got to the bottom of.
> > (if I am not mistaken of course).
> > 
> > We currently don't let the guest set DEBUGCTL.FREEZE_WHILE_SMM and neither
> > set it ourselves in GUEST_IA32_DEBUGCTL vmcs field, even when supported by the host
> > (If I read the code correctly, I didn't verify this in runtime)
> 
> Ugh, SMM.  Yeah, KVM doesn't propagate DEBUGCTLMSR_FREEZE_IN_SMM to the guest
> value.  KVM intercepts reads and writes to DEBUGCTL, so it should be easy enough
> to shove the bit in on writes, and drop it on reads.
> 
> > This means that the host #SMIs will interfere with the guest PMU.  In
> > particular this causes the 'pmu' kvm-unit-test to fail, which is something
> > that our CI caught.
> > 
> > I think that kvm should just set this bit, or even better, use the host value
> > of this bit, and hide it from the guest, because the guest shouldn't know
> > about host's smm, and we AFAIK don't really support freezing perfmon when the
> > guest enters its own emulated SMM.
> 
> Agreed.  Easy thing is to use the host's value, so that KVM doesn't need to check
> for its existence.  I can't think of anything that would go sideways by freezing
> perfmon if the host happens to take an SMI.
> 
> > What do you think? I'll post patches if you think that this is a good idea.
> > (A temp hack to set this bit always in GUEST_IA32_DEBUGCTL fixed the problem for me)
> > 
> > I also need to check if AMD also has this feature, or if this is Intel specific.
> 
> Intel only.  I assume/think/hope AMD's Host/Guest Only field in the event selector
> effectively hides SMM from the guest.
> 

Hi,

I will post a patch soon then. I just got my hands on the CI machine where the test failed
and yes, the machine receives about 8 #SMIs per second on each core. Oh well...

BTW pmu_counters_test selftest is also affected since it counts # of retired instructions.
With #SMI getting in the way, the number of course soars.

It doesn't fail often at this rate but it does when the test test is done for sufficient
number or times or you just get lucky.


Best regards,
	Maxim Levitsky


