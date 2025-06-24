Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743453074AE
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750804487; cv=none; b=MNmJo/EhlcGEQsmY8BgkMj6XqXwCoDSnp0iw/8OaehDwCSaHMUevvTvjeyBUt9rBVGENKvq/pHREg7lDce+VyJBjuoCGOWKx577SDn6a9S8VAKnODZBMHHcYCYSOJuGrZ+YIT4LZQK8Xi3eMkfq1vJzh6tquz6HrKByiuMjxzXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750804487; c=relaxed/simple;
	bh=mqOQ7YDav2hYhJQvVJTdR3Y18paK1zzfINIZQc/Tksc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tocv3DQW5QgHkrctyWeGuWEEC2NyeLO6/WqEZq1MY42hrWu7rxmVeAF7G9xd6lkqBUCDcXzHVHqhf6lY9g14y8xJ+s/YelBdzUwt1ngIk5wv4aejqtZoxH1sZXHG1dRVGoPWgQ36W5QW6xteLptEOCfbwCWqRsVKXqh+OC7HbcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VBn9UhOy; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VBn9UhOy"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso2408a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750804484; x=1751409284; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=biMr0EfPKFoYywDXUPvbYBfkKcArAnlyW/BCbuWbl+M=;
        b=VBn9UhOykxXNSsdW8Bj7PbVkHlTUm4XXbndNhXweQDJRtvpdv76dcQNgM4O/Y+RRU7
         25aOUJT84A2L3+o0y84GLpuz1S4D/8anq+JfLziwNw9hky4uoDevKAtHwNRXhl11QFOz
         98w01FORVued0CHPL/XCX4QnZp8B5cP8oMlA63X2ZvQ+B8MWsnEoB/3WZc4iDkr6vnmw
         Fuor6bpZit9DjtVGgtkWD4xTFgrIzMlTK2LjQFd/EypuBuJZtUzgqS0GohYcG03xGp6g
         hdpnYysbwI8UjPIIZENu8LJx7hcHXIzyetEgle2VqtVbcF0kEzwQwG6SykvP8O76J7q5
         Go6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750804484; x=1751409284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=biMr0EfPKFoYywDXUPvbYBfkKcArAnlyW/BCbuWbl+M=;
        b=D2CnJM4z/+YbesEbPz5k0aJdYz+tyCORcEuc+cKYrrGKIKCIe7Kqa+jlDC+D4ZUozA
         U7OowBWeFKEbKp+k7mloz9SY33IRBmTjCl7DQViiDEsQoJQIzdLUOEg0nB+n9BMt2mv/
         RmVmtn3Fq2euWhbdQwpBV9nLArYV3un5XwAzS1z5QXfryzCn14EEnbvODHZVsHR8DgcD
         vaI8O/5qyJbi8Afk8px2QkIvhVd1wviTUpAI5XGsESgvtQT1iYLzKLN3W6ZPIv+hOZta
         nJ5BizN0rq7L2QQyTEn64iCKuYwzeR03YdUPtTt04EJNtRQ8aenY81G1SndzJI7ZprjM
         /D8A==
X-Gm-Message-State: AOJu0Yy3TUH/u94CJuwbn+YG2i58WoCLCfYo3a50laImX6XqqEwf0OP3
	/ndYuNEoWN9xvLsaXIq1wiiQalOZC4kw3tVVcBDTyPFe1eN0F0kC7WTFJd4IveMjCVnAYRfReOO
	pzKXAa/yp2G1xkUM7yMi38SEK5DkDNngbBUt0RPw+WTlHn4f3A7/fPZ98HaQ=
X-Gm-Gg: ASbGncvkOS6TUXPV9qWMAjAzbMgSQWxc5dR5WUJu0hCUpebogT8MxUOmTKYD+3eHZ74
	FLS555qWcolezsNU/3pt0ZYx+ZO2/GISORPDDG7/PW544JfF9p6xnNRBjWuAX66zNavmxvSeLRZ
	KsLNg0JOJWC7t+yxeasIRcbwROo54pMlGjahGW3tywixY=
X-Google-Smtp-Source: AGHT+IGyVlom+ZmT7GXmz0HeL4UsVQU3NyBoFLDHBTl/atp+JIdz2fxGFnYGVwpASG9nZ4LRyNma1LwRWwKsDs1mnsE=
X-Received: by 2002:a05:6402:27c7:b0:607:d206:7657 with SMTP id
 4fb4d7f45d1cf-60c4f9ad7demr4740a12.2.1750804483639; Tue, 24 Jun 2025 15:34:43
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530185239.2335185-1-jmattson@google.com> <20250530185239.2335185-2-jmattson@google.com>
 <aFsX1anrZGWFsbF-@google.com>
In-Reply-To: <aFsX1anrZGWFsbF-@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 24 Jun 2025 15:34:29 -0700
X-Gm-Features: Ac12FXzCwsN8NPivZZHPiGwh0dl954eI-7CnHozxpVShx7dUnu5f7IkszxcCLmo
Message-ID: <CALMp9eTyvost6ULK7QwCroN0xaO7mmxCqWcywsKMr0OaAJwsmw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] KVM: x86: Replace growing set of *_in_guest bools
 with a u64
To: Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 2:25=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
> Can't this simply be?  The set of capabilities to disable has already bee=
n vetted,
> so I don't see any reason to manually process each flag.

I love it! Thank you.
