Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E511B17F7;
	Sat,  3 May 2025 00:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746231270; cv=none; b=TIjqzyg0PP6K5c56BNGyp7anomLTXjjU/gQHfP8TvmDZZLpR7gtP1KiQpo4F9KFTXG4hau6zXhYf5CZVxd/bWuZHVEw3Q9DHoNRD9j5j0bmjNBfMRrRHjNptxFWYgDZaZD4KdKcFzMKfZr1nH9GhYkNPje462UwXX40p++ZPZHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746231270; c=relaxed/simple;
	bh=G7lYRReznCcWHhP8Bl+6aJeQjw3qOfSDc4uHFRcTcZc=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=avITNckMYDymVmuPmdChAKeI+fGNY3IbKoNsspLnwqPxaQ01qSzoN6C9fjMN0ZEqGl02DiO1YeURuqlMylGLvRhKc65dmNcOD8nqsMY4V0L49G3vjwNPDLZM5CVCw0XkR2+n672ysX+hPvs9mL3LaeyWyh01vIylsu6C2m0LrYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZVsbMXsY; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZVsbMXsY"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22e09f57ed4so23433345ad.0;
        Fri, 02 May 2025 17:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746231268; x=1746836068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNh4/uH3eHVqKiVmewmha9vkDdp8jKoWy3CsVRrDSYo=;
        b=ZVsbMXsY+ScIuoXf5uYQQ3T3S23tQvRN7N+eM5AJdLNdn6tvy+o9pA1LhWEYYKmH5r
         XFXaIRyQxCuJo9qofIcIKywgnX/m6gO3n3P3yhtx+ZzL76CopIzZiXhRcpkOWuXfHwM9
         twuiltz7MxZRKJpgipGyDN4qgDczJkkF5vq3v4O/nyDpPBLuZAKf6LsiB3yydCiiy/lW
         qKMBugdQgSpwyawZOawQoDGXmqQP4njPj/rsbyvlhdPnj9wRJgiGsrmmpYOAXySrvMWB
         +NyQnLoDquyFqwJHZUR8LC9XLoMmQzQDPkPGQtQuBGysGOna8TnklwaDtQeqxkfLr48w
         w6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746231268; x=1746836068;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HNh4/uH3eHVqKiVmewmha9vkDdp8jKoWy3CsVRrDSYo=;
        b=EUrB++igjNLAvRdVTntGbot0MXvfb23LexezEL9WV4+CUgsQ/Lj7aTcWRCXw80Nho6
         9ecqZT88Ovs3X5smaVzHwLOQwuyJd16FzfUw/1Ro/JFaR6SgEPobOShONjWSiH1y+xhA
         zEQnRIV/IOsZMCenu5eeF+fzUhmUdaLMMFZazAZFlLol977zJnYgqTnzI7FhSQKG9DCY
         HPJKcb32naukVbw8YxWSZXhd1AX7nRpDnX2hsVLQLHVyeD8paBZwsXxwHRaaprB2tWvk
         dK/d11bRWwWmk7WnU0bTFn8JC8dTrTj5XMMQGu2I7fPFtGcOdXzWCxVyqMqKRbYs1bUY
         AdsA==
X-Forwarded-Encrypted: i=1; AJvYcCUHn+9DFmkc+Jo+oWAvZ91/hvwF9S8MZgybgeOMv8+zGvf9taLp8dmdhUdJnDPRWAM5JXtzTnJzWD6+Gqw=@vger.kernel.org, AJvYcCX5pDFC/OTuP1Elk/ImaNcVbyA4XCAQreQqQB2CUx1w5MBrJ+GXj4oq+UsY1SQ/987RQ1ISq1OwymIX7FJjgm4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyNc5fz58rHr/8ng8pfw+gfCjgqggD/wrT8XT9JPdXZrtHnqwB
	1hL9M8bCi6CQo402Sd24H8XmqJfTVWbHy3ZiMD/x/wEf2wr3nMn52rzxrFLo
X-Gm-Gg: ASbGncubw8soKp9aB4LxM2LrUZQhGKlhDRceMfOVHTXkwnXzPB73c0NVIE3nq3u+odb
	YaqysEH6WDkpAVt95kIbSo73kpZy0HR/sTtV4q8WZtHp1puxugsJ+PD41knITnLClfOf4KN1Qke
	S4h6w5zb+yWKoqVICBtW8yNw0B18+N60DqsZjfuhOhxLqqcFRgJYtCdeNhPKeUGmYu390w1babd
	Ue5Jr9N5yc1HSk7sgsK8XTwWCSjm5+aTkIXhpRryEFflAz/DXfn4Bn7N6GhfOqZc+R2HrMZ1sut
	jJKLZlo8DYP2cbH/59x4jlKbWJgkJ4OE9gdAGBOI9Hv23Hp0CSrnZEFYh5FPMohZEKOT6kxe0Gx
	WW9VfnmQY3VfG2MeU2zJZGaA=
X-Google-Smtp-Source: AGHT+IEo3i711spQkyF+p2ZKk1fQf2vS4LJQaJWiNcSvc88gPZYIj1h7hlVzcEc6Oj6775TMEfBdrw==
X-Received: by 2002:a17:902:d2cf:b0:215:a2f4:d4ab with SMTP id d9443c01a7336-22e10044130mr69368855ad.7.1746231268033;
        Fri, 02 May 2025 17:14:28 -0700 (PDT)
Received: from localhost (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1523096esm13694995ad.223.2025.05.02.17.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 17:14:27 -0700 (PDT)
Date: Sat, 03 May 2025 09:14:12 +0900 (JST)
Message-Id: <20250503.091412.776716525940008861.fujita.tomonori@gmail.com>
To: chrisi.schrefl@gmail.com
Cc: boqun.feng@gmail.com, arnd@arndb.de, fujita.tomonori@gmail.com,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 a.hindborg@samsung.com, frederic@kernel.org, lyude@redhat.com,
 tglx@linutronix.de, anna-maria@linutronix.de, jstultz@google.com,
 sboyd@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 aliceryhl@google.com, tmgross@umich.edu, linux@armlinux.org.uk
Subject: Re: [PATCH v1] rust: time: Avoid 64-bit integer division
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <d770162d-a271-48da-82f5-a2e38ae03c57@gmail.com>
References: <cbbeca76-7a7a-425b-9cdd-8da778b6d8a1@app.fastmail.com>
	<aBP9yvWnB66qJeRh@Mac.home>
	<d770162d-a271-48da-82f5-a2e38ae03c57@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Fri, 2 May 2025 01:38:43 +0200
Christian Schrefl <chrisi.schrefl@gmail.com> wrote:

>>> What is Arm specific here? I'm not aware of the compiler doing anything
>> 
>> Because Arm is the only 32bit architecture that selects CONFIG_HAVE_RUST
>> for non-UML cases, i.e. this is the only 32bit architecture that has
>> this problem. If your point is we should do this for all 32bit
>> architectures, then I won't disagree. Just s/CONFIG_ARM/CONFIG_32BIT
>> then.
> 
> I would be for using `CONFIG_32BIT` since from what I understand this
> applies to all 32bit architectures. It feels a bit weird to single out
> arm just because it is the only one that currently has rust support.

CONFIG_32BIT doesn't work because 32-bit ARM doesn't set it. I use
CONFIG_64BIT, enabled on all 64-bit architectures supported by Rust.

https://lore.kernel.org/lkml/20250502004524.230553-1-fujita.tomonori@gmail.com/

Unlike CONFIG_ARM, the intention behind CONFIG_64BIT is clear, so I
also think it's the better choice.

Thanks!
