Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EFC12E5B
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 05:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745643703; cv=none; b=Fw06SxL6HKzmiuYf6RLpV1Ng51ozC4bj2lg2swZ9H4hCtGLETXAqQI2ME55cuOrhfTJPsDcuZ7U7Vk2+UKz3MhWuFgW4PwrBGkjhkWpl+AdzKMddaCwOvu4adAzcD7hLr5QfzqkGNk1kxBxpweOOR8vM+2jnbtt0VEJliVr4Oe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745643703; c=relaxed/simple;
	bh=cXDJuE/yHxwV04PJPoKVlfNQF+rhGqfW81Ns96b8E2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lTsvJ8Ac7SSeM4sICTJCZu5BK2fOBZBncwSPiyWAnO3prKqJncJlHePRQ06ddixet1Xj1VNs41ME92r32cTfUrk0lQf9FztsfFXvcATUymTnXQhNlorh00gzaP/EifuGL/JMd2hERHLgCOHCnf3/8wBLvmCV3jGIlMQYom+MpsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=befHzSvp; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="befHzSvp"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5f6c3f7b0b0so5460168a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 22:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745643699; x=1746248499; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1Zg0s0tJJS2TEem3MFSImn2y5n2w5Xsq8PYaeuyKw6E=;
        b=befHzSvpC6nEm049fo2PSKtmwjM2uEQmg5QBRwJajygSMbCXpt5xtyA9HC+GvPcjeh
         xrfEV47/qGquenENAwLniSXAwYXJ/YW/GslzxAatGfRb5FOxtCWREe/0u0xenyBQj7JA
         OKZaMabyvs8QCcSUZD113i4bdZublzgxyIumg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745643699; x=1746248499;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Zg0s0tJJS2TEem3MFSImn2y5n2w5Xsq8PYaeuyKw6E=;
        b=YI+b2sMz91640V2m/39ePbjo6H/0RA4fIfC95ytLJ1eUxVkFMJqIb4OihhMalD0Coe
         py6Dq4PUhnDuHhAaVeytQoJZTQQ4z29jIlpxYra5QPI6+saNO8TuD3Dqm36sCNtFKpyJ
         NeAyxKboLg+/ZKCT0mawUjqzrrPNT5SPKrQJuvvCICxxqi6T/2UMFRQh6YpexUEN3pZV
         kxVwf6BpBcmfLdft9AWelYewve4cKAPdcmz2jehaCj7P2b09dUSfEHwPtyV63W+tVWhJ
         GaiguxU5UwBmEHXAtp0TkF7C2qp2XkXLIvm9oHQB3BH86YX4x0kfYPqOh+0RSWIj7NA/
         7AHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWARha/rY8RdYjmrdBxH7y+VEKyZqmiFjxSCNFz8WfJhtmJSiFcuEhQGgJj7FWPbXAFqoLPAPVGilEI+JU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6w2ONOITtGxyWLWwDuqMQeypXT/zt+lC9p3/NDTJ1uhf6S775
	anDSbV2FnHb80tZAJIYIskM/8vhM7rG9JnSpIyJOagthKSur/v/uZaRMLpgAuBrWqzZRLMiZ9yb
	Znpo=
X-Gm-Gg: ASbGncs6Y8xe+7msdK9UT4iYIc7kB6mmFgGFYhO/LefwDAURRVHnyX43KY8wbPt6xJ4
	W2KIe8B+UJDBjzR/P5+hT97GMKtzCBgt6JxaDSmlyJskHwj5nAB6MTO3SsDeeWvwm235x2vk2GJ
	cpTIm+r7Ma8OCBtYyvUl5wmWl6KfgnI7MrZQMMqu5JT9L3xiZhNuwvO7Vv95+yfnlLvH45riAQn
	s3rTTNGDPJO1zl2ycWx8Pfn6349fK072E9wOSPzCoueqJEX8HxfnJ3ZBO0l1W+TXVSYnpuuTAD6
	bbGOgXcGEGvOAMy7O+suiLVqe7gw0EP255r1ntDQJdLPLEUzy2BK0x+gHVJFiQUYq6ED4/CkPpR
	10+eCjrpO5ZsnZdg=
