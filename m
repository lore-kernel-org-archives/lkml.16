Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF55215779;
	Fri, 27 Jun 2025 22:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751063956; cv=none; b=J/z+8zgVv/NyfJKvkt5pVMa0Oet1Liph4IG/cs9k6ngJzUVjciyCaSNrHAFqn1dA3qeolDGTNNuH9IMjvuvw9jYo804JMWMTIcACSBztcYi2/iSEjuMs0j2YoTEh9wzWBH4gkqS5VaSN4/xKUoGnt9qm5q1GWFcGPsBf1kzO4bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751063956; c=relaxed/simple;
	bh=tSpyaSFSPT7uJTv05rNtSxyQNlW06OSxvXs6dBWfvAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QJR9PbATob9Bsm+gOI5vN9sU0BjmyyfPZr+kbBADI4xJ4qZD9bIZjyz4GJpF2FOVJhpXKXVPAEr+2nAEngfcnCkMtXg2AruVfF+CCrkGgoQa/kLVUa9ISAMoqGhLTsBNbt32AgFHFNaClKC1wBCHp8pRjmvjmUQ26VGHDU30DgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UdSsYP5V; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UdSsYP5V"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6ecf99dd567so4826076d6.0;
        Fri, 27 Jun 2025 15:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751063953; x=1751668753; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7g1bBXYrSy7vlenebLtkHlzOqTtWZZlLI9LeHsV4Peg=;
        b=UdSsYP5Vd1bq1capBFMf+G/XGaP9uAUUbHxXueBGO/NmwqtbWKnTICu48a7ZrLY+x9
         vZIyHlbEBstWgjohz4aHFbJF+PYgyYR3TdeJtNkbhTzeZLiLkWPgS91zRCsDfaRENQV3
         6wdF1Rv4Fn9cda8i76WXrubjH9lhoP59Z8yKhmoP8Kh9KOpJEIct9tSuoifNGFH7Bk5V
         mAtb9uR3dbXi+oB2rkbox2apIQUn51HRsmDJeyUw4gX/jYrIxIJK/YY50r5S/fnJUA7M
         LZpddsUIvx9iYXYKIz4JEE0Ytd6TPYtddZkBqF2Bt/eFeXE7De7oDc2rmrYeNzOe15Wm
         Atfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751063953; x=1751668753;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7g1bBXYrSy7vlenebLtkHlzOqTtWZZlLI9LeHsV4Peg=;
        b=DU+tck2KCXc4lqZCmAWj9dtN23olXrx2IswlOPRwLR87lz0L2XaJGazpT7KCFx5Bh7
         SuzW8LEnoW3NPizUuuxIAMriiISJv23fG9kOCrwwNHVhv+D+ZPfPHV3xBN7/wErBrOa2
         5WmXZj0WpPXRVasSVttZwpepRsHlOb9eziDml5u5i0un1FTcGDGyEpMkzCBvErXfpxp7
         ewhgiXG9De6hFt/IikTRwZa8WptQj8SzYwW1neprRPuCJyCClaBuhp7xQHtPv1tHdULT
         ILeRTrBrmGJnph7KzyersYKIDQ6PVikaW/mlfKKdY7vrwiwwAHtEhteziRwFh+FGAKa5
         Mq4w==
X-Forwarded-Encrypted: i=1; AJvYcCU5p6lei66qGWU2zgENUN537SO0OSO1jCka1pnew/40EBL2Qki0dnSOZF2h5nrsyck6yQPpumeyLDXJ1KknKr8=@vger.kernel.org, AJvYcCWitjH+6DYc0jqOZ0jPvhJb2KRisrQqzRddGIJQ40vvB+vISYSqvbUZ71gkmv3I0S5H1yM5nnaRRj5UYs8=@vger.kernel.org
X-Gm-Message-State: AOJu0YztrdCIBT4WfnuptwfeubtPKvT/AUbtjt/WxQRRruqj9U+AqDfP
	FHl4x3AwGmzM7Z0bqosz0k3eF6WC43SYsuJKwfKEx8VfZcheOTuUNKiv
