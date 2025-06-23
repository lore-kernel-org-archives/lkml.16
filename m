Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAE51AD3FA;
	Mon, 23 Jun 2025 21:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750715696; cv=none; b=kcxr/QdagWJWSXrV8wlJGiwYu9PPaDFSzxPxx/AKlsXSUCm1YydOsNTZYHF1Kf60lMOU+bhIn1/up0D460QA78DB7k208cyQAW1cJ/4HjCY2+n0zawMwqheNnwNpAhyCa6YaIR78PurDmPqRAousm+bPGpnqeq/XuGDk0ZUJT7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750715696; c=relaxed/simple;
	bh=M9NqqGvqesekEZeAlJ2U1P7PPbr6+pny52J9cuRc0oA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=itycTOE4PEhf/Zufk7B7cYvcX+mxw2nyZg8jcxIWglTbTJp0nH5NtTEiKRmMH0WDBl7XdMYK83TzBY2kyWgOgWeirtQuzJDbi9re1PV8vAz5LzjDRbS3Dx7H3zGCwKQaFTdOpGPzAHA9mA4UioIhO5tgAEs+DgwlV+n35lVhaXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/q+3iuO; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/q+3iuO"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6facc3b9559so74899146d6.0;
        Mon, 23 Jun 2025 14:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750715694; x=1751320494; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPXwJIEuFLuIBNJLi2CQrb55dG3WvD/ZK7FkLBpIGNI=;
        b=h/q+3iuOjNpXAIqI1LfGCpx2RvBQbhbFnIWwbyvxbzlqXZXIepLAaS6OCgkJBd/Z2K
         yuL8jjIgETo2VceMWRfHmM0SKYWJwoUVunQFbZQFAAy5xLU4BMixtCLiUZKX3bELclm2
         h11QZSfn7md21Hz1mI7DZja0Iev9i6Hqj9WmI9MxsqTS2Pm9aPCrd6ss8xTbqIZ1n+qt
         e0Bpyf7dWH8OJHbYhs7ZeiKvZlgtOrO2Ry2JGYUaM0JFVmKIm+TjpBzMrFsZxDxoLe98
         GrfA5bcB5f3/Vinx3pUdWlivYCDS/XNT6Vw4+nS4xKwTgI+9StRJdJ2kDkt4s9HMHKBK
         Yo2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750715694; x=1751320494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FPXwJIEuFLuIBNJLi2CQrb55dG3WvD/ZK7FkLBpIGNI=;
        b=aDrsGpNra89IUxf86YDt5Rpytoe83AZOZwUFycqcSACkSAIW5YWzTcLBCKbNrkxw8x
         iYP8h+fb0S0bKvcP+EGlMcHgv6/DeLvVplPQ+rfHLhnP6qaLaetoTNRt2pTLeLUnDEI/
         xOD2GwZec29JQIWQTHN3L1UXRv11Qwv72TnQTNEdBZpcx9h9h+oQBuj4fF3eD/pGb48e
         HfcBtS45rzc6Dap28NChFe3pbthE6XRBzjD6LRCa3i9pyvJkAkhwep3mcniHYnwBdIUo
         uUZRxdnDD76GGOXgKhXvyX7qrd8QTLlS3PPF0rF7s/VBH7vDXdcfVakrN8khM88Cwj78
         on9g==
X-Forwarded-Encrypted: i=1; AJvYcCUwXSnLxvrF4Aydlzhkve+9Tf9pahdr7bdkxFy9rCTiFsq7AGJ2VUKEuSA1s3Nd8VC/IszfqIzSR41crFdsLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVhP/urAgDwRyBXkxrQTJy3glbiN0DeHzYRUMoaYE8/yB86f+p
	0uC0O57rnnj4phx+vx8spR7FnEtVZYoGw3M+SI0C1tzUhfthGKCDJCTi
X-Gm-Gg: ASbGncuCwfQmsyocTT458QGbMezLfboXViEkilkpHdWkeajCcxl1uwLC3WFFMoEX+1H
	3eC5B1RUcnZg37Cnl3vWUvrp3nz0WeHhmze39IK+dmMGT1HCxvemRkrFm8BO6ktEk9eG6QPHATI
	xAGWzxVD5SL8M4nuUavvRYT4jvb2wfVFJfcYZGn/1KDKLHaAxR6Rdtiy4uP4U/UwTHC7me0BhKq
	c7Gd1KtiesLN8vGwI0NfFpxd8W98Hy+00y8wj3J1G2+c8QiJ5bsBkLLMTopQtSzNTsU4zcaAmTw
	RJN1cg122dQs9HgPx+CywDiP8IUg+Jp3VIJg6wPCZuJGjuu40T8KThVx3syQ6bP6ZG6p0QWIvI4
	oYcaelxwq1WE2/OXrpNKsPIx5n4Xr7cuA1yGF4BafQYtSLhgNBrwZoCyMrQRBlro=
