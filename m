Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1F4290088
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 22:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745619527; cv=none; b=Atf3Mi8XxW0bJVD3wv7Z26f8AJKIq7Eff6aK2fmc09yk231cvPZvWmIrQcsiuz0rgvfDmgoTSXpTMqGoEVbbDUdbINzDlNMj9toINcKnyEH8SXNDrDCzaDujHnE3gxrzXyVnnq7Xa/W53ScXtDRnlPNNlSfMfU9cYxezwIWMEPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745619527; c=relaxed/simple;
	bh=79khmCilj28Bw9iPJB9I+5VFOyP4giXQADVnconMfmI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=guF/kN0S8L0E4ZGg9Wj8s4oHAn4/ZDTLMriovmoqWjR0DWkUzPhDK5O5H9CCBcsRe12S1435tPG3l7NMKxjbI4HvuJqfrm5EH4GU6Clg/HnaM/sGMEieRpWqwAuG7BOad6yPi2P0p2qjWjEGJL+/JRkMNXxhPk0H4y4wQDSUmF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y3TtrpGE; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y3TtrpGE"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3055f2e1486so3886922a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 15:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745619525; x=1746224325; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=c79mghSvLDh48/eN+ylfXjUf7C+oTHXfrsGjYdtgeRg=;
        b=y3TtrpGE5Fu2Ntuptv0hBl+1HDwM2Ia59LIxELTzVIQVFTRS8ZwKIU6R02NepFzmMY
         jc7ghGzAekTgUNeeL4GjzlpvHMEiteQvnZ64YXF3jVbJlvXW8NNpOiF5cGEu64zQ6XEA
         UuwvRfbtgKGGrztkxzxxR6bFAUBDpEKq58dKvTnjOefV5JqYaWja7UrfNPRHg+375wiQ
         UktINWZdaNib6LSNs2u3TMdhFIXfqXu8izhBUJp8BDhnia4v8Qa/fhi2yx5wZIXF1oaU
         XdDPz/GYjSUV/8uvkz++vEp213T7sWyRDYiQT8IoxJWEG/1JZPqfLgqoxAMrxHLXD3Da
         qw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745619525; x=1746224325;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c79mghSvLDh48/eN+ylfXjUf7C+oTHXfrsGjYdtgeRg=;
        b=E+HM1KvNvnHR2vbEzD2klFzQvgoKiMYEWuIW+znA8LU6SU8pr0Dz3eqCy2KKWvfVVq
         jZKEjS2iHcX1XtWx3ex5SdGz14G4LBVX6uyau8/94TLDJjX2G2H97JiGemXfOk+YV6YG
         SKOaTcnC480GF6FdzBSop8+7W5XXfTGuw+vfJH4CNY1nlz7stryk1FLOwxQyP7xnTpIA
         lx/3JuB8FvexzyQF4xocZfC798sfoeg1ZH39pEkOA+fq9I0GeIV1q3OUDLdr8t5ovCjf
         vusV0dUzBdPQl0PaWPM1Yy9OlWhliuEB74bEI/CwroowSDmuV+570A2PjheWkDjlRtJp
         xkCw==
X-Forwarded-Encrypted: i=1; AJvYcCXNfEwywwqJ1RA2jwxFM26qA1H6eOeEXhsZSc37DJ+c8MNKWxwU1xSRdPK2Euo34AgJ2+7tLAbzh5vlG/E=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg+PNk7ZzPVFHU0qCzf4k4tPEZ4mjyCBBX6UGa9Pm8A5TvOoq8
	LwKdM1xdpm3OQxH8oZtglSnl9kWzuV5oBQgm03nY17zJIY+KEgu8ug4/bHe6CBrSxczulftHiRn
	njQ==
X-Google-Smtp-Source: AGHT+IFAchsJLO7/uMp7rAAyJLviGsYQWW/6iJZ/bglJ7sMum2UgV5vjC+rx1FqdI0bNNfPq3hywGuT2vOo=
X-Received: from pjbee16.prod.google.com ([2002:a17:90a:fc50:b0:301:1ea9:63b0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2705:b0:2f9:cf97:56a6
 with SMTP id 98e67ed59e1d1-30a01329418mr1651850a91.14.1745619525691; Fri, 25
 Apr 2025 15:18:45 -0700 (PDT)
Date: Fri, 25 Apr 2025 15:09:04 -0700
In-Reply-To: <7604cbbf-15e6-45a8-afec-cf5be46c2924@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <7604cbbf-15e6-45a8-afec-cf5be46c2924@stanley.mountain>
X-Mailer: git-send-email 2.49.0.850.g28803427d3-goog
Message-ID: <174559676107.891772.3803946137571196074.b4-ty@google.com>
Subject: Re: [PATCH] KVM: x86: clean up a return
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, 24 Mar 2025 13:53:39 +0300, Dan Carpenter wrote:
> Returning a literal X86EMUL_CONTINUE is slightly clearer than returning
> rc.

Applied to kvm-x86 misc, thanks!

[1/1] KVM: x86: clean up a return
      commit: f804dc6aa20f2ce504456ffbaafc95db646c211b

--
https://github.com/kvm-x86/linux/tree/next
