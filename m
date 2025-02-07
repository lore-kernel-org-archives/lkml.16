Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F3E1DE2B2
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 18:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738952626; cv=none; b=jI2V+Rr8cpSDV5MktuuVrRtgJi/mDTxqhXStNIiGANp/8Sfwos2bPbFgKz7Rb+vmCuDno55uTRPGkGpafT99fGdx6IjaYxDrjmbG5UfbfpyzWahmlpGy5ZVyV4ac/FH2AJEiFweZrI/sRqWbQ4IEeNiqLFDOgwo0MGoOYfrg8LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738952626; c=relaxed/simple;
	bh=fy+A0BJTVU2hr6pJvVs0Jz3qZZ0sqYmlzW+g3ladcuk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=C1BCz5ta59Ny/Gn9gXgkm1G59HH9zHey0QVYsiBmOgT9IqCFMz2mxiPhzSj5Z+7XWdhLjR0WrJkI5jxxQX7Anjg6oYtq6NIo1olLKEPH4ju7BaIQihGDNt9p7HWH7hRfvf9ILK4bkBRIXyYa8RhHyOzvVwoZrf0u1HcBtTjwZDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qwawdhXS; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qwawdhXS"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43621907030so20450595e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 10:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738952622; x=1739557422; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fy+A0BJTVU2hr6pJvVs0Jz3qZZ0sqYmlzW+g3ladcuk=;
        b=qwawdhXS3FLsv9QI/mn8I0L44m3gMgKtVLKDIJYTT2F8J7CHkJd0ss2eWhFTp+zN22
         JV5OIxDcjWkSnW6jcaKxANx4wih4Y+zbJoM2ZqQ7S3CRF2ZrZtaIB3u5nG7aO+sjkr4L
         R8gJuwmvaEuofzJ5vqq9k62q4inNeclLJ+SABSyhh+w8pSdDJ6t6WWM2k4CBQQnPQOpJ
         ft3N8xd/jMP4w1nS3RDdB3i5gOlh7PnGIKzgG1SpbbaCfjFI/FAPYg3HeVXtReTuKC6G
         GmSeAVlRcYhNYORu0+h237AC7i84c5OzR7WK/BNNmJfUAwsRm/igY5UnyH/C/YLsZRfj
         xcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738952622; x=1739557422;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fy+A0BJTVU2hr6pJvVs0Jz3qZZ0sqYmlzW+g3ladcuk=;
        b=rtP82B1Pr4jLUHYizkfecIwWzbbdmvHDIF2e6ykP5bhe9ugr5TRjmixxxMpGSOhBc3
         hjqIP2/yABVogSN3p1HnfPi8WrebV6VYuhsc3WUcp0S+RIeG/Np855cnEn4gFcRZn1pM
         FDuvLduHn8S56wGEcjRoLDst/Ki42jqQZ/sTtBNObNCnsGshqMLtaWhjqRCRyfzcRg4H
         sClgI+8EUkH003zxQ8I921m1EO88W09McKpX3Yqiewdd5LJoHYtKLKfGWPjDw/PMsMQf
         JIx0vE8XsRj3JcXadD9bEKOSbSC87csdMveHUR1GBqJod5jPykYL310Vk7zt1YThfHbx
         1Trw==
X-Forwarded-Encrypted: i=1; AJvYcCUsctJPzSHwFXLGvZfUCBnYUnnU8IFXeq1CJY6T9a8qwgialVHBdyjfDAWSNq35c1pa5+fcb10jwq6/CaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJX3z/0wDCmnVw9B/6MQ+ny1RbHbpKwcVanDu3AGF8/UC/pAJy
	J6fraxgSZ0yu7hFESrY3An8H49jFp0hOnK6mA+j/j7uzHzGLdNGgsW9iImMe/gYfzhTOs21iPgN
	13sLsO+ydPw==
X-Google-Smtp-Source: AGHT+IF0r9EDeoYUbGdOeir4cT79QE6cJ1wI46X/b9nUOSqR/hwuAICUK4oTJ/AhAu/x2PqR6cIURo8JgD0LVQ==
X-Received: from wmbbd6.prod.google.com ([2002:a05:600c:1f06:b0:436:d819:e4eb])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b1f:b0:434:f753:6012 with SMTP id 5b1f17b1804b1-43924991384mr45690035e9.17.1738952622634;
 Fri, 07 Feb 2025 10:23:42 -0800 (PST)
Date: Fri,  7 Feb 2025 18:23:36 +0000
In-Reply-To: <20250206044346.3810242-1-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250206044346.3810242-1-riel@surriel.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250207182336.1839092-1-jackmanb@google.com>
Subject: Re: [PATCH v9 00/12] AMD broadcast TLB invalidation
From: Brendan Jackman <jackmanb@google.com>
To: riel@surriel.com
Cc: akpm@linux-foundation.org, andrew.cooper3@citrix.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, jannh@google.com, kernel-team@meta.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, mhklinux@outlook.com, 
	nadav.amit@gmail.com, peterz@infradead.org, thomas.lendacky@amd.com, 
	x86@kernel.org, zhengqi.arch@bytedance.com, 
	Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="UTF-8"

> Add support for broadcast TLB invalidation using AMD's INVLPGB instruction.

I applied this to 60675d4ca1ef0 ("Merge branch 'linus' into x86/mm, to pick up
fixes"), booted it and ran some selftests on a Milan and a Genoa machine, no
issues, although I didn't have CONFIG_DEBUG_VM or anything like that. I did see
the warning reported by Oleksandr [0] on QEMU.

I tried to test Turin but there's some unrelated brokenness. Due to other
unrelated issues I also couldn't test with lockdep.

Anyway I guess that counts as:

Tested-by: Brendan Jackman <jackmanb@google.com>

I couldn't get any performance data either, more unrelated brokenness. Maybe I
can try again next week.

I posted some bikeshed review comments but I haven't grokked the interesting
bits yet, will try to do that next week too.

[0] https://lore.kernel.org/linux-kernel/12602226.O9o76ZdvQC@natalenko.name/

Cheers,
Brendan
