Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085191DD525
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 23:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746745461; cv=none; b=BALlyIm4Zh+kNL2jFP1DQxV5HpwqWmNmwIPzj7RobJEmnKoeRvzMVvxKxbEiSJOf4b5DOXt0kL8LffdDjjivq/u/GII3+8AXTMwhn+uajEA7XY0YdWv0VdQI+NNmFiuDkIHsn9hgZHegIVwWy0xum6fTlK5jJDolVlEwpRTtBXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746745461; c=relaxed/simple;
	bh=erJZlkOCNdbv/CM5/d8Y8YwzyG2lJFJShmUNyHD+VF4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=tZYqFNioNYTauyaUIeyUeXwQzUK7Pr9cJ4SKSwT5V3ZarIlTvVV9UPhzQx+hE7mjNYS3Rp/09R9HefiG+JZ4ObBPs5ecbcNIggKopGYABzKQxiH6kGZnTUvHsSkY2z7oPvkuHbWXcMwKFcE71UyAxiS8N3dsO9txYiu7S34Ddhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j3bMqfmx; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j3bMqfmx"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30ac9abbd4bso2341206a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 16:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746745459; x=1747350259; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SM2XJe47CN2ZOM/67xIABCaNM4TaX2ab0ZhL0Ce0aCM=;
        b=j3bMqfmx5fU0R+dgFFAenFaArJlR8hbgChzkfW0iDpEPezHodQ+mI/fILf9ssToqqq
         hrduayTltGi0O6QTcKX6pUvA8Hmvgan5JZYBXsAchEY0ZMtAr8fwAhBIuqCVm8fG5EdY
         JRr7UuAaAKbfTRiQ58mCZzTqqrX3C1/1RAavRvBlwwwOwXxbfRY1wCoBhdMgdd8LYt8v
         7ydndUJZlZPLsw+ZOLU643OuVZxqU5jj6lq3yXrC4mAsjHWmrf753vd2no+f+pnsdwn4
         +8NI94MI6JfEcXsKmsC4kHsQRtro/m+H7n3dJUjFY9vki+uVmfeuRvLlpN7inBinLlE/
         DeiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746745459; x=1747350259;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SM2XJe47CN2ZOM/67xIABCaNM4TaX2ab0ZhL0Ce0aCM=;
        b=vQWvK67/BpCUYWljS734OKZ1bWSYNfxHKmOntdaqs2vNp4Lwpb+H8vFT6MdltppGTx
         3RdiRXThKGhGAneVQwcA/WphqqLgyVzdYShANrsldz5mQ2MlQVeNYP9m+jeMQ8/EpU+S
         GaBY6ZhvPInk/ufmVqLf+UMSJ/Oxb73H4XtzKFEmlmH0sId6QD49tuea4tuB6CrZDU/e
         GGj7nMgp1MOLOCInz9E4hN+Wyuy42uFQ+b98p5gzOU1q9C9z06/kqKryR/2bRZh3eCC3
         bW2wTu0LzoulE2BQ9V9zObnSYZNF7K4aUNNQKd91gHXfTeXmbDMYRL7RR4mSUaKpDTFc
         5DEw==
X-Forwarded-Encrypted: i=1; AJvYcCWnRrScSKfX3tGnGOuaS4+EVpHeuI8arh/rJqkUThPa4yTNtXgOQ8haXYC06PCe0eW9FBDRlxiRh7rYj1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBjdmuIvtP/+ur+8Adve4Dv1sDVEn4f5jVp8h/W8QEV67g9kuO
	gXAJ9b+qUnWcUxmGFaouYiNWjvHl21RpV98ZI99uasjgHMlIDQTNEximGHl0Me+dFKLTcenGiJE
	2tA==
X-Google-Smtp-Source: AGHT+IF08fdBrYOn5rB4GiEOPUWwLd/6PgVtzInb7iYf7JX8cBQEQJ4TliUxH0+T2JuJCblZNQq5ljz3XKs=
X-Received: from pjuw5.prod.google.com ([2002:a17:90a:d605:b0:301:4260:4d23])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3848:b0:2ff:6f88:b04a
 with SMTP id 98e67ed59e1d1-30c3d3e8509mr2094760a91.15.1746745459276; Thu, 08
 May 2025 16:04:19 -0700 (PDT)
Date: Thu,  8 May 2025 16:04:09 -0700
In-Reply-To: <20250506012251.2613-1-lirongqing@baidu.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250506012251.2613-1-lirongqing@baidu.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <174674537050.1513194.17959981986179733390.b4-ty@google.com>
Subject: Re: [PATCH][v2] KVM: Remove obsolete comment about locking for kvm_io_bus_read/write
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, pbonzini@redhat.com, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lirongqing <lirongqing@baidu.com>
Content-Type: text/plain; charset="utf-8"

On Tue, 06 May 2025 09:22:51 +0800, lirongqing wrote:
> Nobody is actually calling these functions with slots_lock held, The
> srcu_dereference() in kvm_io_bus_read/write() precisely communicates
> both what is being protected, and what provides the protection. so the
> comments are no longer needed

Applied to kvm-x86 misc, thanks!

[1/1] KVM: Remove obsolete comment about locking for kvm_io_bus_read/write
      https://github.com/kvm-x86/linux/commit/37d8bad41d2b

--
https://github.com/kvm-x86/linux/tree/next
