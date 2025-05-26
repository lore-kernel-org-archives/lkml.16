Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460B31EE03D
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 09:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748250531; cv=none; b=qhAD22uLPSRFwc9hRjdoq7bStVko/vaUWo7flHOuknhRGRQUyp7aeZkOlxnNcoyzdB69t4ZZoPJbru2j6tv7BS8GsOZe6+QAJL8MOW3I+85I+++uIKgoQuXXlTLbHPRKsDaDQWvHUhZYMasxR9eOjjdGBuO8RHNUXRF/iMWgrFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748250531; c=relaxed/simple;
	bh=MY3yWw8Vp2xlTwAqSqo+mPvjKSzOe/68Igjza+AVaBA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OBoFgFqqlrI08cEtf8X21LqRMr2x6MNom/T6plD51xWpdbwQ7frli+84jBpKbH3C6agPz+YDFQin7Phkp+Y3rFHky0nKrzgKtMl5sKaqhZsgu0PGJe2HHiGLniQpxQukPvOPzjlwDLAbErPVwV0USt74RGHM4GnnXbrhCxaQPNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AAnYrsLE; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AAnYrsLE"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a4d95f197dso451277f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 02:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748250528; x=1748855328; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vV1ZLtaPYPIU9C4hlxpLQHgd5RO8hZ+AB4T6N5ac4gY=;
        b=AAnYrsLEaETAbkoUp2cftkcR12c7jm3VBkzhUw2ry/3TL0hIG4RHAOSciOGJhF5ujV
         UyXHnXVdpTjQTIJbXmqm8WXU+pPuo0BNukRQKAF5MEyxaXejOqcUlevtB4AlSCa8aAih
         ofLEgZ5ot76TtgRUBuWOtrwwuX1qx5STA9iogknt9yiFA5sV2JKvg214W4JbjskgD/2C
         8dPJctIvpGx+JZFwYdo9WImU9jz6+AHQ/1aW4n8JQv/13r3QRDvBVxlLSlV78zDSpb9A
         OKGDrJ9mGapGzxWAL0x8Q5pAlwN2KjCleBIyRnwsixG4Z663YRnZACrF8PYPFG31qMcT
         9K0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748250528; x=1748855328;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vV1ZLtaPYPIU9C4hlxpLQHgd5RO8hZ+AB4T6N5ac4gY=;
        b=Ii9Z7hURbXkeTiyxeHoGvWUbgqZevfR8q9VaGJRQys6NrWvzWFxvDaVtqbsZUIlx2j
         2wbFLDG62w98zwstdu9b8hGnqpkbMgw1O0CKienv46qZ74OdDkkaIXD+Q8p2fneggesO
         ojjbxOcISsW6E0XklDcKBPSlgLNN1QDSCALWSzqnsXXAuE7KYU+74fa3RtALC602AoDD
         zqYDxgXFT4PiFtpaBvqA1PB9hv3OMFLVBvirpMCyj2Rjh9uWEcJbecqB5xjfImCIYaUs
         vIUQpujzrXhdXoF+UR1xubkzrRr5BUdXCOIOivjWnopB84vROfcQQCyb8gO6zWWSCufT
         7ywQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqgt0hruWstuJiJRvcCGVNdxwrhdStExVmuRFdAIXe1pjy0zMyKFuqsqVqeUMXv0LmbS6LnXcjjVaei5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YydF066pUljo6CHG/FkCOyrKs+DPNeLtOQcldyX7SMVnuho7en0
	LnDh0gsJOcPMioATmV7QqpGl42/hsQWc4qdUb+gY/NBTYLU+bJGz3TB2HpzBzKO03TP2LPSA7i3
	HqzYcba94U3iupg==
X-Google-Smtp-Source: AGHT+IHAQLjrmeWjPRISFIiXgvA5maVZRslviy+wu0GfEc4uIyIYcxyOpXuuEsFBPNoXDEFyqckMW1YRit0mQg==
X-Received: from wmcn11.prod.google.com ([2002:a05:600c:c0cb:b0:44a:82c6:853f])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:250c:b0:3a4:cfbf:51ae with SMTP id ffacd0b85a97d-3a4cfbf5352mr5135469f8f.4.1748250528651;
 Mon, 26 May 2025 02:08:48 -0700 (PDT)
Date: Mon, 26 May 2025 09:08:46 +0000
In-Reply-To: <CALkFLLK19Uqr2veWCn79cbLLgde5f+otf9Qx0xSPGdhdnekGrw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250501163827.2598-1-ujwal.kundur@gmail.com> <20250510160335.1898-1-ujwal.kundur@gmail.com>
 <D9V0UTL5BCLM.1WHR6F4UN14QQ@google.com> <CALkFLLLfxT1pQ_ySB1NU4KXOEGLd2wB8pbhpBG2HfK3_mLOYAQ@mail.gmail.com>
 <DA0VHZ6KE96B.XOYNEFMGWD58@google.com> <CALkFLLK19Uqr2veWCn79cbLLgde5f+otf9Qx0xSPGdhdnekGrw@mail.gmail.com>
X-Mailer: aerc 0.20.0
Message-ID: <DA5Z38N5WHO5.2FFOQZYC6WKMI@google.com>
Subject: Re: [PATCH v3 1/1] selftests/mm/uffd: Refactor non-composite global
 vars into struct
From: Brendan Jackman <jackmanb@google.com>
To: Ujwal Kundur <ujwal.kundur@gmail.com>
Cc: <akpm@linux-foundation.org>, <peterx@redhat.com>, <shuah@kernel.org>, 
	<linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun May 25, 2025 at 7:19 PM UTC, Ujwal Kundur wrote:
>> I'm afraid I'm too ignorant of this code to be able to suggest something
>> good here. But, can we just remove the comment and plumb the gopts
>> through to uffd_poll_thread()->uffd_handle_page_fault()->__copy_page()?
>>
>> This is not pretty but it lets us remove the global vars which is
>> clearly a step in the right direction.
>
> Perhaps Andrew can weigh in? If I understood this correctly, we're
> trying to assert that retrying a successful UFFDIO_COPY operation
> always results in EEXIST. This is being done in a somewhat racy
> fashion where a flag (test_uffdio_copy_eexist) is set every 10 seconds
> using alarm(2). IMO this is a flaky test, we should either:
> - remove this variable and associated logic entirely (preferred)
> - use a probability function to set this a % of the time instead of
> every 10 seconds
> - use an async library that can replace the implementation without the
> use of global vars

Sorry I don't have an opinion on which of these is the best (I can try
to find some time to form an opionion on this later!), but:

Fixing the flakiness sounds great, but I would suggest decoupling that
from the refactoring. If it's practical, focus on removing the globals
first, while leaving the fundamental logic the same, even if it's bad.
Then as a separate series, fix the logic. 
