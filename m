Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5035B5A79B
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 00:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745627651; cv=none; b=skWCKWv1MhVBCtjG5Y6NdrQ9NVtFUoCht5mR8Rq3gxqPdOAsEkHbNRvLYa3RJxrCzFxuv2Uksv1tZTq9+kpAMmr8PuX9S+AeioimJFFrh/QiH3GQq7V4H48i9Ib30Y27SPkL9D3DIfjEgEvSCjYmduiU7PSX43MKxU/D7lCE9Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745627651; c=relaxed/simple;
	bh=Mq33vldSR/ATwoxyU7PNGDaQUVPFt5WsKW7rOhaAAqU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=c3Yav3zPjLAWiBgRZCPIJREe/qaEEyYIgtUXL4P56jYmpXAh4Zqqqpy3fO1kSTCtx+IlI0e02UVU6KBkdB1qVxRBnrnBkJkJ/05bAqA4vGuZxeERMRyqmfpq3j3Z/T1o2gFf2M6BhMpBhRan3G1zP0lZifvaLuTUGpYabfV5pGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lnGkaI1l; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lnGkaI1l"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3032ea03448so2814866a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745627649; x=1746232449; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YDf2J2PcDCSyWKA3oeM/sk2ULm9hDpCeNfW73+AzdwM=;
        b=lnGkaI1lH+k1H2F+nS5XrpIdEsV9fKsgodCA35duA1NR3hJS/3FAskPA99LHIYny7Y
         XSZ/cknUYjBZL1fJ6EqJ8rTXaeVfwIR8vN1gwAbxvfT4f9IiGF1C8F7vJpRD9rOIHkUN
         onX8MPeQG401FJoefixUASvWa4dwsbSKUdBXjWJZvX3C+szc3Ad+ZC6lXTxfkVxb396A
         z2lJ/ivlPWs9LMxAwr0a4Jr5wZ+lUNq13YczAzSbg5mft5+apOoCyRO1O0cirDjfDt4Z
         FBQxTWrAnTDkjLq7+doWRYO0ezi4a+Lq9bUNfKAG7nZE5LuqH1jEGGkGfL/4yPQJPHKZ
         Upbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745627649; x=1746232449;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YDf2J2PcDCSyWKA3oeM/sk2ULm9hDpCeNfW73+AzdwM=;
        b=gCsMRkCu0heJg7PDT80FBx+nZGaoGovlyUzM4ivj2kEjq5CeJrOlqONF25igzFJLET
         GbW4HfAL6Rgn6JVzr4rJe5UQNPPs18FKN/MiCy653G72uI0SKdnDkk+T1prfULbNsWqD
         kuqMNTHKyJPwlokbf32Kf6YjM8MvloABm34TMyslwEWA1sIHixU+Kvs6Sqc1K5nhSZ6j
         3rNx4srOWuy+vCZ980HIGP223ZpPnZiDVC1Y/4+Ku6C9MEAkS92/eNz2FJbhLsM62PMo
         vlKBeBseSQOPqwnWS2ZpAymfFxQS4SpSArgsEGXS0AX0fPNcbqadC4MSB6IJyKu1E6Xy
         Edfw==
X-Forwarded-Encrypted: i=1; AJvYcCWDGxCl2aogrwI6lUPKbqZ6uQiwFVKBTwu5kiu6e49mwkRJ8oL/WYQKcTkq068cEdggbpHxqeDJO7aAqJA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfQDM7h2rFDe1YllcW7Uo5Um/VnzO/TKhWO7Ok9UPir34NRAHn
	sAPgnbbO9mnlyRLg9wQS7aCkxpDR9sQ6jbwD92pKKcUsDjyzN3zjoITmLPG4tdqzhhQowWShaSa
	iQw==
X-Google-Smtp-Source: AGHT+IG/HtrMJuMhlKJVdX9a6Pdk9FErJIBtdSdgXi2vAyOyRtjdTZRlhf0jfCwUG3z/vdaH5mj9CwIi0l4=
X-Received: from pjbsb7.prod.google.com ([2002:a17:90b:50c7:b0:2ff:5344:b54])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a43:b0:2ff:6fc3:79c4
 with SMTP id 98e67ed59e1d1-30a013995camr2050753a91.27.1745627649627; Fri, 25
 Apr 2025 17:34:09 -0700 (PDT)
Date: Fri, 25 Apr 2025 17:34:08 -0700
In-Reply-To: <20250421073110.2259397-3-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250421073110.2259397-1-maobibo@loongson.cn> <20250421073110.2259397-3-maobibo@loongson.cn>
Message-ID: <aAwqAM2JKxpsSWfu@google.com>
Subject: Re: [PATCH v10 2/5] KVM: selftests: Add KVM selftests header files
 for LoongArch
From: Sean Christopherson <seanjc@google.com>
To: Bibo Mao <maobibo@loongson.cn>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Apr 21, 2025, Bibo Mao wrote:
> Add KVM selftests header files for LoongArch, including processor.h
> and kvm_util_base.h. 

Nit, kvm_util_arch.h, not kvm_util_base.h.  I only noticed because I still have
nightmares about kvm_util_base.h. :-)
