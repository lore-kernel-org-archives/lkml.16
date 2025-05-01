Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB5552F99;
	Thu,  1 May 2025 08:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746086838; cv=none; b=iGFq3WAOlgqKQ5rlDiI2PwWmV8+/LYVtrkCnhSc4W5KKiif7dFtg2JMJyU2jMPkkl4IbgJvyukOVuXt9HG4hueloXQm/9N2mYQpM+ccBTpAuK40AmsBQFuzX5vq+ZUS9HSuCYPsYtjzF7CjzWbYwc0lL5z3RbvlZGBDBbTweyDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746086838; c=relaxed/simple;
	bh=PjcXf5636IFZTVRzmWhGQO16emGYY3p+a3JS1koR874=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pp+U2I0a2EUojvP0QOUkODlGKwTs5NCOY5TA7lpGXj7X3GN7q6K7mMoQ8ub3O3IwBPLiX0MqMokyqAjpebc1iU04tgjqYRf2P3JEadac3z7ymr7cLviXq+xQM7Ti5NnGV0R10PBFkoKlZYhfl1+00TnJb3NGCO8QrNIGbRCsDHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f4EeRpVT; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f4EeRpVT"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-85de3e8d0adso13567439f.1;
        Thu, 01 May 2025 01:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746086835; x=1746691635; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PjcXf5636IFZTVRzmWhGQO16emGYY3p+a3JS1koR874=;
        b=f4EeRpVTCaeZuW287W8b8xuYh6l9HVErv5VQzGvnrVFHKcsFmTfiwh1YhkDmqe6qxp
         QPq011ZOlJ6/vEfrcKd+RzJRGC1jOAQD/BfBmH67KCG3x26GXldNC9fAXU57Jaryzzti
         l3adtGhyYhzMYTVJTO3RF0/emeW95Vsif0Evv67cfieMnYem1W4fTYMoNp9hbjXSXMm3
         iwjmG7lj/Wly/gHU/W+TQo8YZAL79Ap+T9c5WSh2v13cSLt/YTDT1v5d56MxsIjRNdX9
         2n3UZlbeigbLwzzLgElcRikPvVVSuj/zbexRinoLSoUii8HJrzgPd6CSUf49qk3LEqKl
         +aLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746086835; x=1746691635;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PjcXf5636IFZTVRzmWhGQO16emGYY3p+a3JS1koR874=;
        b=lncbq+HRpKS+iG8dxNWlHzz/uvkXO/3jJgI1K4FW9noFKQMeIxr3DbJGwr7z3tlTKu
         WbSSXSTkg/krWph2Fqw+im/kt5U1zGyggKWMLNbtU9VSax7R2AFGL/R9aoDEkwoaRAsg
         WJNSiW5lcrb591XJHNkXNpNqbJZHZ9Nu7OIsw53PXf8ipi8X/LK47Ef6QMzSTSs5yOk7
         d1LFRlaSZEs+0jyZROOWfqGqfTlWeIm/mouOhqBWASH3ceb+hbNNJ/51TLGDXe+BooMG
         Npd6IsWJuSNmQChilVlExEcnVniHw/KeSUrSNhiYw1/RVH0+Qy4X/xAX2buUqwk2qE9V
         Xwvg==
X-Forwarded-Encrypted: i=1; AJvYcCUwvWt2w8ErA6gMxQadLnETyMZD6lZ3PA9L/w5bzNa91+ZDWsSXmj+/Kue11H/HXGDQnr7sIIDW6RXM+qe7@vger.kernel.org, AJvYcCX07Xf8jtyd+izTSjRaRVY1x9wYJq7SJqiCoXnu5Q/1ag6yKBNeCCyF89qlilknmWaPgkI3ye6Y3S3Usw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvB8LgUz7s3IToiLYV5hzGd0Dby7EMeYzquz1kLprqNLFDlI5O
	y+v4GZzrnsNoS05kd3sAKg2mmFP2UYwigMkThz2loLR2IFoffRAQElTR2cx0rb70Iwaa01uNNOl
	8tgTtVQisGDpqmkeWinpvlSaEGYk=
X-Gm-Gg: ASbGncs6pW2TFRfq1IjTLYHd+9SrCEm5ku5zozDOqfN+OneTiVqd0/vePIYvNu96hxs
	BHRNX6rfIFZrVsyhW/06sICa0rsp5XTmjBEkH9uDsJjihUXgwa/JNLy5E1OPXRkZeTcEBbh4nx9
	1pBgS4kJ+KfzNwscye5W5NY0DIGDWlPs3qGNRGXwhIZZjCNlrhXrnBGw==
X-Google-Smtp-Source: AGHT+IEYSAG3N/MEb3nYH8i6LB46ttEgsv469fcbnMmSFA6MDlo8lyL6PtHPvH0H8GxA67tlECckmu/cf3fYWQsvq2I=
X-Received: by 2002:a05:6602:3e9c:b0:862:fc1e:43c4 with SMTP id
 ca18e2360f4ac-86497f9bbc7mr711942739f.7.1746086835346; Thu, 01 May 2025
 01:07:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425200051.2410-1-a.safin@rosa.ru> <CAB95QATm-iNJokfcSxpen3YBbx6xNUrecELD44squoaqCQ-b7w@mail.gmail.com>
 <8dec9c47-d13d-4e59-b1ca-fcb9e3beccbd@roeck-us.net> <CAB95QAT4JJFYiXviJB78KELFnsitDj=Zb3EM_1F8uqiRHMwBhw@mail.gmail.com>
 <38c7114e-3ea0-4f4b-bb12-5715c992656a@roeck-us.net>
In-Reply-To: <38c7114e-3ea0-4f4b-bb12-5715c992656a@roeck-us.net>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Thu, 1 May 2025 10:07:03 +0200
X-Gm-Features: ATxdqUH3c3ig6bA7KbtwFuJkO9VLGNjB3wTQ6GXhV2cEOATlPsnaKSoLyqUbxhE
Message-ID: <CAB95QASErsOGibQ1+kB2LjNr-v3-KS86w8KvGLurB67D_4Bt4Q@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (asus-ec-sensors) add WARN_ONCE() on invalid
 sensor index
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alexei Safin <a.safin@rosa.ru>, Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Apr 2025 at 06:13, Guenter Roeck <linux@roeck-us.net> wrote:

> > Thanks for the explanation! I'm still not convinced that such a
> > generic error message (without the type and channel) can be of great
>
> Feel free to suggest a better one. Maybe I misunderstood your earlier
> concerns, but it seemed to me that you objected to having a message
> in the first place, not to its contents.

The only two conditions I can imaging to trigger the log message are
hardware and/or firmware change and RAM instability. In both cases the
message is not helpful: for the hardware change case I would need
sensor type and channel, for the RAM-related cases I would need to
know how often the problem repeats itself. Neither is possible with
this log message, and therefore I'd rather log every time and with
sensor type and channel.

Best regards,
Eugene
