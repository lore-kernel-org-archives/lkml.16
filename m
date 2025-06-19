Received: from mail-qt1-f228.google.com (mail-qt1-f228.google.com [209.85.160.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F376B2451C8
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 19:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750361281; cv=none; b=XFVxJ2/dVJkO17Aim58Nigh+LDXMM70CYytzd2LLq87Z05M7yEsnW22C9lAzGsH+HR0CIdrqHnmiEBPm/47nJnAk2TnsHHZKTYWfRiyiuxUjDxVLHMkwKWHWsVbqhO9DCuyD5HGiB5WAYtHkvsVIYFZxxCvgkNqXTLG1oYPm4zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750361281; c=relaxed/simple;
	bh=7hNsEhABE0MDxTWghxo/fSZvRqPJ7Q0SQ5s7b9NdLn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dMX/tk3S6JZAt+asVhFW0GLCKxHTgLsPnHPwCARXD+MYxeydlZwaDyRJuUYo/Ql5S0Npgtu9etmQy7d0Fe7tNwH/0DrEULca/PcAdbqByVS4BwLWNKTeNc4Pya6f6UFelMFYH75pKCp/Wi2WNMFfZ6abHpHtkqFaFeZIoYVtEAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=e2b/efYD; arc=none smtp.client-ip=209.85.160.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="e2b/efYD"
Received: by mail-qt1-f228.google.com with SMTP id d75a77b69052e-47745b4b9aaso1211651cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1750361278; x=1750966078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sL/gnD+RoXyhkM+7is5bQz7YiFPCrbWYEFKrkuC7LHU=;
        b=e2b/efYDRBZyc9OlMjY3ceghHYSrNX2WOvBeiFN5gV0gBxeFRToOmbD5ufcp/d9/TV
         9QahCsh0Fm1XJhyLYrj2por/u/V2lfbjtxw4Zp+0agUFCdn6Qffusmho0FBduO/5lyAN
         /UfsU5N0JmNUPJJERhAACR3pCZhdMh0g7/ZdNzeIgoBUr3uJQkliQVI7m7kAk0U0NpA0
         ef88hXzzgkorLbc415WY7m3EfayI7bm5HoSmEczwQ9Mbnk7RG4Itq4J66JuXfPEa6EzU
         d5tGdy5LCTrO3XliKIYCm+9TtKgmyXFBOxQLn76kR4iP24OQogvKN8h2zwa/qV/40KZ9
         7RbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750361278; x=1750966078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sL/gnD+RoXyhkM+7is5bQz7YiFPCrbWYEFKrkuC7LHU=;
        b=b3jL+FwVhDOWDzlyz+xHxZcsaQOpwF+stV8MwHjsrOTYAMFEE6TCG7FMZ/13TukRzE
         0uhqsRAwT5bPzL/QCqYDzC0WBuMYsxi1zlMtGkywrMF7rqKiuCwXiN0XXAM/z7iE4ZVq
         d6Jt2bKq/CzdU+cXBAAE+yRFRJIsq8E/jZTSOqUFplMcdoD42ziagEoEQOgydXpv+3KW
         WmuU7ZNgGVrTkNsmD69wbIG0wbb3ZZh11/nKmgYWVlR93/olNLCCpVawuFSb1leMavTX
         Nbtw03jq/KN7jrbt20gI29imD9uPf3W7aW3HlZ5bJ8CYv1KN7PxVd0IO/uCWjM4gY8Of
         E9XQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4na5b1oKo40FM4DELhBlqbS491YupkonzvhkCWi9akkjNO60x4ykHbZNmANUFwaJcNxuxV5kb1fBwthE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPecXNjsPqt4EF2A1EbF/5wG14E4zDpVNE51tQmwlFQG8wJtJU
	ufgibGYIlUKXpKins3YxZvtQaZKWn8kfx/algQY4Em7cqXYxbc3yJeHofGlC/OXyFEyD269IiQo
	AnPNLdgD+E6B0zdwaHFH/E7LUUQxguFGUjjKx
X-Gm-Gg: ASbGnctbKAre+gD8nuxFkFzOlEogZa9Z/gvdWfvO2MHYe0Tuifnwg2AduSxFeGybut5
	l93EU68m3NKOgslFhbQk4dDc0UpkefVWPROoOZSIhudUgB6bsu3O4enaZkNaFLeveCNCOA7Sotd
	iP12A9ffnadEKDhJrhDx96K5lCbfqGSSeZNApk7UfBwCUtIHiNBRMFakanZRQValjELNlyzIOdB
	RuU1+Hq6yZAWbgpw2QWWacndaDYX0hZT7hmWTutacTysOChN7Q2SS3L7kzlTjzBSvw6YaEDT/5x
	oNURhk6NZrUp1ptGHXqKE93Ma/NrWfX+G0v1517ohmHjaaodL8EzqyY=
X-Google-Smtp-Source: AGHT+IHzFp7Ayin7ZLuxdt5epZwacsJfi24ByOHXtA/2tQ3yV9AYUgiGyGENqzR3VrIwLw6XQlKq/HIcpRov
X-Received: by 2002:ac8:5704:0:b0:4a5:a4d8:3a6b with SMTP id d75a77b69052e-4a77a1aecc3mr1743701cf.2.1750361277885;
        Thu, 19 Jun 2025 12:27:57 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-4a77a157998sm71631cf.13.2025.06.19.12.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 12:27:57 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (unknown [IPv6:2620:125:9007:640:ffff::1199])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id D4B483400E6;
	Thu, 19 Jun 2025 13:27:56 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id D2579E4410B; Thu, 19 Jun 2025 13:27:56 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Chris Mason <clm@fb.com>,
	Josef Bacik <josef@toxicpanda.com>,
	David Sterba <dsterba@suse.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: Mark Harmstone <maharmstone@fb.com>,
	linux-btrfs@vger.kernel.org,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 2/4] io_uring/cmd: introduce IORING_URING_CMD_REISSUE flag
Date: Thu, 19 Jun 2025 13:27:46 -0600
Message-ID: <20250619192748.3602122-3-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250619192748.3602122-1-csander@purestorage.com>
References: <20250619192748.3602122-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a flag IORING_URING_CMD_REISSUE that ->uring_cmd() implementations
can use to tell whether this is the first or subsequent issue of the
uring_cmd. This will allow ->uring_cmd() implementations to store
information in the io_uring_cmd's pdu across issues.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 include/linux/io_uring/cmd.h | 2 ++
 io_uring/uring_cmd.c         | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/linux/io_uring/cmd.h b/include/linux/io_uring/cmd.h
index 53408124c1e5..29892f54e0ac 100644
--- a/include/linux/io_uring/cmd.h
+++ b/include/linux/io_uring/cmd.h
@@ -6,10 +6,12 @@
 #include <linux/io_uring_types.h>
 #include <linux/blk-mq.h>
 
 /* only top 8 bits of sqe->uring_cmd_flags for kernel internal use */
 #define IORING_URING_CMD_CANCELABLE	(1U << 30)
+/* io_uring_cmd is being issued again */
+#define IORING_URING_CMD_REISSUE	(1U << 31)
 
 struct io_uring_cmd {
 	struct file	*file;
 	const struct io_uring_sqe *sqe;
 	/* callback to defer completions to task context */
diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
index 929cad6ee326..7cddc4c1c554 100644
--- a/io_uring/uring_cmd.c
+++ b/io_uring/uring_cmd.c
@@ -257,10 +257,12 @@ int io_uring_cmd(struct io_kiocb *req, unsigned int issue_flags)
 			req->iopoll_start = ktime_get_ns();
 		}
 	}
 
 	ret = file->f_op->uring_cmd(ioucmd, issue_flags);
+	if (ret == -EAGAIN)
+		ioucmd->flags |= IORING_URING_CMD_REISSUE;
 	if (ret == -EAGAIN || ret == -EIOCBQUEUED)
 		return ret;
 	if (ret < 0)
 		req_set_fail(req);
 	io_req_uring_cleanup(req, issue_flags);
-- 
2.45.2

