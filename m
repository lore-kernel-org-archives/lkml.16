Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A871522FE08
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 21:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751233234; cv=none; b=A+2ksBGQqDLE9zciOHMO/JQK2N9mSHPYnXhAROvuAZ8uUTsf+V5rHiLG/mGcOwbYBHnf0gS/nrjnGg2Veanvj4fCEqPp6HFxXShweDxKjGz5VgCtiTgE24xkw5nmAFo17zSiJ6nNYYmJgP0G/PFpfwuondN0nVrGxtsHexQD2sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751233234; c=relaxed/simple;
	bh=IUz+Ldn5aWRzyc5QAomsSRWnSg4dFY9j+XF+d/bNKi8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XysJYljkoklg+751kdAvQNKPbvVEejMGy/PtgcZRumY4gf+QDwIde6z3O8uWY4t43kFGSpzs3eqdQPhLcLRyE13+w2RoRXKM8zmId6Kl1CmtihdY7woKAVZ1+C9B9iZo0JG0Je0LPAf7T8JPiiqpeZjMhX+82sEA+T2eoEsva3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=c3NpKrLw; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="c3NpKrLw"
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7CEB83F52A
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 21:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751233222;
	bh=ULrFLuqX3/N7L6TuZDZeaHi7Yu9t10Q32tC/ZUt/0lw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=c3NpKrLwY7ktu2oHsD7TtnL1/O56gs5PE+pzvY0jUVRnagoxDHDy56NqbcuNV0mHx
	 CcJHxdRl1tPVvTAN2mWGMRztZsz3PlYsmdLlkrgqDr+7jBBVf5DLYZ+QgPVU1CFVGf
	 QyVWkQ4B2rxSi4hNmqj6FMsQcjLqyt83VIxVl/H7QzwxpY96lcHBI93kzkaFmQ79Kb
	 0eaxHTovC7VssEzKyxodkufPTEnGKJZRXTw65WDQgAaezMg0Lg8pj1s0auoopOv0ou
	 nDTHnpxw4UjikGRyrjH7FXj3nSFl4dPMntjKQN12RFas8W42Eul8tVK0bsbnqRWhFM
	 gudPWWuhTuX8A==
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ae0aec611beso101173666b.3
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751233221; x=1751838021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ULrFLuqX3/N7L6TuZDZeaHi7Yu9t10Q32tC/ZUt/0lw=;
        b=jnwd0//C4xZDD0v7n7UT6+38JbNdhCbyVHwsQEoaxQ78NOi+ixOJLMsUs21XxXsbXH
         wuQEHUrJx6wcwSpuh9NY9bA+04pkv2hEDBQpruCcOK4nRNvdudCfAnUoDZy7Vrrplwoc
         eWe/Ps3au4bYw84wreM51shGfP7xWR9bY8/vSV+PVkMTVrqJrntitbNc6cP4VKGeD4+V
         FdQQRYTU9tyc4op+ZZoSO56P9t+fg5P/zPmh9EQVlr7doE5CuA8Z9lhkfF3wgCEjE+lZ
         v5cNMbgUF3NJMasGW+eC9vdtceDttUAi/ssQTJlRDdycq1sKHvvjRq5pZpdwWWGqzdCx
         PemQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfcJ5Aobjw+VmmJZuzTHLQ012tqIXICT7mnVhdjVwpEq1STgg60LEpZ2ItEpq6zi5EB0m1gJFHM2mezgc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHB3zUqAADcON5UL684Ahw4H3aMF6HxgRYL917lNimy5XdGQI5
	oolY0t2GF74jgkrlAUgr6WSuRXNIqyJn343tBprUM60b/2/KjIW1HsZqU2QxGHbvjSmb4eBrfFP
	XRW3aADSzLlaP2sKjXSQIfTuJDGbQ0kG65sGtT8tg/xygQaKsJM8nbZdz8x9DfVvxgwPTHOZdkD
	kvAbz9s4Xo15SGFcnt
