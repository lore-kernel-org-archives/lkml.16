Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01991239E95;
	Thu,  8 May 2025 08:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746694372; cv=none; b=Q75JjVRER5R/UFOf8TEs0LxnrUulp+rcAlpEJooLXf3zMZfn2pV1Q7K4qFl//DxRbq4dNPz/ilgQh4+oTzGJRerEDiTHRW6LY/VvzmUB4NUa4X/uHBGkCfKKdTIv3uXO/uM0zwoure30bAkN4IHWm7+rXoLnHGzUkFdFyfg6j1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746694372; c=relaxed/simple;
	bh=znt+9wtzzRAcAOqqt9JwNgOU5Ajvi3gapCMlcDgxZ1U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PPUKoe4A2Ewi0gjcgItAKrTuG1pU9VX/HJ/DSKPsuTBlSyV9DM8i1VOSRVKbkQX7nKsEHm8VgrfRTiiJognFIRdTBMBvJcl1KUGqINRhwfQqZbMt4jgOfRWI6QobB1ttHJImd50C56PfXRToKXU5oOY8lT2xEWCDSL1SXfbdS9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IKQSi/RW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IKQSi/RW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6C16C4CEEB;
	Thu,  8 May 2025 08:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746694371;
	bh=znt+9wtzzRAcAOqqt9JwNgOU5Ajvi3gapCMlcDgxZ1U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IKQSi/RWEXCNhb6G1V7+tfTHmK14VNAZP6kpeR82wdGTqn8Zc0VK1BU06s6t8ajUR
	 boT3hXSu3ZHKqwxy6DoF9Ogno40s5H/d70gHNvFyqVBhl83Bev8ycm20yjmuFtrkVA
	 ZeMf41S31jJQr1Ne/NnJdCGROsyU/QJol1vqmesoHdy4zikDCkcXHHCqswhJUKq29F
	 7ZyjyonooSqD2D+F+NYKQ7W0Nd6ldmiVlcSKAoB4I+3CDZlbjRrQ8tyCOdp0YHxbj1
	 9b/jPzomAbEgH5oIozwALyliGbnFOwBBG/FgF0i6AF0cvdKvzuj6I+JfqsUBztDQw5
	 2AN1FyWXrSZuw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 08 May 2025 10:52:11 +0200
Subject: [PATCH v8 3/3] MAINTAINERS: add configfs Rust abstractions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-configfs-v8-3-8ebde6180edc@kernel.org>
References: <20250508-configfs-v8-0-8ebde6180edc@kernel.org>
In-Reply-To: <20250508-configfs-v8-0-8ebde6180edc@kernel.org>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=710; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=znt+9wtzzRAcAOqqt9JwNgOU5Ajvi3gapCMlcDgxZ1U=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoHHDLcHwWDmgp1BsPK3/vcBdMMl7ofZKYVNOQg
 GtiaUzXpbuJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaBxwywAKCRDhuBo+eShj
 d2VZEAC4BrY+NlOiyYVhM+jOYNC097mS697letHGY2EqWh9lrIwGRwA3CiICUag2ndkYzM1w8Nn
 ThqTHMnJEvFW3g6Jav7UG7LL3VlGyoOuY6IzE6UgQDQ3kg3mzHHzSJmtK7Xg7gKU6y1ojWayvOY
 wdYFiuYVBDqOzLZ7/BSo96xmactGjWwauODkZTF6qV0D2hZ0yPscPpJnad/7Ld2+lYAnO8ZquuD
 Bjj8ZToxV/O65PGazzOr6y3vZ3tLjMJetZWxeBZzU4uhPHoSV4g9ZwG/YNCnWGLY2bzQzJ47cyO
 IEHy2PSWYwlO0eMO8Qf4MXcYyR3DuibRagdpmQ7MZ1viu/qRqolyq9Xz9bwOUuxVFiducoFuT3s
 SR3Vj+ApduAp5L9lLxQVHkq7eZxCBf2IyhtbfobWmx2Hy25Ex5gfeTf9OK61d0u3MJOXLHdXYVc
 OiD42fbu7TcHhHvO281co9BrZKHsO6GuVBQ6cAmKzZ6TzqVL1u2oUy3+d55sKasmGY6h4KIh7NT
 JtvMsl3MS8Bk1bZqihGQAJKpYHOw8Ywf4NjVuTt3q2qC/Weh29gTvGNFRkSHxjCpR2IbMd23t19
 pfToa8vniza1oA4U9DH8fsfuxHdhDGpOrnH1cOoBcn39W5FNFVFc4s8zPjEQUWES3tOeN1IppxY
 rOfQzOb+KxMOO/w==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add rust files to configfs MAINTAINERS entry.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3cbf9ac0d83f619ef873833b26a3aa3f29ff4161..5ccf04e1eb1fd02e7906e94cb5b0acd49e334d98 100644
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


