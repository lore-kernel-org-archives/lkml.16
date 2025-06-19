Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F661FE44D;
	Thu, 19 Jun 2025 15:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750345814; cv=none; b=WjxrQAA+3+wniVUz5wEUL1/HBIYUsj7q88PA1T+Mz6qRR9bsKqHVNhg0idH9s9daRzlKxuuuniUP6By+ZtLAC9Jy0LuijhZE8GgyPixaKR/oG+/E08DctcFJAGPyGOWdVhnjIy6WHLoD2OWicEUsww9bU1kiYcME1oSwGExE8Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750345814; c=relaxed/simple;
	bh=5EyZO924FDkqkJ5QPwyFHTlS/KOQR1sbhsLBrvwepkM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ptuIExETdZ4rjPgT1hY1ig1DJuTNNbTrYRBBCcxn7yJkHifeSnTqRXPZVJBYhZfXMhMjYkvR+tCaIN+1lu2lLl2LcCDgtHCTBODO3Orr6I+YRq98fvWrSQ8iAkTT3WTTKca5HqgHu4+0Y5JaxfD02SQKU/p25kbOCunE1Db1Kc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Arzt2jof; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Arzt2jof"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6facba680a1so10539956d6.3;
        Thu, 19 Jun 2025 08:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750345812; x=1750950612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZEZWQbgcvzT2wcmdI484p7+Htq+59tj7J62rzPzgTgk=;
        b=Arzt2jofABnKMPNENQLIYFFF2yNHF2xao+dUhknMt7nBMVPdsFa9Kr9X0z49ncZFZw
         9rwaNTJmYMzZ7Kqn+KrQYhrJo/I72SOxHwfmv+/KMHMvIlSGOqhFrpit1CALoSkv/Vz9
         TzSDQDeMCb35aarRbUU/2kQsVxTSaYVSo0mDChCmpiiOV8fewhmXANmyY0piq5uV/LvO
         auTqLvWEiZu9hTzJm4GnU9F1ncA/dMlTKhiJBNlmNo1wuIdUtxrhDcZycrhCsXWyfq9G
         8OofnKob1IREiPBAuf3Gd4Equ4DHFKIW1/FDytBQb3jgh2dEJgcyiRDkTpGu+pxPg2jx
         dnhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750345812; x=1750950612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZEZWQbgcvzT2wcmdI484p7+Htq+59tj7J62rzPzgTgk=;
        b=N3MuPZmm3xnIIS32m2MEK90BDkQ1N+6WRKqj/i7uwrI3mjNTPwsVuYOlYIIa0R4kcQ
         gy1uSel7lXNeyDRj454PKgE43M3KcpDWMWNCi+44apUj6oKgf0geGFf4+4wiVE+XUdY0
         qUSX070VesEZS0AkFb3ql4QsDvAnlhgR0b4W8LjC8FvONq9ZM94QC84fW20Q/Qhg41/8
         g80zOjWjzVrbo++M05jxp3zQNBoZxtAjfnhLqAk/o8dtevFdUcGHGP9hINLXsWgzm5Ih
         4thTTcWOHbIX5s6mYZ3WkKik6bNUf558GSFRqUhWjQg/wUZdiuvhFrqJ0BFEY8B724aS
         IKSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoxOHHDiYQHFxv6fuMiGdxNB4dRlf9+KsRzpFGww+jQnFzrsXiTa9AlOkpH2fhZMfgWQjlJpkY3/DEQPPhiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLp9XPPF+TFXKRs1LMFWMyGLPJ94oUpx6YahZD7zBKwtcpKF1l
	YxzTBrk3r//Hilo8XBH1zTtG5tDIG0PQfijnY2TYiDD/Gx777LBF1BAV
X-Gm-Gg: ASbGncvKCC7hVrjtt5RfXfnzTATMZjZoIiJz4rSe2FKXpdqGq5t0heeEQbJ9UKVO7Tx
	Dox98Z52r6ppnEqiwAMNhJud4clDMruktHB3/eLbfotDqO4XR8eTl5E6wH+igZWXsCmhHL3mWZI
	aUDrHj/SZePK1Cg/GZXhYDdRAPiPHAIU9JlCa2idjYf3XhXwC9gQg6U8zDwqDcuOWLBRhyCAT9r
	jWWf7Ljg0fbfkfNwLyi5e5XJ/k4uRy54wMGlc2HQz9cwQKYIEiHylhzyDpytGwNvzlJpN4fju+e
	Y+qvkVXv2exmCjS6Qk//JcZel71IC59SciLz1uHbGDZ3h/KPHzy4jJuvhZSM1DufQaTR2FqiLqu
	7BoiI9iH/DDLFECKKOX3aPcj6N/FSxFG4huADjHnPEMGXfwA2x44F