X-Google-Smtp-Source: AGHT+IGV9Fw/fjtiPKvAaqNmv48UdUW9if2dOxAcnAUenkr+67/or7hGlYjo/8Z3z1R4t4fwu52/Kw==
X-Received: by 2002:a05:6214:509c:b0:6fa:fb7d:6e4c with SMTP id 6a1803df08f44-6fd0a54d8c8mr241917876d6.25.1750715693772;
        Mon, 23 Jun 2025 14:54:53 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd1e31c8a2sm29185156d6.5.2025.06.23.14.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 14:54:53 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9DB881200043;
	Mon, 23 Jun 2025 17:54:52 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 23 Jun 2025 17:54:52 -0400
X-ME-Sender: <xms:LM1ZaDA7wIphjuX98egOJmqKqQW1nD4e5g-Lv_GZqRdPR-gjhg8cuA>
    <xme:LM1ZaJhvPEGEN0MJJBvsvg_jw6YHZLYX1qL1Qo0HwDxTljRvfWcEJuziQRse_4SEc
    yYA8Kwr3jvWDvUwVA>
X-ME-Received: <xmr:LM1ZaOlrfroTI0hiJbXBLevcpYJ3eB3NOLlimtQRgvLg5aGmxqZW7BbhD1Pu4A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddukeduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesthdtredttd
    dtvdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgr
    ihhlrdgtohhmqeenucggtffrrghtthgvrhhnpefhtedvgfdtueekvdekieetieetjeeihe
    dvteehuddujedvkedtkeefgedvvdehtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhg
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopeduledpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepfihorhhksehonhhurhhoiihkrghnrdguvghvpdhrtghpthhtoheplhhinhhugi
    dqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhushht
    qdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepoh
    hjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhes
    ghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprh
    gtphhtthhopehlohhsshhinheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprgdrhhhi
    nhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlse
    hgohhoghhlvgdrtghomh
X-ME-Proxy: <xmx:LM1ZaFy0dsq2Q2Yt4QEOOtbIxt5sJUbznqRTl-1lVl8ojojNwdnS6A>
    <xmx:LM1ZaIQ3qSMlavbOJzH3LMQKbWp5G9JOt4zliXlrqNoUf5sDf3mmpQ>
    <xmx:LM1ZaIbXg10vJ7VuM5C2s6-8fHPlwBJVw1UV695xwA6l83BJk7hTiA>
    <xmx:LM1ZaJS56ppW1gwfGebKfePE7HWoMTLUOwdrqBy40p9uxjCnsIexDQ>
    <xmx:LM1ZaODIzE08yg1nRQt8xMkv7bC4BDSIKmhGsOEmVVLYoy42-KWgdp-e>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Jun 2025 17:54:52 -0400 (EDT)
Date: Mon, 23 Jun 2025 14:54:51 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Onur <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net,
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, dakr@kernel.org, peterz@infradead.org,
	mingo@redhat.com, will@kernel.org, longman@redhat.com,
	felipe_life@live.com, daniel@sedlak.dev, bjorn3_gh@protonmail.com
Subject: Re: [PATCH v5 2/3] implement ww_mutex abstraction for the Rust tree
Message-ID: <aFnNK1zE_IvLKsaa@tardis.local>
References: <20250621184454.8354-1-work@onurozkan.dev>
 <20250621184454.8354-3-work@onurozkan.dev>
 <aFlV9ky2RKrYnrJX@Mac.home>
 <20250623211740.00a5bfea@nimda.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623211740.00a5bfea@nimda.home>

On Mon, Jun 23, 2025 at 09:17:40PM +0300, Onur wrote:
> > [...]
> > > +    /// Checks if the mutex is currently locked.
> > > +    pub fn is_locked(&self) -> bool {
> > 
> > Did I miss a reply from you regarding:
> > 
> > 	https://lore.kernel.org/rust-for-linux/aFReIdlPPg4MmaYX@tardis.local/
> > 
> > no public is_lock() please. Do an assert_is_locked() instead. We need
> > to avoid users from abusing this.
> 
> Sorry, I missed that. Perhaps, using `#[cfg(CONFIG_KUNIT)]` e.g.,:
> 

As long as it's not `pub`, it's fine. `#[cfg(CONFIG_KUNIT)]` is not
needed.

>     /// Checks if the mutex is currently locked.

Please mention that the function is only for internal testing, and
cannot be used to check whether another task has acquired an lock or
not.

Thanks!

Regards,
Boqun

>     #[cfg(CONFIG_KUNIT)]
>     fn is_locked(&self) -> bool {
>         // SAFETY: The mutex is pinned and valid.
>         unsafe { bindings::ww_mutex_is_locked(self.mutex.get()) }
>     }
> 
> would be better? What do you think?
[..]
