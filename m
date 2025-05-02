Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12493211A05
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 21:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746222682; cv=none; b=kZATh/SG7SZI2/SJOKJA+0MK1AFdzv4Jlqq0ZzecdUGjbQsndT1I3L3mSHDKrzJrNElUU+uBJcSsT7QnGHYt4N6HtJMb2EHF5LDERm7tvnZVB6QmikWNIA496e+AwNgzEwtSR0g19pfUpIrbgRezAweuYPVzmAu9VcfE5hd09zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746222682; c=relaxed/simple;
	bh=JXSPMNU2F6PIX0FUsPuhRSrAfg0l7mo2VPCcc/ccc6g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uDSow7+xW+lfFFMlrrkNkZprUjdAiywpaS4sxMlnE3E0WoSojnj8zvcQaMUpJKorp59Bq3J8yp2zvU2sEhNQyxBJo1kEII4iVLiAjQjHukrWcMA0LtrRIxTzSdt0zI5q9OlxGisCcm/mdRVT5AStt9DHItCJmlI6U91r7LcPY0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bsh0rRN2; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bsh0rRN2"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-af534e796baso1304157a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 14:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746222680; x=1746827480; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NJvfYawPyN0V8zmHL1OuCkkneTy6JZ4iVJIh4vfswsI=;
        b=bsh0rRN2G6PgXZhWV+cbjlm7RduYRGD/JOG0+hFzP9z1oGcIWAjwVImttSYFNJohtj
         rhIw1HzHZWkZt3mzttKwzFUc3VLYUpiH6Zee2G5cbA7C+jzDe4UcjZSgdiN0uQJnJJij
         kixvLUq4IJvD0EVhPl6KcluFeHj9ncaE1vpQcExnu6J/0glYVrl45bzJCGJPq+RjYhLR
         7ufwd8fLTRcB3SuJQEnwmgqcey1grFZ/Ub2cRXr/C/ZlbkM1QUpncEUWb+A2XDMIMmy/
         pNcdetmYZNxmePVqeL2TwCxXCiwE9uWL/bL+ynTANQziSw5452QXJX2JB96r2+N7A0L1
         +eIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746222680; x=1746827480;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NJvfYawPyN0V8zmHL1OuCkkneTy6JZ4iVJIh4vfswsI=;
        b=XFRcHy2HrS0JamUDFnRO4QJ0e3EpYPNAeT8jdBB59QwYM/NIxFRT1dqF8nc3t8m5Ck
         E8cc0nv2qt3mlxxktr1xCbHI4NZglXh5gtviCidDzH9wI1LRar5blbq5eDUvo5kCD7qs
         V4CWyHXL9EXj2BFIDxoFeWs7yD60nzyZIME69Y80ecJRbgE28G5iRpFBtrH0HbZ7M2WB
         1pj0lRIhITroXlU9X5ReZAJ6kMwqL50mH7c32tTfPlEz5AaYv+PSxnXCJOZwiY6mXUJc
         23LC3v1anFbZesoKyp1UIRpTjOhLCvhVywBiUh7P0lJieRiVaNpr/64RV+mJgedrnh/Z
         m3rQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSfTEiscWMkB6H3F2Sq0wtsfHMyYCQPgP1BmoYiRRrTkJv75ZLgeAgkP6rhA+tKPVDu33uCskh4acbmYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+A9up/lPWt95p5SrWtFPxABrSK4ECIDF47FRCazL5kTbh2IK9
	A48OPPqoVsAyh3Mm1u6vtv7T31OOZ6eogJZZ0Twc78g999o/O5zHp3q4dl/k46ATZHoc6Tf5AW2
	dCA==
X-Google-Smtp-Source: AGHT+IFfvB5BYcCkUy0HSKU1ftZqpv237388LVDliX9NyOGYbIIAII1ebAC4Dj75mncu2D7rWaPQcZunEDw=
X-Received: from pjbpd12.prod.google.com ([2002:a17:90b:1dcc:b0:308:87dc:aa52])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:57e5:b0:2ee:f076:20f1
 with SMTP id 98e67ed59e1d1-30a4e395cf1mr8976249a91.0.1746222680316; Fri, 02
 May 2025 14:51:20 -0700 (PDT)
Date: Fri,  2 May 2025 14:50:53 -0700
In-Reply-To: <20250320013759.3965869-1-yosry.ahmed@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250320013759.3965869-1-yosry.ahmed@linux.dev>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <174622231823.882065.2543559051221676218.b4-ty@google.com>
Subject: Re: [PATCH] KVM: x86: Unify cross-vCPU IBPB
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jim Mattson <jmattson@google.com>, x86@kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, 20 Mar 2025 01:37:59 +0000, Yosry Ahmed wrote:
> Both SVM and VMX have similar implementation for executing an IBPB
> between running different vCPUs on the same CPU to create separate
> prediction domains for different vCPUs.
> 
> For VMX, when the currently loaded VMCS is changed in
> vmx_vcpu_load_vmcs(), an IBPB is executed if there is no 'buddy', which
> is the case on vCPU load. The intention is to execute an IBPB when
> switching vCPUs, but not when switching the VMCS within the same vCPU.
> Executing an IBPB on nested transitions within the same vCPU is handled
> separately and conditionally in nested_vmx_vmexit().
> 
> [...]

Applied to kvm-x86 misc, with the online=>possible change split out to its own
patch.  Thanks!

[1/2] KVM: SVM: Clear current_vmcb during vCPU free for all *possible* CPUs
      https://github.com/kvm-x86/linux/commit/1bee4838eb3a
[2/2] KVM: x86: Unify cross-vCPU IBPB
      https://github.com/kvm-x86/linux/commit/54a1a24fea19

--
https://github.com/kvm-x86/linux/tree/next
