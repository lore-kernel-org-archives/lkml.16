Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE2A215160
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 20:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743540560; cv=none; b=gXBSSYqrNPFwD9eH/jVDb0CRp/K6YHKoi0Wz/PMoh3yYpUm2tYr3zebrCshYI44NsTSu0lFq7+upfPX+OxPeNYBF+tTq34LveAfgXTS7m2nq8PNc8ASU6EUj4qS+o0VW2pHpX9UpgGrKH2M4DF+OECpBrPVkmCDmAh9kP2vQ1UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743540560; c=relaxed/simple;
	bh=d8GQDf9aNn3XCHYo/doXpPecRNU7F0oZKd4mY5qwFlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GACXPXI0IrO27or39gb5RSPhKG7t7B4h+qCh6/7XLhnlgVYuaosUshuxfBtE8cEZOnD7kepgd7mSNqjwpz6dPLdtjF/amvLAXPaBTUyLFTY1SuAzvEi5DrVPJc7YN/wn5OoP4TsLZK+BUYQSggS1hiDY4ETrpDBJgMEX9vWfmhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=Hi0rfQ4N; arc=none smtp.client-ip=209.85.216.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="Hi0rfQ4N"
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so13010649a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 13:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1743540557; x=1744145357; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CszSfhaBSgL0ceu8EPCDZblcpCoeT9mB1rw339afGoA=;
        b=Hi0rfQ4NpLhAQMZyLruAKoM5D7iOc88WxnhDiZ2lB3oCSvBj1A3xOxORz70D6n6dfV
         olUOkbF63/5Wjr5vvW3BG07sh+HcXS0ZG88St+DI2UvKv9jMlrgaThCF5E97HWAW2zVC
         teIQA9jKrmPQs8ynkjC9aFV78FeaMiPmjI6Xwr/xIIiD7W8sICuey0csyzckvsKVXv8L
         XvtS/b26MTDgMMMlULgO/SPGEmX7QNVjfXGW66D/fUZXYwIkOaQQNP9MiTVn34QPjykx
         QizgrZ5+Y7ImoasJdGS5bmQl4fw9sHLFOWrZtPxpu+YXypziDis8PJb3mR8b02jGbXYv
         NJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743540557; x=1744145357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CszSfhaBSgL0ceu8EPCDZblcpCoeT9mB1rw339afGoA=;
        b=cGvQ/QPRCzYNbl3bg7YMXrQs4KFsGvHdpcLbhGXSUI1PxGVvqPx7v/DsJpdTCBLPCN
         y3+4ZbkZCNDY+nDDFPLY855ADPc69IK+OGqERVX2goEh1l4VaWSmUHPAafhM0x2StEvE
         7cYfDqO+SO0GNgT1IMzilAWRQDO+y2Q4W7D4UmJ3hDY8p4QQd4zk5oKZvxiOJo2VcbAl
         3oyvqtHd1EuSg1ncDw2YAvqrn3hLuJwJIsVMrJPPmIf0+TcJElmc1iPb2hLIz6hPNJBV
         5gT2h2/w+xZpHui2KCN4A4qUoPi5o1tp788SCmKFFTqYM15IQ0bjz5553zKQ45etX0jF
         ePfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyMbnQ3ZnSRYo2lTtfyRVR/6HuGz0t6sK6ujkaIt9AUEqQp0zRAe5M5DJZ7jICUD+WMKV995pUjlVo5VU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3wNKkRigGD05DMHbDX5uMXl4OGhfBpH9s3Q3pJrI4DZp6y4xc
	kPqz6IfsGvodLexsudQJhB3qjguQmIbC+iIcGCsL+GfQwSjSoswOZXYXSfXhj0aY2D7Z6OPywp3
	oRT51Mj7fBPSDcxqonBtCxElMrUKybPU+E4XM92hSCVIIaRX5
