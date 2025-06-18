Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C808A287503
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240857; cv=none; b=Eh/hv4SVLwZQZIGpuwoK1XyjQChlHMfrYWgCIwYMAyRiQ5tIHMR0l1Ti4ke1BVqBYGeUl5VefAr/JM7M+xLugC4K/+8FrQHlU4qVM0oEc4re/2JyRR+Dl6cBFRdLBVY/fiovCb5rgGifLIPP0B7QaUlLp1NfgxKdIktEDdAMQ3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240857; c=relaxed/simple;
	bh=VN13H3zCDLcqYd40jQvYLahvkzgxzbof0QHpQngN6ys=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eQaV1lC2SfMwFzEfCtWMJbG8920IeBlwKLYmPKlrrxDPznPpS+xU3HCJZymThnYwBVOQERu1JBuQJeJHRLwVSO9Z0CWe+KHbNRpZ3OesXoJjTYVcrZoqaqGxyndQDLx8ZsPjaXokqQ8TLvE4QQBaSr4D7YnrbNBkujk7guWy4Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jGM5EuQ/; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jGM5EuQ/"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a50049f8eeso2767917f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 03:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750240854; x=1750845654; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9gXsKhSThWoiUF4CvpkQnu6NVTTM0tjBOOvGWcPTBWI=;
        b=jGM5EuQ/3lAZ1jvg1PHda76oGvXfmzV/k1j3feP9IMBoEerD/t4TzZXi1RndF0aMDa
         q2hGAAiOtoY2Juro9DFjHMrVsba8lmE5mWCck9EDkKNp2JthPVSM5xrASwxqO375fXNy
         UEJEs3XDH7lv5+8Ct98bn1bfnBMN4ZOR4W9wxAKL3ldMrlM0ozW0psHgUStOjDiemw/2
         AkjM+3HzvrPc/UQa7kixMKNvc3OwI8pEzzZM61SgZVsJXdpqjeYZM6T29rGlmOsg1l5G
         Uca0tiuadTNO1DUSVDKvrQs0YpmO8988F6/5DiFG8faCzfeTh7keGCUwX95a07BMy5mk
         Rm+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240854; x=1750845654;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9gXsKhSThWoiUF4CvpkQnu6NVTTM0tjBOOvGWcPTBWI=;
        b=vvGxoZZ0m5s2VHRUDmF8xUT44c3rQeoWieP9g3xUFp53dSdgcIa156rVpge8gc+QCS
         SLMckyWqlFFCpF+lxJ8ck1AMmG/ePYm7xN+HJPHBo60Jz51ciRwihTeW1vi6nyd3V69C
         ypJmH45nUWcivfPJGZ204emQWO0MNZmub41b/YFM+ZqjV+yPm2x6hZrohPjDUVSa55Vl
         vmnw+69ej0y7ICb3ZqFjNT2AVtfz0nbKf9a7RC3wcJnpC8QZCN0iOCKgX0pDB4jIFams
         P+8ldJDwkK9zIjxocStg+wKHoUycKPyPXGHsIqRic+KfOVTokbIG58hOAv17rzEeFyZ3
         BUJw==
X-Forwarded-Encrypted: i=1; AJvYcCWUYM35I1JwfqLqfp+0i7APHaGK2NC3fUGSqwi25FPoqlJ4zViyi3yTdAwILAtY0G3H7U2Bc9K2JoxmFJI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG1SmZv5G6Wh6KnPYgAkjio61OQdDXoTKrFX18qj6ycH57JGTe
	9D7trNQ9VmUwwBg7ZCzPwtMzekkjcYJviXbLzf++15l2w6k436PwUt9B8Zlrt5ciF9ag9V78xGj
	b7uW68w5EA4yp8w==
X-Google-Smtp-Source: AGHT+IEFSgudHg7Y7cHjEgvEWYvKJum1y7AdKSBurV7AIvTuNOuv1zf2A9OMmkY37R7Vx351TJtubM5Ukn5P4Q==
X-Received: from wmbdq13.prod.google.com ([2002:a05:600c:64cd:b0:43d:1873:dbaf])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5c84:0:b0:3a5:1cc5:4a17 with SMTP id ffacd0b85a97d-3a572e925e1mr13213215f8f.42.1750240851242;
 Wed, 18 Jun 2025 03:00:51 -0700 (PDT)
Date: Wed, 18 Jun 2025 10:00:49 +0000
In-Reply-To: <aFGkVh-rs2ZqcL6g@x1.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250501163827.2598-1-ujwal.kundur@gmail.com> <20250616100406.2853-1-ujwal.kundur@gmail.com>
 <20250616172618.0609127a8b1e406d4c228d24@linux-foundation.org>
 <aFGPVPDKGLOIEucg@x1.local> <aFGkVh-rs2ZqcL6g@x1.local>
X-Mailer: aerc 0.20.1
Message-ID: <DAPKLM86IC4F.1MCOR35P2D9VV@google.com>
Subject: Re: [PATCH v5 1/1] selftests/mm/uffd: Refactor non-composite global
 vars into struct
From: Brendan Jackman <jackmanb@google.com>
To: Peter Xu <peterx@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Ujwal Kundur <ujwal.kundur@gmail.com>, <shuah@kernel.org>, 
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>, 
	<linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

On Tue Jun 17, 2025 at 5:22 PM UTC, Peter Xu wrote:
> ERROR: munmap (errno=22, @uffd-common.c:277)

Looks the same as what I reported here:

https://lore.kernel.org/all/DAITJKYRQMFD.OLOUWS7UPGVD@google.com/

> Ujwal, can you reproduce these issues and have a look?

The script I mentioned in that other mail should help with this:

https://github.com/bjackman/linux/blob/github-base/.github/scripts/run_local.sh

That's my hacky attempt at a "hermetic" runner for these tests, it
ought to let you get the exact Kconfig, userspace, and QEMU command
that I used when I hit the issue. 

The GitHub workflow definition shows how to get its dependencies
installed on a Debian-alike:

https://github.com/bjackman/linux/blob/github-base/.github/workflows/test.yaml
