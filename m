Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971A12E11DA
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749824326; cv=none; b=omQtPOz/jTSJzsRXj0Nm+nGxSuYQm6CW9PyJb+6ih2wT+ybIt/CZ5aZxHlbD2d0Uzl66sCGikYEJ6yqtsGI3FBMcWBlqpefsBjjOyIbMimCXfDKIKBxJWqRi3tiKakO67c5FCZPaVQb0sNkP07lKirvNXSccSs0UdteglbeopZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749824326; c=relaxed/simple;
	bh=KZCx30388jexSHnEs8GEE9SQPiUitBEN+gkUoK/zuJ0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Mde4d4tn8MPhbk4BxKEGHs0htzEoao00gw5gJOVjendItUE8OCNbLRtVcsvW/GlDyvEvTpTrFVJW1/KZrl1nSn3SUKNMDDt8oq4trmZjMTAJqPPBTolxb/OgZsOKkplI7dbEYd6/3HSOGXLuTqLOx2x1GqLqGesG4MbC7SilpGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eYBzLmHA; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eYBzLmHA"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-6c8f99fef10so2509779a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749824325; x=1750429125; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yuln+M51ZqtA7GXdWLmA1eKBEgUSVLYqYN5wEG+nUNM=;
        b=eYBzLmHAgqQ0wPA7GNypjAQb/+5K5uZ4ZqVR3955piHDYiau05dQwE4i240KMZ2UWb
         AEKxEAaxjI8oykWZs9AOvCod5qAce4OtV0xFEy1BOnqXKH6C9Ka43HVG/f0Lsv3MXV5X
         xv9DnfTHpQsDtbc7l7tLQnL2ifG5eDFgPZQl5/0IpWb29QGZZJyoD29h1Jr1P5r+gSwD
         8V4JcS753r77yh9dFGhXd6qs+FzGGXdDKfbwZHEQGpCcexDUAhKXJHCFzav5/yYWj9+X
         V9pTY9sDIwAp7yqgca1pkztL1YOw0MluVWxPWiMJDctor0iOgP4OXn4vrRHYKt0ho6LY
         Hk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749824325; x=1750429125;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yuln+M51ZqtA7GXdWLmA1eKBEgUSVLYqYN5wEG+nUNM=;
        b=WIkfSJgEZYhMTxScgBmuoYjbe2u7d0Pq1OvhIJ9k/r0mL8z5YBYJ0qAhul3LJLLdmb
         vI41VBiWgh65STMQfOHTh9MO+zf3FvVwz7+1st4mwstsq+ir0DDW1ajBcJn5aXdrVbAN
         BJ6c1UkZzzBccB2XKnldMRFWGH/A9FVqATUJLqJsyIkGao7uvmkPctN+kwwJN9oc2bUF
         Zdc8B+P8hFIOL3sf4i7+PgPbNSB/nbLzM7/xYQJC3eamF0LbUaYBSIMyMt+XmIhHvnSf
         npVFlNXsUUtiD7sDKWNn/uwvoooSfEdN67R9Waw+/qKXNALz/j6tngOT7yDQSl37w8CA
         xOcA==
X-Gm-Message-State: AOJu0YzJaHClO1UnWCHayjwOIWaZs81nl0iIJjiO0gKCNYNzVmU1ImUm
	qGQCeB+tKYLfa6XS2EZ5li9Tb5mhKuGyWEXvu7U07RrofBBvCZtFp+AGTQ3rtImTn0plbYVZipx
	25w4hfQ==
X-Google-Smtp-Source: AGHT+IGTmdWWhZ7LS8l723oDJ8C756m21ujYIzKHiZTqy0btcanVKUMN3Mr1M6X4Q2ZV1ZJJV9/F4bxywe8=
X-Received: from pgbcu5.prod.google.com ([2002:a05:6a02:2185:b0:b2e:c00e:65f0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:43a1:b0:1f5:709d:e0c6
 with SMTP id adf61e73a8af0-21facf13519mr4722004637.42.1749824324957; Fri, 13
 Jun 2025 07:18:44 -0700 (PDT)
Date: Fri, 13 Jun 2025 07:18:43 -0700
In-Reply-To: <20250613070118.3694407-2-xin@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250613070118.3694407-1-xin@zytor.com> <20250613070118.3694407-2-xin@zytor.com>
Message-ID: <aEwzQ9vIcaZPtDsw@google.com>
Subject: Re: [PATCH v1 1/3] x86/traps: Move DR7_RESET_VALUE to <uapi/asm/debugreg.h>
From: Sean Christopherson <seanjc@google.com>
To: "Xin Li (Intel)" <xin@zytor.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, pbonzini@redhat.com, peterz@infradead.org, brgerst@gmail.com, 
	tony.luck@intel.com, fenghuay@nvidia.com
Content-Type: text/plain; charset="us-ascii"

On Fri, Jun 13, 2025, Xin Li (Intel) wrote:
> Move DR7_RESET_VALUE to <uapi/asm/debugreg.h> to prepare to write DR7
> with DR7_RESET_VALUE at boot time.

Alternatively, what about dropping DR7_RESET_VALUE,  moving KVM's DR6 and DR7
#defines out of arch/x86/include/asm/kvm_host.h, and then using DR7_FIXED_1?

Arguably, that'd be an improvement for 2 of the 3 uses of DR7_RESET_VALUE in SEV
code:

	/* Early non-zero writes to DR7 are not supported */
	if (!data && (val & ~DR7_RESET_VALUE))
		return ES_UNSUPPORTED;

vs.

	/* Early non-zero writes to DR7 are not supported */
	if (!data && (val & ~DR7_FIXED_1))
		return ES_UNSUPPORTED;

And in vc_handle_dr7_read():

	if (data)
		*reg = data->dr7;
	else
		*reg = DR7_RESET_VALUE;

vs.

	if (data)
		*reg = data->dr7;
	else
		*reg = DR7_FIXED_1;

In both of those cases, it isn't the RESET value that's interesting, it's that
architecturally bit 10 is fixed to '1'.

I haven't looked at the kernel code, but I suspect DR6_ACTIVE_LOW, DR6_VOLATILE,
and/or DR6_FIXED_1 could also come in handy. 
