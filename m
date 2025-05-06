Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD94298999
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 01:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746493458; cv=none; b=f93EsDCEeD5SlLNbH+QfXEcmAOisj0EdgrtOXTss6gOf9yVMoOg079/oZ6IQ0MpzYgBJEbxiAfASW1LSrXYpr3b+aw5T9ZWkEjcpgB1BnIj9/c3U1u0mK4pIgyHnSbfrHYy6GczqJRV0E4bnlVObQOJfgnHa4XR6cmlb1Csha28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746493458; c=relaxed/simple;
	bh=eA322ppsD+vY/QxxIIPgh2LsmFqa2swR4N1IgO7W+kQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=M2KmCBqR9e1MpCzqxvc36h4ZeeN9wCCLSDa+LpY3zxyEn+VeBE/WLMhDO0IfQdERjFZDkCHyALjh41JoHzEpYT6XLVbik2sDmQXQd/vWVqxfTaMO7CnEZqI4yCIhQy2JybBvdIdBzhAq+BnK1P3yjDuJHbfgcUMiAuOiyzSnem0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Cb30Maws; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cb30Maws"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-22e3b03cd64so1466005ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 18:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746493455; x=1747098255; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uuu4gy8/kO7TI9NeJUuJ8F7nLoDTInolVvMw03VZmFY=;
        b=Cb30Maws5KN+AYZmdh7T1EASQL1Ei4C7w0UF62KlzmB7J6E9wR4OZTFmH5zXA9QDWF
         474sbHWKJOK7GOc3l2fIK8RMA0fX17dD2xa1v8vkXzDF1kgddknnwBRQ+6tStdyxyotP
         u1z+6ZlfHfgRLyGkmC2eRjgVdlP1jCe5sViuSjKXOtb8uVZGaO7UjSr7soI06OjHJY3L
         943GazQBJKxR++k73WOWr+Q12wFtRuT5gYF6n8QsFPTk3SNBhAy5BF28LFRISmt4jwD+
         rQk6oe0oVzCPbFCgKzsTYxSOG9QwsNlxptv+IvU18WrZ5u24TVWbr4jB7a244yl/smk2
         ChLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746493455; x=1747098255;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uuu4gy8/kO7TI9NeJUuJ8F7nLoDTInolVvMw03VZmFY=;
        b=GM4sJfX9p0D4WLidrHVi7QFY3p4j3VZcA1j4Ah2v+x+hpbk9K+Ih6vGE+Qrvl5+4jn
         jrNdNMre0GwZUaZYEdWrrZu7Ggy5f29rtVgXXrQdWBMKAAgBamUYnq6w3cM6ipTKem2J
         1U1XKoa7rSwGCe8gj/z7hUbg1CrRL+6BcAuHhYvQUXcuOMFHhknwRnBObJSiwc02BT/t
         w3VcCXfP6gdI4zWLgYR/MBKIr4mmWiG3T9oOp9979gF0cHxseU8kGwn1JwyqCsaM2E6B
         siVGrbxpmCBhC7s1EctHxrhaO3I9KFlERJ0X+IaQDDQyQxAxOlAuHZ2tskVtn5mxTUvY
         x3bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdykK6Olm6VZbyTRO73cWiC1/BAgx9CPLuXTr8tM4+JnVCs2KsSsaG4F7Exj49TnWFuDpihGmN+QMIL8c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgoS3rzCGN94aCfqikv10KS3/PuLywp2OfvMl5PZ3vbRDk62Hm
	fH1z8uWVfx/tarj+ZgwZpUMHWHywgZMhjbzFXefad1LqIR5iun2p/lshnlVnde4net3leqtcxIE
	9J7U7sQ==
