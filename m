Received: from mail-qv1-f97.google.com (mail-qv1-f97.google.com [209.85.219.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C71C17A30F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 19:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750361279; cv=none; b=tkIDLE3l5KvRc16d4v90drdea7bhS7aCrhWsnkD38iQdvodC7nc0/kgbmKnx3aDWy5WEUSWowZhKKuIBvof2YpIAWyY2rfIwL/e+vXpESKa9330Un0da/z751y357E1AXmH259upGP/s1dXHT4T/IoNuhguuZJnU+F+2pHWfZEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750361279; c=relaxed/simple;
	bh=sijI63S00ZgLzoop5Ca6++6nAMYhSyYN82X6IBrZOM4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E7YebFU4V/MDnKneeXRaO+0NvgzPEh9Y4YOWQW8l8bUdQmxwROUaR9V68bcAosknAiCYOnpNGJVeki0KljDH2MG/taVRaAu6VxQb6zK7XYCnuWgJTLsD5qsSn4h7sr1YcLplJVLlkXLRKKEQW2f6V/OheHi+JH9z56nGNTuhdU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=Ud5etnuA; arc=none smtp.client-ip=209.85.219.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="Ud5etnuA"
Received: by mail-qv1-f97.google.com with SMTP id 6a1803df08f44-6f2b58f0d09so1238876d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1750361276; x=1750966076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UgbxT3rUHbJcwXp+d4U0s8gCt8pvR9AU1IXgLNjEg00=;
        b=Ud5etnuAFg21/3ql02kuJSUljsqKzAeZ0DCGWdyOWTJYz9kEhQQG8Baf60AVfCcf6R
         9UgVg2Nzl7xAhI3eSH6qiE9Fw1KZRDp67Em2P3eXYq6wtvc8RcPG070krEZXIqXxibal
         /OoR14V4CHN6To0O275iNfbbtIBR2Uflj5MEM+MxH7YzGphdujNkj1jkmWrnwlvJrY4r
         eUmaj+Cgs/6n1f9Tq0TCgs5Dj/Xrn2r91tnCvNYnFxtyTVtrJZSJi/VyXB8EluAXJbFn
         acWY2aTqNc37YfIeWTKo8DhOR58rtGooyZDUqrG7G+ymFlEretM6754Gps4yA114P6vz
         IoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750361276; x=1750966076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UgbxT3rUHbJcwXp+d4U0s8gCt8pvR9AU1IXgLNjEg00=;
        b=PwHkXRzswvAE4VXGzn+9enPqMVTB2H6zwYFTpYYB+m2oRHUC0zOuiK1Y7iGVBRE8c3
         ChmAfH45X3Pv1T/tohpQFJImi26mcpqcwbE3uK02kdrVDE/HRugm7UqzDxDNdJ5ee4Ge
         bbNu1MA0VEUPD+FebRb0gfHFiObFM5mmb+QYBSlzVJxjEh0xQ/MzOq0GO3niy6nL7u1w
         k8CRWeBmxXSoSNz9KyJYMJS/BeJ4tRBG7mpzx3QEryGRq7K7j985ekfJj1Uo3iIC7Img
         Y0Z1mq2lcNXO6ydvQcQODGsaVANlr/aaKA0yHPIT0TXuHAhFz1xtq5tbBamdtsLgmNgI
         fj2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5xXkQpVwyiItwbUrvN47gaUaoXl0qxvFEOYIdZrUx21iUDXgvLce7HWMDdHHqreo3OZVU/72RdvRs8gA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6BHtlfM3LdpExvWiJcAi/EGyOKjfxZGMJ1DsdUR16SoRXCpYz
	5uOslUKtFL/xphd5ENBIt9UBq/bgolUsboc3gsz/4//ZTC8qX5hBVaJeujfS5dXmnYGBVdRiUk4
	rACQQzeQObetE0k3f99OinQlsOl5+IWQckdUVynaCuAIi9KG2txCN
X-Gm-Gg: ASbGncs/ELZwvdslQ3g4OiYDT/ykQ3dILA1bnPudImeAED6veFlSj7WeiGVOEG9jgLJ
	gj8HBiwrwimkxipuUMtz452tnELjCBosYB0BPf6wJRHYBBPvB4v3cxv/6XQHbzJKGlVsFdjq0ce
	bBNkKrVNBCNdZwdFyIkIUpz+p8JosJZqs1E47gGoWni16qUDp0lmJycK0haEuMASlK5WJVH/KC9
	KNI/97kMdhGyVfAyRJWVtJ86dDkPCztBySM/3DvwAvg5HadwBwe7+NMt6MG+6QWr/tDYjHe0mBy
	/3Ilv/anhPk5n8wGOU2/j8c9aqsEkH0m2+GgErSA
X-Google-Smtp-Source: AGHT+IHz10o1j4yWo0MElDZwSQq9lzFuxMzdz16AoaaK4BkVl1R49On+ZMbhjl9V+Kl3D2KIomY0GccVT6QO
X-Received: by 2002:a0c:f096:0:10b0:6fa:b8a1:abaa with SMTP id 6a1803df08f44-6fd0a2ff22bmr2120546d6.0.1750361276346;
        Thu, 19 Jun 2025 12:27:56 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-6fd095627c8sm299176d6.70.2025.06.19.12.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 12:27:56 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.7.70.37])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 70C423400E6;
	Thu, 19 Jun 2025 13:27:55 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 6B9D1E4410B; Thu, 19 Jun 2025 13:27:55 -0600 (MDT)
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
Subject: [PATCH 0/4] io_uring/btrfs: remove struct io_uring_cmd_data
Date: Thu, 19 Jun 2025 13:27:44 -0600
Message-ID: <20250619192748.3602122-1-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

btrfs's ->uring_cmd() implementations are the only ones using io_uring_cmd_data
to store data that lasts for the lifetime of the uring_cmd. But all uring_cmds
have to pay the memory and CPU cost of initializing this field and freeing the
pointer if necessary when the uring_cmd ends. There is already a pdu field in
struct io_uring_cmd that ->uring_cmd() implementations can use for storage. The
only benefit of op_data seems to be that io_uring initializes it, so
->uring_cmd() can read it to tell if there was a previous call to ->uring_cmd().

Introduce a flag IORING_URING_CMD_REISSUE that ->uring_cmd() implementations can
use to tell if this is the first call to ->uring_cmd() or a reissue of the
uring_cmd. Switch btrfs to use the pdu storage for its btrfs_uring_encoded_data.
If IORING_URING_CMD_REISSUE is unset, allocate a new btrfs_uring_encoded_data.
If it's set, use the existing one in op_data. Free the btrfs_uring_encoded_data
in the btrfs layer instead of relying on io_uring to free op_data. Finally,
remove io_uring_cmd_data since it's now unused.

Caleb Sander Mateos (4):
  btrfs/ioctl: don't skip accounting in early ENOTTY return
  io_uring/cmd: introduce IORING_URING_CMD_REISSUE flag
  btrfs/ioctl: store btrfs_uring_encoded_data in io_btrfs_cmd
  io_uring/cmd: remove struct io_uring_cmd_data

 fs/btrfs/ioctl.c             | 41 +++++++++++++++++++++++++-----------
 include/linux/io_uring/cmd.h | 11 ++--------
 io_uring/uring_cmd.c         | 14 +++---------
 io_uring/uring_cmd.h         |  1 -
 4 files changed, 34 insertions(+), 33 deletions(-)

-- 
2.45.2

