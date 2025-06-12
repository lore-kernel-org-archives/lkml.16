Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDFC1C32FF
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 02:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749695374; cv=none; b=VlWxRb+Qv2nnk52/J+yJ58vE7jyYnldRlX70hpKRHhlHCjgMcDIb2BCuKX3YuGMTxvbUgOkNTUNnEOEG3XUCPqX3waLos0NwiFuk+oiozLQW3y2ehfDWTC6FViyW7WDUPAAeWwABc23s2zpCaK3aA42Ew3JXGtYRynvQd8ltklE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749695374; c=relaxed/simple;
	bh=UiR+4jj7Lezdi7ckAIhQ1hmMUd7C1uiRiYBWgV7z74w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sQFsM/OkADAYQLiF+vYhsSEXeXV2MejmJDAw1iJRFz++BkVqWjGDrWQQHzyovAXbsHrgo39Etr+vloJUjlDqk/rfTWJNRbZ2Ruht1D8psVeaqD3UizCzksVH6929ba8rK2dKEUU1mmFhfWxO/yOOUq08/lecfeK4PBpLlcQCrrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ewVXWC7R; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ewVXWC7R"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so403690f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 19:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749695370; x=1750300170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wyJycTNJKqQAdQ4vv1MjI1ZDB2PA21sgOvxj6YC0ETM=;
        b=ewVXWC7RK1FoHXMgNlYNRCYV84yypu5i/u05FEHnx7NH43xZwOUZEFacgOHhw+5E3+
         FyS/t1cTwVib9RaD0VieonMXFIZaeelijGgR+bChQRZDeaECA83RlFuZFYXr20rRrBV2
         V93OhqS+8jXN83sNceAd2CZ2ZqsvmsAgen2MaPy/AZK+t2L3AdclxaKHwR5aJVaeEQOT
         0zaEnIRtvkPFB59Yx5OmmrtS9CaBi+KQxoWieTv1Es/mpVwtXS21JIaSQsjGmv/Acdne
         59tamKdPID7DtHLvYk3SfDMoYaMcX4m91duRHxSu2jFvomIhANyFHJbvwsCujqEKoB6B
         TzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749695370; x=1750300170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wyJycTNJKqQAdQ4vv1MjI1ZDB2PA21sgOvxj6YC0ETM=;
        b=r2IJ2P0qn1r9+9vgaj8ZSA8e/dw5WLjO/ZhrXzn803ycGM51rdiPiQD46RJFWEbA1K
         kjnVlG0ZY53aDDLFQ+07fb+dmPucCYWTnRFP4JGoZ1g9wcRtOOCplVjcsnFZQgJJNUJU
         UUpz8N6BkZa9QgNivzdQEyESiQ7OrfT5+vtAN8IsUqBeF7wRFQ3qaZi5ThC+duC8vRR2
         i4oTa8SJmvqCHV6LxE3u2CwL3Q3cNHgsWFGbylBLPSKFPkUtpBv/dW7N13RNssicJ6lY
         zYWDvAAzHDkAoxciIUBWf/XJcDifvCknn2pPZmlNhqxMta7x/mkwnBgGptM6V1UyyTq7
         kr6A==
X-Gm-Message-State: AOJu0Yy6rVjqzJKR9Sr3mJg87CvhJjn/MNs58wVLfI3O/W3WC6P0cnVj
	upc9j4w6LjxGyp4pp/lrHjrN86iWrt6SH2d0JJ7j4T1OHpO183IU9k6ksb9Mfr3XJV6388rZQiV
	7Qfw=
X-Gm-Gg: ASbGncuzKMi+iz0iyljoze8XmiVEHHyCzG0gjmpEL9Vcb0WfC4satKueyFWIzf2A4ZH
	ubM+LTVz1Pxotxj5JmwU5JYo8zZaaa1qtZc+1ddQDq25EmWU9yHYd/7UvdbgpCls716FtezqLj+
	IBQRHhToUD3G6+0KINb+wHHZAmyvFHKAml++TnTln7cLjHH0fhoRWhvknf4Ws8dVYabXnTmRvnt
	nKCB+R3XrARuCz0Ti/rbIpxdS4dUSBvj1s269QlZHmpuVgrIPMdl5FxSrbxumQOIbuH8ptRPXSJ
	C4Dy4EYDNwmJnNh/niJwo/4+7mMyY8lQ46WrpO23MLXBiJA+AqwXf85yttm5Yg==
X-Google-Smtp-Source: AGHT+IEor0nUXVAnFPELZdkVN3Zon9NMN75gb7Dse9/hrs9o11jYQcVQVAHlt5QJB3hYaccylY2k3w==
X-Received: by 2002:a05:6000:2dc4:b0:3a4:ef00:a7b9 with SMTP id ffacd0b85a97d-3a5586dcd53mr3812187f8f.12.1749695370135;
        Wed, 11 Jun 2025 19:29:30 -0700 (PDT)
Received: from localhost ([202.127.77.110])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-748809ebecesm296699b3a.138.2025.06.11.19.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 19:29:29 -0700 (PDT)
From: Wei Gao <wegao@suse.com>
To: linux-kernel@vger.kernel.org
Cc: jack@suse.com,
	linux-ext4@vger.kernel.org,
	wegao@suse.com
Subject: [PATCH] ext2: Handle fiemap on empty files to prevent EINVAL
Date: Thu, 12 Jun 2025 10:28:55 -0400
Message-ID: <20250612142855.2678267-1-wegao@suse.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously, ext2_fiemap would unconditionally apply "len = min_t(u64, len,
i_size_read(inode));", When inode->i_size was 0 (for an empty file), this
would reduce the requested len to 0. Passing len = 0 to iomap_fiemap could
then result in an -EINVAL error, even for valid queries on empty files.
The new validation logic directly references ext4_fiemap_check_ranges.

Link: https://github.com/linux-test-project/ltp/issues/1246
Signed-off-by: Wei Gao <wegao@suse.com>
---
 fs/ext2/inode.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/fs/ext2/inode.c b/fs/ext2/inode.c
index 30f8201c155f..e5cc61088f21 100644
--- a/fs/ext2/inode.c
+++ b/fs/ext2/inode.c
@@ -895,10 +895,30 @@ int ext2_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 		u64 start, u64 len)
 {
 	int ret;
+	u64 maxbytes;
 
 	inode_lock(inode);
-	len = min_t(u64, len, i_size_read(inode));
+	maxbytes = inode->i_sb->s_maxbytes;
+
+	if (len == 0) {
+		ret = -EINVAL;
+		goto unlock_inode;
+	}
+
+	if (start > maxbytes) {
+		ret = -EFBIG;
+		goto unlock_inode;
+	}
+
+	/*
+	 * Shrink request scope to what the fs can actually handle.
+	 */
+	if (len > maxbytes || (maxbytes - len) < start)
+		len = maxbytes - start;
+
 	ret = iomap_fiemap(inode, fieinfo, start, len, &ext2_iomap_ops);
+
+unlock_inode:
 	inode_unlock(inode);
 
 	return ret;
-- 
2.49.0

