Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1E22144DC;
	Wed,  5 Feb 2025 05:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738733919; cv=none; b=Cs6gnAr3GG9h3SzJqodBOLcqn2aB9c7lv/SgOP44Z92NSMDinakVlzqtdV6Q14aaCrKs/lih+tkcKf8QoKjFllZBMdS8TRJdtXta178MswRpjDccxifb0XmXzDD3GjcVQkCQdKbtNq8qj11yxGSgYuDzMwpzvOoZhA4fh0sp87w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738733919; c=relaxed/simple;
	bh=jvH7d9MTceKjTF/lJ+866RtotYpzvuoPwxsYuoHoxr0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ioUcF9V1PfXQhWaA+VnFH+IPaeCRnVMESA7l09Ov7BoK4wGefSPSfTtnVfJTuUGs0rf6IRCsmdgMUthIdVb8nEK1znup5aAuvw9eizK/KFdASkul72R34FmZ2jrb5cPZ3cnNaM8GbxxyJ8p8KoCH65v4NybdXcLUr8sgz4UFTiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F7kLR30a; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7kLR30a"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2f9c3ec68c7so2181799a91.2;
        Tue, 04 Feb 2025 21:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738733918; x=1739338718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bbnQy5wxchta6Hzohq1KAiRBnXj1eekjRksOwuYD/4s=;
        b=F7kLR30aluPpyqosRuroKR4LlsvxLwzIeunqxvtuFJka7enX4HW+uEggRruy2a2UR/
         SkZfXLkXutnnIJLCVQPTS44v6YITtd3oFU5Ld/fOsfWjkVPj4c9kIFsOs3ZByj0ctFxp
         TnI6ikJt1qLYL/iyiVNXiAOOUyOkDdDq8YUZ53pw21YWcoCdtyR2ofQF0hpt1FzryrxV
         GRr7ACmPJmxssGR4tphuRi4YtBOvlM3cyVm1W6i5Vw+eBxvXd5iW8jpecHeld6h9PQ+0
         fpGLAaiaUQy8ZhXmRg0eRHwEsVOX0jT0bbMw7GCK78MkR+vr8iHCDx2RzqphyQsxivfJ
         tlug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738733918; x=1739338718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bbnQy5wxchta6Hzohq1KAiRBnXj1eekjRksOwuYD/4s=;
        b=F93S8O1QqhYDVuOXA/3q7gjLRWpCQU/UvvwKAYn7hag4PXx6bs1Qf6vuKcGd7RBOF6
         C3cwGg6COVvj3ZLfe9BOaHqec0ppBLR0fkl9JrQeMHdCDfDj2Wf1phRFau6ReZHJTUrR
         XdGTrDcdngk0Bz2ycAwuv69nOO3RCtDB7aUI88IQlzg4VPbfXh+TEJltj/Ue1nXzfeup
         nY5deyasBVM8m9xC12AwxFXgGljNB94MUOTtFQ9IO/4XGe9KXE7zzk37evkz7hGmtb1j
         L4mZ6BEa3g3LkNcVJ3YBM0SbahMYSC1WdWdex/q9vKRjVYvml/p4eUGzLtFoLOD7OrXB
         dFWw==
X-Forwarded-Encrypted: i=1; AJvYcCUA1iq5mPw+ZK7H0NSVCq/v4W0Jvpnn4mbYVE6nlNMZt3Ums9JWl59bFapPox8+eLGgBLwtbelVnGQaB9g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxXmKx4JWz98vZUIOV7mgbby5Ccm5zq7BLFmgvR4XRD4dueWC6
	I8N/RucpyJlKxkRlqn417Pc4x3GkwMoCs2oaymqrxRZj+O39qbZW
X-Gm-Gg: ASbGnct0PeHem2HeXPjXXRbJpMXypqo6yB/utJrJxmr/1dnTHIbnO+ZuGr9+61crjCg
	izqnLUzNCZrU7u53D6znMBe+cqSYxTjKzvrOEf8CxEGJqjl+yzqSu3Fn8Oo4rWvP8XQHP2Qzh0l
	7yXzcYq2dvlNMXh3TYdaJAsllEO9fWH30wirb8liJWyEYGS+2zHxsfiGe6yTUG0P+wyTQKzQ9mB
	wFbcWFnvJ2/52TX9NGqC9OA7AUTIl7rUQ6dNUDtSswQOnXI/bI4UQHBSpkyZTyAMl4sTIiJiTnG
	i7HZGScfXWzSkJ17o/ntQDu5LrllqIjeTMEhkiXx7Nz4HLZ53o6UI9fig87LO5H5vJ8fzjB+zUz
	M3oR6fq3uwDM=
X-Google-Smtp-Source: AGHT+IHY+DLkhIYJoATIkwPpqayFiV6JiUDNwAsSJY+JmpjOl0cyp9AjbTvp8qblHfgHVw9HZNU2uA==
X-Received: by 2002:a05:6a00:a82:b0:72f:f764:6269 with SMTP id d2e1a72fcca58-73035125686mr2578266b3a.12.1738733917481;
        Tue, 04 Feb 2025 21:38:37 -0800 (PST)
Received: from kic-machine.localdomain (122-117-151-175.hinet-ip.hinet.net. [122.117.151.175])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6424f8csm11608434b3a.44.2025.02.04.21.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 21:38:37 -0800 (PST)
From: Kuangyi Chiang <ki.chiang65@gmail.com>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ki.chiang65@gmail.com
Subject: [PATCH v4 0/1] xhci: Some improvement for Etron xHCI host
Date: Wed,  5 Feb 2025 13:37:49 +0800
Message-Id: <20250205053750.28251-1-ki.chiang65@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To prevent the xHCI driver from printing a "Transfer event TRB DMA
ptr not part of current TD" error message when an error is detected
while processing the last TRB of an isoc TD:
  xhci: Correctly handle last TRB of isoc TD on Etron xHCI host

---
Changes in v4:
- Rebase against Linux 6.14-rc1
- Link to v3: https://lore.kernel.org/all/20241202050135.13504-1-ki.chiang65@gmail.com

Changes in v3:
- Update subject and commit message
- Use error_mid_td instead of last_td_was_short to solve the problem, as suggested by Michal
- Link to v2: https://lore.kernel.org/all/20241028025337.6372-1-ki.chiang65@gmail.com

Changes in v2:
- Modify commit message
- Remove XHCI_NO_RESET_DEVICE/XHCI_NO_BREAK_CTRL_TD quirk flag
- Add XHCI_ETRON_HOST quirk flag, thanks for the suggestion by Michal
- Check device speed before invoking the workaround
- Add (xhci: Combine two if statements for Etron xHCI host)
- Add (xhci: Correct handling of one-TRB isoc TD on Etron xHCI host)
- Link to v1: https://lore.kernel.org/all/20240911051716.6572-4-ki.chiang65@gmail.com

Kuangyi Chiang (1):
  xhci: Correctly handle last TRB of isoc TD on Etron xHCI host

 drivers/usb/host/xhci-ring.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

-- 
2.25.1

