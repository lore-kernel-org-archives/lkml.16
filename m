Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5527082D;
	Wed,  4 Jun 2025 09:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749030899; cv=none; b=Ihn4AxXyHVu5ra1qYZIZWYo2YK/YXosAtZRsLkq70NLo1XzTnXNNhVsoirWb8Sf0zESs3srpYsBpcVKQkLcincaqq/00XrK/blugqk1Dj9uibZEiqJmQCvCjubdnuh2yOeh4CiqeSFkvVzMyBLKEiEh82WnjYxI6tTeNRe7c2+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749030899; c=relaxed/simple;
	bh=rT7WV0z9QakqwOWrmARwlyRwSp8Y7X8ngHE26wEnmxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tousg6ZXW3TaB+91F2Ok9xzcvH4NRrLZ5pQ0a07mRO1s/R9q903zI9wvFYuAtKBELld76Hb7bHW9BH9z6F4Ak9IzhaqCJj3jmV8wJJsT/C0cgLP3K2bDxX+ZpRgrtMkxqdGym7Tr5G7XEtBPwWG3tXIdEWzXww4ZrWhqbkpKSwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=at9+FukE; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="at9+FukE"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad891bb0957so1165499566b.3;
        Wed, 04 Jun 2025 02:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749030896; x=1749635696; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yCnSX/2bOTAq6bwZrnhh+Ap10mZ4BWjQuaO8FVGMszg=;
        b=at9+FukEZgVBVJ1rGEaU7lsYNYxIBD7HHUE2BFBLjyG/J26YqthKH0j96NXn7jX+vj
         0e4juWBjcxp5k5FzzHcjYA7I/ukNBQPnMD9uBPsc9Nh7ZpXleRT6LnwhAxU8Uo210oFQ
         sv4o9/Sct7ku4Yk+trPlUp7nXvJq461pxXHyvjz3bAEqXPuK0TIGLGlMzhDutGx/IKXi
         LFbzmLjmuYXN4TqId687cW6pp57580l60oPnev1HBCit2P58wq5GYmbWr+o15PnG28qC
         l8COFE8Ld5nToeH3vfBFCDRfILUAld1InM1o703eH7HEh29/gTKiDwjQKX7kqvqCzkYV
         v6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749030896; x=1749635696;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yCnSX/2bOTAq6bwZrnhh+Ap10mZ4BWjQuaO8FVGMszg=;
        b=ogPvCB6XipIqXNe2oy1bbi/e1ox23uDZM7htgOjJQBYqhQ4Wc2cCPDW4+/pUe2x/7I
         m05A00j/PEf/B0ffZDNiMYNjNo7yaACWX2ziNGWNQSVU8AqzJqp2zbBIjjkX3YL2b6tx
         pY3AGwj2xn0anu2ZO8n7sAsxRtrUQdkGwTKUJz78PHj65AnXjaFR3rHwUZkB/2lkkL3t
         Mmc3uuRMaolUCi5Bon11P03toMD6eC67KygD+0/w0nnlaGZcvOKkUnLImnmaEkspfzVE
         qjhYeYzZfLURzPZQsvY3eqiMgfp9JHvwOvcah0g/UdP3qwNTplrNroDytuD4COLl1oxe
         Ef4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCvs9ZPvTVeTQm4EOFFldyoXX5c8XhUShQjEkV8h97RvBMNureVx89vXDcchhmNdh0r6NMYyk7VKZgzKk=@vger.kernel.org, AJvYcCWsub1WkXi/Fh6SjpBHV8JfNLXHB4Q95asvC9zobGItbw+E5VCfdte3wxA2ouaSx0JSFd0i4oyqmcRIAPjnUw4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoYnK7BV88jgDtr5UMJj78F4xulEnubJWzVAydDW/vB8QdTsxo
	ifB136tT6wIAWLvaDOrMkbb4K0jPfbBSjpunMbBKVXhFfO1tr+Cg1vuj
X-Gm-Gg: ASbGnctXjxY3eFbJFTP+7Mo8zXJ37XdaTLFzWIkOz0UP1LovXGTBdF9BikMSId/u+Kp
	9XQRr0iVACBlKAUy8LocfucYWD+jRhQDNcY4igRwngGnVENE/meWzMfcTmtEILzX75HJbhS6gZB
	s3wKt5sZI0lFMaoMJMWYDhSNfSp7EuB4EztDl7Z9N71xSxOkwaab7FTcaaD1K4kRT1Po0MM1ccc
	U7VeE+7ZyDBTw/zShSwjTIhDVmhIlG2nY4hN08ogyecHihEuCf7/VVSpyTBz5DLs6WipnU2AtTK
	uyDbaBhZVyuvp6knNS3XIZp8+b5xvMgKOmumXuzBMk9ExHGZ5fp9SlWGfM1X
X-Google-Smtp-Source: AGHT+IHojeDu0D3iKuvJZTxM+tPZGooJbnzqjWhWIh4v1qc9uISoP6pFIzKIiHEualV/VjzLSEqq9w==
X-Received: by 2002:a17:907:d16:b0:add:f62e:a300 with SMTP id a640c23a62f3a-addf8ccde2dmr191680466b.2.1749030895870;
        Wed, 04 Jun 2025 02:54:55 -0700 (PDT)
Received: from [10.5.1.156] ([193.170.134.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5e2beff7sm1074579166b.111.2025.06.04.02.54.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 02:54:55 -0700 (PDT)
Message-ID: <de844563-651a-4a6e-bf61-7a7b41d1cb43@gmail.com>
Date: Wed, 4 Jun 2025 11:54:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] rust: miscdevice: add additional data to
 MiscDeviceRegistration
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 =?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250530-b4-rust_miscdevice_registrationdata-v4-0-d313aafd7e59@gmail.com>
 <20250530-b4-rust_miscdevice_registrationdata-v4-2-d313aafd7e59@gmail.com>
 <DAACCYW3QRQE.1O75L2SHJYVPM@kernel.org>
 <3eef5777-9190-4782-8433-7b6ad4b9acd3@gmail.com>
 <DADAEIT9E1R8.1J69W5DKYAQGY@kernel.org>
 <CANiq72=893T0ZHawsym358N5iexbj+5UEL_RqMA_w_dEbJ+Ujw@mail.gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <CANiq72=893T0ZHawsym358N5iexbj+5UEL_RqMA_w_dEbJ+Ujw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.06.25 10:48 AM, Miguel Ojeda wrote:
> On Wed, Jun 4, 2025 at 1:29 AM Benno Lossin <lossin@kernel.org> wrote:
>>
>> (the `assert_sync` function should maybe be somewhere where everyone can
>> use it)
> 
> +1, and likely part of the prelude too.
> 
> (We may want to put all these into an `assert.rs` or similar too.)

I think that we can add it to `build_assert.rs`, since this would
be a build time construct.

Should I do this in a separate series?

Cheers
Christian
