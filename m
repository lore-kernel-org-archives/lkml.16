Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0EA2500D0;
	Mon,  5 May 2025 12:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746447451; cv=none; b=ge2Sb43vJlNDuTTbtnacKTUykfWVn1632kemOfDU4ZHLz3P7CmZcXAMOESsJmzZ9XQeOtMUPN0CsSgkNPWFyfiBl/UTJxP5WNdw3zXWqwPOG0xT9Vk4P1DtMmlPn5LNPFoCtrKzUbrIMV5CZD6Z/XDMbo8nEAuzigwtRaKVAcqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746447451; c=relaxed/simple;
	bh=PhC7U//AGQaUkDe55c7xf5xv4Nn5WDixBpxtADKFSkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QpRzcASNLvbSEmsdMZ6BPLn1fhDUKWtXIJnQ2Cjw61avwmM5W7aKW++PFIY5FjebH2+mgqN63UMEMmDQMNMHehMDsCC6eSVQIYEdhuydyUcNU9sH6Rp0+mPQ65U0jU7mLbh5tzHE7vX7+RP/4Mwlxf/SQPW4B50RE4uErEuBjdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EwHPuy80; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EwHPuy80"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 674ECC4CEF1;
	Mon,  5 May 2025 12:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746447450;
	bh=PhC7U//AGQaUkDe55c7xf5xv4Nn5WDixBpxtADKFSkw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EwHPuy80ByDi6txh1seQTlGM/Q+N4f9dmwTzrAV6iO0pvI7xlvj2WssjWSX+G85nZ
	 Fop+dctME8TPVRbNHonpjUhTsAiSnWMbsd8O0dHAZb+qr0Z4q2ohSmAIHnf7xQQMCo
	 DOOkTjnm7mWSnQq4/zVjmjVd+pZK6VE0h42E5o0drqhgF4QFXuNgjCNHl4wRsQQGJ9
	 OO4O3jR4svzsPBjY/I7NyzUIfcmjh+nyIv6dwvvqNu1zO6N9OEj8P1zIpqtFziKOBC
	 oU2pKkNItFzsx9YOOvDPvqmmm7PbhWYjytj7O25VcdFviYgZFC7q2Rt9D3Qycd5Vdp
	 u/m8pwy4Mnd7Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Mon, 05 May 2025 14:16:58 +0200
Subject: [PATCH v7 3/3] MAINTAINERS: add configfs Rust abstractions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-configfs-v7-3-8bcf47c1fb88@kernel.org>
References: <20250505-configfs-v7-0-8bcf47c1fb88@kernel.org>
In-Reply-To: <20250505-configfs-v7-0-8bcf47c1fb88@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Joel Becker <jlbec@evilplan.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Fiona Behrens <me@kloenk.dev>, 
 Charalampos Mitrodimas <charmitro@posteo.net>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Breno Leitao <leitao@debian.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=654; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=PhC7U//AGQaUkDe55c7xf5xv4Nn5WDixBpxtADKFSkw=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoGKxFQwFNF7iXrSZ02d9MnhwfRXA385K6dn+5B
 zEndN8rE2WJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaBisRQAKCRDhuBo+eShj
 d2nUD/43pTA48DaF3RNfAKOQ+PEvyGuiGJXJFjaE0Og7uK7gX3yrDuJTSVkR/Gv1ZVO4Ayzzm2w
 jkHPwFg+eU0ke9qXFqF4pOb7aMXRNaKAhKjSLyQDukh+ntWsPozNamgYkYPhJX5qUkKmX/ir36j
 BLxzB5gW7SGaxn6S8GqMrcvlThiv3fi+3Mr1CneWFR9dC5dDLFv6lM7kJ5fXXB2ZOOISUyVMvKs
 kcvXn+5/UxArc/f7XtpOgkLet6U2ZM3xioIc8otmhLQ4SDF1jXRXp+xHN3VSNzIcNlNO656JKIN
 bzhq+dVGusU8qiyuxb5HxJp6ffQpcQpI0G+YPlw+abByFqaQojrsR681Q8vKbVz9TahWHAF/4UM
 JBobjKKRbfGYm+C/KPi5hOMHup8APTVTyXew9IDaqZEc/uHZ0uKKpNYh5oLiuWvAfCEkfEqYkvM
 GwnBp3UmbzmeV/gAqTIabLfFriplGgNIGM8c6zmefjx6zKYRgzfHQ8uVaCKnGKxO4iyvVHlBHkb
 w4nZKlN+jKy/qmLGkKGNupgCQ0fB7ryq1tHxNYHLLcGWom1GDO0Fo5M2/Qy2GyD4EvlZOrGMXDz
 3ECLqEjWlBxcEbWw5e/R2cD5/zlmnqZWjvtghboKADqAyxKG8VAy+doCKGLxHfiCugCrVXLiqSA
 7HcXrCoyDgi2PBw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add rust files to configfs MAINTAINERS entry.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3cbf9ac0d83f..5ccf04e1eb1f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5982,7 +5982,9 @@ S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/a.hindborg/linux.git configfs-next
 F:	fs/configfs/
 F:	include/linux/configfs.h
+F:	rust/kernel/configfs.rs
 F:	samples/configfs/
+F:	samples/rust/rust_configfs.rs
 
 CONGATEC BOARD CONTROLLER MFD DRIVER
 M:	Thomas Richard <thomas.richard@bootlin.com>

-- 
2.47.2


