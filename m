Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0111A33F3
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 02:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749609154; cv=none; b=hjROVk4oVQRbwRQmc5WzKiDICQPfGBwWIJuiKr0hUSoYSlL7IG+tN8YMwIuTnXBh9O9pHP/1LzFqs7aIP+aEXw0Q8CI0WG6564zACpxcz1kVjlMhtjl5npbGAi3oAjR9sEXnKLFVR5zCxQHrAWn+XdzyDpP8BP7ov3580AyV7tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749609154; c=relaxed/simple;
	bh=Q49dfO4ktadPt5lTJIjgNuUdGjK56DUaqw7mZzZ8YhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PiBSza4isj6DAUS3P9NhsIfe7NeeDi4fKmW4sKFUJ5CSx1nUGloBf3BxVAzI+qfmC88WmJdsUSYE2sNHzDK+hh+LfmvgrZFzUedI8nZj0TR1D763/qhYDBwlvzV07TR6FdPHOawt3q0iuwtJ4yTCqChG3cJUIw2Jt510n3/wZyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NYvTDXvi; arc=none smtp.client-ip=209.85.208.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NYvTDXvi"
Received: by mail-lj1-f193.google.com with SMTP id 38308e7fff4ca-3105ef2a071so64472661fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 19:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749609151; x=1750213951; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q49dfO4ktadPt5lTJIjgNuUdGjK56DUaqw7mZzZ8YhE=;
        b=NYvTDXvitk8zyvA7WQOPT44BOJMr8KJ4W3ckyCa3N5Ct515TdQeMfz3XZn/F0PRbD6
         odzpxZlYkxYCfrSotZEIFHv832idqZPlZG9glYGUg5vMrtrfMZp9M0l2/UbALFyOuo78
         unCPEdjBrvJpbkbj4Z3bAMh8GG43DjnN65/t9xKVvqtAjUBuPWQFXluVUNt1G89ZLPcc
         Eoiv94/T2mUFGzkS0yHw2T70ibJT6hoaILxUnjhYXf5G+NmjysfgkHNQtbPZS0I+eoHl
         acT5Ix90E68iXDgqesZI9dlLt20h4WhRJe9oEKZ040Smscb1JIrkRXurJVQgDqpX7wJS
         GKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749609151; x=1750213951;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q49dfO4ktadPt5lTJIjgNuUdGjK56DUaqw7mZzZ8YhE=;
        b=B9bgijCouN0cXgTqBSC1ixbsliEpE0pdZXsIckQKJ0RG67bR3tVzfkRhl7vzuzMuvB
         eBfVT53fe7u4OTo1baN0pZklFkaoPSvm3YvN/kfuZdpaQrIpaTL/Dw1aPiHv8myJEuDw
         Ro22U38XN/FAAtVgtE6/UAkprNpKqxKL/w+WkN/vd2Is1BQsOy6+D7i490pTRJbCY+TH
         VanubCV8EN06lfIirqRwat4Fv19FQ7sYJQM68+OK/9KdkJcyAWUW7i5s2TqcZ63QPsNl
         +hV1GKrPQyqO/BqTPZFfb1DBbGaFPiku9+EIhxMziD2TF4UOvK9OVdF/aznqgY2LngqY
         D+mw==
X-Forwarded-Encrypted: i=1; AJvYcCX8+Ag3BlupBT3l71SExfxEjsbK/oZomLj8ZUlOoUlkpu4zU+DvalNjHhNSCMhm/10CxaKU9WZNNgsw+aA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnt5W4qXA7nz0hn3LRgXeDiW7B4CDA0J/D0Pw8saWI1/MSvEn6
	dqbo6LHYsbY2Q+gXjlsqFGQmhcZWyA24ACggig7YmTR3tK1COVjH+OQNfNl1y9iAHUHmiK5hbW2
	sFN0Z/bX+pIbJGCN7ruZN3pTnyUpGJUE=
X-Gm-Gg: ASbGncvNKMVZAbSBWxZCuleHbNEb/NdQE+edkmLI6kVFmKo7CqOkjmOvHadbKOQBP/Q
	glT8evXxtgxqICuI2IQXaZDsL+euH36BDIYJDjZ2s13O08CbK+eSPpP4uVHNOwp55+kX3XmotE0
	X5izCeMiu0SNeXQejevLk2oGr7UTP8pX/Xs6GWyetXjLgy
X-Google-Smtp-Source: AGHT+IEv+06Jor0vUte4FixyQjbHihFdkyAQS46oQ5OABhSGXDXugyoN5ZFIf+s38dbomjU9u771Z7hBWKNrLGcnqVo=
X-Received: by 2002:a05:651c:507:b0:32a:7f39:1a44 with SMTP id
 38308e7fff4ca-32b222c7d19mr3361961fa.10.1749609150775; Tue, 10 Jun 2025
 19:32:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407134712.93062-1-hupu.gm@gmail.com> <CANDhNCosvML9XKH8HV1QBXKzxt3zMWxzsPSUfYxoyPCORf6Krw@mail.gmail.com>
 <CADHxFxS+qpmD8r1uxru+VWLj=K616=jLKbBgUR3Ed7ZBY1gidg@mail.gmail.com>
 <CANDhNCqgCGtWubkuMpn=GdfLwP6d5kMEvbhoQL4oef5yf_74ug@mail.gmail.com>
 <CANDhNCqv0iFMJanxj4uTyOHGUGxfCqb18Ku+w5y9JFKRm0M=Rg@mail.gmail.com>
 <CADHxFxQoNOBCOMDsh0iNrdD=ke=YweVZgZrTWbBQRA8SYy9McA@mail.gmail.com>
 <CADHxFxRd66FB6=wgY2-NLxqiMGZui+um+h2LUe4+hwXabdUpVg@mail.gmail.com>
 <CANDhNCq+xE4dpecHio2x6TJXMXxhQjrDk1oCon=NR2b+k0Y9yQ@mail.gmail.com>
 <CADHxFxSVdt_oG=J=aJDfkOcYEBScUxKV=NZNUvgtkAj6sbWvGA@mail.gmail.com> <CADHxFxQ8GqndiKGT2z2aUFU5qQQSU1QxQR1CrHsaa8ShrJ6D+Q@mail.gmail.com>
In-Reply-To: <CADHxFxQ8GqndiKGT2z2aUFU5qQQSU1QxQR1CrHsaa8ShrJ6D+Q@mail.gmail.com>
From: hupu <hupu.gm@gmail.com>
Date: Wed, 11 Jun 2025 10:32:19 +0800
X-Gm-Features: AX0GCFs6ZEDWFe8v7KH0bZChPHbidT7xhIoG24J1m1CZ6yOD3r7xY_5G38I1Cws
Message-ID: <CADHxFxRN5yPwk6jVcnz9dpsZaFk8=91Jto9euBiOnrYzqncfdQ@mail.gmail.com>
Subject: Re: [RFC 1/1] sched: Skip redundant operations for proxy tasks
 needing return migration
To: John Stultz <jstultz@google.com>
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org, juri.lelli@redhat.com, 
	vschneid@redhat.com, mingo@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, hupu@transsion.com
Content-Type: text/plain; charset="UTF-8"

Hi John,
It has been a few days without any response to this email. I'm
resending it for further discussion.

Best regards,
hupu
