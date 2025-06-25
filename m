Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F051684B4;
	Wed, 25 Jun 2025 05:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750828528; cv=none; b=YlVFEQYv863ev68XDTjLLyNKGgRk4m6slrsrJn+8l9xWPqJ3czIvJUMJqRAYN/Gku8O/eD9W+a2oro9l7vLyD8r9dYC8i3QLrG7z85t7o4TBmTeNct86gC8BAezwQkfGQYtDNLzxVsPAyjYvfx2HJ7WkeNTB1p/fgQpOZS8I4PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750828528; c=relaxed/simple;
	bh=lhtkNSuzXSsKjmt0T3z4wl91aDwkJDnhCQdTrItbqic=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=shmic0xWp8qVKuqPa5AvckzHSOZf1bobyzai+5eIlzJh2ltVG1MruslHOp9IzUl4LluWUGfQC3raSkkOb4capeWkY3UC3w/gLcDQnl2slkcC1beGFUuuD7YI+Z5Y431M9WUxaoCLGwa95nXlAqTQLH4x0BFAzLBEx1Cg9l0A/dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AjafNdCu; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AjafNdCu"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7d0a0bcd3f3so62449485a.1;
        Tue, 24 Jun 2025 22:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750828525; x=1751433325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a2OOPxKWYk4hTUfw7nSlfH/YrkvOwqTvCn4QLXORMeU=;
        b=AjafNdCu1DFzAeBysQgV3R7DLZge5rwEHweS1AT4RdbYF8ObDov1Q/mPrqT+0aegv2
         70e1StxCq0ThuUIX9eRwrbMfq1y2Ia4LVHbF3jeN2Mt4sdt6j23ZoUW63mXJC6HFCtDh
         sPUr4Fqh3LbHbkfTVjXjE5bDbhSqcfeJIOHxqXy3A1lBAsHaisuKxeUmZMiX065cKE+K
         5wcePOAWaBfXwDQdxeCCaFUAp4cF4dBWwmETKG/q84KcCyaKwLqjJvQ6YyzyNxq6VFKk
         nFr7zltyV9FjYN+PA8wmXUqwl0IUCdQwxGQ7ULPtw8PLP4+X1fCDwIiZ49iGEHMg0Hpp
         s7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750828525; x=1751433325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2OOPxKWYk4hTUfw7nSlfH/YrkvOwqTvCn4QLXORMeU=;
        b=B+XoBF/+DKUwwho7NFkeNedndzYxyclvb2WPWaMrKj1hP9cnBzr8d8JeEP+NerK3hW
         UxYHuMx/DV9k58XhMF0Wg9+RJhfGS86HZHLfewX2oT5kjcPGmc1UQeUl1713qlJv6SJU
         LL66ad1W7Ogcthh+lUj7KeFRZQhKSbyYXoEGh4qpe+k2FK8a2g55b3UdkTTXdX+ODUWd
         Jioyu3cd91slzNXTqpilWcPXHXMWvQLr+8aH1fvCjy06+2O+mjJk2X7cDmCJ4H24X6Sk
         yH3O4CThPO6j4ywhhDI8hH1KoUh20fEKZmXDdc//eJDiyYX4UXexFz7jUwJwFWzQb+Di
         yX3w==
X-Forwarded-Encrypted: i=1; AJvYcCXK/0Thzg9tlvLQi6wBdquDZdpWpDZnvvPin+8b8fo4icSv4GxOujZMkCZmgVopR0RW8A0C4i2AgoLjN1I0akU=@vger.kernel.org, AJvYcCXYYDQhwMA8GNmfYQUYNMgmwlFnR5/G9iJ/a1SOxYmcQh5/3pm9eMMbXdg39ZB3Rij8C0u5FVsG8IT3Bs0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJXNMn9TPfPxqtpbrIAS2LwDHOZomqiUU7YpgPuJUck0oCWUqY
	NXFxg+Bs3pqtVkIjBwq73vpTTIWySkBsCBcTlk+k6npxU/1u8woG9CV5
X-Gm-Gg: ASbGncstwNiIhUeSUEZZHDHBzpZrD/S5VlBsaFTeJt0g9lwywT//5ftysnMR1wGEZEB
	MBjz6RKkUtnvKUvAyPMzofsBQY6jRaSvM/a5+8PgQuU1/B2OBaxUfiaVYyrC3Yw2S6VFC9Xv553
	MydWaW7eLoRjfdeUD3eyglHRfGv/7SVMoESXzb57jmNPpwmgxiBAw0uOxYm2lB9y2a0lJ4d7ALf
	p0LEwU19JU5kK4IeQ91+RVT4MSV1YN+uXyL5mYwMOdr3uO20up8KWyHcwqir3P7jgWiX5TG3uWd
	FSfKBEpB+LM11ublMe5Yt3aapQewnJwjUbHOetKGyTDp6qMGQJtUJsAHDhEktVozq688CZ2ddnv
	WARFB3A4jBL8ERWdCLbX1WOPVNjpZVl50zcRQBqp88OEZ9JnmWIhF
