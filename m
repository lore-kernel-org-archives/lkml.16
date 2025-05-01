Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492771CA84;
	Thu,  1 May 2025 14:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746108381; cv=none; b=fLQ3XOmCxsl2rzLhm/3FghzG7hXhQBl80CmRF6DwsPmQA4ulbxydbSUVRT8wlTFxrviMzxYKmm8bAz7CRT/LVlTAtVRPfQc5kE0lPTPpDAHsaS5KZGroEMKaocCz1nAWXPdHvBMRzjRUBCC2c7T6HaWnoVY8aMM9g++a2sEnGe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746108381; c=relaxed/simple;
	bh=zo+fkCf2SqBoVaTG78Z0dFmSpLZzqvYGNlXUbGvns2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MWg/jrYpmy/EVxUououKMffgYLOSJWIHdbF+KqXk1yLseu2P6/QIs8vSYgDA3FRdAKIOhZWL4TF7EAWmxMnpQsDpr5KZaKhpOaio6FgvTOH81avJYVkuRYbjQLCR0FBzruZREmdRjHrea7hRr05O28hTXnMvTvj073o+9FucIIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RLxwmuJ6; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLxwmuJ6"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c9677cd6d7so119191085a.3;
        Thu, 01 May 2025 07:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746108379; x=1746713179; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYFuKMDmua0uc07etgafAGSuIjbEHGD1lpAMVLq4nGE=;
        b=RLxwmuJ65M1uXSwUaaGq3kL/QHrBoucVBgQx3sCP9DWGd1a2CJDO6I7AQ6P8LLK8Ab
         KPO+FvNcICUBnnLnE4mDR+MFQC3RTdC46SzuaI2OHThTSN2EcP8ly8Mi7MNtm3OH2k8f
         23WweExyiZpUJRSD5GJAljwiRNm0TyKVJG+5s49JVj2yzE/8cfIca1+/Zf1y0elGZ+uM
         SkeuCbf0zwfxaNOlwCarDALncE/tInL5Y71JGXtdLMIaQByWzJkckyqwoFOF9IzZng4f
         Rx3fEMVj9soY9KF6VK2rte6+AHUP+EibFLhX37NpuqqWS2NoM8Zrv1lJjCbzS2gm45gt
         bdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746108379; x=1746713179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HYFuKMDmua0uc07etgafAGSuIjbEHGD1lpAMVLq4nGE=;
        b=iZH0f1qfJk3XKO0+UQGmgmTIqOY7HMHH2Wn/aZGLh5Xa22Wtz60YvOQ6oNf1WeOx//
         O6lqGrjdPabd7GsdY4OprHOBlvvjTdr2aZD102xC0RdBN3i7FMgPjNIvq1uMDBLQ1GzO
         PArR+JNhz8RvBgDHTeRbdvY8zQL+I3gJVP5lbTQFDVNBJ90pReIBhSWxCdRPiNr40K//
         jR3kbcnKspVyfviAqIgpkqqmCoX+J8CRGsAK0awy5pMx9FzEZEgagactGpmWg6jWxIjk
         Q0O9fN/zk8/7ux8V2ou+HrA/H7LCH84+GD4bGa5yxmU4BitD/8d1aOJxuNAHNAbTVdVJ
         1PGA==
X-Forwarded-Encrypted: i=1; AJvYcCVdlOr2BjNEhReQU8lBxZJZYg+idV6Sad8Qn20NnffqgyuaBV8a6aXsejQvMnsxFTLROAG1chunu2MqNJy5qn4=@vger.kernel.org, AJvYcCXy3SUB5cdBIZ25DDF8OMiKoZSiq3W+p9WT+1ecIHO8p9QiqBXuqwfyXpGlQDYYUJkNAOOPo7KOWK7zh24=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN4ftS6GrMgYingD6hPiCHrf/E1JS6Io0d46YZkvU65xJsNXE8
	SvNC9Y02nPzQkA8n83xR/UbOp1kub+o6pI2J9C2LM7iuyBBy34KZ
X-Gm-Gg: ASbGncvMHi7poSdwRmM8O7SL/66LS+Z9GhB/k/a+hB8ahvntDS5eH1AIuamNHZggHV+
	pKCpcd/fm3dYAVgM1FzfkttomknOMhvvEd3fcmMGqt8MTZ9ozA9nPBTWV6Q65mnScojDf8RFCrA
	LvZeK55p6vbZ7wvkX3iq6g1mxEaDP/r+A2JL2lo6UAFT8GjZvvWreF28+2EETichBREXe2KHLHT
	iMCdMeWCza+9NqJwqBltpSvw/YWszkshG8Gk4ki1VFjYQ8hAOkPvyO9me4Ywdehju426pnSGhtu
	l5YpOAfP4xSO+lLNKeZUhUOkWAR5HpZEekxe43jKh2OH3Atvuztf91uyydUWcxtCHGOr9ZzuMY+
	aBAKfP6kQ8H/QTFaSUt92MkyoEojWq01eJvTbfk2n8g==
