Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1891D5CE5
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 11:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743765086; cv=none; b=q3IIo3MuPHrL0CwrqE2h5AzQgk/V4ArD4lCLho1XxmBp6+oAEA+kWauRC+EMJPcfA6Z+ELjJTj/FMehvl9KtuZ5lIsuK72b7VT5UbT3rblZEj6G0x0EhWszfsFgtH5hzJLnwSe3fyBGQYLoL3Ql7IQMBaxXWwZ/WAKjhE7TxHFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743765086; c=relaxed/simple;
	bh=UDr/Lb9XWzoHsFBUucxyLR4h9S1sKw8aMUMUdQL/L0Q=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=pbCC3kvsNPsZ2JDkMWT491o5eEPZn/pm26seUrikahRdShqFDzCtW3hdQvKK9E1fFUYItPbDgxwI0SmfXXOtxGuASU+ApDloF25o3srBra/ZBNrjTgJarNSp5FkMH06Of1XSMcJl71aXCD0SJoXknP5XKzSBRlacfcEit3/NVo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mclapinski.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GxWXiP2b; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mclapinski.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GxWXiP2b"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-ac3dca41591so176766566b.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 04:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743765082; x=1744369882; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Zymo7rZ7Uaxj5C85OkxMopyfJntujg//NlAcCsh1y3A=;
        b=GxWXiP2bmpahQjvngkOoAkfkTeg0OoAetahokNc5u18S7O/74RXBl+KefB1Ju2pc47
         XDDa6x9xqfzzuzfDTtyBg9x404egEjj10CYRh6v79V4QhoaVNedEZRA6itVPNDj9PIet
         b2/ud16I7lPeUGoB0cmSsO8M4f9Ls2s8KJil5D6UZNI6cUKwAs0ciXkrYp7XHL2NIHji
         kjcnILSV1TVuR1znRZDhJQB7wuGuVHyKIpSFjmb4WgOFAO7SOe2fNWjYFOXaz1mC8Ulx
         Nj7GlEwNai1Dm1TvG0fX6IDr00HcM273YpJvAmzEVfvTB2HcWZq4hzmhN0rHVe4jih4f
         8mwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743765082; x=1744369882;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zymo7rZ7Uaxj5C85OkxMopyfJntujg//NlAcCsh1y3A=;
        b=ugS3wprkTC6K2EfL6TeM+NhoEeLsn9n5+HElhkUeYkI2+BU44Hd9Xy3oMLmAVBbLJ1
         eIMKB7mFpmOkm5Pp3Y1Bw7ZlVIa1GLrhQuArR+XHXhgip+D+VZaWpNLCcyfOZPMuu8sW
         DynN/eithiJj5w76NozoCXrSxENT4ycB9+a133yRsotG+Du7SlKiBgD4j8d73wgO7gDY
         WmK+MP6qMysi1VwrBewlrFs4QzMptCVv6rXOyVAbALAh7nCCUyUX+52u2ieSkttIkHr8
         IextgPqwlvppCU5MevOB6to/vw2qvK1G3rE5LMAtc1xgxPd0gnTPBx1JH5zcLDK+rm5V
         fyzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNH/3AKa99OPz6TcHGGPEK8nEtoqT81+M7m7iC4qsRhqT+q6PX2jdKmmzC28Xqtbp5V3Ha6OmKVfqxLpg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZKEgnpIqjCW4EJQbsy22wimqzJFN1NHxLmRfQ8bZ0aStZT48v
	i3CmxLU7OVMQN6vBqv9zyPyGShJGMGEz0wzdoLPotPQn2VRJxYkkOF52ccLF/0qwtRAF6UJQpj4
	e9ZmkDDOO78YVoVQ/dw==
X-Google-Smtp-Source: AGHT+IG+ldNYNdV51lrNuZQ4fk+QDbNPHUWm7+QzGL/G1P+L2ir0BWlN5d364Rwi2NeBoKhLFwUsyQJuulyPuyfz
X-Received: from ejcfz16.prod.google.com ([2002:a17:907:9590:b0:ac2:50cf:f244])
 (user=mclapinski job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:6d04:b0:ac6:da00:83f4 with SMTP id a640c23a62f3a-ac7d1c69d88mr229541966b.53.1743765082733;
 Fri, 04 Apr 2025 04:11:22 -0700 (PDT)
Date: Fri,  4 Apr 2025 13:11:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404111103.1994507-1-mclapinski@google.com>
Subject: [PATCH v4 0/2] mm/compaction: allow more aggressive proactive compaction
From: Michal Clapinski <mclapinski@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Pasha Tatashin <tatashin@google.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Michal Clapinski <mclapinski@google.com>
Content-Type: text/plain; charset="UTF-8"

Our goal is to keep memory usage of a VM low on the host. For that
reason, we use free page reporting which by default reports free pages
of order 9 and larger to the host to be freed. The feature works well
only if the memory in the guest is not fragmented below pages of order
9. Proactive compaction can be reused to achieve defragmentation after
some parameter tweaking.

When the fragmentation score (lower is better) gets larger than the
high watermark, proactive compaction kicks in. Compaction stops when
the score goes below the low watermark (or no progress is made and
backoff kicks in). Let's define the difference between high and low
watermarks as leeway. Before these changes, the minimum possible value
for low watermark was 5 and the leeway was hardcoded to 10 (so minimum
possible value for high watermark was 15).

To test this, I created a VM with 19GB of memory and free page
reporting enabled. The VM was ~idle. I meassured the memory usage from
inside the guest (/proc/meminfo) and from the host (provided by the
hypervisor).
Before:
https://drive.google.com/file/d/1Xw23lRry_PgEH3f6QRnSGvoHh2u9UHyI/view?usp=sharing
After:
https://drive.google.com/file/d/1wMhpIzepx6t44F70yCPA50n1S5V2AT-a/view?usp=sharing

v4:
- Replace the leeway tunable with an equation based on proactiveness.
- Add graphs to prove it works.
v3: Remove gerrit ids from commit msgs.
v2: Change commit msgs and document the new sysctl.

Michal Clapinski (2):
  mm/compaction: remove low watermark cap for proactive compaction
  mm/compaction: reduce the difference between low and high watermarks

 Documentation/admin-guide/sysctl/vm.rst |  6 ++++++
 mm/compaction.c                         | 12 ++++--------
 2 files changed, 10 insertions(+), 8 deletions(-)

-- 
2.49.0.504.g3bcea36a83-goog