X-Gm-Gg: ASbGnctOeQhonwjUhuv2oO+4EmRGZgwvB5eAuX22eVDS+UPu3PvZ2AlrggRnPUTIzt0
	WetSQp1HG9l4vP1NXS7Z3slFYZfdH6r0mZFyI3h55Lygi1rMkbz8f9lTEO7mipWFk945E+90qv1
	OIOClwiY0CO4k00YkJDUQDSCvM540f0iHSlb10c/tT+qXWpScbSdG0a149kfdEcNjL2gTa3qxE4
	otTQZRCQ3UdKUYXTkk7UwfA2N6K1ExZ2V/VjDPEdN4no4buoOeVAdIHBKSy2xvn4cSL1PRLW3YT
	ccU26F7TYe+xuXZywzxmxv6tumFHGMwAjHI=
X-Google-Smtp-Source: AGHT+IFiTOrrefXmiLyHfCuPwBgnL0O06M+OBFhNttC3/hRF0LLMybJ75J009EG+gSxDw4ZMGHDUitYCjo9x
X-Received: by 2002:a17:90b:5410:b0:2ff:6ac2:c5a5 with SMTP id 98e67ed59e1d1-3056ef0e8f6mr143301a91.26.1743540556965;
        Tue, 01 Apr 2025 13:49:16 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-305175cae25sm860359a91.14.2025.04.01.13.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 13:49:16 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 17F8334024A;
	Tue,  1 Apr 2025 14:49:16 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 08CE2E402D8; Tue,  1 Apr 2025 14:49:16 -0600 (MDT)
From: Uday Shankar <ushankar@purestorage.com>
Date: Tue, 01 Apr 2025 14:49:08 -0600
Subject: [PATCH 1/2] selftests: ublk: kublk: use ioctl-encoded opcodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-ublk_selftests-v1-1-98129c9bc8bb@purestorage.com>
References: <20250401-ublk_selftests-v1-0-98129c9bc8bb@purestorage.com>
In-Reply-To: <20250401-ublk_selftests-v1-0-98129c9bc8bb@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>, Ming Lei <ming.lei@redhat.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Uday Shankar <ushankar@purestorage.com>
X-Mailer: b4 0.14.2

There are a couple of places in the kublk selftests ublk server which
use the legacy ublk opcodes. These operations fail (with -EOPNOTSUPP) on
a kernel compiled without CONFIG_BLKDEV_UBLK_LEGACY_OPCODES set. We
could easily require it to be set as a prerequisite for these selftests,
but since new applications should not be using the legacy opcodes, use
the ioctl-encoded opcodes everywhere in kublk.

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
Reviewed-by: Ming Lei <ming.lei@redhat.com>
---
 tools/testing/selftests/ublk/kublk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/ublk/kublk.c b/tools/testing/selftests/ublk/kublk.c
index 83756f97c26eecc984da55b8717e99b89470b904..d39f166c9dc31721381184fb27d68347ecab81b6 100644
--- a/tools/testing/selftests/ublk/kublk.c
+++ b/tools/testing/selftests/ublk/kublk.c
@@ -99,7 +99,7 @@ static int __ublk_ctrl_cmd(struct ublk_dev *dev,
 static int ublk_ctrl_stop_dev(struct ublk_dev *dev)
 {
 	struct ublk_ctrl_cmd_data data = {
-		.cmd_op	= UBLK_CMD_STOP_DEV,
+		.cmd_op	= UBLK_U_CMD_STOP_DEV,
 	};
 
 	return __ublk_ctrl_cmd(dev, &data);
@@ -169,7 +169,7 @@ static int ublk_ctrl_get_params(struct ublk_dev *dev,
 		struct ublk_params *params)
 {
 	struct ublk_ctrl_cmd_data data = {
-		.cmd_op	= UBLK_CMD_GET_PARAMS,
+		.cmd_op	= UBLK_U_CMD_GET_PARAMS,
 		.flags	= CTRL_CMD_HAS_BUF,
 		.addr = (__u64)params,
 		.len = sizeof(*params),

-- 
2.34.1

