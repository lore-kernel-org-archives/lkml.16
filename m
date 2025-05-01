Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8009E2DC79C;
	Thu,  1 May 2025 10:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746094526; cv=none; b=XPb/yr7gPBJR1MyUMAt3I6os9jxG+b9fjFnD5Q1k3LhdqbP2GMHOjqu47QUFeSYQ5OEo8nRwzdVqVr+09a58xdEabXI3XsYf/Q4O+A96JB83i9Jx6669vDOrfOqHa8WIRfZtjXVTheZZkQaD9dSyYlyoyIIIv4cF9QmMHs4lOSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746094526; c=relaxed/simple;
	bh=PhC7U//AGQaUkDe55c7xf5xv4Nn5WDixBpxtADKFSkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=piSizI789hJHYaUmFncHXurabQ1gj1vHLfkmF/BIeWT0Fwu6+lQuPWhGN3ptosh1bIQxpb7kNLhjz1QC92JKSk8lp+IymByxKCuIo4pW+Y3SHG+uFxq51h+B82Fh95FZGYMzoZ6dpRUnN1I2R3X1GYGButfuMp42eqxLmp3G2Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pS+riKNr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pS+riKNr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38C42C4CEE3;
	Thu,  1 May 2025 10:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746094525;
	bh=PhC7U//AGQaUkDe55c7xf5xv4Nn5WDixBpxtADKFSkw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pS+riKNr4eokcfYl9QR9UTjzBqBjA2jxAOkKquZ2JE3nKtUgyUAmdiG95l8TT9mz1
	 mtJS0816spEeHQVYMM4LadC61lnO+bRrzScLZiHObFsWHNw9C71sJYs/uYzCxlqtMS
	 /xk/rmZpUjDBBjUNlRBFHS8gkMKsRsaHQGtTgUGXHtE3kIe9VnBIVdAZCLu+VoOMzc
	 XsFFEORTRtydc4Go8u8CZKmUAgRHjjK8L77OKPhZb/B9nnREgm3vF03SMq0nIOZwmm
	 TFpqKeH8xOXC0opyv/QbpjlLGwBgh8DKMDHa7AjOKJIP4O3Oqdsc5j7ZIbEXX1pfDG
	 iWIbbyks2RU4g==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 01 May 2025 12:14:38 +0200
Subject: [PATCH v6 3/3] MAINTAINERS: add configfs Rust abstractions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-configfs-v6-3-66c61eb76368@kernel.org>
References: <20250501-configfs-v6-0-66c61eb76368@kernel.org>
In-Reply-To: <20250501-configfs-v6-0-66c61eb76368@kernel.org>
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
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoE0mphOddEimx4d/e9niYNlL7yS6CPhCaRdk0G
 /oI1Y2G9B2JAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaBNJqQAKCRDhuBo+eShj
 dytZD/9dRc5/9yJ/+7TbXE2VIBznBBeL0fCxAnX6J4NesB7qAdU0pQi8SMFBbsc4l0oSfHifRpF
 8WPkpKTsNeMDoFLr61FvAvrhugJMv6X4DgPGqN1Mll8wDNFI1nu9tX79+fp/IRpRlzSao3NhkjV
 p0/1xWsAlDqF3opn7bkM3Bqc8IpJqRtSh+yo8ig1DXYG2tf0xqoNyDN+rC+4rcRumI9dvh7RaJ9
 tR5YmpqzmHzK3rhaSjYaScptN8WXKG5SXKOirGouYAl1vUAyYmLOHlwCxVZg3BQSjzeCpjOh+BE
 FjNAOM2u/9nV1H10eCSEgxr/I1NcOZApaFb75gTbywZc4xuOOU7MYk+HPVzSKZvg8xsxDJkl3tX
 4bkT1HOtyk8/TffD6CO0r2VLw4VnfMoe1v43fh02VwrDyCNpp2pyLgT0/dGCa2Zju6LpE49uHyw
 y2CQaRkrygUZS8GKuN/YqdMwXNAoi5khkaxDw/fx3hb0zFN3fAv6fEzSVW6Oix5dWahTw5Z8JbC
 gh46vm4TO8hw9pBRggcL5EW21utFOvc4S1VW5Oj7QPEji4DtDEpAgcyaO8a0gY1KLlxkUtpc8Zg
 FPaI4OYqp95CxEWc/T/5acddprmdKiMklgXOeiC2Rc0SbOs2ZTMF9EnZMSRVnooXk4I7sfwJJ8S
 goySpayU5zGXsqw==
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


