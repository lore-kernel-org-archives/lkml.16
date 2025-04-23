Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAF528E5F5
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 18:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745432473; cv=none; b=U+MysD3Y/WArYgKQo300n3TFnd9Rq4WKg6B6aluv7gKYY8pabHYA/Er7ZgyFRX/6xnhPPAAI4iZ+V3PiOHxqi+gr64FsRyysbUvnqpR8Ir4SGcbO97cdyZrwbyqKnBx7bTDHSHjRitVYBaC0tY/BQj2B3XDthx1/3jVgmTdjyN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745432473; c=relaxed/simple;
	bh=Fjq3beIRfZMl+TYLgKDIgBaBVl4VEGbQn6fBRLomcW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dnjwi2zGq5PPsAIBdgrJzGKqnYMxNn5ImhKbWbXb2cEAuVxPb35Nqe2o/VHT2aDnlr3RlR0hgHuziNUxYfB5rBgts3sgd81QjjqlhOTh3Tm0OTU/zbtjQMcZC5TXoTX50uR0yTAHVvO7ye10gSknLWvLqCMXPShGOr9xzZJovJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from trampoline.thunk.org (pool-173-48-82-148.bstnma.fios.verizon.net [173.48.82.148])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 53NIKd71005123
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 14:20:40 -0400
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 530D02E00EB; Wed, 23 Apr 2025 14:20:39 -0400 (EDT)
From: "Theodore Ts'o" <tytso@mit.edu>
To: linux-ext4@vger.kernel.org, Ojaswin Mujoo <ojaswin@linux.ibm.com>
Cc: "Theodore Ts'o" <tytso@mit.edu>, Jan Kara <jack@suse.cz>,
        Baokun Li <libaokun1@huawei.com>,
        Ritesh Harjani <ritesh.list@gmail.com>, Zhang Yi <yi.zhang@huawei.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ext4: Make block validity check resistent to sb bh corruption
Date: Wed, 23 Apr 2025 14:20:33 -0400
Message-ID: <174543076504.1215499.7893481546772162865.b4-ty@mit.edu>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <0c06bc9ebfcd6ccfed84a36e79147bf45ff5adc1.1743142920.git.ojaswin@linux.ibm.com>
References: <0c06bc9ebfcd6ccfed84a36e79147bf45ff5adc1.1743142920.git.ojaswin@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 28 Mar 2025 11:54:52 +0530, Ojaswin Mujoo wrote:
> Block validity checks need to be skipped in case they are called
> for journal blocks since they are part of system's protected
> zone.
> 
> Currently, this is done by checking inode->ino against
> sbi->s_es->s_journal_inum, which is a direct read from the ext4 sb
> buffer head. If someone modifies this underneath us then the
> s_journal_inum field might get corrupted. To prevent against this,
> change the check to directly compare the inode with journal->j_inode.
> 
> [...]

Applied, thanks!

[1/1] ext4: Make block validity check resistent to sb bh corruption
      commit: ccad447a3d331a239477c281533bacb585b54a98

(Apologies for sending this late; I've been dealing with a family
medical emergency.  In any case, the patch landed in v6.16-rc2.)

Best regards,
-- 
Theodore Ts'o <tytso@mit.edu>