X-Google-Smtp-Source: AGHT+IG0rOGcTW5GFieAZCkxFifLFjfqg0CEvbtsEhIk/qnJyVcMuDUBI2D2lkYCn9fzKAlY7hV4Fg==
X-Received: by 2002:ad4:5d6f:0:b0:6fa:d8bb:294c with SMTP id 6a1803df08f44-6fb47726e99mr320857486d6.14.1750345812032;
        Thu, 19 Jun 2025 08:10:12 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd0944406bsm793566d6.35.2025.06.19.08.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 08:10:11 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 813411200068;
	Thu, 19 Jun 2025 11:10:10 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 19 Jun 2025 11:10:10 -0400
X-ME-Sender: <xms:UihUaJv2ILBrugFS3XVoifcDu3R2yK_Lm1ZSyi-A8c5P3ylr-lu50g>
    <xme:UihUaCdecqR3HgFkPnVbGS4HcE7nmim3fLT_Pzduej64gNSoGutcRN0HK0Mv7O3lY
    cNfOoeNdZ7EYqStSQ>
X-ME-Received: <xmr:UihUaMx4nVqGdAq-5IrMiipCfT4-XZlHPSlntw0b9isiJILXNmzMpvFEdQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdehkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtne
    cuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdr
    tghomheqnecuggftrfgrthhtvghrnhepteelfeefvdfgffejgefghfevveeileejffduhf
    efiefglefffeejfeeuveehkeejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhi
    thhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieel
    vdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtg
    homhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvhedpmhhouggvpehsmhht
    phhouhhtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepsghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtoh
    hmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghl
    vgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrh
    ihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghi
    lhdrtghomhdprhgtphhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhnrdhmvg
    dprhgtphhtthhopegrrdhhihhnuggsohhrghesshgrmhhsuhhnghdrtghomh
X-ME-Proxy: <xmx:UihUaAMjh5gDLTpNLflWSZwGnf5fxz-PmiA8kHLNyS_3kCSZsqJ4nA>
    <xmx:UihUaJ9eBnggXC4Q-7e3DehznhDk8eRXPljMWRgFcoaiuPQGrTVqIA>
    <xmx:UihUaAXAM3Es4dgGQse9N0PHI322uEbN5k0Gc5TeXFe0KoaKQA3dag>
    <xmx:UihUaKfRxn5Jt63rKZsffIecc1fFjC9JOz9UlCvRexoBWiOUrZhdfw>
    <xmx:UihUaPcaqLs7EgGzOGPA0svALUFw4ji2a7YgoF7DAXUigJTuRcX-NLfL>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jun 2025 11:10:09 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: boqun.feng@gmail.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	pmladek@suse.com,
	fujita.tomonori@gmail.com,
	mingo@kernel.org,
	tamird@gmail.com
Subject: [PATCH v4 0/2] Add Rust version of might_sleep()
Date: Thu, 19 Jun 2025 08:10:05 -0700
Message-Id: <20250619151007.61767-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is a v4 of Tomo's previous version:

v3: https://lore.kernel.org/rust-for-linux/20250616153604.49418-1-boqun.feng@gmail.com/
v2: https://lore.kernel.org/rust-for-linux/20250410225623.152616-1-fujita.tomonori@gmail.com/

Given Ingo's feedback [1], and the ongoing work at Rust side [2] (thanks
Alice!), I think it's better that we just start to use
Location::file_with_nul() if available, otherwise use a "this is not
supported" as file names for might_sleep() debug output, this should be
sufficient since might_sleep() only uses the file names for debug
output, and it will also trigger a stack trace when error, so some
callsite information can be gather from there too.

Having might_sleep() will unblock the support of read_poll_timeout()
[3], and then wait_gfw_boot_completion() [4] in nova. So hopefully this
will allow use moving forward.

I will a PR to tip including this updated version if no one objects.
Thanks.

Changes since v3:

* Changed the name of Kconfig per Miguel's feedback.
* Added comments on the unstable feature `file_with_nul` per Miguel's
  feedback.
* Added an example for `file_from_location()` per Miguel's feedback.
* Changed the return type from `kernel::str::CStr` to `core::ffi::CStr`
  to align with Tamir's effort [5].
* Applied the documentation change for `might_sleep()` from Tomo.

[1]: https://lore.kernel.org/rust-for-linux/aB2aAEELa3253nBh@gmail.com/
[2]: https://github.com/rust-lang/rust/issues/141727
[3]: https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonori@gmail.com/
[4]: https://lore.kernel.org/rust-for-linux/20250612-nova-frts-v5-12-14ba7eaf166b@nvidia.com/
[5]: https://lore.kernel.org/rust-for-linux/20250619-cstr-core-v12-0-80c9c7b45900@gmail.com/

Regards,
Boqun

Boqun Feng (1):
  rust: Introduce file_from_location()

FUJITA Tomonori (1):
  rust: task: Add Rust version of might_sleep()

 init/Kconfig        |  3 +++
 rust/helpers/task.c |  6 ++++++
 rust/kernel/lib.rs  | 43 +++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/task.rs | 24 ++++++++++++++++++++++++
 4 files changed, 76 insertions(+)

-- 
2.39.5 (Apple Git-154)

