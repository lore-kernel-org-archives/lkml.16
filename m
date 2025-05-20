Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913212517AC
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747752082; cv=none; b=XDF01BfIzvZkxHlhAWr7Rolxc1See+Rl5EfCnSZnGuPWC/vV09Q+d9akFabzjItRWD6ZVqZX5RNTYb9R+fxvvp0AZiEBemMdSv/akHZIDxXVV/hgof0bLl+EyAdLgx378I4rz64gQ2aaMC5dxubeAt2i3EFkdpQmHIQrYFJ0L7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747752082; c=relaxed/simple;
	bh=qRybH5cw5MW+2tIr6+LlsfuFuUK8mFtVjjDVpaujrY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zy58Uoh5cRPYzKQ5GFLH6OzDymaTt4eZuHhg447KvRLWY7OH6EHa3OlYTlrOTlwvEkldJQ00zRW0mPg9yIkvdB98kEbQRqlSc44pufW1y4krvdO3ZMlQntXKcg1C+PuyJ1iWcBI7VrvcRIG6C9AD0/bYCKtVOf5uULUFFpVEVAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from trampoline.thunk.org (pool-173-48-111-173.bstnma.fios.verizon.net [173.48.111.173])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 54KEeOXq013125
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 10:40:25 -0400
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id B4B552E00DE; Tue, 20 May 2025 10:40:24 -0400 (EDT)
From: "Theodore Ts'o" <tytso@mit.edu>
To: Andreas Dilger <adilger.kernel@dilger.ca>, Arnd Bergmann <arnd@kernel.org>
Cc: "Theodore Ts'o" <tytso@mit.edu>, Arnd Bergmann <arnd@arndb.de>,
        Jan Kara <jack@suse.cz>, Zhang Yi <yi.zhang@huawei.com>,
        Ojaswin Mujoo <ojaswin@linux.ibm.com>,
        "Darrick J. Wong" <djwong@kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shida Zhang <zhangshida@kylinos.cn>, Baokun Li <libaokun1@huawei.com>,
        Jann Horn <jannh@google.com>, Brian Foster <bfoster@redhat.com>,
        linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ext4: avoid -Wformat-security warning
Date: Tue, 20 May 2025 10:40:10 -0400
Message-ID: <174775151764.432196.13613749014255693736.b4-ty@mit.edu>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250423164354.2780635-1-arnd@kernel.org>
References: <20250423164354.2780635-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 23 Apr 2025 18:43:49 +0200, Arnd Bergmann wrote:
> check_igot_inode() prints a variable string, which causes a harmless
> warning with 'make W=1':
> 
> fs/ext4/inode.c:4763:45: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
>  4763 |         ext4_error_inode(inode, function, line, 0, err_str);
> 
> Use a trivial "%s" format string instead.
> 
> [...]

Applied, thanks!

[1/1] ext4: avoid -Wformat-security warning
      commit: d612a07931e261c537978aad096e7340b687cd0c

Best regards,
-- 
Theodore Ts'o <tytso@mit.edu>