X-Google-Smtp-Source: AGHT+IFT5SEYKNYQmQtuyu/Uzh51mp9bJuGn28ALvttvIJjRc9ik/mxqgQs83zOisQSg8uoeVy315w==
X-Received: by 2002:a05:620a:191d:b0:7cd:45ec:aac6 with SMTP id af79cd13be357-7d42993bc63mr194192185a.24.1750828522822;
        Tue, 24 Jun 2025 22:15:22 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f992f21bsm581457085a.0.2025.06.24.22.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 22:15:22 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4FD67F40066;
	Wed, 25 Jun 2025 01:15:21 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 25 Jun 2025 01:15:21 -0400
X-ME-Sender: <xms:6YVbaOyVSJcbYZAvZJKym4BlhhEw2mwtcLC194hMfX_VezftFQ8lMg>
    <xme:6YVbaKT5H8amyh-WG1EFryMubAIARx_K1MsclJfOyhxaWwMJbsQWE1BDElhO1Mm6c
    DwVt1Qd-t2CPpHl2Q>
X-ME-Received: <xmr:6YVbaAX7dmiPsWlLF1i5jqWGaTOvC8lZWXZ6CHmjmNezyKtuTMWvF1YGjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvudeludcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeeuohhquhhnucfhvghn
    ghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvghrnh
    epgeegueekgefhvedukedtveejhefhkeffveeufeduiedvleetledtkeehjefgieevnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshho
    nhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngh
    eppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepfeeh
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmihhnghhosehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphht
    thhopehmihhnghhosehrvgguhhgrthdrtghomhdprhgtphhtthhopehjuhhrihdrlhgvlh
    hlihesrhgvughhrghtrdgtohhmpdhrtghpthhtohepvhhinhgtvghnthdrghhuihhtthho
    theslhhinhgrrhhordhorhhgpdhrtghpthhtohepughivghtmhgrrhdrvghgghgvmhgrnh
    hnsegrrhhmrdgtohhmpdhrtghpthhtoheprhhoshhtvgguthesghhoohgumhhishdrohhr
    ghdprhgtphhtthhopegsshgvghgrlhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhope
    hmghhorhhmrghnsehsuhhsvgdruggv
X-ME-Proxy: <xmx:6YVbaEjLrmPFhuS3qAzTL1kF7GcaDRZFvRMYrJn4Xt85ksVOigYroQ>
    <xmx:6YVbaAACs47NIlhwSowVmDy5oFOD-9-M6wyO0XNWAuooaNtqdiEDbA>
    <xmx:6YVbaFJ26u595Bgm2RbmcVFs8bo-hmkEYDgT-upJpycidUtbsOnRnA>
    <xmx:6YVbaHCeVwKxy0FrQ-ckIWFrRAsQf00F-OKnSmZ3pvShYurEn6zAJQ>
    <xmx:6YVbaIzil-_nsJvVnMUVhuXgtcScToVW96Ss-PxK09iDPxynXgfwnxhL>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Jun 2025 01:15:20 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,	Valentin Schneider <vschneid@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,	Justin Stitt <justinstitt@google.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Tamir Duberstein <tamird@gmail.com>,	Kunwu Chan <kunwu.chan@hotmail.com>,
	Mitchell Levy <levymitchell0@gmail.com>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Borys Tyran <borys.tyran@protonmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Panagiotis Foliadis <pfoliadis@posteo.net>,	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,	llvm@lists.linux.dev
Subject: [GIT PULL] [PATCH v2 0/5] rust: Task & schedule related changes for v6.17
Date: Tue, 24 Jun 2025 22:15:13 -0700
Message-Id: <20250625051518.15255-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ingo & Peter,

This is the updated version from my pull request last cycle:

v1: https://lore.kernel.org/rust-for-linux/20250506045843.51258-1-boqun.feng@gmail.com/

Please take a look, thanks!

Changes since v1:

- `Location::file_with_nul()` is used to avoid the C changes of
  __might_sleep()

Regards,
Boqun


The following changes since commit 5bc34be478d09c4d16009e665e020ad0fcd0deea:

  sched/core: Reorganize cgroup bandwidth control interface file writes (2025-06-18 13:59:57 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git tags/rust-sched.2025.06.24

for you to fetch changes up to 7e611710acf966df1e14bcf4e067385e38e549a1:

  rust: task: Add Rust version of might_sleep() (2025-06-24 15:53:50 -0700)

----------------------------------------------------------------
Rust task & schedule changes for v6.17:

- Make Task, CondVar and PollCondVar methods inline to avoid unnecessary
  function calls

- Add might_sleep() support for Rust code: Rust's "#[track_caller]"
  mechanism is used so that Rust's might_sleep() doesn't need to be
  defined as a macro

----------------------------------------------------------------
Boqun Feng (1):
  rust: Introduce file_from_location()

FUJITA Tomonori (1):
  rust: task: Add Rust version of might_sleep()

Kunwu Chan (2):
  rust: sync: Mark CondVar::notify_*() inline
  rust: sync: Mark PollCondVar::drop() inline

Panagiotis Foliadis (1):
  rust: task: Mark Task methods inline

 init/Kconfig                |  3 +++
 rust/helpers/task.c         |  6 +++++
 rust/kernel/lib.rs          | 48 +++++++++++++++++++++++++++++++++++++
 rust/kernel/sync/condvar.rs |  3 +++
 rust/kernel/sync/poll.rs    |  1 +
 rust/kernel/task.rs         | 33 +++++++++++++++++++++++++
 6 files changed, 94 insertions(+)

-- 
2.39.5 (Apple Git-154)

