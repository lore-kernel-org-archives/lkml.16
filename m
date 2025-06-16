Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BE42206AF;
	Mon, 16 Jun 2025 15:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750088171; cv=none; b=HT7/CekfthIU21+++5GOypDTJKBuacSX0qiHSLUAmeTH3c7mFKCrzXffq2+lyoLhp4QGlZZrkiu3IvF1oM/EPRiFzGxnAGALn5zuQlNxsswRoDpbSKpzRYRia//fFlJMAOF6dXtr2NICBMfmNYj2fKHvE7+CRj68wnO5YMLQvmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750088171; c=relaxed/simple;
	bh=eNIUtFAa2St0iqrOauq71j8o6PgQUDcBtyV35ApQvHE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fZKIp8s2CdhZOgwBNCpjtTsKtWPkE+1wfigBBHoEBXhjRY6PUlkCuFWh5USQbOQlVvLJNjRu53/Jh/28uaXJ1wApcwbIicnz+9TFyYYHMBLyE7HOLi75coc/LWyEB6cwj14/ECwFVWbiOyXvMuP6owGD7Orm+Q1Xe7G4O/rJNe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ho806Lts; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ho806Lts"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a58e0b26c4so84819261cf.3;
        Mon, 16 Jun 2025 08:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750088169; x=1750692969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=whwXtwuGz4PF/512N5Kt7VCfkXWiQL7fNxAtNK+cJsE=;
        b=ho806Lts7wlAOct/AUDqj8LlRqKc2YofduIWM2Ii7O4tSFSK5sEnG0CIHwYsGrRek0
         cpogPz89hS9BuWGvOGPsdK7A/hxl2y8Lomhe3AkbWRkGbYHKkVNHjg0kaHWn+xXxKmx9
         1CzA+oon9gZtKT3CvODBS80ZJnE0qGBKo+euVWtdrPiIsU58KT2dmbky8KmtcpWNYJId
         ZbJVgEBK8KfVEpbxWT2x14O3wCbtTS76+Cvwv/IAvb3ko6as+q4tHneL3xeMkHWLUGtb
         FCM91l0hR/wst3IDwIA/vebuML48I52qvqBUYdk8eaI+yQYHgWo7mZA5SwJUVCa8iDKI
         5LIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750088169; x=1750692969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whwXtwuGz4PF/512N5Kt7VCfkXWiQL7fNxAtNK+cJsE=;
        b=mz9ys6qfF4+OO/szCLws6mtGgzJgd8nMfsVv+a/1XopJbV1h+/76DZu2KpbuDMn1zR
         qdGz53XxSTmaMNnzEWqYjh/qpnDsQbi/0IpERPExmgOej7IgTppQnxOkWjQCGmwhAp0e
         2xxHLjwg1zo+dT0sEZ5hph8liwQ87yiAKooav1ooxv/xR/tuIKrqrM0xbD/KWBje3CGo
         X4Bx6Yg9MSYUiRRWL9cLucT1FmaeQBEAi1s78EEUU3Fdxs13Eodb+X4dAJLfVTQuPJnO
         GdXi3pVzmwVedOq+pK2Ytoa0DtWIaxlewP902bvx6Bw1u+VKXJJKXaxPwOplBPCzsFk2
         O6Zw==
X-Forwarded-Encrypted: i=1; AJvYcCVnBSmt4z7EwW07dVVZr/dUUkFkgY8/xh/Go/OHgFNSjkyq3QGrihEqWHTZWsCXdT8M6iLkslnii7qFtJ+RDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWSOXWzlCMAMxD67HAk8Xasy7d7ufQUos1xDkXX1pdU8w+iwoZ
	RTGl/JlhVNpCC0uh9nDnd2PzXQ9MAYweXmj/6eqerK/ywFqWWlzVWhV1
X-Gm-Gg: ASbGncsimr0lfpTjMKCX5DSY1QaS/yZxIZGXdXakTpjJR+yL/x8W48QAgAZZqADP10M
	Q8U14jQPU1dWK+/7jyK0HWomn0lM9K7DIgJVbWhP/CMKftzYIYhsHMauVNAIM/LydRgWrK0EMRP
	yNLdOSHh6v942Gqa7fpYXVuuFPHXgrpzfYW8hyF9FwaiI1WquFfs1AIkcKyX/+GZGp3dR0QvVOY
	y6T3wSXwE2OOHTgKmmjh7SuN6hqubi7dxePJ+VQRSDl7HXp/z2NSxWSfhB9ksUgNOjczViUmfDi
	ojOp1vysL08rkyCSExwXVR6odiJ7R+/eoebS2HDt3ZEfovWgp3U/JtT0kd34vHIWpa5raykEPrX
	mXeZxwMnKbY9GO/NHxU1euV2CC31OjrfdFFfK/HJttiSjYnR9yyyB
