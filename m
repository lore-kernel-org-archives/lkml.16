Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F68DDC3
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 19:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746560717; cv=none; b=U7W/nJiMob0ZrjeoipJ4Pm+0aR7kxkx1/utX3egxrdfQ+Wq5KeU1MEg5XwdsYM1c1CUhcC+eQDpDY5VkImDxu27BjRQc0/QNwxaGTeWLkQSlsOjXhziaMsnil+f3vi1Krjqfynp2aJH/jNeDZAV4PN37emBy0le+EmTyZzFaEHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746560717; c=relaxed/simple;
	bh=fA6baFrBMTZPoGqIiJ7GW9c6V8LDlSpjpVUs3FFWZkA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ilnqDgydUUx4fGzYYcpD2Wev7/yU815fO+dQ9or28Acu35sySdd42PMbgvD72CW07h7KMR2VoliZRQI1rnZUb8HOd54pSqwXVcN0oCM4QEvQIDWOcX8uEFrWvezrTggvCthxJCGfQT8NZXAfpNTsUpIlAG/orAkG5bnv2ZGmCoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gHgw+6Tb; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gHgw+6Tb"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-22e50d4f49bso9227485ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 12:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746560715; x=1747165515; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nbit0ITm/pQP3NVf792bDV8mZNspv5mb/mti4+w+eCo=;
        b=gHgw+6Tbi4onJw6RFC+exOn31VEOpTMUcGk7gYftiFiapBfNIF3snUKXgbhxJ0dE3P
         WgF/kGpzdZVwXvnQutlYxv4OTLA7tmINS8p9mbbExpMN3jSfCmuoYJ6OUoGv6iDSFiNw
         NFDOvuQIApm6EDOgjAMPhC8t7nXF2RRil8ynkHPrb4EUxCN1d7wC/xTjmObwI74gOJGe
         ukitBNxY4eIZHD2vMS84Xc7/6EnQO3HvLHLY5z1XIlYDpStwor3sqFOxoe2DbtRa0676
         oeh3TWeSY8XrjnvR1/aM9B2R0MX8C7kPL3E2q6HVr29eKYdppJSGEpLODkNn8tdm9R5/
         7M8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746560715; x=1747165515;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nbit0ITm/pQP3NVf792bDV8mZNspv5mb/mti4+w+eCo=;
        b=T+9VfhskggPtRcsFRAMIP6aSi/qyDgHuAUPcnhlnlzisE+sSazxpjuQ2ee3/2Iyc7S
         IegsJxpoCyGXswffH8P53DD3dWwORPYJ8GuKtY8mf/+vJGu+lt1teH/sMOvWBmDNfaU6
         EVECP41a1sLiuEtWKF0EdDpfexpvpdTkdzhqTaHpZ2ABpFTM3MJ1L0bv0thisqmtp6Y9
         v7yJPxltpK/MQ5c6OQBtMg0KXHewqp9TxeYj7aWyIxk+1u1e+qnPc1y5G+sApGOxk/4v
         bN97oeEcSLYNb8iUrNo65XXd+PAWM4+fMSaYbKcI1yxqgVMRw9BfS6ZeEr+Gkv89T2Aj
         Fspw==
X-Forwarded-Encrypted: i=1; AJvYcCVPNHJ82O49ups0dnYleOTX1cMAR7UHDWR/mEtciEh1PBAT5ehsqWSNytqUM3/bWijMFrEaYCJut2PzJw0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGWjh04UhDkK9IEMARR+4L3kwfEZk2f64EIy/wTfh+tkmJvW2l
	pnmMJPI/8RrnnfP7r5EsphpS/hDMbAufXqvI72P5ffTKlZ/qoOD/i0fNaI35CnRMKwv2ezFFPV4
	qfQ==
X-Google-Smtp-Source: AGHT+IFqRJC+/nE+KITlgWvBy1Ybx1q2CpPmR4WfkU+G+40vwLU3dW8GZ+n+QI5InJgQduz6JwxzACkmxAw=
X-Received: from plbmq4.prod.google.com ([2002:a17:902:fd44:b0:22c:3374:e338])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d54f:b0:223:635d:3e38
 with SMTP id d9443c01a7336-22e5ea6ba5amr6666535ad.15.1746560715262; Tue, 06
 May 2025 12:45:15 -0700 (PDT)
Date: Tue, 6 May 2025 12:45:13 -0700
In-Reply-To: <827cc30b-35e0-4a63-a993-484d4616091d@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250324173121.1275209-1-mizhang@google.com> <827cc30b-35e0-4a63-a993-484d4616091d@linux.intel.com>
Message-ID: <aBpmycjTn4Xo4Hc4@google.com>
Subject: Re: [PATCH v4 00/38] Mediated vPMU 4.0 for x86
From: Sean Christopherson <seanjc@google.com>
To: Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: Mingwei Zhang <mizhang@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, Liang@google.com, 
	Kan <kan.liang@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yongwei Ma <yongwei.ma@intel.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Jim Mattson <jmattson@google.com>, Sandipan Das <sandipan.das@amd.com>, 
	Zide Chen <zide.chen@intel.com>, Eranian Stephane <eranian@google.com>, 
	Shukla Manali <Manali.Shukla@amd.com>, Nikunj Dadhania <nikunj.dadhania@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, May 06, 2025, Dapeng Mi wrote:
> Hi Sean,
> 
> Not sure if you have bandwidth to review this mediated vPMU v4 patchset?

I'm getting there.  I wanted to get through all the stuff I thought would likely
be ready for 6.16 as-is before moving onto the larger series.
