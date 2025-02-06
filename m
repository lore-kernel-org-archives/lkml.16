Received: from poodle.tulip.relay.mailchannels.net (poodle.tulip.relay.mailchannels.net [23.83.218.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8288E19E7E2;
	Thu,  6 Feb 2025 21:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.249
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738878360; cv=pass; b=RVavOBnVvi11jTRzkPGkypaITCtnlm8T1m0KCd82MociNFEX+FjQsiKd0c5ougfGwjJqU3s3hAf7fW4r2I+cghcWf72ijhIAlQPMkcadOCkuH7RolZnMa04uYtBzRs7qPO6DL/6uNJloKDI1UolEfLnRBwIOq64zygZEl57rhFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738878360; c=relaxed/simple;
	bh=pYXeZWRk42/ZKJn9nfzSEfSPAS+Qq+7Hbo3m4foI6m4=;
	h=From:Subject:Message-Id:MIME-Version:Content-Type:To:Cc:Date; b=C62qhcs/o7L5L3E6Ty+OiTwRjUL52j6iBZ2pdK6pDCXoYyHCk3B5vwKvlBXtQRNFbgT8xvBY2e0Aqhq8dZuBgykGk6MugVmhD2bgtf/nqxCx2SVLHMslkbugzSnajEZrqVQNvt6aWEd64ykI92D0XYiadBAx/zpge8qTwngDr3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invicto.ai; spf=pass smtp.mailfrom=invicto.ai; dkim=fail (0-bit key) header.d=invicto.ai header.i=@invicto.ai header.b=KsefuRaK reason="key not found in DNS"; arc=pass smtp.client-ip=23.83.218.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invicto.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invicto.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=invicto.ai header.i=@invicto.ai header.b="KsefuRaK"
X-Sender-Id: hostingeremail|x-authuser|kurti@invicto.ai
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id B28CC8445D0;
	Thu,  6 Feb 2025 21:07:58 +0000 (UTC)
Received: from fr-int-smtpout8.hostinger.io (trex-6.trex.outbound.svc.cluster.local [100.127.158.245])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id E9F8284377B;
	Thu,  6 Feb 2025 21:07:53 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1738876078; a=rsa-sha256;
	cv=none;
	b=KYB+F9RvFcbnpUPd3PbMy2sIiJTtsPnt+COOSNOn3MAQzk+KIbZCGa4x3RWpDho3RjSyl+
	o6NoytryPxaxqW6uCkXxiF2dMoWdaR/qV5QCum0ssq9cQxn9y0eckPrdJ/NboVQ7rSUvap
	u4xnsaM81JRdrrBiD5EE0vjxrM1RIW+euE8f2nLCyyBMXRL1+fX+n4EUDxw2M1s9LbW7lv
	bL2CsigGkga+YQNqHVddUm8WEB57GJFMcXi+2bh5kKePr7w7vAhZSm0lLeuT15KKFeez9J
	tHEy02JmERDYynIHKn4PQ8zbnksYrU2kwIY9JFxtvj5T5DZFmkLTAD2SpjdX5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1738876078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=Z/WUVlRe4tP/MfzqUsTxDtSPEpFNCz05VpHyl8nQi+c=;
	b=h2cYPkU+azmpKg5OkLe1ZA8i4CdoaAiAYcV6NrP1kSSlB9ZFe/SaBx7otW8avmLweYPnL/
	L4lbRszwqwNFaq76vPqfVbwNHm7ytowIUgERKbH4hamJVVuEKmRM+76aPHYQu+20iooUAX
	o3zCnHyR5eEyWb1iIYvQyh5U9pyYg2PUMG0Ilio6TsP5TwcMwZpImgVCI9cGEWEz2j+d7u
	B+GJV8qFzVfDK0/xWipcutkoo/turNf5+OaRkOzVATXYXQBPuHfFmRFgXAhN3BwVcup6JA
	vIeEYtk+WYJYLcE19ySexxWs9joo2X3BfEzeaeY8f3/+Euvs9Eirwd0IbtEARw==
ARC-Authentication-Results: i=1;
	rspamd-8586946c78-9pdp9;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=kurti@invicto.ai
X-Sender-Id: hostingeremail|x-authuser|kurti@invicto.ai
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|kurti@invicto.ai
X-MailChannels-Auth-Id: hostingeremail
X-Continue-Versed: 02e721ef73e41276_1738876078403_1443058005
X-MC-Loop-Signature: 1738876078403:2730700952
X-MC-Ingress-Time: 1738876078402
Received: from fr-int-smtpout8.hostinger.io (fr-int-smtpout8.hostinger.io
 [89.116.146.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.127.158.245 (trex/7.0.2);
	Thu, 06 Feb 2025 21:07:58 +0000
From: Alban Kurti <kurti@invicto.ai>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=invicto.ai;
	s=hostingermail-a; t=1738876072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Z/WUVlRe4tP/MfzqUsTxDtSPEpFNCz05VpHyl8nQi+c=;
	b=KsefuRaKOViSVbjPF9zt29fFXM9I3vU5ccIWt+h/2WWP7TDZNBig+0H17FWV90haTKIwXi
	knPg+sr2BewCax0zrQdQMAD7wAXrN+h2skvhJGLfk7o8VXP1ZtrSSVPtT0KpekMVA/byGq
	FiziCDlforIPLb5pFyG6opdJQnMub8zGpg+za9FMvmnLeFLmdGd2mRtd50w0eYfSp2nBTH
	ZTqL87pCRKWVjZfPx0627gyEPJAUA3MsFSgdPJouA6ZtlsQFPFuIDUTBDy8s1Y5dge/6Et
	xjRBWh1xr8/PaGbRs9kzsi980m5N/1oMN2WJpgtEZw02DSYsrKa8dY1L7u43UQ==
Subject: [PATCH v3 0/6] rust: treewide: add missing newlines to printing
 calls
Message-Id: <20250206-printing_fix-v3-0-a85273b501ae@invicto.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJMkpWcC/x2MQQqAIBAAvxJ7TlgME/tKRJhtthcTjQjEvycdZ
 2CmQKbElGHqCiR6OPMVGgx9B+60wZPgvTFIlAoljiImDjcHvx78CtJWG4WbIe2gJTFR0/9uXmr
 9AAeZNcVeAAAA
X-Change-ID: 20250206-printing_fix-e7a7950b9e7c
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>, 
 David Gow <davidgow@google.com>, Dirk Behme <dirk.behme@de.bosch.com>, 
 Asahi Lina <lina@asahilina.net>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
 Wedson Almeida Filho <walmeida@microsoft.com>, 
 "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>, Tejun Heo <tj@kernel.org>, 
 Fiona Behrens <me@kloenk.dev>, 
 Vincenzo Palazzo <vincenzopalazzodev@gmail.com>, 
 Xiangfei Ding <dingxiangfei2009@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alban Kurti <kurti@invicto.ai>, 
 Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
 Fox Chen <foxhlchen@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738876070; l=1426;
 i=kurti@invicto.ai; s=20250206; h=from:subject:message-id;
 bh=pYXeZWRk42/ZKJn9nfzSEfSPAS+Qq+7Hbo3m4foI6m4=;
 b=4xSpkYbl9+VsWvFsZY9w0iM7VQ2qHwb/a9rw7Pwy1oWgOfnj6pgBZOsaRONP4mY4a6xyE/OqC
 0JGrPEsJ3+rDcpdJfiQAXyCpzl097hCFRIDoWRTZpgcMV0I8DCXKijc
X-Developer-Key: i=kurti@invicto.ai; a=ed25519;
 pk=D1lKs+JFapuEVI9zJ2QUTLSf5u4aT12tG0ny6vMMuOc=
Date: Thu, 06 Feb 2025 21:07:50 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=PMNd+uqC c=1 sm=1 tr=0 ts=67a524a8 a=9/DLicljd4JGVkZ5BRdAJQ==:117 a=9/DLicljd4JGVkZ5BRdAJQ==:17 a=IkcTkHD0fZMA:10 a=WWgaao6JuW3fq2SmxSwA:9 a=QEXdDO2ut3YA:10
X-CM-Envelope: MS4xfKFr1Vl6mjl7LLCK5YBRZtlYnG6DnCEKo5NQc9u2omKjY/AMU3pgTyrXtU1dQ5imhPpe6xqFw/nSy3TjZvmMjGRBpM5WSL0nmalchdTqjcFxQ03KrEjL KUf9R8pOhCZgj6bw2mqTcKjNqzBQUfS3QaSIZ61Ivly1L3E0jKeSnvRC09eMA/Z6NXZQ1i/VFxMTN/vlUIhpqRPRvzty21rus78gdn7CXkUWvU6WDgSZm40E LGKHbvAm4rsFeazNrH/Bn+RUS4cCZ3CBDZjCMGvaOR+R0L7vOaOcWbHGq4bWGQLgeebhTheXm0FmfQfhlHlEXzn3uB11/MB/kWqtcLcai9D5m01w6JhFZOtL z7y/ldu6fk4rk9aLMW2wLQ6XpOe9e7glUijKa8RNItCPECE3I1tk1FJZs5KSIAUwNJxjdnCTQ0z4dtYlwDoMFzH7F+vbwcTMbo3kI8aEvy2hCRC3VLL39KZm nCZwxHziWtwXeY/68OuzVxVvMHSTA71qdy2eSjKQBGXEgis/nIAiVgVz7Bi9B/sEuXq2RhZPZsSC/mybkKMrzJX1v1c/oZ1IiUWC5JHGd+xmUaGG6IEhNBHn cvTtr3Ooj/gr6+/ueMBGDmRzJFYTTkIuKqO+z+UToyoG0uBgw2b/vDJ1SCjNV5dMTb0g0BhuEQh0fTrt2fK1tODucMdNct/pTfpnTuunQxxcVwRctmDjcVT4 ad96oSWpMsd1bOXyZbIwiHH1jMiZCzL1Vs/H6TqBlzE5mmbs31qxNlYftst4EQtFkDc3Gvx4feBaCeFnBcaSvai2u3ZWABwL0Gt/tVgSw1s5H/Y0jBFamEV7 uxhca7F1aar4LqjUUM4Eie6969Y4vmpX+7SXWkQpOUi0ZpHGjHx5fM6JgbYzKi7LcIs1vBWaDALHuwuC0cPfxUXG4npUIYV4A0BufUKMYGY5/wIkHBFuwFSX UuAYax6SW4LQuNw
 YfBmec6fDIHT1WJ1bOGhxWF1rWnSIbvKL
X-AuthUser: kurti@invicto.ai

Adding newline at the end of all Rust pr_* and dev_* macro
calls that miss a newline.
`pr_*!` and `dev_*!` macros are supposed to be called
with a newline at the end, just like in the C side
such that independent lines are not visually missed.
There were no dev_*! cases with a missing newline found.

Signed-off-by: Alban Kurti <kurti@invicto.ai>
---
Changes in v3:
- Same code changes to v2, but split patches into multiple patches
  and improved the descriptions

---
Alban Kurti (6):
      rust: docs: add missing newline to printing macro examples
      rust: error: add missing newline to pr_warn! calls
      rust: init: add missing newline to pr_info! calls
      rust: sync: add missing newline in locked_by log example
      rust: workqueue: add missing newline to pr_info! examples
      rust: samples: add missing newline to pr_info! calls in rust_print_main

 Documentation/rust/testing.rst  |  2 +-
 rust/kernel/error.rs            |  2 +-
 rust/kernel/init.rs             | 12 ++++++------
 rust/kernel/init/macros.rs      |  6 +++---
 rust/kernel/sync/locked_by.rs   |  2 +-
 rust/kernel/workqueue.rs        |  6 +++---
 samples/rust/rust_print_main.rs |  8 ++++----
 7 files changed, 19 insertions(+), 19 deletions(-)
---
base-commit: ceff0757f5dafb5be5205988171809c877b1d3e3
change-id: 20250206-printing_fix-e7a7950b9e7c

Best regards,
-- 
Alban Kurti <kurti@invicto.ai>