X-Gm-Gg: ASbGncsLs9Ts+1olBU1Gj8nWthvocc49swG1kePCnnwGB7W3BOT+xTlPHcvGEr+O3MV
	1ZTf/c9wf1IKQqqwRSFRf7OlBcw6Igzf04Zoe7brwWLxWqdbM7sf4xh9M2WZVrrbhSEWx+H9M2o
	G71ZwRHng/Y6CzhH0zdnJzcTsj5JfZXd6UFGPsyrOGH05vLFAEad1JQXyUBPwAF4uWYv61KU4TB
	+OfiQUn8l5j/Vj0jhdmTaq+vNSP/zxvtVE6sERBbUTnEQMODEcHAW+tnRCN+aBuHhCmlSXcSMse
	U03bSsAu3r8MNlibDk3dLB0MdEyU4bnZW3MZ7jJh08jix5bA0A==
X-Received: by 2002:a17:907:3c8f:b0:ae0:bee7:ad7c with SMTP id a640c23a62f3a-ae3500ffb84mr1000793266b.46.1751233221383;
        Sun, 29 Jun 2025 14:40:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRrsRwdjgiUbLf7LNbT+BKrfksSJYA7P4zBzKzhpPcr7lZkTOV6E3XJ3B/VDKZULjlvomnXA==
X-Received: by 2002:a17:907:3c8f:b0:ae0:bee7:ad7c with SMTP id a640c23a62f3a-ae3500ffb84mr1000791266b.46.1751233220952;
        Sun, 29 Jun 2025 14:40:20 -0700 (PDT)
Received: from amikhalitsyn.lan ([178.24.219.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35365a754sm557263366b.62.2025.06.29.14.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 14:40:20 -0700 (PDT)
From: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
To: kuniyu@amazon.com
Cc: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Leon Romanovsky <leon@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Lennart Poettering <mzxreary@0pointer.de>,
	Luca Boccassi <bluca@debian.org>,
	David Rheinsberg <david@readahead.eu>,
	Simon Horman <horms@kernel.org>
Subject: [PATCH net-next 0/6] allow reaped pidfds receive in SCM_PIDFD
Date: Sun, 29 Jun 2025 23:39:52 +0200
Message-ID: <20250629214004.13100-1-aleksandr.mikhalitsyn@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a logical continuation of a story from [1], where Christian
extented SO_PEERPIDFD to allow getting pidfds for a reaped tasks.

Git tree:
https://github.com/mihalicyn/linux/commits/scm_pidfd_stale

Series based on https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git/log/?h=vfs-6.17.pidfs

It does not use pidfs_get_pid()/pidfs_put_pid() API as these were removed in a scope of [2].
I've checked that net-next branch currently (still) has these obsolete functions, but it
will eventually include changes from [2], so it's not a big problem.

Link: https://lore.kernel.org/all/20250425-work-pidfs-net-v2-0-450a19461e75@kernel.org/ [1]
Link: https://lore.kernel.org/all/20250618-work-pidfs-persistent-v2-0-98f3456fd552@kernel.org/ [2]

Cc: linux-kernel@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Willem de Bruijn <willemb@google.com>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: Lennart Poettering <mzxreary@0pointer.de>
Cc: Luca Boccassi <bluca@debian.org>
Cc: David Rheinsberg <david@readahead.eu>

Alexander Mikhalitsyn (6):
  af_unix: rework unix_maybe_add_creds() to allow sleep
  af_unix: introduce unix_skb_to_scm helper
  af_unix: introduce and use __scm_replace_pid() helper
  af_unix: stash pidfs dentry when needed
  af_unix: enable handing out pidfds for reaped tasks in SCM_PIDFD
  selftests: net: extend SCM_PIDFD test to cover stale pidfds

 include/net/scm.h                             |  46 +++-
 net/core/scm.c                                |  13 +-
 net/unix/af_unix.c                            |  76 ++++--
 .../testing/selftests/net/af_unix/scm_pidfd.c | 217 ++++++++++++++----
 4 files changed, 285 insertions(+), 67 deletions(-)

-- 
2.43.0