X-Google-Smtp-Source: AGHT+IHXBpacgQotFRwe8jX2L0DsKZBymrJLAErzVHZlkn2203j+y+Qzjj9IOYt8zY7TMDIlzj8uAw==
X-Received: by 2002:a05:620a:4587:b0:7c7:a604:d28e with SMTP id af79cd13be357-7cacefa104amr288853685a.33.1746108378839;
        Thu, 01 May 2025 07:06:18 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad23b5f5csm46115785a.10.2025.05.01.07.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 07:06:18 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id C2DF9120006A;
	Thu,  1 May 2025 10:06:17 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 01 May 2025 10:06:17 -0400
X-ME-Sender: <xms:2X8TaEJyQTDTMAUejX40SduQfH_yN3BUNe7ZcLSuhjxv9LGi0fGm-w>
    <xme:2X8TaEIOUzFGqtS6OLQgD3Aygdy0GKKd70r3BEKjBcmCqM0mU9JEbNFc5zGTi5ae-
    v9EnifomZpvg2Yeyw>
X-ME-Received: <xmr:2X8TaEu2ZPc3GaSVxn4iyyOZbr08VE-6nrY88rL3J9LfjVNtOz72QI4D>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeljeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfel
    leeivedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
    hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepvddupdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehfuhhjihhtrgdrthhomhhonhhorhhise
    hgmhgrihhlrdgtohhmpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphht
    thhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegrrdhhihhnuggsohhrghesshgrmhhsuhhnghdrtghomhdprhgtphhtth
    hopehfrhgvuggvrhhitgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhihuhguvges
    rhgvughhrghtrdgtohhmpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidrug
    gvpdhrtghpthhtoheprghnnhgrqdhmrghrihgrsehlihhnuhhtrhhonhhigidruggv
X-ME-Proxy: <xmx:2X8TaBZssC22g9jB-vKRSqP3pxkAhA-CkYIjB7jAzZFYnOsLdXiDaw>
    <xmx:2X8TaLaNxenHjRmotLvOYg0-fcGGw9dQ9OB2IzNQjv4lAXdZNvIoTQ>
    <xmx:2X8TaNB2Hf8boWn0AogU31jCohDNUXjKrZCwBPuvraLPCmnZchocww>
    <xmx:2X8TaBYIqHJEzHx8yBG99vBBI3TVYpf3D2rnwHdjlriuOSdLLnGVOw>
    <xmx:2X8TaDoCyFlx_p3AoIBRksG57hE_G99TI_dOPfyq2dtjvJwNGtw4Usxy>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 May 2025 10:06:16 -0400 (EDT)
Date: Thu, 1 May 2025 07:06:15 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: arnd@arndb.de, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, a.hindborg@samsung.com,
	frederic@kernel.org, lyude@redhat.com, tglx@linutronix.de,
	anna-maria@linutronix.de, jstultz@google.com, sboyd@kernel.org,
	ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	aliceryhl@google.com, tmgross@umich.edu, chrisi.schrefl@gmail.com,
	linux@armlinux.org.uk
Subject: Re: [PATCH v1] rust: time: Avoid 64-bit integer division
Message-ID: <aBN_10lV7DCdR5iE@Mac.home>
References: <20250501015818.226376-1-fujita.tomonori@gmail.com>
 <aBNojspyH5dHsuOm@Mac.home>
 <aBNrJgLFpswcgOEK@Mac.home>
 <20250501.224815.1854649062185419020.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501.224815.1854649062185419020.fujita.tomonori@gmail.com>

On Thu, May 01, 2025 at 10:48:15PM +0900, FUJITA Tomonori wrote:
> On Thu, 1 May 2025 05:37:58 -0700
> Boqun Feng <boqun.feng@gmail.com> wrote:
> 
> > Btw, I think you're missing the Suggested-by tag from Arnd, of course if
> > Arnd is not against it.
> 
> I'll submit v2 tomorrow, including Suggested-by tag from you and Arnd.
> 
> Please let me know if you're not okay with being included in the tag.
> 

Sounds good! Thanks for the hard work! ;-)

Regards,
Boqun
