Received: from mail-yw1-f225.google.com (mail-yw1-f225.google.com [209.85.128.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5721FDE19
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 19:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747769624; cv=none; b=f39y755ZZ8R0mNBNy/vcIBFTl56wkbenXmJdTu9KcAXZtWt6fuFc/I8our16nSzjUSAiG3cIvFRNKf+Ydlszu35rLyDH3tbiBaxtEG/TawTg2Qop3D6nSBM4krXNToMRwTPijAn75cS9whioH8jW31308vfuY9RPZSYDaLbpCOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747769624; c=relaxed/simple;
	bh=l+qROxyg0ykG2Mdiot91acNqc4DuZpFYb+lXFeYrL9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t3DlaRMCmAubvJqabV4DE9GU8RO6W7w/ij7Dtr6yaTI10AvoZiE38ZwxhDCgwCX6gw6B/Ga7nXJ+Lx5JIOLhNuY7JLYAMbKgghr88eMfmxGS3xz1fAuRl4xgP4iOPv3OIX0svDzJKsfsfHi3GChrQsg249QTwubfwKNJ+x3od9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=ZaJpf29t; arc=none smtp.client-ip=209.85.128.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="ZaJpf29t"
Received: by mail-yw1-f225.google.com with SMTP id 00721157ae682-70c9fabeffdso4164047b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 12:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1747769621; x=1748374421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6mWsxB/jvz+1DvjRqofhZH3x2dukYd3c9R9FoQWshso=;
        b=ZaJpf29tnEy0P00YIglsr/wr2nAuEipKt0gvk3ukCjM9A7vt9qFHFjfFFiPcbbOI/r
         GjpHVEU4zQ8vwDTLkiNBHq54+C8gzgavHeBF2R2AfivdWt5keJXr+kdkI489AVt5UXeq
         hxFD/CmYazLpQDoFBa2XPbHF0CSctuBIzK8zvv1chxXHXq3sQfNiCO0RrWppXEmM8gjo
         MhKO8SzeaoK+fr5QQLU5x2RpsVsxJccfHQDBpWaLCVEKYLcRjBOA4DsKj8EogEwbCWYm
         iXzVtDFlEwIGHnmSZkzdPck6pscr2Y9XSvo4Pxnk54dWEGNPOjwKn/Y3Nma7hhVWpLS+
         b99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747769621; x=1748374421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6mWsxB/jvz+1DvjRqofhZH3x2dukYd3c9R9FoQWshso=;
        b=OEMNJfluyz+3rlA5JZI8DMhRE1f4U9jlG+uaeZlnxLaixQZAeCHqmSedOfp9ZpfKAt
         IDrkwm0JR8czTVqrhgU2OTRbbj5c8GTcPgw2DzfAEYiL634HjbI4LsFvSoQl90uh61V2
         Asmfb2+6GcBVsZkGvhJBQFbeyoBvzVb1NCd66kPsH1xtfX2N4li+gz2WE4QvRKiM1C6z
         yCiPsibpJ1EBA26SRTS/d2NS+C9Sshd2yEkk/YtQMblIHymm98ZRC1HOeKrasy3dHE2r
         DSjIa5FtxPR/ilB9t54dvMYp/vLuDpju4beaTOEPwBc+eQXx60X48ddsiudTV3i4o9GR
         jCyw==
X-Forwarded-Encrypted: i=1; AJvYcCXaLZvyz5ddhOzY3s2FhKQB6jo3GqOOQIAb2/bfQIa1iXN3Fb166oOO0DewH6sz7zh9GTbMYhEYDFfrAYA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL0RXfeJ5z8q2hPjWQWxWllSaIPZAlPM6gxGQBiNoTXaNUnpTT
	60d6hDw9Dux9aBnbaPICbIxIs26g85ukMoDlPWv+DZ6apShHE0NfouVW19icXOnXjHCCPg6QsO7
	3siEdSyAAgdWn9JZGgQSKbhRnnbJCkYSM3JIOYXBFNXF8syiPj3z4
X-Gm-Gg: ASbGnctSBDkwlJDM7ZK0zGEJO+mhOLIU58X1iZ8xKe2e7FafyoyEo3m5UAiBTBA8m2A
	UvRfki0uZJn7NJktOfIE4Y/jhJLdk1T8KhaFvKK/dwiZ8I5hRq+yUtKh/YWIVRZquxveiSPNTJt
	NSpndJxk/AimwYk15RnbacoVukl3dhknOqIsKIvmrnJkW9KV9rv3KE96uuEcdJZnoRtKviW8ibh
	QZ144bqo5aa+gIVnGcPXpBOtkaQqw+PIz7tBLFDwckguLlD2jKHDDCTles+rTt78GUAob7GwNND
	FjXTksuC0A3UUKbyrN4iKQpgJmnJlw==
X-Google-Smtp-Source: AGHT+IEUva7c4rpdUdj0LTfCEBCJ0Q+y2yyHuXGIJcNMe/w5WuNfZ6Q+mBZ5Es7cTzaGxsdJNmpHcyG2e6Ch
X-Received: by 2002:a05:690c:74c8:b0:706:cc3d:61ef with SMTP id 00721157ae682-70ca7be358emr131945217b3.8.1747769620584;
        Tue, 20 May 2025 12:33:40 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-70ca84bee70sm1876407b3.52.2025.05.20.12.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:33:40 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (unknown [IPv6:2620:125:9007:640:ffff::418a])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id F1119340441;
	Tue, 20 May 2025 13:33:39 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id E3389E41C7B; Tue, 20 May 2025 13:33:39 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>,
	Pavel Begunkov <asml.silence@gmail.com>
Cc: Caleb Sander Mateos <csander@purestorage.com>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] io_uring/cmd: axe duplicate io_uring_cmd_import_fixed_vec() declaration
Date: Tue, 20 May 2025 13:33:36 -0600
Message-ID: <20250520193337.1374509-1-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

io_uring_cmd_import_fixed_vec() is declared in both
include/linux/io_uring/cmd.h and io_uring/uring_cmd.h. The declarations
are identical (if redundant) for CONFIG_IO_URING=y. But if
CONFIG_IO_URING=N, include/linux/io_uring/cmd.h declares the function as
static inline while io_uring/uring_cmd.h declares it as extern. This
causes linker errors if the declaration in io_uring/uring_cmd.h is used.

Remove the declaration in io_uring/uring_cmd.h to avoid linker errors
and prevent the declarations getting out of sync.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
Fixes: ef4902752972 ("io_uring/cmd: introduce io_uring_cmd_import_fixed_vec")
---
 io_uring/uring_cmd.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/io_uring/uring_cmd.h b/io_uring/uring_cmd.h
index b04686b6b5d2..e6a5142c890e 100644
--- a/io_uring/uring_cmd.h
+++ b/io_uring/uring_cmd.h
@@ -15,11 +15,5 @@ void io_uring_cmd_cleanup(struct io_kiocb *req);
 
 bool io_uring_try_cancel_uring_cmd(struct io_ring_ctx *ctx,
 				   struct io_uring_task *tctx, bool cancel_all);
 
 void io_cmd_cache_free(const void *entry);
-
-int io_uring_cmd_import_fixed_vec(struct io_uring_cmd *ioucmd,
-				  const struct iovec __user *uvec,
-				  size_t uvec_segs,
-				  int ddir, struct iov_iter *iter,
-				  unsigned issue_flags);
-- 
2.45.2

