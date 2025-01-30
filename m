Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED42F1E9B18
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 16:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738254934; cv=none; b=MJhsF8nW8jR4XiLW/NEj8ClFupjIjHrH0sujafEYTMQFp+OvJ0o3v1w8WmTB/rBIELS1YXt8uo+K902YJGS9pOynh8ETwAEXx5YEyCUVZJ6cm+UvZrvI5lOe1FbxH14chFDz2mf/Fy0YlFbtrfw8Zc07pOLLUo78IdgHJtNRNAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738254934; c=relaxed/simple;
	bh=wm/GjTYZmSoQIdMarvhxBrtJ0uNjvcCc+5oIO1kYldE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mmHVgCH4Po7yuJE1/zYTO+wVOthXRF7C4cKjiLnMf5MxtDL/HPufuKdlZaDdGGxTjS/l+pzVt6NaVHZMZUBt+5PG2BLRimFv4fJOnyUgXu7MiK5iXcEPG0gx5dN8985eTkOaXULr1odRkEj4aWHmRs1nrpC+AF3m8IoWsBmdPjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=L8YxryfM; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="L8YxryfM"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ab6f636d821so23783166b.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 08:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1738254931; x=1738859731; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fuEDpAnG1sazTNLQRV+DgH04oKDY04Gu9xv5BY6PwaA=;
        b=L8YxryfMBFK/GtAKJM+myKxzvn1A3xfuMj7aOo3p+6j8RKpP/kt8bQQxZSF7bA9gYn
         nHz72CoTEBzWL99qAe5OVltJaZFYHCf8mdKqe1KesjlzxmDJfrY4fWY+7kBpl63bmr7L
         WDp1n5m3otMOSKXML7y691AoeUpx0RfCS2GuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738254931; x=1738859731;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fuEDpAnG1sazTNLQRV+DgH04oKDY04Gu9xv5BY6PwaA=;
        b=vprTY8iXGOSnq1Z4mit7wTSDNcnUw/VEVIZ34aEsCglC05fvsd8ywn8v61+knkkW9e
         ImuG2bE+FgIvfgct6A256ABfVgHsdlb3q1HoRNdg9wZeyl/0qufeEvlKUiEdnFD0RyOd
         OmxPGYIs39cl8+/JGRv2lxxgWK1NhIHfcIMdIRWl/a03R4SIhGjkop0H3DtGWE0YbMvD
         sCagWQvE3+aq8TachMic3oKdkCaWepLIHYYv9oS/DjPraPBwnSN+SJYRGYgag3sy6N8U
         R/mPS1KbjNAhPlH98j4YT0GecP5kKr+E1ej0fH9bToqYZ+qKf1lcfymGpXH6U6dQ6bmR
         XrZw==
X-Forwarded-Encrypted: i=1; AJvYcCV7QwGQCvECo0ANA9+tOTld5lQGTHJr34wIo9N+arZW/JSD/lmeuX3UoSeLxUOElYSBFwkak36EU0WlnGg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo5GuobjQVCDlR9omAb8gMyJiUYDBI7ogrVNKreOtuV2RqA0+a
	3l5OJJz+D4cg7CS1Fkmfw75yvtzAWK28HP+zpFU4HaJBpQodxgRnfhL9MThONJZD7S5QqVWNGDl
	o9JA=
X-Gm-Gg: ASbGncut5tdj4spgXWN/MleM6TG03yVa8uz0HEBJgd7Dz5W6TAGxWfdDTAel8EbJ3dc
	3yUKzBT7iDVdrf+znl47fiNHrYWQV293t/vLQX4K4uaEfkZ/BqjbxNHWRH9ss8vNLOPAvL/uakB
	ug/iiqjhqrEWe9GuFHswXZWXuWZX4e2PGT4cEoQ5cGFMgnXAnfYL8NnmpKSy79PCb30b2i7eL8J
	hcCjY5krQWYxuDBGxFiTqgtYRFas5l9bHns+1UNO0A5DWXOHsBgeL5zKs8JmnFMeFCZKblfvUT2
	MSg3u05KYE+0ZFPi/4Xu+dyIjTTlmKeltDG5qS73bG00wG9QScT+qymfQYSzMQaFdg==
X-Google-Smtp-Source: AGHT+IHTnMvoMXKhznrFLfDuJSeiAz7w2kUh5CixuntY1K6UWuwlLmp61BIUp2iOLMKT0c1u/yA7Og==
X-Received: by 2002:a17:906:5785:b0:ab6:d575:9540 with SMTP id a640c23a62f3a-ab6d575972fmr623267366b.50.1738254931000;
        Thu, 30 Jan 2025 08:35:31 -0800 (PST)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6ee76b8fcsm79895566b.137.2025.01.30.08.35.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 08:35:30 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5dc10fe4e62so1892155a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 08:35:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXgNj8G0fK+kFFIBxjLvf+gotpWMbogIsM4X6oEz8KMVCkd+tldraXDYYKnIDbUrk6vc7jekh0WtIKcufU=@vger.kernel.org
X-Received: by 2002:a05:6402:50c9:b0:5db:e7eb:1b4a with SMTP id
 4fb4d7f45d1cf-5dc5efbd32amr6334804a12.10.1738254929601; Thu, 30 Jan 2025
 08:35:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <AM6PR03MB50801990BD93BFA2297A123599EC2@AM6PR03MB5080.eurprd03.prod.outlook.com>
 <AM6PR03MB50802EA81C89D22791CCF09099EC2@AM6PR03MB5080.eurprd03.prod.outlook.com>
 <20250130-hautklinik-quizsendung-d36d8146bc7b@brauner>
In-Reply-To: <20250130-hautklinik-quizsendung-d36d8146bc7b@brauner>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 30 Jan 2025 08:35:13 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjLWFa3i6+Tab67gnNumTYipj_HuheXr2RCq4zn0tCTzA@mail.gmail.com>
X-Gm-Features: AWEUYZneNxaHhpPSYfPAUA_rUTrk891uuSVIWZIkTE-aPADGZkPCsAjzruuXyrc
Message-ID: <CAHk-=wjLWFa3i6+Tab67gnNumTYipj_HuheXr2RCq4zn0tCTzA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v9 1/5] bpf: Introduce task_file open-coded
 iterator kfuncs
To: Christian Brauner <brauner@kernel.org>
Cc: Juntong Deng <juntong.deng@outlook.com>, Alexander Viro <viro@zeniv.linux.org.uk>, ast@kernel.org, 
	daniel@iogearbox.net, john.fastabend@gmail.com, andrii@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, kpsingh@kernel.org, sdf@fomichev.me, 
	haoluo@google.com, jolsa@kernel.org, memxor@gmail.com, snorcht@gmail.com, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Jan 2025 at 08:04, Christian Brauner <brauner@kernel.org> wrote:
>
> I deeply dislike that this allows bpf programs to iterate through
> another tasks files more than what is already possible with the
> task_file_seq_* bpf api.

Ack. This needs to just die.

There is no excuse for this, and no, CRIU is absolutely *not* that excuse.

In fact, CRIU is a huge red flag, and has caused endless issues before.

We should absolutely not add special BPF interfaces for CRIU. It only
leads to pain and misery.

           Linus
