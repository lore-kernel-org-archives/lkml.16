Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44726218AB0
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750926781; cv=none; b=GJPmISXMm/mQV0bLm2OiAYfQDQjJbElouXnjc3akfxIp+yB0vaznvczbyeAcgezAgMFEKK4n45XjygocYqaTPBSEVyxg1vaFSmZ1rYMhlp5siZN9/e+sJZrYyJmsmzgsMD0YAxdhqPG1dyf8wJ2T4y6VeugV4twJx07vlGUn+TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750926781; c=relaxed/simple;
	bh=/EXnmyDqhgwhNubqEJ+Z7XqtbTMhvh+9M0BZvcE+S0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g5ENq5BAd4nK3f3OF0ct0UwTRvFryPsy52esQb3K52VV6eFL1jJCc1ynKbsFZJ4lze30psDlsn4ldk27Dt8HmkwxSmZZcHVv6znM/WnAIPryH4dBZRQac52fgU/3AG/DOB3FQ6vyA256xc1VdRNbm7oBJmpA0JPtKkAYx4R86Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FJLM/NFG; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FJLM/NFG"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32b561a861fso6110731fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 01:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750926776; x=1751531576; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tZyqW6LTgx3qQCdMf7DVmwLH6L5ZjexEcMKkRJNzkQg=;
        b=FJLM/NFGEiPONX4FrdSZ0hI/cQk82eO+Lo5YVkchHl8WweUn2tSD6hRktRnJ8QG3vo
         vTJolU3CiS6Cy/pbdjy14FvlPP2Kli+M+DptWSEI/w0U4sem0vUwh1eUvq5kGAYIYvzX
         O8JseJRSOyvj4mqXPvxoSv31hO8QB7HK0gWaImazyNXVnceVZd4E1fYedMkLj1srp10I
         0pej8WZrfLXOJ2fMKlViXyXGNXbe8Lf9ViRgjzppBCSI14J/f+hJxdgsrInoUvTnYufR
         kFVgkbqHWPIgD7tBdjSK0WMLLhnE7YBhuGjSKfnqUnRCf/DC/GT/tGNf9yo/pdRwoy3h
         vqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750926776; x=1751531576;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tZyqW6LTgx3qQCdMf7DVmwLH6L5ZjexEcMKkRJNzkQg=;
        b=X2ix9sT1Topl8mEEIPLp43MLYsF/dSa3olg4ChPsOpA8lu43BICDCqFIyg7s5VgiFj
         J7HlC+7pZCV0BUxCavW4EsQDsT0/4fxbnBJAN/9+pkvIlkeQuXPzQ0SFU7ppCwh/ch4u
         Y7xGRDva3YirpLCT/oSRcYJHWLdej9FYRkTPr0piVprRuA7o+zepCAtUYHzNxyVJkoNv
         ECZW7emz5N/nuLJSOQIweM8cs+jMwrXdTdS+j/4kEnlSWRbHXC+/qjjBhe3QveMz79cr
         mfwzUsWJ3nCEtLyoLNHLPEw8i+jZhT3znMnLduP3tERescLqycu3ca7kd9PwpejnCYhj
         8fGg==
X-Forwarded-Encrypted: i=1; AJvYcCXqJhsR4QPJoQKYXLwF40aImL5Q41010Hf5BcVBlbmKWkDGl0doBahUZ7JkDy57wFqjaNSVtfDYGZgbO5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlB+w81IHQ0IuoPBOrZQwnKuItO5yPdD/g6rsAgsWhV+Su5Aol
	ewqD11tr0/vwt7LdxqDSt2ecJzfIOD1UnRjPZxcXzHktanlReYeHXrHTRRUwAcI6AMB2ah+GTlH
	vKWYVaUqF7wh3ys9Hzhz/spclIw5eBHtqULPVtVTM
