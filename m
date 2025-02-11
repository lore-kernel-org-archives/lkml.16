Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A525F260A38
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 19:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739301579; cv=none; b=nZbwOtPnVjAC4pnp8dxDayfwasCM9AZCKsqC8HSa9942qhZyLIhzXUw/QmA6R1+mSijnDUfoMZ0BXWD8GGefo41Hv9DL61jEUogcUy28Isa0S3LMFXh8REjJmSRAdcjDjHOz5+y8GAm+vqIJmjDS/v1ebssgpguiIz0t9ShXbDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739301579; c=relaxed/simple;
	bh=BQVcd0E8qDJAu1XKqZpGV5YtYxLDN/fH/h90PM2zqLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FWtG4Uh2UfcJd+7FYxW0myo3ERksvuxlZGgpguzxB3SNl5pZe8K7TvDKr5sfS+LymKW3A2bLv39QmoyFmXZGXD+uX1BXVgvoQClkRIjCzyeEvEV28dAfVrPNn638AfZgLcnXVksAtsyV+WlZO3BQQZDswUlQDYHzCPJ08vfa+uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RWO3qkJq; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RWO3qkJq"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3d13fe99d03so15175ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739301577; x=1739906377; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BQVcd0E8qDJAu1XKqZpGV5YtYxLDN/fH/h90PM2zqLA=;
        b=RWO3qkJqcZKs02dZSpmua4GAx1rEzeTwL4aQemj1cODa5yLsBN+Xc1C7nru8ciO/Qk
         sgSMfHlLNUSXDBWEPGKmQ2hy8HU5Q6xK6Ep0MrFh6ySeqMq6EUCryG3bep/ibwmGF3Bt
         EAZx6irqkbTVwP7dfYa0buYj8wG9Pad8QahQ/DLkaxSlgrTUL4tX7poD57GFvlpdeVi4
         n5a8rtBBTXCs1/NeO9Y6RKO/iFEX3VOifTL3QOIM23YyZs/PzJ2rbEKA6KcGa8CkrDiN
         VDSWbFBm/ukI7uyCaJd2DeUlfKV9eMO7Z+NmGom7Z/qJTOklSqLqQygU6BPWXuiIXuDz
         Xl0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739301577; x=1739906377;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BQVcd0E8qDJAu1XKqZpGV5YtYxLDN/fH/h90PM2zqLA=;
        b=oz8INEoHhOZZd+vTHcQOSjAZAHHab9QzIdFDw81Yydg+Dir4BhKBCgkh0SEo1rpim0
         BKGSfk4ZEPj7ho+YfCS8Koi7ST+ZCfMQSH80Tzpiwg2HL3qSbAt9MVrITtK1zvP52Pi0
         Dy5RrR6sLy+6TuAlFj0kZTnVmnrRr1FmjPQEi2Od7iBTFi8BsvlQoOj0jDBgWQex5Qsi
         kv8F7d1OBcGI4NTigST8V5uVlE+WKezGti+xqiLo17Eb8jFVpLuAQsuu9HzCg8zG//ig
         xPCdbJD5iYJ8EWN2JKhtzGUiB+wNKYlQzaKzt50uiiHdCIeSxzyhG4n1WG/cje6P//Ib
         Dyng==
X-Forwarded-Encrypted: i=1; AJvYcCWh/MCW4yi+M6YPWki6EGlkpEdacav/w7lLcWox6LMydgR36a4ph0e5wr4FkPHT9bnAGl2w+gRCz3P0FZg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyKMLC75Y4FDjxrMM5E5DZvqLeBb4W+L2PgpZGynkfFacVldFz
	sPG16namPNypvM9VNCWZAUFN91gzmi6SIvudP0NnUFcWYBI5vUhwR+fqG6ypvgvRHQvX09pvUSo
	XIjIfhpeyqUfzo3AdJ8bdEb/PPmBnNWn+UMUr
X-Gm-Gg: ASbGnct8zcBGqF8We6cF1SVE00TFpasoDt9/q7LXCJt16oamhHTbtYPNt3Q/xhd3Wyk
	RJta0/iYC57jV8d6rxv2YtwG0yMSWoQTmrM8NatREUZV509AzPX0hpddVa0Q8loWL2CEk+wCu
X-Google-Smtp-Source: AGHT+IHZcYXITrrwGicv+DWrhwM/y10QdY1SKlNBDZiGq/499Tf3TOztiUIlbS98GdpyOeZkICE0kLwCQR4n01pCcfs=
X-Received: by 2002:a05:6e02:de9:b0:3d0:62be:12c3 with SMTP id
 e9e14a558f8ab-3d17ce89803mr152295ab.1.1739301576593; Tue, 11 Feb 2025
 11:19:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z35_34GTLUHJTfVQ@google.com> <20250108154901.GFZ36ebXAZMFZJ7D8t@fat_crate.local>
 <Z36zWVBOiBF4g-mW@google.com> <20250108181434.GGZ37AiioQkcYbqugO@fat_crate.local>
 <20250111125215.GAZ4Jpf6tbcoS7jCzz@fat_crate.local> <Z4qnzwNYGubresFS@google.com>
 <20250118152655.GBZ4vIP44MivU2Bv0i@fat_crate.local> <Z5JtbZ-UIBJy2aYE@google.com>
 <20250123170149.GCZ5J1_WovzHQzo0cW@fat_crate.local> <Z5KEoepANyswViO_@google.com>
 <20250124125843.GBZ5OOg3rWBd9pY3Bx@fat_crate.local>
In-Reply-To: <20250124125843.GBZ5OOg3rWBd9pY3Bx@fat_crate.local>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 11 Feb 2025 11:19:25 -0800
X-Gm-Features: AWEUYZnCHcmRz4QFrDZ8KpRGdwEuBBU2P5nHjVBGhJsHbEaqxo2hitC1xktH8hg
Message-ID: <CALMp9eQarOhpNkw6WCWOvh_fcHg9846sEo7fAOEoAtKRDA7kSQ@mail.gmail.com>
Subject: Re: [PATCH] x86/bugs: KVM: Add support for SRSO_MSR_FIX
To: Borislav Petkov <bp@alien8.de>
Cc: Sean Christopherson <seanjc@google.com>, Borislav Petkov <bp@kernel.org>, X86 ML <x86@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, KVM <kvm@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Yosry Ahmed <yosryahmed@google.com>, 
	Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="UTF-8"

Borislav,

What is the performance impact of BpSpecReduce on Turin?
