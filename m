Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5076824290F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 12:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744893876; cv=none; b=N3aua281ppTArs/oqSdwXKw/Gi5K7BNfvedDDKDb8fuzonlUSQgewtOGAszOIEYYWsJPx4BA+S+DMMU5YwkvUKOub7oZroVsSXQ9fxze8HqBqO+drjddty7x6XOo9wsYtY1xbXIr4iXthxbQQq3ttG/TDhiH3q7+ZqPzurVXrtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744893876; c=relaxed/simple;
	bh=/Q1QqZcrRDm+z4zKny6B/oOLvOzzSnBzA1wNvjUJPDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZvvuqJJzAxmc7XTF5w75XPZt2HgxGvA6f3vLhV75a622+SxePAk7k77IO5b/UmZx3Vpzwx0G9YpKJlnKweVS1ivCoLp4kf5YxVLiq1bj4T4sNoR7payo6Al8kBmtUy1xzrL0J/gYQOcD6FtgqfzR7Zg30uUVHO2LJMS6NN9KTkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kt1agLx4; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kt1agLx4"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e8f4c50a8fso6845976d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 05:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744893874; x=1745498674; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/Q1QqZcrRDm+z4zKny6B/oOLvOzzSnBzA1wNvjUJPDU=;
        b=Kt1agLx4MSD3094uu5DWA8HxqcrEtOw4iu/2Q37D3Dhj75BP1plHyw5ZbLGuq3EG23
         uX+or6n3iCDVEUCCuwdQU+mcbJYuxBpht8ubOyWMsKlqvtWIQ5spMFDXFA4JWrmH6iCJ
         9dHmJOJDa5oEqKlnTSD6lcspR70OHFfylb/NfIfTtg8C3NcFzqM/oX9Hji/R+M9dpNWz
         VDnCffS1dh7JZMMK87pwnMSaXQCt+5finZz/BtpzbMglakocxC0GuthKOZ1TWfKJGfOL
         HnQyXkNsH7CZ33dpjxYqlNfu4wYovi+qk/Q/Z+66ke7qXJh1uTkglg7uYE2lkpf/rOql
         bCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744893874; x=1745498674;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Q1QqZcrRDm+z4zKny6B/oOLvOzzSnBzA1wNvjUJPDU=;
        b=fjP0rswRYLfuPwWljmJ6oYFU7Gi9F2jfg6td/RpS/ONL7Rvst+CQy82QYw/u6gpuhX
         nPJ7GxE7Zu+Xt/WpFr+gNYEzOcG6heqzhe95wXHjb+wnsX0vDt9+kC/YRRP8gH8NQkqp
         zQ4quWSRrpFGVhUxq1U4R0/4SccmJa44b1KZcOWbj2n0aTIJyEmF6ab1u83+u6fYrTFQ
         vKuaeH2EJYmoI2PLvZPZc0rMN1iksTPCVM9GEdK1zlnNS6nV6yfSkwxP5LE5IXJI4yO/
         kes/tjbM4R805Imd+wA8SeC5Vnv4jmcf4J8ClElbFWtQH9Kamz5QIehcMqI0o7cUDtqS
         mi9w==
X-Gm-Message-State: AOJu0YyuY4wQen7MVyPebArV400dGDCZlxibrR0Q4tlV8ZNYbZ8x8O9e
	bvMEf6ah9z6p1oomVXC3u4TWoUtISWG6e6ocAYj0aGmks9kOCNGk1vM03AVg1p9mp3X6hhxqg5q
	UPVFpQLoaqWFZxbRdBKuGaiyz37R4nC4j5snH
X-Gm-Gg: ASbGncsLJ6M4IbeK1LJnV3g2N7G9ANbz6Jphz2jUAki/65LH7u2chXC8C+VSnizAgky
	1kyjjJVTCJbbYwyoUTrlWHC+O+GNM0EmWrFRNy+wThbiBmT7VG0e0H66TEiOElwMWcQkgyDRQEP
	OdXHDuT2dihpXOhliHfCKFW4lvAIvcl5spXX4xe/cJxd/fUiAn5m0W
X-Google-Smtp-Source: AGHT+IGDKku5hzsXeufF9xTbqlxVlKhjCgIAnMWYEftHB8mcdakBNxGXHUr6s1yQgujbrtUlTM9gptqG2IOLlbY+obo=
X-Received: by 2002:a0c:aa07:0:b0:6f2:bcbf:1030 with SMTP id
 6a1803df08f44-6f2bcbf11a4mr17778526d6.43.1744893873997; Thu, 17 Apr 2025
 05:44:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416085446.480069-1-glider@google.com> <aAB9sUllq/xR/Maf@hu-jiangenj-sha.qualcomm.com>
In-Reply-To: <aAB9sUllq/xR/Maf@hu-jiangenj-sha.qualcomm.com>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 17 Apr 2025 14:43:56 +0200
X-Gm-Features: ATxdqUHPHhj8x6Foqmh22Sf3Tnz5IYfxqO1r6Iz-bl_MdJoEp9NcRi1P5468ovk
Message-ID: <CAG_fn=WyvDopbDN3YrrUzS-aUgbVKTDRv6D5vArnQbSkp_xB6Q@mail.gmail.com>
Subject: Re: [PATCH 0/7] RFC: coverage deduplication for KCOV
To: Joey Jiao <quic_jiangenj@quicinc.com>
Cc: linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	Aleksandr Nogikh <nogikh@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Marco Elver <elver@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

> > Below are the average stats from the runs.
> Is there test without trace collection? Is bitmap only enough?

If we bump the bitmap size to ~16K, it should be enough to keep all
the fuzzing results from a single run.
We haven't experimented with it much though, because syzkaller
currently processes coverage as an array of PCs, not a bitmap.
Changing this would require a major rework of syzkaller, given that
the positions in the bitmap may differ between different machines, so
we'll need to maintain a reverse mapping between bits and PCs in every
executor.

Such a mapping could be implemented on the kernel side on top of the
proposed patches, once someone proves a need for that.