X-Google-Smtp-Source: AGHT+IGsGTFBnixwKO4V2fHWkZ4L98o/359ONOWMIVHIKQNk+Be+l+Q4VbfHut4icP9rjYen8X0Ayg==
X-Received: by 2002:a05:622a:7:b0:4a7:2357:dc81 with SMTP id d75a77b69052e-4a73c57508bmr177177251cf.3.1750088168678;
        Mon, 16 Jun 2025 08:36:08 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a315c58sm50491911cf.36.2025.06.16.08.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:36:08 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 54826120006A;
	Mon, 16 Jun 2025 11:36:07 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 16 Jun 2025 11:36:07 -0400
X-ME-Sender: <xms:5zlQaI9-eA02-UFjKZpk5FuBOUfy7ELzuH9T8qzLBIgsSihf3YjXag>
    <xme:5zlQaAt5zPN4dbKo-9Qk_CwViZQtCe1FtafyqEhLZeYX7ZyMXExXzhC2uUaalMueP
    Y6NBG9eqUQsS7146A>
X-ME-Received: <xmr:5zlQaODDU5o9jzfoUPEaoDP9Y9m4aWThjt-HWmxy9minQWR8al2D8twbQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvieelhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhephffvve
    fufffkofgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosgho
    qhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrhhnpeetleeffe
    dvgfffjeeggffhveevieeljeffudfhfeeigfelffefjeefueevheekjeenucffohhmrghi
    nhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhht
    hhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquh
    hnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghp
    thhtohepvdegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhkvg
    hrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehruhhsthdqfhho
    rhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegsohhquh
    hnrdhfvghnghesghhmrghilhdrtghomhdprhgtphhtthhopehojhgvuggrsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpd
    hrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhr
    nhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtohepsggvnhhnohdrlh
    hoshhsihhnsehprhhothhonhdrmhgvpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehs
    rghmshhunhhgrdgtohhm
X-ME-Proxy: <xmx:5zlQaIcSCQ-cp_8o-ptI6bfRvYOK89gCd7eaFBZyNt7_IexWfkRj0g>
    <xmx:5zlQaNPxOfBhDnHLT9J0neqje_GMyilcZg5BasnucLyBVQchUotKOg>
    <xmx:5zlQaCklWsGoAztlFFcGcAnJEeKyWJkuL-DN3DfbO_fKtXB8FzaqTw>
    <xmx:5zlQaPs5LpOBAY7ZsithCHRBNq5cj5tKEVK3jNbS7JNtKj7j1FYNwQ>
    <xmx:5zlQaLv-2lid7j-SwFe3L1324QSloiNvxg7kC41Gm5wtp8n18qyb75gr>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Jun 2025 11:36:06 -0400 (EDT)
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
	mingo@kernel.org
Subject: [PATCH v3 0/2] Add Rust version of might_sleep()
Date: Mon, 16 Jun 2025 08:36:02 -0700
Message-Id: <20250616153604.49418-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is a quick v3 of Tomo's previous version:

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

[1]: https://lore.kernel.org/rust-for-linux/aB2aAEELa3253nBh@gmail.com/
[2]: https://github.com/rust-lang/rust/issues/141727
[3]: https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonori@gmail.com/
[4]: https://lore.kernel.org/rust-for-linux/20250612-nova-frts-v5-12-14ba7eaf166b@nvidia.com/

Regards,
Boqun

Boqun Feng (1):
  rust: Introduce file_from_location()

FUJITA Tomonori (1):
  rust: task: Add Rust version of might_sleep()

 init/Kconfig        |  3 +++
 rust/helpers/task.c |  6 ++++++
 rust/kernel/lib.rs  | 21 +++++++++++++++++++++
 rust/kernel/task.rs | 22 ++++++++++++++++++++++
 4 files changed, 52 insertions(+)

-- 
2.39.5 (Apple Git-154)

