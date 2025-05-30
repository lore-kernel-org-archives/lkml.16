Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1E4241684
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 18:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748629916; cv=none; b=ECokXKo389iyxN98ZBXfldjHziMT8VALgjmSW4D40lpgh1I4c2P3ZHH1vTqKEmvgOe4QfLK02PKw+ZklCzO5nTQ73QFZ+QPGQFLNgvS26sLgb46fh7rZLoAb2OCJN19u9/woBLkjcQWnIvZaIbbGL72OAHBPOf0Vhxa3sJDfGiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748629916; c=relaxed/simple;
	bh=hqCnIEKmCvYJi1+EHTC1ZSo1BupSZuo+JuBJWN8zMcI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f44bGYHqM9LBfsxyz6tgegbZnRqechgTyqwCqmQIR5bZUFACNcGud2dDQELkauolJXSKtBwGgi8CNUL2rwiKO9ovqIRlp3lOjXBEkWd0fq6vQP2f2QomUImU8Y3zXUOs20Xv1DtfQ5VVBJI9CSKQxSbhKg/4M9QF3lTKsxQq6is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=Q3fyXEzX; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="Q3fyXEzX"
Received: from fedora.intra.ispras.ru (unknown [10.10.165.16])
	by mail.ispras.ru (Postfix) with ESMTPSA id AF14940737D7;
	Fri, 30 May 2025 18:31:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru AF14940737D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1748629910;
	bh=B3qXNkFbAswOKirneD5Jj1fcogqx8AXyxFQGEq7IB5A=;
	h=From:To:Cc:Subject:Date:From;
	b=Q3fyXEzX3U8aLoqYT2QYT8GaTS5hr6/rDjap504s5w64q6ec66x37CwpjYoy+Ptvi
	 ng2N5ZZZEluJDyzkN/S3l7+Cxr1jr7gBgdwpRbh3ntg//lH96BoUO1ywKmTdICxim2
	 /fcACrdumtrYp841kPRKAoVYBbdn1VG02O79OE2o=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Richard Weinberger <richard@nod.at>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Wang Yong <wang.yong12@zte.com.cn>,
	Lu Zhongjun <lu.zhongjun@zte.com.cn>,
	Yang Tao <yang.tao172@zte.com.cn>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH resend 0/2] jffs2: fix a couple of uninit value errors
Date: Fri, 30 May 2025 21:31:37 +0300
Message-ID: <20250530183141.222155-1-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Link to initially sent version reviewed by Zhihao Cheng:
https://lore.kernel.org/linux-mtd/20241117184412.366672-1-pchelkin@ispras.ru/T/#u

There is a couple of places where uninit value is touched on error
handling paths in jffs2 code. Fix them.

Fedor Pchelkin (2):
  jffs2: initialize filesystem-private inode info in ->alloc_inode
    callback
  jffs2: initialize inocache earlier

 fs/jffs2/fs.c       | 2 --
 fs/jffs2/os-linux.h | 1 +
 fs/jffs2/super.c    | 3 ++-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.49.0

