Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221BC61FF2;
	Sat,  5 Apr 2025 18:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743878306; cv=none; b=QpKMnhYapAJ5J2AHntQgq2ZTdv6Zl0T3cr1+oW9aKFZE7+8v9+aEZ4yxQmlRsviYk/8H3ECRLxYLdNXxnexsdq/L371jxiFam3s9cohh5tbo7FFxtO4YYcg8PruiXw7SGqAcTEqhBu9eJrY/OlQiW8KtxsCNPdOBJ2i6QrLhU+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743878306; c=relaxed/simple;
	bh=QQtjJWBJxT1BnQT77IBqRVS4a9+nh2ksFHUk6+PWva0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lQuqGKLVq+pnwhkhR+QX1O/A1lXn6j5b9NQVe3uA1OIPhkuJUcR95LTv3VIxMM6GXMdTO4FEBb04yoQo7Y6w6V1da7jSITsLUG1KiwTLYwEM4nWcEkYOQCOpbmpo36ofbp8wAipG9z5ephXqh2i5hwlr2LEw4P8caRvW+cFREEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T4Q6mSwL; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T4Q6mSwL"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-47691d82bfbso61765221cf.0;
        Sat, 05 Apr 2025 11:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743878304; x=1744483104; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sl2M++fvRVUdrk0PUNelzDx+YAZUrNZAMRr7cMe/F+c=;
        b=T4Q6mSwLVstC6MX5u/FyELjG5rBz7vibpsnIIxQwO4wl8ot1ZykGxss62UsqzVFmye
         DoymGs7u9sxN0Yras6fAeNywz3NqBmrjv7iO5qagmz5qxzBVrHeC8ru1k2sGDJjkntuQ
         Trq8oX5x/MTN7pYIYmJLZ/pLboB4vceMzqFvw92Gy7rtka+a1npEzRr5FmyO5ipzImb8
         Jg5rtetg+NeqZ7lrcT6pV1oQV+jh0II6ClL4xtHC8hQcd9EnxuLJWWz197kF70Esi7It
         cstwSQI8aBuuWc3w+Xs7L0NnIyQO+gFNgNvTqLGMOhV68xhXh+CWOYjkKI+WKmET+6B3
         jgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743878304; x=1744483104;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sl2M++fvRVUdrk0PUNelzDx+YAZUrNZAMRr7cMe/F+c=;
        b=GhAmKiLzivCkdyO2lL/pDzME5+3kOJ7c4TgJ8S7GeYYcw8hYCxiK12V6MEhCurj84+
         3HNjBD7ALSnzpNoaKYmMOR9W22jXgvzduwyGKCJOCQ6UodFBbmy6hHY/qCCw2yCnEeKk
         rKdFPsX2VNX/zyw3fAqSKNL7s8MAoDcfPev5tg7kTPoYceWUZZKVaKNuXovXX2eBCSjU
         7nnwQcoWtOiTh7uKkZxO99ldZR0T2W7/5bu9R1NFRDmTOxZU7FxROhaPq/MQGddmV0Pw
         /LJ4PoECxP+EfGVod3+9+JcxXYktDVclr5w9Y+ECXDF3MXkqBD2w/XS+wP/IJTRfFw5K
         oUeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsPOZiWYptftCXtZ6ELd1g7Z5Un0YteKGPkCyhWP5rqQ9rL8TqM/XdqMI9PGevCr2qvIC4TJSbuk9b0/9d4jA=@vger.kernel.org, AJvYcCWYiMy2WPHdrPvHdnyFTWeG0s2/wn7xPzu4d7asYWFAvsjOAh1UkRxw4zFdGYZpgBq4+Gpn4aearjUlINs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTH08R7+dCQa+dtl6AK4HfVHKvtEn3gKmFe7iWe515rP5LdJ3a
	tnuRKxm31ulp6jWF5GuftOLej/Waob1+2sr3pHzqF9XAZf23ymMBsf2+Vw==
X-Gm-Gg: ASbGnctEwMhEinZgTjZKPTSUGaJ+RJoHxhUVS1mhrsf4GXFbZNboH7C9ZNwD4rzJdAY
	btV9jKM24sbIWbuOCMNb+t8aq5F8UhFTPOqrYsIwi1gBx1Jc7Wl8fQEST4zDJHEwFh1qXTjBgu4
	vrs/pIl5zGpRm/bkNx5bI9OZOrdyuySu/x+7viMU+JZIIrqRw0cPLKZ+MA7D42mYTh1CczsvICf
	Lnj0I/E6jv/WMvbM++CpNGPYAvs6nqDM0cP0zsDct1VL7fEOoo56pFie7jjX9diWS5S8myjtjyw
	1H/kdca/VjHvXuv/iyKItWsYPu7Sn85oNHTLAtZEDlUOfdmusdAYvbJagrdKxAyIuX7vo9zNsKQ
	CZZVNNnyyXR8YQMmGG3/YCTIf6VS8fgl4d34=
