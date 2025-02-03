Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE75208969;
	Mon,  3 Feb 2025 15:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738595398; cv=none; b=KvHJLhUozTuSCqRDxzTeTVeYoW5+HIBqtq8WIZR05EgIXpmNZxEo0F9/ol0XNaaQG1f8BqCt/A6PXNoF+KbPwf+urCM3CnY7MLmSs4FVfoJocwqLetrL+ebXS357vgM1VCKHFOZpK66AZTxdJZuakefp6gbbPjfGKNULTSrZBHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738595398; c=relaxed/simple;
	bh=/UZpvRA67HxsywtAor/ry48Oc3HuQY3KQS+pRcQdRrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xs4lKqWcTVKdJPBllQJ85XeGt1mNA1/OhgcSDOQY5mXb62SZDxc3FERHkmKNoo0ns7XsDl/Xby13aWdM/fuhrMwUdK4+1Gjh6M0z0XIDxK9XVd6deMVXdWSRaagIgQeEs4Tyy7rjmb618mwPaYL1kevJVgAVpimvzHHfI04fHJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f9+SSj+L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f9+SSj+L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 040C1C4CED2;
	Mon,  3 Feb 2025 15:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738595397;
	bh=/UZpvRA67HxsywtAor/ry48Oc3HuQY3KQS+pRcQdRrc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f9+SSj+LoKmUHxCf7yrq4GqBNE/6DcX3Kj+CgoEvWzm+HpgtEBHOUbEccQFQG0A3v
	 lCeX69RNLP6Y984m1Ypji1ESNdqq8d4/eJK3ScRDi0YVAeBgAZyLKMANeAJCzgfC8d
	 8RqwU51wTT3lXxkm4LR5T9XDCMyGGxi1Y5ZHI8DjvhALn32vpgGbsY73pLhu/HSEt3
	 SWvVOwRoHhZR5HbwZgr1fPXWB+eD7x0qgzmrC9ULhy14yWrEtyevc6jDdDU2leYdrn
	 PGXIk+EiW49QKT/5st/EIS/YhbnaDoY5uStTxjOJki0uKBjmIznTmPEH37p76fxMlw
	 BkObQWG24U2Hg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Mon, 03 Feb 2025 16:08:00 +0100
Subject: [PATCH v7 14/14] rust: hrtimer: add maintainer entry
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-hrtimer-v3-v6-12-rc2-v7-14-189144725399@kernel.org>
References: <20250203-hrtimer-v3-v6-12-rc2-v7-0-189144725399@kernel.org>
In-Reply-To: <20250203-hrtimer-v3-v6-12-rc2-v7-0-189144725399@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Danilo Krummrich <dakr@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Lyude Paul <lyude@redhat.com>, 
 Guangbo Cui <2407018371@qq.com>, Dirk Behme <dirk.behme@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=995; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=/UZpvRA67HxsywtAor/ry48Oc3HuQY3KQS+pRcQdRrc=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnoNvbIRaLV5P15ah2l0mZuN0T8cgdq5k0DuSHx
 vhYFx8u/UaJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ6Db2wAKCRDhuBo+eShj
 d0FWEACZNWgT+1stRqTEskc7X2kC6dNamvxQ38KC3RnEjrJBy7W/Q/WLzvh5TdAY2H49cI1Mdb+
 bl/gNUVcvjUHKdZkvIjqheetLj+WnMRFKD2A/wE/pfGkLeKgxLskErgnu8OWUtDPZ4fz0CURklU
 fjeWkj3b1enbxj8cMChuPqG9W+QcJxzZ9obIgujIqdKoP7hYgOqwUJco8Sz7xhltWVNO9dOQXoQ
 k1KRyJ0U8rDI4xUIawlsjgA5tSvDC1xnbEyFudiU9nZ19UCupLqlezVPx+dey1kLHupRkSNCj5g
 oBCCsf9OP4jmq5isV/c3u5k6MHG1YaFDBvD9r+Yk64QOwnVQoZR3TLpiJ3MTwpaVKcHeAkawh6d
 25n48tmIbAwdc5l46LaJKPF+4cZJBJ4OCoe6Y98h3VZ10VMsiTkt1cJj4mwkiCtIeItbzuqz/s6
 25mCQmdF1w6XZ+mmPPYUG01+KRX/RhZqLT7+CCy/VBQELtloGaGZ8/SKlFe6d0JIB0dvozM/+UY
 Zdu0ZpC9dpyy8bPkDgTwd4KZDxeDr6+t0UGsvQ79IyPAOk1Q3Saf5PcZB94f5zgxe4WtFVOdGoj
 sdNVArsuh9eN3VlPMhJhp3r0dTea2FtsYXg6OpCnpDnRzZoA4EptKyCWw1JEwocLsZdfVSsBH7Q
 HOxh0Rn8dsUe/6w==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add Andreas Hindborg as maintainer for Rust `hrtimer` abstractions. Also
add Boqun Feng as reviewer.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
Acked-by: Boqun Feng <boqun.feng@gmail.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa06545e2861abe46ea7029f9b4d3628e..60fa77c41b3fb22f859d330e3eaf2701bcda3b3f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10355,6 +10355,16 @@ F:	kernel/time/timer_list.c
 F:	kernel/time/timer_migration.*
 F:	tools/testing/selftests/timers/
 
+HIGH-RESOLUTION TIMERS [RUST]
+M:	Andreas Hindborg <a.hindborg@kernel.org>
+R:	Boqun Feng <boqun.feng@gmail.com>
+L:	rust-for-linux@vger.kernel.org
+S:	Supported
+W:	https://rust-for-linux.com
+B:	https://github.com/Rust-for-Linux/linux/issues
+F:	rust/kernel/time/hrtimer.rs
+F:	rust/kernel/time/hrtimer/
+
 HIGH-SPEED SCC DRIVER FOR AX.25
 L:	linux-hams@vger.kernel.org
 S:	Orphan

-- 
2.47.0