X-Gm-Gg: ASbGncsfUvs2j8Gdfa9OxzCuOpC+2GVHP6JREhDOnsZ5RRqjhFphMjW5HHkZa6Ogj3C
	g8EgECQvkJYHmGpWXpIOqaEkeqXDAtNE2MpYqg3gVeMtcmJzc3H4V6A0cvJ6Wudn74O1flObuJq
	1xxbJcdFnmD8wgYeRf7GtBZ8BxjdaVLBhIRQAT5Z8yfTzSmxBlBmZXVYP4XsrF41LC94BqKTaAC
	ZlTKbgE61XR+Xoj7pKcv2/0BDzmqMm2fkj0XTAql2LUicbCY/NH7/SufGu+dNTRj28gZ/cuAAvn
	P01NySROmCGRWTGG56UMqiVwcu/ny0vWVscgHKRWm/LXRepEVooASvQVM2FaVYvTDYhFP09TWZB
	1pva/NPYZaeOY0lms/DESNdlEDU17G4PKitso0sv9mocB0znVlACE
X-Google-Smtp-Source: AGHT+IFWuNaj/OKb0RZH+IjgOcgGhXHGSzbx04zgmFEX8NtAwscJcxkqQnoNKbPXGS61cWBJnzOEbg==
X-Received: by 2002:a05:6214:c44:b0:6fa:fcd9:35bf with SMTP id 6a1803df08f44-7001441b0c5mr66576126d6.42.1751063953388;
        Fri, 27 Jun 2025 15:39:13 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771907c9sm28206756d6.2.2025.06.27.15.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 15:39:12 -0700 (PDT)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 480B5F40066;
	Fri, 27 Jun 2025 18:39:12 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Fri, 27 Jun 2025 18:39:12 -0400
X-ME-Sender: <xms:kB1faNOxkjtCFix6_w_rot87ViWsb8wjUo0vjkytxCHkAyDbLrzWwg>
    <xme:kB1faP9ks1nrAds7CC40G9qxQ16uAHReMZgFsGfWkgWwnz9Mw80v-84stSQQ0K3AH
    l2cMkqtagxbiwwAKQ>
X-ME-Received: <xmr:kB1faMRyk5IARiz87bUwzTbsBP09dC-ntralNRH4hDvIQ3-AJQL2cZS9e8lU6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnheptdegheelveffudejffegvdelgffhhfelkeeiieefgeevteejvdegveeuffeihefh
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopedvjedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepuggrnhhivghlrdgrlhhmvghiuggrsegtohhllhgrsghorhgrrdgtohhmpdhrtg
    hpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdr
    tghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgv
    ugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpd
    hrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgig
    rdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihgh
    huohdrnhgvth
X-ME-Proxy: <xmx:kB1faJthd-tFGLJNLe-nAQkH56NVz9fnznKUgc35i602na4LkfS5kA>
    <xmx:kB1faFeVrSSzrp4_EhOMCv6cOJMhHQsgk2VXTa5is8g1ygAkalFc-Q>
    <xmx:kB1faF1cLzGjwOhN79n1-y9UhMuh_Bmx55O7BYqrZMyvlZ-8-eptWA>
    <xmx:kB1faB9zf7w4YiPdZlel3i--5a3DEese5OgyQt6-yKd_J3fNsj2C-Q>
    <xmx:kB1faA-r9s6UtJfP2rn4IH21a-4GoP9FU4sb8NYRru1M6R17cBKmSHFG>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Jun 2025 18:39:11 -0400 (EDT)
Date: Fri, 27 Jun 2025 15:39:10 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Stone <daniels@collabora.com>, Rob Herring <robh@kernel.org>,
	Alice Ryhl <alice.ryhl@google.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Carsten Haitzler <carsten.haitzler@foss.arm.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Ashley Smith <ashley.smith@collabora.com>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH] Introduce Tyr
Message-ID: <aF8djorZMkuw4CCq@tardis.local>
References: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
 <81B29EDF-B6FB-458E-BADC-F3708A9434BB@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81B29EDF-B6FB-458E-BADC-F3708A9434BB@collabora.com>

On Fri, Jun 27, 2025 at 07:36:33PM -0300, Daniel Almeida wrote:
> I´ll fix the missing "rust: drm:" tags on a v2.
> 

No worries. For a second I thought you meant to write "Introduce Tyrion"
;-)

Regards,
Boqun

> - Daniel