X-Gm-Gg: ASbGncsjdzUbuyhKC/at/EcZLuodaSdrDssqVyQB1X22rsxPPZUIpgDs5XKx3Wzwblq
	CPFVk2AUOk3Mv0BWPvXzXl8UYPjoK5gptkWy0tAldtWTr3KUv5gcKCG8P3eEFtMIhF5rSUnSudq
	bmQ/2QzG6DSBRtzqGX4gQgMOWP2ApG6oD76FHvqlHrswhljN2VU9lCkvDXtDAnG1TxZCc1pYd0w
	Q+F
X-Google-Smtp-Source: AGHT+IETo+L/oV+R/tmnVYW2Qg4rA4aBv5GWRJ/qPp97+u4UznXO8eCK5nvO+CRrEHedFW1CDFl6j9Mm6w/bd2AvpQI=
X-Received: by 2002:a2e:9059:0:b0:32b:5eb3:280 with SMTP id
 38308e7fff4ca-32ccfa91d8emr7830071fa.29.1750926776245; Thu, 26 Jun 2025
 01:32:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aFNYQkbEctT6N0Hb@lappy> <20250623132803.26760-1-dvyukov@google.com>
 <aFsE0ogdbKupvt7o@lappy> <CACT4Y+Y04JC359J3DnLzLzhMRPNLem11oj+u04GoEazhpmzWTw@mail.gmail.com>
 <aFwb_3EE2VMEV_tf@lappy>
In-Reply-To: <aFwb_3EE2VMEV_tf@lappy>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 26 Jun 2025 10:32:45 +0200
X-Gm-Features: Ac12FXwPRCYLCXOzZA2k06HmxFcMR3fWIsqQHlWuGEU7Sh27__v25jmGtwOdH6Q
Message-ID: <CACT4Y+b9u6_wx9BU0hH0L6ogGKN_+R5T7OsgJVFAWm8yeD0E7Q@mail.gmail.com>
Subject: Re: [RFC 00/19] Kernel API Specification Framework
To: Sasha Levin <sashal@kernel.org>
Cc: kees@kernel.org, elver@google.com, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tools@kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Jun 2025 at 17:55, Sasha Levin <sashal@kernel.org> wrote:
>
> On Wed, Jun 25, 2025 at 10:52:46AM +0200, Dmitry Vyukov wrote:
> >On Tue, 24 Jun 2025 at 22:04, Sasha Levin <sashal@kernel.org> wrote:
> >
> >> >6. What's the goal of validation of the input arguments?
> >> >Kernel code must do this validation anyway, right.
> >> >Any non-trivial validation is hard, e.g. even for open the validation function
> >> >for file name would need to have access to flags and check file precense for
> >> >some flags combinations. That may add significant amount of non-trivial code
> >> >that duplicates main syscall logic, and that logic may also have bugs and
> >> >memory leaks.
> >>
> >> Mostly to catch divergence from the spec: think of a scenario where
> >> someone added a new param/flag/etc but forgot to update the spec - this
> >> will help catch it.
> >
> >How exactly is this supposed to work?
> >Even if we run with a unit test suite, a test suite may include some
> >incorrect inputs to check for error conditions. The framework will
> >report violations on these incorrect inputs. These are not bugs in the
> >API specifications, nor in the test suite (read false positives).
>
> Right now it would be something along the lines of the test checking for
> an expected failure message in dmesg, something along the lines of:
>
>         https://github.com/linux-test-project/ltp/blob/0c99c7915f029d32de893b15b0a213ff3de210af/testcases/commands/sysctl/sysctl02.sh#L67
>
> I'm not opposed to coming up with a better story...

Oh, you mean special tests for this framework (rather than existing tests).
I don't think this is going to work in practice. Besides writing all
these specifications, we will also need to write dozens of tests per
each specification (e.g. for each fd arg one needs at least 3 tests:
-1, valid fd, inclid fd; an enum may need 5 various inputs of
something; let alone netlink specifications).
