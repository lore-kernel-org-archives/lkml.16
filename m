Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315C923C51D;
	Wed,  2 Jul 2025 12:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751458982; cv=none; b=sbGHQqeWhyYGCuyou3xB0dQf931tWdSsNb1k19FT//VgkBbH03LfjvH28eRUkKXlQN61MsYkCzVS2HaxG3vkCn/cYuazG7vkr1/COk0Bm6YEp2o8J3FilFjWRfcD5BR89UtWrIPWwEFRTMn2qYp2031J8lvxjzq5lyscOMnKIhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751458982; c=relaxed/simple;
	bh=fREP5uY0BPsOOovX90mnsOMYhXpfAS5vZic75Y4Sdfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DUJTiYCI0LkfuNNT7qQ5LMOeCYGIGbhTz6cnZQ6G0lZqDILa5Dd1Hj7Hn6OATtZRjNPcgeav8tAWC9rhYkbNSw3dd2gwhK6nT0IkvU8N9fVuX11GsJhmdODFtqAhZ+J7kkOfpcONvOTbgpD3sdsoFQUutWFNlFm2g6CoebGR47Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MW+iytsb; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MW+iytsb"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-237d849253fso8380405ad.1;
        Wed, 02 Jul 2025 05:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751458980; x=1752063780; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBtX4bnh7p2M5lSlgCIn0wi3z0x3439amoEBAePG8to=;
        b=MW+iytsbeM2j3PtrybtvRTGfHgrgBVhxJVYqdIriOXef4XhjCxNly2l4wx9IBRnRn4
         mAdgFktImtl/UKmJruCKGTRRIucrefpvqtD7mfcMXQkP9I6Wq5p34XZL8bRzP4CDzOfI
         AJbiEc+dSH78OCyDckMnP8qPMHQCy1Qj90MI+7jBNtV914KjDqDYyzKx6eCmfrLIJdPN
         80QvUUFEhhYANyavSI/5JC1Us34T+wZowRBzU/eELzSgHLXiD5pg+CNE/ObMK05Ms5PI
         FWVtHfZpfDtPlTedsxgXoTZ0QAHxxphQDQJellaKXwDJI7zKAsdnJKWfaJDjPc8ySRJ6
         PjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751458980; x=1752063780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBtX4bnh7p2M5lSlgCIn0wi3z0x3439amoEBAePG8to=;
        b=h1GsVDMPi14VBZYhEA8Nld0C3WEuQcfp7hKYSBrPvRkppHcedMxHW1eEJU+Cw6A588
         +9AGl4g6qY5oCDH9xMQuD5HHndXK8jScrQSNwHGjvaz7U6usroAJrA/OfOrR6lM0SFlA
         TAepJ94NGLlZG/3wZ8sGKxovGdgfl6eyWWOlgoNqX1fezUVMXP3ghZXLvGHTJUiGFWSC
         nj16YzxtCA1MLVzElZNTwlFrJ8NhxYrcQ7CYTNttZPh/L31q1AKrXH+CUZCj0erCB6To
         jz420pB+sKPV0+rUs5RB4CZwilU2fNWTLlh7Lh+BT/tfJjIZTPYzkD9Ip802dR9brTdH
         F5lw==
X-Forwarded-Encrypted: i=1; AJvYcCV4zWUA5Y+AoSa/Q7m701L5ysSPAK905PGMRwor2GjXv4BHRvYDUEusDf/vYk/n4VV6vkT6DTvq5+exrhg=@vger.kernel.org, AJvYcCWkoUXhCpyF4exUxl9KPIHhHXeBO3GYgn1dtCE+tH/llchcrTYtw71RFBW6QgQBRp0OuvOd53hIk5v0zrat6+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBqxEa7J2SA4sVPZUGdssps+GLoBJ+TGo82exhwk5LtvRotALT
	Rnymnl9XBBvumAud2JHWAhK8q4cNiGDXiisAX9Pl8oPTRCT3BO2nYau4Qcw2amHYeNB9iT2YjhT
	B6vBi5l8ODgEhlvYDv6IPjSDJCYvX+qk=
X-Gm-Gg: ASbGncsUIP32pyoJX5ihDH5TJWE7t8idQtY9Mv66CuL6JRf2fH/gjT4v9SwSs9cWrDJ
	PnfpzKriRud6GoWFedna5UwTFsDcT94Ck5D2VL9tLZ91MIEa7qn8zotJrXMabs+sI177y1APaV5
	f9uaobzMzl5CA5XGQCnoIjQ4dFCnZpWY5nt3D1auhYimTi8Z2qJPFf+w==
X-Google-Smtp-Source: AGHT+IGaqJyYhggeG721JJ4/fmgCESbVOWGVHhm0ynvxKE68LqDEj8YXYZyBFKj4YpmC8KsySEtf8DWxJD/hRu3T7zw=
X-Received: by 2002:a17:902:d2c6:b0:235:e8da:8f4 with SMTP id
 d9443c01a7336-23c6e399caemr15514945ad.0.1751458980446; Wed, 02 Jul 2025
 05:23:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <kyrCsGDYN5QdXPkUe4OxMxU2UzHfJ-vH5z643gA-_KFJIaew0duyMXU0yfTrGN5ZCNaecP8Yu2kIXKXMoWS2lA==@protonmail.internalid>
 <20250701001809.496389-1-fujita.tomonori@gmail.com> <874ivvvvjw.fsf@kernel.org>
In-Reply-To: <874ivvvvjw.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 2 Jul 2025 14:22:48 +0200
X-Gm-Features: Ac12FXzjaQ5tesk3zQF6RCPQntL7FqLypPEeYCvAD6PznWlZKWbTlzKXlgeLcX4
Message-ID: <CANiq72ntFkvN983N3x=AKMd6fW2yXb8d0LB1LT3c20oYmPCiGg@mail.gmail.com>
Subject: Re: [PATCH v1] rust: time: Add examples with doctest for Delta
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, alex.gaynor@gmail.com, ojeda@kernel.org, 
	aliceryhl@google.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, frederic@kernel.org, gary@garyguo.net, 
	jstultz@google.com, linux-kernel@vger.kernel.org, lossin@kernel.org, 
	lyude@redhat.com, rust-for-linux@vger.kernel.org, sboyd@kernel.org, 
	tglx@linutronix.de, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 10:36=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> I think this kind of test would be better suited for the new `#[test]`
> macro. Would you agree?

I don't mind seeing the edge cases, since the behavior is mentioned in
the docs, just like sometimes we show e.g. the `Err`/`None` cases in
other functions etc., and it may help to further highlight that this
can actually return possibly unexpected values.

It is also what the standard library does, at least in some similar cases, =
e.g.

    https://doc.rust-lang.org/std/primitive.i64.html#method.saturating_add

Maybe instead we can help making it a bit more readable, e.g. avoiding
the intermediate variable to have a single line plus using a `# use
Delta` to further reduce the line length?

Also adding a newline between the "normal" case and the saturation
cases would probably help too.

Cheers,
Miguel