X-Google-Smtp-Source: AGHT+IE9AfJR9gBa3pS1z1J42jsjS2eEluabDUorQKOz591rLRv8UFbng0HxgIGbOGyFj5eNwjNbAHNkUGY3
X-Received: from plbjw7.prod.google.com ([2002:a17:903:2787:b0:22e:4263:f5c8])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1252:b0:220:c63b:d93c
 with SMTP id d9443c01a7336-22e363bb456mr14830275ad.44.1746493455488; Mon, 05
 May 2025 18:04:15 -0700 (PDT)
Date: Tue, 06 May 2025 01:04:12 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAxgGWgC/22PPW/DIBCG/4rFXCo+DNieumbr1qHKYI7DRkpCA
 9hqFfm/l7hRpUod3zvd89x7IxlTwEyG5kYSriGHeKlBPDUE5vEyIQ2uZiKYUEwxTh3aZfKZpiU
 XOpYywkyR69ZqAz1wTerlR0IfPnfqO3k7vJLjzzDhdamG8tj8Cqrvjm9F9xcvwSnoDVrj+LCqO
 9qOGSnE8zmUoZGSSWW1VlwZpTqhWitBcJCetb13RnRohNTd7p9DLjF97U1Xvj/wKCX/LbVyyqg DaVjHvfUWXqYYpxM+Vzs5btv2DRvOEnA8AQAA
X-Change-Id: 20250501-debugfs-rust-attach-e164b67c9c16
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746493453; l=1862;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=eA322ppsD+vY/QxxIIPgh2LsmFqa2swR4N1IgO7W+kQ=; b=hMcz9MYt2ukPs8EAoPesKGSGhSIsT0Dt4SpxFewgWlBpt4jMqHmtcFzLlk2Y1P+dDdG4aEq7p
 gBnCOBLnxvjC8Qoig3zWBpolx5UBxGw4YN3CKbOkwmBDyRMtPXlUKqO
X-Mailer: b4 0.14.2
Message-ID: <20250506-debugfs-rust-attach-v2-0-c6f88be3890a@google.com>
Subject: [PATCH WIP v2 0/2] rust: debugfs: Support attaching data to DebugFS directories
From: Matthew Maurer <mmaurer@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

We can wait to properly review and land this until after we've decided
on the final interface for the first part, but since dakr@kernel.org was
poking at how this might work in his review of the previous patchset, I
wanted to upload this sketch as context.

The general concept here is that you select an owning directory and
attach data to it while converting its lifetime to be invariant (e.g.
can't be shortened) so that you know that the DebugFS contents will be
cleaned up before the data. You can then implement things underneath
that directory using the attached data.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
Changes in v2:
- Rebased on top of new DebugFS bindings to make it easier to play with.
- Attachment model still hasn't changed as that's still being discussed.
  See: https://lore.kernel.org/all/CAGSQo03sHhUX-Eo31cMmeNMaNnzWxU0c-ObTkr7Z1CJ2uQ6c4g@mail.gmail.com/
- Link to v1: https://lore.kernel.org/r/20250503-debugfs-rust-attach-v1-0-dc37081fbfbc@google.com

---
Matthew Maurer (2):
      rust: debugfs: Add interface to build debugfs off pinned objects
      rust: debugfs: Extend sample to use attached data

 rust/kernel/debugfs.rs       | 218 +++++++++++++++++++++++++++++++++++++++++--
 samples/rust/rust_debugfs.rs | 110 +++++++++++++++++++++-
 2 files changed, 314 insertions(+), 14 deletions(-)
---
base-commit: 33035b665157558254b3c21c3f049fd728e72368
change-id: 20250501-debugfs-rust-attach-e164b67c9c16
prerequisite-change-id: 20250428-debugfs-rust-3cd5c97eb7d1:v5
prerequisite-patch-id: 1bc0f0d9ea12a4dfa986bd6b88863b0561d7e215
prerequisite-patch-id: 6338f30c269eb6ec314d3e4c0b9c2c0215f58325
prerequisite-patch-id: 862adaf3d9fbc860a8eb23bf8779c4b299c0149e
prerequisite-patch-id: 0198767a9410d24382e72ca9cf1e3d205deb4fd3

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>