X-Google-Smtp-Source: AGHT+IFewkkJzfOSTIF57yLrVThn0tuHa7QmFb6fJqvoWOEUR2sTkknjZ/lRxDJ+xPQ7e0vd9xxweg==
X-Received: by 2002:a17:907:3d9f:b0:ac1:dd6f:f26c with SMTP id a640c23a62f3a-ace73b23731mr437631466b.46.1745643698340;
        Fri, 25 Apr 2025 22:01:38 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf9a64sm233219566b.123.2025.04.25.22.01.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 22:01:37 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso520434566b.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 22:01:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVjWPiYGNsPp80nj1cSbDbEeFAaA+pEKjmlKR/WTEaiWAUFMpy8Z0qOEhEkL19dFmyREVCQB959GFWwgZw=@vger.kernel.org
X-Received: by 2002:a17:907:7214:b0:ac7:ec31:deb0 with SMTP id
 a640c23a62f3a-ace739dce1cmr296946666b.9.1745643697218; Fri, 25 Apr 2025
 22:01:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ivvkek4ykbdgktx5dimhfr5eniew4esmaz2wjowcggvc7ods4a@mlvoxz5bevqp>
 <CAHk-=wg546GhBGFLWiuUCB7M1b3TuKqMEARCXhCkxXjZ56FMrg@mail.gmail.com>
 <q3thzkbsq6bwur7baoxvxijnlvnobyt6cx4sckonhgdkviwz76@45b6xlzvrtkr>
 <CAHk-=wh09TvgFu3WKaeLu8jAxCmwZa24N7spAXi=jrVGW7X9ZA@mail.gmail.com>
 <mlsjl7qigswkjvvqg2bheyagebpm2eo66nyysztnrbpjau2czt@pdxzjedm5nqw>
 <CAHk-=wiSXnaqfv0+YkOkJOotWKW6w5oHFB5xU=0yJKUf8ZFb-Q@mail.gmail.com>
 <lmp73ynmvpl55lnfym3ry76ftegc6bu35akltfdwtwtjyyy46z@d3oygrswoiki>
 <CAHk-=wiZ=ZBZyKfg-pyA3wmEq+RkscKB1s68c7k=3GaT48e9Jg@mail.gmail.com>
 <opsx7zniuyrf5uef3x4vbmbusu34ymdt5myyq47ajiefigrg4n@ky74wpog4gr4>
 <CAHk-=wjGiu1BA_hOBYdaYWE0yMyJvMqw66_0wGe_M9FBznm9JQ@mail.gmail.com> <rn2bojnk2h3z6xavoap6phjbib55poltxclv64xaijtikg4f5v@npknltjjnzan>
In-Reply-To: <rn2bojnk2h3z6xavoap6phjbib55poltxclv64xaijtikg4f5v@npknltjjnzan>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 25 Apr 2025 22:01:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiLE9BkSiq8F-mFW5NOtPzYrtrXsXiLrn+qXTx4-Sy6MA@mail.gmail.com>
X-Gm-Features: ATxdqUHWqxV-OrhDY-rKh16ASGQeohXR7OrfwoZY40F3L9gFfuaxZ44BLo28GKU
Message-ID: <CAHk-=wiLE9BkSiq8F-mFW5NOtPzYrtrXsXiLrn+qXTx4-Sy6MA@mail.gmail.com>
Subject: Re: [GIT PULL] bcachefs fixes for 6.15-rc4
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: linux-bcachefs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Apr 2025 at 21:49, Kent Overstreet <kent.overstreet@linux.dev> wrote:
>
> And you never noticed that the complaints I had about the dcache bits
> didn't make sense and how I said it should work was how it actually does
> work? Heh.

That's a funny way of saying

  "Oh, Linus, you were right in the first place when you called me out
on my bullshit"

Here's a clue, Kent. I told you you were wrong and full of shit. Let
me quote that for you again:

  "I think you're confused, and don't know what you are talking about.
   You'd better go learn how the dcache actually works"

You doubled down and tried to tell me otherwise.

You were wrong. Again.

I'm really tired of your constant attitude where you think you
absolutely know best, and then EVEN WHEN YOU ARE WRONG you try to make
it be about somebody else.

Now you are trying to make it about *me* somehow not noticing YOUR
ABSOLUTE BULLSHIT.

Just walk away, Kent. Because I'm very close to being done with this
constant aggravation.

                Linus
