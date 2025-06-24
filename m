Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8201E1E5219
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 17:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750784805; cv=none; b=qXlLatldsIOle56im/HB0bHaGwrFGAbL3wPdkr4VQHoJ88dHExuktVLUhCLEN9QQU/RLdM9BEuXMINOs2dhmsTD+FzESmOMt6s8QdwE20exQhNJ0Ow2HLHoLAWyE2wBncFy3T6S+SvT6PJs+Rf9eTL8wD3RFmwcjCTHya4f2bvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750784805; c=relaxed/simple;
	bh=El96RS2GoB+xf+x5xkRmmKhAycZmnaHN2uzD4493RT8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TSjtXhV7AvGpqW730xmAV5oIli7AIzy6bUdBNLAw7IUyTJ/6zZJc57MCf/sTYPEaB/F3tlVS8cCPpVyCbWRlpeIy9URyhc9GjUXjrCxoXp4I7GH/IJAJBSZxXe+KkP+33pPRy6STSaTHZgrroAFEIyee/hZDSh+gmoMYIaSk+Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qr1RvsdH; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qr1RvsdH"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-313d6d671ffso694452a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 10:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750784804; x=1751389604; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3Fj3ia1xYcZY5Hv5rbn8TPDKNjSzgo+utgMvYqBwh94=;
        b=qr1RvsdHys8bD6enK9LV1CLvZkESbZ+H5V1Rmf08jNW6fx8qVmVEN9/5fltZQzOfyv
         Acnu3EHojahxOi00XI3SCNZOGLUqfcSjxlXRN1nPGvRoklAUxf6JlITItqNZP61fEFm2
         S6DulUrj3P49OdiKoQn4oj7RxVchQA9fC6xmdvxq/8ltPSfYSB7IT4grf9KADqvIZOQO
         P+aqDNZzpma0RIkUShr6lxlVExxIoW3l5ghyC1TRyvBMxVbJ+y7j78JoNltMipyMIfPK
         Tou0FY5OhMhN4HZzgg4roIdfb4r9DIFZnl3ojZddhQ3+1lIt4vQSvg92EuN9QCgL23uc
         lWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750784804; x=1751389604;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Fj3ia1xYcZY5Hv5rbn8TPDKNjSzgo+utgMvYqBwh94=;
        b=RxbtkVnaMm3bbm4l8RVDDiYXzpa1/GritHeC+FPr1mxH3mCf7fwusITWpNGgNd3358
         fIkqkdmu/0NexVn7vYa3kk42SAflO9skrw8cX0OI0lHSPH2u5WHXtg8DohAxK1Ot0LU0
         6nXiMKLDRFRuNNeNCAhjpS6cOcrC68zXgq44XLbTHZEItqqtsqxKv3Gg89prL+iK1kS0
         4GR6vZlUbKBGW11GVeK9FdLLB470uoxW6xHoqxjK0EPxeXQgCp4TFXaY1qqFoLy+lz/7
         /7NysIOZIKzFsBKhRBqRRlnQALnNlCpP3iCw8nlT5N/F9b854qIeV0jUv3riR25Zk1Ts
         2Awg==
X-Forwarded-Encrypted: i=1; AJvYcCXKNK5VN2dBbLbWNOoF6OaZ5zekZrGD6jBovHBR1UkuT4ZGrvDLzamb3YCB5w8sV3M4pbE2Qc6627i7vv0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd84RU7EWfGTQrTYXLX7POFdrHcbaTvM88WisYu8/TgHA/wgrR
	WW868vV7vIaO0w1YRJc5y4Da+a1jeTpiv6zO0/VmrU1nGy0snLWinmpYC9GojJ3OA6k6Te1zroO
	t3TlICQ==
X-Google-Smtp-Source: AGHT+IG91rtujOF1URlp+uwPQ5xYFcxtfL51NMrhKNtKVdmuwx1+g9oU1lsxSZXSOfImxql2jLw2G1l0m9U=
X-Received: from pjbqc8.prod.google.com ([2002:a17:90b:2888:b0:312:1af5:98c9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1b47:b0:301:9f62:a944
 with SMTP id 98e67ed59e1d1-315eddb82cbmr578213a91.33.1750784803871; Tue, 24
 Jun 2025 10:06:43 -0700 (PDT)
Date: Tue, 24 Jun 2025 10:06:42 -0700
In-Reply-To: <d243d203-7514-4541-9ea2-1200f7116cc1@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250328171205.2029296-1-xin@zytor.com> <d243d203-7514-4541-9ea2-1200f7116cc1@zytor.com>
Message-ID: <aFrbIgouGiZWf51O@google.com>
Subject: Re: [PATCH v4 00/19] Enable FRED with KVM VMX
From: Sean Christopherson <seanjc@google.com>
To: Xin Li <xin@zytor.com>
Cc: pbonzini@redhat.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, corbet@lwn.net, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, andrew.cooper3@citrix.com, luto@kernel.org, 
	peterz@infradead.org, chao.gao@intel.com, xin3.li@intel.com
Content-Type: text/plain; charset="us-ascii"

On Fri, Mar 28, 2025, Xin Li wrote:
> Any chance we could merge FRED ahead of CET?

Probably not?  CET exists is publicly available CPUs.  AFAIK, FRED does not.
And CET is (/knock wood) hopefully pretty much ready?  FWIW, I'd really like to
get both CET and FRED virtualization landed by 6.18, i.e. in time for the next
LTS.