X-Google-Smtp-Source: AGHT+IGQ+VniDYYVVkdPFpff89YQ2tB+gwFWi/omtRKMHBspF0ohm6pDkZK+xQOPlmxVk+aP3+vg6A==
X-Received: by 2002:a05:622a:f:b0:476:af21:9d4b with SMTP id d75a77b69052e-479249a7d83mr106849881cf.37.1743878303908;
        Sat, 05 Apr 2025 11:38:23 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4791b0883f1sm38734551cf.42.2025.04.05.11.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 11:38:23 -0700 (PDT)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id A16D61200066;
	Sat,  5 Apr 2025 14:38:22 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Sat, 05 Apr 2025 14:38:22 -0400
X-ME-Sender: <xms:nnjxZ3JZbjHujoRlZv0Mt61KcDqmnzrSpK-a0XpheprrsH1QQr_LEQ>
    <xme:nnjxZ7KdZskA6gb5kSB8SlR5st-aT9deU3lsgzbsCSo8860fr-M9asOOTMl6KtsDr
    myBB05ZdIhQ10t4rg>
X-ME-Received: <xmr:nnjxZ_to16WQ0ASLnim4FH_rwsByhzDCaQyCMWbByUK8pucedDAhan2IoS8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduleehuddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfel
    leeivedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
    hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepvddvpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurd
    horhhgpdhrtghpthhtoheprghnughrvgifjhgsrghllhgrnhgtvgesghhmrghilhdrtgho
    mhdprhgtphhtthhopehlihgrmhdrhhhofihlvghtthesohhrrggtlhgvrdgtohhmpdhrtg
    hpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhg
    rgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuoh
    drnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtgho
    mhdprhgtphhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhnrdhmvgdprhgtph
    htthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:nnjxZwahUNtqogiSdLHBOEOuCPYexHccb0rgEFG2r_X2WhZmKh7O8A>
    <xmx:nnjxZ-a3y7P16u3NJjOyDxAhSsydpkevz1vl0pT6fH9sJbNV1JqjVw>
    <xmx:nnjxZ0CN5BGhwNmTAFS2Gwnrby6bw6PbXdq7mEhjisBELbwZfOgyLA>
    <xmx:nnjxZ8Y11R5GqgpTJZcqScLJXRZeN2D_RnGWDXTNroXOE9Us2f9UPA>
    <xmx:nnjxZyqWUP7c6xGBnbwI9TJPxwupSYD71CJVKxvrtRVRTI9AX8D-L_xu>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 5 Apr 2025 14:38:22 -0400 (EDT)
Date: Sat, 5 Apr 2025 11:38:09 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Andrew Ballance <andrewjballance@gmail.com>, Liam.Howlett@oracle.com,
	ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dakr@kernel.org, akpm@linux-foundation.org,
	gregkh@linuxfoundation.org, wedsonaf@gmail.com, brauner@kernel.org,
	dingxiangfei2009@gmail.com, linux-kernel@vger.kernel.org,
	maple-tree@lists.infradead.org, linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] maple_tree: add __mtree_insert_range function
Message-ID: <Z_F4kdnCHY-Xkzyg@boqun-archlinux>
References: <20250405060154.1550858-1-andrewjballance@gmail.com>
 <20250405060154.1550858-2-andrewjballance@gmail.com>
 <Z_FKugtgoN0l6JNm@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_FKugtgoN0l6JNm@casper.infradead.org>

On Sat, Apr 05, 2025 at 04:22:34PM +0100, Matthew Wilcox wrote:
> On Sat, Apr 05, 2025 at 01:01:53AM -0500, Andrew Ballance wrote:
> > adds the __mtree_insert_range which is identical to mtree_insert_range
> > but does not aquire ma_lock.
> > This function is needed for the rust bindings for maple trees because
> > the locking is handled on the rust side.
> 
> No.
> 
> The support for external locking is a TEMPORARY HACK.  I've talked
> before about why this is and don't feel like explaining it again.

Does it mean that ideally maple trees should not support external
locking, i.e. it should use its own locking?

(BTw, people usually add some documentation if they don't want to repeat
themselves ;-))

Regards,
Boqun
